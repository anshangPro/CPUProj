
tmp/a.out：     文件格式 elf32-tradlittlemips

SYMBOL TABLE:
无符号



Disassembly of section .text:

00001000 <.text>:
    1000:	08000404 	j	0x1010
    1004:	00000000 	nop
	...
    1010:	27bdfe20 	addiu	sp,sp,-480
    1014:	3c020001 	lui	v0,0x1
    1018:	8c429000 	lw	v0,-28672(v0)
    101c:	8c420000 	lw	v0,0(v0)
    1020:	afa20098 	sw	v0,152(sp)
    1024:	3c020001 	lui	v0,0x1
    1028:	8c429004 	lw	v0,-28668(v0)
    102c:	8c420000 	lw	v0,0(v0)
    1030:	afa2009c 	sw	v0,156(sp)
    1034:	afa00000 	sw	zero,0(sp)
    1038:	10000016 	b	0x1094
    103c:	00000000 	nop
    1040:	24030001 	li	v1,1
    1044:	8fa20000 	lw	v0,0(sp)
    1048:	00431804 	sllv	v1,v1,v0
    104c:	8fa20098 	lw	v0,152(sp)
    1050:	00621824 	and	v1,v1,v0
    1054:	8fa20000 	lw	v0,0(sp)
    1058:	00021080 	sll	v0,v0,0x2
    105c:	03a21021 	addu	v0,sp,v0
    1060:	ac4300a0 	sw	v1,160(v0)
    1064:	24030001 	li	v1,1
    1068:	8fa20000 	lw	v0,0(sp)
    106c:	00431804 	sllv	v1,v1,v0
    1070:	8fa2009c 	lw	v0,156(sp)
    1074:	00621824 	and	v1,v1,v0
    1078:	8fa20000 	lw	v0,0(sp)
    107c:	00021080 	sll	v0,v0,0x2
    1080:	03a21021 	addu	v0,sp,v0
    1084:	ac430100 	sw	v1,256(v0)
    1088:	8fa20000 	lw	v0,0(sp)
    108c:	24420001 	addiu	v0,v0,1
    1090:	afa20000 	sw	v0,0(sp)
    1094:	8fa20000 	lw	v0,0(sp)
    1098:	28420018 	slti	v0,v0,24
    109c:	1440ffe8 	bnez	v0,0x1040
    10a0:	00000000 	nop
    10a4:	afa00004 	sw	zero,4(sp)
    10a8:	24020001 	li	v0,1
    10ac:	afa20008 	sw	v0,8(sp)
    10b0:	8fa200fc 	lw	v0,252(sp)
    10b4:	14400065 	bnez	v0,0x124c
    10b8:	00000000 	nop
    10bc:	8fa200f8 	lw	v0,248(sp)
    10c0:	14400062 	bnez	v0,0x124c
    10c4:	00000000 	nop
    10c8:	8fa200f4 	lw	v0,244(sp)
    10cc:	1440005f 	bnez	v0,0x124c
    10d0:	00000000 	nop
    10d4:	afa0000c 	sw	zero,12(sp)
    10d8:	10000016 	b	0x1134
    10dc:	00000000 	nop
    10e0:	8fa2000c 	lw	v0,12(sp)
    10e4:	00021080 	sll	v0,v0,0x2
    10e8:	03a21021 	addu	v0,sp,v0
    10ec:	8c4300a0 	lw	v1,160(v0)
    10f0:	24020001 	li	v0,1
    10f4:	1462000c 	bne	v1,v0,0x1128
    10f8:	00000000 	nop
    10fc:	3c020001 	lui	v0,0x1
    1100:	8c429004 	lw	v0,-28668(v0)
    1104:	8c440000 	lw	a0,0(v0)
    1108:	24030001 	li	v1,1
    110c:	8fa2000c 	lw	v0,12(sp)
    1110:	00431004 	sllv	v0,v1,v0
    1114:	00021827 	nor	v1,zero,v0
    1118:	3c020001 	lui	v0,0x1
    111c:	8c429004 	lw	v0,-28668(v0)
    1120:	00831825 	or	v1,a0,v1
    1124:	ac430000 	sw	v1,0(v0)
    1128:	8fa2000c 	lw	v0,12(sp)
    112c:	24420001 	addiu	v0,v0,1
    1130:	afa2000c 	sw	v0,12(sp)
    1134:	8fa2000c 	lw	v0,12(sp)
    1138:	28420010 	slti	v0,v0,16
    113c:	1440ffe8 	bnez	v0,0x10e0
    1140:	00000000 	nop
    1144:	2402000f 	li	v0,15
    1148:	afa20010 	sw	v0,16(sp)
    114c:	1000000f 	b	0x118c
    1150:	00000000 	nop
    1154:	8fa20010 	lw	v0,16(sp)
    1158:	00021080 	sll	v0,v0,0x2
    115c:	03a21021 	addu	v0,sp,v0
    1160:	8c4300a0 	lw	v1,160(v0)
    1164:	24020001 	li	v0,1
    1168:	14620005 	bne	v1,v0,0x1180
    116c:	00000000 	nop
    1170:	8fa20010 	lw	v0,16(sp)
    1174:	afa20004 	sw	v0,4(sp)
    1178:	10000007 	b	0x1198
    117c:	00000000 	nop
    1180:	8fa20010 	lw	v0,16(sp)
    1184:	2442ffff 	addiu	v0,v0,-1
    1188:	afa20010 	sw	v0,16(sp)
    118c:	8fa20010 	lw	v0,16(sp)
    1190:	0441fff0 	bgez	v0,0x1154
    1194:	00000000 	nop
    1198:	8fa20004 	lw	v0,4(sp)
    119c:	30420001 	andi	v0,v0,0x1
    11a0:	10400366 	beqz	v0,0x1f3c
    11a4:	00000000 	nop
    11a8:	8fa20004 	lw	v0,4(sp)
    11ac:	afa20014 	sw	v0,20(sp)
    11b0:	10000011 	b	0x11f8
    11b4:	00000000 	nop
    11b8:	8fa20014 	lw	v0,20(sp)
    11bc:	00021080 	sll	v0,v0,0x2
    11c0:	03a21021 	addu	v0,sp,v0
    11c4:	8c4300a0 	lw	v1,160(v0)
    11c8:	8fa40004 	lw	a0,4(sp)
    11cc:	8fa20014 	lw	v0,20(sp)
    11d0:	00821023 	subu	v0,a0,v0
    11d4:	00021080 	sll	v0,v0,0x2
    11d8:	03a21021 	addu	v0,sp,v0
    11dc:	8c4200a0 	lw	v0,160(v0)
    11e0:	10620002 	beq	v1,v0,0x11ec
    11e4:	00000000 	nop
    11e8:	afa00008 	sw	zero,8(sp)
    11ec:	8fa20014 	lw	v0,20(sp)
    11f0:	24420001 	addiu	v0,v0,1
    11f4:	afa20014 	sw	v0,20(sp)
    11f8:	8fa20004 	lw	v0,4(sp)
    11fc:	24420001 	addiu	v0,v0,1
    1200:	00021043 	sra	v0,v0,0x1
    1204:	8fa30014 	lw	v1,20(sp)
    1208:	0062102a 	slt	v0,v1,v0
    120c:	1040ffea 	beqz	v0,0x11b8
    1210:	00000000 	nop
    1214:	8fa20008 	lw	v0,8(sp)
    1218:	10400348 	beqz	v0,0x1f3c
    121c:	00000000 	nop
    1220:	3c020001 	lui	v0,0x1
    1224:	8c429004 	lw	v0,-28668(v0)
    1228:	8c440000 	lw	a0,0(v0)
    122c:	3c020001 	lui	v0,0x1
    1230:	8c429004 	lw	v0,-28668(v0)
    1234:	3c03ff7f 	lui	v1,0xff7f
    1238:	3463ffff 	ori	v1,v1,0xffff
    123c:	00831825 	or	v1,a0,v1
    1240:	ac430000 	sw	v1,0(v0)
    1244:	1000033d 	b	0x1f3c
    1248:	00000000 	nop
    124c:	8fa200fc 	lw	v0,252(sp)
    1250:	14400056 	bnez	v0,0x13ac
    1254:	00000000 	nop
    1258:	8fa200f8 	lw	v0,248(sp)
    125c:	14400053 	bnez	v0,0x13ac
    1260:	00000000 	nop
    1264:	8fa300f4 	lw	v1,244(sp)
    1268:	24020001 	li	v0,1
    126c:	1462004f 	bne	v1,v0,0x13ac
    1270:	00000000 	nop
    1274:	00000000 	nop
    1278:	8fa200f0 	lw	v0,240(sp)
    127c:	1040fffe 	beqz	v0,0x1278
    1280:	00000000 	nop
    1284:	1000001d 	b	0x12fc
    1288:	00000000 	nop
    128c:	afa00018 	sw	zero,24(sp)
    1290:	10000016 	b	0x12ec
    1294:	00000000 	nop
    1298:	8fa20018 	lw	v0,24(sp)
    129c:	00021080 	sll	v0,v0,0x2
    12a0:	03a21021 	addu	v0,sp,v0
    12a4:	8c4300a0 	lw	v1,160(v0)
    12a8:	24020001 	li	v0,1
    12ac:	1462000c 	bne	v1,v0,0x12e0
    12b0:	00000000 	nop
    12b4:	3c020001 	lui	v0,0x1
    12b8:	8c429004 	lw	v0,-28668(v0)
    12bc:	8c440000 	lw	a0,0(v0)
    12c0:	24030001 	li	v1,1
    12c4:	8fa20018 	lw	v0,24(sp)
    12c8:	00431004 	sllv	v0,v1,v0
    12cc:	00021827 	nor	v1,zero,v0
    12d0:	3c020001 	lui	v0,0x1
    12d4:	8c429004 	lw	v0,-28668(v0)
    12d8:	00831825 	or	v1,a0,v1
    12dc:	ac430000 	sw	v1,0(v0)
    12e0:	8fa20018 	lw	v0,24(sp)
    12e4:	24420001 	addiu	v0,v0,1
    12e8:	afa20018 	sw	v0,24(sp)
    12ec:	8fa20018 	lw	v0,24(sp)
    12f0:	28420010 	slti	v0,v0,16
    12f4:	1440ffe8 	bnez	v0,0x1298
    12f8:	00000000 	nop
    12fc:	8fa300f0 	lw	v1,240(sp)
    1300:	24020001 	li	v0,1
    1304:	1062ffe1 	beq	v1,v0,0x128c
    1308:	00000000 	nop
    130c:	00000000 	nop
    1310:	8fa200f0 	lw	v0,240(sp)
    1314:	1040fffe 	beqz	v0,0x1310
    1318:	00000000 	nop
    131c:	1000001d 	b	0x1394
    1320:	00000000 	nop
    1324:	afa0001c 	sw	zero,28(sp)
    1328:	10000016 	b	0x1384
    132c:	00000000 	nop
    1330:	8fa2001c 	lw	v0,28(sp)
    1334:	00021080 	sll	v0,v0,0x2
    1338:	03a21021 	addu	v0,sp,v0
    133c:	8c4300a0 	lw	v1,160(v0)
    1340:	24020001 	li	v0,1
    1344:	1462000c 	bne	v1,v0,0x1378
    1348:	00000000 	nop
    134c:	3c020001 	lui	v0,0x1
    1350:	8c429004 	lw	v0,-28668(v0)
    1354:	8c440000 	lw	a0,0(v0)
    1358:	24030001 	li	v1,1
    135c:	8fa2001c 	lw	v0,28(sp)
    1360:	00431004 	sllv	v0,v1,v0
    1364:	00021827 	nor	v1,zero,v0
    1368:	3c020001 	lui	v0,0x1
    136c:	8c429004 	lw	v0,-28668(v0)
    1370:	00831825 	or	v1,a0,v1
    1374:	ac430000 	sw	v1,0(v0)
    1378:	8fa2001c 	lw	v0,28(sp)
    137c:	24420001 	addiu	v0,v0,1
    1380:	afa2001c 	sw	v0,28(sp)
    1384:	8fa2001c 	lw	v0,28(sp)
    1388:	28420010 	slti	v0,v0,16
    138c:	1440ffe8 	bnez	v0,0x1330
    1390:	00000000 	nop
    1394:	8fa300f0 	lw	v1,240(sp)
    1398:	24020001 	li	v0,1
    139c:	1062ffe1 	beq	v1,v0,0x1324
    13a0:	00000000 	nop
    13a4:	100002e6 	b	0x1f40
    13a8:	00000000 	nop
    13ac:	8fa200fc 	lw	v0,252(sp)
    13b0:	14400062 	bnez	v0,0x153c
    13b4:	00000000 	nop
    13b8:	8fa300f8 	lw	v1,248(sp)
    13bc:	24020001 	li	v0,1
    13c0:	1462005e 	bne	v1,v0,0x153c
    13c4:	00000000 	nop
    13c8:	8fa200f4 	lw	v0,244(sp)
    13cc:	1440005b 	bnez	v0,0x153c
    13d0:	00000000 	nop
    13d4:	00000000 	nop
    13d8:	8fa200f0 	lw	v0,240(sp)
    13dc:	1040fffe 	beqz	v0,0x13d8
    13e0:	00000000 	nop
    13e4:	10000013 	b	0x1434
    13e8:	00000000 	nop
    13ec:	afa00020 	sw	zero,32(sp)
    13f0:	1000000c 	b	0x1424
    13f4:	00000000 	nop
    13f8:	8fa20020 	lw	v0,32(sp)
    13fc:	00021080 	sll	v0,v0,0x2
    1400:	03a21021 	addu	v0,sp,v0
    1404:	8c4300a0 	lw	v1,160(v0)
    1408:	8fa20020 	lw	v0,32(sp)
    140c:	00021080 	sll	v0,v0,0x2
    1410:	03a21021 	addu	v0,sp,v0
    1414:	ac430160 	sw	v1,352(v0)
    1418:	8fa20020 	lw	v0,32(sp)
    141c:	24420001 	addiu	v0,v0,1
    1420:	afa20020 	sw	v0,32(sp)
    1424:	8fa20020 	lw	v0,32(sp)
    1428:	28420010 	slti	v0,v0,16
    142c:	1440fff2 	bnez	v0,0x13f8
    1430:	00000000 	nop
    1434:	8fa300f0 	lw	v1,240(sp)
    1438:	24020001 	li	v0,1
    143c:	1062ffeb 	beq	v1,v0,0x13ec
    1440:	00000000 	nop
    1444:	00000000 	nop
    1448:	8fa200f0 	lw	v0,240(sp)
    144c:	1040fffe 	beqz	v0,0x1448
    1450:	00000000 	nop
    1454:	10000013 	b	0x14a4
    1458:	00000000 	nop
    145c:	afa00024 	sw	zero,36(sp)
    1460:	1000000c 	b	0x1494
    1464:	00000000 	nop
    1468:	8fa20024 	lw	v0,36(sp)
    146c:	00021080 	sll	v0,v0,0x2
    1470:	03a21021 	addu	v0,sp,v0
    1474:	8c4300a0 	lw	v1,160(v0)
    1478:	8fa20024 	lw	v0,36(sp)
    147c:	00021080 	sll	v0,v0,0x2
    1480:	03a21021 	addu	v0,sp,v0
    1484:	ac4301a0 	sw	v1,416(v0)
    1488:	8fa20024 	lw	v0,36(sp)
    148c:	24420001 	addiu	v0,v0,1
    1490:	afa20024 	sw	v0,36(sp)
    1494:	8fa20024 	lw	v0,36(sp)
    1498:	28420010 	slti	v0,v0,16
    149c:	1440fff2 	bnez	v0,0x1468
    14a0:	00000000 	nop
    14a4:	8fa300f0 	lw	v1,240(sp)
    14a8:	24020001 	li	v0,1
    14ac:	1062ffeb 	beq	v1,v0,0x145c
    14b0:	00000000 	nop
    14b4:	afa00028 	sw	zero,40(sp)
    14b8:	1000001a 	b	0x1524
    14bc:	00000000 	nop
    14c0:	8fa20028 	lw	v0,40(sp)
    14c4:	00021080 	sll	v0,v0,0x2
    14c8:	03a21021 	addu	v0,sp,v0
    14cc:	8c430160 	lw	v1,352(v0)
    14d0:	8fa20028 	lw	v0,40(sp)
    14d4:	00021080 	sll	v0,v0,0x2
    14d8:	03a21021 	addu	v0,sp,v0
    14dc:	8c4201a0 	lw	v0,416(v0)
    14e0:	00621024 	and	v0,v1,v0
    14e4:	1040000c 	beqz	v0,0x1518
    14e8:	00000000 	nop
    14ec:	3c020001 	lui	v0,0x1
    14f0:	8c429004 	lw	v0,-28668(v0)
    14f4:	8c440000 	lw	a0,0(v0)
    14f8:	24030001 	li	v1,1
    14fc:	8fa20028 	lw	v0,40(sp)
    1500:	00431004 	sllv	v0,v1,v0
    1504:	00021827 	nor	v1,zero,v0
    1508:	3c020001 	lui	v0,0x1
    150c:	8c429004 	lw	v0,-28668(v0)
    1510:	00831825 	or	v1,a0,v1
    1514:	ac430000 	sw	v1,0(v0)
    1518:	8fa20028 	lw	v0,40(sp)
    151c:	24420001 	addiu	v0,v0,1
    1520:	afa20028 	sw	v0,40(sp)
    1524:	8fa20028 	lw	v0,40(sp)
    1528:	28420010 	slti	v0,v0,16
    152c:	1440ffe4 	bnez	v0,0x14c0
    1530:	00000000 	nop
    1534:	10000282 	b	0x1f40
    1538:	00000000 	nop
    153c:	8fa200fc 	lw	v0,252(sp)
    1540:	14400063 	bnez	v0,0x16d0
    1544:	00000000 	nop
    1548:	8fa300f8 	lw	v1,248(sp)
    154c:	24020001 	li	v0,1
    1550:	1462005f 	bne	v1,v0,0x16d0
    1554:	00000000 	nop
    1558:	8fa300f4 	lw	v1,244(sp)
    155c:	24020001 	li	v0,1
    1560:	1462005b 	bne	v1,v0,0x16d0
    1564:	00000000 	nop
    1568:	00000000 	nop
    156c:	8fa200f0 	lw	v0,240(sp)
    1570:	1040fffe 	beqz	v0,0x156c
    1574:	00000000 	nop
    1578:	10000013 	b	0x15c8
    157c:	00000000 	nop
    1580:	afa0002c 	sw	zero,44(sp)
    1584:	1000000c 	b	0x15b8
    1588:	00000000 	nop
    158c:	8fa2002c 	lw	v0,44(sp)
    1590:	00021080 	sll	v0,v0,0x2
    1594:	03a21021 	addu	v0,sp,v0
    1598:	8c4300a0 	lw	v1,160(v0)
    159c:	8fa2002c 	lw	v0,44(sp)
    15a0:	00021080 	sll	v0,v0,0x2
    15a4:	03a21021 	addu	v0,sp,v0
    15a8:	ac430160 	sw	v1,352(v0)
    15ac:	8fa2002c 	lw	v0,44(sp)
    15b0:	24420001 	addiu	v0,v0,1
    15b4:	afa2002c 	sw	v0,44(sp)
    15b8:	8fa2002c 	lw	v0,44(sp)
    15bc:	28420010 	slti	v0,v0,16
    15c0:	1440fff2 	bnez	v0,0x158c
    15c4:	00000000 	nop
    15c8:	8fa300f0 	lw	v1,240(sp)
    15cc:	24020001 	li	v0,1
    15d0:	1062ffeb 	beq	v1,v0,0x1580
    15d4:	00000000 	nop
    15d8:	00000000 	nop
    15dc:	8fa200f0 	lw	v0,240(sp)
    15e0:	1040fffe 	beqz	v0,0x15dc
    15e4:	00000000 	nop
    15e8:	10000013 	b	0x1638
    15ec:	00000000 	nop
    15f0:	afa00030 	sw	zero,48(sp)
    15f4:	1000000c 	b	0x1628
    15f8:	00000000 	nop
    15fc:	8fa20030 	lw	v0,48(sp)
    1600:	00021080 	sll	v0,v0,0x2
    1604:	03a21021 	addu	v0,sp,v0
    1608:	8c4300a0 	lw	v1,160(v0)
    160c:	8fa20030 	lw	v0,48(sp)
    1610:	00021080 	sll	v0,v0,0x2
    1614:	03a21021 	addu	v0,sp,v0
    1618:	ac4301a0 	sw	v1,416(v0)
    161c:	8fa20030 	lw	v0,48(sp)
    1620:	24420001 	addiu	v0,v0,1
    1624:	afa20030 	sw	v0,48(sp)
    1628:	8fa20030 	lw	v0,48(sp)
    162c:	28420010 	slti	v0,v0,16
    1630:	1440fff2 	bnez	v0,0x15fc
    1634:	00000000 	nop
    1638:	8fa300f0 	lw	v1,240(sp)
    163c:	24020001 	li	v0,1
    1640:	1062ffeb 	beq	v1,v0,0x15f0
    1644:	00000000 	nop
    1648:	afa00034 	sw	zero,52(sp)
    164c:	1000001a 	b	0x16b8
    1650:	00000000 	nop
    1654:	8fa20034 	lw	v0,52(sp)
    1658:	00021080 	sll	v0,v0,0x2
    165c:	03a21021 	addu	v0,sp,v0
    1660:	8c430160 	lw	v1,352(v0)
    1664:	8fa20034 	lw	v0,52(sp)
    1668:	00021080 	sll	v0,v0,0x2
    166c:	03a21021 	addu	v0,sp,v0
    1670:	8c4201a0 	lw	v0,416(v0)
    1674:	00621025 	or	v0,v1,v0
    1678:	1040000c 	beqz	v0,0x16ac
    167c:	00000000 	nop
    1680:	3c020001 	lui	v0,0x1
    1684:	8c429004 	lw	v0,-28668(v0)
    1688:	8c440000 	lw	a0,0(v0)
    168c:	24030001 	li	v1,1
    1690:	8fa20034 	lw	v0,52(sp)
    1694:	00431004 	sllv	v0,v1,v0
    1698:	00021827 	nor	v1,zero,v0
    169c:	3c020001 	lui	v0,0x1
    16a0:	8c429004 	lw	v0,-28668(v0)
    16a4:	00831825 	or	v1,a0,v1
    16a8:	ac430000 	sw	v1,0(v0)
    16ac:	8fa20034 	lw	v0,52(sp)
    16b0:	24420001 	addiu	v0,v0,1
    16b4:	afa20034 	sw	v0,52(sp)
    16b8:	8fa20034 	lw	v0,52(sp)
    16bc:	28420010 	slti	v0,v0,16
    16c0:	1440ffe4 	bnez	v0,0x1654
    16c4:	00000000 	nop
    16c8:	1000021d 	b	0x1f40
    16cc:	00000000 	nop
    16d0:	8fa300fc 	lw	v1,252(sp)
    16d4:	24020001 	li	v0,1
    16d8:	14620060 	bne	v1,v0,0x185c
    16dc:	00000000 	nop
    16e0:	8fa200f8 	lw	v0,248(sp)
    16e4:	1440005d 	bnez	v0,0x185c
    16e8:	00000000 	nop
    16ec:	8fa200f4 	lw	v0,244(sp)
    16f0:	1440005a 	bnez	v0,0x185c
    16f4:	00000000 	nop
    16f8:	00000000 	nop
    16fc:	8fa200f0 	lw	v0,240(sp)
    1700:	1040fffe 	beqz	v0,0x16fc
    1704:	00000000 	nop
    1708:	10000013 	b	0x1758
    170c:	00000000 	nop
    1710:	afa00038 	sw	zero,56(sp)
    1714:	1000000c 	b	0x1748
    1718:	00000000 	nop
    171c:	8fa20038 	lw	v0,56(sp)
    1720:	00021080 	sll	v0,v0,0x2
    1724:	03a21021 	addu	v0,sp,v0
    1728:	8c4300a0 	lw	v1,160(v0)
    172c:	8fa20038 	lw	v0,56(sp)
    1730:	00021080 	sll	v0,v0,0x2
    1734:	03a21021 	addu	v0,sp,v0
    1738:	ac430160 	sw	v1,352(v0)
    173c:	8fa20038 	lw	v0,56(sp)
    1740:	24420001 	addiu	v0,v0,1
    1744:	afa20038 	sw	v0,56(sp)
    1748:	8fa20038 	lw	v0,56(sp)
    174c:	28420010 	slti	v0,v0,16
    1750:	1440fff2 	bnez	v0,0x171c
    1754:	00000000 	nop
    1758:	8fa300f0 	lw	v1,240(sp)
    175c:	24020001 	li	v0,1
    1760:	1062ffeb 	beq	v1,v0,0x1710
    1764:	00000000 	nop
    1768:	00000000 	nop
    176c:	8fa200f0 	lw	v0,240(sp)
    1770:	1040fffe 	beqz	v0,0x176c
    1774:	00000000 	nop
    1778:	10000013 	b	0x17c8
    177c:	00000000 	nop
    1780:	afa0003c 	sw	zero,60(sp)
    1784:	1000000c 	b	0x17b8
    1788:	00000000 	nop
    178c:	8fa2003c 	lw	v0,60(sp)
    1790:	00021080 	sll	v0,v0,0x2
    1794:	03a21021 	addu	v0,sp,v0
    1798:	8c4300a0 	lw	v1,160(v0)
    179c:	8fa2003c 	lw	v0,60(sp)
    17a0:	00021080 	sll	v0,v0,0x2
    17a4:	03a21021 	addu	v0,sp,v0
    17a8:	ac4301a0 	sw	v1,416(v0)
    17ac:	8fa2003c 	lw	v0,60(sp)
    17b0:	24420001 	addiu	v0,v0,1
    17b4:	afa2003c 	sw	v0,60(sp)
    17b8:	8fa2003c 	lw	v0,60(sp)
    17bc:	28420010 	slti	v0,v0,16
    17c0:	1440fff2 	bnez	v0,0x178c
    17c4:	00000000 	nop
    17c8:	8fa300f0 	lw	v1,240(sp)
    17cc:	24020001 	li	v0,1
    17d0:	1062ffeb 	beq	v1,v0,0x1780
    17d4:	00000000 	nop
    17d8:	afa00040 	sw	zero,64(sp)
    17dc:	10000019 	b	0x1844
    17e0:	00000000 	nop
    17e4:	8fa20040 	lw	v0,64(sp)
    17e8:	00021080 	sll	v0,v0,0x2
    17ec:	03a21021 	addu	v0,sp,v0
    17f0:	8c430160 	lw	v1,352(v0)
    17f4:	8fa20040 	lw	v0,64(sp)
    17f8:	00021080 	sll	v0,v0,0x2
    17fc:	03a21021 	addu	v0,sp,v0
    1800:	8c4201a0 	lw	v0,416(v0)
    1804:	1062000c 	beq	v1,v0,0x1838
    1808:	00000000 	nop
    180c:	3c020001 	lui	v0,0x1
    1810:	8c429004 	lw	v0,-28668(v0)
    1814:	8c440000 	lw	a0,0(v0)
    1818:	24030001 	li	v1,1
    181c:	8fa20040 	lw	v0,64(sp)
    1820:	00431004 	sllv	v0,v1,v0
    1824:	00021827 	nor	v1,zero,v0
    1828:	3c020001 	lui	v0,0x1
    182c:	8c429004 	lw	v0,-28668(v0)
    1830:	00831825 	or	v1,a0,v1
    1834:	ac430000 	sw	v1,0(v0)
    1838:	8fa20040 	lw	v0,64(sp)
    183c:	24420001 	addiu	v0,v0,1
    1840:	afa20040 	sw	v0,64(sp)
    1844:	8fa20040 	lw	v0,64(sp)
    1848:	28420010 	slti	v0,v0,16
    184c:	1440ffe5 	bnez	v0,0x17e4
    1850:	00000000 	nop
    1854:	100001ba 	b	0x1f40
    1858:	00000000 	nop
    185c:	8fa300fc 	lw	v1,252(sp)
    1860:	24020001 	li	v0,1
    1864:	1462008f 	bne	v1,v0,0x1aa4
    1868:	00000000 	nop
    186c:	8fa200f8 	lw	v0,248(sp)
    1870:	1440008c 	bnez	v0,0x1aa4
    1874:	00000000 	nop
    1878:	8fa200f4 	lw	v0,244(sp)
    187c:	14400089 	bnez	v0,0x1aa4
    1880:	00000000 	nop
    1884:	00000000 	nop
    1888:	8fa200f0 	lw	v0,240(sp)
    188c:	1040fffe 	beqz	v0,0x1888
    1890:	00000000 	nop
    1894:	10000013 	b	0x18e4
    1898:	00000000 	nop
    189c:	afa00044 	sw	zero,68(sp)
    18a0:	1000000c 	b	0x18d4
    18a4:	00000000 	nop
    18a8:	8fa20044 	lw	v0,68(sp)
    18ac:	00021080 	sll	v0,v0,0x2
    18b0:	03a21021 	addu	v0,sp,v0
    18b4:	8c4300a0 	lw	v1,160(v0)
    18b8:	8fa20044 	lw	v0,68(sp)
    18bc:	00021080 	sll	v0,v0,0x2
    18c0:	03a21021 	addu	v0,sp,v0
    18c4:	ac430160 	sw	v1,352(v0)
    18c8:	8fa20044 	lw	v0,68(sp)
    18cc:	24420001 	addiu	v0,v0,1
    18d0:	afa20044 	sw	v0,68(sp)
    18d4:	8fa20044 	lw	v0,68(sp)
    18d8:	28420010 	slti	v0,v0,16
    18dc:	1440fff2 	bnez	v0,0x18a8
    18e0:	00000000 	nop
    18e4:	8fa300f0 	lw	v1,240(sp)
    18e8:	24020001 	li	v0,1
    18ec:	1062ffeb 	beq	v1,v0,0x189c
    18f0:	00000000 	nop
    18f4:	00000000 	nop
    18f8:	8fa200f0 	lw	v0,240(sp)
    18fc:	1040fffe 	beqz	v0,0x18f8
    1900:	00000000 	nop
    1904:	10000013 	b	0x1954
    1908:	00000000 	nop
    190c:	afa00048 	sw	zero,72(sp)
    1910:	1000000c 	b	0x1944
    1914:	00000000 	nop
    1918:	8fa20048 	lw	v0,72(sp)
    191c:	00021080 	sll	v0,v0,0x2
    1920:	03a21021 	addu	v0,sp,v0
    1924:	8c4300a0 	lw	v1,160(v0)
    1928:	8fa20048 	lw	v0,72(sp)
    192c:	00021080 	sll	v0,v0,0x2
    1930:	03a21021 	addu	v0,sp,v0
    1934:	ac4301a0 	sw	v1,416(v0)
    1938:	8fa20048 	lw	v0,72(sp)
    193c:	24420001 	addiu	v0,v0,1
    1940:	afa20048 	sw	v0,72(sp)
    1944:	8fa20048 	lw	v0,72(sp)
    1948:	28420010 	slti	v0,v0,16
    194c:	1440fff2 	bnez	v0,0x1918
    1950:	00000000 	nop
    1954:	8fa300f0 	lw	v1,240(sp)
    1958:	24020001 	li	v0,1
    195c:	1062ffeb 	beq	v1,v0,0x190c
    1960:	00000000 	nop
    1964:	afa00050 	sw	zero,80(sp)
    1968:	1000000d 	b	0x19a0
    196c:	00000000 	nop
    1970:	8fa20050 	lw	v0,80(sp)
    1974:	00021080 	sll	v0,v0,0x2
    1978:	03a21021 	addu	v0,sp,v0
    197c:	8c4301a0 	lw	v1,416(v0)
    1980:	8fa20050 	lw	v0,80(sp)
    1984:	00431004 	sllv	v0,v1,v0
    1988:	8fa3004c 	lw	v1,76(sp)
    198c:	00621021 	addu	v0,v1,v0
    1990:	afa2004c 	sw	v0,76(sp)
    1994:	8fa20050 	lw	v0,80(sp)
    1998:	24420001 	addiu	v0,v0,1
    199c:	afa20050 	sw	v0,80(sp)
    19a0:	8fa20050 	lw	v0,80(sp)
    19a4:	28420010 	slti	v0,v0,16
    19a8:	1440fff1 	bnez	v0,0x1970
    19ac:	00000000 	nop
    19b0:	afa00054 	sw	zero,84(sp)
    19b4:	10000018 	b	0x1a18
    19b8:	00000000 	nop
    19bc:	2402000f 	li	v0,15
    19c0:	afa20058 	sw	v0,88(sp)
    19c4:	1000000d 	b	0x19fc
    19c8:	00000000 	nop
    19cc:	8fa20058 	lw	v0,88(sp)
    19d0:	2442ffff 	addiu	v0,v0,-1
    19d4:	00021080 	sll	v0,v0,0x2
    19d8:	03a21021 	addu	v0,sp,v0
    19dc:	8c430160 	lw	v1,352(v0)
    19e0:	8fa20058 	lw	v0,88(sp)
    19e4:	00021080 	sll	v0,v0,0x2
    19e8:	03a21021 	addu	v0,sp,v0
    19ec:	ac430160 	sw	v1,352(v0)
    19f0:	8fa20058 	lw	v0,88(sp)
    19f4:	2442ffff 	addiu	v0,v0,-1
    19f8:	afa20058 	sw	v0,88(sp)
    19fc:	8fa20058 	lw	v0,88(sp)
    1a00:	1c40fff2 	bgtz	v0,0x19cc
    1a04:	00000000 	nop
    1a08:	afa00160 	sw	zero,352(sp)
    1a0c:	8fa20054 	lw	v0,84(sp)
    1a10:	24420001 	addiu	v0,v0,1
    1a14:	afa20054 	sw	v0,84(sp)
    1a18:	8fa30054 	lw	v1,84(sp)
    1a1c:	8fa2004c 	lw	v0,76(sp)
    1a20:	0062102a 	slt	v0,v1,v0
    1a24:	1440ffe5 	bnez	v0,0x19bc
    1a28:	00000000 	nop
    1a2c:	afa0005c 	sw	zero,92(sp)
    1a30:	10000016 	b	0x1a8c
    1a34:	00000000 	nop
    1a38:	8fa2005c 	lw	v0,92(sp)
    1a3c:	00021080 	sll	v0,v0,0x2
    1a40:	03a21021 	addu	v0,sp,v0
    1a44:	8c430160 	lw	v1,352(v0)
    1a48:	24020001 	li	v0,1
    1a4c:	1462000c 	bne	v1,v0,0x1a80
    1a50:	00000000 	nop
    1a54:	3c020001 	lui	v0,0x1
    1a58:	8c429004 	lw	v0,-28668(v0)
    1a5c:	8c440000 	lw	a0,0(v0)
    1a60:	24030001 	li	v1,1
    1a64:	8fa2005c 	lw	v0,92(sp)
    1a68:	00431004 	sllv	v0,v1,v0
    1a6c:	00021827 	nor	v1,zero,v0
    1a70:	3c020001 	lui	v0,0x1
    1a74:	8c429004 	lw	v0,-28668(v0)
    1a78:	00831825 	or	v1,a0,v1
    1a7c:	ac430000 	sw	v1,0(v0)
    1a80:	8fa2005c 	lw	v0,92(sp)
    1a84:	24420001 	addiu	v0,v0,1
    1a88:	afa2005c 	sw	v0,92(sp)
    1a8c:	8fa2005c 	lw	v0,92(sp)
    1a90:	28420010 	slti	v0,v0,16
    1a94:	1440ffe8 	bnez	v0,0x1a38
    1a98:	00000000 	nop
    1a9c:	10000128 	b	0x1f40
    1aa0:	00000000 	nop
    1aa4:	8fa300fc 	lw	v1,252(sp)
    1aa8:	24020001 	li	v0,1
    1aac:	14620090 	bne	v1,v0,0x1cf0
    1ab0:	00000000 	nop
    1ab4:	8fa300f8 	lw	v1,248(sp)
    1ab8:	24020001 	li	v0,1
    1abc:	1462008c 	bne	v1,v0,0x1cf0
    1ac0:	00000000 	nop
    1ac4:	8fa200f4 	lw	v0,244(sp)
    1ac8:	14400089 	bnez	v0,0x1cf0
    1acc:	00000000 	nop
    1ad0:	00000000 	nop
    1ad4:	8fa200f0 	lw	v0,240(sp)
    1ad8:	1040fffe 	beqz	v0,0x1ad4
    1adc:	00000000 	nop
    1ae0:	10000013 	b	0x1b30
    1ae4:	00000000 	nop
    1ae8:	afa00060 	sw	zero,96(sp)
    1aec:	1000000c 	b	0x1b20
    1af0:	00000000 	nop
    1af4:	8fa20060 	lw	v0,96(sp)
    1af8:	00021080 	sll	v0,v0,0x2
    1afc:	03a21021 	addu	v0,sp,v0
    1b00:	8c4300a0 	lw	v1,160(v0)
    1b04:	8fa20060 	lw	v0,96(sp)
    1b08:	00021080 	sll	v0,v0,0x2
    1b0c:	03a21021 	addu	v0,sp,v0
    1b10:	ac430160 	sw	v1,352(v0)
    1b14:	8fa20060 	lw	v0,96(sp)
    1b18:	24420001 	addiu	v0,v0,1
    1b1c:	afa20060 	sw	v0,96(sp)
    1b20:	8fa20060 	lw	v0,96(sp)
    1b24:	28420010 	slti	v0,v0,16
    1b28:	1440fff2 	bnez	v0,0x1af4
    1b2c:	00000000 	nop
    1b30:	8fa300f0 	lw	v1,240(sp)
    1b34:	24020001 	li	v0,1
    1b38:	1062ffeb 	beq	v1,v0,0x1ae8
    1b3c:	00000000 	nop
    1b40:	00000000 	nop
    1b44:	8fa200f0 	lw	v0,240(sp)
    1b48:	1040fffe 	beqz	v0,0x1b44
    1b4c:	00000000 	nop
    1b50:	10000013 	b	0x1ba0
    1b54:	00000000 	nop
    1b58:	afa00064 	sw	zero,100(sp)
    1b5c:	1000000c 	b	0x1b90
    1b60:	00000000 	nop
    1b64:	8fa20064 	lw	v0,100(sp)
    1b68:	00021080 	sll	v0,v0,0x2
    1b6c:	03a21021 	addu	v0,sp,v0
    1b70:	8c4300a0 	lw	v1,160(v0)
    1b74:	8fa20064 	lw	v0,100(sp)
    1b78:	00021080 	sll	v0,v0,0x2
    1b7c:	03a21021 	addu	v0,sp,v0
    1b80:	ac4301a0 	sw	v1,416(v0)
    1b84:	8fa20064 	lw	v0,100(sp)
    1b88:	24420001 	addiu	v0,v0,1
    1b8c:	afa20064 	sw	v0,100(sp)
    1b90:	8fa20064 	lw	v0,100(sp)
    1b94:	28420010 	slti	v0,v0,16
    1b98:	1440fff2 	bnez	v0,0x1b64
    1b9c:	00000000 	nop
    1ba0:	8fa300f0 	lw	v1,240(sp)
    1ba4:	24020001 	li	v0,1
    1ba8:	1062ffeb 	beq	v1,v0,0x1b58
    1bac:	00000000 	nop
    1bb0:	afa0006c 	sw	zero,108(sp)
    1bb4:	1000000d 	b	0x1bec
    1bb8:	00000000 	nop
    1bbc:	8fa2006c 	lw	v0,108(sp)
    1bc0:	00021080 	sll	v0,v0,0x2
    1bc4:	03a21021 	addu	v0,sp,v0
    1bc8:	8c4301a0 	lw	v1,416(v0)
    1bcc:	8fa2006c 	lw	v0,108(sp)
    1bd0:	00431004 	sllv	v0,v1,v0
    1bd4:	8fa30068 	lw	v1,104(sp)
    1bd8:	00621021 	addu	v0,v1,v0
    1bdc:	afa20068 	sw	v0,104(sp)
    1be0:	8fa2006c 	lw	v0,108(sp)
    1be4:	24420001 	addiu	v0,v0,1
    1be8:	afa2006c 	sw	v0,108(sp)
    1bec:	8fa2006c 	lw	v0,108(sp)
    1bf0:	28420010 	slti	v0,v0,16
    1bf4:	1440fff1 	bnez	v0,0x1bbc
    1bf8:	00000000 	nop
    1bfc:	afa00070 	sw	zero,112(sp)
    1c00:	10000018 	b	0x1c64
    1c04:	00000000 	nop
    1c08:	afa00074 	sw	zero,116(sp)
    1c0c:	1000000d 	b	0x1c44
    1c10:	00000000 	nop
    1c14:	8fa20074 	lw	v0,116(sp)
    1c18:	24420001 	addiu	v0,v0,1
    1c1c:	00021080 	sll	v0,v0,0x2
    1c20:	03a21021 	addu	v0,sp,v0
    1c24:	8c430160 	lw	v1,352(v0)
    1c28:	8fa20074 	lw	v0,116(sp)
    1c2c:	00021080 	sll	v0,v0,0x2
    1c30:	03a21021 	addu	v0,sp,v0
    1c34:	ac430160 	sw	v1,352(v0)
    1c38:	8fa20074 	lw	v0,116(sp)
    1c3c:	24420001 	addiu	v0,v0,1
    1c40:	afa20074 	sw	v0,116(sp)
    1c44:	8fa20074 	lw	v0,116(sp)
    1c48:	2842000f 	slti	v0,v0,15
    1c4c:	1440fff1 	bnez	v0,0x1c14
    1c50:	00000000 	nop
    1c54:	afa0019c 	sw	zero,412(sp)
    1c58:	8fa20070 	lw	v0,112(sp)
    1c5c:	24420001 	addiu	v0,v0,1
    1c60:	afa20070 	sw	v0,112(sp)
    1c64:	8fa30070 	lw	v1,112(sp)
    1c68:	8fa20068 	lw	v0,104(sp)
    1c6c:	0062102a 	slt	v0,v1,v0
    1c70:	1440ffe5 	bnez	v0,0x1c08
    1c74:	00000000 	nop
    1c78:	afa00078 	sw	zero,120(sp)
    1c7c:	10000016 	b	0x1cd8
    1c80:	00000000 	nop
    1c84:	8fa20078 	lw	v0,120(sp)
    1c88:	00021080 	sll	v0,v0,0x2
    1c8c:	03a21021 	addu	v0,sp,v0
    1c90:	8c430160 	lw	v1,352(v0)
    1c94:	24020001 	li	v0,1
    1c98:	1462000c 	bne	v1,v0,0x1ccc
    1c9c:	00000000 	nop
    1ca0:	3c020001 	lui	v0,0x1
    1ca4:	8c429004 	lw	v0,-28668(v0)
    1ca8:	8c440000 	lw	a0,0(v0)
    1cac:	24030001 	li	v1,1
    1cb0:	8fa20078 	lw	v0,120(sp)
    1cb4:	00431004 	sllv	v0,v1,v0
    1cb8:	00021827 	nor	v1,zero,v0
    1cbc:	3c020001 	lui	v0,0x1
    1cc0:	8c429004 	lw	v0,-28668(v0)
    1cc4:	00831825 	or	v1,a0,v1
    1cc8:	ac430000 	sw	v1,0(v0)
    1ccc:	8fa20078 	lw	v0,120(sp)
    1cd0:	24420001 	addiu	v0,v0,1
    1cd4:	afa20078 	sw	v0,120(sp)
    1cd8:	8fa20078 	lw	v0,120(sp)
    1cdc:	28420010 	slti	v0,v0,16
    1ce0:	1440ffe8 	bnez	v0,0x1c84
    1ce4:	00000000 	nop
    1ce8:	10000095 	b	0x1f40
    1cec:	00000000 	nop
    1cf0:	8fa300fc 	lw	v1,252(sp)
    1cf4:	24020001 	li	v0,1
    1cf8:	14620091 	bne	v1,v0,0x1f40
    1cfc:	00000000 	nop
    1d00:	8fa300f8 	lw	v1,248(sp)
    1d04:	24020001 	li	v0,1
    1d08:	1462008d 	bne	v1,v0,0x1f40
    1d0c:	00000000 	nop
    1d10:	8fa300f4 	lw	v1,244(sp)
    1d14:	24020001 	li	v0,1
    1d18:	14620089 	bne	v1,v0,0x1f40
    1d1c:	00000000 	nop
    1d20:	00000000 	nop
    1d24:	8fa200f0 	lw	v0,240(sp)
    1d28:	1040fffe 	beqz	v0,0x1d24
    1d2c:	00000000 	nop
    1d30:	10000013 	b	0x1d80
    1d34:	00000000 	nop
    1d38:	afa0007c 	sw	zero,124(sp)
    1d3c:	1000000c 	b	0x1d70
    1d40:	00000000 	nop
    1d44:	8fa2007c 	lw	v0,124(sp)
    1d48:	00021080 	sll	v0,v0,0x2
    1d4c:	03a21021 	addu	v0,sp,v0
    1d50:	8c4300a0 	lw	v1,160(v0)
    1d54:	8fa2007c 	lw	v0,124(sp)
    1d58:	00021080 	sll	v0,v0,0x2
    1d5c:	03a21021 	addu	v0,sp,v0
    1d60:	ac430160 	sw	v1,352(v0)
    1d64:	8fa2007c 	lw	v0,124(sp)
    1d68:	24420001 	addiu	v0,v0,1
    1d6c:	afa2007c 	sw	v0,124(sp)
    1d70:	8fa2007c 	lw	v0,124(sp)
    1d74:	28420010 	slti	v0,v0,16
    1d78:	1440fff2 	bnez	v0,0x1d44
    1d7c:	00000000 	nop
    1d80:	8fa300f0 	lw	v1,240(sp)
    1d84:	24020001 	li	v0,1
    1d88:	1062ffeb 	beq	v1,v0,0x1d38
    1d8c:	00000000 	nop
    1d90:	00000000 	nop
    1d94:	8fa200f0 	lw	v0,240(sp)
    1d98:	1040fffe 	beqz	v0,0x1d94
    1d9c:	00000000 	nop
    1da0:	10000013 	b	0x1df0
    1da4:	00000000 	nop
    1da8:	afa00080 	sw	zero,128(sp)
    1dac:	1000000c 	b	0x1de0
    1db0:	00000000 	nop
    1db4:	8fa20080 	lw	v0,128(sp)
    1db8:	00021080 	sll	v0,v0,0x2
    1dbc:	03a21021 	addu	v0,sp,v0
    1dc0:	8c4300a0 	lw	v1,160(v0)
    1dc4:	8fa20080 	lw	v0,128(sp)
    1dc8:	00021080 	sll	v0,v0,0x2
    1dcc:	03a21021 	addu	v0,sp,v0
    1dd0:	ac4301a0 	sw	v1,416(v0)
    1dd4:	8fa20080 	lw	v0,128(sp)
    1dd8:	24420001 	addiu	v0,v0,1
    1ddc:	afa20080 	sw	v0,128(sp)
    1de0:	8fa20080 	lw	v0,128(sp)
    1de4:	28420010 	slti	v0,v0,16
    1de8:	1440fff2 	bnez	v0,0x1db4
    1dec:	00000000 	nop
    1df0:	8fa300f0 	lw	v1,240(sp)
    1df4:	24020001 	li	v0,1
    1df8:	1062ffeb 	beq	v1,v0,0x1da8
    1dfc:	00000000 	nop
    1e00:	afa00088 	sw	zero,136(sp)
    1e04:	1000000d 	b	0x1e3c
    1e08:	00000000 	nop
    1e0c:	8fa20088 	lw	v0,136(sp)
    1e10:	00021080 	sll	v0,v0,0x2
    1e14:	03a21021 	addu	v0,sp,v0
    1e18:	8c4301a0 	lw	v1,416(v0)
    1e1c:	8fa20088 	lw	v0,136(sp)
    1e20:	00431004 	sllv	v0,v1,v0
    1e24:	8fa30084 	lw	v1,132(sp)
    1e28:	00621021 	addu	v0,v1,v0
    1e2c:	afa20084 	sw	v0,132(sp)
    1e30:	8fa20088 	lw	v0,136(sp)
    1e34:	24420001 	addiu	v0,v0,1
    1e38:	afa20088 	sw	v0,136(sp)
    1e3c:	8fa20088 	lw	v0,136(sp)
    1e40:	28420010 	slti	v0,v0,16
    1e44:	1440fff1 	bnez	v0,0x1e0c
    1e48:	00000000 	nop
    1e4c:	afa0008c 	sw	zero,140(sp)
    1e50:	10000017 	b	0x1eb0
    1e54:	00000000 	nop
    1e58:	afa00090 	sw	zero,144(sp)
    1e5c:	1000000d 	b	0x1e94
    1e60:	00000000 	nop
    1e64:	8fa20090 	lw	v0,144(sp)
    1e68:	24420001 	addiu	v0,v0,1
    1e6c:	00021080 	sll	v0,v0,0x2
    1e70:	03a21021 	addu	v0,sp,v0
    1e74:	8c430160 	lw	v1,352(v0)
    1e78:	8fa20090 	lw	v0,144(sp)
    1e7c:	00021080 	sll	v0,v0,0x2
    1e80:	03a21021 	addu	v0,sp,v0
    1e84:	ac430160 	sw	v1,352(v0)
    1e88:	8fa20090 	lw	v0,144(sp)
    1e8c:	24420001 	addiu	v0,v0,1
    1e90:	afa20090 	sw	v0,144(sp)
    1e94:	8fa20090 	lw	v0,144(sp)
    1e98:	2842000f 	slti	v0,v0,15
    1e9c:	1440fff1 	bnez	v0,0x1e64
    1ea0:	00000000 	nop
    1ea4:	8fa2008c 	lw	v0,140(sp)
    1ea8:	24420001 	addiu	v0,v0,1
    1eac:	afa2008c 	sw	v0,140(sp)
    1eb0:	8fa3008c 	lw	v1,140(sp)
    1eb4:	8fa20084 	lw	v0,132(sp)
    1eb8:	0062102a 	slt	v0,v1,v0
    1ebc:	1440ffe6 	bnez	v0,0x1e58
    1ec0:	00000000 	nop
    1ec4:	afa00094 	sw	zero,148(sp)
    1ec8:	10000016 	b	0x1f24
    1ecc:	00000000 	nop
    1ed0:	8fa20094 	lw	v0,148(sp)
    1ed4:	00021080 	sll	v0,v0,0x2
    1ed8:	03a21021 	addu	v0,sp,v0
    1edc:	8c430160 	lw	v1,352(v0)
    1ee0:	24020001 	li	v0,1
    1ee4:	1462000c 	bne	v1,v0,0x1f18
    1ee8:	00000000 	nop
    1eec:	3c020001 	lui	v0,0x1
    1ef0:	8c429004 	lw	v0,-28668(v0)
    1ef4:	8c440000 	lw	a0,0(v0)
    1ef8:	24030001 	li	v1,1
    1efc:	8fa20094 	lw	v0,148(sp)
    1f00:	00431004 	sllv	v0,v1,v0
    1f04:	00021827 	nor	v1,zero,v0
    1f08:	3c020001 	lui	v0,0x1
    1f0c:	8c429004 	lw	v0,-28668(v0)
    1f10:	00831825 	or	v1,a0,v1
    1f14:	ac430000 	sw	v1,0(v0)
    1f18:	8fa20094 	lw	v0,148(sp)
    1f1c:	24420001 	addiu	v0,v0,1
    1f20:	afa20094 	sw	v0,148(sp)
    1f24:	8fa20094 	lw	v0,148(sp)
    1f28:	28420010 	slti	v0,v0,16
    1f2c:	1440ffe8 	bnez	v0,0x1ed0
    1f30:	00000000 	nop
    1f34:	10000002 	b	0x1f40
    1f38:	00000000 	nop
    1f3c:	00000000 	nop
    1f40:	00001025 	move	v0,zero
    1f44:	27bd01e0 	addiu	sp,sp,480
    1f48:	03e00009 	jr	ra
    1f4c:	00000000 	nop


 ==== .data section ====

tmp/a.out：     文件格式 elf32-tradlittlemips

Contents of section .data:
 9000 f0ffffff 00ffffff 00000000 00000000  ................
 9010 00000000                             ....            
