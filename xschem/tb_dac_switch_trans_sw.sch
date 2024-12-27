v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 30 -1075 830 -875 {flags=graph
y1=-0.028
y2=2.1
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=2.1e-08
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node=vcontrol
color=4
dataset=-1
unitx=1
logx=0
logy=0
}
B 2 30 -870 830 -670 {flags=graph
y1=-1.2e-05
y2=0.00024
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=2.1e-08
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node=i(vmeas)
color=4
dataset=-1
unitx=1
logx=0
logy=0
}
B 2 30 -1280 830 -1080 {flags=graph
y1=-0.028
y2=2.1
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=2.1e-08
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
color=5
node=drvout}
N 595 -135 595 -115 {
lab=GND}
N 595 -235 595 -195 {
lab=Vref}
N 695 -135 695 -115 {
lab=GND}
N 695 -235 695 -195 {
lab=Vcontrol}
N 235 -575 235 -545 {
lab=Vref}
N 235 -425 235 -405 {
lab=#net1}
N 125 -485 175 -485 {
lab=Vcontrol}
N 295 -485 375 -485 {
lab=DrvOut}
N 385 -595 385 -565 {
lab=#net2}
N 385 -505 385 -485 {
lab=DrvOut}
N 375 -485 385 -485 {
lab=DrvOut}
N 385 -612.5 385 -595 {
lab=#net2}
N 385 -615 385 -612.5 {
lab=#net2}
N 385 -615 415 -615 {
lab=#net2}
N 475 -615 540 -615 {
lab=#net3}
N 540 -615 540 -575 {
lab=#net3}
N 540 -515 540 -480 {
lab=Vb2}
N 500 -135 500 -115 {
lab=GND}
N 500 -235 500 -195 {
lab=Vb2}
N 235 -345 235 -325 {
lab=GND}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Marco Lauffer"}
C {sky130_fd_pr/corner.sym} 50 -210 0 0 {name=CORNER only_toplevel=true corner=sf_mm}
C {devices/launcher.sym} 235 -120 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_dac_switch_trans_sw.raw tran"
}
C {devices/vsource.sym} 595 -165 0 0 {name=V1 value=2
spice_ignore=false}
C {devices/gnd.sym} 595 -115 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 595 -235 0 0 {name=p7 lab=Vref}
C {devices/launcher.sym} 235 -160 0 0 {name=h15
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {dac_switch.sym} 235 -485 0 0 {name=x1}
C {devices/vsource.sym} 695 -165 0 0 {name=V2 value="pulse 0 VCC 5n Tprop Tprop 10n 20n"
spice_ignore=false}
C {devices/gnd.sym} 695 -115 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 695 -235 0 0 {name=p1 lab=Vcontrol}
C {devices/gnd.sym} 235 -325 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 235 -575 0 0 {name=p2 lab=Vref}
C {devices/lab_pin.sym} 125 -485 0 0 {name=p3 lab=Vcontrol}
C {devices/res.sym} 385 -535 0 0 {name=R2
value=40k
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 385 -485 0 1 {name=p8 lab=DrvOut}
C {devices/code_shown.sym} 835 -1155 0 0 {name=s1 only_toplevel=false value="

.option chgtol=4e-16
** vary Temp **
.param TEMPGAUSS = agauss(30, 40, 1)
.option temp = 'TEMPGAUSS'

** vary VCC **
.param VCCGAUSS = agauss(1.8, 0.05, 1)
.param VCC = 'VCCGAUSS'
*.param VCC = 1.8

.param Tprop = 1n

*.param DELTA = 0.002

.control
   setseed 3
   let loops = 10

   let i_sw = vector(loops)
   let index = 0
   reset
   op
   write tb_dac_switch_trans_sw.raw
   set appendwrite
   
   repeat $&loops  
     save all
     tran 10p 21n
     let i_sw[index] = vecmax(i(Vmeas))
     let index = index + 1
     write tb_dac_switch_trans_sw.raw
     reset
   end

   print i_sw
     
.endc

"}
C {devices/res.sym} 445 -615 1 0 {name=R1
value=20k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 540 -545 2 0 {name=R3
value=40k
footprint=1206
device=resistor
m=1}
C {devices/vsource.sym} 500 -165 0 0 {name=V3 value=2
spice_ignore=false}
C {devices/gnd.sym} 500 -115 0 0 {name=l5 lab=GND}
C {devices/lab_pin.sym} 500 -235 0 0 {name=p4 lab=Vb2}
C {devices/lab_pin.sym} 540 -480 0 1 {name=p5 lab=Vb2}
C {devices/ammeter.sym} 235 -375 0 0 {name=Vmeas savecurrent=true}
