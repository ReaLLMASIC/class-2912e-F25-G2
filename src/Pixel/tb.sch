v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -270 30 -270 50 {lab=GND}
N -270 -60 -270 -30 {lab=VDD}
N 80 -100 80 -80 {lab=VDD}
N -80 0 -40 0 {lab=VIN

}
N -80 60 -80 80 {lab=GND}
N 210 0 220 0 {lab=VOUT}
N 220 -0 250 -0 {lab=VOUT}
N 80 70 80 80 {lab=GND}
N 250 60 250 70 {lab=GND}
N 80 80 80 110 {lab=GND}
N 250 70 250 90 {lab=GND}
N 80 90 250 90 {lab=GND}
C {vsource.sym} -270 0 0 0 {name=V1 value=3.3 savecurrent=false}
C {vdd.sym} -270 -60 0 0 {name=l2 lab=VDD}
C {gnd.sym} -270 50 0 0 {name=l3 lab=GND}
C {gnd.sym} 80 110 0 0 {name=l4 lab=GND}
C {vdd.sym} 80 -100 0 0 {name=l5 lab=VDD}
C {vsource.sym} -80 30 0 0 {name=V2 value=3.3 savecurrent=false}
C {gnd.sym} -80 80 0 0 {name=l6 lab=GND}
C {capa.sym} 250 30 0 0 {name=C1
m=1
value=10f
footprint=1206
device="ceramic capacitor"}
C {devices/code_shown.sym} 360 40 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {code_shown.sym} 480 -470 0 0 {name=s1 only_toplevel=false value="
.control 
save all

** def 
let fsig = 1e3
let tp = 1/fsig
let trf = 0.01*tp
let ton = 0.5*tp - 2*trf

**
let tstop = 2*tp
let tstep = 0.001*tp

**source
alter @v2[DC] = 0
alter @v2[PULSE] = [ 0 3.3 0 $&tfr $&tfr $&ton $&tp 0 ] 

** sim

op 
dc v2 0 3.3 0.01
tran $&tstep $&tstop

** save
write inv_tb.raw
.endc


"}
C {lab_wire.sym} -50 0 0 0 {name=p1 sig_type=std_logic lab=VIN
}
C {lab_wire.sym} 240 0 0 0 {name=p2 sig_type=std_logic lab=VOUT

}
C {pixel/inv.sym} 60 0 0 0 {name=x2}
