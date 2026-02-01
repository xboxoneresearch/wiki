# Bootanimation
Bootanimation is the Xbox loading animation showing at bootup of the console.

The file is stored in [XBFS](xbox-boot-file-system.md) as bootanim.dat.

It uses a proprietary format, likely specific to the AMD GPU.

## File format
The file starts with a section header (BOOTANIM_SECTION_HEADER) and then followed by unknown data of
size *Header->SectionSize*.

If the following data starts with the header magic, an additional section follows.

### BOOTANIM_SECTION_HEADER
| Offset | Length | Type     | Information                    |
| ------ | ------ | -------- | ------------------------------ |
| 0x00   | 0x04   | uint     | Magic (FS01)                   |
| 0x04   | 0x04   | uint     | SectionIndex                   |
| 0x08   | 0x04   | uint     | SectionSize                    |

Note: The magic on some revisions may have be FSEG. But on bootanim.dat files from 2022 to 2023 they use FS01.

### Different on each model

Other than the above mentioned section header, it seems the file format is different, take this output from radare2

The Series XS bootanim.dat file:
```
0x00000000  0x0000000031305346  0x0002eec0005dd85c   FS01....\.].....
0x00000010  0x000000484b414550  0x62cf681100000001   PEAKH........h.b
```

This was for the Series XS Bootanim.dat file, but on the Xbox One S OG, there is no PEAKH as shown here

The Xbox One S OG bootanim.dat file:
```
0x00000000  0x0000000031305346  0x0000000000468e80   FS01......F.....
0x00000010  0x0000000000000000  0x0000000000000000   ................
```

As you can see, `PEAKH` is missing on the OG boot animation file, there also seems to be many different ways in which its rendered, and the structure between the two in general .

The most likely conclusion (though simply conjecture), is that bootanim.dat has a thin wrapper being the section header, then the rest is prerendered for the GPU to execute, or being command buffers, or other GPU specific tasks and commands, explaining why it seems so different on each model, because every model that has a different GPU, has a different bootanim.dat file (and even different models with the same GPU, they may have some differences).

### Observable Notes

#### Encryption and compression

There seems to be no form of encryption or compression, the PH Entropy according to radare2 for the bootanim.dat on the Xbox One S, is 5.67646803, but on the Series XS it is 3.07538745. Which means there is a clear, and major structural difference between the two because of the hardware they sport.

#### No strings

radare2 found no ASCII strings anywhere within the file, ruling out any form of asset packaging.

#### No overlap between models (except header)

According to radiff2 no overlap was found other than the size, and the header itself, the only commonality was FS01, and the section index, the section size was different.

This is the following log from radiff2 -u between the Xbox One S animation, and the Series XS animation (`radiff2 -u XboxOneS_OG_bootanim.dat "../Series X S/bootanim.dat" | head`)
```
INFO: File size differs 33673216 vs 10874880
INFO: Buffer truncated to 10874880 byte(s) (22798336 not compared)
-0x00000008:80 8e 46  "\x80\x8eF"
+0x00000008:5c d8 5d  "\\\xd8]"
+0x0000000c:c0 ee 02  "\xc0\xee\x02"
+0x00000010:50 45 41 4b 48  "PEAKH"
+0x0000001c:11 68 cf 62 de 7d 02 3f 54 b4 01  "\x11h\xcfb\xde}\x02?T\xb4\x01"
+0x00000028:bc b9 05 3f 6d a3 01 00 80 e1 f2 3c 49 76 01 00 9c 0e ad 3e 6a 1f 01 00 e8 6d 2f 3f 54 b4 01 00 ca c6 33 3f 6d  "\xbc\xb9\x05?m\xa3\x01"
-0x0000004e:0a 1d 5b ce ea 2d 5b ce ea 2d 62 40 50 1c 5b ce ea 2d fb 27 d8 9c 5b ce 6a 2e 5b ce ea 2d 46 fa 9c 9c 74 3a 84 ae 95 a5 df 1a 74 3a 84 2e bf b8 a2 9c 55 f8 8f 9b 74 3a 04 af 74 3a 84 ae a4 42 15 1c 15 69 40 9c b3 5d eb ae b3 5d eb ae 47 db 36 1d b3 5d eb ae b3 5d 6b 2f b3 5d 6b 2f 5b 84 4a 9d a5 1a 38 2f a5 1a 38 2f a5 1a 38 2f db 7f ad 9c a5 1a 38 2f a5 1a b8 af a5 1a b8 af 44 31 6d 1d ce 2b 92 1d 88 ee 0c 9d 0d bb 84 af 0d bb 84 af 15 dd 55 1d 0d bb 04 30 0d bb 84 2f c1 5b 0a 9d b1 e2 b4 af 09 a9 c2 1d b1 e2 b4 2f b1 e2 34 30 b1 e2 b4 af b1 e2 34 b0 77 83 4f 1d b9 8b ec 2f 3e f2 c4 1d b9 8b ec af cb 2d ac 9d b9 8b 6c b0 9b 2a 34 9d b9 8b ec 2f 3a 50 90 1d 02 de 95 b0 02 de 15 30 02 de 15 30 02 de 15 b0 02 de 95 30 02 de 95 30 af bf 07 9e 02 2f 22 1e 13 44 b9 30 88 dd d3 9d 7a 9e 02 9e 7b 8d 61 9d 13 44 b9 b0 13 44 b9 b0 3e 58 af 1b 13 44 39 b0 bc 71 60 b0 bc 71 60 b0 31 55 f6 1d bc 71 60 30 bc 71 60 30 df 27 73 9d 78 8e a0 1e bc 71 e0 30 dc b0 73 9e e6 ba 85 30 43 e0 55 9e 4b cc 18 9e c6 67 46 1e e6 ba 85 30 a8 03 0f 1e e6 ba 85 b0 ae 23 9d 30 ae 23 9d b0 ae 23 9d b0 4d 2e a6 1c ae 23 9d b0 ae 23 9d b0 ae 23 9d b0 c6 78 45 9d f4 79 b6 b0 f4 79 36 31 f4 79 36 31 f4 79 b6 b0 f4 79 b6 30 f4 79 b6 30 f4 79 36 31 f4 79 b6 b0  "\n\x1d[\xce\xea-[\xce\xea-b@P\x1c[\xce\xea-\xfb'\xd8\x9c[\xcej.[\xce\xea-F\xfa\x9c\x9ct:\x84\xae\x95\xa5\xdf\x1at:\x84.\xbf\xb8\xa2\x9cU\xf8\x8f\x9bt:\x04\xaft:\x84\xae\xa4B\x15\x1c\x15i@\x9c\xb3]\xeb\xae\xb3]\xeb\xaeG\xdb6\x1d\xb3]\xeb\xae\xb3]k/\xb3]k/[\x84J\x9d\xa5\x1a8/\xa5\x1a8/\xa5\x1a8/\xdb\x7f\xad\x9c\xa5\x1a8/\xa5\x1a\xb8\xaf\xa5\x1a\xb8\xafD1m\x1d\xce+\x92\x1d\x88\xee\f\x9d\r\xbb\x84\xaf\r\xbb\x84\xaf\x15\xddU\x1d\r\xbb\x040\r\xbb\x84/\xc1[\n\x9d\xb1\xe2\xb4\xaf\t\xa9\xc2\x1d\xb1\xe2\xb4/\xb1\xe240\xb1\xe2\xb4\xaf\xb1\xe24\xb0w\x83O\x1d\xb9\x8b\xec/>\xf2\xc4\x1d\xb9\x8b\xec\xaf\xcb-\xac\x9d\xb9\x8bl\xb0\x9b*4\x9d\xb9\x8b\xec/:P\x90\x1d\x02\xde\x95\xb0\x02\xde\x150\x02\xde\x150\x02\xde\x15\xb0\x02\xde\x950\x02\xde\x950\xaf\xbf\a\x9e\x02/\"\x1e\x13D\xb90\x88\xdd\xd3\x9dz\x9e\x02\x9e{\x8da\x9d\x13D\xb9\xb0\x13D\xb9\xb0>X\xafD9\xb0\xbcq`\xb0\xbcq`\xb01U\xf6\x1d\xbcq`0\xbcq`0\xdf's\x9dx\x8e\xa0\x1e\xbcq\xe00\xdc\xb0s\x9e\xe6\xba\x850C\xe0U\x9eK\xcc\x18\x9e\xc6gF\x1e\xe6\xba\x850\xa8\x03\x0f\x1e\xe6\xba\x85\xb0\xae#\x9d0\xae#\x9d\xb0\xae#\x9d\xb0M.\xa6\x1c\xae#\x9d\xb0\xae#\x9d\xb0\xae#\x9d\xb0\xc6xE\x9d\xf4y\xb6\xb0\xf4y61\xf4y61\xf4y\xb6\xb0\xf4y\xb60\xf4y\xb60\xf4y61\xf4y\xb6\xb0"
+0x0000004e:01 00 40 b2 da 3e 1c a3 01 00 a0 82 ee 3e 6b 99 01 00 64 61 74 61 00 d8 5d 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 34 00 00 00 34 00 00 00 00 00 00 00 00 00 00 00 34 00 00 00 34 00 00 00 00 00 00 00 00 00 00 00 34 00 00 80 34 00 00 00 00 00 00 00 00 00 00 00 34 00 00 80 34 00 00 00 00 00 00 00 00 00 00 80 34 00 00 c0 34 00 00 00 00 00 00 00 00 00 00 80 34 00 00 c0 34 00 00 00 00 00 00 00 00 00 00 80 34 00 00 c0 34 00 00 00 00 00 00 00 00 00 00 c0 34 00 00 00 35 00 00 00 00 00 00 00 00 00 00 80 34 00 00 00 35 00 00 00 00 00 00 00 00 00 00 c0 34 00 00 20 35 00 00 00 00 00 00 00 00 00 00 00 34 00 00 c0 34 00 00 00 00 00 00 00 00 00 00 80 34 00 00 00 35 00 00 00 00 00 00 00 00 00 00 00 34 00 00 00 35 00 00 00 00 00 00 00 00 00 00 80 34 00 00 20 35 00 00 00 00 00 00 00 00 00 00 00 b4 00 00 80 34 00 00 00 00 00 00 00 00 00 00 00 b4 00 00 c0 34 00 00 00 00 00 00 00 00 00 00 80 b4 00 00 00 34 00 00 00 00 00 00 00 00 00 00 c0 b4 00 00 80 34 00 00 00 00 00 00 00 00 00 00 80 b4 00 00 00 34 00 00 00 00 00 00 00 00 00 00 c0 b4 00 00 80 34 00 00 00 00 00 00 00 00 00 00 00 b5  "\x01"
-0x000001ed:43 0e 1e 0f ba 51 b1 0f ba d1 b0 0f ba d1 30 15 90 a9 9c 78 ce 1f 1e 0f ba 51 b1 0f ba d1 30 d5 e6 09 1e 48 ed ee 30 ed 71 db 9c e0 ad 34 9e 48 ed ee b0 48 ed ee b0 48 ed ee 30 0d f1 e2 1d 4f 92 d0 9d 6f 33 28 9e ee 30 a1 1e df 9a 49 9d db b3 7b 1e f2 09 07 31 f2 09 07 31 6f 80 1a 9f 09 3d c8 9c 59 96 17 31 bd d4 04 1e 39 67 c4 9e 59 96 17 31 59 96 17 b1 59 96 97 b1 d7 3e 6e 1c 52 8a 40 9d 2c 1b a9 b1 cb ab 1e 9e a3 92 03 9c 2c 1b 29 b1 2c 1b 29 31 2c 1b a9 31 f0 c9 01 9e 81 9d 3b b1 81 9d bb 31 4f d3 8d 1d bc 58 81 1d 81 9d 3b 31 d8 07 33 9e 81 9d bb b1 0b 06 0b 9f dd 1b 4f 31 dd 1b 4f b1 cc 61 95 9d 36 f2 9f 9b dd 1b 4f b1 dd 1b 4f b1 dd 1b cf 31 dd 1b 4f b1 ed 96 63 b1 df c2 95 1e ed 96 63 b1 41 81 57 9e ab 29 05 9f ed 96 63 31 ed 96 63 b1 ed 96 e3 31 57 0f 79 31 57 0f 79 31 57 0f f9 31 61 e4 e3 1d 6c 5c 7d 9e 28 eb 59 9d 56 18 85 9e 57 0f 79 b1 f5 c2 87 b1 f5 c2 87 b1 f5 c2 87 b1 ad 74 d6 1d fd c7 06 9e f5 c2 87 b1 5d 3a 05 1f ad 76 00 1e  "C\x0e\x1e\x0f\xbaQ\xb1\x0f\xba\xd1\xb0\x0f\xba\xd10\x15\x90\xa9\x9cx\xce\x1f\x1e\x0f\xbaQ\xb1\x0f\xba\xd10\xd5\xe6\t\x1eH\xed\xee0\xedq\xdb\x9c\xe0\xad4\x9eH\xed\xee\xb0H\xed\xee\xb0H\xed\xee0\r\xf1\xe2\x1dO\x92\xd0\x9do3(\x9e\xee0\xa1\x1e\xdf\x9aI\x9d\xdb\xb3{\x1e\xf2\t\a1\xf2\t\a1o\x80\x1a\x9f\t=\xc8\x9cY\x96\x171\xbd\xd4\x04\x1e9g\xc4\x9eY\x96\x171Y\x96\x17\xb1Y\x96\x97\xb1\xd7>n\x1cR\x8a@\x9d,\xb1\xcb\xab\x1e\x9e\xa3\x92\x03\x9c,\xb1,1,1\xf0\xc9\x01\x9e\x81\x9d;\xb1\x81\x9d\xbb1O\xd3\x8d\x1d\xbcX\x81\x1d\x81\x9d;1\xd8\a3\x9e\x81\x9d\xbb\xb1\v\x06\v\x9f\xdd1\xdd\xb1\xcca\x95\x9d6\xf2\x9f\x9b\xdd\xb1\xdd\xb1\xdd1\xdd\xb1\xed\x96c\xb1\xdf\xc2\x95\x1e\xed\x96c\xb1A\x81W\x9e\xab)\x05\x9f\xed\x96c1\xed\x96c\xb1\xed\x96\xe31W\x0fy1W\x0fy1W\x0f\xf91a\xe4\xe3\x1dl\\}\x9e(\xebY\x9dV\x18\x85\x9eW\x0fy\xb1\xf5\xc2\x87\xb1\xf5\xc2\x87\xb1\xf5\xc2\x87\xb1\xadt\xd6\x1d\xfd\xc7\x06\x9e\xf5\xc2\x87\xb1]:\x05\x1f\xadv"
-0x0000032d:80 93 31 af ed a2 1e  "\x80\x931\xaf\xed\xa2\x1e"
```

#### File Signing

rabin2 gave the following results
```
crypto   false
havecode false
bits     0
```
This heavily implies if not outright disproves any form of crypto signing on the bootanim.dat file format, meaning if there are any checks they are built into the OS in the form of checking the hash. Though we cannot rule out the fact that the OS may not check hashes.
