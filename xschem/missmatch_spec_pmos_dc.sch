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



x1=-0.01

y2=0.00038
y1=-5.5e-20
sim_type=dc
sweep=v(in)

color=4
node=i(id)
x2=0.19}
B 2 40 -1220 600 -890 {flags=graph


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



x1=-0.01

y2=940
y1=0
sim_type=dc
sweep=v(in)

color=4
node="\\"Rdson; v-sweep i(id) /\\""
x2=0.19}
N 640 -360 720 -360 {
lab=VGS}
N 760 -360 800 -360 {
lab=GND}
N 760 -330 760 -270 {
lab=#net1}
N 900 -450 900 -340 {
lab=GND}
N 860 -450 900 -450 {
lab=GND}
N 760 -450 800 -450 {
lab=GND}
N 760 -450 760 -390 {
lab=GND}
N 800 -450 860 -450 {
lab=GND}
N 640 -380 640 -360 {
lab=VGS}
N 640 -450 640 -440 {
lab=GND}
N 640 -450 760 -450 {
lab=GND}
N 960 -450 960 -440 {
lab=GND}
N 900 -450 960 -450 {
lab=GND}
N 900 -280 900 -260 {
lab=#net1}
N 760 -260 900 -260 {
lab=#net1}
N 760 -270 760 -260 {
lab=#net1}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Marco Lauffer"}
C {sky130_fd_pr/corner.sym} 50 -210 0 0 {name=CORNER only_toplevel=true corner=tt_mm}
C {devices/launcher.sym} 370 -120 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/missmatch_spec_pmos_dc.raw dc"
}
C {devices/launcher.sym} 370 -160 0 0 {name=h15
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/vsource.sym} 640 -410 0 0 {name=VVGS value='VGS'
spice_ignore=false}
C {devices/vsource.sym} 900 -310 0 0 {name=Vds value=0
spice_ignore=false}
C {devices/lab_pin.sym} 800 -360 0 1 {name=p1 lab=GND}
C {devices/code_shown.sym} 630 -1020 0 0 {name=s1 only_toplevel=false value="

** vary VDCC **
*.param VGSGAUSS = agauss(1.8, 0.05, 1)
*.param VGS = 'VGSGAUSS'

** Vgs is Vref to vcom
.param VGS= 2

** vary temperature **
.param TEMPGAUSS = agauss(40, 30, 1)
.option temp = 'TEMPGAUSS'

.control
let loops = 100                 ; number of loops, vector in plot 'const'
let index = 0                     ; loop index in plot 'const'

op
repeat $&loops                    ; loop start
  save all
  dc Vds 0 0.2 1m                   ; run the dc simulation
  let id = -Vds#branch
  let index = index + 1           ; raise the index
  write missmatch_spec_pmos_dc.raw
  set appendwrite
  reset
end                               ; loop end
.endc                             ; end of control section
"}
C {devices/lab_pin.sym} 640 -360 0 0 {name=p2 lab=VGS}
C {devices/gnd.sym} 960 -440 0 0 {name=l3 lab=GND}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 740 -360 0 0 {name=M1
L=0.5
W=80
nf=5
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
