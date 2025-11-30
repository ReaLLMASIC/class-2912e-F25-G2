v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 330 0 360 0 {lab=Vout}
N 120 80 120 120 {lab=GND}
N 120 120 360 120 {lab=GND}
N 360 60 360 120 {lab=GND}
N 120 -130 120 -100 {lab=VDD}
N -150 -30 0 -30 {lab=VINP}
N -190 30 0 30 {lab=VINN}
N 260 0 330 0 {lab=Vout}
N -560 -100 -560 -60 {lab=VDD}
N -560 0 -560 50 {lab=GND}
N -390 70 -390 100 {lab=GND}
N -560 -100 -560 -60 {lab=VDD}
N -560 0 -560 50 {lab=GND}
N -390 -30 -390 10 {lab=#net1}
N -390 -40 -320 -40 {lab=#net1}
N -390 -40 -390 -30 {lab=#net1}
N -320 -150 -320 -100 {lab=VINP}
N -440 -50 -440 -40 {lab=#net1}
N -440 -40 -390 -40 {lab=#net1}
N -440 -150 -440 -110 {lab=VINN}
N -150 -30 0 -30 {lab=VINP}
N 150 80 150 140 {lab=#net2}
N 30 140 150 140 {lab=#net2}
N -60 140 -30 140 {lab=VDD}
C {capa.sym} 360 30 0 0 {name=C1
m=1
value=200f
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 270 120 0 0 {name=l1 lab=GND}
C {vdd.sym} 120 -130 0 0 {name=l2 lab=VDD}
C {lab_pin.sym} 310 0 1 0 {name=p1 sig_type=std_logic lab=Vout
}
C {lab_pin.sym} -150 -30 1 0 {name=p2 sig_type=std_logic lab=VINP

}
C {lab_pin.sym} -190 30 3 0 {name=p3 sig_type=std_logic lab=VINN
}
C {vdd.sym} -560 -100 0 0 {name=l4 lab=VDD}
C {vsource.sym} -560 -30 0 0 {name=V1 value=1.8 savecurrent=false}
C {gnd.sym} -560 50 0 0 {name=l5 lab=GND}
C {gnd.sym} -390 100 0 0 {name=l7 lab=GND}
C {vsource.sym} -320 -70 0 0 {name=V3 value="0 AC 500m" savecurrent=false}
C {vsource.sym} -440 -80 2 1 {name=V4 value="0 AC 500m" savecurrent=false}
C {lab_pin.sym} -320 -150 0 0 {name=p5 sig_type=std_logic lab=VINP}
C {lab_pin.sym} -440 -150 0 0 {name=p6 sig_type=std_logic lab=VINN}
C {devices/code_shown.sym} -70 -300 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {code_shown.sym} 540 -460 0 0 {name=s1 only_toplevel=false value=" .ac dec 20 1 1e7
.save all"}
C {isource.sym} 0 140 3 0 {name=I0 value=100n}
C {vdd.sym} -60 140 3 0 {name=l3 lab=VDD}
C {vsource.sym} -390 40 0 0 {name=V2 value=800m savecurrent=false}
C {pixel/OTA.sym} 120 10 0 0 {name=x1}
