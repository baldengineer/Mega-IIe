EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
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
L My_Library:AudioJack3_SwitchTR-Tensility_Pins J3
U 1 1 61EE4775
P 9900 3350
F 0 "J3" H 9900 2800 50  0000 R CNN
F 1 "Ears" H 9950 2900 50  0000 R CNN
F 2 "Connector_Audio:Jack_3.5mm_PJ311_Horizontal" H 9900 3350 50  0001 C CNN
F 3 "https://tensility.s3.amazonaws.com/uploads/pdffiles/54-00177.pdf?X-Amz-Expires=600&X-Amz-Date=20220124T060305Z&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIS2S4WRDQDSWDRZQ%2F20220124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-SignedHeaders=host&X-Amz-Signature=f29aa2fcc9e95073a664c3cd2871b5bf87d9725ad5d792b012eee0a99475bfa2" H 9900 3350 50  0001 C CNN
F 4 "Tensility International Corp" H 9900 3350 50  0001 C CNN "MFG"
F 5 "54-00178" H 9900 3350 50  0001 C CNN "MPN"
	1    9900 3350
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 61EE5A2B
P 8550 3500
F 0 "J2" H 8550 3600 50  0000 C CNN
F 1 "SPKR" H 8550 3300 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8550 3500 50  0001 C CNN
F 3 "~" H 8550 3500 50  0001 C CNN
	1    8550 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 3500 8350 3500
Wire Wire Line
	8250 3600 8350 3600
$Comp
L power:GND #PWR0101
U 1 1 61EE749C
P 6500 7400
F 0 "#PWR0101" H 6500 7150 50  0001 C CNN
F 1 "GND" H 6505 7227 50  0000 C CNN
F 2 "" H 6500 7400 50  0001 C CNN
F 3 "" H 6500 7400 50  0001 C CNN
	1    6500 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 7400 6500 7300
Wire Wire Line
	6500 7300 6650 7300
Text Label 6650 7300 2    50   ~ 0
GND
$Comp
L Connector:TestPoint TP1
U 1 1 61EEE762
P 2950 1350
F 0 "TP1" H 3008 1468 50  0001 L CNN
F 1 "EAR" H 3008 1422 50  0000 L CNN
F 2 "My Libraries:Harwin-S1751-46-Test-Point" H 3150 1350 50  0001 C CNN
F 3 "~" H 3150 1350 50  0001 C CNN
	1    2950 1350
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 61EEEDA4
P 3350 1350
F 0 "TP2" H 3408 1468 50  0001 L CNN
F 1 "SPKR" H 3408 1422 50  0000 L CNN
F 2 "My Libraries:Harwin-S1751-46-Test-Point" H 3550 1350 50  0001 C CNN
F 3 "~" H 3550 1350 50  0001 C CNN
	1    3350 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1350 2950 1450
Wire Wire Line
	2950 1450 3200 1450
Wire Wire Line
	3350 1350 3350 1450
Wire Wire Line
	3350 1450 3600 1450
Text Label 3200 1450 2    50   ~ 0
EAR
$Comp
L Connector:TestPoint TP3
U 1 1 61EF12C7
P 3750 1350
F 0 "TP3" H 3808 1468 50  0001 L CNN
F 1 "WOZ_AUD" H 3808 1422 50  0000 L CNN
F 2 "My Libraries:Harwin-S1751-46-Test-Point" H 3950 1350 50  0001 C CNN
F 3 "~" H 3950 1350 50  0001 C CNN
	1    3750 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 1350 3750 1450
$Comp
L Device:C_Small C3
U 1 1 61EF2A80
P 7500 2600
F 0 "C3" H 7592 2646 50  0000 L CNN
F 1 "1u" H 7592 2555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 7500 2600 50  0001 C CNN
F 3 "~" H 7500 2600 50  0001 C CNN
	1    7500 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 61EF329B
P 7250 4150
F 0 "#PWR0102" H 7250 3900 50  0001 C CNN
F 1 "GND" H 7255 3977 50  0000 C CNN
F 2 "" H 7250 4150 50  0001 C CNN
F 3 "" H 7250 4150 50  0001 C CNN
	1    7250 4150
	1    0    0    -1  
$EndComp
$Comp
L gd-audio-proto-pcb-rescue:LM4875-My_Library U2
U 1 1 61F4F362
P 7250 3450
F 0 "U2" H 6700 4050 50  0000 C CNN
F 1 "LM4875" H 6800 3950 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 6600 3900 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/lm4875.pdf" H 6600 3900 50  0001 C CNN
	1    7250 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 2250 7250 2400
Wire Wire Line
	7500 2400 7500 2500
$Comp
L power:GND #PWR0103
U 1 1 61F523B9
P 7500 2750
F 0 "#PWR0103" H 7500 2500 50  0001 C CNN
F 1 "GND" H 7505 2577 50  0000 C CNN
F 2 "" H 7500 2750 50  0001 C CNN
F 3 "" H 7500 2750 50  0001 C CNN
	1    7500 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 2700 7500 2750
$Comp
L power:+5V #PWR0104
U 1 1 61F537D9
P 7250 2250
F 0 "#PWR0104" H 7250 2100 50  0001 C CNN
F 1 "+5V" H 7265 2423 50  0000 C CNN
F 2 "" H 7250 2250 50  0001 C CNN
F 3 "" H 7250 2250 50  0001 C CNN
	1    7250 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 4100 7250 4150
Wire Wire Line
	6500 3150 6300 3150
$Comp
L Device:C_Small C1
U 1 1 61F55CAF
P 6200 3150
F 0 "C1" V 6450 3150 50  0000 L CNN
F 1 "220n" V 6350 3050 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 6200 3150 50  0001 C CNN
F 3 "~" H 6200 3150 50  0001 C CNN
	1    6200 3150
	0    -1   -1   0   
$EndComp
Text Label 5700 3150 0    50   ~ 0
WOZ_AUD
Wire Wire Line
	5700 3150 6100 3150
$Comp
L Device:C_Small C2
U 1 1 61F59587
P 6200 3750
F 0 "C2" H 6292 3796 50  0000 L CNN
F 1 "1u" H 6292 3705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 6200 3750 50  0001 C CNN
F 3 "~" H 6200 3750 50  0001 C CNN
	1    6200 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3650 6200 3650
$Comp
L power:GND #PWR0105
U 1 1 61F5B253
P 6200 3850
F 0 "#PWR0105" H 6200 3600 50  0001 C CNN
F 1 "GND" H 6205 3677 50  0000 C CNN
F 2 "" H 6200 3850 50  0001 C CNN
F 3 "" H 6200 3850 50  0001 C CNN
	1    6200 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3900 6450 3900
Wire Wire Line
	6450 3900 6450 4300
Wire Wire Line
	6450 4300 6100 4300
$Comp
L My_Library:R_0805 R2
U 1 1 61F5C9DB
P 6000 4300
F 0 "R2" V 5804 4300 50  0000 C CNN
F 1 "100k" V 5895 4300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 6000 4300 50  0001 C CNN
F 3 "~" H 6000 4300 50  0001 C CNN
	1    6000 4300
	0    1    1    0   
$EndComp
$Comp
L My_Library:R_0805 R1
U 1 1 61F5D665
P 5700 4000
F 0 "R1" H 5550 4050 50  0000 C CNN
F 1 "100k" H 5550 3950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 5700 4000 50  0001 C CNN
F 3 "~" H 5700 4000 50  0001 C CNN
	1    5700 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 4100 5700 4300
Wire Wire Line
	5700 4300 5900 4300
Wire Wire Line
	5700 3900 5700 3850
$Comp
L power:+5V #PWR0106
U 1 1 61F5F98F
P 5700 3850
F 0 "#PWR0106" H 5700 3700 50  0001 C CNN
F 1 "+5V" H 5715 4023 50  0000 C CNN
F 2 "" H 5700 3850 50  0001 C CNN
F 3 "" H 5700 3850 50  0001 C CNN
	1    5700 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 61F612C8
P 8600 3250
F 0 "C4" V 8800 3200 50  0000 L CNN
F 1 "100u" V 8700 3100 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3216-18_Kemet-A" H 8600 3250 50  0001 C CNN
F 3 "~" H 8600 3250 50  0001 C CNN
F 4 "T520A107M006ATE035" V 8600 3250 50  0001 C CNN "MPN"
	1    8600 3250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8000 3750 8250 3750
Wire Wire Line
	8250 3750 8250 3600
Wire Wire Line
	8250 3500 8250 3250
Connection ~ 8250 3250
Wire Wire Line
	8250 3250 8500 3250
Wire Wire Line
	8700 3250 9050 3250
$Comp
L My_Library:R_0805 R3
U 1 1 61F6891D
P 9050 3500
F 0 "R3" H 8950 3550 50  0000 C CNN
F 1 "150" H 8900 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 9050 3500 50  0001 C CNN
F 3 "~" H 9050 3500 50  0001 C CNN
	1    9050 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 3250 9050 3400
$Comp
L power:GND #PWR0107
U 1 1 61F6A26D
P 9050 3750
F 0 "#PWR0107" H 9050 3500 50  0001 C CNN
F 1 "GND" H 9055 3577 50  0000 C CNN
F 2 "" H 9050 3750 50  0001 C CNN
F 3 "" H 9050 3750 50  0001 C CNN
	1    9050 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 3600 9050 3700
Wire Wire Line
	5700 4500 5700 4300
Connection ~ 5700 4300
Wire Wire Line
	9700 3050 9300 3050
Wire Wire Line
	9300 3050 9300 2650
Wire Wire Line
	5700 4500 10350 4500
Wire Wire Line
	9300 2650 10350 2650
Wire Wire Line
	10350 2650 10350 4500
Wire Wire Line
	9700 3450 9300 3450
Wire Wire Line
	9300 3450 9300 3700
Wire Wire Line
	9300 3700 9050 3700
Connection ~ 9050 3700
Wire Wire Line
	9050 3700 9050 3750
Wire Wire Line
	9700 3150 9300 3150
Wire Wire Line
	9300 3150 9300 3250
Wire Wire Line
	9300 3250 9050 3250
Connection ~ 9050 3250
Wire Wire Line
	9700 3350 9300 3350
Wire Wire Line
	9300 3350 9300 3250
Connection ~ 9300 3250
Wire Wire Line
	6500 3350 5250 3350
Wire Wire Line
	7500 2400 7250 2400
Connection ~ 7250 2400
Wire Wire Line
	7250 2400 7250 2900
$Comp
L My_Library:MCP4541T U1
U 1 1 61FD4D4D
P 4850 3300
F 0 "U1" H 4825 3715 50  0000 C CNN
F 1 "MCP4541T" H 4825 3624 50  0000 C CNN
F 2 "Package_SO:MSOP-8_3x3mm_P0.65mm" H 4500 3600 50  0001 C CNN
F 3 "" H 4500 3600 50  0001 C CNN
	1    4850 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3250 3800 3250
Wire Wire Line
	4400 3350 3800 3350
Text Label 3800 3250 0    50   ~ 0
AUD_SCL
Text Label 3800 3350 0    50   ~ 0
AUD_SDA
$Comp
L power:GND #PWR0108
U 1 1 61FD824E
P 4300 3500
F 0 "#PWR0108" H 4300 3250 50  0001 C CNN
F 1 "GND" H 4305 3327 50  0000 C CNN
F 2 "" H 4300 3500 50  0001 C CNN
F 3 "" H 4300 3500 50  0001 C CNN
	1    4300 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3450 4300 3450
Wire Wire Line
	4300 3450 4300 3500
$Comp
L power:+5V #PWR0109
U 1 1 61FD9A36
P 5350 3050
F 0 "#PWR0109" H 5350 2900 50  0001 C CNN
F 1 "+5V" H 5365 3223 50  0000 C CNN
F 2 "" H 5350 3050 50  0001 C CNN
F 3 "" H 5350 3050 50  0001 C CNN
	1    5350 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 3050 5350 3150
Wire Wire Line
	5350 3150 5250 3150
Wire Wire Line
	5250 3250 5350 3250
Wire Wire Line
	5350 3250 5350 3150
Connection ~ 5350 3150
$Comp
L power:GND #PWR0110
U 1 1 61FDC0F5
P 5350 3500
F 0 "#PWR0110" H 5350 3250 50  0001 C CNN
F 1 "GND" H 5355 3327 50  0000 C CNN
F 2 "" H 5350 3500 50  0001 C CNN
F 3 "" H 5350 3500 50  0001 C CNN
	1    5350 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 3450 5350 3450
Wire Wire Line
	5350 3450 5350 3500
Wire Wire Line
	8000 3250 8100 3250
$Comp
L My_Library:R_0805 RNP1
U 1 1 61FE05AC
P 8100 3450
F 0 "RNP1" H 8000 3550 50  0000 C CNN
F 1 "1k" H 8000 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 8100 3450 50  0001 C CNN
F 3 "~" H 8100 3450 50  0001 C CNN
	1    8100 3450
	1    0    0    -1  
$EndComp
Connection ~ 8100 3250
Wire Wire Line
	8100 3250 8250 3250
Wire Wire Line
	8100 3250 8100 3350
$Comp
L power:GND #PWR0111
U 1 1 61FE2E1D
P 8100 3600
F 0 "#PWR0111" H 8100 3350 50  0001 C CNN
F 1 "GND" H 8105 3427 50  0001 C CNN
F 2 "" H 8100 3600 50  0001 C CNN
F 3 "" H 8100 3600 50  0001 C CNN
	1    8100 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 3550 8100 3600
Text Notes 7950 4150 0    50   ~ 0
RNP is for external drain\nresistor for 100uF cap.
Wire Wire Line
	2500 3400 3100 3400
Wire Wire Line
	2500 3300 3100 3300
Text Label 3100 3400 2    50   ~ 0
AUD_SCL
Text Label 3100 3300 2    50   ~ 0
AUD_SDA
$Comp
L Connector_Generic:Conn_01x05 J1
U 1 1 61FE9FA4
P 2300 3300
F 0 "J1" H 2300 3750 50  0000 C CNN
F 1 "Vol I2C" H 2300 3650 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 2300 3300 50  0001 C CNN
F 3 "~" H 2300 3300 50  0001 C CNN
	1    2300 3300
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 61FEAB69
P 2550 3550
F 0 "#PWR0112" H 2550 3300 50  0001 C CNN
F 1 "GND" H 2555 3377 50  0000 C CNN
F 2 "" H 2550 3550 50  0001 C CNN
F 3 "" H 2550 3550 50  0001 C CNN
	1    2550 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 3500 2550 3500
Wire Wire Line
	2550 3500 2550 3550
Text Label 3100 3200 2    50   ~ 0
WOZ_AUD
Wire Wire Line
	2500 3200 3100 3200
Text Label 4200 3150 0    50   ~ 0
GND
Wire Wire Line
	4200 3150 4400 3150
Text Label 4150 1450 2    50   ~ 0
WOZ_AUD
Wire Wire Line
	3750 1450 4150 1450
Text Label 8300 3250 0    50   ~ 0
SPKR
Text Label 3600 1450 2    50   ~ 0
SPKR
Text Label 9250 3250 2    50   ~ 0
EAR
Text Label 6800 4500 2    50   ~ 0
Sense
$Comp
L Connector:TestPoint TP4
U 1 1 620032F6
P 4350 1350
F 0 "TP4" H 4408 1468 50  0001 L CNN
F 1 "Sense" H 4408 1422 50  0000 L CNN
F 2 "My Libraries:Harwin-S1751-46-Test-Point" H 4550 1350 50  0001 C CNN
F 3 "~" H 4550 1350 50  0001 C CNN
	1    4350 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 1350 4350 1450
Wire Wire Line
	4350 1450 4600 1450
Text Label 4600 1450 2    50   ~ 0
Sense
$Comp
L Connector:TestPoint TP5
U 1 1 620126A5
P 4800 1350
F 0 "TP5" H 4858 1468 50  0001 L CNN
F 1 "DC_Vol" H 4858 1422 50  0000 L CNN
F 2 "My Libraries:Harwin-S1751-46-Test-Point" H 5000 1350 50  0001 C CNN
F 3 "~" H 5000 1350 50  0001 C CNN
	1    4800 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 1350 4800 1450
Wire Wire Line
	4800 1450 5100 1450
Text Label 5100 1450 2    50   ~ 0
DC_Vol
Text Label 6000 3350 2    50   ~ 0
DC_Vol
$Comp
L My_Library:MountingHole_M2.5_Screw H4
U 1 1 61F59FE9
P 9050 2050
F 0 "H4" H 9150 2096 50  0000 L CNN
F 1 "MountingHole_M2.5_Screw" H 9150 2005 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 9050 2050 50  0001 C CNN
F 3 "~" H 9050 2050 50  0001 C CNN
	1    9050 2050
	1    0    0    -1  
$EndComp
$Comp
L My_Library:MountingHole_M2.5_Screw H3
U 1 1 61F5A4A6
P 9050 1850
F 0 "H3" H 9150 1896 50  0000 L CNN
F 1 "MountingHole_M2.5_Screw" H 9150 1805 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 9050 1850 50  0001 C CNN
F 3 "~" H 9050 1850 50  0001 C CNN
	1    9050 1850
	1    0    0    -1  
$EndComp
$Comp
L My_Library:MountingHole_M2.5_Screw H2
U 1 1 61F5A74C
P 9050 1650
F 0 "H2" H 9150 1696 50  0000 L CNN
F 1 "MountingHole_M2.5_Screw" H 9150 1605 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 9050 1650 50  0001 C CNN
F 3 "~" H 9050 1650 50  0001 C CNN
	1    9050 1650
	1    0    0    -1  
$EndComp
$Comp
L My_Library:MountingHole_M2.5_Screw H1
U 1 1 61F5A9E4
P 9050 1450
F 0 "H1" H 9150 1496 50  0000 L CNN
F 1 "MountingHole_M2.5_Screw" H 9150 1405 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 9050 1450 50  0001 C CNN
F 3 "~" H 9050 1450 50  0001 C CNN
	1    9050 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0113
U 1 1 61F6ECBB
P 9650 3250
F 0 "#PWR0113" H 9650 3100 50  0001 C CNN
F 1 "+5V" H 9665 3423 50  0000 C CNN
F 2 "" H 9650 3250 50  0001 C CNN
F 3 "" H 9650 3250 50  0001 C CNN
	1    9650 3250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9650 3250 9700 3250
Wire Wire Line
	2500 3100 3100 3100
Text Label 3100 3100 2    50   ~ 0
Sense
$EndSCHEMATC
