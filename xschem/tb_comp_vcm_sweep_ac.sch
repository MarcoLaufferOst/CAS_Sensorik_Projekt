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
N -170 -0 -0 0 {
lab=vinn}
N -230 -20 0 -20 {
lab=vinp}
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
N -170 0 -170 40 {
lab=vinn}
N -230 40 -170 40 {
lab=vinn}
N -230 100 -230 110 {
lab=GND}
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
C {devices/code.sym} 370 -20 0 0 {name=s1 only_toplevel=false value="

.lib /home/ttuser/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt

.option temp=27

.control
  let cm_start=0
  let cm_stop=2
  let cm_delta=0.1
  let cm_act=cm_start
  let nbr_loops=cm_stop/cm_delta+1
  repeat 21
    alter Vcm $&cm_act
    print cm_act
    ac dec 100 0.1 100MEG
    meas ac AOL max vdb(vout)
    *plot vdb(vout)
    let cm_act=cm_act+cm_delta
  end
  plot vdb(vout)
.endc

"}
C {devices/vsource.sym} -290 60 0 0 {name=V3 value=3.3 savecurrent=false}
C {devices/gnd.sym} -290 110 0 0 {name=l7 lab=GND}
C {devices/lab_wire.sym} -290 -20 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 190 0 0 0 {name=p1 sig_type=std_logic lab=vout}
C {devices/lab_wire.sym} -90 -20 0 0 {name=p3 sig_type=std_logic lab=vinp}
C {devices/lab_wire.sym} -90 0 0 0 {name=p4 sig_type=std_logic lab=vinn}
C {devices/vsource.sym} -230 10 0 0 {name=V1 value=AC 1 savecurrent=false}
C {devices/vsource.sym} -230 70 0 0 {name=Vcm value=1 savecurrent=false}
C {devices/gnd.sym} -230 110 0 0 {name=l5 lab=GND}
C {comparator.sym} 150 0 0 0 {name=x2}
