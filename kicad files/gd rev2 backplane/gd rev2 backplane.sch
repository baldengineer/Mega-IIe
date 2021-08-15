EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x16_Odd_Even J5
U 1 1 6A034DBC
P 3450 7450
F 0 "J5" H 3450 8400 50  0000 L CNN
F 1 "Addr_Main_Data" H 3250 8300 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x16_P2.54mm_Vertical" H 3450 7450 50  0001 C CNN
F 3 "~" H 3450 7450 50  0001 C CNN
	1    3450 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 6750 4000 6750
Wire Wire Line
	3750 7250 4000 7250
Wire Wire Line
	3750 7750 4000 7750
Wire Wire Line
	3750 8250 4000 8250
Wire Wire Line
	3250 8250 3000 8250
Wire Wire Line
	3250 7750 3000 7750
Wire Wire Line
	3250 7250 3000 7250
Wire Wire Line
	3250 6750 3000 6750
Wire Wire Line
	3750 6850 3950 6850
Wire Wire Line
	3250 6850 3050 6850
Wire Wire Line
	3750 6950 3950 6950
Wire Wire Line
	3250 6950 3050 6950
Wire Wire Line
	3750 7050 3950 7050
Wire Wire Line
	3250 7050 3050 7050
Wire Wire Line
	3750 7150 3950 7150
Wire Wire Line
	3250 7150 3050 7150
Text Label 3950 6850 2    50   ~ 0
BA0
Text Label 3050 6850 0    50   ~ 0
BA1
Text Label 3950 6950 2    50   ~ 0
BA2
Text Label 3050 6950 0    50   ~ 0
BA3
Text Label 3950 7050 2    50   ~ 0
BA4
Text Label 3050 7050 0    50   ~ 0
BA5
Text Label 3950 7150 2    50   ~ 0
BA6
Text Label 3050 7150 0    50   ~ 0
BA7
Wire Wire Line
	3750 7350 3950 7350
Wire Wire Line
	3250 7350 3050 7350
Wire Wire Line
	3750 7450 3950 7450
Wire Wire Line
	3250 7450 3050 7450
Wire Wire Line
	3750 7550 3950 7550
Wire Wire Line
	3250 7550 3050 7550
Wire Wire Line
	3750 7650 3950 7650
Wire Wire Line
	3250 7650 3050 7650
Text Label 3950 7350 2    50   ~ 0
BA8
Text Label 3050 7350 0    50   ~ 0
BA9
Text Label 3950 7450 2    50   ~ 0
BA10
Text Label 3050 7450 0    50   ~ 0
BA11
Text Label 3950 7550 2    50   ~ 0
BA12
Text Label 3050 7550 0    50   ~ 0
BA13
Text Label 3950 7650 2    50   ~ 0
BA14
Text Label 3050 7650 0    50   ~ 0
BA15
Text Label 3950 7850 2    50   ~ 0
MD0
Text Label 3050 7850 0    50   ~ 0
MD1
Text Label 3950 7950 2    50   ~ 0
MD2
Text Label 3050 8050 0    50   ~ 0
MD5
Text Label 3050 8150 0    50   ~ 0
MD7
Text Label 3950 8050 2    50   ~ 0
MD4
Wire Wire Line
	3750 8050 3950 8050
Wire Wire Line
	3250 8050 3050 8050
Wire Wire Line
	3750 8150 3950 8150
Wire Wire Line
	3250 8150 3050 8150
Wire Wire Line
	3950 7850 3750 7850
Wire Wire Line
	3050 7850 3250 7850
Wire Wire Line
	3950 7950 3750 7950
Text Label 4000 6750 2    50   ~ 0
GND
Text Label 4000 7250 2    50   ~ 0
GND
Text Label 4000 7750 2    50   ~ 0
GND
Text Label 4000 8250 2    50   ~ 0
GND
Text Label 3000 8250 0    50   ~ 0
GND
Text Label 3000 7750 0    50   ~ 0
GND
Text Label 3000 7250 0    50   ~ 0
GND
Text Label 3000 6750 0    50   ~ 0
GND
Text Label 3950 8150 2    50   ~ 0
MD6
Wire Wire Line
	3050 7950 3250 7950
Text Label 3050 7950 0    50   ~ 0
MD3
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J4
U 1 1 6BE874C0
P 3450 6050
F 0 "J4" H 3500 6467 50  0000 C CNN
F 1 "CTRL1" H 3500 6376 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 3450 6050 50  0001 C CNN
F 3 "~" H 3450 6050 50  0001 C CNN
	1    3450 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 6150 4050 6150
Text Label 4050 6150 2    50   ~ 0
PH0
Wire Wire Line
	3750 6050 4050 6050
Text Label 4050 6050 2    50   ~ 0
Q3
Wire Wire Line
	3750 5950 4050 5950
Text Label 4050 5950 2    50   ~ 0
CREF
Wire Wire Line
	3750 5850 4050 5850
Text Label 4050 5850 2    50   ~ 0
7M
Wire Wire Line
	3250 6050 2950 6050
Wire Wire Line
	3250 5950 2950 5950
Wire Wire Line
	3250 5850 2950 5850
Text Label 2950 5850 0    50   ~ 0
~IRQ
Text Label 2950 5950 0    50   ~ 0
~RESET
Text Label 2950 6050 0    50   ~ 0
RW
Wire Wire Line
	3750 6250 4000 6250
Text Label 4000 6250 2    50   ~ 0
GND
Wire Wire Line
	3250 6250 3000 6250
Text Label 3000 6250 0    50   ~ 0
GND
Wire Wire Line
	3750 5350 4000 5350
Wire Wire Line
	4300 5150 3750 5150
Wire Wire Line
	4300 5250 3750 5250
Text Label 4300 5150 2    50   ~ 0
KSEL1
Text Label 4300 5250 2    50   ~ 0
KSEL2
Wire Wire Line
	3750 4150 4300 4150
Wire Wire Line
	3250 4150 2700 4150
Wire Wire Line
	3750 4250 4300 4250
Wire Wire Line
	3250 4250 2700 4250
Wire Wire Line
	3750 4350 4300 4350
Wire Wire Line
	3250 4350 2700 4350
Text Label 4300 4150 2    50   ~ 0
S0
Text Label 2700 4150 0    50   ~ 0
S1
Text Label 4300 4250 2    50   ~ 0
S2
Text Label 2700 4250 0    50   ~ 0
S3
Text Label 4300 4350 2    50   ~ 0
S4
Text Label 2700 4350 0    50   ~ 0
S5
Wire Wire Line
	3250 5350 3000 5350
Text Label 4300 4950 2    50   ~ 0
C060-67
Wire Wire Line
	4300 4950 3750 4950
Text Label 2900 5150 0    50   ~ 0
!DMA
Wire Wire Line
	3250 5150 2900 5150
Text Label 4000 5350 2    50   ~ 0
GND
Text Label 3000 5350 0    50   ~ 0
GND
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J3
U 1 1 6C194113
P 3450 5150
F 0 "J3" H 3500 5567 50  0000 C CNN
F 1 "CTRL2" H 3500 5476 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 3450 5150 50  0001 C CNN
F 3 "~" H 3450 5150 50  0001 C CNN
	1    3450 5150
	1    0    0    -1  
$EndComp
Text Label 2900 5050 0    50   ~ 0
~NMI
Text Label 2900 4950 0    50   ~ 0
~RDY
Wire Wire Line
	3250 5050 2900 5050
Wire Wire Line
	3250 4950 2900 4950
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J2
U 1 1 6C9998F8
P 3450 4350
F 0 "J2" H 3500 4767 50  0000 C CNN
F 1 "Slot_Maker" H 3500 4676 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 3450 4350 50  0001 C CNN
F 3 "~" H 3450 4350 50  0001 C CNN
	1    3450 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 4550 3000 4550
Text Label 3000 4550 0    50   ~ 0
GND
Wire Wire Line
	3750 4550 4000 4550
Text Label 4000 4550 2    50   ~ 0
GND
Wire Wire Line
	3750 4450 4300 4450
Text Label 4300 4450 2    50   ~ 0
INTDEV6
Wire Wire Line
	4300 5050 3750 5050
Text Label 4300 5050 2    50   ~ 0
KSEL0
Wire Wire Line
	2700 4450 3250 4450
Text Label 2700 4450 0    50   ~ 0
MDI-MDO
Wire Wire Line
	2950 6150 3250 6150
Wire Wire Line
	2900 5250 3250 5250
Text Label 2900 5250 0    50   ~ 0
PDLTRIG
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J1
U 1 1 70273AA4
P 3450 3500
F 0 "J1" H 3500 3850 50  0000 C CNN
F 1 "Pwr" H 3500 3750 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Vertical" H 3450 3500 50  0001 C CNN
F 3 "~" H 3450 3500 50  0001 C CNN
	1    3450 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 3400 4000 3400
Text Label 4000 3400 2    50   ~ 0
GND
Wire Wire Line
	3750 3500 4000 3500
Text Label 4000 3500 2    50   ~ 0
GND
Wire Wire Line
	3250 3400 3000 3400
Wire Wire Line
	3000 3400 3000 3450
Wire Wire Line
	3000 3500 3250 3500
Wire Wire Line
	3250 3600 3000 3600
Wire Wire Line
	3000 3600 3000 3650
Wire Wire Line
	3000 3700 3250 3700
Wire Wire Line
	3750 3700 4000 3700
Wire Wire Line
	4000 3700 4000 3650
Wire Wire Line
	4000 3600 3750 3600
$Comp
L power:+5V #PWR01
U 1 1 615099FB
P 3000 3450
F 0 "#PWR01" H 3000 3300 50  0001 C CNN
F 1 "+5V" V 3015 3578 50  0000 L CNN
F 2 "" H 3000 3450 50  0001 C CNN
F 3 "" H 3000 3450 50  0001 C CNN
	1    3000 3450
	0    -1   -1   0   
$EndComp
Connection ~ 3000 3450
Wire Wire Line
	3000 3450 3000 3500
$Comp
L power:+12V #PWR02
U 1 1 6150A64B
P 3000 3650
F 0 "#PWR02" H 3000 3500 50  0001 C CNN
F 1 "+12V" V 3015 3778 50  0000 L CNN
F 2 "" H 3000 3650 50  0001 C CNN
F 3 "" H 3000 3650 50  0001 C CNN
	1    3000 3650
	0    -1   -1   0   
$EndComp
Connection ~ 3000 3650
Wire Wire Line
	3000 3650 3000 3700
$Comp
L power:-12V #PWR03
U 1 1 6150BA22
P 4000 3650
F 0 "#PWR03" H 4000 3750 50  0001 C CNN
F 1 "-12V" V 4015 3778 50  0000 L CNN
F 2 "" H 4000 3650 50  0001 C CNN
F 3 "" H 4000 3650 50  0001 C CNN
	1    4000 3650
	0    1    1    0   
$EndComp
Connection ~ 4000 3650
Wire Wire Line
	4000 3650 4000 3600
Text Label 2950 6150 0    50   ~ 0
~INH
$Comp
L Connector_Generic:Conn_02x16_Odd_Even J22
U 1 1 61198063
P 6000 7550
F 0 "J22" H 6000 8500 50  0000 L CNN
F 1 "Addr_Main_Data" H 5800 8400 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x16_P2.54mm_Vertical" H 6000 7550 50  0001 C CNN
F 3 "~" H 6000 7550 50  0001 C CNN
	1    6000 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 6850 6550 6850
Wire Wire Line
	6300 7350 6550 7350
Wire Wire Line
	6300 7850 6550 7850
Wire Wire Line
	6300 8350 6550 8350
Wire Wire Line
	5800 8350 5550 8350
Wire Wire Line
	5800 7850 5550 7850
Wire Wire Line
	5800 7350 5550 7350
Wire Wire Line
	5800 6850 5550 6850
Wire Wire Line
	6300 6950 6500 6950
Wire Wire Line
	5800 6950 5600 6950
Wire Wire Line
	6300 7050 6500 7050
Wire Wire Line
	5800 7050 5600 7050
Wire Wire Line
	6300 7150 6500 7150
Wire Wire Line
	5800 7150 5600 7150
Wire Wire Line
	6300 7250 6500 7250
Wire Wire Line
	5800 7250 5600 7250
Text Label 6500 6950 2    50   ~ 0
BA0
Text Label 5600 6950 0    50   ~ 0
BA1
Text Label 6500 7050 2    50   ~ 0
BA2
Text Label 5600 7050 0    50   ~ 0
BA3
Text Label 6500 7150 2    50   ~ 0
BA4
Text Label 5600 7150 0    50   ~ 0
BA5
Text Label 6500 7250 2    50   ~ 0
BA6
Text Label 5600 7250 0    50   ~ 0
BA7
Wire Wire Line
	6300 7450 6500 7450
Wire Wire Line
	5800 7450 5600 7450
Wire Wire Line
	6300 7550 6500 7550
Wire Wire Line
	5800 7550 5600 7550
Wire Wire Line
	6300 7650 6500 7650
Wire Wire Line
	5800 7650 5600 7650
Wire Wire Line
	6300 7750 6500 7750
Wire Wire Line
	5800 7750 5600 7750
Text Label 6500 7450 2    50   ~ 0
BA8
Text Label 5600 7450 0    50   ~ 0
BA9
Text Label 6500 7550 2    50   ~ 0
BA10
Text Label 5600 7550 0    50   ~ 0
BA11
Text Label 6500 7650 2    50   ~ 0
BA12
Text Label 5600 7650 0    50   ~ 0
BA13
Text Label 6500 7750 2    50   ~ 0
BA14
Text Label 5600 7750 0    50   ~ 0
BA15
Text Label 6500 7950 2    50   ~ 0
MD0
Text Label 5600 7950 0    50   ~ 0
MD1
Text Label 6500 8050 2    50   ~ 0
MD2
Text Label 5600 8150 0    50   ~ 0
MD5
Text Label 5600 8250 0    50   ~ 0
MD7
Text Label 6500 8150 2    50   ~ 0
MD4
Wire Wire Line
	6300 8150 6500 8150
Wire Wire Line
	5800 8150 5600 8150
Wire Wire Line
	6300 8250 6500 8250
Wire Wire Line
	5800 8250 5600 8250
Wire Wire Line
	6500 7950 6300 7950
Wire Wire Line
	5600 7950 5800 7950
Wire Wire Line
	6500 8050 6300 8050
Text Label 6550 6850 2    50   ~ 0
GND
Text Label 6550 7350 2    50   ~ 0
GND
Text Label 6550 7850 2    50   ~ 0
GND
Text Label 6550 8350 2    50   ~ 0
GND
Text Label 5550 8350 0    50   ~ 0
GND
Text Label 5550 7850 0    50   ~ 0
GND
Text Label 5550 7350 0    50   ~ 0
GND
Text Label 5550 6850 0    50   ~ 0
GND
Text Label 6500 8250 2    50   ~ 0
MD6
Wire Wire Line
	5600 8050 5800 8050
Text Label 5600 8050 0    50   ~ 0
MD3
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J18
U 1 1 611980A9
P 6000 6150
F 0 "J18" H 6050 6567 50  0000 C CNN
F 1 "CTRL1" H 6050 6476 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 6000 6150 50  0001 C CNN
F 3 "~" H 6000 6150 50  0001 C CNN
	1    6000 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 6250 6600 6250
Text Label 6600 6250 2    50   ~ 0
PH0
Wire Wire Line
	6300 6150 6600 6150
Text Label 6600 6150 2    50   ~ 0
Q3
Wire Wire Line
	6300 6050 6600 6050
Text Label 6600 6050 2    50   ~ 0
CREF
Wire Wire Line
	6300 5950 6600 5950
Text Label 6600 5950 2    50   ~ 0
7M
Wire Wire Line
	5800 6150 5500 6150
Wire Wire Line
	5800 6050 5500 6050
Wire Wire Line
	5800 5950 5500 5950
Text Label 5500 5950 0    50   ~ 0
~IRQ
Text Label 5500 6050 0    50   ~ 0
~RESET
Text Label 5500 6150 0    50   ~ 0
RW
Wire Wire Line
	6300 6350 6550 6350
Text Label 6550 6350 2    50   ~ 0
GND
Wire Wire Line
	5800 6350 5550 6350
Text Label 5550 6350 0    50   ~ 0
GND
Wire Wire Line
	6300 5450 6550 5450
Wire Wire Line
	6850 5250 6300 5250
Wire Wire Line
	6850 5350 6300 5350
Text Label 6850 5250 2    50   ~ 0
KSEL1
Text Label 6850 5350 2    50   ~ 0
KSEL2
Wire Wire Line
	6300 4250 6850 4250
Wire Wire Line
	5800 4250 5250 4250
Wire Wire Line
	6300 4350 6850 4350
Wire Wire Line
	5800 4350 5250 4350
Wire Wire Line
	6300 4450 6850 4450
Wire Wire Line
	5800 4450 5250 4450
Text Label 6850 4250 2    50   ~ 0
S0
Text Label 5250 4250 0    50   ~ 0
S1
Text Label 6850 4350 2    50   ~ 0
S2
Text Label 5250 4350 0    50   ~ 0
S3
Text Label 6850 4450 2    50   ~ 0
S4
Text Label 5250 4450 0    50   ~ 0
S5
Wire Wire Line
	5800 5450 5550 5450
Text Label 6850 5050 2    50   ~ 0
C060-67
Wire Wire Line
	6850 5050 6300 5050
Text Label 5450 5250 0    50   ~ 0
!DMA
Wire Wire Line
	5800 5250 5450 5250
Text Label 6550 5450 2    50   ~ 0
GND
Text Label 5550 5450 0    50   ~ 0
GND
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J14
U 1 1 611980D9
P 6000 5250
F 0 "J14" H 6050 5667 50  0000 C CNN
F 1 "CTRL2" H 6050 5576 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 6000 5250 50  0001 C CNN
F 3 "~" H 6000 5250 50  0001 C CNN
	1    6000 5250
	1    0    0    -1  
$EndComp
Text Label 5450 5150 0    50   ~ 0
~NMI
Text Label 5450 5050 0    50   ~ 0
~RDY
Wire Wire Line
	5800 5150 5450 5150
Wire Wire Line
	5800 5050 5450 5050
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J10
U 1 1 611980E3
P 6000 4450
F 0 "J10" H 6050 4867 50  0000 C CNN
F 1 "Slot_Maker" H 6050 4776 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 6000 4450 50  0001 C CNN
F 3 "~" H 6000 4450 50  0001 C CNN
	1    6000 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 4650 5550 4650
Text Label 5550 4650 0    50   ~ 0
GND
Wire Wire Line
	6300 4650 6550 4650
Text Label 6550 4650 2    50   ~ 0
GND
Wire Wire Line
	6300 4550 6850 4550
Text Label 6850 4550 2    50   ~ 0
INTDEV6
Wire Wire Line
	6850 5150 6300 5150
Text Label 6850 5150 2    50   ~ 0
KSEL0
Wire Wire Line
	5250 4550 5800 4550
Text Label 5250 4550 0    50   ~ 0
MDI-MDO
Wire Wire Line
	5500 6250 5800 6250
Wire Wire Line
	5450 5350 5800 5350
Text Label 5450 5350 0    50   ~ 0
PDLTRIG
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J6
U 1 1 611980F6
P 6000 3600
F 0 "J6" H 6050 3950 50  0000 C CNN
F 1 "Pwr" H 6050 3850 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Vertical" H 6000 3600 50  0001 C CNN
F 3 "~" H 6000 3600 50  0001 C CNN
	1    6000 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 3500 6550 3500
Text Label 6550 3500 2    50   ~ 0
GND
Wire Wire Line
	6300 3600 6550 3600
Text Label 6550 3600 2    50   ~ 0
GND
Wire Wire Line
	5800 3500 5550 3500
Wire Wire Line
	5550 3500 5550 3550
Wire Wire Line
	5550 3600 5800 3600
Wire Wire Line
	5800 3700 5550 3700
Wire Wire Line
	5550 3700 5550 3750
Wire Wire Line
	5550 3800 5800 3800
Wire Wire Line
	6300 3800 6550 3800
Wire Wire Line
	6550 3800 6550 3750
Wire Wire Line
	6550 3700 6300 3700
$Comp
L power:+5V #PWR04
U 1 1 61198109
P 5550 3550
F 0 "#PWR04" H 5550 3400 50  0001 C CNN
F 1 "+5V" V 5565 3678 50  0000 L CNN
F 2 "" H 5550 3550 50  0001 C CNN
F 3 "" H 5550 3550 50  0001 C CNN
	1    5550 3550
	0    -1   -1   0   
$EndComp
Connection ~ 5550 3550
Wire Wire Line
	5550 3550 5550 3600
$Comp
L power:+12V #PWR08
U 1 1 61198111
P 5550 3750
F 0 "#PWR08" H 5550 3600 50  0001 C CNN
F 1 "+12V" V 5565 3878 50  0000 L CNN
F 2 "" H 5550 3750 50  0001 C CNN
F 3 "" H 5550 3750 50  0001 C CNN
	1    5550 3750
	0    -1   -1   0   
$EndComp
Connection ~ 5550 3750
Wire Wire Line
	5550 3750 5550 3800
$Comp
L power:-12V #PWR09
U 1 1 61198119
P 6550 3750
F 0 "#PWR09" H 6550 3850 50  0001 C CNN
F 1 "-12V" V 6565 3878 50  0000 L CNN
F 2 "" H 6550 3750 50  0001 C CNN
F 3 "" H 6550 3750 50  0001 C CNN
	1    6550 3750
	0    1    1    0   
$EndComp
Connection ~ 6550 3750
Wire Wire Line
	6550 3750 6550 3700
Text Label 5500 6250 0    50   ~ 0
~INH
$Comp
L Connector_Generic:Conn_02x16_Odd_Even J23
U 1 1 611ACFD6
P 8350 7650
F 0 "J23" H 8350 8600 50  0000 L CNN
F 1 "Addr_Main_Data" H 8150 8500 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x16_P2.54mm_Vertical" H 8350 7650 50  0001 C CNN
F 3 "~" H 8350 7650 50  0001 C CNN
	1    8350 7650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 6950 8900 6950
Wire Wire Line
	8650 7450 8900 7450
Wire Wire Line
	8650 7950 8900 7950
Wire Wire Line
	8650 8450 8900 8450
Wire Wire Line
	8150 8450 7900 8450
Wire Wire Line
	8150 7950 7900 7950
Wire Wire Line
	8150 7450 7900 7450
Wire Wire Line
	8150 6950 7900 6950
Wire Wire Line
	8650 7050 8850 7050
Wire Wire Line
	8150 7050 7950 7050
Wire Wire Line
	8650 7150 8850 7150
Wire Wire Line
	8150 7150 7950 7150
Wire Wire Line
	8650 7250 8850 7250
Wire Wire Line
	8150 7250 7950 7250
Wire Wire Line
	8650 7350 8850 7350
Wire Wire Line
	8150 7350 7950 7350
Text Label 8850 7050 2    50   ~ 0
BA0
Text Label 7950 7050 0    50   ~ 0
BA1
Text Label 8850 7150 2    50   ~ 0
BA2
Text Label 7950 7150 0    50   ~ 0
BA3
Text Label 8850 7250 2    50   ~ 0
BA4
Text Label 7950 7250 0    50   ~ 0
BA5
Text Label 8850 7350 2    50   ~ 0
BA6
Text Label 7950 7350 0    50   ~ 0
BA7
Wire Wire Line
	8650 7550 8850 7550
Wire Wire Line
	8150 7550 7950 7550
Wire Wire Line
	8650 7650 8850 7650
Wire Wire Line
	8150 7650 7950 7650
Wire Wire Line
	8650 7750 8850 7750
Wire Wire Line
	8150 7750 7950 7750
Wire Wire Line
	8650 7850 8850 7850
Wire Wire Line
	8150 7850 7950 7850
Text Label 8850 7550 2    50   ~ 0
BA8
Text Label 7950 7550 0    50   ~ 0
BA9
Text Label 8850 7650 2    50   ~ 0
BA10
Text Label 7950 7650 0    50   ~ 0
BA11
Text Label 8850 7750 2    50   ~ 0
BA12
Text Label 7950 7750 0    50   ~ 0
BA13
Text Label 8850 7850 2    50   ~ 0
BA14
Text Label 7950 7850 0    50   ~ 0
BA15
Text Label 8850 8050 2    50   ~ 0
MD0
Text Label 7950 8050 0    50   ~ 0
MD1
Text Label 8850 8150 2    50   ~ 0
MD2
Text Label 7950 8250 0    50   ~ 0
MD5
Text Label 7950 8350 0    50   ~ 0
MD7
Text Label 8850 8250 2    50   ~ 0
MD4
Wire Wire Line
	8650 8250 8850 8250
Wire Wire Line
	8150 8250 7950 8250
Wire Wire Line
	8650 8350 8850 8350
Wire Wire Line
	8150 8350 7950 8350
Wire Wire Line
	8850 8050 8650 8050
Wire Wire Line
	7950 8050 8150 8050
Wire Wire Line
	8850 8150 8650 8150
Text Label 8900 6950 2    50   ~ 0
GND
Text Label 8900 7450 2    50   ~ 0
GND
Text Label 8900 7950 2    50   ~ 0
GND
Text Label 8900 8450 2    50   ~ 0
GND
Text Label 7900 8450 0    50   ~ 0
GND
Text Label 7900 7950 0    50   ~ 0
GND
Text Label 7900 7450 0    50   ~ 0
GND
Text Label 7900 6950 0    50   ~ 0
GND
Text Label 8850 8350 2    50   ~ 0
MD6
Wire Wire Line
	7950 8150 8150 8150
Text Label 7950 8150 0    50   ~ 0
MD3
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J19
U 1 1 611AD01C
P 8350 6250
F 0 "J19" H 8400 6667 50  0000 C CNN
F 1 "CTRL1" H 8400 6576 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 8350 6250 50  0001 C CNN
F 3 "~" H 8350 6250 50  0001 C CNN
	1    8350 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 6350 8950 6350
Text Label 8950 6350 2    50   ~ 0
PH0
Wire Wire Line
	8650 6250 8950 6250
Text Label 8950 6250 2    50   ~ 0
Q3
Wire Wire Line
	8650 6150 8950 6150
Text Label 8950 6150 2    50   ~ 0
CREF
Wire Wire Line
	8650 6050 8950 6050
Text Label 8950 6050 2    50   ~ 0
7M
Wire Wire Line
	8150 6250 7850 6250
Wire Wire Line
	8150 6150 7850 6150
Wire Wire Line
	8150 6050 7850 6050
Text Label 7850 6050 0    50   ~ 0
~IRQ
Text Label 7850 6150 0    50   ~ 0
~RESET
Text Label 7850 6250 0    50   ~ 0
RW
Wire Wire Line
	8650 6450 8900 6450
Text Label 8900 6450 2    50   ~ 0
GND
Wire Wire Line
	8150 6450 7900 6450
Text Label 7900 6450 0    50   ~ 0
GND
Wire Wire Line
	8650 5550 8900 5550
Wire Wire Line
	9200 5350 8650 5350
Wire Wire Line
	9200 5450 8650 5450
Text Label 9200 5350 2    50   ~ 0
KSEL1
Text Label 9200 5450 2    50   ~ 0
KSEL2
Wire Wire Line
	8650 4350 9200 4350
Wire Wire Line
	8150 4350 7600 4350
Wire Wire Line
	8650 4450 9200 4450
Wire Wire Line
	8150 4450 7600 4450
Wire Wire Line
	8650 4550 9200 4550
Wire Wire Line
	8150 4550 7600 4550
Text Label 9200 4350 2    50   ~ 0
S0
Text Label 7600 4350 0    50   ~ 0
S1
Text Label 9200 4450 2    50   ~ 0
S2
Text Label 7600 4450 0    50   ~ 0
S3
Text Label 9200 4550 2    50   ~ 0
S4
Text Label 7600 4550 0    50   ~ 0
S5
Wire Wire Line
	8150 5550 7900 5550
Text Label 9200 5150 2    50   ~ 0
C060-67
Wire Wire Line
	9200 5150 8650 5150
Text Label 7800 5350 0    50   ~ 0
!DMA
Wire Wire Line
	8150 5350 7800 5350
Text Label 8900 5550 2    50   ~ 0
GND
Text Label 7900 5550 0    50   ~ 0
GND
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J15
U 1 1 611AD04C
P 8350 5350
F 0 "J15" H 8400 5767 50  0000 C CNN
F 1 "CTRL2" H 8400 5676 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 8350 5350 50  0001 C CNN
F 3 "~" H 8350 5350 50  0001 C CNN
	1    8350 5350
	1    0    0    -1  
$EndComp
Text Label 7800 5250 0    50   ~ 0
~NMI
Text Label 7800 5150 0    50   ~ 0
~RDY
Wire Wire Line
	8150 5250 7800 5250
Wire Wire Line
	8150 5150 7800 5150
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J11
U 1 1 611AD056
P 8350 4550
F 0 "J11" H 8400 4967 50  0000 C CNN
F 1 "Slot_Maker" H 8400 4876 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 8350 4550 50  0001 C CNN
F 3 "~" H 8350 4550 50  0001 C CNN
	1    8350 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 4750 7900 4750
Text Label 7900 4750 0    50   ~ 0
GND
Wire Wire Line
	8650 4750 8900 4750
Text Label 8900 4750 2    50   ~ 0
GND
Wire Wire Line
	8650 4650 9200 4650
Text Label 9200 4650 2    50   ~ 0
INTDEV6
Wire Wire Line
	9200 5250 8650 5250
Text Label 9200 5250 2    50   ~ 0
KSEL0
Wire Wire Line
	7600 4650 8150 4650
Text Label 7600 4650 0    50   ~ 0
MDI-MDO
Wire Wire Line
	7850 6350 8150 6350
Wire Wire Line
	7800 5450 8150 5450
Text Label 7800 5450 0    50   ~ 0
PDLTRIG
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J7
U 1 1 611AD069
P 8350 3700
F 0 "J7" H 8400 4050 50  0000 C CNN
F 1 "Pwr" H 8400 3950 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Vertical" H 8350 3700 50  0001 C CNN
F 3 "~" H 8350 3700 50  0001 C CNN
	1    8350 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 3600 8900 3600
Text Label 8900 3600 2    50   ~ 0
GND
Wire Wire Line
	8650 3700 8900 3700
Text Label 8900 3700 2    50   ~ 0
GND
Wire Wire Line
	8150 3600 7900 3600
Wire Wire Line
	7900 3600 7900 3650
Wire Wire Line
	7900 3700 8150 3700
Wire Wire Line
	8150 3800 7900 3800
Wire Wire Line
	7900 3800 7900 3850
Wire Wire Line
	7900 3900 8150 3900
Wire Wire Line
	8650 3900 8900 3900
Wire Wire Line
	8900 3900 8900 3850
Wire Wire Line
	8900 3800 8650 3800
$Comp
L power:+5V #PWR05
U 1 1 611AD07C
P 7900 3650
F 0 "#PWR05" H 7900 3500 50  0001 C CNN
F 1 "+5V" V 7915 3778 50  0000 L CNN
F 2 "" H 7900 3650 50  0001 C CNN
F 3 "" H 7900 3650 50  0001 C CNN
	1    7900 3650
	0    -1   -1   0   
$EndComp
Connection ~ 7900 3650
Wire Wire Line
	7900 3650 7900 3700
$Comp
L power:+12V #PWR010
U 1 1 611AD084
P 7900 3850
F 0 "#PWR010" H 7900 3700 50  0001 C CNN
F 1 "+12V" V 7915 3978 50  0000 L CNN
F 2 "" H 7900 3850 50  0001 C CNN
F 3 "" H 7900 3850 50  0001 C CNN
	1    7900 3850
	0    -1   -1   0   
$EndComp
Connection ~ 7900 3850
Wire Wire Line
	7900 3850 7900 3900
$Comp
L power:-12V #PWR011
U 1 1 611AD08C
P 8900 3850
F 0 "#PWR011" H 8900 3950 50  0001 C CNN
F 1 "-12V" V 8915 3978 50  0000 L CNN
F 2 "" H 8900 3850 50  0001 C CNN
F 3 "" H 8900 3850 50  0001 C CNN
	1    8900 3850
	0    1    1    0   
$EndComp
Connection ~ 8900 3850
Wire Wire Line
	8900 3850 8900 3800
Text Label 7850 6350 0    50   ~ 0
~INH
$Comp
L Connector_Generic:Conn_02x16_Odd_Even J24
U 1 1 611CF6A6
P 10650 7650
F 0 "J24" H 10650 8600 50  0000 L CNN
F 1 "Addr_Main_Data" H 10450 8500 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x16_P2.54mm_Vertical" H 10650 7650 50  0001 C CNN
F 3 "~" H 10650 7650 50  0001 C CNN
	1    10650 7650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10950 6950 11200 6950
Wire Wire Line
	10950 7450 11200 7450
Wire Wire Line
	10950 7950 11200 7950
Wire Wire Line
	10950 8450 11200 8450
Wire Wire Line
	10450 8450 10200 8450
Wire Wire Line
	10450 7950 10200 7950
Wire Wire Line
	10450 7450 10200 7450
Wire Wire Line
	10450 6950 10200 6950
Wire Wire Line
	10950 7050 11150 7050
Wire Wire Line
	10450 7050 10250 7050
Wire Wire Line
	10950 7150 11150 7150
Wire Wire Line
	10450 7150 10250 7150
Wire Wire Line
	10950 7250 11150 7250
Wire Wire Line
	10450 7250 10250 7250
Wire Wire Line
	10950 7350 11150 7350
Wire Wire Line
	10450 7350 10250 7350
Text Label 11150 7050 2    50   ~ 0
BA0
Text Label 10250 7050 0    50   ~ 0
BA1
Text Label 11150 7150 2    50   ~ 0
BA2
Text Label 10250 7150 0    50   ~ 0
BA3
Text Label 11150 7250 2    50   ~ 0
BA4
Text Label 10250 7250 0    50   ~ 0
BA5
Text Label 11150 7350 2    50   ~ 0
BA6
Text Label 10250 7350 0    50   ~ 0
BA7
Wire Wire Line
	10950 7550 11150 7550
Wire Wire Line
	10450 7550 10250 7550
Wire Wire Line
	10950 7650 11150 7650
Wire Wire Line
	10450 7650 10250 7650
Wire Wire Line
	10950 7750 11150 7750
Wire Wire Line
	10450 7750 10250 7750
Wire Wire Line
	10950 7850 11150 7850
Wire Wire Line
	10450 7850 10250 7850
Text Label 11150 7550 2    50   ~ 0
BA8
Text Label 10250 7550 0    50   ~ 0
BA9
Text Label 11150 7650 2    50   ~ 0
BA10
Text Label 10250 7650 0    50   ~ 0
BA11
Text Label 11150 7750 2    50   ~ 0
BA12
Text Label 10250 7750 0    50   ~ 0
BA13
Text Label 11150 7850 2    50   ~ 0
BA14
Text Label 10250 7850 0    50   ~ 0
BA15
Text Label 11150 8050 2    50   ~ 0
MD0
Text Label 10250 8050 0    50   ~ 0
MD1
Text Label 11150 8150 2    50   ~ 0
MD2
Text Label 10250 8250 0    50   ~ 0
MD5
Text Label 10250 8350 0    50   ~ 0
MD7
Text Label 11150 8250 2    50   ~ 0
MD4
Wire Wire Line
	10950 8250 11150 8250
Wire Wire Line
	10450 8250 10250 8250
Wire Wire Line
	10950 8350 11150 8350
Wire Wire Line
	10450 8350 10250 8350
Wire Wire Line
	11150 8050 10950 8050
Wire Wire Line
	10250 8050 10450 8050
Wire Wire Line
	11150 8150 10950 8150
Text Label 11200 6950 2    50   ~ 0
GND
Text Label 11200 7450 2    50   ~ 0
GND
Text Label 11200 7950 2    50   ~ 0
GND
Text Label 11200 8450 2    50   ~ 0
GND
Text Label 10200 8450 0    50   ~ 0
GND
Text Label 10200 7950 0    50   ~ 0
GND
Text Label 10200 7450 0    50   ~ 0
GND
Text Label 10200 6950 0    50   ~ 0
GND
Text Label 11150 8350 2    50   ~ 0
MD6
Wire Wire Line
	10250 8150 10450 8150
Text Label 10250 8150 0    50   ~ 0
MD3
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J20
U 1 1 611CF6EC
P 10650 6250
F 0 "J20" H 10700 6667 50  0000 C CNN
F 1 "CTRL1" H 10700 6576 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 10650 6250 50  0001 C CNN
F 3 "~" H 10650 6250 50  0001 C CNN
	1    10650 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10950 6350 11250 6350
Text Label 11250 6350 2    50   ~ 0
PH0
Wire Wire Line
	10950 6250 11250 6250
Text Label 11250 6250 2    50   ~ 0
Q3
Wire Wire Line
	10950 6150 11250 6150
Text Label 11250 6150 2    50   ~ 0
CREF
Wire Wire Line
	10950 6050 11250 6050
Text Label 11250 6050 2    50   ~ 0
7M
Wire Wire Line
	10450 6250 10150 6250
Wire Wire Line
	10450 6150 10150 6150
Wire Wire Line
	10450 6050 10150 6050
Text Label 10150 6050 0    50   ~ 0
~IRQ
Text Label 10150 6150 0    50   ~ 0
~RESET
Text Label 10150 6250 0    50   ~ 0
RW
Wire Wire Line
	10950 6450 11200 6450
Text Label 11200 6450 2    50   ~ 0
GND
Wire Wire Line
	10450 6450 10200 6450
Text Label 10200 6450 0    50   ~ 0
GND
Wire Wire Line
	10950 5550 11200 5550
Wire Wire Line
	11500 5350 10950 5350
Wire Wire Line
	11500 5450 10950 5450
Text Label 11500 5350 2    50   ~ 0
KSEL1
Text Label 11500 5450 2    50   ~ 0
KSEL2
Wire Wire Line
	10950 4350 11500 4350
Wire Wire Line
	10450 4350 9900 4350
Wire Wire Line
	10950 4450 11500 4450
Wire Wire Line
	10450 4450 9900 4450
Wire Wire Line
	10950 4550 11500 4550
Wire Wire Line
	10450 4550 9900 4550
Text Label 11500 4350 2    50   ~ 0
S0
Text Label 9900 4350 0    50   ~ 0
S1
Text Label 11500 4450 2    50   ~ 0
S2
Text Label 9900 4450 0    50   ~ 0
S3
Text Label 11500 4550 2    50   ~ 0
S4
Text Label 9900 4550 0    50   ~ 0
S5
Wire Wire Line
	10450 5550 10200 5550
Text Label 11500 5150 2    50   ~ 0
C060-67
Wire Wire Line
	11500 5150 10950 5150
Text Label 10100 5350 0    50   ~ 0
!DMA
Wire Wire Line
	10450 5350 10100 5350
Text Label 11200 5550 2    50   ~ 0
GND
Text Label 10200 5550 0    50   ~ 0
GND
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J16
U 1 1 611CF71C
P 10650 5350
F 0 "J16" H 10700 5767 50  0000 C CNN
F 1 "CTRL2" H 10700 5676 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 10650 5350 50  0001 C CNN
F 3 "~" H 10650 5350 50  0001 C CNN
	1    10650 5350
	1    0    0    -1  
$EndComp
Text Label 10100 5250 0    50   ~ 0
~NMI
Text Label 10100 5150 0    50   ~ 0
~RDY
Wire Wire Line
	10450 5250 10100 5250
Wire Wire Line
	10450 5150 10100 5150
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J12
U 1 1 611CF726
P 10650 4550
F 0 "J12" H 10700 4967 50  0000 C CNN
F 1 "Slot_Maker" H 10700 4876 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 10650 4550 50  0001 C CNN
F 3 "~" H 10650 4550 50  0001 C CNN
	1    10650 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 4750 10200 4750
Text Label 10200 4750 0    50   ~ 0
GND
Wire Wire Line
	10950 4750 11200 4750
Text Label 11200 4750 2    50   ~ 0
GND
Wire Wire Line
	10950 4650 11500 4650
Text Label 11500 4650 2    50   ~ 0
INTDEV6
Wire Wire Line
	11500 5250 10950 5250
Text Label 11500 5250 2    50   ~ 0
KSEL0
Wire Wire Line
	9900 4650 10450 4650
Text Label 9900 4650 0    50   ~ 0
MDI-MDO
Wire Wire Line
	10150 6350 10450 6350
Wire Wire Line
	10100 5450 10450 5450
Text Label 10100 5450 0    50   ~ 0
PDLTRIG
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J8
U 1 1 611CF739
P 10650 3700
F 0 "J8" H 10700 4050 50  0000 C CNN
F 1 "Pwr" H 10700 3950 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Vertical" H 10650 3700 50  0001 C CNN
F 3 "~" H 10650 3700 50  0001 C CNN
	1    10650 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10950 3600 11200 3600
Text Label 11200 3600 2    50   ~ 0
GND
Wire Wire Line
	10950 3700 11200 3700
Text Label 11200 3700 2    50   ~ 0
GND
Wire Wire Line
	10450 3600 10200 3600
Wire Wire Line
	10200 3600 10200 3650
Wire Wire Line
	10200 3700 10450 3700
Wire Wire Line
	10450 3800 10200 3800
Wire Wire Line
	10200 3800 10200 3850
Wire Wire Line
	10200 3900 10450 3900
Wire Wire Line
	10950 3900 11200 3900
Wire Wire Line
	11200 3900 11200 3850
Wire Wire Line
	11200 3800 10950 3800
$Comp
L power:+5V #PWR06
U 1 1 611CF74C
P 10200 3650
F 0 "#PWR06" H 10200 3500 50  0001 C CNN
F 1 "+5V" V 10215 3778 50  0000 L CNN
F 2 "" H 10200 3650 50  0001 C CNN
F 3 "" H 10200 3650 50  0001 C CNN
	1    10200 3650
	0    -1   -1   0   
$EndComp
Connection ~ 10200 3650
Wire Wire Line
	10200 3650 10200 3700
$Comp
L power:+12V #PWR012
U 1 1 611CF754
P 10200 3850
F 0 "#PWR012" H 10200 3700 50  0001 C CNN
F 1 "+12V" V 10215 3978 50  0000 L CNN
F 2 "" H 10200 3850 50  0001 C CNN
F 3 "" H 10200 3850 50  0001 C CNN
	1    10200 3850
	0    -1   -1   0   
$EndComp
Connection ~ 10200 3850
Wire Wire Line
	10200 3850 10200 3900
$Comp
L power:-12V #PWR013
U 1 1 611CF75C
P 11200 3850
F 0 "#PWR013" H 11200 3950 50  0001 C CNN
F 1 "-12V" V 11215 3978 50  0000 L CNN
F 2 "" H 11200 3850 50  0001 C CNN
F 3 "" H 11200 3850 50  0001 C CNN
	1    11200 3850
	0    1    1    0   
$EndComp
Connection ~ 11200 3850
Wire Wire Line
	11200 3850 11200 3800
Text Label 10150 6350 0    50   ~ 0
~INH
$Comp
L Connector_Generic:Conn_02x16_Odd_Even J25
U 1 1 611FAF09
P 12650 7650
F 0 "J25" H 12650 8600 50  0000 L CNN
F 1 "Addr_Main_Data" H 12450 8500 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x16_P2.54mm_Vertical" H 12650 7650 50  0001 C CNN
F 3 "~" H 12650 7650 50  0001 C CNN
	1    12650 7650
	1    0    0    -1  
$EndComp
Wire Wire Line
	12950 6950 13200 6950
Wire Wire Line
	12950 7450 13200 7450
Wire Wire Line
	12950 7950 13200 7950
Wire Wire Line
	12950 8450 13200 8450
Wire Wire Line
	12450 8450 12200 8450
Wire Wire Line
	12450 7950 12200 7950
Wire Wire Line
	12450 7450 12200 7450
Wire Wire Line
	12450 6950 12200 6950
Wire Wire Line
	12950 7050 13150 7050
Wire Wire Line
	12450 7050 12250 7050
Wire Wire Line
	12950 7150 13150 7150
Wire Wire Line
	12450 7150 12250 7150
Wire Wire Line
	12950 7250 13150 7250
Wire Wire Line
	12450 7250 12250 7250
Wire Wire Line
	12950 7350 13150 7350
Wire Wire Line
	12450 7350 12250 7350
Text Label 13150 7050 2    50   ~ 0
BA0
Text Label 12250 7050 0    50   ~ 0
BA1
Text Label 13150 7150 2    50   ~ 0
BA2
Text Label 12250 7150 0    50   ~ 0
BA3
Text Label 13150 7250 2    50   ~ 0
BA4
Text Label 12250 7250 0    50   ~ 0
BA5
Text Label 13150 7350 2    50   ~ 0
BA6
Text Label 12250 7350 0    50   ~ 0
BA7
Wire Wire Line
	12950 7550 13150 7550
Wire Wire Line
	12450 7550 12250 7550
Wire Wire Line
	12950 7650 13150 7650
Wire Wire Line
	12450 7650 12250 7650
Wire Wire Line
	12950 7750 13150 7750
Wire Wire Line
	12450 7750 12250 7750
Wire Wire Line
	12950 7850 13150 7850
Wire Wire Line
	12450 7850 12250 7850
Text Label 13150 7550 2    50   ~ 0
BA8
Text Label 12250 7550 0    50   ~ 0
BA9
Text Label 13150 7650 2    50   ~ 0
BA10
Text Label 12250 7650 0    50   ~ 0
BA11
Text Label 13150 7750 2    50   ~ 0
BA12
Text Label 12250 7750 0    50   ~ 0
BA13
Text Label 13150 7850 2    50   ~ 0
BA14
Text Label 12250 7850 0    50   ~ 0
BA15
Text Label 13150 8050 2    50   ~ 0
MD0
Text Label 12250 8050 0    50   ~ 0
MD1
Text Label 13150 8150 2    50   ~ 0
MD2
Text Label 12250 8250 0    50   ~ 0
MD5
Text Label 12250 8350 0    50   ~ 0
MD7
Text Label 13150 8250 2    50   ~ 0
MD4
Wire Wire Line
	12950 8250 13150 8250
Wire Wire Line
	12450 8250 12250 8250
Wire Wire Line
	12950 8350 13150 8350
Wire Wire Line
	12450 8350 12250 8350
Wire Wire Line
	13150 8050 12950 8050
Wire Wire Line
	12250 8050 12450 8050
Wire Wire Line
	13150 8150 12950 8150
Text Label 13200 6950 2    50   ~ 0
GND
Text Label 13200 7450 2    50   ~ 0
GND
Text Label 13200 7950 2    50   ~ 0
GND
Text Label 13200 8450 2    50   ~ 0
GND
Text Label 12200 8450 0    50   ~ 0
GND
Text Label 12200 7950 0    50   ~ 0
GND
Text Label 12200 7450 0    50   ~ 0
GND
Text Label 12200 6950 0    50   ~ 0
GND
Text Label 13150 8350 2    50   ~ 0
MD6
Wire Wire Line
	12250 8150 12450 8150
Text Label 12250 8150 0    50   ~ 0
MD3
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J21
U 1 1 611FAF4F
P 12650 6250
F 0 "J21" H 12700 6667 50  0000 C CNN
F 1 "CTRL1" H 12700 6576 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 12650 6250 50  0001 C CNN
F 3 "~" H 12650 6250 50  0001 C CNN
	1    12650 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	12950 6350 13250 6350
Text Label 13250 6350 2    50   ~ 0
PH0
Wire Wire Line
	12950 6250 13250 6250
Text Label 13250 6250 2    50   ~ 0
Q3
Wire Wire Line
	12950 6150 13250 6150
Text Label 13250 6150 2    50   ~ 0
CREF
Wire Wire Line
	12950 6050 13250 6050
Text Label 13250 6050 2    50   ~ 0
7M
Wire Wire Line
	12450 6250 12150 6250
Wire Wire Line
	12450 6150 12150 6150
Wire Wire Line
	12450 6050 12150 6050
Text Label 12150 6050 0    50   ~ 0
~IRQ
Text Label 12150 6150 0    50   ~ 0
~RESET
Text Label 12150 6250 0    50   ~ 0
RW
Wire Wire Line
	12950 6450 13200 6450
Text Label 13200 6450 2    50   ~ 0
GND
Wire Wire Line
	12450 6450 12200 6450
Text Label 12200 6450 0    50   ~ 0
GND
Wire Wire Line
	12950 5550 13200 5550
Wire Wire Line
	13500 5350 12950 5350
Wire Wire Line
	13500 5450 12950 5450
Text Label 13500 5350 2    50   ~ 0
KSEL1
Text Label 13500 5450 2    50   ~ 0
KSEL2
Wire Wire Line
	12950 4350 13500 4350
Wire Wire Line
	12450 4350 11900 4350
Wire Wire Line
	12950 4450 13500 4450
Wire Wire Line
	12450 4450 11900 4450
Wire Wire Line
	12950 4550 13500 4550
Wire Wire Line
	12450 4550 11900 4550
Text Label 13500 4350 2    50   ~ 0
S0
Text Label 11900 4350 0    50   ~ 0
S1
Text Label 13500 4450 2    50   ~ 0
S2
Text Label 11900 4450 0    50   ~ 0
S3
Text Label 13500 4550 2    50   ~ 0
S4
Text Label 11900 4550 0    50   ~ 0
S5
Wire Wire Line
	12450 5550 12200 5550
Text Label 13500 5150 2    50   ~ 0
C060-67
Wire Wire Line
	13500 5150 12950 5150
Text Label 12100 5350 0    50   ~ 0
!DMA
Wire Wire Line
	12450 5350 12100 5350
Text Label 13200 5550 2    50   ~ 0
GND
Text Label 12200 5550 0    50   ~ 0
GND
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J17
U 1 1 611FAF7F
P 12650 5350
F 0 "J17" H 12700 5767 50  0000 C CNN
F 1 "CTRL2" H 12700 5676 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 12650 5350 50  0001 C CNN
F 3 "~" H 12650 5350 50  0001 C CNN
	1    12650 5350
	1    0    0    -1  
$EndComp
Text Label 12100 5250 0    50   ~ 0
~NMI
Text Label 12100 5150 0    50   ~ 0
~RDY
Wire Wire Line
	12450 5250 12100 5250
Wire Wire Line
	12450 5150 12100 5150
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J13
U 1 1 611FAF89
P 12650 4550
F 0 "J13" H 12700 4967 50  0000 C CNN
F 1 "Slot_Maker" H 12700 4876 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 12650 4550 50  0001 C CNN
F 3 "~" H 12650 4550 50  0001 C CNN
	1    12650 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	12450 4750 12200 4750
Text Label 12200 4750 0    50   ~ 0
GND
Wire Wire Line
	12950 4750 13200 4750
Text Label 13200 4750 2    50   ~ 0
GND
Wire Wire Line
	12950 4650 13500 4650
Text Label 13500 4650 2    50   ~ 0
INTDEV6
Wire Wire Line
	13500 5250 12950 5250
Text Label 13500 5250 2    50   ~ 0
KSEL0
Wire Wire Line
	11900 4650 12450 4650
Text Label 11900 4650 0    50   ~ 0
MDI-MDO
Wire Wire Line
	12150 6350 12450 6350
Wire Wire Line
	12100 5450 12450 5450
Text Label 12100 5450 0    50   ~ 0
PDLTRIG
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J9
U 1 1 611FAF9C
P 12650 3700
F 0 "J9" H 12700 4050 50  0000 C CNN
F 1 "Pwr" H 12700 3950 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Vertical" H 12650 3700 50  0001 C CNN
F 3 "~" H 12650 3700 50  0001 C CNN
	1    12650 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	12950 3600 13200 3600
Text Label 13200 3600 2    50   ~ 0
GND
Wire Wire Line
	12950 3700 13200 3700
Text Label 13200 3700 2    50   ~ 0
GND
Wire Wire Line
	12450 3600 12200 3600
Wire Wire Line
	12200 3600 12200 3650
Wire Wire Line
	12200 3700 12450 3700
Wire Wire Line
	12450 3800 12200 3800
Wire Wire Line
	12200 3800 12200 3850
Wire Wire Line
	12200 3900 12450 3900
Wire Wire Line
	12950 3900 13200 3900
Wire Wire Line
	13200 3900 13200 3850
Wire Wire Line
	13200 3800 12950 3800
$Comp
L power:+5V #PWR07
U 1 1 611FAFAF
P 12200 3650
F 0 "#PWR07" H 12200 3500 50  0001 C CNN
F 1 "+5V" V 12215 3778 50  0000 L CNN
F 2 "" H 12200 3650 50  0001 C CNN
F 3 "" H 12200 3650 50  0001 C CNN
	1    12200 3650
	0    -1   -1   0   
$EndComp
Connection ~ 12200 3650
Wire Wire Line
	12200 3650 12200 3700
$Comp
L power:+12V #PWR014
U 1 1 611FAFB7
P 12200 3850
F 0 "#PWR014" H 12200 3700 50  0001 C CNN
F 1 "+12V" V 12215 3978 50  0000 L CNN
F 2 "" H 12200 3850 50  0001 C CNN
F 3 "" H 12200 3850 50  0001 C CNN
	1    12200 3850
	0    -1   -1   0   
$EndComp
Connection ~ 12200 3850
Wire Wire Line
	12200 3850 12200 3900
$Comp
L power:-12V #PWR015
U 1 1 611FAFBF
P 13200 3850
F 0 "#PWR015" H 13200 3950 50  0001 C CNN
F 1 "-12V" V 13215 3978 50  0000 L CNN
F 2 "" H 13200 3850 50  0001 C CNN
F 3 "" H 13200 3850 50  0001 C CNN
	1    13200 3850
	0    1    1    0   
$EndComp
Connection ~ 13200 3850
Wire Wire Line
	13200 3850 13200 3800
Text Label 12150 6350 0    50   ~ 0
~INH
$EndSCHEMATC
