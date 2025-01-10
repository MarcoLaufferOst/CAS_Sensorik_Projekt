v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -60 -640 -30 -640 {
lab=vin}
N -60 -460 -30 -460 {
lab=vin}
N 30 -460 60 -460 {
lab=vout}
N 30 -640 60 -640 {
lab=vout}
N 0 -640 0 -610 {
lab=vdda}
N 60 -550 110 -550 {
lab=vout}
N 60 -560 60 -460 {
lab=vout}
N -60 -630 -60 -550 {
lab=vin}
N 60 -640 60 -560 {
lab=vout}
N -40 -610 -0 -610 {
lab=vdda}
N -0 -700 0 -680 {
lab=sample_n}
N -40 -700 0 -700 {
lab=sample_n}
N 0 -420 0 -400 {
lab=sample}
N -40 -400 -0 -400 {
lab=sample}
N -60 -640 -60 -630 {
lab=vin}
N -60 -550 -60 -460 {
lab=vin}
N -0 -490 -0 -460 {
lab=vssa}
N -40 -490 -0 -490 {
lab=vssa}
N 110 -550 200 -550 {
lab=vout}
N -100 -550 -60 -550 {
lab=vin}
N -290 -580 -290 -540 {
lab=sample_n}
N -350 -610 -330 -610 {
lab=sample}
N -350 -610 -350 -510 {
lab=sample}
N -350 -510 -330 -510 {
lab=sample}
N -290 -560 -230 -560 {
lab=sample_n}
N -410 -560 -350 -560 {
lab=sample}
N -290 -660 -290 -640 {
lab=vdda}
N -290 -610 -270 -610 {
lab=vdda}
N -270 -660 -270 -610 {
lab=vdda}
N -290 -660 -270 -660 {
lab=vdda}
N -290 -510 -270 -510 {
lab=vssa}
N -270 -510 -270 -460 {
lab=vssa}
N -290 -460 -270 -460 {
lab=vssa}
N -290 -480 -290 -460 {
lab=vssa}
N 160 -490 160 -460 {
lab=vssa}
N 130 -460 160 -460 {
lab=vssa}
N -410 -460 -290 -460 {
lab=vssa}
N -410 -660 -290 -660 {
lab=vdda}
C {/home/ttuser/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_g5v0d10v5.sym} 0 -440 1 1 {name=M5
L=0.5
W=10
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {/home/ttuser/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_g5v0d10v5.sym} 0 -660 3 1 {name=M6
L=0.5
W=30
nf=3
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {lab_wire.sym} 0 -400 0 0 {name=p8 sig_type=std_logic lab=sample}
C {lab_wire.sym} 0 -700 0 0 {name=p9 sig_type=std_logic lab=sample_n}
C {lab_wire.sym} 0 -490 0 0 {name=p7 sig_type=std_logic lab=vssa}
C {lab_wire.sym} 0 -610 0 0 {name=p11 sig_type=std_logic lab=vdda}
C {opin.sym} 200 -550 0 0 {name=p17 lab=vout}
C {ipin.sym} -410 -660 0 0 {name=p5 lab=vdda}
C {ipin.sym} -410 -460 0 0 {name=p6 lab=vssa}
C {ipin.sym} -100 -550 0 0 {name=p18 lab=vin}
C {/home/ttuser/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_g5v0d10v5.sym} -310 -510 0 0 {name=M3
L=0.5
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {/home/ttuser/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_g5v0d10v5.sym} -310 -610 0 0 {name=M4
L=0.5
W=3
nf=3
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {lab_wire.sym} -230 -560 0 0 {name=p2 sig_type=std_logic lab=sample_n}
C {ipin.sym} -410 -560 0 0 {name=p1 lab=sample}
C {/home/ttuser/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/cap_mim_m3_1.sym} 160 -520 0 0 {name=C1 model=cap_mim_m3_1 W=17 L=30 MF=1 spiceprefix=X}
C {lab_wire.sym} 160 -460 0 0 {name=p3 sig_type=std_logic lab=vssa}
