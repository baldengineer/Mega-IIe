EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
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
L WDC_65C02:w65c02s U?
U 1 1 60B87B3D
P 3150 3050
F 0 "U?" H 3350 4550 50  0000 C CNN
F 1 "w65c02s" H 3400 4450 50  0000 C CNN
F 2 "" H 2950 4250 50  0001 C CNN
F 3 "" H 2950 4250 50  0001 C CNN
	1    3150 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60B894E4
P 1500 950
F 0 "C?" H 1300 1000 50  0000 L CNN
F 1 "10uF" H 1300 900 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D6.3mm_H5.0mm_P2.50mm" H 1500 950 50  0001 C CNN
F 3 "~" H 1500 950 50  0001 C CNN
	1    1500 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60B89F9A
P 1800 950
F 0 "C?" H 1892 996 50  0000 L CNN
F 1 "100nF" H 1892 905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1800 950 50  0001 C CNN
F 3 "~" H 1800 950 50  0001 C CNN
	1    1800 950 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60B8A3B8
P 1650 800
F 0 "#PWR?" H 1650 650 50  0001 C CNN
F 1 "+5V" H 1665 973 50  0000 C CNN
F 2 "" H 1650 800 50  0001 C CNN
F 3 "" H 1650 800 50  0001 C CNN
	1    1650 800 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60B8AC18
P 1650 1100
F 0 "#PWR?" H 1650 850 50  0001 C CNN
F 1 "GND" H 1655 927 50  0000 C CNN
F 2 "" H 1650 1100 50  0001 C CNN
F 3 "" H 1650 1100 50  0001 C CNN
	1    1650 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 850  1500 800 
Wire Wire Line
	1500 800  1650 800 
Wire Wire Line
	1800 800  1800 850 
Wire Wire Line
	1500 1050 1500 1100
Wire Wire Line
	1500 1100 1650 1100
Wire Wire Line
	1800 1100 1800 1050
Connection ~ 1650 1100
Wire Wire Line
	1650 1100 1800 1100
Connection ~ 1650 800 
Wire Wire Line
	1650 800  1800 800 
$Comp
L Connector_Generic:Conn_02x08_Odd_Even J?
U 1 1 60B91E9D
P 5000 2850
F 0 "J?" H 5050 3367 50  0000 C CNN
F 1 "ADDR_BUS" H 5050 3276 50  0000 C CNN
F 2 "" H 5000 2850 50  0001 C CNN
F 3 "~" H 5000 2850 50  0001 C CNN
	1    5000 2850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J?
U 1 1 60B93573
P 1350 3300
F 0 "J?" H 1430 3292 50  0000 L CNN
F 1 "Main Data" H 1430 3201 50  0000 L CNN
F 2 "" H 1350 3300 50  0001 C CNN
F 3 "~" H 1350 3300 50  0001 C CNN
	1    1350 3300
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J?
U 1 1 60B95CD7
P 5050 5650
F 0 "J?" H 5100 6767 50  0000 C CNN
F 1 "Conn_02x20_Odd_Even" H 5100 6676 50  0000 C CNN
F 2 "" H 5050 5650 50  0001 C CNN
F 3 "~" H 5050 5650 50  0001 C CNN
	1    5050 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 3400 6600 3400
Wire Wire Line
	6600 2200 6200 2200
Wire Wire Line
	6600 2300 6200 2300
Wire Wire Line
	6600 2400 6200 2400
Wire Wire Line
	6600 2500 6200 2500
Wire Wire Line
	6600 2600 6200 2600
Wire Wire Line
	6600 2700 6200 2700
Wire Wire Line
	6600 2800 6200 2800
Wire Wire Line
	6600 2900 6200 2900
Wire Wire Line
	6600 3000 6200 3000
Wire Wire Line
	6600 3100 6200 3100
Wire Wire Line
	6600 3200 6200 3200
Wire Wire Line
	6600 3300 6200 3300
Text Label 6200 2200 0    50   ~ 0
A0
Text Label 6200 2300 0    50   ~ 0
A1
Text Label 6200 2400 0    50   ~ 0
A2
Text Label 6200 2500 0    50   ~ 0
A3
Text Label 6200 2600 0    50   ~ 0
A4
Text Label 6200 2700 0    50   ~ 0
A5
Text Label 6200 2800 0    50   ~ 0
A6
Text Label 6200 2900 0    50   ~ 0
A7
Text Label 6200 3000 0    50   ~ 0
A8
Text Label 6200 3100 0    50   ~ 0
A9
Text Label 6200 3200 0    50   ~ 0
A10
Text Label 6200 3300 0    50   ~ 0
A11
Text Label 6200 3400 0    50   ~ 0
A12
Wire Wire Line
	7400 2200 7800 2200
Wire Wire Line
	7400 2300 7800 2300
Wire Wire Line
	7400 2400 7800 2400
Wire Wire Line
	7400 2500 7800 2500
Wire Wire Line
	7400 2600 7800 2600
Wire Wire Line
	7400 2700 7800 2700
Wire Wire Line
	7400 2800 7800 2800
Wire Wire Line
	7400 2900 7800 2900
Text Label 7800 2800 2    50   ~ 0
D6
Text Label 7800 2900 2    50   ~ 0
D7
Wire Wire Line
	6600 3900 6500 3900
Wire Wire Line
	6500 3900 6500 4150
Wire Wire Line
	6500 4150 7000 4150
Wire Wire Line
	7000 4150 7000 4100
$Comp
L power:GND #PWR?
U 1 1 60B8B3CF
P 7000 4150
F 0 "#PWR?" H 7000 3900 50  0001 C CNN
F 1 "GND" H 7005 3977 50  0000 C CNN
F 2 "" H 7000 4150 50  0001 C CNN
F 3 "" H 7000 4150 50  0001 C CNN
	1    7000 4150
	1    0    0    -1  
$EndComp
Connection ~ 7000 4150
Wire Wire Line
	7000 1900 7000 2000
Wire Wire Line
	6600 3800 5950 3800
Text Label 5950 3800 0    50   ~ 0
~ROMEN1
$Comp
L Apple_IIgs_Symbols:27C64 U?
U 1 1 60B8FDEA
P 7000 3000
F 0 "U?" H 7100 4100 50  0000 C CNN
F 1 "EF ROM" H 7150 4000 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 7000 3000 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/11107M.pdf" H 7000 3000 50  0001 C CNN
	1    7000 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 3700 6500 3700
Wire Wire Line
	6500 3700 6500 3600
Wire Wire Line
	6500 3600 6600 3600
$Comp
L power:+5V #PWR?
U 1 1 60B93F95
P 7000 1900
F 0 "#PWR?" H 7000 1750 50  0001 C CNN
F 1 "+5V" H 7015 2073 50  0000 C CNN
F 2 "" H 7000 1900 50  0001 C CNN
F 3 "" H 7000 1900 50  0001 C CNN
	1    7000 1900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60B94D0F
P 6500 3600
F 0 "#PWR?" H 6500 3450 50  0001 C CNN
F 1 "+5V" H 6515 3773 50  0000 C CNN
F 2 "" H 6500 3600 50  0001 C CNN
F 3 "" H 6500 3600 50  0001 C CNN
	1    6500 3600
	0    -1   -1   0   
$EndComp
Connection ~ 6500 3600
Wire Wire Line
	8200 3400 8600 3400
Wire Wire Line
	8600 2200 8200 2200
Wire Wire Line
	8600 2300 8200 2300
Wire Wire Line
	8600 2400 8200 2400
Wire Wire Line
	8600 2500 8200 2500
Wire Wire Line
	8600 2600 8200 2600
Wire Wire Line
	8600 2700 8200 2700
Wire Wire Line
	8600 2800 8200 2800
Wire Wire Line
	8600 2900 8200 2900
Wire Wire Line
	8600 3000 8200 3000
Wire Wire Line
	8600 3100 8200 3100
Wire Wire Line
	8600 3200 8200 3200
Wire Wire Line
	8600 3300 8200 3300
Text Label 8200 2200 0    50   ~ 0
A0
Text Label 8200 2300 0    50   ~ 0
A1
Text Label 8200 2400 0    50   ~ 0
A2
Text Label 8200 2500 0    50   ~ 0
A3
Text Label 8200 2600 0    50   ~ 0
A4
Text Label 8200 2700 0    50   ~ 0
A5
Text Label 8200 2800 0    50   ~ 0
A6
Text Label 8200 2900 0    50   ~ 0
A7
Text Label 8200 3000 0    50   ~ 0
A8
Text Label 8200 3100 0    50   ~ 0
A9
Text Label 8200 3200 0    50   ~ 0
A10
Text Label 8200 3300 0    50   ~ 0
A11
Text Label 8200 3400 0    50   ~ 0
A12
Wire Wire Line
	9400 2200 9800 2200
Wire Wire Line
	9400 2300 9800 2300
Wire Wire Line
	9400 2400 9800 2400
Wire Wire Line
	9400 2500 9800 2500
Wire Wire Line
	9400 2600 9800 2600
Wire Wire Line
	9400 2700 9800 2700
Wire Wire Line
	9400 2800 9800 2800
Wire Wire Line
	9400 2900 9800 2900
Text Label 9800 2200 2    50   ~ 0
D0
Text Label 9800 2300 2    50   ~ 0
D1
Text Label 9800 2400 2    50   ~ 0
D2
Text Label 9800 2500 2    50   ~ 0
D3
Text Label 9800 2600 2    50   ~ 0
D4
Text Label 9800 2700 2    50   ~ 0
D5
Text Label 9800 2800 2    50   ~ 0
D6
Text Label 9800 2900 2    50   ~ 0
D7
Wire Wire Line
	8600 3900 8500 3900
Wire Wire Line
	8500 3900 8500 4150
Wire Wire Line
	8500 4150 9000 4150
Wire Wire Line
	9000 4150 9000 4100
$Comp
L power:GND #PWR?
U 1 1 60BA987A
P 9000 4150
F 0 "#PWR?" H 9000 3900 50  0001 C CNN
F 1 "GND" H 9005 3977 50  0000 C CNN
F 2 "" H 9000 4150 50  0001 C CNN
F 3 "" H 9000 4150 50  0001 C CNN
	1    9000 4150
	1    0    0    -1  
$EndComp
Connection ~ 9000 4150
Wire Wire Line
	9000 1900 9000 2000
Wire Wire Line
	8600 3800 7950 3800
Text Label 7950 3800 0    50   ~ 0
~ROMEN2
$Comp
L Apple_IIgs_Symbols:27C64 U?
U 1 1 60BA9884
P 9000 3000
F 0 "U?" H 9100 4100 50  0000 C CNN
F 1 "CD ROM" H 9150 4000 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 9000 3000 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/11107M.pdf" H 9000 3000 50  0001 C CNN
	1    9000 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 3700 8500 3700
Wire Wire Line
	8500 3700 8500 3600
Wire Wire Line
	8500 3600 8600 3600
$Comp
L power:+5V #PWR?
U 1 1 60BA988D
P 9000 1900
F 0 "#PWR?" H 9000 1750 50  0001 C CNN
F 1 "+5V" H 9015 2073 50  0000 C CNN
F 2 "" H 9000 1900 50  0001 C CNN
F 3 "" H 9000 1900 50  0001 C CNN
	1    9000 1900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60BA9893
P 8500 3600
F 0 "#PWR?" H 8500 3450 50  0001 C CNN
F 1 "+5V" H 8515 3773 50  0000 C CNN
F 2 "" H 8500 3600 50  0001 C CNN
F 3 "" H 8500 3600 50  0001 C CNN
	1    8500 3600
	0    -1   -1   0   
$EndComp
Connection ~ 8500 3600
Text Label 7800 2700 2    50   ~ 0
D5
Text Label 7800 2600 2    50   ~ 0
D4
Text Label 7800 2500 2    50   ~ 0
D3
Text Label 7800 2400 2    50   ~ 0
D2
Text Label 7800 2300 2    50   ~ 0
D1
Text Label 7800 2200 2    50   ~ 0
D0
Wire Wire Line
	1550 3000 1950 3000
Wire Wire Line
	1550 3100 1950 3100
Wire Wire Line
	1550 3200 1950 3200
Wire Wire Line
	1550 3300 1950 3300
Wire Wire Line
	1550 3400 1950 3400
Wire Wire Line
	1550 3500 1950 3500
Wire Wire Line
	1550 3600 1950 3600
Wire Wire Line
	1550 3700 1950 3700
Text Label 1950 3600 2    50   ~ 0
D6
Text Label 1950 3700 2    50   ~ 0
D7
Text Label 1950 3500 2    50   ~ 0
D5
Text Label 1950 3400 2    50   ~ 0
D4
Text Label 1950 3300 2    50   ~ 0
D3
Text Label 1950 3200 2    50   ~ 0
D2
Text Label 1950 3100 2    50   ~ 0
D1
Text Label 1950 3000 2    50   ~ 0
D0
Wire Wire Line
	2750 3000 2350 3000
Wire Wire Line
	2750 3100 2350 3100
Wire Wire Line
	2750 3200 2350 3200
Wire Wire Line
	2750 3300 2350 3300
Wire Wire Line
	2750 3400 2350 3400
Wire Wire Line
	2750 3500 2350 3500
Wire Wire Line
	2750 3600 2350 3600
Wire Wire Line
	2750 3700 2350 3700
Text Label 2350 3600 0    50   ~ 0
D6
Text Label 2350 3700 0    50   ~ 0
D7
Text Label 2350 3500 0    50   ~ 0
D5
Text Label 2350 3400 0    50   ~ 0
D4
Text Label 2350 3300 0    50   ~ 0
D3
Text Label 2350 3200 0    50   ~ 0
D2
Text Label 2350 3100 0    50   ~ 0
D1
Text Label 2350 3000 0    50   ~ 0
D0
Wire Wire Line
	3950 3350 3550 3350
Wire Wire Line
	3550 2150 3950 2150
Wire Wire Line
	3550 2250 3950 2250
Wire Wire Line
	3550 2350 3950 2350
Wire Wire Line
	3550 2450 3950 2450
Wire Wire Line
	3550 2550 3950 2550
Wire Wire Line
	3550 2650 3950 2650
Wire Wire Line
	3550 2750 3950 2750
Wire Wire Line
	3550 2850 3950 2850
Wire Wire Line
	3550 2950 3950 2950
Wire Wire Line
	3550 3050 3950 3050
Wire Wire Line
	3550 3150 3950 3150
Wire Wire Line
	3550 3250 3950 3250
Text Label 3950 2150 2    50   ~ 0
A0
Text Label 3950 2250 2    50   ~ 0
A1
Text Label 3950 2350 2    50   ~ 0
A2
Text Label 3950 2450 2    50   ~ 0
A3
Text Label 3950 2550 2    50   ~ 0
A4
Text Label 3950 2650 2    50   ~ 0
A5
Text Label 3950 2750 2    50   ~ 0
A6
Text Label 3950 2850 2    50   ~ 0
A7
Text Label 3950 2950 2    50   ~ 0
A8
Text Label 3950 3050 2    50   ~ 0
A9
Text Label 3950 3150 2    50   ~ 0
A10
Text Label 3950 3250 2    50   ~ 0
A11
Text Label 3950 3350 2    50   ~ 0
A12
Wire Wire Line
	3950 3450 3550 3450
Text Label 3950 3450 2    50   ~ 0
A13
Wire Wire Line
	3950 3550 3550 3550
Text Label 3950 3550 2    50   ~ 0
A14
Wire Wire Line
	3950 3650 3550 3650
Text Label 3950 3650 2    50   ~ 0
A15
Wire Wire Line
	4800 2550 4400 2550
Text Label 4400 2550 0    50   ~ 0
A0
Wire Wire Line
	4800 2650 4400 2650
Wire Wire Line
	4800 2750 4400 2750
Wire Wire Line
	4800 2850 4400 2850
Wire Wire Line
	4800 2950 4400 2950
Wire Wire Line
	4800 3050 4400 3050
Wire Wire Line
	4800 3150 4400 3150
Wire Wire Line
	4800 3250 4400 3250
Wire Wire Line
	5700 2550 5300 2550
Wire Wire Line
	5700 2650 5300 2650
Wire Wire Line
	5700 2750 5300 2750
Wire Wire Line
	5700 2850 5300 2850
Wire Wire Line
	5700 2950 5300 2950
Wire Wire Line
	5700 3050 5300 3050
Wire Wire Line
	5700 3150 5300 3150
Wire Wire Line
	5700 3250 5300 3250
Text Label 4400 2650 0    50   ~ 0
A2
Text Label 4400 2750 0    50   ~ 0
A4
Text Label 4400 2850 0    50   ~ 0
A6
Text Label 4400 2950 0    50   ~ 0
A8
Text Label 4400 3050 0    50   ~ 0
A10
Text Label 4400 3150 0    50   ~ 0
A12
Text Label 4400 3250 0    50   ~ 0
A14
Text Label 5700 2550 2    50   ~ 0
A1
Text Label 5700 2650 2    50   ~ 0
A3
Text Label 5700 2750 2    50   ~ 0
A5
Text Label 5700 2850 2    50   ~ 0
A7
Text Label 5700 2950 2    50   ~ 0
A9
Text Label 5700 3050 2    50   ~ 0
A11
Text Label 5700 3150 2    50   ~ 0
A13
Text Label 5700 3250 2    50   ~ 0
A15
Wire Wire Line
	5750 5950 5350 5950
Wire Wire Line
	5350 4750 5750 4750
Wire Wire Line
	5350 4850 5750 4850
Wire Wire Line
	5350 4950 5750 4950
Wire Wire Line
	5350 5050 5750 5050
Wire Wire Line
	5350 5150 5750 5150
Wire Wire Line
	5350 5250 5750 5250
Wire Wire Line
	5350 5350 5750 5350
Wire Wire Line
	5350 5450 5750 5450
Wire Wire Line
	5350 5550 5750 5550
Wire Wire Line
	5350 5650 5750 5650
Wire Wire Line
	5350 5750 5750 5750
Wire Wire Line
	5350 5850 5750 5850
Text Label 5750 4750 2    50   ~ 0
A0
Text Label 5750 4850 2    50   ~ 0
A1
Text Label 5750 4950 2    50   ~ 0
A2
Text Label 5750 5050 2    50   ~ 0
A3
Text Label 5750 5150 2    50   ~ 0
A4
Text Label 5750 5250 2    50   ~ 0
A5
Text Label 5750 5350 2    50   ~ 0
A6
Text Label 5750 5450 2    50   ~ 0
A7
Text Label 5750 5550 2    50   ~ 0
A8
Text Label 5750 5650 2    50   ~ 0
A9
Text Label 5750 5750 2    50   ~ 0
A10
Text Label 5750 5850 2    50   ~ 0
A11
Text Label 5750 5950 2    50   ~ 0
A12
Wire Wire Line
	5750 6050 5350 6050
Text Label 5750 6050 2    50   ~ 0
A13
Wire Wire Line
	5750 6150 5350 6150
Text Label 5750 6150 2    50   ~ 0
A14
Wire Wire Line
	5750 6250 5350 6250
Text Label 5750 6250 2    50   ~ 0
A15
Wire Wire Line
	4850 5450 4450 5450
Wire Wire Line
	4850 5350 4450 5350
Wire Wire Line
	4850 5250 4450 5250
Wire Wire Line
	4850 5150 4450 5150
Wire Wire Line
	4850 5050 4450 5050
Wire Wire Line
	4850 4950 4450 4950
Wire Wire Line
	4850 4850 4450 4850
Wire Wire Line
	4850 4750 4450 4750
Text Label 4450 4850 0    50   ~ 0
D6
Text Label 4450 4750 0    50   ~ 0
D7
Text Label 4450 4950 0    50   ~ 0
D5
Text Label 4450 5050 0    50   ~ 0
D4
Text Label 4450 5150 0    50   ~ 0
D3
Text Label 4450 5250 0    50   ~ 0
D2
Text Label 4450 5350 0    50   ~ 0
D1
Text Label 4450 5450 0    50   ~ 0
D0
$Comp
L power:+5V #PWR?
U 1 1 60C3F77B
P 3100 1550
F 0 "#PWR?" H 3100 1400 50  0001 C CNN
F 1 "+5V" H 3115 1723 50  0000 C CNN
F 2 "" H 3100 1550 50  0001 C CNN
F 3 "" H 3100 1550 50  0001 C CNN
	1    3100 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 1550 3100 1600
Wire Wire Line
	3200 1650 3200 1600
Wire Wire Line
	3200 1600 3100 1600
Connection ~ 3100 1600
Wire Wire Line
	3100 1600 3100 1650
$Comp
L power:GND #PWR?
U 1 1 60C4EBBD
P 3150 4550
F 0 "#PWR?" H 3150 4300 50  0001 C CNN
F 1 "GND" H 3155 4377 50  0000 C CNN
F 2 "" H 3150 4550 50  0001 C CNN
F 3 "" H 3150 4550 50  0001 C CNN
	1    3150 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 4450 3050 4550
Wire Wire Line
	3050 4550 3150 4550
Wire Wire Line
	3250 4550 3250 4450
Wire Wire Line
	3150 4450 3150 4550
Connection ~ 3150 4550
Wire Wire Line
	3150 4550 3250 4550
NoConn ~ 2750 4300
NoConn ~ 2750 4200
$Comp
L Connector_Generic:Conn_01x08 J?
U 1 1 60C7E466
P 5100 3850
F 0 "J?" H 5180 3842 50  0000 L CNN
F 1 "Unused" H 5180 3751 50  0000 L CNN
F 2 "" H 5100 3850 50  0001 C CNN
F 3 "~" H 5100 3850 50  0001 C CNN
	1    5100 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 3800 3550 3800
Text Label 3950 3800 2    50   ~ 0
MLB
Wire Wire Line
	3950 3900 3550 3900
Text Label 3950 3900 2    50   ~ 0
PHI2O
Wire Wire Line
	3950 4000 3550 4000
Text Label 3950 4000 2    50   ~ 0
PHI1O
Wire Wire Line
	4500 3750 4900 3750
Text Label 4500 3750 0    50   ~ 0
MLB
Wire Wire Line
	4500 3650 4900 3650
Text Label 4500 3650 0    50   ~ 0
PHI2O
Wire Wire Line
	4500 3550 4900 3550
Text Label 4500 3550 0    50   ~ 0
PHI1O
Wire Wire Line
	2350 2800 2750 2800
Text Label 2350 2800 0    50   ~ 0
SOB
Wire Wire Line
	4500 3850 4900 3850
Text Label 4500 3850 0    50   ~ 0
SOB
Wire Wire Line
	2750 1850 2600 1850
Wire Wire Line
	2600 1850 2600 1600
Wire Wire Line
	2600 1600 3100 1600
Text Label 2350 2250 0    50   ~ 0
RDY
Text Label 2350 2350 0    50   ~ 0
~NMI
Text Label 2350 2450 0    50   ~ 0
~IRQ
Wire Wire Line
	2350 2550 2750 2550
Text Label 2350 2550 0    50   ~ 0
~RES
Wire Wire Line
	4450 5550 4850 5550
Text Label 4450 5550 0    50   ~ 0
RDY
Wire Wire Line
	4450 5650 4850 5650
Text Label 4450 5650 0    50   ~ 0
~NMI
Wire Wire Line
	4450 5750 4850 5750
Text Label 4450 5750 0    50   ~ 0
~IRQ
Wire Wire Line
	4450 5850 4850 5850
Text Label 4450 5850 0    50   ~ 0
~RES
Wire Wire Line
	2250 2250 2750 2250
Wire Wire Line
	2150 2350 2750 2350
Wire Wire Line
	2050 2450 2750 2450
$Comp
L Device:R_Small R?
U 1 1 60D4E925
P 2250 2150
F 0 "R?" V 2250 2100 50  0000 L CNN
F 1 "3k3" H 2250 2400 50  0001 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2250 2150 50  0001 C CNN
F 3 "~" H 2250 2150 50  0001 C CNN
	1    2250 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60D5006C
P 2150 2250
F 0 "R?" V 2150 2200 50  0000 L CNN
F 1 "3k3" H 2050 2000 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2150 2250 50  0001 C CNN
F 3 "~" H 2150 2250 50  0001 C CNN
	1    2150 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60D502FA
P 2050 2350
F 0 "R?" V 2050 2300 50  0000 L CNN
F 1 "3k3" H 2000 2150 50  0001 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2050 2350 50  0001 C CNN
F 3 "~" H 2050 2350 50  0001 C CNN
	1    2050 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 2050 2250 2000
Wire Wire Line
	2250 2000 2150 2000
Wire Wire Line
	2150 2000 2150 2150
Connection ~ 2150 2000
Wire Wire Line
	2150 2000 2050 2000
Wire Wire Line
	2050 2000 2050 2250
$Comp
L power:+5V #PWR?
U 1 1 60D9439D
P 2150 2000
F 0 "#PWR?" H 2150 1850 50  0001 C CNN
F 1 "+5V" H 2165 2173 50  0000 C CNN
F 2 "" H 2150 2000 50  0001 C CNN
F 3 "" H 2150 2000 50  0001 C CNN
	1    2150 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60E19A5D
P 6450 1700
F 0 "C?" H 6542 1746 50  0000 L CNN
F 1 "10u" H 6542 1655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6450 1700 50  0001 C CNN
F 3 "~" H 6450 1700 50  0001 C CNN
	1    6450 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60E1A3AE
P 6450 1800
F 0 "#PWR?" H 6450 1550 50  0001 C CNN
F 1 "GND" H 6455 1627 50  0000 C CNN
F 2 "" H 6450 1800 50  0001 C CNN
F 3 "" H 6450 1800 50  0001 C CNN
	1    6450 1800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60E1AF33
P 6450 1600
F 0 "#PWR?" H 6450 1450 50  0001 C CNN
F 1 "+5V" H 6465 1773 50  0000 C CNN
F 2 "" H 6450 1600 50  0001 C CNN
F 3 "" H 6450 1600 50  0001 C CNN
	1    6450 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60E1DDA8
P 8450 1750
F 0 "C?" H 8542 1796 50  0000 L CNN
F 1 "10u" H 8542 1705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8450 1750 50  0001 C CNN
F 3 "~" H 8450 1750 50  0001 C CNN
	1    8450 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60E1DDAE
P 8450 1850
F 0 "#PWR?" H 8450 1600 50  0001 C CNN
F 1 "GND" H 8455 1677 50  0000 C CNN
F 2 "" H 8450 1850 50  0001 C CNN
F 3 "" H 8450 1850 50  0001 C CNN
	1    8450 1850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60E1DDB4
P 8450 1650
F 0 "#PWR?" H 8450 1500 50  0001 C CNN
F 1 "+5V" H 8465 1823 50  0000 C CNN
F 2 "" H 8450 1650 50  0001 C CNN
F 3 "" H 8450 1650 50  0001 C CNN
	1    8450 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 6400 6700 6400
Wire Wire Line
	6700 5200 6300 5200
Wire Wire Line
	6700 5300 6300 5300
Wire Wire Line
	6700 5400 6300 5400
Wire Wire Line
	6700 5500 6300 5500
Wire Wire Line
	6700 5600 6300 5600
Wire Wire Line
	6700 5700 6300 5700
Wire Wire Line
	6700 5800 6300 5800
Wire Wire Line
	6700 5900 6300 5900
Wire Wire Line
	6700 6000 6300 6000
Wire Wire Line
	6700 6100 6300 6100
Wire Wire Line
	6700 6200 6300 6200
Wire Wire Line
	6700 6300 6300 6300
Text Label 6300 5200 0    50   ~ 0
A0
Text Label 6300 5300 0    50   ~ 0
A1
Text Label 6300 5400 0    50   ~ 0
A2
Text Label 6300 5500 0    50   ~ 0
A3
Text Label 6300 5600 0    50   ~ 0
A4
Text Label 6300 5700 0    50   ~ 0
A5
Text Label 6300 5800 0    50   ~ 0
A6
Text Label 6300 5900 0    50   ~ 0
A7
Text Label 6300 6000 0    50   ~ 0
A8
Text Label 6300 6100 0    50   ~ 0
A9
Text Label 6300 6200 0    50   ~ 0
A10
Text Label 6300 6300 0    50   ~ 0
A11
Text Label 6300 6400 0    50   ~ 0
A12
Wire Wire Line
	7500 5200 7900 5200
Wire Wire Line
	7500 5300 7900 5300
Wire Wire Line
	7500 5400 7900 5400
Wire Wire Line
	7500 5500 7900 5500
Wire Wire Line
	7500 5600 7900 5600
Wire Wire Line
	7500 5700 7900 5700
Wire Wire Line
	7500 5800 7900 5800
Wire Wire Line
	7500 5900 7900 5900
Text Label 7900 5200 2    50   ~ 0
D0
Text Label 7900 5300 2    50   ~ 0
D1
Text Label 7900 5400 2    50   ~ 0
D2
Text Label 7900 5500 2    50   ~ 0
D3
Text Label 7900 5600 2    50   ~ 0
D4
Text Label 7900 5700 2    50   ~ 0
D5
Text Label 7900 5800 2    50   ~ 0
D6
Text Label 7900 5900 2    50   ~ 0
D7
$Comp
L power:GND #PWR?
U 1 1 60ED4072
P 7100 7300
F 0 "#PWR?" H 7100 7050 50  0001 C CNN
F 1 "GND" H 7105 7127 50  0000 C CNN
F 2 "" H 7100 7300 50  0001 C CNN
F 3 "" H 7100 7300 50  0001 C CNN
	1    7100 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 4900 7100 5000
$Comp
L power:+5V #PWR?
U 1 1 60ED4085
P 7100 4900
F 0 "#PWR?" H 7100 4750 50  0001 C CNN
F 1 "+5V" H 7115 5073 50  0000 C CNN
F 2 "" H 7100 4900 50  0001 C CNN
F 3 "" H 7100 4900 50  0001 C CNN
	1    7100 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60ED4092
P 6550 4750
F 0 "C?" H 6642 4796 50  0000 L CNN
F 1 "10u" H 6642 4705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6550 4750 50  0001 C CNN
F 3 "~" H 6550 4750 50  0001 C CNN
	1    6550 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60ED4098
P 6550 4850
F 0 "#PWR?" H 6550 4600 50  0001 C CNN
F 1 "GND" H 6555 4677 50  0000 C CNN
F 2 "" H 6550 4850 50  0001 C CNN
F 3 "" H 6550 4850 50  0001 C CNN
	1    6550 4850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60ED409E
P 6550 4650
F 0 "#PWR?" H 6550 4500 50  0001 C CNN
F 1 "+5V" H 6565 4823 50  0000 C CNN
F 2 "" H 6550 4650 50  0001 C CNN
F 3 "" H 6550 4650 50  0001 C CNN
	1    6550 4650
	1    0    0    -1  
$EndComp
$Comp
L Memory_EPROM:27C512 U?
U 1 1 60EF6AFE
P 7100 6100
F 0 "U?" H 7200 7250 50  0000 C CNN
F 1 "27C512" H 7300 7150 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 7100 6100 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0015.pdf" H 7100 6100 50  0001 C CNN
	1    7100 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 7200 7100 7300
Wire Wire Line
	6300 6500 6700 6500
Text Label 6300 6500 0    50   ~ 0
A13
Wire Wire Line
	6700 7000 6050 7000
Text Label 6050 7000 0    50   ~ 0
~RCMEN
Wire Wire Line
	6700 6900 6450 6900
Text Label 6450 6900 0    50   ~ 0
GND
$Comp
L power:GND #PWR?
U 1 1 60F91795
P 9500 4700
F 0 "#PWR?" H 9500 4450 50  0001 C CNN
F 1 "GND" H 9505 4527 50  0000 C CNN
F 2 "" H 9500 4700 50  0001 C CNN
F 3 "" H 9500 4700 50  0001 C CNN
	1    9500 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 4700 9300 4700
Text Label 9300 4700 0    50   ~ 0
GND
Wire Wire Line
	6700 6700 6500 6700
Wire Wire Line
	6500 6700 6500 6600
Wire Wire Line
	6500 6600 6700 6600
$Comp
L power:+5V #PWR?
U 1 1 60FB3D4E
P 6500 6600
F 0 "#PWR?" H 6500 6450 50  0001 C CNN
F 1 "+5V" H 6515 6773 50  0000 C CNN
F 2 "" H 6500 6600 50  0001 C CNN
F 3 "" H 6500 6600 50  0001 C CNN
	1    6500 6600
	0    -1   -1   0   
$EndComp
Connection ~ 6500 6600
$Comp
L Connector_Generic:Conn_02x08_Odd_Even J?
U 1 1 60FE8DC3
P 5000 1800
F 0 "J?" H 5050 2317 50  0000 C CNN
F 1 "ADDR_BUS" H 5050 2226 50  0000 C CNN
F 2 "" H 5000 1800 50  0001 C CNN
F 3 "~" H 5000 1800 50  0001 C CNN
	1    5000 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 1500 4400 1500
Text Label 4400 1500 0    50   ~ 0
A0
Wire Wire Line
	4800 1600 4400 1600
Wire Wire Line
	4800 1700 4400 1700
Wire Wire Line
	4800 1800 4400 1800
Wire Wire Line
	4800 1900 4400 1900
Wire Wire Line
	4800 2000 4400 2000
Wire Wire Line
	4800 2100 4400 2100
Wire Wire Line
	4800 2200 4400 2200
Wire Wire Line
	5700 1500 5300 1500
Wire Wire Line
	5700 1600 5300 1600
Wire Wire Line
	5700 1700 5300 1700
Wire Wire Line
	5700 1800 5300 1800
Wire Wire Line
	5700 1900 5300 1900
Wire Wire Line
	5700 2000 5300 2000
Wire Wire Line
	5700 2100 5300 2100
Wire Wire Line
	5700 2200 5300 2200
Text Label 4400 1600 0    50   ~ 0
A2
Text Label 4400 1700 0    50   ~ 0
A4
Text Label 4400 1800 0    50   ~ 0
A6
Text Label 4400 1900 0    50   ~ 0
A8
Text Label 4400 2000 0    50   ~ 0
A10
Text Label 4400 2100 0    50   ~ 0
A12
Text Label 4400 2200 0    50   ~ 0
A14
Text Label 5700 1500 2    50   ~ 0
A1
Text Label 5700 1600 2    50   ~ 0
A3
Text Label 5700 1700 2    50   ~ 0
A5
Text Label 5700 1800 2    50   ~ 0
A7
Text Label 5700 1900 2    50   ~ 0
A9
Text Label 5700 2000 2    50   ~ 0
A11
Text Label 5700 2100 2    50   ~ 0
A13
Text Label 5700 2200 2    50   ~ 0
A15
Wire Wire Line
	2750 2000 2450 2000
Text Label 2450 2000 0    50   ~ 0
PH0
Text Label 4450 5950 0    50   ~ 0
PH0
Wire Wire Line
	4450 5950 4850 5950
$EndSCHEMATC
