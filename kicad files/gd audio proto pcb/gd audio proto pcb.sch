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
L Connector:AudioJack3_SwitchTR J?
U 1 1 61EE4775
P 5500 2550
F 0 "J?" H 5220 2475 50  0000 R CNN
F 1 "AudioJack3_SwitchTR" H 5220 2384 50  0000 R CNN
F 2 "Connector_Audio:Jack_3.5mm_PJ311_Horizontal" H 5500 2550 50  0001 C CNN
F 3 "https://tensility.s3.amazonaws.com/uploads/pdffiles/54-00177.pdf?X-Amz-Expires=600&X-Amz-Date=20220124T060305Z&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIS2S4WRDQDSWDRZQ%2F20220124%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-SignedHeaders=host&X-Amz-Signature=f29aa2fcc9e95073a664c3cd2871b5bf87d9725ad5d792b012eee0a99475bfa2" H 5500 2550 50  0001 C CNN
F 4 "Tensility International Corp" H 5500 2550 50  0001 C CNN "MFG"
F 5 "54-00178" H 5500 2550 50  0001 C CNN "MPN"
	1    5500 2550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5300 2450 5000 2450
Text Label 5000 2450 0    50   ~ 0
GND
Wire Wire Line
	5300 2550 5000 2550
Wire Wire Line
	5300 2650 5000 2650
Wire Wire Line
	5300 2750 5000 2750
Wire Wire Line
	5300 2850 5000 2850
Text Label 5000 2550 0    50   ~ 0
EAR1
Text Label 5000 2750 0    50   ~ 0
EAR2
Text Label 5000 2650 0    50   ~ 0
SPKR
Text Label 5000 2850 0    50   ~ 0
SPKR
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 61EE5A2B
P 5150 3300
F 0 "J?" H 5068 3517 50  0000 C CNN
F 1 "SPKR" H 5068 3426 50  0000 C CNN
F 2 "" H 5150 3300 50  0001 C CNN
F 3 "~" H 5150 3300 50  0001 C CNN
	1    5150 3300
	-1   0    0    -1  
$EndComp
Text Label 5600 3300 2    50   ~ 0
SPKR
Wire Wire Line
	5600 3300 5350 3300
Text Label 5600 3400 2    50   ~ 0
GND
Wire Wire Line
	5600 3400 5350 3400
$Comp
L Device:Q_NPN_CBE Q?
U 1 1 61EE65E9
P 3650 2600
F 0 "Q?" H 3841 2646 50  0000 L CNN
F 1 "BC817_CHECK FOOTPRINT" H 3841 2555 50  0000 L CNN
F 2 "" H 3850 2700 50  0001 C CNN
F 3 "~" H 3650 2600 50  0001 C CNN
	1    3650 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61EE6E9F
P 3750 2850
F 0 "#PWR?" H 3750 2600 50  0001 C CNN
F 1 "GND" H 3755 2677 50  0000 C CNN
F 2 "" H 3750 2850 50  0001 C CNN
F 3 "" H 3750 2850 50  0001 C CNN
	1    3750 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 2800 3750 2850
$Comp
L power:GND #PWR?
U 1 1 61EE749C
P 1850 3550
F 0 "#PWR?" H 1850 3300 50  0001 C CNN
F 1 "GND" H 1855 3377 50  0000 C CNN
F 2 "" H 1850 3550 50  0001 C CNN
F 3 "" H 1850 3550 50  0001 C CNN
	1    1850 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 3550 1850 3450
Wire Wire Line
	1850 3450 2000 3450
Text Label 2000 3450 2    50   ~ 0
GND
Text Label 3750 2200 3    50   ~ 0
SPKR
Wire Wire Line
	3750 2200 3750 2400
Wire Wire Line
	3450 2600 3350 2600
$Comp
L My_Library:R_0805 R?
U 1 1 61EE808A
P 3250 2600
F 0 "R?" V 3054 2600 50  0000 C CNN
F 1 "R_0805" V 3145 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3250 2600 50  0001 C CNN
F 3 "~" H 3250 2600 50  0001 C CNN
	1    3250 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	2800 2600 3150 2600
Text Label 2800 2600 0    50   ~ 0
PWM_IN
$Comp
L Connector:TestPoint TP?
U 1 1 61EEE762
P 4500 1700
F 0 "TP?" H 4558 1818 50  0001 L CNN
F 1 "EAR1" H 4558 1772 50  0000 L CNN
F 2 "My Libraries:Harwin-S1751-46-Test-Point" H 4700 1700 50  0001 C CNN
F 3 "~" H 4700 1700 50  0001 C CNN
	1    4500 1700
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 61EEEDA4
P 4900 1700
F 0 "TP?" H 4958 1818 50  0001 L CNN
F 1 "EAR2" H 4958 1772 50  0000 L CNN
F 2 "My Libraries:Harwin-S1751-46-Test-Point" H 5100 1700 50  0001 C CNN
F 3 "~" H 5100 1700 50  0001 C CNN
	1    4900 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 1700 4500 1800
Wire Wire Line
	4500 1800 4750 1800
Wire Wire Line
	4900 1700 4900 1800
Wire Wire Line
	4900 1800 5150 1800
Text Label 4750 1800 2    50   ~ 0
EAR1
Text Label 5150 1800 2    50   ~ 0
EAR2
$Comp
L Connector:TestPoint TP?
U 1 1 61EF02ED
P 3950 1700
F 0 "TP?" H 4008 1818 50  0001 L CNN
F 1 "PWM_IN" H 4008 1772 50  0000 L CNN
F 2 "My Libraries:Harwin-S1751-46-Test-Point" H 4150 1700 50  0001 C CNN
F 3 "~" H 4150 1700 50  0001 C CNN
	1    3950 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 1700 3950 1800
Wire Wire Line
	3950 1800 4300 1800
Text Label 4300 1800 2    50   ~ 0
PWM_IN
$Comp
L Connector:TestPoint TP?
U 1 1 61EF12C7
P 5300 1700
F 0 "TP?" H 5358 1818 50  0001 L CNN
F 1 "SPKR" H 5358 1772 50  0000 L CNN
F 2 "My Libraries:Harwin-S1751-46-Test-Point" H 5500 1700 50  0001 C CNN
F 3 "~" H 5500 1700 50  0001 C CNN
	1    5300 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 1700 5300 1800
Wire Wire Line
	5300 1800 5550 1800
Text Label 5550 1800 2    50   ~ 0
SPKR
$Comp
L Amplifier_Audio:LM386 U?
U 1 1 61EF1AC4
P 8100 2800
F 0 "U?" H 8250 2950 50  0000 L CNN
F 1 "LM386" H 8300 2700 50  0000 L CNN
F 2 "" H 8200 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm386.pdf" H 8300 3000 50  0001 C CNN
	1    8100 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61EF218B
P 7250 2700
F 0 "C?" V 7479 2700 50  0000 C CNN
F 1 "C_Small" V 7388 2700 50  0000 C CNN
F 2 "" H 7250 2700 50  0001 C CNN
F 3 "~" H 7250 2700 50  0001 C CNN
	1    7250 2700
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61EF2A80
P 7500 2200
F 0 "C?" H 7592 2246 50  0000 L CNN
F 1 "C_Small" H 7592 2155 50  0000 L CNN
F 2 "" H 7500 2200 50  0001 C CNN
F 3 "~" H 7500 2200 50  0001 C CNN
	1    7500 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61EF2EC0
P 7500 2300
F 0 "#PWR?" H 7500 2050 50  0001 C CNN
F 1 "GND" H 7505 2127 50  0000 C CNN
F 2 "" H 7500 2300 50  0001 C CNN
F 3 "" H 7500 2300 50  0001 C CNN
	1    7500 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61EF329B
P 7800 2900
F 0 "#PWR?" H 7800 2650 50  0001 C CNN
F 1 "GND" H 7805 2727 50  0000 C CNN
F 2 "" H 7800 2900 50  0001 C CNN
F 3 "" H 7800 2900 50  0001 C CNN
	1    7800 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61EF353D
P 8100 3500
F 0 "C?" H 7850 3550 50  0000 L CNN
F 1 "C_Small" H 7650 3450 50  0000 L CNN
F 2 "" H 8100 3500 50  0001 C CNN
F 3 "~" H 8100 3500 50  0001 C CNN
	1    8100 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 3100 8100 3400
Wire Wire Line
	8100 3600 8100 3750
Wire Wire Line
	8100 3750 8200 3750
Wire Wire Line
	8200 3750 8200 3100
Wire Wire Line
	8400 2800 8700 2800
$Comp
L Device:C_Small C?
U 1 1 61EF48D6
P 8800 2800
F 0 "C?" V 9029 2800 50  0000 C CNN
F 1 "C_Small" V 8938 2800 50  0000 C CNN
F 2 "" H 8800 2800 50  0001 C CNN
F 3 "~" H 8800 2800 50  0001 C CNN
	1    8800 2800
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 61EF5056
P 9200 2900
F 0 "J?" H 9118 2575 50  0000 C CNN
F 1 "SPKR" H 9118 2666 50  0000 C CNN
F 2 "" H 9200 2900 50  0001 C CNN
F 3 "~" H 9200 2900 50  0001 C CNN
	1    9200 2900
	1    0    0    1   
$EndComp
Wire Wire Line
	9000 2800 8900 2800
$Comp
L power:GND #PWR?
U 1 1 61EF5A9C
P 8950 2950
F 0 "#PWR?" H 8950 2700 50  0001 C CNN
F 1 "GND" H 8955 2777 50  0000 C CNN
F 2 "" H 8950 2950 50  0001 C CNN
F 3 "" H 8950 2950 50  0001 C CNN
	1    8950 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 2900 8950 2900
Wire Wire Line
	8950 2900 8950 2950
$Comp
L power:+VSW #PWR?
U 1 1 61EF6BDE
P 8000 2000
F 0 "#PWR?" H 8000 1850 50  0001 C CNN
F 1 "+VSW" H 8015 2173 50  0000 C CNN
F 2 "" H 8000 2000 50  0001 C CNN
F 3 "" H 8000 2000 50  0001 C CNN
	1    8000 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 2000 8000 2500
Wire Wire Line
	7500 2100 7500 2000
Wire Wire Line
	7500 2000 8000 2000
Connection ~ 8000 2000
Wire Wire Line
	7350 2700 7800 2700
$Comp
L power:GND #PWR?
U 1 1 61EF8977
P 8000 3100
F 0 "#PWR?" H 8000 2850 50  0001 C CNN
F 1 "GND" H 8005 2927 50  0000 C CNN
F 2 "" H 8000 3100 50  0001 C CNN
F 3 "" H 8000 3100 50  0001 C CNN
	1    8000 3100
	1    0    0    -1  
$EndComp
$EndSCHEMATC
