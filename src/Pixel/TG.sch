v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 80 -50 320 -50 {lab=In}
N 80 10 320 10 {lab=Out}
N 270 -20 320 -20 {lab=VDD}
N 80 -20 140 -20 {lab=GND}
N -20 -20 40 -20 {lab=SW}
N 270 -20 270 0 {lab=VDD}
N 140 -20 140 0 {lab=GND}
N 360 -20 400 -20 {lab=SWP}
C {symbols/nfet_03v3.sym} 60 -20 0 0 {name=M1
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
C {symbols/pfet_03v3.sym} 340 -20 0 1 {name=M2
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
C {iopin.sym} 210 -50 1 0 {name=p1 lab=In
}
C {iopin.sym} 200 10 1 0 {name=p2 lab=Out
}
C {iopin.sym} -20 -20 1 0 {name=p3 lab=SW
}
C {iopin.sym} 140 0 1 0 {name=p5 lab=GND
}
C {iopin.sym} 270 0 1 0 {name=p6 lab=VDD

}
C {iopin.sym} 400 -20 1 0 {name=p4 lab=SWB
}
