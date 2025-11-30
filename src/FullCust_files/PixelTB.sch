v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 690 50 720 50 {lab=vout}
N 480 130 480 170 {lab=GND}
N 480 -80 480 -50 {lab=VDD}
N 210 10 360 10 {lab=VINP}
N 620 50 690 50 {lab=vout}
N -630 40 -630 80 {lab=VDD}
N -630 140 -630 190 {lab=GND}
N -460 210 -460 240 {lab=GND}
N -630 40 -630 80 {lab=VDD}
N -630 140 -630 190 {lab=GND}
N -460 110 -460 150 {lab=VINP}
N -460 100 -390 100 {lab=VINP}
N -460 100 -460 110 {lab=VINP}
N -390 -10 -390 40 {lab=VINP}
N 210 10 360 10 {lab=VINP}
N 510 130 510 190 {lab=#net1}
N 390 190 510 190 {lab=#net1}
N 300 190 330 190 {lab=VDD}
N 720 50 720 90 {lab=vout}
N 720 130 720 200 {lab=VDD}
N 610 130 690 130 {lab=#net2}
N 850 190 850 210 {lab=GND}
N 610 130 610 230 {lab=#net2}
N 170 230 610 230 {lab=#net2}
N 170 80 170 230 {lab=#net2}
N 170 230 170 310 {lab=#net2}
N -390 40 -390 100 {lab=VINP}
N 850 130 970 130 {lab=VOUT}
N 930 130 930 160 {lab=VOUT}
N 880 220 930 220 {lab=GND}
N 850 220 880 220 {lab=GND}
N 850 210 850 220 {lab=GND}
N 930 190 930 220 {lab=GND}
N 970 190 1010 190 {lab=RST}
N 750 130 850 130 {lab=VOUT}
N 1040 370 1040 430 {lab=GND}
N 1040 230 1040 310 {lab=RST}
N 1040 190 1040 230 {lab=RST}
N 1010 190 1040 190 {lab=RST}
N 360 10 360 20 {lab=VINP}
N 170 80 360 80 {lab=#net2}
N 170 370 170 390 {lab=GND}
N 1960 50 1960 170 {lab=Tocomp}
N 1880 20 1880 100 {lab=#net1}
N 1860 200 1920 200 {lab=VSF}
N 1960 230 1960 280 {lab=GND}
N 1960 200 1960 230 {lab=GND}
N 1960 -40 1960 -10 {lab=VDD}
N 1960 110 2110 110 {lab=Tocomp}
N 1960 20 2010 20 {lab=GND}
N 1880 20 1920 20 {lab=#net1}
C {vdd.sym} 480 -80 0 0 {name=l2 lab=VDD}
C {lab_pin.sym} 210 10 1 0 {name=p2 sig_type=std_logic lab=VINP

}
C {vdd.sym} -630 40 0 0 {name=l4 lab=VDD}
C {vsource.sym} -630 110 0 0 {name=V1 value=1.8 savecurrent=false}
C {gnd.sym} -630 190 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -390 -10 0 0 {name=p5 sig_type=std_logic lab=VINP}
C {devices/code_shown.sym} -140 -160 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {isource.sym} 360 190 3 0 {name=I0 value=100n}
C {vdd.sym} 300 190 3 0 {name=l3 lab=VDD}
C {vsource.sym} -460 180 0 0 {name=V2 value=800m savecurrent=false}
C {pixel/OTA.sym} 480 60 0 0 {name=x1}
C {symbols/pfet_03v3.sym} 720 110 1 0 {name=M1
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
model=pfet_03v3
spiceprefix=X
}
C {vdd.sym} 720 200 2 0 {name=l1 lab=VDD}
C {symbols/cap_mim_2f0fF.sym} 850 160 0 0 {name=C1
W=1e-6
L=1e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {gnd.sym} 480 170 0 0 {name=l6 lab=GND}
C {gnd.sym} -460 240 0 0 {name=l8 lab=GND}
C {gnd.sym} 850 220 0 0 {name=l9 lab=GND}
C {lab_pin.sym} 970 130 2 0 {name=p4 sig_type=std_logic lab=VOUT}
C {devices/code_shown.sym} 1000 -390 0 0 {name=MODELS1 only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice cap_mim
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.lib $::180MCU_MODELS/sm141064.ngspice mimcap_typical
* .lib $::180MCU_MODELS/sm141064.ngspice res_statistical
"}
C {symbols/nfet_03v3.sym} 950 190 0 1 {name=M2
L=0.28u
W=0.22u
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
C {lab_pin.sym} 720 50 2 0 {name=p1 sig_type=std_logic lab=vout}
C {vsource.sym} 1040 340 0 0 {name=V4 value=0 savecurrent=false}
C {gnd.sym} 1040 430 0 0 {name=l7 lab=GND}
C {lab_pin.sym} 1040 210 2 0 {name=p3 sig_type=std_logic lab=RST}
C {devices/code_shown.sym} 60 -170 0 0 {name=MODELS2 only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {code_shown.sym} 1530 -530 0 0 {name=s1 only_toplevel=false value="

.control 
save all
let count=1n

alter @v4[PULSE] = [ 0 1.8 0 1e-5 1e-5 5e-4 1e-3 0 ]
while count le 25n
	alter I1 count
	run
	wrdata vout.txt v(VOUT)
	set appendwrite
	tran 1e-6 2e-3
	let count = count+1n
	plot VOUT
end

.endc


"

}
C {isource.sym} 170 340 0 0 {name=I1 value=1n}
C {gnd.sym} 170 390 0 0 {name=l10 lab=GND}
C {symbols/nfet_03v3.sym} 1940 20 0 0 {name=M5
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
C {symbols/nfet_03v3.sym} 1940 200 0 0 {name=M6
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
C {iopin.sym} 1860 200 1 0 {name=p21 lab=VSF}
C {lab_pin.sym} 1960 280 3 0 {name=p22 sig_type=std_logic lab=GND}
C {lab_pin.sym} 1960 -40 1 0 {name=p23 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 2010 20 3 0 {name=p24 sig_type=std_logic lab=GND}
C {lab_pin.sym} 2110 110 2 0 {name=p56 sig_type=std_logic lab=Tocomp
}
