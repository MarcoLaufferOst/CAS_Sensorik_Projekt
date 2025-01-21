v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 30 -370 590 -250 {flags=graph


ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1


divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=106
unitx=1
logx=0
logy=0



x1=0
x2=4.5e-07
y2=3.3
y1=-0.0077
sim_type=tran
sweep=v(in)
color=4
node="comperator;out"}
B 2 30 -540 590 -370 {flags=graph


ypos1=0.20364346
ypos2=1.2549689
divy=5
subdivy=1
unity=1


divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=106
unitx=1
logx=0
logy=0







sim_type=tran
sweep=v(in)



color="4 5 6"
node="s_h
reset
clk"
digital=1
x2=4.5e-07
x1=0
hilight_wave=-1
y2=3}
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


dataset=106
unitx=1
logx=0
logy=0



x1=0
x2=4.5e-07
y2=2
y1=0.81
sim_type=tran
sweep=v(in)



color="4 5"
node="v_dac
v_sh"}
B 2 30 -1120 590 -990 {flags=graph


ypos1=0
ypos2=2
divy=5

unity=1


divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=106
unitx=1
logx=0
logy=0



x1=0
x2=4.5e-07
y2=1.2
y1=1.1
sim_type=tran
sweep=v(in)


color=4
node=v_in
subdivy=1}
B 2 30 -690 590 -550 {flags=graph


ypos1=0.048416175
ypos2=0.22879915
divy=5
subdivy=1
unity=1


divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=106
unitx=1
logx=0
logy=0







sim_type=tran
sweep=v(in)



color=4
node="code;v_b7,v_b6,v_b5,v_b4,v_b3,v_b2,v_b1,v_b0"
digital=1
x2=4.5e-07
x1=0
hilight_wave=-1
y2=0}
N 710 -140 710 -120 {
lab=GND}
N 710 -240 710 -200 {
lab=V_in}
N 810 -140 810 -120 {
lab=GND}
N 810 -240 810 -200 {
lab=V_ref}
N 820 -830 820 -810 {
lab=V_dd}
N 1000 -760 1020 -760 {
lab=V_ref}
N 1020 -700 1020 -680 {
lab=GND}
N 1000 -700 1020 -700 {
lab=GND}
N 1020 -780 1020 -760 {
lab=V_ref}
N 1130 -660 1130 -640 {
lab=GND}
N 1130 -730 1130 -720 {
lab=out}
N 1040 -730 1130 -730 {
lab=out}
N 910 -140 910 -120 {
lab=GND}
N 910 -240 910 -200 {
lab=V_dd}
N 1010 -140 1010 -120 {
lab=GND}
N 1010 -240 1010 -200 {
lab=i_bias}
N 850 -830 850 -810 {
lab=i_bias}
N 730 -730 750 -730 {
lab=V_in}
N 780 -650 780 -620 {
lab=v_b0}
N 800 -650 800 -620 {
lab=v_b1}
N 820 -650 820 -620 {
lab=v_b2}
N 840 -650 840 -620 {
lab=v_b3}
N 860 -650 860 -620 {
lab=v_b4}
N 880 -650 880 -620 {
lab=v_b5}
N 900 -650 900 -620 {
lab=v_b6}
N 920 -650 920 -620 {
lab=v_b7}
N 880 -830 880 -810 {
lab=s_h}
N 1070 -730 1070 -570 {
lab=out}
N 960 -570 1070 -570 {
lab=out}
N 1120 -140 1120 -120 {
lab=GND}
N 1120 -240 1120 -200 {
lab=s_h}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Marco Lauffer"}
C {sky130_fd_pr/corner.sym} 190 -210 0 0 {name=CORNER only_toplevel=true corner=tt}
C {devices/launcher.sym} 530 -120 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_sar_adc_perf.raw tran"
}
C {devices/vsource.sym} 710 -170 0 0 {name=Vin value=1
spice_ignore=false}
C {devices/gnd.sym} 710 -120 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 710 -240 0 0 {name=p7 lab=V_in}
C {devices/launcher.sym} 530 -160 0 0 {name=h15
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {sar_adc_analog.sym} 900 -730 0 0 {name=x1}
C {devices/lab_pin.sym} 730 -730 0 0 {name=p1 lab=V_in}
C {devices/vsource.sym} 810 -170 0 0 {name=Vref value=2
spice_ignore=false}
C {devices/gnd.sym} 810 -120 0 0 {name=V_REF1 lab=GND
value=2}
C {devices/gnd.sym} 1020 -680 0 0 {name=V_REF4 lab=GND
value=2}
C {devices/res.sym} 1130 -690 0 0 {name=R1
value=100Meg
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 1130 -640 0 0 {name=V_REF5 lab=GND
value=2}
C {devices/vsource.sym} 910 -170 0 0 {name=Vdd value=3
spice_ignore=false}
C {devices/gnd.sym} 910 -120 0 0 {name=V_REF6 lab=GND
value=2}
C {devices/lab_pin.sym} 810 -240 0 0 {name=p2 lab=V_ref}
C {devices/lab_pin.sym} 910 -240 0 0 {name=p3 lab=V_dd}
C {devices/lab_pin.sym} 820 -830 1 0 {name=p4 lab=V_dd}
C {devices/lab_pin.sym} 1020 -780 1 0 {name=p5 lab=V_ref}
C {devices/isource.sym} 1010 -170 0 0 {name=I0 value=250u}
C {devices/gnd.sym} 1010 -120 0 0 {name=V_REF2 lab=GND
value=2}
C {devices/lab_pin.sym} 1010 -240 0 0 {name=p6 lab=i_bias}
C {devices/lab_pin.sym} 850 -830 1 0 {name=p8 lab=i_bias}
C {devices/lab_pin.sym} 880 -830 1 0 {name=p17 lab=s_h}
C {devices/code.sym} 310 -210 0 0 {name=s2 only_toplevel=false value="
.option chgtol=4e-16

*.param TEMPGAUSS = agauss(30, 40, 1)
*.option temp = 'TEMPGAUSS'
*.param DELTA = 0.002

* .param vdda 3.3
.option TNOM=27 GMIN=1e-15 reltol=1e-3 method=gear
.param TRF = 100p
.param AVDD = 3.3
.param PERIOD_CLK = 40n
.param PW_CLK = PERIOD_CLK/2



* VCLK clk 0 dc 0 pulse (0 3.3 0 10p 10p 500n 1u)
VCLK clk 0 dc 0 pulse (0 \{AVDD\} 0 \{TRF\} \{TRF\} \{PW_CLK\} \{PERIOD_CLK\})
VRESET reset 0 dc \{AVDD\} pwl 0 \{AVDD\} \{PW_CLK*4\} \{AVDD\} \{PW_CLK*2 + 1n\} 0


.control

set num_threads=8
unset askquit



*- Override the default digital output bridge.
pre_set auto_bridge_d_out =
     + ( \\".model auto_dac dac_bridge(out_low = 0.0 out_high = 1.8)\\"
     +   \\"auto_bridge%d [ %s ] [ %s ] auto_dac\\" )


let vvin = 2    ; input voltage
let index = 0                     ; loop index in plot 'const'
let loops = 256                     ; number of loops, vector in plot 'const'
let lsb = 0.0078125
repeat $&loops                    ; loop start
  save all
  alter Vin $&vvin                ; alter the voltage Vcc
  tran 1n 450n
  write tb_sar_adc_perf.raw
  set appendwrite
  let vvin = vvin - lsb
  let index = index + 1
  reset
end

.endc
"}
C {devices/lab_pin.sym} 1100 -730 1 0 {name=p18 lab=out}
C {devices/lab_pin.sym} 900 -810 1 0 {name=p19 lab=v_sh}
C {devices/lab_pin.sym} 920 -810 1 0 {name=p20 lab=v_dac}
C {cosim/r2r_dac_control.sym} 850 -570 0 0 {name=x2}
C {devices/lab_wire.sym} 780 -640 3 0 {name=p21 sig_type=std_logic lab=v_b0}
C {devices/lab_wire.sym} 800 -640 3 0 {name=p9 sig_type=std_logic lab=v_b1}
C {devices/lab_wire.sym} 820 -640 3 0 {name=p10 sig_type=std_logic lab=v_b2}
C {devices/lab_wire.sym} 860 -640 3 0 {name=p11 sig_type=std_logic lab=v_b4}
C {devices/lab_wire.sym} 880 -640 3 0 {name=p12 sig_type=std_logic lab=v_b5}
C {devices/lab_wire.sym} 900 -640 3 0 {name=p13 sig_type=std_logic lab=v_b6}
C {devices/lab_wire.sym} 920 -640 3 0 {name=p14 sig_type=std_logic lab=v_b7}
C {devices/lab_wire.sym} 840 -640 3 0 {name=p15 sig_type=std_logic lab=v_b3}
C {devices/lab_pin.sym} 740 -570 0 0 {name=p16 lab=clk}
C {devices/lab_pin.sym} 740 -550 0 0 {name=p22 lab=reset}
C {devices/code.sym} 30 -210 0 0 {name=control_model only_toplevel=false value="
*.include ./../cosim/r2r_dac_control.spice

.subckt r2r_dac_control reset clk comp b7 b6 b5 b4 b3 b2 b1 b0

adut [clk
+ reset
+ comp
+ ]
+ [b7
+ b6
+ b5
+ b4
+ b3
+ b2
+ b1
+ b0
+ ] null r2r_ctrl

.model r2r_ctrl d_cosim simulation=\\"/home/ttuser/tinytapeout/TT_Project/verilog/sim/r2r_dac_control.so\\" delay=10p
.ends r2r_dac_control
"}
C {devices/vsource.sym} 1120 -170 0 0 {name=Vsh value="dc 0 pwl 0 0 2n 0 7n 3.3"
spice_ignore=false}
C {devices/gnd.sym} 1120 -120 0 0 {name=V_REF3 lab=GND
value=2}
C {devices/lab_pin.sym} 1120 -240 0 0 {name=p24 lab=s_h}
