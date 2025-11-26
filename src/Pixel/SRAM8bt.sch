v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 120 20 120 50 {lab=GND}
N 190 -50 260 -50 {lab=blb[7:0]}
N -20 -50 50 -50 {lab=bl[7:0]}
N 110 -180 110 -120 {lab=VDD}
N 140 -180 140 -120 {lab=wl}
N 140 -220 140 -180 {lab=wl}
C {pixel/sram.sym} 40 -50 0 0 {name=x1[7:0]}
C {iopin.sym} 120 50 2 0 {name=p3 lab=GND}
C {iopin.sym} 110 -180 2 0 {name=p4 lab=VDD}
C {iopin.sym} 140 -220 0 0 {name=p5 lab=wl}
C {iopin.sym} 260 -50 0 0 {name=p1 lab=blb[7:0]}
C {iopin.sym} -20 -50 2 0 {name=p2 lab=bl[7:0]}
