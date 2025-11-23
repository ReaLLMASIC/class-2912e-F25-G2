v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -370 -80 -370 -50 {lab=vout}
N -410 -110 -410 -20 {lab=vin}
N -450 -70 -410 -70 {lab=vin}
N -370 -70 -290 -70 {lab=vout}
N -370 -180 -370 -140 {lab=vdd}
N -370 -110 -340 -110 {lab=vdd}
N -340 -160 -340 -110 {lab=vdd}
N -370 -160 -340 -160 {lab=vdd}
N -370 10 -370 50 {lab=vss}
N -370 -20 -340 -20 {lab=vss}
N -340 -20 -340 40 {lab=vss}
N -370 40 -340 40 {lab=vss}
C {symbols/nfet_03v3.sym} -390 -20 0 0 {name=M1
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
C {symbols/pfet_03v3.sym} -390 -110 0 0 {name=M2
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
C {iopin.sym} -450 -70 0 0 {name=p1 lab=vin}
C {iopin.sym} -290 -70 0 0 {name=p2 lab=vout}
C {iopin.sym} -370 -180 3 0 {name=p3 lab=vdd}
C {iopin.sym} -370 50 1 0 {name=p4 lab=vss}
