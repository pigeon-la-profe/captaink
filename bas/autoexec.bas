10tp%=0:POKE VAL("&H"+HEX$(VARPTR(tp%))),PEEK(&HFC4A):POKE VAL("&H"+HEX$(VARPTR(tp%)+1)),PEEK(&HFC4B):clear200,tp%-100:DEFINTA-Z
11tp=0:POKE VAL("&H"+HEX$(VARPTR(tp))),PEEK(&HFC4A):POKE VAL("&H"+HEX$(VARPTR(tp)+1)),PEEK(&HFC4B)
20SCREEN2,2,0:COLOR15,0,0:VDP(1)=VDP(1)AND191
30BLOAD"splashdi.sc2",S:VDP(1)=VDP(1)OR64:tl=145:le=0
40_turboon(le)
42DIMch(17)
45:R=RND(-TIME)
50TIME=0
60GOSUB78:IFTIME>50THENGOSUB100:TIME=0:GOTO70ELSEGOTO60
70GOSUB78:IFTIME>50THENGOSUB200:GOTO50ELSEGOTO70
78co=co+1:IFco>30THEN:co=0:GOSUB370
80kb$=INKEY$:IFkb$=""THENRETURNELSEIFkb$="l"THENle=le+1:RETURNELSEGOTO90
90IFkb$="L"THENle=le+10:RETURNELSEGOTO600
100FORI=2TO17:VPOKE6144+I+32*22,0:NEXTI:RETURN
200RESTORE1000:FORI=0TO15:READA:VPOKE6144+2+I+32*22,A+32:NEXTI:RETURN
370FORI=167TO184:ch(I-167)=VPEEK(8192+(I+512)*8):VPOKE8192+(I+512)*8,VPEEK(8192+7+(I-32+512)*8):NEXTI
380FORE=7TO0STEP-1:FORI=135TO152
390IFE>0THENVPOKE8192+E+(I+512)*8,VPEEK(8192+E+(I+512)*8-1)
400IFE=0THENVPOKE8192+E+(I+512)*8,VPEEK(8192+7+(I-32+512)*8)
410NEXTI:NEXTE:FORI=103TO120:VPOKE8192+7+(I+512)*8,VPEEK(8192+6+(I+512)*8):VPOKE8192+6+(I+512)*8,ch(I-103):NEXTI
420FORE=5TO0 STEP -1:FORI=211TO212
440IFE=5THENch(I-211)=VPEEK(8192+E+(I+256)*8):VPOKE8192+5+(I+256)*8,VPEEK(8192+(I+256)*8+4)
450IFE<5ANDE>0THENVPOKE8192+(I+256)*8+E,VPEEK(8192+(I+256)*8+E-1)
460IFE=0THENVPOKE8192+(I+256)*8,VPEEK(8192+7+(I-32+256)*8)
470NEXTI:NEXTE:FORE=7TO0STEP-1:FORI=179TO180
500IFE>0THENVPOKE8192+E+(I+256)*8,VPEEK(8192+E+(I+256)*8-1)
510IFE=0THENVPOKE8192+E+(I+256)*8,VPEEK(8192+7+(I-32+256)*8)
520NEXTI:NEXTE
530FORI=147TO148:VPOKE8192+7+(I+256)*8,VPEEK(8192+6+(I+256)*8)
540VPOKE8192+7+(I+256)*8,VPEEK(8192+6+(I+256)*8)
550VPOKE8192+6+(I+256)*8,ch(I-147)
560NEXTI:RETURN
600_turbooff
700VDP(1)=VDP(1)AND191:IFle>tlTHENle=tl
710BLOAD"C0.sc2",S
720BLOAD"sprite2.sc2",S
750POKEtp,le:POKEtp+1,tl:POKEtp+2,0:POKEtp+3,0:POKEtp+77,0:LOAD"loadlvc.bas",r
760'POKEtp,le:POKEtp+1,tl:POKEtp+2,0:POKEtp+3,0:POKEtp+77,0:LOAD"loadlv.bas"
765'POKEtp,le:POKEtp+1,tl:POKEtp+2,0:POKEtp+3,0:POKEtp+77,0:LOAD"loadlvs.bas",r
1000'DATA224,225,226,0,227,195,226,0,228,231,0,229,228,224,230,228
1010DATA160,173,185,187,170,164,185,187,180,175,187,179,180,160,178,180

