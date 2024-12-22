v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 20 -730 820 -470 {flags=graph

y2=3.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1


divx=5

xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=m
logx=0
logy=0
sim_type=tran
rawfile=$netlist_dir/missmatch_test.raw
color=4
node=g_stim
x1=06e-05
x2=1m5835
y1=0
subdivx=2}
B 2 20 -1000 820 -740 {flags=graph


ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1


divx=5

xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=m
logx=0
logy=0
sim_type=tran
rawfile=$netlist_dir/missmatch_test.raw





subdivx=2
color="4 5"
node="d2
d1"



y1=0
y2=3.3
x1=0.2m
x2=0.45m}
T {Ctrl-Click to annotate operating point data.
For this to work open this schematic as the
top most schematic (so you have not 
descended into it) and run ngspice simulation.} 30 -420 0 0 0.3 0.3 {layer=15}
N 990 -140 990 -125 {
lab=GND}
N 990 -220 990 -200 {
lab=VDD}
N 990 -250 990 -220 {
lab=VDD}
N 810 -180 810 -130 {
lab=GND}
N 610 -180 610 -130 {
lab=GND}
N 610 -290 610 -240 {
lab=D1}
N 810 -280 810 -240 {
lab=D2}
N 810 -380 810 -340 {
lab=VDD}
N 720 -380 810 -380 {
lab=VDD}
N 720 -420 720 -380 {
lab=VDD}
N 610 -380 610 -350 {
lab=VDD}
N 610 -380 720 -380 {
lab=VDD}
N 850 -210 870 -210 {
lab=G_STIM}
N 550 -210 570 -210 {
lab=G_STIM}
N 610 -210 640 -210 {
lab=GND}
N 770 -210 810 -210 {
lab=GND}
N 1090 -240 1090 -200 {
lab=G_STIM}
N 1090 -140 1090 -120 {
lab=GND}
N 580 -270 610 -270 {
lab=D1}
N 780 -270 810 -270 {
lab=D2}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Marco Lauffer"}
C {sky130_fd_pr/corner.sym} 60 -220 0 0 {name=CORNER only_toplevel=true corner=tt_mm}
C {devices/vsource.sym} 1090 -170 0 0 {name=V1 value="pwl
+0 0
+1e-3 3.3"
spice_ignore=false}
C {devices/vsource.sym} 990 -170 0 0 {name=V2 value=3.3 savecurrent=false}
C {devices/gnd.sym} 990 -125 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 610 -130 0 0 {name=l4 lab=GND}
C {devices/gnd.sym} 810 -130 0 0 {name=l5 lab=GND}
C {devices/res.sym} 610 -320 0 0 {name=R1
value=100k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 810 -310 0 0 {name=R2
value=100k
footprint=1206
device=resistor
m=1}
C {devices/launcher.sym} 130 -280 0 0 {name=h15
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/launcher.sym} 130 -320 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/missmatch_test.raw tran"
}
C {devices/code_shown.sym} 830 -970 0 0 {name=s1 only_toplevel=false value="


.option chgtol=4e-16

*.param TEMPGAUSS = agauss(30, 40, 1)
*.option temp = 'TEMPGAUSS'
*.param DELTA = 0.002

.control
   setseed 3
   reset
   let run = 1
   save all
   op
   write missmatch_test.raw
   reset
   set appendwrite
   dowhile run < 20
      save all
      tran 10u 1m uic

      write missmatch_test.raw
      let run = run + 1
      reset
   end
.endc
"}
C {devices/lab_pin.sym} 720 -420 0 0 {name=p29 lab=VDD}
C {devices/lab_pin.sym} 990 -250 0 0 {name=p1 lab=VDD}
C {devices/lab_pin.sym} 1090 -240 0 0 {name=p2 lab=G_STIM}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 590 -210 0 0 {name=M3
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
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 830 -210 0 1 {name=M1
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
C {devices/lab_pin.sym} 640 -210 0 1 {name=p5 lab=GND}
C {devices/lab_pin.sym} 770 -210 0 0 {name=p6 lab=GND}
C {devices/gnd.sym} 1090 -125 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 580 -270 0 0 {name=p7 lab=D1}
C {devices/lab_pin.sym} 780 -270 0 0 {name=p8 lab=D2}
C {devices/lab_pin.sym} 550 -210 0 0 {name=p9 lab=G_STIM}
C {devices/lab_pin.sym} 870 -210 0 1 {name=p3 lab=G_STIM}
