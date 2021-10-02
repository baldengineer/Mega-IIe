EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "ROM Interpose Board"
Date "2021-06-16"
Rev "1"
Comp "Bald Engineer Live"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x12_Counter_Clockwise J1
U 1 1 60CA1963
P 3850 3650
F 0 "J1" H 3900 4367 50  0000 C CNN
F 1 "IIe-Socket" H 3900 4276 50  0000 C CNN
F 2 "Package_DIP:DIP-24_W15.24mm" H 3850 3650 50  0001 C CNN
F 3 "~" H 3850 3650 50  0001 C CNN
	1    3850 3650
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x12_Counter_Clockwise J2
U 1 1 60CA2532
P 5550 3650
F 0 "J2" H 5600 4367 50  0000 C CNN
F 1 "ROM-Socket" H 5600 4276 50  0000 C CNN
F 2 "Package_DIP:DIP-24_W15.24mm" H 5550 3650 50  0001 C CNN
F 3 "~" H 5550 3650 50  0001 C CNN
	1    5550 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3350 4500 3350
Wire Wire Line
	4150 3550 4500 3550
Wire Wire Line
	4150 3650 4500 3650
Wire Wire Line
	4150 3750 4500 3750
Wire Wire Line
	4150 3850 4500 3850
Wire Wire Line
	4150 3950 4500 3950
Wire Wire Line
	4150 4050 4500 4050
Wire Wire Line
	4150 4150 4500 4150
Wire Wire Line
	4150 4250 4500 4250
Wire Wire Line
	3300 3150 3650 3150
Wire Wire Line
	3300 3250 3650 3250
Wire Wire Line
	3300 3350 3650 3350
Wire Wire Line
	3300 3450 3650 3450
Wire Wire Line
	3300 3550 3650 3550
Wire Wire Line
	3300 3650 3650 3650
Wire Wire Line
	3300 3750 3650 3750
Wire Wire Line
	3300 3850 3650 3850
Wire Wire Line
	3300 3950 3650 3950
Wire Wire Line
	3300 4050 3650 4050
Wire Wire Line
	3300 4150 3650 4150
Wire Wire Line
	4150 3450 4500 3450
Wire Wire Line
	4150 3150 4500 3150
Wire Wire Line
	4150 3250 4500 3250
Text Label 3300 3150 0    50   ~ 0
Pin1
Text Label 3300 3250 0    50   ~ 0
Pin2
Text Label 3300 3350 0    50   ~ 0
Pin3
Text Label 3300 3450 0    50   ~ 0
Pin4
Text Label 3300 3550 0    50   ~ 0
Pin5
Text Label 3300 3650 0    50   ~ 0
Pin6
Text Label 3300 3750 0    50   ~ 0
Pin7
Text Label 3300 3850 0    50   ~ 0
Pin8
Text Label 3300 3950 0    50   ~ 0
Pin9
Text Label 3300 4050 0    50   ~ 0
Pin10
Text Label 3300 4150 0    50   ~ 0
Pin11
Wire Wire Line
	3650 4250 3300 4250
Text Label 3300 4250 0    50   ~ 0
Pin12
Text Label 4500 4250 2    50   ~ 0
Pin13
Text Label 4500 4150 2    50   ~ 0
Pin14
Text Label 4500 4050 2    50   ~ 0
Pin15
Text Label 4500 3950 2    50   ~ 0
Pin16
Text Label 4500 3850 2    50   ~ 0
Pin17
Text Label 4500 3750 2    50   ~ 0
Pin18
Text Label 4500 3650 2    50   ~ 0
Pin19
Text Label 4500 3550 2    50   ~ 0
Pin20
Text Label 4500 3450 2    50   ~ 0
Pin21
Text Label 4500 3350 2    50   ~ 0
Pin22
Text Label 4500 3250 2    50   ~ 0
Pin23
Text Label 4500 3150 2    50   ~ 0
Pin24
Wire Wire Line
	5850 3350 6200 3350
Wire Wire Line
	5850 3550 6200 3550
Wire Wire Line
	5850 3650 6200 3650
Wire Wire Line
	5850 3750 6200 3750
Wire Wire Line
	5850 3850 6200 3850
Wire Wire Line
	5850 3950 6200 3950
Wire Wire Line
	5850 4050 6200 4050
Wire Wire Line
	5850 4150 6200 4150
Wire Wire Line
	5850 4250 6200 4250
Wire Wire Line
	5850 3450 6200 3450
Wire Wire Line
	5850 3150 6200 3150
Wire Wire Line
	5850 3250 6200 3250
Text Label 6200 4250 2    50   ~ 0
Pin13
Text Label 6200 4150 2    50   ~ 0
Pin14
Text Label 6200 4050 2    50   ~ 0
Pin15
Text Label 6200 3950 2    50   ~ 0
Pin16
Text Label 6200 3850 2    50   ~ 0
Pin17
Text Label 6200 3750 2    50   ~ 0
Pin18
Text Label 6200 3650 2    50   ~ 0
Pin19
Text Label 6200 3550 2    50   ~ 0
Pin20
Text Label 6200 3450 2    50   ~ 0
Pin21
Text Label 6200 3350 2    50   ~ 0
Pin22
Text Label 6200 3250 2    50   ~ 0
Pin23
Text Label 6200 3150 2    50   ~ 0
Pin24
Wire Wire Line
	5000 3150 5350 3150
Wire Wire Line
	5000 3250 5350 3250
Wire Wire Line
	5000 3350 5350 3350
Wire Wire Line
	5000 3450 5350 3450
Wire Wire Line
	5000 3550 5350 3550
Wire Wire Line
	5000 3650 5350 3650
Wire Wire Line
	5000 3750 5350 3750
Wire Wire Line
	5000 3850 5350 3850
Wire Wire Line
	5000 3950 5350 3950
Wire Wire Line
	5000 4050 5350 4050
Wire Wire Line
	5000 4150 5350 4150
Text Label 5000 3150 0    50   ~ 0
Pin1
Text Label 5000 3250 0    50   ~ 0
Pin2
Text Label 5000 3350 0    50   ~ 0
Pin3
Text Label 5000 3450 0    50   ~ 0
Pin4
Text Label 5000 3550 0    50   ~ 0
Pin5
Text Label 5000 3650 0    50   ~ 0
Pin6
Text Label 5000 3750 0    50   ~ 0
Pin7
Text Label 5000 3850 0    50   ~ 0
Pin8
Text Label 5000 3950 0    50   ~ 0
Pin9
Text Label 5000 4050 0    50   ~ 0
Pin10
Text Label 5000 4150 0    50   ~ 0
Pin11
Wire Wire Line
	5350 4250 5000 4250
Text Label 5000 4250 0    50   ~ 0
Pin12
$Comp
L Connector_Generic:Conn_01x12 J3
U 1 1 60CF0DB1
P 3750 5000
F 0 "J3" H 3700 4300 50  0000 L CNN
F 1 "Conn_01x12" H 3350 4200 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 3750 5000 50  0001 C CNN
F 3 "~" H 3750 5000 50  0001 C CNN
	1    3750 5000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x12 J4
U 1 1 60CF250F
P 4000 5000
F 0 "J4" H 4000 4300 50  0000 C CNN
F 1 "Conn_01x12" H 3850 4200 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 4000 5000 50  0001 C CNN
F 3 "~" H 4000 5000 50  0001 C CNN
	1    4000 5000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3200 4500 3550 4500
Wire Wire Line
	3200 4600 3550 4600
Wire Wire Line
	3200 4700 3550 4700
Wire Wire Line
	3200 4800 3550 4800
Wire Wire Line
	3200 4900 3550 4900
Wire Wire Line
	3200 5000 3550 5000
Wire Wire Line
	3200 5100 3550 5100
Wire Wire Line
	3200 5200 3550 5200
Wire Wire Line
	3200 5300 3550 5300
Wire Wire Line
	3200 5400 3550 5400
Wire Wire Line
	3200 5500 3550 5500
Text Label 3200 4500 0    50   ~ 0
Pin1
Text Label 3200 4600 0    50   ~ 0
Pin2
Text Label 3200 4700 0    50   ~ 0
Pin3
Text Label 3200 4800 0    50   ~ 0
Pin4
Text Label 3200 4900 0    50   ~ 0
Pin5
Text Label 3200 5000 0    50   ~ 0
Pin6
Text Label 3200 5100 0    50   ~ 0
Pin7
Text Label 3200 5200 0    50   ~ 0
Pin8
Text Label 3200 5300 0    50   ~ 0
Pin9
Text Label 3200 5400 0    50   ~ 0
Pin10
Text Label 3200 5500 0    50   ~ 0
Pin11
Wire Wire Line
	3550 5600 3200 5600
Text Label 3200 5600 0    50   ~ 0
Pin12
Wire Wire Line
	4200 4700 4550 4700
Wire Wire Line
	4200 4900 4550 4900
Wire Wire Line
	4200 5000 4550 5000
Wire Wire Line
	4200 5100 4550 5100
Wire Wire Line
	4200 5200 4550 5200
Wire Wire Line
	4200 5300 4550 5300
Wire Wire Line
	4200 5400 4550 5400
Wire Wire Line
	4200 5500 4550 5500
Wire Wire Line
	4200 5600 4550 5600
Wire Wire Line
	4200 4800 4550 4800
Wire Wire Line
	4200 4500 4550 4500
Wire Wire Line
	4200 4600 4550 4600
Text Label 4550 5600 2    50   ~ 0
Pin13
Text Label 4550 5500 2    50   ~ 0
Pin14
Text Label 4550 5400 2    50   ~ 0
Pin15
Text Label 4550 5300 2    50   ~ 0
Pin16
Text Label 4550 5200 2    50   ~ 0
Pin17
Text Label 4550 5100 2    50   ~ 0
Pin18
Text Label 4550 5000 2    50   ~ 0
Pin19
Text Label 4550 4900 2    50   ~ 0
Pin20
Text Label 4550 4800 2    50   ~ 0
Pin21
Text Label 4550 4700 2    50   ~ 0
Pin22
Text Label 4550 4600 2    50   ~ 0
Pin23
Text Label 4550 4500 2    50   ~ 0
Pin24
$EndSCHEMATC
