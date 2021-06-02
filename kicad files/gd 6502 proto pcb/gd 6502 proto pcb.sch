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
P 2400 2300
F 0 "U?" H 2600 3600 50  0000 C CNN
F 1 "w65c02s" H 2700 3500 50  0000 C CNN
F 2 "" H 2200 3500 50  0001 C CNN
F 3 "" H 2200 3500 50  0001 C CNN
	1    2400 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60B894E4
P 900 1100
F 0 "C?" H 700 1150 50  0000 L CNN
F 1 "10uF" H 700 1050 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D6.3mm_H5.0mm_P2.50mm" H 900 1100 50  0001 C CNN
F 3 "~" H 900 1100 50  0001 C CNN
	1    900  1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60B89F9A
P 1200 1100
F 0 "C?" H 1292 1146 50  0000 L CNN
F 1 "100nF" H 1292 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1200 1100 50  0001 C CNN
F 3 "~" H 1200 1100 50  0001 C CNN
	1    1200 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60B8A3B8
P 1050 950
F 0 "#PWR?" H 1050 800 50  0001 C CNN
F 1 "+5V" H 1065 1123 50  0000 C CNN
F 2 "" H 1050 950 50  0001 C CNN
F 3 "" H 1050 950 50  0001 C CNN
	1    1050 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60B8AC18
P 1050 1250
F 0 "#PWR?" H 1050 1000 50  0001 C CNN
F 1 "GND" H 1055 1077 50  0000 C CNN
F 2 "" H 1050 1250 50  0001 C CNN
F 3 "" H 1050 1250 50  0001 C CNN
	1    1050 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  1000 900  950 
Wire Wire Line
	900  950  1050 950 
Wire Wire Line
	1200 950  1200 1000
Wire Wire Line
	900  1200 900  1250
Wire Wire Line
	900  1250 1050 1250
Wire Wire Line
	1200 1250 1200 1200
Connection ~ 1050 1250
Wire Wire Line
	1050 1250 1200 1250
Connection ~ 1050 950 
Wire Wire Line
	1050 950  1200 950 
$Comp
L Connector_Generic:Conn_02x08_Odd_Even J?
U 1 1 60B91E9D
P 1200 2600
F 0 "J?" H 1250 3117 50  0000 C CNN
F 1 "ADDR_BUS" H 1250 3026 50  0000 C CNN
F 2 "" H 1200 2600 50  0001 C CNN
F 3 "~" H 1200 2600 50  0001 C CNN
	1    1200 2600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J?
U 1 1 60B93573
P 3450 2800
F 0 "J?" H 3530 2792 50  0000 L CNN
F 1 "Conn_01x08" H 3530 2701 50  0000 L CNN
F 2 "" H 3450 2800 50  0001 C CNN
F 3 "~" H 3450 2800 50  0001 C CNN
	1    3450 2800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J?
U 1 1 60B95CD7
P 6350 2450
F 0 "J?" H 6400 3567 50  0000 C CNN
F 1 "Conn_02x20_Odd_Even" H 6400 3476 50  0000 C CNN
F 2 "" H 6350 2450 50  0001 C CNN
F 3 "~" H 6350 2450 50  0001 C CNN
	1    6350 2450
	1    0    0    -1  
$EndComp
$EndSCHEMATC
