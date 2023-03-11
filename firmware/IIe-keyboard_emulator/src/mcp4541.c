#include "mcp4541.h"
#include <stdio.h>
#include "pico/stdlib.h"
#include "constants.h"


void setup_i2c_audio() {
    i2c_init(I2C_AUDIO_INSTANCE, I2C_AUDIO_SPEED); 
    gpio_set_function(I2C_AUDIO_SDA_PIN, GPIO_FUNC_I2C); 
    gpio_set_function(I2C_AUDIO_SCL_PIN, GPIO_FUNC_I2C); 
    gpio_pull_up(I2C_AUDIO_SDA_PIN);
    gpio_pull_up(I2C_AUDIO_SCL_PIN);
    // Make the I2C pins available to picotool
    bi_decl(bi_2pins_with_func(I2C_AUDIO_SDA_PIN, I2C_AUDIO_SCL_PIN, GPIO_FUNC_I2C));
    return;
}

int read_mcp4541_wiper() {
    int ret=-1;
    uint8_t mcp_cmd[1] = {MCP4541_CMD_READ};
    uint8_t rxdata[2];
    // set address for read
    ret = i2c_write_blocking(I2C_AUDIO_INSTANCE, MCP4541_ADDRESS, mcp_cmd, 1, false);
    if (ret <= 0) 
        return ret;
    // read last accessed address (0x0 in this case)
    ret = i2c_read_blocking(I2C_AUDIO_INSTANCE, MCP4541_ADDRESS, rxdata, 2, false);
//    printf("ret=%d, rxdata[1]=%d, rxdata[0]=%d\n", ret, rxdata[1],rxdata[0]); 
    if (ret >= 0)
            return bound_mcp4541_value((rxdata[0]<<8) | rxdata[1]);
        else
            return ret;
}

inline int bound_mcp4541_value(int incoming) {
    int outgoing = incoming;
    if (incoming > MCP4541_MAX_STEPS)
        outgoing = MCP4541_MAX_STEPS;
    if (incoming < MCP4541_MIN_STEPS)
        outgoing = MCP4541_MIN_STEPS;
   // printf("MAX_STEPS:[%d], MIN_STEPS:[%d], incoming:[%d], outgoing:[%d]\n", MCP4541_MAX_STEPS, MCP4541_MIN_STEPS, incoming, outgoing);
    return outgoing;
}

int read_mcp4541_eeprom() {
    int ret=-1;
    uint8_t rxdata[2];
    uint8_t mcp_cmd[1] = {MCP4541_CMD_EE_READ};
    ret = i2c_write_blocking(I2C_AUDIO_INSTANCE, MCP4541_ADDRESS, mcp_cmd, 1, false);
    if (ret <= 0) 
        return ret;

    ret = i2c_read_blocking(I2C_AUDIO_INSTANCE, MCP4541_ADDRESS, rxdata, 2, false);
    printf("ret=%d, rxdata[1]=%d, rxdata[0]=%d\n", ret, rxdata[1],rxdata[0]); 
    if (ret >= 0)
            return bound_mcp4541_value((rxdata[0]<<8) | rxdata[1]);
        else
            return ret;   
}

int write_mcp4541_eeprom(uint16_t volume_level) {
    int ret=-1;
    uint8_t write_buffer[2];
    int previous_eeprom = read_mcp4541_eeprom();

    volume_level = bound_mcp4541_value(volume_level);
    
    if (previous_eeprom < 0)
        return previous_eeprom; // error occured

    if (previous_eeprom != volume_level) {
        printf("Writing [%d] to MCP4541 EEPROM\n", volume_level);
        write_buffer[0] = ((volume_level >> 8 & 0x01) | 0x20);
        write_buffer[1] = (volume_level &  0xFF);
        ret = i2c_write_blocking(I2C_AUDIO_INSTANCE, MCP4541_ADDRESS, write_buffer, 2, false);
        return ret;
    } 

    return volume_level;
}

int write_mcp4541_wiper(uint16_t volume_level, bool update_eeprom) {
    int ret=-1;
    // if the read fails, the mcp isn't responding

    volume_level = bound_mcp4541_value(volume_level);

    if (read_mcp4541_wiper() > 0) {
        printf("Updating Wiper to [%d]\n", volume_level);
        uint8_t write_buffer[2];
        write_buffer[0] = ((volume_level >> 8 & 0x01) | MCP4541_CMD_WRITE); // get MSB of data and set CMD
        write_buffer[1] = (volume_level &  0xFF); // get rest of data
        ret = i2c_write_blocking(I2C_AUDIO_INSTANCE, MCP4541_ADDRESS, write_buffer, 2, false);
        if (ret < 0)
            return ret;
        
        if (update_eeprom) {
            printf("Updating EEPROM.\n");
            ret = write_mcp4541_eeprom(volume_level);
            if (ret < 0)
                return ret;
        }
    } else {
        return ret;
    }
    return ret;
}

uint16_t map(uint16_t x, uint16_t in_min, uint16_t in_max, uint16_t out_min, uint16_t out_max) {
    // borrowed from Arduino AVR Core: https://github.com/arduino/ArduinoCore-avr/blob/master/cores/arduino/WMath.cpp
    return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

uint16_t map_vol_to_mcp(uint16_t percent) {
    if (percent >= 100)
        percent = 100;
    
    const uint16_t in_min = 0; 
    const uint16_t in_max = 100;
    const uint16_t out_min = 0;
    const uint16_t out_max = MCP4541_MAX_STEPS;
    
    return map(percent, in_min, in_max, out_min, out_max);
}

uint16_t map_mcp_to_vol(uint16_t steps) {
    if (steps >= MCP4541_MAX_STEPS)
        steps = MCP4541_MAX_STEPS;
    
    const uint16_t in_min = 0; 
    const uint16_t in_max = MCP4541_MAX_STEPS;
    const uint16_t out_min = 0;
    const uint16_t out_max = 100;
    
    return map(steps, in_min, in_max, out_min, out_max);
}