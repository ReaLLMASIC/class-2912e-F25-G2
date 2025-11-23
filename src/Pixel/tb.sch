v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -200 30 -200 50 {lab=GND}
N -200 -60 -200 -30 {lab=VDD}
N 80 60 80 80 {lab=GND}
N 80 -90 80 -70 {lab=VDD}
N -20 -0 20 0 {lab=VIN

}
N -20 60 -20 80 {lab=GND}
N 210 0 220 0 {lab=VIN}
N 80 60 250 60 {lab=GND}
N 220 -0 250 -0 {lab=VIN}
C {PixelV0.sym} 130 10 0 0 {name=x1}
C {vsource.sym} -200 0 0 0 {name=V1 value=3.3 savecurrent=false}
C {vdd.sym} -200 -60 0 0 {name=l2 lab=VDD}
C {gnd.sym} -200 50 0 0 {name=l3 lab=GND}
C {gnd.sym} 80 80 0 0 {name=l4 lab=GND}
C {vdd.sym} 80 -90 0 0 {name=l5 lab=VDD}
C {vsource.sym} -20 30 0 0 {name=V2 value=3.3 savecurrent=false}
C {gnd.sym} -20 80 0 0 {name=l6 lab=GND}
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

** define 
let fsig=1e3
let tper=1/fsig
let tfr = 0.01*tper
let ton= 0.5*tper-2*tfr
** trans
let tstop = 2*tper
let tstep = 0.001*tper
** vs

alter @v2[DC] = 0.0
alter @v2[PULSE] = [0 3.3 0 $&tfr $&tfr $&ton $&tper 2]

**sim
op 
dc v2 0 3.3 0.01
tran $&tstep $&tstop

**save
write inv_tb.raw
.endc




"}
C {lab_wire.sym} 0 0 0 0 {name=p1 sig_type=std_logic lab=VIN
}
C {lab_wire.sym} 240 0 0 0 {name=p2 sig_type=std_logic lab=VOUT

}
