v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -370 -210 -180 -210 {
lab=inb}
N -370 -100 -370 -60 {
lab=inb}
N -410 -240 -170 -240 {
lab=ina}
N 60 -190 100 -190 {
lab=vout}
N 100 -30 100 0 {
lab=GND}
N 10 -10 10 0 {
lab=GND}
N -470 -120 -470 -60 {
lab=vdda}
N -490 -120 -470 -120 {
lab=vdda}
N -10 -310 10 -310 {
lab=vdda}
N 10 -310 10 -280 {
lab=vdda}
N 100 -190 100 -90 {
lab=vout}
N -420 -240 -410 -240 {
lab=ina}
N -420 -240 -420 -60 {
lab=ina}
N -170 -240 -90 -240 {
lab=ina}
N -370 -200 -370 -100 {
lab=inb}
N -370 -210 -370 -200 {
lab=inb}
N -180 -210 -90 -210 {
lab=inb}
N -320 -170 -90 -170 {
lab=inc}
N -270 -140 -90 -140 {
lab=ind}
N -320 -100 -320 -60 {
lab=inc}
N -270 -100 -270 -60 {
lab=ind}
N -270 -140 -270 -100 {
lab=ind}
N -320 -170 -320 -100 {
lab=inc}
N 10 -80 10 -10 {
lab=GND}
N -30 -80 -30 -40 {
lab=sel1}
N -10 -80 -10 -40 {
lab=sel0}
N -50 -80 -50 -40 {
lab=ena}
C {vsource.sym} -370 -30 0 0 {name=VB value=1 savecurrent=false}
C {vsource.sym} -420 -30 0 0 {name=VA value=0.5 savecurrent=false}
C {gnd.sym} -370 0 0 0 {name=l3 lab=GND}
C {gnd.sym} -420 0 0 0 {name=l4 lab=GND}
C {vsource.sym} -470 -30 0 0 {name=VDD value=3.3 savecurrent=false}
C {gnd.sym} -470 0 0 0 {name=l6 lab=GND}
C {capa.sym} 100 -60 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {code.sym} 350 -230 0 0 {name=spice only_toplevel=false value="

.lib /home/ttuser/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt

.save all
.option temp=27
vins0 sel0 0 pulse(0 3.3 1us 10NS 10NS 1u 2u 4)
vins1 sel1 0 pulse(0 3.3 2us 10NS 10NS 2u 4u 2)
vinen ena 0 pulse(0 3.3 4.5us 10NS 10NS 4.5u 10u 1)

.control
  tran 1n 10u
  plot v(vout) v(sel0) v(sel1) v(ena)
.endc

"}
C {gnd.sym} 10 0 0 0 {name=l1 lab=GND}
C {gnd.sym} 100 0 0 0 {name=l8 lab=GND}
C {devices/lab_wire.sym} 10 -310 0 0 {name=p1 sig_type=std_logic lab=vdda}
C {devices/lab_wire.sym} -470 -120 0 0 {name=p4 sig_type=std_logic lab=vdda}
C {devices/lab_wire.sym} -170 -240 0 0 {name=p5 sig_type=std_logic lab=ina
}
C {devices/lab_wire.sym} -170 -210 0 0 {name=p6 sig_type=std_logic lab=inb}
C {devices/lab_wire.sym} 100 -190 0 0 {name=p7 sig_type=std_logic lab=vout
}
C {/home/ttuser/mux_4to1.sym} 60 -190 0 0 {name=x1}
C {vsource.sym} -320 -30 0 0 {name=VC value=1.5 savecurrent=false}
C {gnd.sym} -320 0 0 0 {name=l2 lab=GND}
C {vsource.sym} -270 -30 0 0 {name=VD value=2 savecurrent=false}
C {gnd.sym} -270 0 0 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} -170 -170 0 0 {name=p2 sig_type=std_logic lab=inc
}
C {devices/lab_wire.sym} -170 -140 0 0 {name=p3 sig_type=std_logic lab=ind
}
C {devices/lab_wire.sym} -30 -80 3 0 {name=p8 sig_type=std_logic lab=sel1
}
C {devices/lab_wire.sym} -10 -80 3 0 {name=p9 sig_type=std_logic lab=sel0
}
C {devices/lab_wire.sym} -50 -80 3 0 {name=p10 sig_type=std_logic lab=ena
}
