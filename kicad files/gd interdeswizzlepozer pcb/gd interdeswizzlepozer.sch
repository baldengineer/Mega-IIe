EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "GD Interdeswizzlepozer"
Date "2021-10-24"
Rev "1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x16_Odd_Even J8
U 1 1 61386281
P 3800 5200
F 0 "J8" H 3800 6150 50  0000 L CNN
F 1 "Addr_Main_Data" H 3600 6050 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x16_P2.54mm_Vertical" H 3800 5200 50  0001 C CNN
F 3 "~" H 3800 5200 50  0001 C CNN
	1    3800 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4500 4350 4500
Wire Wire Line
	4100 5000 4350 5000
Wire Wire Line
	4100 5500 4350 5500
Wire Wire Line
	4100 6000 4350 6000
Wire Wire Line
	3600 6000 3350 6000
Wire Wire Line
	3600 5500 3350 5500
Wire Wire Line
	3600 5000 3350 5000
Wire Wire Line
	3600 4500 3350 4500
Wire Wire Line
	4100 4600 4300 4600
Wire Wire Line
	3600 4600 3400 4600
Wire Wire Line
	4100 4700 4300 4700
Wire Wire Line
	3600 4700 3400 4700
Wire Wire Line
	4100 4800 4300 4800
Wire Wire Line
	3600 4800 3400 4800
Wire Wire Line
	4100 4900 4300 4900
Wire Wire Line
	3600 4900 3400 4900
Text Label 4300 4600 2    50   ~ 0
BA0
Text Label 3400 4600 0    50   ~ 0
BA1
Text Label 4300 4700 2    50   ~ 0
BA2
Text Label 3400 4700 0    50   ~ 0
BA3
Text Label 4300 4800 2    50   ~ 0
BA4
Text Label 3400 4800 0    50   ~ 0
BA5
Text Label 4300 4900 2    50   ~ 0
BA6
Text Label 3400 4900 0    50   ~ 0
BA7
Wire Wire Line
	4100 5100 4300 5100
Wire Wire Line
	3600 5100 3400 5100
Wire Wire Line
	4100 5200 4300 5200
Wire Wire Line
	3600 5200 3400 5200
Wire Wire Line
	4100 5300 4300 5300
Wire Wire Line
	3600 5300 3400 5300
Wire Wire Line
	4100 5400 4300 5400
Wire Wire Line
	3600 5400 3400 5400
Text Label 4300 5100 2    50   ~ 0
BA8
Text Label 3400 5100 0    50   ~ 0
BA9
Text Label 4300 5200 2    50   ~ 0
BA10
Text Label 3400 5200 0    50   ~ 0
BA11
Text Label 4300 5300 2    50   ~ 0
BA12
Text Label 3400 5300 0    50   ~ 0
BA13
Text Label 4300 5400 2    50   ~ 0
BA14
Text Label 3400 5400 0    50   ~ 0
BA15
Text Label 4300 5600 2    50   ~ 0
MD0
Text Label 3400 5600 0    50   ~ 0
MD1
Text Label 4300 5700 2    50   ~ 0
MD2
Text Label 3400 5800 0    50   ~ 0
MD5
Text Label 3400 5900 0    50   ~ 0
MD7
Text Label 4300 5800 2    50   ~ 0
MD4
Wire Wire Line
	4100 5800 4300 5800
Wire Wire Line
	3600 5800 3400 5800
Wire Wire Line
	4100 5900 4300 5900
Wire Wire Line
	3600 5900 3400 5900
Wire Wire Line
	4300 5600 4100 5600
Wire Wire Line
	3400 5600 3600 5600
Wire Wire Line
	4300 5700 4100 5700
Text Label 4350 4500 2    50   ~ 0
GND
Text Label 4350 5000 2    50   ~ 0
GND
Text Label 4350 5500 2    50   ~ 0
GND
Text Label 4350 6000 2    50   ~ 0
GND
Text Label 3350 6000 0    50   ~ 0
GND
Text Label 3350 5500 0    50   ~ 0
GND
Text Label 3350 5000 0    50   ~ 0
GND
Text Label 3350 4500 0    50   ~ 0
GND
Text Label 4300 5900 2    50   ~ 0
MD6
Wire Wire Line
	3400 5700 3600 5700
Text Label 3400 5700 0    50   ~ 0
MD3
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J10
U 1 1 613862C7
P 4000 3750
F 0 "J10" H 4050 4167 50  0000 C CNN
F 1 "CTRL1" H 4050 4076 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x05_P2.54mm_Vertical" H 4000 3750 50  0001 C CNN
F 3 "~" H 4000 3750 50  0001 C CNN
	1    4000 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 3850 4600 3850
Text Label 4600 3850 2    50   ~ 0
PH0
Wire Wire Line
	4300 3750 4600 3750
Text Label 4600 3750 2    50   ~ 0
Q3
Wire Wire Line
	4300 3650 4600 3650
Text Label 4600 3650 2    50   ~ 0
CREF
Wire Wire Line
	4300 3550 4600 3550
Text Label 4600 3550 2    50   ~ 0
7M
Wire Wire Line
	3800 3750 3500 3750
Wire Wire Line
	3800 3650 3500 3650
Wire Wire Line
	3800 3550 3500 3550
Text Label 3500 3550 0    50   ~ 0
~IRQ
Text Label 3500 3650 0    50   ~ 0
~RESET
Text Label 3500 3750 0    50   ~ 0
RW
Wire Wire Line
	4300 3950 4550 3950
Text Label 4550 3950 2    50   ~ 0
GND
Wire Wire Line
	3800 3950 3550 3950
Text Label 3550 3950 0    50   ~ 0
GND
Wire Wire Line
	3500 3850 3800 3850
Text Label 3500 3850 0    50   ~ 0
~INH
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J6
U 1 1 6138630A
P 4050 2750
F 0 "J6" H 4100 3100 50  0000 C CNN
F 1 "Pwr" H 4100 3000 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x04_P2.54mm_Vertical" H 4050 2750 50  0001 C CNN
F 3 "~" H 4050 2750 50  0001 C CNN
	1    4050 2750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J15
U 1 1 6139BD8B
P 5800 3750
F 0 "J15" H 5850 4167 50  0000 C CNN
F 1 "CTRL1" H 5850 4076 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x05_P2.54mm_Vertical" H 5800 3750 50  0001 C CNN
F 3 "~" H 5800 3750 50  0001 C CNN
	1    5800 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3850 6400 3850
Text Label 6400 3850 2    50   ~ 0
PH0
Wire Wire Line
	6100 3750 6400 3750
Text Label 6400 3750 2    50   ~ 0
Q3
Wire Wire Line
	6100 3650 6400 3650
Text Label 6400 3650 2    50   ~ 0
CREF
Wire Wire Line
	6100 3550 6400 3550
Text Label 6400 3550 2    50   ~ 0
7M
Wire Wire Line
	5600 3750 5300 3750
Wire Wire Line
	5600 3650 5300 3650
Wire Wire Line
	5600 3550 5300 3550
Text Label 5300 3550 0    50   ~ 0
~IRQ
Text Label 5300 3650 0    50   ~ 0
~RESET
Text Label 5300 3750 0    50   ~ 0
RW
Wire Wire Line
	6100 3950 6350 3950
Text Label 6350 3950 2    50   ~ 0
GND
Wire Wire Line
	5600 3950 5350 3950
Text Label 5350 3950 0    50   ~ 0
GND
Wire Wire Line
	5300 3850 5600 3850
Text Label 5300 3850 0    50   ~ 0
~INH
Wire Wire Line
	5850 7000 6100 7000
Wire Wire Line
	6300 6800 5850 6800
Wire Wire Line
	6300 6900 5850 6900
Text Label 6300 6800 2    50   ~ 0
KSEL1
Text Label 6300 6900 2    50   ~ 0
KSEL2
Wire Wire Line
	5350 7000 5100 7000
Text Label 6300 6600 2    50   ~ 0
C060-67
Wire Wire Line
	6300 6600 5850 6600
Text Label 5000 6800 0    50   ~ 0
~DMA
Wire Wire Line
	5350 6800 5000 6800
Text Label 6100 7000 2    50   ~ 0
GND
Text Label 5100 7000 0    50   ~ 0
GND
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J18
U 1 1 613C36F2
P 5550 6800
F 0 "J18" H 5600 7217 50  0000 C CNN
F 1 "CTRL2" H 5600 7126 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x05_P2.54mm_Vertical" H 5550 6800 50  0001 C CNN
F 3 "~" H 5550 6800 50  0001 C CNN
	1    5550 6800
	1    0    0    -1  
$EndComp
Text Label 5000 6700 0    50   ~ 0
~NMI
Text Label 5000 6600 0    50   ~ 0
~RDY
Wire Wire Line
	5350 6700 5000 6700
Wire Wire Line
	5350 6600 5000 6600
Wire Wire Line
	6300 6700 5850 6700
Text Label 6300 6700 2    50   ~ 0
KSEL0
Wire Wire Line
	5000 6900 5350 6900
Text Label 5000 6900 0    50   ~ 0
PDLTRIG
$Comp
L Connector_Generic:Conn_02x16_Odd_Even J24
U 1 1 613F00C3
P 5900 5200
F 0 "J24" H 5900 6150 50  0000 L CNN
F 1 "Addr_Main_Data" H 5700 6050 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x16_P2.54mm_Vertical" H 5900 5200 50  0001 C CNN
F 3 "~" H 5900 5200 50  0001 C CNN
	1    5900 5200
	-1   0    0    1   
$EndComp
Wire Wire Line
	6100 4400 6350 4400
Wire Wire Line
	6100 4900 6350 4900
Wire Wire Line
	6100 5400 6350 5400
Wire Wire Line
	6100 5900 6350 5900
Wire Wire Line
	5600 5900 5350 5900
Wire Wire Line
	5600 5400 5350 5400
Wire Wire Line
	5600 4900 5350 4900
Wire Wire Line
	5600 4400 5350 4400
Wire Wire Line
	6100 4500 6300 4500
Wire Wire Line
	5600 4500 5400 4500
Wire Wire Line
	6100 4600 6300 4600
Wire Wire Line
	5600 4600 5400 4600
Wire Wire Line
	6100 4700 6300 4700
Wire Wire Line
	5600 4700 5400 4700
Wire Wire Line
	6100 4800 6300 4800
Wire Wire Line
	5600 4800 5400 4800
Text Label 6300 4500 2    50   ~ 0
BA0
Text Label 5400 4500 0    50   ~ 0
BA1
Text Label 6300 4600 2    50   ~ 0
BA2
Text Label 5400 4600 0    50   ~ 0
BA3
Text Label 6300 4700 2    50   ~ 0
BA4
Text Label 5400 4700 0    50   ~ 0
BA5
Text Label 6300 4800 2    50   ~ 0
BA6
Text Label 5400 4800 0    50   ~ 0
BA7
Wire Wire Line
	6100 5000 6300 5000
Wire Wire Line
	5600 5000 5400 5000
Wire Wire Line
	6100 5100 6300 5100
Wire Wire Line
	5600 5100 5400 5100
Wire Wire Line
	6100 5200 6300 5200
Wire Wire Line
	5600 5200 5400 5200
Wire Wire Line
	6100 5300 6300 5300
Wire Wire Line
	5600 5300 5400 5300
Text Label 6300 5000 2    50   ~ 0
BA8
Text Label 5400 5000 0    50   ~ 0
BA9
Text Label 6300 5100 2    50   ~ 0
BA10
Text Label 5400 5100 0    50   ~ 0
BA11
Text Label 6300 5200 2    50   ~ 0
BA12
Text Label 5400 5200 0    50   ~ 0
BA13
Text Label 6300 5300 2    50   ~ 0
BA14
Text Label 5400 5300 0    50   ~ 0
BA15
Text Label 6300 5500 2    50   ~ 0
MD0
Text Label 5400 5500 0    50   ~ 0
MD1
Text Label 6300 5600 2    50   ~ 0
MD2
Text Label 5400 5700 0    50   ~ 0
MD5
Text Label 5400 5800 0    50   ~ 0
MD7
Text Label 6300 5700 2    50   ~ 0
MD4
Wire Wire Line
	6100 5700 6300 5700
Wire Wire Line
	5600 5700 5400 5700
Wire Wire Line
	6100 5800 6300 5800
Wire Wire Line
	5600 5800 5400 5800
Wire Wire Line
	6300 5500 6100 5500
Wire Wire Line
	5400 5500 5600 5500
Wire Wire Line
	6300 5600 6100 5600
Text Label 6350 4400 2    50   ~ 0
GND
Text Label 6350 4900 2    50   ~ 0
GND
Text Label 6350 5400 2    50   ~ 0
GND
Text Label 6350 5900 2    50   ~ 0
GND
Text Label 5350 5900 0    50   ~ 0
GND
Text Label 5350 5400 0    50   ~ 0
GND
Text Label 5350 4900 0    50   ~ 0
GND
Text Label 5350 4400 0    50   ~ 0
GND
Text Label 6300 5800 2    50   ~ 0
MD6
Wire Wire Line
	5400 5600 5600 5600
Text Label 5400 5600 0    50   ~ 0
MD3
Wire Wire Line
	4250 7000 4500 7000
Wire Wire Line
	4700 6800 4250 6800
Wire Wire Line
	4700 6900 4250 6900
Text Label 4700 6800 2    50   ~ 0
KSEL1
Text Label 4700 6900 2    50   ~ 0
KSEL2
Wire Wire Line
	3750 7000 3500 7000
Text Label 4700 6600 2    50   ~ 0
C060-67
Wire Wire Line
	4700 6600 4250 6600
Text Label 3400 6800 0    50   ~ 0
~DMA
Wire Wire Line
	3750 6800 3400 6800
Text Label 4500 7000 2    50   ~ 0
GND
Text Label 3500 7000 0    50   ~ 0
GND
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J23
U 1 1 613F0136
P 3950 6800
F 0 "J23" H 4000 7217 50  0000 C CNN
F 1 "CTRL2" H 4000 7126 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x05_P2.54mm_Vertical" H 3950 6800 50  0001 C CNN
F 3 "~" H 3950 6800 50  0001 C CNN
	1    3950 6800
	1    0    0    -1  
$EndComp
Text Label 3400 6700 0    50   ~ 0
~NMI
Text Label 3400 6600 0    50   ~ 0
~RDY
Wire Wire Line
	3750 6700 3400 6700
Wire Wire Line
	3750 6600 3400 6600
Wire Wire Line
	4700 6700 4250 6700
Text Label 4700 6700 2    50   ~ 0
KSEL0
Wire Wire Line
	3400 6900 3750 6900
Text Label 3400 6900 0    50   ~ 0
PDLTRIG
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J22
U 1 1 613F014C
P 6000 2700
F 0 "J22" H 6050 3050 50  0000 C CNN
F 1 "Pwr" H 6050 2950 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x04_P2.54mm_Vertical" H 6000 2700 50  0001 C CNN
F 3 "~" H 6000 2700 50  0001 C CNN
	1    6000 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 2950 3850 2950
Wire Wire Line
	3600 2850 3850 2850
Wire Wire Line
	3600 2750 3850 2750
$Comp
L power:+12V #PWR?
U 1 1 61903CA6
P 3600 2850
F 0 "#PWR?" H 3600 2700 50  0001 C CNN
F 1 "+12V" V 3615 2978 50  0000 L CNN
F 2 "" H 3600 2850 50  0001 C CNN
F 3 "" H 3600 2850 50  0001 C CNN
	1    3600 2850
	0    -1   -1   0   
$EndComp
Text Label 3600 2650 0    50   ~ 0
GND
$Comp
L power:+5V #PWR?
U 1 1 61903CAD
P 3600 2750
F 0 "#PWR?" H 3600 2600 50  0001 C CNN
F 1 "+5V" V 3615 2878 50  0000 L CNN
F 2 "" H 3600 2750 50  0001 C CNN
F 3 "" H 3600 2750 50  0001 C CNN
	1    3600 2750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3600 2650 3850 2650
$Comp
L power:-12V #PWR?
U 1 1 61903CB4
P 3600 2950
F 0 "#PWR?" H 3600 3050 50  0001 C CNN
F 1 "-12V" V 3615 3078 50  0000 L CNN
F 2 "" H 3600 2950 50  0001 C CNN
F 3 "" H 3600 2950 50  0001 C CNN
	1    3600 2950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5550 2900 5800 2900
Wire Wire Line
	5550 2800 5800 2800
Wire Wire Line
	5550 2700 5800 2700
$Comp
L power:+12V #PWR?
U 1 1 6198B46C
P 5550 2800
F 0 "#PWR?" H 5550 2650 50  0001 C CNN
F 1 "+12V" V 5565 2928 50  0000 L CNN
F 2 "" H 5550 2800 50  0001 C CNN
F 3 "" H 5550 2800 50  0001 C CNN
	1    5550 2800
	0    -1   -1   0   
$EndComp
Text Label 5550 2600 0    50   ~ 0
GND
$Comp
L power:+5V #PWR?
U 1 1 6198B473
P 5550 2700
F 0 "#PWR?" H 5550 2550 50  0001 C CNN
F 1 "+5V" V 5565 2828 50  0000 L CNN
F 2 "" H 5550 2700 50  0001 C CNN
F 3 "" H 5550 2700 50  0001 C CNN
	1    5550 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5550 2600 5800 2600
$Comp
L power:-12V #PWR?
U 1 1 6198B47A
P 5550 2900
F 0 "#PWR?" H 5550 3000 50  0001 C CNN
F 1 "-12V" V 5565 3028 50  0000 L CNN
F 2 "" H 5550 2900 50  0001 C CNN
F 3 "" H 5550 2900 50  0001 C CNN
	1    5550 2900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4350 2650 4600 2650
Text Label 4600 2650 2    50   ~ 0
GND
Wire Wire Line
	4600 2850 4350 2850
$Comp
L power:-12V #PWR?
U 1 1 619AF71F
P 4600 2950
F 0 "#PWR?" H 4600 3050 50  0001 C CNN
F 1 "-12V" V 4615 3078 50  0000 L CNN
F 2 "" H 4600 2950 50  0001 C CNN
F 3 "" H 4600 2950 50  0001 C CNN
	1    4600 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 2750 4600 2750
$Comp
L power:+5V #PWR?
U 1 1 619AF726
P 4600 2750
F 0 "#PWR?" H 4600 2600 50  0001 C CNN
F 1 "+5V" V 4615 2878 50  0000 L CNN
F 2 "" H 4600 2750 50  0001 C CNN
F 3 "" H 4600 2750 50  0001 C CNN
	1    4600 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 2950 4600 2950
$Comp
L power:+12V #PWR?
U 1 1 619AF72D
P 4600 2850
F 0 "#PWR?" H 4600 2700 50  0001 C CNN
F 1 "+12V" V 4615 2978 50  0000 L CNN
F 2 "" H 4600 2850 50  0001 C CNN
F 3 "" H 4600 2850 50  0001 C CNN
	1    4600 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	6300 2600 6550 2600
Text Label 6550 2600 2    50   ~ 0
GND
Wire Wire Line
	6550 2800 6300 2800
$Comp
L power:-12V #PWR?
U 1 1 61A21A9D
P 6550 2900
F 0 "#PWR?" H 6550 3000 50  0001 C CNN
F 1 "-12V" V 6565 3028 50  0000 L CNN
F 2 "" H 6550 2900 50  0001 C CNN
F 3 "" H 6550 2900 50  0001 C CNN
	1    6550 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	6300 2700 6550 2700
$Comp
L power:+5V #PWR?
U 1 1 61A21AA4
P 6550 2700
F 0 "#PWR?" H 6550 2550 50  0001 C CNN
F 1 "+5V" V 6565 2828 50  0000 L CNN
F 2 "" H 6550 2700 50  0001 C CNN
F 3 "" H 6550 2700 50  0001 C CNN
	1    6550 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	6300 2900 6550 2900
$Comp
L power:+12V #PWR?
U 1 1 61A21AAB
P 6550 2800
F 0 "#PWR?" H 6550 2650 50  0001 C CNN
F 1 "+12V" V 6565 2928 50  0000 L CNN
F 2 "" H 6550 2800 50  0001 C CNN
F 3 "" H 6550 2800 50  0001 C CNN
	1    6550 2800
	0    1    1    0   
$EndComp
$EndSCHEMATC
