v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 90 -410 150 -410 {
lab=ibias}
N -30 -410 -30 -380 {
lab=ibias}
N -90 -380 -30 -380 {
lab=ibias}
N -110 -410 -90 -410 {
lab=ibias}
N -110 -440 -110 -410 {
lab=ibias}
N -110 -440 -90 -440 {
lab=ibias}
N 190 -410 210 -410 {
lab=ibias}
N 210 -440 210 -410 {
lab=ibias}
N 190 -440 210 -440 {
lab=ibias}
N -90 -380 -90 -320 {
lab=ibias}
N 190 -380 190 -320 {
lab=vsp}
N 80 -320 290 -320 {
lab=vsp}
N 80 -290 110 -290 {
lab=vdda}
N 260 -290 290 -290 {
lab=vdda}
N -90 -440 -40 -440 {
lab=ibias}
N 40 -410 90 -410 {
lab=ibias}
N 80 -260 80 -220 {
lab=vgsn}
N 120 -30 250 -30 {
lab=vgsn}
N 290 -260 290 -220 {
lab=vout1}
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
lab=vgsn}
N -40 -440 60 -440 {
lab=ibias}
N 60 -440 190 -440 {
lab=ibias}
N -50 -410 40 -410 {
lab=ibias}
N 330 -290 380 -290 {
lab=inp}
N -10 -290 40 -290 {
lab=inn}
N 40 -480 40 -440 {
lab=ibias}
N 180 0 180 40 {
lab=vssa}
N 110 -290 140 -290 {
lab=vdda}
N 230 -290 260 -290 {
lab=vdda}
N 950 -240 950 -200 {
lab=#net1}
N 950 -170 970 -170 {
lab=vssa}
N 970 -170 970 -140 {
lab=vssa}
N 950 -140 970 -140 {
lab=vssa}
N 950 -270 970 -270 {
lab=ibias}
N 970 -300 970 -270 {
lab=ibias}
N 950 -300 970 -300 {
lab=ibias}
N 890 -270 910 -270 {
lab=voutinv1}
N 890 -270 890 -170 {
lab=voutinv1}
N 890 -170 910 -170 {
lab=voutinv1}
N 290 -220 290 -130 {
lab=vout1}
N 80 -220 80 -130 {
lab=vgsn}
N 80 -60 140 -60 {
lab=vgsn}
N 290 -130 290 -60 {
lab=vout1}
N 80 -130 80 -60 {
lab=vgsn}
N 290 -100 440 -100 {
lab=vout1}
N 440 -100 440 -30 {
lab=vout1}
N 440 -30 480 -30 {
lab=vout1}
N 520 -30 540 -30 {
lab=vssa}
N 540 -30 540 -0 {
lab=vssa}
N 520 0 540 -0 {
lab=vssa}
N 310 0 520 0 {
lab=vssa}
N 210 -440 520 -440 {
lab=ibias}
N 520 -410 540 -410 {
lab=ibias}
N 540 -440 540 -410 {
lab=ibias}
N 520 -440 540 -440 {
lab=ibias}
N 440 -410 480 -410 {
lab=ibias}
N 440 -410 440 -380 {
lab=ibias}
N 440 -380 440 -360 {
lab=ibias}
N 120 -360 440 -360 {
lab=ibias}
N 120 -410 120 -360 {
lab=ibias}
N 540 -440 950 -440 {
lab=ibias}
N 540 -0 950 -0 {
lab=vssa}
N 950 -440 950 -300 {
lab=ibias}
N 950 -140 950 -0 {
lab=vssa}
N 740 -240 740 -200 {
lab=voutinv1}
N 740 -170 760 -170 {
lab=vssa}
N 760 -170 760 -140 {
lab=vssa}
N 740 -140 760 -140 {
lab=vssa}
N 740 -270 760 -270 {
lab=ibias}
N 760 -300 760 -270 {
lab=ibias}
N 740 -300 760 -300 {
lab=ibias}
N 680 -270 700 -270 {
lab=vout2}
N 680 -270 680 -170 {
lab=vout2}
N 680 -170 700 -170 {
lab=vout2}
N 740 -440 740 -300 {
lab=ibias}
N 740 -140 740 0 {
lab=vssa}
N 740 -220 890 -220 {
lab=voutinv1}
N 520 -380 520 -60 {
lab=outp}
N 30 -480 40 -480 {
lab=ibias}
N 160 40 180 40 {
lab=vssa}
N 950 -220 990 -220 {}
N 520 -220 680 -220 {}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 170 -410 0 0 {name=M1
L=1
W=50
nf=1
mult=4
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} -70 -410 0 1 {name=M2
L=1
W=50
nf=1
mult=4
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 60 -290 0 0 {name=M3
L=1
W=50
nf=1
mult=4
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 310 -290 0 1 {name=M4
L=1
W=50
nf=1
mult=4
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 270 -30 0 0 {name=M5
L=1
W=35
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
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 100 -30 0 1 {name=M6
L=1
W=35
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
C {devices/ipin.sym} -90 -320 0 0 {name=p1 lab=ibias}
C {devices/ipin.sym} -10 -290 0 0 {name=p2 lab=inn}
C {devices/ipin.sym} 380 -290 0 1 {name=p3 lab=inp}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 930 -270 0 0 {name=M7
L=0.5
W=3.5
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
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 930 -170 0 0 {name=M8
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
C {devices/opin.sym} 990 -220 0 0 {name=p11 lab=outp}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 500 -30 0 0 {name=M9
L=1
W=35
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
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 500 -410 0 0 {name=M10
L=1
W=50
nf=1
mult=4
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 720 -270 0 0 {name=M11
L=0.5
W=3.5
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
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 720 -170 0 0 {name=M12
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
C {devices/lab_wire.sym} 850 -220 0 0 {name=p4 sig_type=std_logic lab=voutinv1}
C {devices/lab_wire.sym} 380 -100 0 0 {name=p10 sig_type=std_logic lab=vout1}
C {devices/lab_wire.sym} 170 -320 0 0 {name=p13 sig_type=std_logic lab=vsp}
C {devices/lab_wire.sym} 210 -30 0 0 {name=p14 sig_type=std_logic lab=vgsn}
C {devices/lab_wire.sym} 680 -240 0 0 {name=p9 sig_type=std_logic lab=vout2}
C {devices/lab_wire.sym} 140 -290 0 0 {name=p7 sig_type=std_logic lab=vdda}
C {devices/lab_wire.sym} 230 -290 0 0 {name=p8 sig_type=std_logic lab=vdda}
C {devices/ipin.sym} 30 -480 0 0 {name=p12 lab=vdda}
C {devices/ipin.sym} 160 40 0 0 {name=p5 lab=vssa}
