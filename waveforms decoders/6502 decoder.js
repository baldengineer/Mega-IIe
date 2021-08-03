// 6502 decoder (for Apple II)
// For Digilent WaveForms (Digital Discovery)
// ROMEN needs to be Digital IO 28
// using ROMEN right now, should be using a 6502 signal, will update later

// Create a custom decoder

// This code goes into the "decoder" tab
c = rgData.length

for(var i = 0; i < c; i++){
   // take 4 least significant bits
   rgValue[i] = (rgData[i] & 0xFF0000) >> 16;
   // set flag other than zero for valid data
   // using ROMEN right now, should be using a 6502 signal
    rgFlag[i] = ((rgData[i] >> 28) & 0x1) + 1; // 0 means ROMEN is asserted, so add 1 so that decoder will run
}

// This code goes into the "Value2Text" tab
function Value2Text(flag, value) {
    if (flag == 0) {
        switch(value) {
             // op codes with address modes
            case 0x69: return "ADC (Imd)";
            case 0x65: return "ADC (Zero)";
            case 0x75: return "ADC (ZeroX)";
            case 0x6D: return "ADC (Abs)";
            case 0x7D: return "ADC (AbsX)";
            case 0x79: return "ADC (AbsY)";
            case 0x61: return "ADC (IndX)";
            case 0x71: return "ADC (IndY)";
            case 0x29: return "AND (Imd)";
            case 0x25: return "AND (Zero)";
            case 0x35: return "AND (ZeroX)";
            case 0x2D: return "AND (Abs)";
            case 0x3D: return "AND (AbsX)";
            case 0x39: return "AND (AbsY)";
            case 0x21: return "AND (IndX)";
            case 0x31: return "AND (IndY)";
            case 0x0A: return "ASL (Acc)";
            case 0x06: return "ASL (Zero)";
            case 0x16: return "ASL (ZeroX)";
            case 0x0E: return "ASL (Abs)";
            case 0x1E: return "ASL (AbsX)";
            case 0x24: return "BIT (Zero)";
            case 0x2C: return "BIT (Abs)";
            case 0xC9: return "CMP (Imd)";
            case 0xC5: return "CMP (Zero)";
            case 0xD5: return "CMP (ZeroX)";
            case 0xCD: return "CMP (Abs)";
            case 0xDD: return "CMP (AbsX)";
            case 0xD9: return "CMP (AbsY)";
            case 0xC1: return "CMP (IndX)";
            case 0xD1: return "CMP (IndY)";
            case 0xE0: return "CPX (Imd)";
            case 0xE4: return "CPX (Zero)";
            case 0xEC: return "CPX (Abs)";
            case 0xC0: return "CPY (Imd)";
            case 0xC4: return "CPY (Zero)";
            case 0xCC: return "CPY (Abs)";
            case 0xC6: return "DEC (Zero)";
            case 0xD6: return "DEC (ZeroX)";
            case 0xCE: return "DEC (Abs)";
            case 0xDE: return "DEC (AbsX)";
            case 0x49: return "EOR (Imd)";
            case 0x45: return "EOR (Zero)";
            case 0x55: return "EOR (ZeroX)";
            case 0x4D: return "EOR (Abs)";
            case 0x5D: return "EOR (AbsX)";
            case 0x59: return "EOR (AbsY)";
            case 0x41: return "EOR (IndX)";
            case 0x51: return "EOR (IndY)";
            case 0xE6: return "INC (Zero)";
            case 0xF6: return "INC (ZeroX)";
            case 0xEE: return "INC (Abs)";
            case 0xFE: return "INC (AbsX)";
            case 0x4C: return "JMP (Abs)";
            case 0x6C: return "JMP (Ind)";
            case 0x20: return "JSR (Abs)";
            case 0xA9: return "LDA (Imd)";
            case 0xA5: return "LDA (Zero)";
            case 0xB5: return "LDA (ZeroX)";
            case 0xAD: return "LDA (Abs)";
            case 0xBD: return "LDA (AbsX)";
            case 0xB9: return "LDA (AbsY)";
            case 0xA1: return "LDA (IndX)";
            case 0xB1: return "LDA (IndY)";
            case 0xA2: return "LDX (Imd)";
            case 0xA6: return "LDX (Zero)";
            case 0xB6: return "LDX (ZeroY)";
            case 0xAE: return "LDX (Abs)";
            case 0xBE: return "LDX (AbsY)";
            case 0xA0: return "LDY (Imd)";
            case 0xA4: return "LDY (Zero)";
            case 0xB4: return "LDY (ZeroX)";
            case 0xAC: return "LDY (Abs)";
            case 0xBC: return "LDY (AbsX)";
            case 0x4A: return "LSR (Acc)";
            case 0x46: return "LSR (Zero)";
            case 0x56: return "LSR (ZeroX)";
            case 0x4E: return "LSR (Abs)";
            case 0x5E: return "LSR (AbsX)";
            case 0x09: return "ORA (Imd)";
            case 0x05: return "ORA (Zero)";
            case 0x15: return "ORA (ZeroX)";
            case 0x0D: return "ORA (Abs)";
            case 0x1D: return "ORA (AbsX)";
            case 0x19: return "ORA (AbsY)";
            case 0x01: return "ORA (IndX)";
            case 0x11: return "ORA (IndY)";
            case 0x2A: return "ROL (Acc)";
            case 0x26: return "ROL (Zero)";
            case 0x36: return "ROL (ZeroX)";
            case 0x2E: return "ROL (Abs)";
            case 0x3E: return "ROL (AbsX)";
            case 0x6A: return "ROR (Acc)";
            case 0x66: return "ROR (Zero)";
            case 0x76: return "ROR (ZeroX)";
            case 0x6E: return "ROR (Abs)";
            case 0x7E: return "ROR (AbsX)";
            case 0x40: return "RTI (Imp)";
            case 0x60: return "RTS (Imp)";
            case 0xE9: return "SBC (Imd)";
            case 0xE5: return "SBC (Zero)";
            case 0xF5: return "SBC (ZeroX)";
            case 0xED: return "SBC (Abs)";
            case 0xFD: return "SBC (AbsX)";
            case 0xF9: return "SBC (AbsY)";
            case 0xE1: return "SBC (IndX)";
            case 0xF1: return "SBC (IndY)";
            case 0x85: return "STA (Zero)";
            case 0x95: return "STA (ZeroX)";
            case 0x8D: return "STA (Abs)";
            case 0x9D: return "STA (AbsX)";
            case 0x99: return "STA (AbsY)";
            case 0x81: return "STA (IndX)";
            case 0x91: return "STA (IndY)";
            case 0x86: return "STX (Zero)";
            case 0x96: return "STX (ZeroY)";
            case 0x8E: return "STX (Abs)";
            case 0x84: return "STY (Zero)";
            case 0x94: return "STY (ZeroX)";
            case 0x8C: return "STY (Abs)";
            case 0x00: return "BRK (Imp)";
            case 0xEA: return "NOP (Imp)";

            //op codes without addresses
            case 0x10: return "BPL";
            case 0x30: return "BMI";
            case 0x50: return "BVC";
            case 0x70: return "BVS";
            case 0x90: return "BCC";
            case 0xB0: return "BCS";
            case 0xD0: return "BNE";
            case 0xF0: return "BEQ";
            case 0x18: return "CLC";
            case 0x38: return "SEC";
            case 0x58: return "CLI";
            case 0x78: return "SEI";
            case 0xB8: return "CLV";
            case 0xD8: return "CLD";
            case 0xF8: return "SED";
            case 0xAA: return "TAX";
            case 0x8A: return "TXA";
            case 0xCA: return "DEX";
            case 0xE8: return "INX";
            case 0xA8: return "TAY";
            case 0x98: return "TYA";
            case 0x88: return "DEY";
            case 0xC8: return "INY";
            case 0x9A: return "TXS";
            case 0xBA: return "TSX";
            case 0x48: return "PHA";
            case 0x68: return "PLA";
            case 0x08: return "PHP";
            case 0x28: return "PLP";
            default: return ("0x" + value.toString(16));
        }
    }
//    return ("0x" + value.toString(16));
}