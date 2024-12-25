v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 40 -880 600 -550 {flags=graph


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



x1=-5e-05
x2=0.00095
y2=0.0008
y1=-0.0012
sim_type=tran
sweep=v(in)}
N 550 -140 550 -120 {
lab=GND}
N 550 -240 550 -200 {
lab=LAB}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Stefan Schippers"}
C {sky130_fd_pr/corner.sym} 50 -210 0 0 {name=CORNER only_toplevel=true corner=tt}
C {devices/launcher.sym} 370 -120 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/RAW_FILE_NAME.raw tran"
}
C {devices/code.sym} 180 -210 0 0 {name=s1 only_toplevel=false value="

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
   write RAW_FILE_NAME.raw
   reset
   set appendwrite
   dowhile run < 5
      save all
      tran 10u 1m uic
      write RAW_FILE_NAME.raw
      let run = run + 1
      reset
   end
.endc
"}
C {devices/vsource.sym} 550 -170 0 0 {name=V1 value="pwl
+0 0
+1m 3.3"
spice_ignore=false}
C {devices/gnd.sym} 550 -120 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 550 -240 0 0 {name=p7 lab=LAB}
C {devices/launcher.sym} 370 -160 0 0 {name=h15
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/ammeter.sym} 680 -150 2 0 {name=Vmeas savecurrent=true}
