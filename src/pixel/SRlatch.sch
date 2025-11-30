v {xschem version=3.4.7 file_version=1.2}
G {}
K {type=subcircuit
format="@name @pinlist @symname"
template="name=x1"
}
V {}
S {}
E {}
N 600 -220 600 -70 {lab=Q}
N 280 -70 600 -70 {lab=Q}
N 280 -70 280 90 {lab=Q}
N 280 90 350 90 {lab=Q}
N 600 -30 600 120 {lab=QB}
N 300 -30 600 -30 {lab=QB}
N 300 -190 300 -30 {lab=QB}
N 300 -190 350 -190 {lab=QB}
N 170 -250 340 -250 {lab=#net1}
N 340 -250 350 -250 {lab=#net1}
N 170 -250 170 -230 {lab=#net1}
N 20 120 350 120 {lab=#net2}
N 350 120 350 150 {lab=#net2}
N -270 -200 -160 -200 {lab=CLK}
N -270 -200 -270 90 {lab=CLK}
N -270 90 -230 90 {lab=CLK}
N -390 -260 -160 -260 {lab=D}
N -350 150 -230 150 {lab=#net3}
N -550 -260 -550 -80 {lab=D}
N -550 -260 -390 -260 {lab=D}
N -30 -130 -30 -100 {lab=GND}
N -30 -330 10 -330 {lab=VDD}
N -100 -10 -100 20 {lab=VDD}
N -100 220 -100 240 {lab=GND}
N 480 0 480 20 {lab=VDD}
N 480 220 480 240 {lab=GND}
N 480 -120 480 -90 {lab=GND}
N 90 -230 170 -230 {lab=#net1}
N -630 -80 -550 -80 {lab=D}
N -630 -80 -630 70 {lab=D}
N -630 70 -600 70 {lab=D}
N -350 70 -350 150 {lab=#net3}
N -480 -10 -400 -10 {lab=VDD}
N -480 140 -480 210 {lab=GND}
N 480 -360 480 -320 {lab=VDD}
C {pixel/NAND.sym} -40 -230 0 0 {name=x1}
C {pixel/NAND.sym} 470 -220 0 0 {name=x2}
C {pixel/NAND.sym} -110 120 0 0 {name=x3}
C {pixel/NAND.sym} 470 120 0 0 {name=x4}
C {iopin.sym} -550 -160 0 0 {name=p1 lab=D}
C {iopin.sym} -270 -50 0 0 {name=p2 lab=CLK}
C {iopin.sym} -100 -10 0 0 {name=p3 lab=VDD}
C {iopin.sym} -30 -100 0 0 {name=p4 lab=GND}
C {iopin.sym} 600 -160 0 0 {name=p5 lab=Q}
C {iopin.sym} 600 30 0 0 {name=p6 lab=QB}
C {lab_pin.sym} 10 -330 2 0 {name=p7 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 480 0 2 0 {name=p8 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 480 -360 2 0 {name=p9 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 480 -90 2 0 {name=p10 sig_type=std_logic lab=GND}
C {lab_pin.sym} 480 240 2 0 {name=p13 sig_type=std_logic lab=GND}
C {lab_pin.sym} -100 240 2 0 {name=p14 sig_type=std_logic lab=GND}
C {pixel/inv.sym} -500 70 0 0 {name=x5}
C {lab_pin.sym} -480 210 2 0 {name=p11 sig_type=std_logic lab=GND}
C {lab_pin.sym} -400 -10 2 0 {name=p12 sig_type=std_logic lab=VDD}
