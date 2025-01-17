v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 30 -830 850 -700 {flags=graph


ypos1=0.09120523
ypos2=0.42337203
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



x1=-2.1979484e-07
x2=1.2693881e-05
y2=2
y1=-0.0012
sim_type=tran
sweep=v(in)
digital=1
color=4
node="code;b7,b6,b5,b4,b3,b2,b1,b0"}
B 2 30 -1100 850 -830 {flags=graph


ypos1=0.12916155
ypos2=1.3771027
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



x1=-2.1979484e-07
x2=1.2693881e-05
y2=3.3
y1=-0.0012
sim_type=tran
sweep=v(in)
digital=1

color="4 4 4"
node="clk
reset
comp"}
N 480 -390 480 -340 {
lab=b0}
N 500 -390 500 -340 {
lab=b1}
N 520 -390 520 -340 {
lab=b2}
N 540 -390 540 -340 {
lab=b3}
N 560 -390 560 -340 {
lab=b4}
N 580 -390 580 -340 {
lab=b5}
N 600 -390 600 -340 {
lab=b6}
N 620 -390 620 -340 {
lab=b7}
N 420 -270 440 -270 {
lab=reset}
N 420 -290 440 -290 {
lab=clk}
N 660 -290 730 -290 {
lab=comp}
N 730 -290 730 -270 {
lab=comp}
N 730 -210 730 -190 {
lab=GND}
N 100 -630 100 -610 {
lab=b0}
N 100 -550 100 -530 {
lab=GND}
N 220 -630 220 -610 {
lab=b1}
N 220 -550 220 -530 {
lab=GND}
N 330 -550 330 -530 {
lab=GND}
N 450 -550 450 -530 {
lab=GND}
N 450 -630 450 -610 {
lab=b3}
N 330 -630 330 -610 {
lab=b2}
N 570 -630 570 -610 {
lab=b4}
N 570 -550 570 -530 {
lab=GND}
N 690 -550 690 -530 {
lab=GND}
N 810 -550 810 -530 {
lab=GND}
N 810 -630 810 -610 {
lab=b6}
N 690 -630 690 -610 {
lab=b5}
N 940 -550 940 -530 {
lab=GND}
N 940 -630 940 -610 {
lab=b7}
N 850 -215 850 -200 {
lab=GND}
N 850 -290 850 -270 {
lab=comp}
N 730 -290 850 -290 {
lab=comp}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Marco Lauffer"}
C {sky130_fd_pr/corner.sym} 30 -210 0 0 {name=CORNER only_toplevel=true corner=tt}
C {devices/launcher.sym} 370 -120 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_dac_control.raw tran"
}
C {devices/code.sym} 150 -210 0 0 {name=s1 only_toplevel=false value="

.option chgtol=4e-16

*.param TEMPGAUSS = agauss(30, 40, 1)
*.option temp = 'TEMPGAUSS'
*.param DELTA = 0.002

* .param vdda 3.3
.option TNOM=27 GMIN=1e-15 reltol=1e-3 method=gear
.param TRF = 10p
.param AVDD = 3.3
.param PERIOD_CLK = 1u
.param PW_CLK = PERIOD_CLK/2



* VCLK clk 0 dc 0 pulse (0 3.3 0 10p 10p 500n 1u)
VCLK clk 0 dc 0 pulse (0 \{AVDD\} 0 \{TRF\} \{TRF\} \{PW_CLK\} \{PERIOD_CLK\})
VRESET reset 0 dc \{AVDD\} pwl 0 \{AVDD\} \{PW_CLK*4\} \{AVDD\} \{PW_CLK*2 + 1n\} 0


.control
set num_threads=8
unset askquit

*optran 0 0 0 1n 1u 0

*- Override the default digital output bridge.
pre_set auto_bridge_d_out =
     + ( \\".model auto_dac dac_bridge(out_low = 0.0 out_high = 1.8)\\"
     +   \\"auto_bridge%d [ %s ] [ %s ] auto_dac\\" )



   setseed 3
   *reset
   save all
   tran 100p 15u
   write tb_dac_control.raw
   *reset
   set appendwrite
.endc


"}
C {devices/launcher.sym} 370 -160 0 0 {name=h15
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/code.sym} 20 -360 0 0 {name=control_model only_toplevel=false value="
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
C {cosim/r2r_dac_control.sym} 550 -290 0 0 {name=x1}
C {devices/lab_pin.sym} 420 -290 0 0 {name=p1 lab=clk}
C {devices/lab_pin.sym} 420 -270 0 0 {name=p2 lab=reset}
C {devices/gnd.sym} 730 -190 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 480 -390 1 0 {name=p3 lab=b0}
C {devices/lab_pin.sym} 500 -390 1 0 {name=p4 lab=b1}
C {devices/lab_pin.sym} 520 -390 1 0 {name=p5 lab=b2}
C {devices/lab_pin.sym} 540 -390 1 0 {name=p6 lab=b3}
C {devices/lab_pin.sym} 560 -390 1 0 {name=p7 lab=b4}
C {devices/lab_pin.sym} 580 -390 1 0 {name=p8 lab=b5}
C {devices/lab_pin.sym} 600 -390 1 0 {name=p9 lab=b6}
C {devices/lab_pin.sym} 620 -390 1 0 {name=p10 lab=b7}
C {devices/res.sym} 730 -240 0 0 {name=R1
value=100Meg
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 100 -580 0 0 {name=R2
value=100Meg
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 100 -630 1 0 {name=p11 lab=b0}
C {devices/gnd.sym} 100 -530 0 0 {name=l3 lab=GND}
C {devices/res.sym} 220 -580 0 0 {name=R3
value=100Meg
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 220 -630 1 0 {name=p12 lab=b1}
C {devices/gnd.sym} 220 -530 0 0 {name=l4 lab=GND}
C {devices/res.sym} 330 -580 0 0 {name=R4
value=100Meg
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 330 -630 1 0 {name=p13 lab=b2}
C {devices/gnd.sym} 330 -530 0 0 {name=l5 lab=GND}
C {devices/res.sym} 450 -580 0 0 {name=R5
value=100Meg
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 450 -630 1 0 {name=p14 lab=b3}
C {devices/gnd.sym} 450 -530 0 0 {name=l6 lab=GND}
C {devices/res.sym} 570 -580 0 0 {name=R6
value=100Meg
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 570 -630 1 0 {name=p15 lab=b4}
C {devices/gnd.sym} 570 -530 0 0 {name=l7 lab=GND}
C {devices/res.sym} 690 -580 0 0 {name=R7
value=100Meg
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 690 -630 1 0 {name=p16 lab=b5}
C {devices/gnd.sym} 690 -530 0 0 {name=l8 lab=GND}
C {devices/res.sym} 810 -580 0 0 {name=R8
value=100Meg
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 810 -630 1 0 {name=p17 lab=b6}
C {devices/gnd.sym} 810 -530 0 0 {name=l9 lab=GND}
C {devices/res.sym} 940 -580 0 0 {name=R9
value=100Meg
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 940 -630 1 0 {name=p18 lab=b7}
C {devices/gnd.sym} 940 -530 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} 730 -290 1 0 {name=p19 lab=comp}
C {devices/vsource.sym} 850 -245 0 0 {name=Vcomp value="dc 0 pwl 0 0 5.4u 0 5.401u 3.3 7.5u 3.3 7.5001u 0" savecurrent=false}
C {devices/gnd.sym} 850 -200 0 0 {name=l11 lab=GND}
