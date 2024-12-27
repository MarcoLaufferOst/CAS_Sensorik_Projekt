v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 30 -1075 830 -875 {flags=graph
y1=0.00012
y2=2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0.6
x2=1.2
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
color=4
node=vout
rainbow=1}
B 2 30 -870 830 -670 {flags=graph
y1=9.6e-08
y2=3.2e-05
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0.6
x2=1.2
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
rainbow=1}
N 595 -135 595 -115 {
lab=GND}
N 595 -235 595 -195 {
lab=Vref}
N 695 -135 695 -115 {
lab=GND}
N 695 -235 695 -195 {
lab=Vcontrol}
N 465 -575 465 -545 {
lab=Vref}
N 465 -425 465 -405 {
lab=#net1}
N 355 -485 405 -485 {
lab=Vcontrol}
N 465 -345 465 -325 {
lab=GND}
N 525 -485 660 -485 {
lab=Vout}
N 660 -485 660 -460 {
lab=Vout}
N 658.75 -375 661.25 -375 {
lab=GND}
N 660 -400 660 -375 {
lab=GND}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Marco Lauffer"}
C {sky130_fd_pr/corner.sym} 50 -210 0 0 {name=CORNER only_toplevel=true corner=tt_mm}
C {devices/launcher.sym} 235 -120 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_dac_switch_dc_transfer.raw dc"
}
C {devices/vsource.sym} 595 -165 0 0 {name=V1 value=2
spice_ignore=false}
C {devices/gnd.sym} 595 -115 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 595 -235 0 0 {name=p7 lab=Vref}
C {devices/launcher.sym} 235 -160 0 0 {name=h15
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {dac_switch.sym} 465 -485 0 0 {name=x1}
C {devices/vsource.sym} 695 -165 0 0 {name=Vin value=0
spice_ignore=false}
C {devices/gnd.sym} 695 -115 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 695 -235 0 0 {name=p1 lab=Vcontrol}
C {devices/gnd.sym} 465 -325 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 465 -575 0 0 {name=p2 lab=Vref}
C {devices/lab_pin.sym} 355 -485 0 0 {name=p3 lab=Vcontrol}
C {devices/code_shown.sym} 835 -1155 0 0 {name=s1 only_toplevel=false value="

.option chgtol=4e-16
** vary Temp **
.param TEMPGAUSS = agauss(30, 10, 1)
.option temp = 'TEMPGAUSS'

*.param DELTA = 0.002

.control
   setseed 3
   let loops = 100

   let i_sw = vector(loops)
   let index = 0
   reset
   op
   write tb_dac_switch_dc_transfer.raw
   set appendwrite
   
   repeat $&loops  
     save all
     dc Vin 0.6 1.2 0.01
    
     let index = index + 1
     write tb_dac_switch_dc_transfer.raw
     reset
   end     
.endc

"}
C {devices/ammeter.sym} 465 -375 0 0 {name=Vmeas savecurrent=true}
C {devices/lab_pin.sym} 660 -485 0 1 {name=p4 lab=Vout}
C {devices/res.sym} 660 -430 0 0 {name=R1
value=100k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 660 -375 0 0 {name=l5 lab=GND}
