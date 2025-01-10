v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -80 0 0 0 {
lab=GND}
N 110 -130 110 -100 {
lab=sw_out1}
N 110 -40 110 0 {
lab=GND}
N 0 0 110 0 {
lab=GND}
N -90 0 -80 0 {
lab=GND}
N -60 -320 -30 -320 {
lab=sw_in}
N -60 -140 -30 -140 {
lab=sw_in}
N 30 -140 60 -140 {
lab=sw_out1}
N 30 -320 60 -320 {
lab=sw_out1}
N 0 -320 0 -290 {
lab=VDD}
N 0 -180 0 -140 {
lab=GND}
N 0 -180 30 -180 {
lab=GND}
N -190 0 -90 0 {
lab=GND}
N -190 -90 -190 0 {
lab=GND}
N -190 -160 -190 -90 {
lab=GND}
N -190 -240 -190 -220 {
lab=sw_in}
N -190 -240 -60 -240 {
lab=sw_in}
N 110 -240 110 -130 {
lab=sw_out1}
N 60 -240 110 -240 {
lab=sw_out1}
N -200 -520 -200 -480 {
lab=en_pmos}
N -260 -550 -240 -550 {
lab=en_nmos}
N -260 -550 -260 -450 {
lab=en_nmos}
N -260 -450 -240 -450 {
lab=en_nmos}
N -200 -500 -140 -500 {
lab=en_pmos}
N -320 -500 -260 -500 {
lab=en_nmos}
N -200 -600 -200 -580 {
lab=VDD}
N -200 -550 -180 -550 {
lab=VDD}
N -180 -600 -180 -550 {
lab=VDD}
N -200 -600 -180 -600 {
lab=VDD}
N -200 -450 -180 -450 {
lab=GND}
N -180 -450 -180 -400 {
lab=GND}
N -200 -400 -180 -400 {
lab=GND}
N -200 -420 -200 -400 {
lab=GND}
N 0 -400 0 -360 {
lab=en_pmos}
N 0 -100 0 -60 {
lab=en_nmos}
N -380 -260 -380 -190 {
lab=VDD}
N -60 -240 -60 -140 {
lab=sw_in}
N 60 -240 60 -140 {
lab=sw_out1}
N -60 -320 -60 -240 {
lab=sw_in}
N 60 -320 60 -240 {
lab=sw_out1}
N 330 0 410 0 {
lab=GND}
N 750 -130 750 -100 {
lab=sw_out2}
N 750 -40 750 0 {
lab=GND}
N 410 0 520 0 {
lab=GND}
N 320 0 330 0 {
lab=GND}
N 350 -320 380 -320 {
lab=sw_in}
N 350 -140 380 -140 {
lab=sw_in}
N 440 -140 470 -140 {
lab=#net1}
N 440 -320 470 -320 {
lab=#net2}
N 410 -320 410 -290 {
lab=VDD}
N 410 -180 410 -140 {
lab=GND}
N 410 -180 440 -180 {
lab=GND}
N 220 0 320 0 {
lab=GND}
N 220 -240 350 -240 {
lab=sw_in}
N 750 -240 750 -130 {
lab=sw_out2}
N 700 -240 750 -240 {
lab=sw_out2}
N 410 -400 410 -360 {
lab=en_pmos}
N 410 -100 410 -60 {
lab=en_nmos}
N 350 -240 350 -140 {
lab=sw_in}
N 700 -240 700 -140 {
lab=sw_out2}
N 350 -320 350 -240 {
lab=sw_in}
N 700 -320 700 -240 {
lab=sw_out2}
N 520 0 620 0 {
lab=GND}
N 530 -320 570 -320 {
lab=#net3}
N 500 -320 500 -290 {
lab=VDD}
N 410 -290 500 -290 {
lab=VDD}
N 500 -400 500 -360 {
lab=en_pmos}
N 500 -180 500 -140 {
lab=GND}
N 440 -180 500 -180 {
lab=GND}
N 530 -140 570 -140 {
lab=#net4}
N 500 -100 500 -60 {
lab=en_nmos}
N 620 0 750 0 {
lab=GND}
N 630 -320 700 -320 {
lab=sw_out2}
N 630 -140 700 -140 {
lab=sw_out2}
N 570 -320 630 -320 {}
N 570 -140 630 -140 {}
C {code.sym} 820 -250 0 0 {name=spice only_toplevel=false value="

.lib /home/ttuser/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt

.option temp=27

.control
  dc v1 0 2 0.01
  *plot v(sw_in)/i(V3) 
  plot v(sw_in)/i(V6)
  *plot i(V1) 			
.endc

.save all

"}
C {gnd.sym} -50 0 0 0 {name=l1 lab=GND}
C {vsource.sym} -190 -190 0 0 {name=V1 value=1 savecurrent=false}
C {vsource.sym} 110 -70 0 0 {name=V3 value=0 savecurrent=false}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 0 -120 1 1 {name=M1
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
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 0 -340 3 1 {name=M2
L=0.5
W=30
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
C {gnd.sym} 30 -180 0 0 {name=l2 lab=GND}
C {vdd.sym} 0 -290 2 0 {name=l3 lab=VDD}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} -220 -450 0 0 {name=M3
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
C {sky130_fd_pr/pfet_g5v0d10v5.sym} -220 -550 0 0 {name=M4
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
C {gnd.sym} -200 -400 0 0 {name=l4 lab=GND}
C {vdd.sym} -180 -600 0 0 {name=l5 lab=VDD}
C {vsource.sym} -320 -470 0 0 {name=V2 value=3.3 savecurrent=false}
C {gnd.sym} -320 -440 0 0 {name=l6 lab=GND}
C {devices/lab_wire.sym} -280 -500 0 0 {name=p1 sig_type=std_logic lab=en_nmos}
C {devices/lab_wire.sym} -150 -500 0 0 {name=p2 sig_type=std_logic lab=en_pmos}
C {devices/lab_wire.sym} 0 -80 0 0 {name=p3 sig_type=std_logic lab=en_nmos}
C {devices/lab_wire.sym} 0 -380 0 0 {name=p4 sig_type=std_logic lab=en_pmos}
C {devices/lab_wire.sym} -110 -240 0 0 {name=p5 sig_type=std_logic lab=sw_in}
C {devices/lab_wire.sym} 110 -240 0 0 {name=p6 sig_type=std_logic lab=sw_out1}
C {vsource.sym} -380 -160 0 0 {name=V4 value=3.3 savecurrent=false}
C {gnd.sym} -380 -130 0 0 {name=l7 lab=GND}
C {devices/lab_wire.sym} -380 -220 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {gnd.sym} 360 0 0 0 {name=l8 lab=GND}
C {vsource.sym} 750 -70 0 0 {name=V6 value=0 savecurrent=false}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 410 -120 1 1 {name=M5
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
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 410 -340 3 1 {name=M6
L=0.5
W=30
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
C {gnd.sym} 440 -180 0 0 {name=l9 lab=GND}
C {vdd.sym} 410 -290 2 0 {name=l10 lab=VDD}
C {devices/lab_wire.sym} 410 -80 0 0 {name=p8 sig_type=std_logic lab=en_nmos}
C {devices/lab_wire.sym} 410 -380 0 0 {name=p9 sig_type=std_logic lab=en_pmos}
C {devices/lab_wire.sym} 300 -240 0 0 {name=p10 sig_type=std_logic lab=sw_in}
C {devices/lab_wire.sym} 750 -240 0 0 {name=p11 sig_type=std_logic lab=sw_out2
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 500 -340 3 1 {name=M7
L=0.5
W=30
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
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 500 -120 1 1 {name=M8
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
C {devices/lab_wire.sym} 500 -80 0 0 {name=p12 sig_type=std_logic lab=en_nmos}
C {devices/lab_wire.sym} 500 -380 0 0 {name=p13 sig_type=std_logic lab=en_pmos}
