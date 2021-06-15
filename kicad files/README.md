## Golden Delicious KiCad Files

The Proto PCBs are boards to prototype an IIe from the IIgs ASICs. Eventually, these will be condensed to a single board.

### gd 6502 proto pcb
6502 board is designed for a WDC W65c02 with a QFP footprint. It has a single socket for an EPROM and is wired like the IIc's EEPROM. The `Address` and `Data` headers are meant to connect to the MEGA-II proto board. Other control signals are broken out to other headers.

Runs off of 5V.

### gd MegaII proto pcb
This board is the center piece. It contains the MEGA-II and has all of its signals broken out to multiple headers. 

It connects to both the VGC and 6502 boards. The VGC connects with a 40-pin cable, like an IDE cable. The 6502 connects with a couple of ribbon cables.

Runs off of 5V.

### gd VGC proto pcb
First board to be finished and the one with the least use for the final handheld. The VGC converts the RGB bitstream from the MEGA-II into an analog signal and then into NTSC.

The VGC also generates the 14 MHz clock from a 28 MHz oscilliator. (It is not clear yet which clocks the MEGA-II generates and which the VGC does.)

Runs off of +5V, -5V, and +12V. The 12V and -5V are used by the NTSC generation circuit.

### KiCad_Symbols
Late in the board creation process, I tried to consoliate the symbols into one location. These symbols and these boards are based off of the ROM3 IIgs schematic in [Bit Preserve](https://github.com/baldengineer/bit-preserve).

### MegaII Breakout
Very old breakout board. Created that and realized it wasn't very useful by itself.

## Live Stream
This entire project has been livestreamed on [Bald Engineer Live](https://twitch.tv/baldengineer).