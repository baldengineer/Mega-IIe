![3d render of rev2 power supply board](/images/gd-ps-board-render-rev2jpg)

Four-rail SMPS for the Mega IIe. 

* Always-on 5V supply for the RP2040s and USB
* Switchable 5V for MEGA and other 5V Logic
* Switchable +12/-12V for disk drive and slot

Each 5V supply is designed for >1 Amp. The 12V supply was intended to provide at least 1 Amp. In rev1 testing it *could* provide 1 amp, but only for about 2 minutes. It's steady state max was around 750 mA. 

The -12V supply can only provide a few hundred milliamps. However, in my testing other the analog video circuit used it. At most, it would draw 50 mA but usually sat around 10 mA.

The rev1 design suffered from severe conducted ripple from the 5V switchers. So the rev2 re-design is a 4-layer board with significant ground shielding of input and output rails.

