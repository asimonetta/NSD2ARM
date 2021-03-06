10 REM Demo program for routine drawText() 
20 REM Asks the user to enter a text, a wanted text height and colour, 
30 REM and then draws this string onto the turtle screen. Places every 
40 REM entered text to a new line. 
50 REM Generated by Structorizer 3.30-11 
60 
70 REM Copyright (C) 2019-10-10 Kay Gürtzig 
80 REM License: GPLv3-link 
90 REM GNU General Public License (V 3) 
100 REM https://www.gnu.org/licenses/gpl.html 
110 REM http://www.gnu.de/documents/gpl.de.html 
120 
130 REM  
140 REM program TextDemo
150 REM TODO: add the respective type suffixes to your variable names if required 
160 PRINT "This is a demo program for text writing with Turleizer."
170 showTurtle()
180 penDown()
190 LET y = 0
200 DO
210   PRINT "Enter some text (empty string to exit)"; : INPUT text
220   REM Make sure the content is interpreted as string 
230   LET text = "" + text
240   IF text <> "" THEN
250     DO
260       PRINT "Height of the text (pixels)"; : INPUT height
270     LOOP UNTIL height >= 5
280     DO
290       PRINT "Colour (1=black, 2=red, 3=yellow, 4=green, 5=cyan, 6=blue, 7=pink, 8=gray, 9=orange, 10=violet)"; : INPUT colour
300     LOOP UNTIL colour >= 1 AND colour <= 10
310     LET y = y + height + 2
320     gotoXY(0, y - 2)
330     CALL drawText(text, height, colour)
340   END IF
350 LOOP UNTIL text = ""
360 gotoXY(0, y + 15)
370 CALL drawText("Thank you, bye.", 10, 4)
380 hideTurtle()
390 END
400 REM  
410 REM Draws a blank for font height h, ignoring the colorNo 
420 REM TODO: Add type-specific suffixes where necessary! 
430 SUB blank(h, colorNo)
440   REM TODO: add the respective type suffixes to your variable names if required 
450   LET width = h/2.0
460   penUp()
470   right(90)
480   forward(width) : REM color = ffffff
490   left(90)
500 END SUB
510 REM  
520 REM TODO: Add type-specific suffixes where necessary! 
530 SUB forward(len, color)
540   REM TODO: add the respective type suffixes to your variable names if required 
550   SELECT CASE color
560     CASE 1
570       forward(len) : REM color = ffffff
580     CASE 2
590       forward(len) : REM color = ff8080
600     CASE 3
610       forward(len) : REM color = ffff80
620     CASE 4
630       forward(len) : REM color = 80ff80
640     CASE 5
650       forward(len) : REM color = 80ffff
660     CASE 6
670       forward(len) : REM color = 0080ff
680     CASE 7
690       forward(len) : REM color = ff80c0
700     CASE 8
710       forward(len) : REM color = c0c0c0
720     CASE 9
730       forward(len) : REM color = ff8000
740     CASE 10
750       forward(len) : REM color = 8080ff
760   END SELECT
770 END SUB
780 REM  
790 REM Draws letter A in colour specified by colorNo with font height h 
800 REM from the current turtle position. 
810 REM TODO: Add type-specific suffixes where necessary! 
820 SUB letterA(h, colorNo)
830   REM TODO: add the respective type suffixes to your variable names if required 
840   LET width = h/2.0
850   LET hypo = sqrt(h*h + width*width/4.0)
860   LET rotAngle = toDegrees(atan(width/2.0/h))
870   right(rotAngle)
880   CALL forward(hypo/2.0, colorNo)
890   right(90 - rotAngle)
900   CALL forward(width/2.0, colorNo)
910   penUp()
920   backward(width/2.0) : REM color = ffffff
930   penDown()
940   left(90 - rotAngle)
950   CALL forward(hypo/2.0, colorNo)
960   left(2*rotAngle)
970   CALL forward(-hypo, colorNo)
980   right(rotAngle)
990 END SUB
1000 REM  
1010 REM Draws letter E in colour specified by colorNo with font height h 
1020 REM from the current turtle position. 
1030 REM TODO: Add type-specific suffixes where necessary! 
1040 SUB letterE(h, colorNo)
1050   REM TODO: add the respective type suffixes to your variable names if required 
1060   LET width = h/2.0
1070   CALL forward(h, colorNo)
1080   right(90)
1090   CALL forward(width, colorNo)
1100   right(90)
1110   penUp()
1120   forward(h/2.0) : REM color = ffffff
1130   right(90)
1140   penDown()
1150   CALL forward(width, colorNo)
1160   left(90)
1170   penUp()
1180   forward(h/2.0) : REM color = ffffff
1190   left(90)
1200   penDown()
1210   CALL forward(width, colorNo)
1220   left(90)
1230 END SUB
1240 REM  
1250 REM Draws letter F in colour specified by colorNo with font height h 
1260 REM from the current turtle position. 
1270 REM TODO: Add type-specific suffixes where necessary! 
1280 SUB letterF(h, colorNo)
1290   REM TODO: add the respective type suffixes to your variable names if required 
1300   LET width = h/2.0
1310   CALL forward(h, colorNo)
1320   right(90)
1330   CALL forward(width, colorNo)
1340   right(90)
1350   penUp()
1360   forward(h/2.0) : REM color = ffffff
1370   right(90)
1380   penDown()
1390   CALL forward(width, colorNo)
1400   left(90)
1410   penUp()
1420   forward(h/2.0) : REM color = ffffff
1430   left(90)
1440   forward(width) : REM color = ffffff
1450   penDown()
1460   left(90)
1470 END SUB
1480 REM  
1490 REM Draws letter H in colour specified by colorNo with font height h 
1500 REM from the current turtle position. 
1510 REM TODO: Add type-specific suffixes where necessary! 
1520 SUB letterH(h, colorNo)
1530   REM TODO: add the respective type suffixes to your variable names if required 
1540   LET width = h/2.0
1550   CALL forward(h, colorNo)
1560   penUp()
1570   right(90)
1580   forward(width) : REM color = ffffff
1590   right(90)
1600   penDown()
1610   CALL forward(h/2.0, colorNo)
1620   right(90)
1630   CALL forward(width, colorNo)
1640   penUp()
1650   backward(width) : REM color = ffffff
1660   left(90)
1670   penDown()
1680   CALL forward(h/2.0, colorNo)
1690   left(180)
1700 END SUB
1710 REM  
1720 REM Draws letter I in colour specified by colorNo with font height h 
1730 REM from the current turtle position. 
1740 REM TODO: Add type-specific suffixes where necessary! 
1750 SUB letterI(h, colorNo)
1760   REM TODO: add the respective type suffixes to your variable names if required 
1770   REM Octagon edge length 
1780   LET b = h * 0.5 / (sqrt(2.0) + 1)
1790   REM Cathetus of the corner triangle outside the octagon 
1800   LET c = b / sqrt(2.0)
1810   penUp()
1820   right(90)
1830   forward(c) : REM color = ffffff
1840   penDown()
1850   CALL forward(b, colorNo)
1860   penUp()
1870   backward(b/2.0) : REM color = ffffff
1880   left(90)
1890   penDown()
1900   CALL forward(h, colorNo)
1910   penUp()
1920   right(90)
1930   backward(b/2.0) : REM color = ffffff
1940   penDown()
1950   CALL forward(b, colorNo)
1960   penUp()
1970   forward(b/2 + c) : REM color = ffffff
1980   left(90)
1990   backward(h) : REM color = ffffff
2000   penDown()
2010 END SUB
2020 REM  
2030 REM Draws letter K in colour specified by colorNo with font height h 
2040 REM from the current turtle position. 
2050 REM TODO: Add type-specific suffixes where necessary! 
2060 SUB letterK(h, colorNo)
2070   REM TODO: add the respective type suffixes to your variable names if required 
2080   LET width = h/2.0
2090   LET diag = h/sqrt(2.0)
2100   CALL forward(h, colorNo)
2110   penUp()
2120   right(90)
2130   forward(width) : REM color = ffffff
2140   right(135)
2150   penDown()
2160   CALL forward(diag, colorNo)
2170   left(90)
2180   CALL forward(diag, colorNo)
2190   left(135)
2200 END SUB
2210 REM  
2220 REM Draws letter L in colour specified by colorNo with font height h 
2230 REM from the current turtle position. 
2240 REM TODO: Add type-specific suffixes where necessary! 
2250 SUB letterL(h, colorNo)
2260   REM TODO: add the respective type suffixes to your variable names if required 
2270   LET width = h/2.0
2280   CALL forward(h, colorNo)
2290   penUp()
2300   backward(h) : REM color = ffffff
2310   right(90)
2320   penDown()
2330   CALL forward(width, colorNo)
2340   left(90)
2350 END SUB
2360 REM  
2370 REM Draws letter M in colour specified by colorNo with font height h 
2380 REM from the current turtle position. 
2390 REM TODO: Add type-specific suffixes where necessary! 
2400 SUB letterM(h, colorNo)
2410   REM TODO: add the respective type suffixes to your variable names if required 
2420   LET width = h/2.0
2430   LET hypo = sqrt(width*width + h*h)/2.0
2440   LET rotAngle = toDegrees(atan(width/h))
2450   CALL forward(h, colorNo)
2460   left(rotAngle)
2470   CALL forward(-hypo, colorNo)
2480   right(2*rotAngle)
2490   CALL forward(hypo, colorNo)
2500   left(rotAngle)
2510   CALL forward(-h, colorNo)
2520 END SUB
2530 REM  
2540 REM Draws letter N in colour specified by colorNo with font height h 
2550 REM from the current turtle position. 
2560 REM TODO: Add type-specific suffixes where necessary! 
2570 SUB letterN(h, colorNo)
2580   REM TODO: add the respective type suffixes to your variable names if required 
2590   LET width = h/2.0
2600   LET hypo = sqrt(width*width + h*h)
2610   LET rotAngle = toDegrees(atan(width/h))
2620   CALL forward(h, colorNo)
2630   left(rotAngle)
2640   CALL forward(-hypo, colorNo)
2650   right(rotAngle)
2660   CALL forward(h, colorNo)
2670   penUp()
2680   backward(h) : REM color = ffffff
2690   penDown()
2700 END SUB
2710 REM  
2720 REM Draws letter T in colour specified by colorNo with font height h 
2730 REM from the current turtle position. 
2740 REM TODO: Add type-specific suffixes where necessary! 
2750 SUB letterT(h, colorNo)
2760   REM TODO: add the respective type suffixes to your variable names if required 
2770   LET width = h/2.0
2780   penUp()
2790   forward(h) : REM color = ffffff
2800   penDown()
2810   right(90)
2820   CALL forward(width, colorNo)
2830   penUp()
2840   backward(width/2.0) : REM color = ffffff
2850   penDown()
2860   right(90)
2870   CALL forward(h, colorNo)
2880   left(90)
2890   penUp()
2900   forward(width/2.0) : REM color = ffffff
2910   penDown()
2920   left(90)
2930 END SUB
2940 REM  
2950 REM Draws letter V in colour specified by colorNo with font height h 
2960 REM from the current turtle position. 
2970 REM TODO: Add type-specific suffixes where necessary! 
2980 SUB letterV(h, colorNo)
2990   REM TODO: add the respective type suffixes to your variable names if required 
3000   LET width = h/2.0
3010   LET hypo = sqrt(h*h + width*width/4.0)
3020   LET rotAngle = toDegrees(atan(width/2.0/h))
3030   penUp()
3040   forward(h) : REM color = ffffff
3050   left(rotAngle)
3060   penDown()
3070   CALL forward(-hypo, colorNo)
3080   right(2*rotAngle)
3090   CALL forward(hypo, colorNo)
3100   penUp()
3110   left(rotAngle)
3120   backward(h) : REM color = ffffff
3130   penDown()
3140 END SUB
3150 REM  
3160 REM Draws letter W in colour specified by colorNo with font height h 
3170 REM from the current turtle position. 
3180 REM TODO: Add type-specific suffixes where necessary! 
3190 SUB letterW(h, colorNo)
3200   REM TODO: add the respective type suffixes to your variable names if required 
3210   LET width = h/2.0
3220   LET width_3 = width/3.0
3230   LET hypo = sqrt(width_3*width_3 + h*h)
3240   LET rotAngle = toDegrees(atan(width_3/h))
3250   penUp()
3260   forward(h) : REM color = ffffff
3270   left(rotAngle)
3280   penDown()
3290   CALL forward(-hypo, colorNo)
3300   right(2*rotAngle)
3310   CALL forward(hypo, colorNo)
3320   penUp()
3330   left(90+rotAngle)
3340   forward(width_3) : REM color = ffffff
3350   right(90-rotAngle)
3360   penDown()
3370   CALL forward(-hypo, colorNo)
3380   right(2*rotAngle)
3390   CALL forward(hypo, colorNo)
3400   penUp()
3410   left(rotAngle)
3420   backward(h) : REM color = ffffff
3430   penDown()
3440 END SUB
3450 REM  
3460 REM Draws letter X in colour specified by colorNo with font height h 
3470 REM from the current turtle position. 
3480 REM TODO: Add type-specific suffixes where necessary! 
3490 SUB letterX(h, colorNo)
3500   REM TODO: add the respective type suffixes to your variable names if required 
3510   LET width = h/2.0
3520   LET hypo = sqrt(width*width + h*h)
3530   LET rotAngle = toDegrees(atan(width/h))
3540   right(rotAngle)
3550   CALL forward(hypo, colorNo)
3560   penUp()
3570   left(90+rotAngle)
3580   forward(width) : REM color = ffffff
3590   right(90-rotAngle)
3600   penDown()
3610   CALL forward(-hypo, colorNo)
3620   right(rotAngle)
3630 END SUB
3640 REM  
3650 REM Draws letter Y in colour specified by colorNo with font height h 
3660 REM from the current turtle position. 
3670 REM TODO: Add type-specific suffixes where necessary! 
3680 SUB letterY(h, colorNo)
3690   REM TODO: add the respective type suffixes to your variable names if required 
3700   LET width = h/2.0
3710   LET hypo = sqrt(width*width + h*h)/2.0
3720   LET rotAngle = toDegrees(atan(width/h))
3730   penUp()
3740   forward(h) : REM color = ffffff
3750   left(rotAngle)
3760   penDown()
3770   CALL forward(-hypo, colorNo)
3780   right(rotAngle)
3790   penUp()
3800   backward(h/2.0) : REM color = ffffff
3810   penDown()
3820   CALL forward(h/2.0, colorNo)
3830   right(rotAngle)
3840   CALL forward(hypo, colorNo)
3850   left(rotAngle)
3860   penUp()
3870   backward(h) : REM color = ffffff
3880   penDown()
3890 END SUB
3900 REM  
3910 REM Draws letter Z in colour specified by colorNo with font height h 
3920 REM from the current turtle position. 
3930 REM TODO: Add type-specific suffixes where necessary! 
3940 SUB letterZ(h, colorNo)
3950   REM TODO: add the respective type suffixes to your variable names if required 
3960   LET width = h/2.0
3970   LET hypo = sqrt(width*width + h*h)
3980   LET rotAngle = toDegrees(atan(width/h))
3990   penUp()
4000   forward(h) : REM color = ffffff
4010   right(90)
4020   penDown()
4030   CALL forward(width, colorNo)
4040   left(90-rotAngle)
4050   CALL forward(-hypo, colorNo)
4060   right(90-rotAngle)
4070   CALL forward(width, colorNo)
4080   left(90)
4090 END SUB
4100 REM  
4110 REM Draws nEdges edges of a regular n-polygon with edge length a 
4120 REM counter-clockwise, if ctrclkws is true, or clockwise if ctrclkws is false. 
4130 REM TODO: Add type-specific suffixes where necessary! 
4140 SUB polygonPart(a AS double, n AS integer, ctrclkws AS boolean, nEdges AS integer, color AS Integer)
4150   REM TODO: add the respective type suffixes to your variable names if required 
4160   LET rotAngle = 360.0/n
4170   IF ctrclkws THEN
4180     LET rotAngle = -rotAngle
4190   END IF
4200   FOR k = 1 TO nEdges
4210     right(rotAngle)
4220     CALL forward(a, color)
4230   NEXT k
4240 END SUB
4250 REM  
4260 REM Draws a dummy character (small centered square) with font height h and 
4270 REM the colour encoded by colorNo 
4280 REM TODO: Add type-specific suffixes where necessary! 
4290 SUB charDummy(h, colorNo)
4300   REM TODO: add the respective type suffixes to your variable names if required 
4310   LET width = h / 2.0
4320   REM Octagon edge length (here: edge lengzh of the square) 
4330   LET b = width / (sqrt(2.0) + 1)
4340   REM Cathetus of the corner triangle outside the octagon 
4350   LET c = (width - b) / 2.0
4360   LET d = b / sqrt(2.0)
4370   penUp()
4380   forward(h/2.0-b/2.0) : REM color = ffffff
4390   right(90)
4400   forward(c) : REM color = ffffff
4410   right(90)
4420   penDown()
4430   REM Draws the square with edge length b 
4440   CALL polygonPart(b, 4, true, 4, colorNo)
4450   penUp()
4460   left(90)
4470   forward(b + c) : REM color = ffffff
4480   left(90)
4490   backward(h/2.0-b/2.0) : REM color = ffffff
4500   penDown()
4510 END SUB
4520 REM  
4530 REM Draws a comma in colour specified by colorNo with font height h 
4540 REM from the current turtle position. 
4550 REM TODO: Add type-specific suffixes where necessary! 
4560 SUB comma(h, colorNo)
4570   REM TODO: add the respective type suffixes to your variable names if required 
4580   REM Octagon edge length 
4590   LET b = h * 0.5 / (sqrt(2.0) + 1)
4600   REM Cathetus of the outer corner triangle of the octagon 
4610   LET c = b / sqrt(2.0)
4620   LET rotAngle = toDegrees(atan(0.5))
4630   LET hypo = c * sqrt(1.25)
4640   penUp()
4650   right(90)
4660   forward((c+b)/2.0 + c) : REM color = ffffff
4670   penDown()
4680   REM Counterclockwise draw 3 edges of a square with edge length c 
4690   REM in the colour endcoded by colorNo 
4700   CALL polygonPart(c, 4, true, 3, colorNo)
4710   left(90)
4720   CALL forward(c/2.0, colorNo)
4730   right(90)
4740   CALL forward(c, colorNo)
4750   left(180 - rotAngle)
4760   CALL forward(hypo, colorNo)
4770   penUp()
4780   right(90 - rotAngle)
4790   forward((c + b)/2.0) : REM color = ffffff
4800   left(90)
4810   penDown()
4820 END SUB
4830 REM  
4840 REM Draws an exclamation mark in the colour encoded by colorNo with font height h 
4850 REM from the current turtle position. 
4860 REM TODO: Add type-specific suffixes where necessary! 
4870 SUB exclMk(h, colorNo)
4880   REM TODO: add the respective type suffixes to your variable names if required 
4890   REM Octagon edge length 
4900   LET b = h * 0.5 / (sqrt(2.0) + 1)
4910   REM Cathetus of the outer corner triangle of the octagon 
4920   LET c = b / sqrt(2.0)
4930   LET width = h/2.0
4940   LET length1 = h - (b+c)/2.0
4950   LET length2 = length1 - 2*c
4960   LET hypo = sqrt(width*width/16.0 + length2*length2)
4970   REM 360°/8 
4980   LET rotAngle = 45
4990   LET rotAngle2 = toDegrees(atan(width/4.0/length2))
5000   penUp()
5010   forward(length1) : REM color = ffffff
5020   right(90)
5030   forward(width/2.0) : REM color = ffffff
5040   left(90 + rotAngle)
5050   penDown()
5060   REM Clockwise draw 5 edges of an octagon with edge length b/2 
5070   REM in the colour endcoded by colorNo 
5080   CALL polygonPart(b/2.0, 8, false, 5, colorNo)
5090   right(rotAngle2)
5100   CALL forward(hypo, colorNo)
5110   left(2*rotAngle2)
5120   CALL forward(-hypo, colorNo)
5130   penUp()
5140   forward(hypo) : REM color = ffffff
5150   right(rotAngle2)
5160   forward(c) : REM color = ffffff
5170   left(90)
5180   forward(c/2.0) : REM color = ffffff
5190   penDown()
5200   REM Counterclockwise draw all 4 edges of a squarfe with edge length c 
5210   REM in the colour endcoded by colorNo 
5220   CALL polygonPart(c, 4, false, 4, colorNo)
5230   penUp()
5240   forward((c + b)/2.0) : REM color = ffffff
5250   left(90)
5260   backward(c) : REM color = ffffff
5270   penDown()
5280 END SUB
5290 REM  
5300 REM Draws a full stop in colour specified by colorNo with font height h 
5310 REM from the current turtle position. 
5320 REM TODO: Add type-specific suffixes where necessary! 
5330 SUB fullSt(h, colorNo)
5340   REM TODO: add the respective type suffixes to your variable names if required 
5350   REM Octagon edge length 
5360   LET b = h * 0.5 / (sqrt(2.0) + 1)
5370   REM Cathetus of the outer corner triangle of the octagon 
5380   LET c = b / sqrt(2.0)
5390   penUp()
5400   right(90)
5410   forward((c+b)/2.0 + c) : REM color = ffffff
5420   penDown()
5430   REM Counterclockwise draw all 4 edges of a squarfe with edge length c 
5440   REM in the colour endcoded by colorNo 
5450   CALL polygonPart(c, 4, true, 4, colorNo)
5460   penUp()
5470   forward((c + b)/2.0) : REM color = ffffff
5480   left(90)
5490   penDown()
5500 END SUB
5510 REM  
5520 REM Draws letter B in colour specified by colorNo with font height h 
5530 REM from the current turtle position. 
5540 REM TODO: Add type-specific suffixes where necessary! 
5550 SUB letterB(h, colorNo)
5560   REM TODO: add the respective type suffixes to your variable names if required 
5570   REM Octagon edge length 
5580   LET b = h * 0.5 / (sqrt(2.0) + 1)
5590   REM Cathetus of the outer corner triangle of the octagon 
5600   LET c = b / sqrt(2.0)
5610   CALL forward(h, colorNo)
5620   right(90)
5630   CALL forward(c+b, colorNo)
5640   REM Clockwise draw 4 edges of an octagon with edge length b 
5650   CALL polygonPart(b, 8, false, 4, colorNo)
5660   CALL forward(c, colorNo)
5670   penUp()
5680   left(180)
5690   forward(b + c) : REM color = ffffff
5700   penDown()
5710   REM Clockwise draw 4 edges of an octagon with edge length b 
5720   CALL polygonPart(b, 8, false, 4, colorNo)
5730   CALL forward(c, colorNo)
5740   penUp()
5750   left(180)
5760   forward(b + 2*c) : REM color = ffffff
5770   penDown()
5780   left(90)
5790 END SUB
5800 REM  
5810 REM Draws letter C in the colour encoded by colorNo with font height h 
5820 REM from the current turtle position. 
5830 REM TODO: Add type-specific suffixes where necessary! 
5840 SUB letterC(h, colorNo)
5850   REM TODO: add the respective type suffixes to your variable names if required 
5860   REM Octagon edge length 
5870   LET b = h * 0.5 / (sqrt(2.0) + 1)
5880   REM Cathetus of the outer trinagle at the octagon corner 
5890   LET c = b / sqrt(2.0)
5900   REM 360°/8 
5910   LET rotAngle = 45
5920   penUp()
5930   forward(c) : REM color = ffffff
5940   penDown()
5950   right(180)
5960   REM Clockwise draws 3 edges of an octagon with edge length b in the colour 
5970   REM encoded by colorNo 
5980   CALL polygonPart(b, 8, true, 3, colorNo)
5990   left(rotAngle)
6000   penUp()
6010   forward(2*b + 2*c) : REM color = ffffff
6020   penDown()
6030   REM Counterclockwise draws 4 edges of an octagon with edge length b 
6040   REM iin the colour encoded by colorNo 
6050   CALL polygonPart(b, 8, true, 4, colorNo)
6060   CALL forward(b + 2*c, colorNo)
6070   penUp()
6080   forward(c) : REM color = ffffff
6090   left(90)
6100   CALL forward(b + 2*c, colorNo)
6110   penDown()
6120   left(90)
6130 END SUB
6140 REM  
6150 REM Draws letter D in colour specified by colorNo with font height h 
6160 REM from the current turtle position. 
6170 REM TODO: Add type-specific suffixes where necessary! 
6180 SUB letterD(h, colorNo)
6190   REM TODO: add the respective type suffixes to your variable names if required 
6200   REM Octagon edge length 
6210   LET b = h * 0.5 / (sqrt(2.0) + 1)
6220   REM Cathetus of the outer corner triangle of the octagon 
6230   LET c = b / sqrt(2.0)
6240   CALL forward(h, colorNo)
6250   right(90)
6260   CALL forward(c+b, colorNo)
6270   REM Clockwise draw 2 edges of an octagon with edge length b in the colour 
6280   REM encoded by colorNo 
6290   CALL polygonPart(b, 8, false, 2, colorNo)
6300   CALL forward(b + 2*c, colorNo)
6310   REM Clockwise draw 2 edges of an octagon with edge length b in the colour 
6320   REM encoded by colorNo 
6330   CALL polygonPart(b, 8, false, 2, colorNo)
6340   CALL forward(c, colorNo)
6350   penUp()
6360   left(180)
6370   forward(b + 2*c) : REM color = ffffff
6380   penDown()
6390   left(90)
6400 END SUB
6410 REM  
6420 REM Draws letter G in colour specified by colorNo with font height h 
6430 REM from the current turtle position. 
6440 REM TODO: Add type-specific suffixes where necessary! 
6450 SUB letterG(h, colorNo)
6460   REM TODO: add the respective type suffixes to your variable names if required 
6470   REM Octagon edge length 
6480   LET b = h * 0.5 / (sqrt(2.0) + 1)
6490   REM Cathetus of the corner triangle outside the octagon. 
6500   LET c = b / sqrt(2.0)
6510   penUp()
6520   forward(c) : REM color = ffffff
6530   penDown()
6540   right(180)
6550   REM Counterclockwise draw 4 edges of an octagon with edge length b in 
6560   REM the colour encoded by colorNo 
6570   CALL polygonPart(b, 8, true, 4, colorNo)
6580   CALL forward(c, colorNo)
6590   left(90)
6600   CALL forward(b/2.0 + c, colorNo)
6610   penUp()
6620   backward(b/2.0 + c) : REM color = ffffff
6630   right(90)
6640   forward(b + c) : REM color = ffffff
6650   penDown()
6660   REM Counterclockwise draw 4 edges of an octagon with edge length b in 
6670   REM the colour encoded by colorNo 
6680   CALL polygonPart(b, 8, true, 4, colorNo)
6690   CALL forward(b + 2*c, colorNo)
6700   penUp()
6710   forward(c) : REM color = ffffff
6720   left(90)
6730   CALL forward(b + 2*c, colorNo)
6740   penDown()
6750   left(90)
6760 END SUB
6770 REM  
6780 REM Draws letter J in colour encoded by colorNo with font height h 
6790 REM from the current turtle position. 
6800 REM TODO: Add type-specific suffixes where necessary! 
6810 SUB letterJ(h, colorNo)
6820   REM TODO: add the respective type suffixes to your variable names if required 
6830   REM Octagon edge length 
6840   LET b = h * 0.5 / (sqrt(2.0) + 1)
6850   REM Cathetus of the outer corner triangle of the octagon 
6860   LET c = b / sqrt(2.0)
6870   REM 360°/8 
6880   LET rotAngle = 45
6890   penUp()
6900   forward(c) : REM color = ffffff
6910   penDown()
6920   right(180)
6930   REM Counterclockwise draw 3 edges of an octagon with edge length b in 
6940   REM the colour encoded by colorNo 
6950   CALL polygonPart(b, 8, true, 3, colorNo)
6960   left(rotAngle)
6970   CALL forward(h - c, colorNo)
6980   penUp()
6990   backward(h) : REM color = ffffff
7000   penDown()
7010 END SUB
7020 REM  
7030 REM Draws letter O in colour specified by colorNo with font height h 
7040 REM from the current turtle position. 
7050 REM TODO: Add type-specific suffixes where necessary! 
7060 SUB letterO(h, colorNo)
7070   REM TODO: add the respective type suffixes to your variable names if required 
7080   REM Octagon edge length 
7090   LET b = h * 0.5 / (sqrt(2.0) + 1)
7100   REM Cathetus of the corner triangle outside the octagon 
7110   LET c = b / sqrt(2.0)
7120   penUp()
7130   forward(c) : REM color = ffffff
7140   penDown()
7150   right(180)
7160   REM Counterclockwise draw 4 edges of an octagon with edge length b 
7170   REM in the colour endcoded by colorNo 
7180   CALL polygonPart(b, 8, true, 4, colorNo)
7190   CALL forward(b + 2*c, colorNo)
7200   REM Counterclockwise draw 4 edges of an octagon with edge length b 
7210   REM in the colour endcoded by colorNo 
7220   CALL polygonPart(b, 8, true, 4, colorNo)
7230   CALL forward(b + 2*c, colorNo)
7240   penUp()
7250   forward(c) : REM color = ffffff
7260   left(90)
7270   forward(b + 2*c) : REM color = ffffff
7280   penDown()
7290   left(90)
7300 END SUB
7310 REM  
7320 REM Draws letter P in colour specified by colorNo with font height h 
7330 REM from the current turtle position. 
7340 REM TODO: Add type-specific suffixes where necessary! 
7350 SUB letterP(h, colorNo)
7360   REM TODO: add the respective type suffixes to your variable names if required 
7370   REM Octagon edge length 
7380   LET b = h * 0.5 / (sqrt(2.0) + 1)
7390   REM Cathetus of the corner triangle outside the octagon 
7400   LET c = b / sqrt(2.0)
7410   CALL forward(h, colorNo)
7420   right(90)
7430   CALL forward(c+b, colorNo)
7440   REM Clockwise draw 4 edges of an octagon with edge length b 
7450   REM in the colour endcoded by colorNo 
7460   CALL polygonPart(b, 8, false, 4, colorNo)
7470   CALL forward(c, colorNo)
7480   penUp()
7490   backward(b + 2*c) : REM color = ffffff
7500   left(90)
7510   forward(b + 2*c) : REM color = ffffff
7520   penDown()
7530   left(180)
7540 END SUB
7550 REM  
7560 REM Draws letter Q in colour specified by colorNo with font height h 
7570 REM from the current turtle position. 
7580 REM TODO: Add type-specific suffixes where necessary! 
7590 SUB letterQ(h, colorNo)
7600   REM TODO: add the respective type suffixes to your variable names if required 
7610   REM Octagon edge length 
7620   LET b = h * 0.5 / (sqrt(2.0) + 1)
7630   REM Cathetus of the outer corner triangle of the octagon 
7640   LET c = b / sqrt(2.0)
7650   REM 360°/8 
7660   LET rotAngle = 45
7670   penUp()
7680   forward(c) : REM color = ffffff
7690   penDown()
7700   right(180)
7710   REM Counterclockwise draw 4 edges of an octagon with edge length b 
7720   REM in the colour endcoded by colorNo 
7730   CALL polygonPart(b, 8, true, 4, colorNo)
7740   CALL forward(b + 2*c, colorNo)
7750   REM Counterclockwise draw 4 edges of an octagon with edge length b 
7760   REM in the colour endcoded by colorNo 
7770   CALL polygonPart(b, 8, true, 4, colorNo)
7780   CALL forward(b + 2*c, colorNo)
7790   penUp()
7800   forward(c) : REM color = ffffff
7810   left(90)
7820   forward(b + 2*c) : REM color = ffffff
7830   right(rotAngle)
7840   backward(b) : REM color = ffffff
7850   penDown()
7860   CALL forward(b, colorNo)
7870   left(90 + rotAngle)
7880 END SUB
7890 REM  
7900 REM Zeichnet den Buchstaben R von der Turtleposition aus 
7910 REM mit Zeilenhöhe h 
7920 REM TODO: Add type-specific suffixes where necessary! 
7930 SUB letterR(h, colorNo)
7940   REM TODO: add the respective type suffixes to your variable names if required 
7950   REM Octagon edge length 
7960   LET b = h * 0.5 / (sqrt(2.0) + 1)
7970   REM Cathetus of the outer corner triangle of the octagon 
7980   LET c = b / sqrt(2.0)
7990   REM 360°/8 
8000   LET rotAngle = 45
8010   CALL forward(h, colorNo)
8020   right(90)
8030   CALL forward(c+b, colorNo)
8040   REM Clockwise draw 4 edges of an octagon with edge length b 
8050   REM in the colour endcoded by colorNo 
8060   CALL polygonPart(b, 8, false, 4, colorNo)
8070   CALL forward(c, colorNo)
8080   left(90 + rotAngle)
8090   CALL forward(sqrt(2.0)*(b + 2*c), colorNo)
8100   left(90 + rotAngle)
8110 END SUB
8120 REM  
8130 REM Draws letter S in colour specified by colorNo with font height h 
8140 REM from the current turtle position. 
8150 REM TODO: Add type-specific suffixes where necessary! 
8160 SUB letterS(h, colorNo)
8170   REM TODO: add the respective type suffixes to your variable names if required 
8180   REM Octagon edge length 
8190   LET b = h * 0.5 / (sqrt(2.0) + 1)
8200   REM Side length of the (outer) corner triangle of the octagon 
8210   LET c = b / sqrt(2.0)
8220   REM 360°/8 
8230   LET rotAngle = 45
8240   penUp()
8250   forward(c) : REM color = ffffff
8260   penDown()
8270   right(180)
8280   REM Counterclockwise draw 6 edges of an octagon with edge length b 
8290   REM in the colour encoded by colorNo 
8300   CALL polygonPart(b, 8, true, 6, colorNo)
8310   REM Clockwise draw 5 edges of an octagon with edge length b 
8320   REM in the colour encoded by colorNo 
8330   CALL polygonPart(b, 8, false, 5, colorNo)
8340   right(rotAngle)
8350   penUp()
8360   forward(2*b + 3*c) : REM color = ffffff
8370   penDown()
8380   left(180)
8390 END SUB
8400 REM  
8410 REM Draws letter U in colour specified by colorNo with font height h 
8420 REM from the current turtle position. 
8430 REM TODO: Add type-specific suffixes where necessary! 
8440 SUB letterU(h, colorNo)
8450   REM TODO: add the respective type suffixes to your variable names if required 
8460   REM edge length of a regular octagon 
8470   LET b = h * 0.5 / (sqrt(2.0) + 1)
8480   REM Cathetus of the outer corner triangle of the octagon 
8490   LET c = b / sqrt(2.0)
8500   REM 360°/8 
8510   LET rotAngle = 45
8520   penUp()
8530   forward(c) : REM color = ffffff
8540   penDown()
8550   CALL forward(h - c, colorNo)
8560   penUp()
8570   backward(h-c) : REM color = ffffff
8580   penDown()
8590   right(180)
8600   REM Counterclockwise draw 3 edges of an octagoin with edge length b in colour specified by colorNo 
8610   CALL polygonPart(b, 8, true, 3, colorNo)
8620   left(rotAngle)
8630   CALL forward(h - c, colorNo)
8640   penUp()
8650   backward(h) : REM color = ffffff
8660   penDown()
8670 END SUB
8680 REM  
8690 REM Draws a question mark in colour specified by colorNo with font height h 
8700 REM from the current turtle position. 
8710 REM TODO: Add type-specific suffixes where necessary! 
8720 SUB qstnMk(h, colorNo)
8730   REM TODO: add the respective type suffixes to your variable names if required 
8740   REM Octagon edge length 
8750   LET b = h * 0.5 / (sqrt(2.0) + 1)
8760   REM Cathetus of the outer corner triangle of the octagon 
8770   LET c = b / sqrt(2.0)
8780   REM 360°/8 
8790   LET rotAngle = 45
8800   penUp()
8810   forward(h-c) : REM color = ffffff
8820   penDown()
8830   REM Counterclockwise draw 5 edges of an octagon with edge length b 
8840   REM in the colour endcoded by colorNo 
8850   CALL polygonPart(b, 8, false, 5, colorNo)
8860   CALL forward(c, colorNo)
8870   left(rotAngle)
8880   CALL forward(b/2.0, colorNo)
8890   penUp()
8900   forward(c) : REM color = ffffff
8910   left(90)
8920   forward(c/2.0) : REM color = ffffff
8930   penDown()
8940   REM Counterclockwise draw all 4 edges of a squarfe with edge length c 
8950   REM in the colour endcoded by colorNo 
8960   CALL polygonPart(c, 4, false, 4, colorNo)
8970   penUp()
8980   forward((c + b)/2.0) : REM color = ffffff
8990   left(90)
9000   backward(c) : REM color = ffffff
9010   penDown()
9020 END SUB
9030 REM  
9040 REM Has the turtle draw the given string 'text´ with font height 'h´ (in 
9050 REM pixels) and the colour coded by integer 'c´ from the current Turtle 
9060 REM position to the Turtle canvas. If the turtle looks North then 
9070 REM the text will be written rightwards. In the event, the turtle will be 
9080 REM placed behind the text in original orientation (such that the next text 
9090 REM would be written like a continuation. Colour codes: 
9100 REM 1 = black 
9110 REM 2 = red 
9120 REM 3 = yellow 
9130 REM 4 = green 
9140 REM 5 = cyan 
9150 REM 6 = blue 
9160 REM 7 = pink 
9170 REM 8 = grey 
9180 REM 9 = orange 
9190 REM 10 = violet 
9200 REM All letters (ASCII) will be converted to uppercase, digits cannot 
9210 REM be represented, the set of representable special characters is: 
9220 REM '.', ',', '!', '?'. Other characters will be shown as a small 
9230 REM centred square (dummy character). 
9240 REM TODO: Add type-specific suffixes where necessary! 
9250 SUB drawText(text AS String, h AS integer, c AS integer)
9260   REM TODO: add the respective type suffixes to your variable names if required 
9270   LET gap = h/10.0
9280   FOR k = 1 TO length(text)
9290     LET letter = uppercase(copy(text, k, 1))
9300     IF letter = "," THEN
9310       CALL comma(h,c)
9320     ELSE
9330       REM "," cannot be chacked against because the comma is misinterpreted 
9340       REM as selector list separator. 
9350       SELECT CASE letter
9360         CASE "A"
9370           CALL letterA(h,c)
9380         CASE "B"
9390           CALL letterB(h,c)
9400         CASE "C"
9410           CALL letterC(h,c)
9420         CASE "D"
9430           CALL letterD(h,c)
9440         CASE "E"
9450           CALL letterE(h,c)
9460         CASE "F"
9470           CALL letterF(h,c)
9480         CASE "G"
9490           CALL letterG(h,c)
9500         CASE "H"
9510           CALL letterH(h,c)
9520         CASE "I"
9530           CALL letterI(h,c)
9540         CASE "J"
9550           CALL letterJ(h,c)
9560         CASE "K"
9570           CALL letterK(h,c)
9580         CASE "L"
9590           CALL letterL(h,c)
9600         CASE "M"
9610           CALL letterM(h,c)
9620         CASE "N"
9630           CALL letterN(h,c)
9640         CASE "O"
9650           CALL letterO(h,c)
9660         CASE "P"
9670           CALL letterP(h,c)
9680         CASE "Q"
9690           CALL letterQ(h,c)
9700         CASE "R"
9710           CALL letterR(h,c)
9720         CASE "S"
9730           CALL letterS(h,c)
9740         CASE "T"
9750           CALL letterT(h,c)
9760         CASE "U"
9770           CALL letterU(h,c)
9780         CASE "V"
9790           CALL letterV(h,c)
9800         CASE "W"
9810           CALL letterW(h,c)
9820         CASE "X"
9830           CALL letterX(h,c)
9840         CASE "Y"
9850           CALL letterY(h,c)
9860         CASE "Z"
9870           CALL letterZ(h,c)
9880         CASE " "
9890           CALL blank(h,c)
9900         CASE "!"
9910           CALL exclMk(h,c)
9920         CASE "?"
9930           CALL qstnMk(h,c)
9940         CASE "."
9950           CALL fullSt(h,c)
9960         CASE ELSE
9970           CALL charDummy(h,c)
9980       END SELECT
9990     END IF
10000     right(90)
10010     penUp()
10020     forward(gap) : REM color = ffffff
10030     penDown()
10040     left(90)
10050   NEXT k
10060 END SUB
