v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
P 4 1 350 -30 {}
N 380 80 420 80 {lab=#net1}
N 380 70 380 80 {lab=#net1}
N 420 80 560 80 {lab=#net1}
N 560 70 560 80 {lab=#net1}
N 380 -50 380 10 {lab=#net2}
N 380 -150 380 -110 {lab=VDD}
N 380 -150 560 -150 {lab=VDD}
N 380 -110 380 -80 {lab=VDD}
N 470 170 470 180 {lab=GND}
N 360 140 430 140 {lab=IREF}
N 470 80 470 110 {lab=#net1}
N 470 140 470 170 {lab=GND}
N 470 180 470 200 {lab=GND}
N 200 170 200 180 {lab=GND}
N 200 140 200 170 {lab=GND}
N 240 140 360 140 {lab=IREF}
N 290 40 340 40 {lab=VINN}
N 470 200 530 200 {lab=GND}
N 380 -20 460 -20 {lab=#net2}
N 460 -80 460 -20 {lab=#net2}
N 200 180 200 190 {lab=GND}
N 200 190 470 190 {lab=GND}
N 560 -20 650 -20 {lab=VOUT}
N 200 20 200 110 {lab=IREF}
N 290 90 290 140 {lab=IREF}
N 200 90 290 90 {lab=IREF}
N 510 40 510 200 {lab=GND}
N 380 40 560 40 {lab=GND}
N 600 40 660 40 {lab=VINP}
N 560 -50 560 10 {lab=VOUT}
N 560 -50 560 10 {lab=VOUT}
N 560 -110 560 -80 {lab=VDD}
N 420 -80 520 -80 {lab=#net2}
N 560 -150 560 -110 {lab=VDD}
C {iopin.sym} 660 40 0 0 {name=p4 lab=VINP}
C {iopin.sym} 290 40 0 1 {name=p5 lab=VINN}
C {iopin.sym} 530 200 0 0 {name=p1 lab=GND}
C {iopin.sym} 200 20 3 0 {name=p2 lab=IREF}
C {iopin.sym} 490 -150 3 0 {name=p7 lab=VDD}
C {iopin.sym} 650 -20 0 0 {name=p6 lab=VOUT}
C {symbols/pfet_03v3.sym} 540 -80 0 0 {name=M2
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
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 400 -80 0 1 {name=M4
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
model=pfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 580 40 0 1 {name=M1
L=1u
W=0.9u
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
C {symbols/nfet_03v3.sym} 360 40 0 0 {name=M3
L=1u
W=0.9u
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
C {symbols/nfet_03v3.sym} 450 140 0 0 {name=M8
L=4u
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
C {symbols/nfet_03v3.sym} 220 140 0 1 {name=M6
L=4u
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
