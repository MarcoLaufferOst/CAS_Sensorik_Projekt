v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -100 30 0 30 {
lab=#net1}
N -100 90 -100 110 {
lab=GND}
N 70 90 70 110 {
lab=GND}
N 70 -80 70 -50 {
lab=VDD}
N 150 -0 200 0 {
lab=vout}
N 200 0 200 20 {
lab=vout}
N 200 90 200 110 {
lab=GND}
N -170 -0 -170 30 {
lab=vinn}
N -170 -0 -0 0 {
lab=vinn}
N -170 -20 0 -20 {
lab=vinp}
N -170 90 -170 110 {
lab=GND}
N 70 50 70 90 {
lab=GND}
N 200 80 200 90 {
lab=GND}
N -290 -20 -290 30 {
lab=VDD}
N -290 90 -290 110 {
lab=GND}
N -320 -20 -290 -20 {
lab=VDD}
C {devices/isource.sym} -100 60 0 0 {name=I0 value=250u}
C {devices/gnd.sym} -100 110 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 70 110 0 0 {name=l2 lab=GND}
C {devices/vdd.sym} 70 -80 0 0 {name=l3 lab=VDD}
C {devices/capa.sym} 200 50 0 0 {name=C1
m=1
value=100f
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 200 110 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} -170 60 0 0 {name=V1 value=1 savecurrent=false}
C {devices/gnd.sym} -170 110 0 0 {name=l5 lab=GND}
C {devices/code.sym} 350 -40 0 0 {name=s1 only_toplevel=false value="

.lib /home/ttuser/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt_mm

*.option temp=27

vinsource vinp 0 pwl(0 0.9 1e-3 1.1 2e-3 0.9)

.control
  option seed=9
  let run=0
  let run_max=100
  let voff_new=vector(run_max+1)
  dowhile run <= run_max
    tran 0.1us 2ms
    let vdiff=v(vinp)-1
    meas tran voff_rise find vdiff when v(vout)=10e-3 rise=1
    meas tran voff_fall find vdiff when v(vout)=3.29 fall=1
    let voff_new[run]=(voff_rise+voff_fall)/2
    print voff_new
    print run
    save voff_new
    write voff_new.out voff_new
    *set appendwrite
    *write tran.out v(vout)
    reset
    let run=run+1
  end
  *plot tran1.v(vout) tran2.v(vout) tran3.v(vout) tran4.v(vout) tran5.v(vout) 
  *+ tran6.v(vout) tran7.v(vout) tran8.v(vout) tran9.v(vout) tran10.v(vout)
  *+ tran11.v(vout) tran12.v(vout) tran13.v(vout) tran14.v(vout) tran15.v(vout) 
  *+ tran16.v(vout) tran17.v(vout) tran18.v(vout) tran19.v(vout) tran20.v(vout)
  *+ tran21.v(vout) tran22.v(vout) tran23.v(vout) tran24.v(vout) tran25.v(vout) 
  *+ tran26.v(vout) tran27.v(vout) tran28.v(vout) tran29.v(vout) tran30.v(vout)
  *+ tran31.v(vout) tran32.v(vout) tran33.v(vout) tran34.v(vout) tran35.v(vout) 
  *+ tran36.v(vout) tran37.v(vout) tran38.v(vout) tran39.v(vout) tran40.v(vout)
  *+ tran41.v(vout) tran42.v(vout) tran43.v(vout) tran44.v(vout) tran45.v(vout) 
  *+ tran46.v(vout) tran47.v(vout) tran48.v(vout) tran49.v(vout) tran50.v(vout)
  *+ v(vinp) v(vinn)
.endc

"}
C {devices/vsource.sym} -290 60 0 0 {name=V3 value=3.3 savecurrent=false}
C {devices/gnd.sym} -290 110 0 0 {name=l7 lab=GND}
C {devices/lab_wire.sym} -290 -20 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 190 0 0 0 {name=p1 sig_type=std_logic lab=vout}
C {devices/lab_wire.sym} -90 -20 0 0 {name=p3 sig_type=std_logic lab=vinp}
C {devices/lab_wire.sym} -90 0 0 0 {name=p4 sig_type=std_logic lab=vinn
}
C {comparator.sym} 150 0 0 0 {name=x1}
