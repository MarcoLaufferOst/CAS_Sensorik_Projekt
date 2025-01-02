v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 192.5 -1440 995 -882.5 {flags=graph
y1=0.0077
y2=2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=7.0417846e-07
x2=7.4079858e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node=dac_out
color=4
dataset=-1
unitx=1
logx=0
logy=0
}
B 2 192.5 -880 995 -682.5 {flags=graph
y1=0.0077
y2=2
ypos1=-0.048597622
ypos2=0.53823872
divy=5
subdivy=1
unity=1


divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0


digital=1



x1=7.0417846e-07
x2=7.4079858e-07
color=4
node="Code;v_b7,v_b6,v_b5,v_b4,v_b3,v_b2,v_b1,v_b0"}
N 467.5 -142.5 467.5 -122.5 {
lab=GND}
N 467.5 -242.5 467.5 -202.5 {
lab=Vref}
N 937.5 -277.5 977.5 -277.5 {
lab=GND}
N 977.5 -277.5 977.5 -257.5 {
lab=GND}
N 937.5 -317.5 957.5 -317.5 {
lab=Vref}
N 937.5 -417.5 977.5 -417.5 {
lab=dac_out}
N 597.5 -417.5 637.5 -417.5 {
lab=v_b0}
N 597.5 -397.5 637.5 -397.5 {
lab=v_b1}
N 597.5 -377.5 637.5 -377.5 {
lab=v_b2}
N 597.5 -357.5 637.5 -357.5 {
lab=v_b3}
N 597.5 -337.5 637.5 -337.5 {
lab=v_b4}
N 597.5 -317.5 637.5 -317.5 {
lab=v_b5}
N 597.5 -297.5 637.5 -297.5 {
lab=v_b6}
N 597.5 -277.5 637.5 -277.5 {
lab=v_b7}
N 1057.5 -317.5 1057.5 -297.5 {
lab=GND}
N 1057.5 -417.5 1057.5 -377.5 {
lab=dac_out}
N 977.5 -417.5 1057.5 -417.5 {
lab=dac_out}
C {devices/title.sym} 160 -32.5 0 0 {name=l1 author="Marco Lauffer"}
C {sky130_fd_pr/corner.sym} 52.5 -217.5 0 0 {name=CORNER only_toplevel=true corner=tt}
C {devices/launcher.sym} 237.5 -127.5 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_dac_dc_transfer.raw tran"
}
C {devices/vsource.sym} 467.5 -172.5 0 0 {name=V1 value=2
spice_ignore=false}
C {devices/gnd.sym} 467.5 -122.5 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 467.5 -242.5 0 0 {name=p7 lab=Vref}
C {devices/launcher.sym} 237.5 -167.5 0 0 {name=h15
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {r2r_dac.sym} 787.5 -347.5 0 0 {name=x1}
C {devices/gnd.sym} 977.5 -257.5 0 0 {name=l4 lab=GND}
C {devices/lab_wire.sym} 957.5 -317.5 0 1 {name=p5 sig_type=std_logic lab=Vref}
C {devices/gnd.sym} 1057.5 -297.5 0 0 {name=l2 lab=GND}
C {devices/res.sym} 1057.5 -347.5 0 0 {name=R1
value=100Meg
footprint=1206
device=resistor
m=1}
C {devices/code_shown.sym} 7.5 -600 0 0 {name=s1 only_toplevel="false" value="

* this experimental option enables mos model bin
* selection basedon W/NF instead of W
.option wnflag=1

.param v_hi = 1.8

.include stimuli_tb_dac_codes.cir

.control
save all
tran 1n 1280n
write tb_dac_dc_transfer.raw
plot v(dac_out)

.endc



"}
C {devices/lab_pin.sym} 597.5 -417.5 0 0 {name=p1 lab=v_b0}
C {devices/lab_pin.sym} 597.5 -397.5 0 0 {name=p3 lab=v_b1}
C {devices/lab_pin.sym} 597.5 -377.5 0 0 {name=p4 lab=v_b2}
C {devices/lab_pin.sym} 597.5 -357.5 0 0 {name=p6 lab=v_b3}
C {devices/lab_pin.sym} 597.5 -337.5 0 0 {name=p8 lab=v_b4}
C {devices/lab_pin.sym} 597.5 -317.5 0 0 {name=p9 lab=v_b5}
C {devices/lab_pin.sym} 597.5 -297.5 0 0 {name=p10 lab=v_b6}
C {devices/lab_pin.sym} 597.5 -277.5 0 0 {name=p11 lab=v_b7}
C {devices/lab_pin.sym} 1057.5 -417.5 0 1 {name=p12 lab=dac_out}
