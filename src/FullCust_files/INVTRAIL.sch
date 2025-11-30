v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 100 -160 100 -120 {lab=#net1}
N 100 30 100 80 {lab=GND}
N 230 -40 310 -40 {lab=#net2}
N -100 -40 -20 -40 {lab=#net3}
N -350 -30 -350 10 {lab=GND}
N -350 -160 -350 -90 {lab=#net1}
N -350 -160 100 -160 {lab=#net1}
N -240 20 -100 20 {lab=GND}
N -240 -10 -240 20 {lab=GND}
N -350 -10 -240 -10 {lab=GND}
N 310 20 310 60 {lab=GND}
N 100 60 310 60 {lab=GND}
C {pixel/inv.sym} 80 -40 0 0 {name=x1}
C {vsource.sym} -350 -60 0 0 {name=V1 value=3 savecurrent=false}
C {gnd.sym} -350 10 0 0 {name=l1 lab=GND}
C {gnd.sym} 100 80 0 0 {name=l2 lab=GND}
C {vsource.sym} -100 -10 0 0 {name=V2 value=3 savecurrent=false}
C {capa-2.sym} 310 -10 0 0 {name=C1
m=1
value=1p
footprint=1206
device=polarized_capacitor}
C {devices/code_shown.sym} 180 -380 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
