v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 280 -70 280 -60 {lab=Q}
N 280 -30 280 80 {lab=PULSE}
N -20 80 280 80 {lab=PULSE}
N -80 80 -20 80 {lab=PULSE}
N -80 -30 -80 80 {lab=PULSE}
N -80 -30 -20 -30 {lab=PULSE}
N 400 -170 400 -130 {lab=VDD}
N 70 -170 400 -170 {lab=VDD}
N 70 -170 70 -130 {lab=VDD}
N 490 -50 550 -50 {lab=VOUT}
N 400 10 400 70 {lab=GND}
N -180 0 -20 0 {lab=CLK}
N -180 60 -180 70 {lab=GND}
N -300 70 -180 70 {lab=GND}
N -300 40 -300 70 {lab=GND}
N -410 70 -300 70 {lab=GND}
N -410 40 -410 70 {lab=GND}
N -410 -70 -410 -20 {lab=VDD}
N -300 -80 -300 -20 {lab=PULSE}
N 110 40 110 60 {lab=GND}
N 800 -50 1000 -50 {lab=VOUT}
N 200 -60 200 40 {lab=Q}
N 200 40 200 140 {lab=Q}
N 200 -60 280 -60 {lab=Q}
N 70 40 70 140 {lab=Q}
N 70 140 200 140 {lab=Q}
N 550 -50 800 -50 {lab=VOUT}
N 1410 -60 1410 60 {lab=Tocomp}
N 1330 -90 1330 -10 {lab=REF}
N 1310 90 1370 90 {lab=#net1}
N 1410 120 1410 170 {lab=GND}
N 1410 90 1410 120 {lab=GND}
N 1410 -150 1410 -120 {lab=VDD}
N 1410 0 1560 0 {lab=Tocomp}
N 1410 -90 1460 -90 {lab=GND}
N 1330 -90 1370 -90 {lab=REF}
N 1310 150 1410 150 {lab=GND}
N 1270 50 1330 50 {lab=GND}
N 1270 50 1270 160 {lab=GND}
N 1270 160 1410 160 {lab=GND}
C {pixel/XOR.sym} 380 -50 0 0 {name=x2}
C {vsource.sym} -180 30 0 0 {name=V1 value=3 savecurrent=false}
C {vsource.sym} -300 10 0 0 {name=V2 value=3 savecurrent=false}
C {vsource.sym} -410 10 0 0 {name=V3 value=1.8 savecurrent=false}
C {gnd.sym} 400 70 0 0 {name=l1 lab=GND}
C {gnd.sym} -180 70 0 0 {name=l2 lab=GND}
C {lab_wire.sym} -410 -70 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -300 -80 0 0 {name=p2 sig_type=std_logic lab=PULSE}
C {lab_wire.sym} -130 0 0 0 {name=p3 sig_type=std_logic lab=CLK}
C {lab_wire.sym} 100 -170 0 0 {name=p4 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 1000 -50 0 0 {name=p5 sig_type=std_logic lab=VOUT}
C {gnd.sym} 110 60 0 0 {name=l3 lab=GND}
C {devices/code_shown.sym} -50 -330 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {code_shown.sym} 790 -460 0 0 {name=s1 only_toplevel=false value="

.control 
save all

alter @v1[PULSE] = [ 0 1.8 0 1e-5 1e-5 5e-4 1e-3 0 ]
alter @v2[PULSE] = [ 0 1.8 1e-4 1e-5 1e-5 1e-2 1 0 ]
op
dc v5 0 1.8 0.01
*tran 1e-6 2e-3

*plot PULSE
*plot CLK 
*plot VOUT
*plot Q
plot Tocomp REF

.endc

"

}
C {lab_wire.sym} -80 -30 0 0 {name=p6 sig_type=std_logic lab=PULSE}
C {lab_wire.sym} 220 -60 0 0 {name=p7 sig_type=std_logic lab=Q}
C {pixel/FF.sym} 70 -30 0 0 {name=x1}
C {symbols/nfet_03v3.sym} 1390 -90 0 0 {name=M5
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
C {symbols/nfet_03v3.sym} 1390 90 0 0 {name=M6
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
C {lab_pin.sym} 1410 170 3 0 {name=p22 sig_type=std_logic lab=GND}
C {lab_pin.sym} 1410 -150 1 0 {name=p23 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 1460 -90 3 0 {name=p24 sig_type=std_logic lab=GND}
C {lab_pin.sym} 1560 0 2 0 {name=p56 sig_type=std_logic lab=Tocomp
}
C {vsource.sym} 1310 120 0 0 {name=V4 value=100m savecurrent=false}
C {vsource.sym} 1330 20 0 0 {name=V5 value=600m savecurrent=false}
C {lab_pin.sym} 1330 -40 2 0 {name=p8 sig_type=std_logic lab=REF

}
