v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 70 50 70 140 {lab=B_b}
N 70 -100 100 -100 {lab=B}
N 100 -100 100 290 {lab=B}
N 70 290 100 290 {lab=B}
N 200 -30 200 210 {lab=Y}
N 200 80 280 80 {lab=Y}
N 160 -70 160 170 {lab=#net1}
N -20 -70 -20 170 {lab=#net2}
N -160 -30 -50 -30 {lab=A_b}
N -170 210 -50 210 {lab=A}
N -40 -270 60 -270 {lab=A}
N 310 -270 370 -270 {lab=A_b}
N 440 -270 500 -270 {lab=B}
N 750 -270 810 -270 {lab=B_b}
N 180 -200 620 -200 {lab=GND}
N 180 -350 620 -350 {lab=VDD}
C {pixel/TG.sym} 60 -40 0 0 {name=x1}
C {pixel/TG.sym} 60 200 0 0 {name=x2}
C {pixel/inv.sym} 160 -270 0 0 {name=x3}
C {pixel/inv.sym} 600 -270 0 0 {name=x4}
C {iopin.sym} -40 -270 2 0 {name=p1 lab=A}
C {iopin.sym} 440 -270 2 0 {name=p2 lab=B}
C {iopin.sym} 380 -200 1 0 {name=p3 lab=GND}
C {iopin.sym} 400 -350 3 0 {name=p4 lab=VDD}
C {lab_pin.sym} 100 -100 1 0 {name=p5 sig_type=std_logic lab=B}
C {lab_pin.sym} 70 80 2 0 {name=p6 sig_type=std_logic lab=B_b}
C {lab_pin.sym} 810 -270 2 0 {name=p7 sig_type=std_logic lab=B_b}
C {lab_pin.sym} -160 -30 1 0 {name=p8 sig_type=std_logic lab=A_b}
C {lab_pin.sym} -170 210 1 0 {name=p9 sig_type=std_logic lab=A}
C {lab_pin.sym} 370 -270 1 0 {name=p10 sig_type=std_logic lab=A_b}
C {iopin.sym} 280 80 0 0 {name=p11 lab=Y}
C {lab_pin.sym} 160 -60 2 0 {name=p12 sig_type=std_logic lab=GND}
C {lab_pin.sym} -20 70 2 0 {name=p13 sig_type=std_logic lab=VDD}
