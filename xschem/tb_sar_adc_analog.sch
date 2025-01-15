v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 30 -390 590 -270 {flags=graph


ypos1=0
ypos2=2
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



x1=1.1658087e-09
x2=1.5250428e-07
y2=3.3
y1=-0.0077
sim_type=tran
sweep=v(in)
color=4
node=out}
B 2 30 -520 590 -390 {flags=graph


ypos1=0
ypos2=2
divy=5

unity=1


divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0



x1=1.1658087e-09
x2=1.5250428e-07
y2=0.8113868
y1=0.75612385
sim_type=tran
sweep=v(in)


color=4
node=v_sh
subdivy=1}
B 2 30 -690 590 -520 {flags=graph


ypos1=0.018977636
ypos2=0.40687778
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







sim_type=tran
sweep=v(in)



color="4 5"
node="code;v_b7,v_b6,v_b5,v_b4,v_b3,v_b2,v_b1,v_b0

s_h"
digital=1
x2=1.5250428e-07
x1=1.1658087e-09
hilight_wave=-1
y2=1}
B 2 30 -990 590 -690 {flags=graph


ypos1=0
ypos2=2
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



x1=1.1658087e-09
x2=1.5250428e-07
y2=2.4217034
y1=0.49210343
sim_type=tran
sweep=v(in)



color="4 5"
node="v_dac
v_sh"}
N 550 -140 550 -120 {
lab=GND}
N 550 -240 550 -200 {
lab=V_in}
N 650 -140 650 -120 {
lab=GND}
N 650 -240 650 -200 {
lab=V_ref}
N 740 -710 740 -690 {
lab=V_dd}
N 920 -640 940 -640 {
lab=V_ref}
N 940 -580 940 -560 {
lab=GND}
N 920 -580 940 -580 {
lab=GND}
N 940 -660 940 -640 {
lab=V_ref}
N 1050 -540 1050 -520 {
lab=GND}
N 1050 -610 1050 -600 {
lab=out}
N 960 -610 1050 -610 {
lab=out}
N 750 -140 750 -120 {
lab=GND}
N 750 -240 750 -200 {
lab=V_dd}
N 850 -140 850 -120 {
lab=GND}
N 850 -240 850 -200 {
lab=i_bias}
N 770 -710 770 -690 {
lab=i_bias}
N 650 -610 670 -610 {
lab=V_in}
N 700 -530 700 -500 {
lab=v_b0}
N 720 -530 720 -500 {
lab=v_b1}
N 740 -530 740 -500 {
lab=v_b2}
N 760 -530 760 -500 {
lab=v_b3}
N 780 -530 780 -500 {
lab=v_b4}
N 800 -530 800 -500 {
lab=v_b5}
N 820 -530 820 -500 {
lab=v_b6}
N 840 -530 840 -500 {
lab=v_b7}
N 800 -710 800 -690 {
lab=s_h}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Marco Lauffer"}
C {sky130_fd_pr/corner.sym} 30 -210 0 0 {name=CORNER only_toplevel=true corner=tt}
C {devices/launcher.sym} 370 -120 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_sar_adc_analog.raw tran"
}
C {devices/vsource.sym} 550 -170 0 0 {name=Vin value=1
spice_ignore=false}
C {devices/gnd.sym} 550 -120 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 550 -240 0 0 {name=p7 lab=V_in}
C {devices/launcher.sym} 370 -160 0 0 {name=h15
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {sar_adc_analog.sym} 820 -610 0 0 {name=x1}
C {devices/lab_pin.sym} 650 -610 0 0 {name=p1 lab=V_in}
C {devices/vsource.sym} 650 -170 0 0 {name=Vref value=2
spice_ignore=false}
C {devices/gnd.sym} 650 -120 0 0 {name=V_REF1 lab=GND
value=2}
C {devices/gnd.sym} 940 -560 0 0 {name=V_REF4 lab=GND
value=2}
C {devices/res.sym} 1050 -570 0 0 {name=R1
value=100Meg
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 1050 -520 0 0 {name=V_REF5 lab=GND
value=2}
C {devices/vsource.sym} 750 -170 0 0 {name=Vdd value=3
spice_ignore=false}
C {devices/gnd.sym} 750 -120 0 0 {name=V_REF6 lab=GND
value=2}
C {devices/lab_pin.sym} 650 -240 0 0 {name=p2 lab=V_ref}
C {devices/lab_pin.sym} 750 -240 0 0 {name=p3 lab=V_dd}
C {devices/lab_pin.sym} 740 -710 1 0 {name=p4 lab=V_dd}
C {devices/lab_pin.sym} 940 -660 1 0 {name=p5 lab=V_ref}
C {devices/isource.sym} 850 -170 0 0 {name=I0 value=250u}
C {devices/gnd.sym} 850 -120 0 0 {name=V_REF2 lab=GND
value=2}
C {devices/lab_pin.sym} 850 -240 0 0 {name=p6 lab=i_bias}
C {devices/lab_pin.sym} 770 -710 1 0 {name=p8 lab=i_bias}
C {devices/lab_pin.sym} 700 -500 3 0 {name=p9 lab=v_b0}
C {devices/lab_pin.sym} 720 -500 3 0 {name=p10 lab=v_b1}
C {devices/lab_pin.sym} 740 -500 3 0 {name=p11 lab=v_b2}
C {devices/lab_pin.sym} 760 -500 3 0 {name=p12 lab=v_b3}
C {devices/lab_pin.sym} 780 -500 3 0 {name=p13 lab=v_b4}
C {devices/lab_pin.sym} 800 -500 3 0 {name=p14 lab=v_b5}
C {devices/lab_pin.sym} 820 -500 3 0 {name=p15 lab=v_b6}
C {devices/lab_pin.sym} 840 -500 3 0 {name=p16 lab=v_b7}
C {devices/lab_pin.sym} 800 -710 1 0 {name=p17 lab=s_h}
C {devices/code.sym} 150 -210 0 0 {name=s2 only_toplevel=false value="
.include \\"stimuli_tb_sar_adc_analog.cir\\"
.param v_hi = 1.8

.control

let index = 0


repeat 1
save all
tran 10p 172n
write tb_sar_adc_analog.raw
reset
end

.endc
"}
C {devices/lab_pin.sym} 1020 -610 1 0 {name=p18 lab=out}
C {devices/lab_pin.sym} 820 -690 1 0 {name=p19 lab=v_sh}
C {devices/lab_pin.sym} 840 -690 1 0 {name=p20 lab=v_dac}
