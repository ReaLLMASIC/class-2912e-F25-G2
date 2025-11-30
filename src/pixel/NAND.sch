v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
P 4 1 470 40 {}
N 190 0 340 -0 {lab=VOUT}
N 190 -60 190 -30 {lab=VDD}
N 340 -60 340 -30 {lab=VDD}
N 270 -30 300 -30 {lab=B}
N 110 -30 150 -30 {lab=A}
N 190 -60 340 -60 {lab=VDD}
N 260 -0 260 60 {lab=VOUT}
N 260 120 260 150 {lab=#net1}
N 260 90 300 90 {lab=GND}
N 300 90 300 180 {lab=GND}
N 260 180 300 180 {lab=GND}
N 260 180 260 210 {lab=GND}
N 260 210 260 240 {lab=GND}
N 160 90 220 90 {lab=B}
N 170 180 220 180 {lab=A}
N 260 30 460 30 {lab=VOUT}
C {iopin.sym} 170 180 2 0 {name=p1 lab=A}
C {iopin.sym} 160 90 2 0 {name=p2 lab=B}
C {lab_pin.sym} 110 -30 0 0 {name=p3 sig_type=std_logic lab=A}
C {lab_pin.sym} 270 -30 0 0 {name=p4 sig_type=std_logic lab=B}
C {iopin.sym} 260 240 2 0 {name=p5 lab=GND}
C {iopin.sym} 260 -60 3 0 {name=p6 lab=VDD}
C {iopin.sym} 460 30 0 0 {name=p7 lab=VOUT

}
C {symbols/pfet_03v3.sym} 320 -30 0 0 {name=M1
L=0.28u
W=0.84u
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
C {symbols/pfet_03v3.sym} 170 -30 0 0 {name=M2
L=0.28u
W=0.84u
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
C {symbols/nfet_03v3.sym} 240 90 0 0 {name=M3
L=0.28u
W=0.42u
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
C {symbols/nfet_03v3.sym} 240 180 0 0 {name=M4
L=0.28u
W=0.42u
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
