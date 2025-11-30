v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 10 -40 10 -20 {lab=#net1}
N 250 -50 250 -30 {lab=#net2}
N 210 -80 210 0 {lab=#net1}
N 50 -70 50 10 {lab=#net2}
N 10 -130 10 -100 {lab=vdd}
N 250 -140 250 -110 {lab=vdd}
N -10 -120 10 -120 {lab=vdd}
N -10 -70 10 -70 {lab=vdd}
N -10 -120 -10 -70 {lab=vdd}
N 250 -130 270 -130 {lab=vdd}
N 250 -80 270 -80 {lab=vdd}
N 270 -130 270 -80 {lab=vdd}
N 10 40 10 70 {lab=gnd}
N 250 30 250 60 {lab=gnd}
N -10 10 10 10 {lab=gnd}
N -10 60 10 60 {lab=gnd}
N -10 10 -10 60 {lab=gnd}
N 250 0 270 0 {lab=gnd}
N 250 50 270 50 {lab=gnd}
N 270 0 270 50 {lab=gnd}
N -210 -130 -210 -70 {lab=wl}
N 500 -130 500 -80 {lab=wl}
N -280 -30 -240 -30 {lab=bl}
N 530 -40 570 -40 {lab=blb}
N -180 -30 10 -30 {lab=#net1}
N 10 -30 210 -30 {lab=#net1}
N 250 -40 470 -40 {lab=#net2}
N 50 -40 250 -40 {lab=#net2}
N -210 -30 -210 60 {lab=gnd}
N 500 -40 500 40 {lab=gnd}
C {symbols/nfet_03v3.sym} 230 0 0 0 {name=M3
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
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 230 -80 0 0 {name=M4
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
model=pfet_03v3
spiceprefix=X
}
C {iopin.sym} 250 -140 3 0 {name=p2 lab=vdd}
C {symbols/nfet_03v3.sym} -210 -50 1 0 {name=M5
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
C {symbols/nfet_03v3.sym} 500 -60 1 0 {name=M6
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
C {iopin.sym} 500 -130 3 0 {name=p6 lab=wl}
C {iopin.sym} -280 -30 2 0 {name=p7 lab=bl}
C {iopin.sym} 570 -40 0 0 {name=p8 lab=blb}
C {iopin.sym} -210 60 1 0 {name=p9 lab=gnd}
C {lab_pin.sym} 10 70 3 0 {name=p3 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 250 60 3 0 {name=p4 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 500 40 3 0 {name=p10 sig_type=std_logic lab=gnd}
C {lab_pin.sym} 10 -130 1 0 {name=p1 sig_type=std_logic lab=vdd}
C {symbols/nfet_03v3.sym} 30 10 0 1 {name=M7
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
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 30 -70 0 1 {name=M1
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
model=pfet_03v3
spiceprefix=X
}
C {lab_pin.sym} -210 -130 1 0 {name=p5 sig_type=std_logic lab=wl}
