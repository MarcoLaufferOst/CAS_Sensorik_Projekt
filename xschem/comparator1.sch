v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 90 -250 150 -250 {
lab=ibias}
N -30 -250 -30 -220 {
lab=ibias}
N -90 -220 -30 -220 {
lab=ibias}
N -110 -250 -90 -250 {
lab=vdda}
N -110 -280 -110 -250 {
lab=vdda}
N -110 -280 -90 -280 {
lab=vdda}
N 190 -250 210 -250 {
lab=vdda}
N 210 -280 210 -250 {
lab=vdda}
N 190 -280 210 -280 {
lab=vdda}
N -90 -220 -90 -160 {
lab=ibias}
N 190 -220 190 -160 {
lab=vsource}
N 80 -160 290 -160 {
lab=vsource}
N 80 -130 110 -130 {
lab=vdda}
N 260 -130 290 -130 {
lab=vdda}
N -90 -280 -40 -280 {
lab=vdda}
N 40 -250 90 -250 {
lab=ibias}
N 80 -100 80 -60 {
lab=vg}
N 120 -30 250 -30 {
lab=vg}
N 290 -100 290 -60 {
lab=outdiff}
N 80 0 290 0 {
lab=vssa}
N 290 -30 310 -30 {
lab=vssa}
N 310 -30 310 0 {
lab=vssa}
N 290 0 310 0 {
lab=vssa}
N 60 -30 80 -30 {
lab=vssa}
N 60 -30 60 -0 {
lab=vssa}
N 60 -0 80 -0 {
lab=vssa}
N 140 -60 140 -30 {
lab=vg}
N 80 -60 140 -60 {
lab=vg}
N -40 -280 60 -280 {
lab=vdda}
N 60 -280 190 -280 {
lab=vdda}
N -50 -250 40 -250 {
lab=ibias}
N 330 -130 380 -130 {
lab=inp}
N -10 -130 40 -130 {
lab=inn}
N 40 -320 40 -280 {
lab=vdda}
N 180 0 180 40 {
lab=vssa}
N 110 -130 140 -130 {
lab=vdda}
N 230 -130 260 -130 {
lab=vdda}
N 620 -260 620 -220 {
lab=vdda}
N 600 -260 620 -260 {
lab=vdda}
N 620 -160 620 -120 {
lab=outp}
N 620 -60 620 -0 {
lab=vssa}
N 600 0 620 -0 {
lab=vssa}
N 620 -90 640 -90 {
lab=vssa}
N 640 -90 640 -60 {
lab=vssa}
N 620 -60 640 -60 {
lab=vssa}
N 620 -190 640 -190 {
lab=vdda}
N 640 -220 640 -190 {
lab=vdda}
N 620 -220 640 -220 {
lab=vdda}
N 560 -190 580 -190 {
lab=outdiff}
N 560 -190 560 -90 {
lab=outdiff}
N 560 -90 580 -90 {
lab=outdiff}
N 360 -80 500 -80 {
lab=outdiff}
N 290 -80 360 -80 {
lab=outdiff}
N 500 -140 560 -140 {
lab=outdiff}
N 500 -140 500 -80 {
lab=outdiff}
N 620 -140 660 -140 {
lab=outp}
C {/home/ttuser/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_g5v0d10v5.sym} 170 -250 0 0 {name=M1
L=1
W=50
nf=1
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {/home/ttuser/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_g5v0d10v5.sym} -70 -250 0 1 {name=M2
L=1
W=50
nf=1
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {/home/ttuser/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_g5v0d10v5.sym} 60 -130 0 0 {name=M3
L=2
W=50
nf=1
mult=20
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {/home/ttuser/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_g5v0d10v5.sym} 310 -130 0 1 {name=M4
L=2
W=50
nf=1
mult=20
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {/home/ttuser/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_g5v0d10v5.sym} 270 -30 0 0 {name=M5
L=2
W=50
nf=1
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {/home/ttuser/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_g5v0d10v5.sym} 100 -30 0 1 {name=M6
L=2
W=50
nf=1
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {ipin.sym} -90 -160 0 0 {name=p1 lab=ibias}
C {ipin.sym} -10 -130 0 0 {name=p2 lab=inn}
C {ipin.sym} 380 -130 0 1 {name=p3 lab=inp}
C {iopin.sym} 40 -320 0 0 {name=p5 lab=vdda}
C {iopin.sym} 180 40 0 0 {name=p6 lab=vssa
}
C {lab_wire.sym} 140 -130 0 0 {name=p7 sig_type=std_logic lab=vdda}
C {lab_wire.sym} 230 -130 0 1 {name=p8 sig_type=std_logic lab=vdda}
C {/home/ttuser/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_g5v0d10v5.sym} 600 -190 0 0 {name=M7
L=0.5
W=3
nf=1
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
C {/home/ttuser/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_g5v0d10v5.sym} 600 -90 0 0 {name=M8
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
C {lab_wire.sym} 600 -260 0 1 {name=p9 sig_type=std_logic lab=vdda}
C {lab_wire.sym} 600 0 0 1 {name=p10 sig_type=std_logic lab=vssa}
C {opin.sym} 660 -140 0 0 {name=p11 lab=outp}
C {lab_wire.sym} 170 -160 0 0 {name=p4 sig_type=std_logic lab=vsource}
C {lab_wire.sym} 210 -30 0 0 {name=p12 sig_type=std_logic lab=vg}
C {lab_wire.sym} 400 -80 0 1 {name=p13 sig_type=std_logic lab=outdiff}
