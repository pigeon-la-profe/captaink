10tp%=0:POKE VAL("&H"+HEX$(VARPTR(tp%))),PEEK(&HFC4A):POKE VAL("&H"+HEX$(VARPTR(tp%)+1)),PEEK(&HFC4B):clear200,tp%-100:DEFINTA-Z
11tp=0:POKE VAL("&H"+HEX$(VARPTR(tp))),PEEK(&HFC4A):POKE VAL("&H"+HEX$(VARPTR(tp)+1)),PEEK(&HFC4B)
20SCREEN2,2,0:COLOR15,0,0:VDP(1)=VDP(1)AND191
30BLOAD"splash.sc2",S:VDP(1)=VDP(1)OR64:tl=34:le=0
40_turboon(le)
50TIME=0
60FORI=2TO17:VPOKE6144+I+32*22,0:NEXTI:GOSUB80:IFTIME>50THENTIME=0:GOTO70ELSEGOTO60
70RESTORE110:FORI=0TO15:READA:VPOKE6144+2+I+32*22,A:NEXTI:GOSUB80:IFTIME>50GOTO50ELSEGOTO70
80kb$=INKEY$:IFkb$=""THENRETURNELSEIFkb$="l"THENle=le+1:RETURNELSEGOTO90
90_turbooff
100VDP(1)=VDP(1)AND191:IFle>tlTHENle=tl
110BLOAD"C29.sc2",S
120BLOAD"sprites.sc2",S
130'LOAD"capk.bas",R
140'LOAD"captaink.bas"
150POKEtp,le:POKEtp+2,0:POKEtp+3,0:LOAD"loadlvc.bas",r
160'POKEtp,le:POKEtp+2,0:POKEtp+3,0:LOAD"loadlv.bas"
1000DATA224,225,226,0,227,195,226,0,228,231,0,229,228,224,230,228
