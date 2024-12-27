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
x1=0
x2=1.28e-06
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



x1=0
x2=1.28e-06
color=4
node="Code;v_b7,v_b6,v_b5,v_b4,v_b3,v_b2,v_b1,v_b0"}
N 1107.5 -132.5 1107.5 -112.5 {
lab=GND}
N 1107.5 -232.5 1107.5 -192.5 {
lab=Vref}
N 737.5 -337.5 777.5 -337.5 {
lab=GND}
N 777.5 -337.5 777.5 -317.5 {
lab=GND}
N 737.5 -377.5 757.5 -377.5 {
lab=Vref}
N 737.5 -477.5 777.5 -477.5 {
lab=dac_out}
N 397.5 -477.5 437.5 -477.5 {
lab=v_b0}
N 397.5 -457.5 437.5 -457.5 {
lab=v_b1}
N 397.5 -437.5 437.5 -437.5 {
lab=v_b2}
N 397.5 -417.5 437.5 -417.5 {
lab=v_b3}
N 397.5 -397.5 437.5 -397.5 {
lab=v_b4}
N 397.5 -377.5 437.5 -377.5 {
lab=v_b5}
N 397.5 -357.5 437.5 -357.5 {
lab=v_b6}
N 397.5 -337.5 437.5 -337.5 {
lab=v_b7}
N 857.5 -377.5 857.5 -357.5 {
lab=GND}
N 857.5 -477.5 857.5 -437.5 {
lab=dac_out}
N 777.5 -477.5 857.5 -477.5 {
lab=dac_out}
C {devices/title.sym} 160 -32.5 0 0 {name=l1 author="Marco Lauffer"}
C {sky130_fd_pr/corner.sym} 52.5 -217.5 0 0 {name=CORNER only_toplevel=true corner=tt}
C {devices/launcher.sym} 237.5 -127.5 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_dac_preformance.raw tran"
}
C {devices/vsource.sym} 1107.5 -162.5 0 0 {name=V1 value=2
spice_ignore=false}
C {devices/gnd.sym} 1107.5 -112.5 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 1107.5 -232.5 0 0 {name=p7 lab=Vref}
C {devices/launcher.sym} 237.5 -167.5 0 0 {name=h15
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {r2r_dac.sym} 587.5 -407.5 0 0 {name=x1}
C {devices/gnd.sym} 777.5 -317.5 0 0 {name=l4 lab=GND}
C {devices/lab_wire.sym} 757.5 -377.5 0 1 {name=p5 sig_type=std_logic lab=Vref}
C {devices/gnd.sym} 857.5 -357.5 0 0 {name=l2 lab=GND}
C {devices/res.sym} 857.5 -407.5 0 0 {name=R1
value=1Meg
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 397.5 -477.5 0 0 {name=p1 lab=v_b0}
C {devices/lab_pin.sym} 397.5 -457.5 0 0 {name=p3 lab=v_b1}
C {devices/lab_pin.sym} 397.5 -437.5 0 0 {name=p4 lab=v_b2}
C {devices/lab_pin.sym} 397.5 -417.5 0 0 {name=p6 lab=v_b3}
C {devices/lab_pin.sym} 397.5 -397.5 0 0 {name=p8 lab=v_b4}
C {devices/lab_pin.sym} 397.5 -377.5 0 0 {name=p9 lab=v_b5}
C {devices/lab_pin.sym} 397.5 -357.5 0 0 {name=p10 lab=v_b6}
C {devices/lab_pin.sym} 397.5 -337.5 0 0 {name=p11 lab=v_b7}
C {devices/lab_pin.sym} 857.5 -477.5 0 1 {name=p12 lab=dac_out}
C {devices/code.sym} 400 -210 0 0 {name=s1 only_toplevel=false value="
.include \\"stimuli_tb_dac_codes.cir\\"
.param v_hi = 1.8

.control

let index = 0
let loops = 8

repeat 2
save v(dac_out)
tran 1n 1280n
write tb_dac_performance.raw
plot v(dac_out)
reset
end


*let x_ax = vector(loops)
*let v_high = vector(loops)
*let v_low = vector(loops)
   
*repeat $&loops 
*end


.endc
"}
