v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 495 -135 495 -115 {
lab=GND}
N 495 -235 495 -195 {
lab=Vref}
N 595 -135 595 -115 {
lab=GND}
N 595 -235 595 -195 {
lab=Vcontrol}
N 325 -495 325 -465 {
lab=Vref}
N 325 -345 325 -325 {
lab=GND}
N 215 -405 265 -405 {
lab=Vcontrol}
N 325 -835 325 -805 {
lab=Vref}
N 325 -685 325 -665 {
lab=GND}
N 215 -745 265 -745 {
lab=Vcontrol}
N 465 -635 465 -615 {
lab=GND}
N 385 -745 465 -745 {
lab=DrvH}
N 465 -745 465 -695 {
lab=DrvH}
N 385 -405 465 -405 {
lab=DrvL}
N 465 -515 465 -485 {
lab=Vref}
N 465 -425 465 -405 {
lab=DrvL}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Marco Lauffer"}
C {sky130_fd_pr/corner.sym} 50 -210 0 0 {name=CORNER only_toplevel=true corner=tt_mm}
C {devices/launcher.sym} 270 -120 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_dac_switch_dc_switching.raw op"
}
C {devices/vsource.sym} 495 -165 0 0 {name=V1 value=2
spice_ignore=false}
C {devices/gnd.sym} 495 -115 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 495 -235 0 0 {name=p7 lab=Vref}
C {devices/launcher.sym} 270 -160 0 0 {name=h15
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {dac_switch.sym} 325 -405 0 0 {name=x1}
C {devices/vsource.sym} 595 -165 0 0 {name=V2 value=Vctrl
spice_ignore=false}
C {devices/gnd.sym} 595 -115 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 595 -235 0 0 {name=p1 lab=Vcontrol}
C {devices/gnd.sym} 325 -325 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 325 -495 0 0 {name=p2 lab=Vref}
C {devices/lab_pin.sym} 215 -405 0 0 {name=p3 lab=Vcontrol}
C {dac_switch.sym} 325 -745 0 0 {name=x2}
C {devices/gnd.sym} 325 -665 0 0 {name=l5 lab=GND}
C {devices/lab_pin.sym} 325 -835 0 0 {name=p4 lab=Vref}
C {devices/lab_pin.sym} 215 -745 0 0 {name=p5 lab=Vcontrol}
C {devices/res.sym} 465 -665 0 0 {name=R1
value=40k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 465 -615 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} 465 -745 0 1 {name=p6 lab=DrvH}
C {devices/res.sym} 465 -455 0 0 {name=R2
value=40k
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 465 -405 0 1 {name=p8 lab=DrvL}
C {devices/lab_pin.sym} 465 -515 0 0 {name=p9 lab=Vref}
C {devices/code_shown.sym} 720 -1045 0 0 {name=s1 only_toplevel=false value="

.option chgtol=4e-16
** vary Temp **
.param TEMPGAUSS = agauss(30, 40, 1)
.option temp = 'TEMPGAUSS'

** vary VCC **
.param VctrlGAUSS = agauss(1.8, 0.05, 1)
.param Vctrl = 'VctrlGAUSS'
*.param Vctrl = 1.8

*.param DELTA = 0.002

.control
   setseed 3
   set wr_vecnames
   let loops = 100
   let index = 0
   let index2 = 0
   let x_ax = vector(loops)
   let v_high = vector(loops)
   let v_low = vector(loops)
   reset
   
   repeat $&loops 
     save all
     op 
     let v_low[index] = V(DrvL)
     
     write tb_dac_switch_dc_switching.raw
     set appendwrite
     reset
     x_ax[index] = index
     let index = index + 1
     
   end

   repeat $&loops
      alterparam Vctrl = 0
      reset
      save all
      op 
      let v_high[index2] = V(DrvH)
      write tb_dac_switch_dc_switching.raw
      let index2 = index2 + 1
   end
   
   plot v_high vs x_ax
   plot v_low vs x_ax
   wrdata tb_dac_switch_dc_switching_tbl.txt v_high v_low vs x_ax
.endc

"}
