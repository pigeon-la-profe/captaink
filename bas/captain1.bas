100hm%=0:POKEVAL("&H"+HEX$(VARPTR(hm%))),PEEK(&HFC4A):POKEVAL("&H"+HEX$(VARPTR(hm%)+1)),PEEK(&HFC4B):clear200,hm%:DEFINTA-Z
110hm=0:POKEVAL("&H"+HEX$(VARPTR(hm))),PEEK(&HFC4A):POKEVAL("&H"+HEX$(VARPTR(hm)+1)),PEEK(&HFC4B)
900le=0:pu=0:DIMHI(14,3):km=0:kn=0:ks=0:ld=0:h4=0:ck=27:lk=0:pm=0:p1=0:p2=0:py=0:px=0:pz=0:ph=3:cs=11:GOSUB30800:vdp(4)=0:vdp(3)=159:R=RND(-TIME):IFPEEK(&H002B)>128THENde=3000ELSEde=3600
3000_turboon(le,pu,HI(),lk,km,kn,ks,ld,h4,ck,pm,p1,p2,py,px,pz,ph,cs,de)
3010DIMpt(5):DIMTL(4):DIMCL(8):DIMRE(6):DIMRY(10):DIMTK(2):DIMTR(6):DIMCF(6,2)
3040SOUND7,184:CX=16:CY=-24:pt(1)=12:pt(2)=24:pt(3)=36:pt(4)=30:nu=1:rt=5:tc=10:wi=0:tp=0:ta=0:et=0:tt=128:tf=1:tb=0:GOSUB11000:T$=STR$(pu):tx%=25:ty%=22:tq=7:GOSUB9990:VDP(1)=VDP(1)OR64
4000S=STICK(0):IFS=0THENS=STICK(1)'mloop
5200IFS=3ORS=2ORS=4THENPO=0:ur=ur+1:FA=0
5210IFS=7ORS=6ORS=8THENPO=1:ur=ur+1:FA=1
5220IFur>8ANDPO=0ANDsa=0ANDCL(2)=0THENCX=CX+3:it=it+3:it=itmod12:ur=0:GOSUB14000:GOSUB9600:GOSUB14900ELSEIFur>8ANDPO=0ANDsa=0THENGOSUB14030
5225IFur>8ANDPO=1ANDsa=0ANDCL(3)=0THENCX=CX-3:it=it+3:it=itmod12:ur=0:GOSUB14000:GOSUB9600:GOSUB14900ELSEIFur>8ANDPO=1ANDsa=0THENGOSUB14050
5230IFS=0THENPO=2:vr=vr+1
5235IFS=1ORSTRIG(3)=-1THENPO=3:vr=vr+1
5239IFCL(0)=0THENGOSUB7800
5250IFvr>200AND(PO=2ORPO=3)THENpa=pa+3:pa=pamod6:vr=0:GOSUB9500
5260S1=STRIG(0):IFS1=0THENS1=STRIG(1)
7500IFS1=-1ANDsa=0AND(CL(0)=1ORp6=1)THENgosub7530ELSEIFsa=1THENGOSUB8117elseifws<>0thensz=ws:ws=0:gosub8000
7510IFTIME>2THENGOSUB14100
7520GOTO4000
7530ws=ws+1:ifws>32thenws=32
7540return
7800AR=AR+1:IFCL(4)=1ORCL(7)=1OR(pd>=0ANDpd<18ANDpe)THENsp=1ELSEsp=3'GR
7820IFAR>2ANDsa=0ANDp6=0THENCY=CY+sp:AR=0:it=FA*3:PO=4:GOSUB9600:IFCL(0)=1THEN:si=1:su=5:fe=2:GOSUB14970
7830RETURN
8000'SA
8100IFfr=0THENsa=1:im=3
8110IF(S=2ORS=3ORS=4)THENco=1ELSEIFS=1THENco=1:PO=0
8115IF(S=7ORS=8ORS=6)THENco=2ELSEIFS=5THENco=2:PO=1
8117IFfr<=sz\2GOTO8120
8118IFCL(4)=1ORCL(7)=1OR(pd>=0ANDpd<8ANDpe)THENim=-1ELSEim=-3
8119IFp6=1THENim=0
8120sr=sr+1:IFsr>4THENfr=fr+1:CY=CY-im:CY=CYMOD192:sr=0ELSEGOTO8160
8130IFco=1ANDCL(2)=0THENCX=CX+2:GOSUB14000
8140IFco=2ANDCL(3)=0THENCX=CX-2:GOSUB14000
8150GOSUB9600
8160IFfr<3ANDCL(1)=0GOTO8200
8170IFfr>szORCL(0)=1ORCL(1)=1ORCL(2)=1ORCL(3)=1THENfr=0:sr=0:fr=0:co=0:sa=0:su=5:si=1:fe=2:GOSUB14970
8200RETURN
9500PUTSPRITE0,(CX,CY),1,pa+pt(PO):PUTSPRITE1,(CX,CY),cs,1+pa+pt(PO):PUTSPRITE2,(CX,CY),11,2+pa+pt(PO):GOTO9700
9600PUTSPRITE0,(CX,CY),1,it+pt(PO):PUTSPRITE1,(CX,CY),cs,1+it+pt(PO):PUTSPRITE2,(CX,CY),11,2+it+pt(PO)
9700T1=(CX+4)\8:T2=(CY+17)\8:GOSUB9840:C1=C0:T1=(CX+6)\8:T2=(CY)\8:GOSUB9840:C2=C0'col
9732T1=(CX+12)\8:T2=(CY+17)\8:GOSUB9840:C8=C0:T1=(CX+10)\8:T2=(CY)\8::GOSUB9840:C9=C0
9734T1=(CX+8+9)\8:T2=(CY+16)\8:GOSUB9840:C3=C0:T1=(CX+8+9)\8:T2=(CY+8)\8:GOSUB9840:C4=C0
9736T1=(CX-1)\8:T2=(CY+8)\8:GOSUB9840:C5=C0:T1=(CX-1)\8:T2=(CY+16)\8:GOSUB9840:C6=C0
9738T1=(CX)\8:T2=(CY+20)\8:GOSUB9840:C7=C0:T1=(CX+15)\8:T2=(CY+20)\8:GOSUB9840:W2=C0
9760IF(C1>kmANDC1<kn)OR(C8>kmANDC8<kn)THENCL(0)=1ELSECL(0)=0
9770IF(C2>kmANDC2<kn)OR(C9>kmANDC9<kn)THENCL(1)=1ELSECL(1)=0
9780IF(C3>kmANDC3<kn)OR(C4>kmANDC4<kn)THENCL(2)=1ELSECL(2)=0
9790IF(C5>kmANDC5<kn)OR(C6>kmANDC6<kn)THENCL(3)=1ELSECL(3)=0
9800IFC7>kmANDC7<knTHENCL(4)=1ELSECL(4)=0
9805IFW2>kmANDW2<knTHENCL(7)=1ELSECL(7)=0
9810IF(C6>3ANDC6<10)OR(C3>3ANDC3<10)THENCL(5)=1ELSECL(5)=0
9820IFC3=ck-1ANDC6=ckTHENCL(6)=1ELSECL(6)=0
9230RETURN
9840C0=VPEEK(6144+T1+T2*32):RETURN
9990L=LEN(T$)-1:T$=RIGHT$(T$,L):OU$=STRING$(tq-L," ")+T$:FORI=1TOLEN(OU$):CT$=MID$(OU$,I,1):VPOKE6144+tx%+ty%*32+I-1,ASC(CT$)-32:NEXTI:RETURN
11000FORI=0TO5:TR(I)=I:NEXTI:y0=0:y2=0:tj=0:FORI=0TO767:RY(y0)=0:IFVPEEK(6144+I)=73THENRY(y0)=I:y0=y0+1
11210IFVPEEK(6144+I)=ckTHENGOSUB14640:CF(tj,1)=tj+4:CF(tj,0)=I+6144:y2=y2+1
11220IFy0>9ANDy2>5THENI=767
11230NEXTI:FORI=0TO5:TR(I)=I+4:NEXTI:rt=5:RETURN
14000IFCX>240THENCX=240
14010IFCX<0THENCX=0:RETURNELSERETURN
14030IF(C3>kmANDC3<kn)AND(C4<=kmORC4>=kn)ANDCX<240THENCX=CX+4:CY=CY-8:it=it+3:it=itmod12:ur=0:GOSUB14000:GOSUB9600:GOSUB14900:RETURNELSERETURN
14050IF(C6>kmANDC6<kn)AND(C5<=kmORC5>=kn)THENCX=CX-4:CY=CY-8:it=it+3:it=itmod12:ur=0:GOSUB14000:GOSUB9600:GOSUB14900:RETURNELSERETURN
14100TIME=0:GOSUB17000:GOSUB18010:GOSUB18200:GOSUB18500:nu=nu+1:de=de-1:IF(C3=tjORC6=tj)ANDCL(5)=1ANDtp=2THENVPOKE6144+23*32+7+tj-4,tj:tc=tj:ki=1:ku=10:si=1:su=10:GOSUB14960:GOSUB14780
14105IFtc=10THENta=ta+1
14110IFnu>6THENnu=1
14120IFsi>0ANDsi<suTHENsi=si+1ELSEsi=0
14125IFki>0ANDki<kuTHENki=ki+1ELSEki=0
14130T$=STR$(de):tx%=25:ty%=23:tq=7:GOSUB9990:FORI=0TO5:IFCF(I,1)<10THENVPOKECF(I,0)+1-1*32,nu+16
14140NEXTI:tm=tm+1:IFtm>4THENVPOKEld*8+3,RND(1)*250:VPOKEld*8+4,RND(1)*250:VPOKE8192+ld*8+3,RND(1)*250:VPOKE8192+ld*8+4,RND(1)*250
14150IFtm>4ANDh4<>0THENFORI=0TO7:VPOKE8192+lK*8+I,RND(1)*16:VPOKElK*8+I,(VPEEK(lK*8+I))+(RND(1)*2-2):NEXTI
14160IFtm>4THENtm=0
14190tn=tn+1:IFtn<2THENGOTO14275
14200FORI=0TO9:w4=VPEEK(6144+RY(I)):IFRY(I)>0AND(w4<4ORw4>9)THENVPOKE6144+RY(I),73+y1
14210NEXTI:tn=0:y1=y1+1:IFy1>3THENy1=0
14275'tarj
14289GOSUB14470:ON(tp+1)\1GOTO14290,14300,14325
14290IFta>=tt ANDtc=10THENta=0:tp=1:xt=RND(1)*32:yt=0:GOSUB14640:t0=VPEEK(6144+xt+(yt*32)):VPOKE6144+14+32*22,9:GOSUB15000ELSEGOTO14400
14300te=t0:t0=VPEEK(6144+xt+((yt+1)*32)):TK(0)=te:TK(1)=6144+xt+(yt*32):SOUND2,yt+6
14310IFyt=0AND(t0>kmANDt0<kn)THENVPOKE6144+xt+(yt*32),tj:tp=2:ta=0:SOUND9,0:GOTO14540
14315IF(t0>kmANDt0<kn)THENtp=2:ta=0:SOUND9,0:GOTO14540
14320yt=yt+1:VPOKE6144+xt+(yt*32),tj:VPOKE6144+xt+((yt-1)*32),te:GOTO14400
14325GOSUB14720
14400'CTARJ
14410T1=(CX-1)\8:T2=(CY+9)\8:C0=6144+T1+T2*32:FORI=0TO5:IFPO=3ANDCL(6)=1ANDCF(I,0)=C0ANDtc=CF(I,1)THENmc=mc+1:cp=I:I=5
14420NEXTI:ifmc>0ANDPO=3thensound7,184:sound9,10:sound3,0:sound2,mc+RND(1)*200+30ELSEmc=0:IFtp=0thensound9,0
14425IFmc=0andCL(6)=1andPO=3thenGOSUB14950
14430IFmc=96THENmc=0:VPOKE6144+7+cp+22*32,59:VPOKECF(cp,0)+1-1*32,CF(cp,1):CF(cp,1)=11:tc=10:ta=0:cp=0:sound9,0:wi=wi+1
14440IFwi=6THENpu=pu+de:T$=STR$(pu):tx%=25:ty%=22:tq=7:GOSUB9990:T1$=" YOU"+" "+"WIN":GOTO15100
14450IFde<=0THENT1$=" YOU"+" "+"LOSE":GOTO15100
14460RETURN
14470T$=STR$(le+1):IF(le+1)<10THENT$=" 0"+RIGHT$(T$,1)
14480tx%=15:ty%=23:tq=2:GOSUB9990:IFtp=2THENtz=tb:tw=tt*tfELSEtz=ta:tw=tt
14490IFtz>(tw\2)THENVPOKE6144+19+32*23,104ELSEVPOKE6144+19+32*23,96+tz\(tw\16)
14500IFtz<=(tw\2)THENVPOKE6144+18+32*23,96ELSEVPOKE6144+18+32*23,96+(tz-(tw\2))\(tw\16)
14510IFmc>48THENVPOKE6144+19+32*22,104ELSEVPOKE6144+19+32*22,96+mc\6
14520IFmc<=48THENVPOKE6144+18+32*22,96ELSEVPOKE6144+18+32*22,96+(mc-48)\6
14530RETURN
14540IF(te=90ORte=91)ANDet=2THENte=e1:TK(0)=e1ELSEIF(te=88ORte=89)ANDdt=2THENte=d1:TK(0)=d1
14600RETURN
14640IFrt>=0THENtk=(INT(RND(TIME)*(rt+1))):tj=TR(tk):rt=rt-1:FORE=tkTO4:TR(E)=TR(E+1):NEXTE
14650RETURN
14720'BrTARJ
14730tb=tb+1:IFtb<tt*tfTHENVPOKE6144+xt+(yt*32),tj:RETURN
14740tb=0:rt=rt+1:TR(rt)=tj
14780VPOKETK(1),TK(0):tp=0:ta=0:tb=0:VPOKE6144+14+32*22,94:RETURN
14900IFfe>1ANDsi=0ANDCL(0)=1THENRESTORE15940:fe=0:GOSUB15890:RESTORE15910:GOTO15890ELSEfe=fe+1:RETURN
14950RESTORE15940:GOSUB15890:RESTORE15920:GOTO15890
14960RESTORE15950:GOSUB15890:RESTORE15930:GOTO15890
14965RESTORE15940:GOSUB15890:RESTORE16000:GOTO15890
14970IFki=0THENRESTORE15940:GOSUB15890:RESTORE15925:GOTO15890ELSERETURN
15000RESTORE15900:GOTO15890
15010RESTORE16010:GOTO15890
15100SOUND7,191:FORI=5TO27:FORE=7TO14:VPOKE6144+I+E*32,0:NEXTE:NEXTI:T$=T1$:tx%=9:ty%=10:tq=11:GOSUB9990:T$=" C"+" "+"CONTINUE":tx%=11:ty%=12:tq=11:GOSUB9990:CY=209:GOSUB9600
15110kb$=INKEY$:IFkb$<>"c"ANDkb$<>"C"GOTO15110
15120IFwi=6THENle=le+1:IFle>26THENle=0
15130GOTO18900
15890FORI=1TO7:READn1,n2:SOUNDn1,n2:NEXTI:RETURN
15900DATA2,0,3,1,7,184,11,0,12,0,13,0,9,10
15910DATA4,65,5,1,7,184,11,70,12,2,13,0,10,16
15920DATA4,25,5,3,7,184,11,0,12,7,13,0,10,16
15925DATA4,25,5,6,7,184,11,70,12,2,13,0,10,16
15930DATA4,25,5,1,7,184,11,0,12,50,13,0,10,16
15940DATA4,0,5,0,7,184,11,0,12,0,13,0,10,0
15950DATA2,0,3,0,7,184,11,0,12,0,13,0,9,0
16000DATA4,65,5,4,7,184,11,70,12,8,13,0,10,16
16010DATA0,0,1,3,7,184,11,0,12,0,13,0,8,10
17000'hide plat
17000ON(h4+1)\1GOTO18000,17020,17500
17020h1=h1+1:IFh1>30THENh1=0:h4=2ELSERETURN
17030h2=(INT(RND(TIME)*(14))):n3=HI(h2,2):n1=HI(h2,0):IFn3<>1THENn3=n3+2ELSEn1=n1+1
17040FORI=0TOn3-1:VPOKE6144+n1+I+32*HI(h2,1),lk:NEXTI:h4=2:IFNOT(mc>0ANDPO=3)THENki=1:ku=10:si=1:su=10:GOSUB14965:RETURN
17500h1=h1+1:IFh1>100THENh1=0:h4=1:GOTO17510ELSERETURN
17510FORE=0TOHI(h2,2)-1:VPOKE6144+HI(h2,0)+1+E+32*HI(h2,1),km+1:NEXTE:IFHI(h2,2)<>1THENVPOKE6144+HI(h2,0)+32*HI(h2,1),km+3:VPOKE6144+HI(h2,0)+HI(h2,2)+1+32*HI(h2,1),km+2
18000RETURN
18010'clock
18020ON(et+1)\1GOTO18025,18040,18090,18080
18025IFde<800ANDwi>=3THENGOTO18030ELSERETURN
18030e6=e6+1:IFe6>50THENe5=(INT(RND(TIME)*(1000))):e6=0ELSERETURN
18035IFe5>700-(6-wi)*10THENet=1:xe=RND(1)*32:ye=0:e0=VPEEK(6144+xe+(ye*32)):VPOKE6144+15+32*22,90:GOSUB15010ELSEGOTO18080
18040e1=e0:e0=VPEEK(6144+xe+((ye+1)*32)):e3=6144+xe+(ye*32):SOUND0,ye+6
18050IFye=0AND(e0>kmANDe0<kn)THENVPOKE6144+xe+(ye*32),90:et=2:SOUND8,0:GOTO18140
18060IF(e0>kmANDe0<kn)THENet=2:SOUND8,0::GOTO18140
18070ye=ye+1:VPOKE6144+xe+(ye*32),90:VPOKE6144+xe+((ye-1)*32),e1
18080RETURN
18090IF((C3>=90ANDC3<=91)OR(C6>=90ANDC6<=91))THENde=de+300:VPOKEe3,e1:e2=0:et=3:ki=1:ku=10:si=1:su=10:VPOKE6144+15+32*22,93:GOSUB14960:RETURN
18100e2=e2+1:IFe2<128THENGOTO18120ELSEe2=0
18110VPOKEe3,e1:et=0:VPOKE6144+15+32*22,93:RETURN
18120e4=e4+1:IFe4>6THENVPOKE6144+xe+(ye*32),90+e2MOD2:e4=0
18130RETURN
18140IF(e1>=4ANDe1<=9)ANDtp=2THENe1=teELSEIF(e1=88ORe1=89)ANDdt=2THENe1=d1
18150RETURN
18200'plat mov
18210IFpm<>1THENRETURN
18230ON(pg+1)\1GOTO18250,18270
18250py=pz+1:ps=0:pg=1:RETURN
18270FORI=0TO2:ifpy<pz+1thenVPOKE6144+px+py*32+I,p2-ps
18275IFpy>phTHENVPOKE6144+px+(py-1)*32+I,p1+ps
18280NEXTI:pc=(py-1)*8+8-ps-1:pf=px*8-12:IFpc>=(CY+16)THENpd=pc-(CY+16):pe=(CX>=pfAND(CX+16)<=(pf+5*8+4))
18310IF(CY+16)<=pcAND(CY+16)>=(pc-4)ANDpeTHENCY=CY-1+pd:GOSUB9500:p6=1ELSEp6=0:p7=0
18350ps=ps+1:IFps=8THENpy=py-1:ps=0
18360IFpy<phTHENpg=0
18370IFp7=0ANDp6=1THENGOSUB14970:p7=1
18400RETURN
18500'clock2
18520ON(dt+1)\1GOTO18525,18540,18590,18580
18525IFde<400ANDwi>=4ANDet<>1THENGOTO18530ELSERETURN
18530d6=d6+1:IFd6>50THENd5=(INT(RND(TIME)*(2000))):d6=0ELSERETURN
18535IFd5>1500-(6-wi)*10THENdt=1:xd=RND(1)*32:yd=0:d0=VPEEK(6144+xd+(yd*32)):VPOKE6144+16+32*22,88:GOSUB15010ELSEGOTO18580
18540d1=d0:d0=VPEEK(6144+xd+((yd+1)*32)):d3=6144+xd+(yd*32):SOUND0,yd+6
18550IFyd=d0AND(d0>kmANDd0<kn)THENVPOKE6144+xd+(yd*32),88:dt=2:SOUND8,0:GOTO18640
18560IF(d0>kmANDd0<kn)THENdt=2:SOUND8,0:GOTO18640
18570yd=yd+1:VPOKE6144+xd+(yd*32),88:VPOKE6144+xd+((yd-1)*32),d1
18580RETURN
18590IF((C3>=88ANDC3<=89)OR(C6>=88ANDC6<=89))THENtt=64:tf=3:VPOKEd3,d1:d2=0:dt=3:ki=1:ku=10:si=1:su=10:VPOKE6144+16+32*22,92:GOSUB14960:RETURN
18600d2=d2+1:IFd2<128THENGOTO18620ELSEd2=0
18610VPOKEd3,d1:dt=0:VPOKE6144+16+32*22,92:RETURN
18620d4=d4+1:IFd4>6THENVPOKE6144+xd+(yd*32),88+d2MOD2:d4=0
18630RETURN
18640IF(d1>=4ANDd1<=9)ANDtp=2THENd1=teELSEIF(d1=90ORd1=91)ANDet=2THENd1=e1
18650RETURN
18900_turbooff
19000POKEhm,le:POKEhm+2,PEEK(VARPTR(pu)):POKEhm+3,PEEK(VARPTR(pu)+1):run"loadlvc.bas"
30800_turboon(le,pu,HI(),lk,km,kn,ks,ld,h4,ck,pm,p1,p2,py,px,pz,ph,hm,cs)
40000le=PEEK(hm):pu=PEEK(hm+2)+256*PEEK(hm+3):lk=PEEK(hm+4):km=PEEK(hm+6):kn=PEEK(hm+8):ks=PEEK(hm+10):ld=PEEK(hm+12):h4=PEEK(hm+14)
40090ck=PEEK(hm+16):pm=PEEK(hm+18):p1=PEEK(hm+20):p2=PEEK(hm+22):py=PEEK(hm+24):px=PEEK(hm+26):pz=PEEK(hm+28):ph=PEEK(hm+30):cs=PEEK(hm+32):tq=34:FORI=0TO13:FORE=0TO2:HI(I,E)=PEEK(hm+tq):tq=tq+1:NEXTE:NEXTI
41080_turbooff
41090RETURN
