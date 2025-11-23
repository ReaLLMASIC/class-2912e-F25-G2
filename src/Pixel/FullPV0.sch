v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 690 -90 830 -90 {lab=#net1}
N 270 -120 430 -120 {lab=VINP}
N 330 -60 430 -60 {lab=I_in}
N 330 -60 330 100 {lab=I_in}
N 580 -10 580 50 {lab=I_REF}
N 550 -10 550 50 {lab=GND}
N 550 -250 550 -190 {lab=VDD}
N 830 -90 830 20 {lab=#net1}
N 830 20 830 60 {lab=#net1}
N 330 100 800 100 {lab=I_in}
N 240 100 330 100 {lab=I_in}
N 240 100 240 210 {lab=I_in}
N 580 50 700 50 {lab=I_REF}
N 430 50 550 50 {lab=GND}
N 830 100 830 140 {lab=VDD}
N 1250 100 1360 100 {lab=#net2}
N 1360 160 1360 240 {lab=GND}
N 1360 100 1500 100 {lab=#net2}
N 1500 100 1500 150 {lab=#net2}
N 1500 180 1500 210 {lab=GND}
N 1500 210 1500 250 {lab=GND}
N 1360 250 1500 250 {lab=GND}
N 1360 240 1360 250 {lab=GND}
N 860 100 920 100 {lab=#net3}
N 1500 100 1700 100 {lab=#net2}
N 1700 100 1880 100 {lab=#net2}
N 1660 350 1660 410 {lab=VINP}
N 1540 180 1540 260 {lab=RST}
N 1170 100 1250 100 {lab=#net2}
N 990 310 1050 310 {lab=SET}
N 1060 250 1060 310 {lab=SET}
N 1050 310 1060 310 {lab=SET}
N 1100 280 1100 340 {lab=SETB}
N 1060 310 1060 370 {lab=SET}
N 1100 220 1100 250 {lab=VDD}
N 1100 310 1190 310 {lab=SETB}
N 1100 400 1100 430 {lab=GND}
N 1100 220 1160 220 {lab=VDD}
N 1590 230 1590 290 {lab=SET}
N 1740 230 1800 230 {lab=SETB}
N 1590 140 1620 140 {lab=GND}
N 1130 60 1150 60 {lab=GND}
N 1620 320 1620 350 {lab=VDD}
N 960 180 1040 180 {lab=SET}
N 1040 0 1040 30 {lab=SETB}
N 910 60 950 60 {lab=VDD}
N 1960 50 1960 170 {lab=VOUT}
N 1880 20 1880 100 {lab=#net2}
N 1860 200 1920 200 {lab=VSF}
N 1960 230 1960 280 {lab=GND}
N 1960 200 1960 230 {lab=GND}
N 1960 -40 1960 -10 {lab=VDD}
N 1960 110 2110 110 {lab=VOUT}
N 1960 20 2010 20 {lab=GND}
N 1880 20 1920 20 {lab=#net2}
N 1100 370 1100 400 {lab=GND}
N 1430 -420 1430 -360 {lab=VDD}
N 1460 -420 1460 -360 {lab=wl}
N 1510 -290 1580 -290 {lab=BL<7:0>}
N 1300 -290 1370 -290 {lab=BLB<7:0>}
N 1440 -220 1440 -170 {lab=GND}
C {pixel/OTA.sym} 550 -80 0 0 {name=x1}
C {symbols/pfet_03v3.sym} 830 80 1 0 {name=M1
L=1u
W=2u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {iopin.sym} 270 -120 1 0 {name=p1 lab=VINP}
C {iopin.sym} 240 210 0 0 {name=p2 lab=I_in}
C {iopin.sym} 700 50 0 0 {name=p3 lab=I_REF}
C {iopin.sym} 430 50 2 0 {name=p4 lab=GND}
C {iopin.sym} 550 -250 0 0 {name=p5 lab=VDD}
C {symbols/cap_mim_2p0fF.sym} 1360 130 0 0 {name=C1
W=1e-6
L=1e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {symbols/nfet_03v3.sym} 1520 180 0 1 {name=M2
L=1u
W=1u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {lab_pin.sym} 1420 250 3 0 {name=p6 sig_type=std_logic lab=GND}
C {lab_pin.sym} 1660 410 3 0 {name=p7 sig_type=std_logic lab=VINP}
C {iopin.sym} 1540 260 1 0 {name=p8 lab=RST}
C {pixel/TG.sym} 1030 90 0 0 {name=x2}
C {iopin.sym} 990 310 2 0 {name=p9 lab=SET
}
C {symbols/pfet_03v3.sym} 1080 250 0 0 {name=M3
L=1u
W=2u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 1080 370 0 0 {name=M4
L=1u
W=1u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {lab_pin.sym} 1190 310 3 0 {name=p10 sig_type=std_logic lab=SETB}
C {lab_pin.sym} 1100 430 3 0 {name=p11 sig_type=std_logic lab=GND}
C {pixel/TG.sym} 1650 240 3 0 {name=x3}
C {lab_pin.sym} 1590 290 3 0 {name=p12 sig_type=std_logic lab=SET}
C {lab_pin.sym} 1590 140 3 0 {name=p13 sig_type=std_logic lab=GND}
C {lab_pin.sym} 1150 60 2 0 {name=p14 sig_type=std_logic lab=GND}
C {lab_pin.sym} 1160 220 2 0 {name=p15 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 1620 350 3 0 {name=p16 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 1800 230 3 0 {name=p17 sig_type=std_logic lab=SETB}
C {lab_pin.sym} 960 180 3 0 {name=p18 sig_type=std_logic lab=SET}
C {lab_pin.sym} 1040 0 1 0 {name=p19 sig_type=std_logic lab=SETB}
C {lab_pin.sym} 910 60 1 0 {name=p20 sig_type=std_logic lab=VDD}
C {symbols/nfet_03v3.sym} 1940 20 0 0 {name=M5
L=1u
W=1u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 1940 200 0 0 {name=M6
L=1u
W=1u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {iopin.sym} 1860 200 1 0 {name=p21 lab=VSF}
C {lab_pin.sym} 1960 280 3 0 {name=p22 sig_type=std_logic lab=GND}
C {lab_pin.sym} 1960 -40 1 0 {name=p23 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 2010 20 3 0 {name=p24 sig_type=std_logic lab=GND}
C {iopin.sym} 2110 110 1 0 {name=p25 lab=VOUT}
C {lab_pin.sym} 830 140 3 0 {name=p26 sig_type=std_logic lab=VDD}
C {pixel/sram.sym} 1360 -290 0 0 {name=x4<7:0>}
C {lab_pin.sym} 1430 -420 0 0 {name=p27 sig_type=std_logic lab=VDD}
C {iopin.sym} 1460 -420 0 0 {name=p28 lab=wl}
C {lab_pin.sym} 1440 -170 0 0 {name=p29 sig_type=std_logic lab=GND}
C {iopin.sym} 1580 -290 0 0 {name=p30 lab=BL<7:0>}
C {iopin.sym} 1300 -290 2 0 {name=p31 lab=BLB<7:0>}
