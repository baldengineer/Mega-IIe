#ifndef mcp4541_h
#define mcp4541_h

#include "pico/stdlib.h"
#include "hardware/i2c.h"
#include "pico/binary_info.h"

// Command definitions
#define MCP4541_CMD_WRITE	 0x00
#define MCP4541_CMD_READ	 0x0C
#define MCP4541_CMD_INC		 0x04
#define MCP4541_CMD_DEC		 0x08
#define MCP4541_CMD_EE_WRITE 0x20
#define MCP4541_CMD_EE_READ  0x2C

#define MCP4541_ADDRESS 0x2E
#define MCP4541_MIN_STEPS 0
#define MCP4541_MAX_STEPS 128
#define MCP4541_EEPROM_WAIT 2500000

// RP2040 I2C Settings
#define I2C_AUDIO_SPEED   100e3      // 100 kilohertz



uint16_t map(uint16_t x, uint16_t in_min, uint16_t in_max, uint16_t out_min, uint16_t out_max);
int write_mcp4541_wiper(uint16_t volume_level, bool update_eeprom);
int write_mcp4541_eeprom(uint16_t volume_level);
int read_mcp4541_eeprom();
int read_mcp4541_wiper();
void setup_i2c_audio();
uint16_t map_mcp_to_vol(uint16_t steps);
uint16_t map_vol_to_mcp(uint16_t percent);


#endif // for the whole file