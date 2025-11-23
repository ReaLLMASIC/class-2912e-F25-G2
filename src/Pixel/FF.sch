v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 180 -80 310 -80 {lab=#net1}
N 310 -80 310 -70 {lab=#net1}
N 490 -80 600 -80 {lab=RST}
N 490 -50 530 -50 {lab=Q}
N 380 -160 380 -140 {lab=VDD}
N 70 -160 380 -160 {lab=VDD}
N 70 -160 70 -140 {lab=VDD}
N 80 20 80 110 {lab=GND}
N 80 110 390 110 {lab=GND}
N 390 20 390 110 {lab=GND}
N 360 20 360 70 {lab=#net2}
N 240 70 360 70 {lab=#net2}
N 50 20 50 70 {lab=CLK}
N -20 70 50 70 {lab=CLK}
N -20 70 50 70 {lab=CLK}
N 50 70 120 70 {lab=CLK}
N -80 -70 0 -70 {lab=D}
N 120 70 120 170 {lab=CLK}
N 90 170 120 170 {lab=CLK}
N 90 170 90 270 {lab=CLK}
N 90 270 100 270 {lab=CLK}
N 350 270 380 270 {lab=#net2}
N 380 150 380 270 {lab=#net2}
N 240 70 240 150 {lab=#net2}
N 220 340 220 380 {lab=GND}
N 220 160 220 190 {lab=VDD}
N 240 150 380 150 {lab=#net2}
N 180 -50 220 -50 {lab=#net3}
C {pixel/SRlatch.sym} 50 -50 0 0 {name=x1}
C {pixel/SRlatch.sym} 360 -50 0 0 {name=x2}
C {pixel/inv.sym} 200 270 0 0 {name=x3}
C {iopin.sym} 600 -80 0 0 {name=p1 lab=RST}
C {iopin.sym} 220 -160 3 0 {name=p2 lab=VDD}
C {iopin.sym} -80 -70 2 0 {name=p3 lab=D}
C {iopin.sym} -20 70 2 0 {name=p4 lab=CLK}
C {iopin.sym} 190 110 3 0 {name=p5 lab=GND}
C {iopin.sym} 530 -50 0 0 {name=p6 lab=Q}
C {lab_pin.sym} 220 160 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 220 380 0 0 {name=p8 sig_type=std_logic lab=GND}
