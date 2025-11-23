v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
P 4 1 240 0 {}
P 4 1 250 10 {}
N 120 -30 120 10 {lab=Out}
N 80 -60 80 40 {lab=In}
N 120 40 140 40 {lab=VSS}
N 140 40 140 90 {lab=VSS}
N 120 90 140 90 {lab=VSS}
N 120 70 120 90 {lab=VSS}
N 120 90 120 110 {lab=VSS}
N 120 -60 150 -60 {lab=VDD}
N 150 -100 150 -60 {lab=VDD}
N 120 -100 150 -100 {lab=VDD}
N 120 -100 120 -90 {lab=VDD}
N 120 -100 120 -90 {lab=VDD}
N 120 -120 120 -100 {lab=VDD}
N 120 -10 160 -10 {lab=Out}
N 50 -10 80 -10 {lab=In}
C {iopin.sym} 160 -10 0 0 {name=p2 lab=Out}
C {iopin.sym} 120 110 1 0 {name=p4 lab=VSS

}
C {iopin.sym} 50 -10 2 0 {name=p5 lab=In
}
C {iopin.sym} 120 -120 3 0 {name=p6 lab=VDD
}
C {symbols/nfet_03v3.sym} 100 40 0 0 {name=M1
L=0.28u
W=0.22u
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
