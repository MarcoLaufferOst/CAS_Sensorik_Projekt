v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 50 -850 610 -520 {flags=graph
y1=10000
y2=11000
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1

x2=1
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
rainbow=1
sim_type=sp






color="4 7"
node="\\"Resistor 1;in  i(vmeas) /\\"
\\"Resistor 2;in  i(vmeas1) /\\""

x1=1
rawfile=$netlist_dir/missmatch_res_spec.raw
sweep=const.x_ax}
N 750 -140 750 -120 {
lab=GND}
N 890 -240 890 -200 {
lab=IN}
N 890 -140 890 -120 {
lab=GND}
N 550 -140 550 -120 {
lab=GND}
N 520 -170 530 -170 {
lab=GND}
N 720 -170 730 -170 {
lab=GND}
N 890 -270 890 -240 {
lab=IN}
N 750 -270 890 -270 {
lab=IN}
N 750 -270 750 -260 {
lab=IN}
N 550 -270 550 -260 {
lab=IN}
N 550 -270 750 -270 {
lab=IN}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Marco Lauffer"}
C {sky130_fd_pr/corner.sym} 60 -240 0 0 {name=CORNER only_toplevel=true corner=tt_mm}
C {devices/code_shown.sym} 620 -1080 0 0 {name=s1 only_toplevel=false value="


.option chgtol=4e-16
.options savecurrents
*.param TEMPGAUSS = agauss(30, 40, 1)
*.option temp = 'TEMPGAUSS'
*.param DELTA = 0.002


.control
   setseed 3
   set wr_vecnames

   reset
   let loops = 100

   let res1 = vector(loops)
   let res2 = vector(loops)
   let x_ax = vector(loops)
   let index = 0
   save all
   op
   setscale x_ax
   write missmatch_res_spec.raw
   reset
   set appendwrite

   repeat $&loops
      save all
      op
      let res1[index] = v(in)/i(vmeas)
      let res2[index] = v(in)/i(vmeas1)
      let x_ax[index] = index + 1
      
      wrdata missmatch_res_spec_tbl.txt res1 res2 vs x_ax
      
      write missmatch_res_spec.raw
      set appendwrite

      reset
      let index = index + 1
      
   end
.endc
"}
C {devices/vsource.sym} 890 -170 0 0 {name=V1 value=1
spice_ignore=false}
C {devices/gnd.sym} 750 -120 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 890 -120 0 0 {name=l3 lab=GND}
C {devices/launcher.sym} 270 -140 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/missmatch_res_spec.raw op"
}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 750 -170 0 0 {name=R2
W=0.69
L=3.5
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 550 -170 0 0 {name=R1
W=0.69
L=3.5
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/gnd.sym} 550 -120 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 520 -170 0 0 {name=p1 lab=GND}
C {devices/lab_pin.sym} 720 -170 0 0 {name=p2 lab=GND}
C {devices/launcher.sym} 270 -190 0 0 {name=h15
descr="Annotate OP" 
tclcommand="xschem raw_read $netlist_dir/missmatch_res_spec.raw OP"
}
C {devices/ammeter.sym} 550 -230 0 0 {name=Vmeas savecurrent=true}
C {devices/ammeter.sym} 750 -230 0 0 {name=Vmeas1 savecurrent=true}
C {devices/lab_pin.sym} 890 -270 0 1 {name=p3 lab=IN}
