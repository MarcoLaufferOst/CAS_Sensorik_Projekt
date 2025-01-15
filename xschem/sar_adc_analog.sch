v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 890 -370 920 -370 {
lab=D0}
N 890 -350 920 -350 {
lab=D1}
N 890 -330 920 -330 {
lab=D2}
N 890 -310 920 -310 {
lab=D3}
N 890 -290 920 -290 {
lab=D4}
N 890 -270 920 -270 {
lab=D5}
N 890 -250 920 -250 {
lab=D6}
N 890 -230 920 -230 {
lab=D7}
N 500 -520 590 -520 {
lab=dac_out}
N 740 -520 920 -520 {
lab=comp_out}
N 350 -620 350 -600 {
lab=VDDA}
N 350 -480 350 -460 {
lab=VSSA}
N 570 -230 590 -230 {
lab=VSSA}
N 560 -270 590 -270 {
lab=V_REF}
N 660 -470 660 -450 {
lab=VSSA}
N 660 -590 660 -570 {
lab=VDDA}
N 260 -620 280 -620 {
lab=SH}
N 280 -620 280 -600 {
lab=SH}
N 140 -540 200 -540 {
lab=V_in}
N 150 -310 170 -310 {
lab=VSSA}
N 150 -350 170 -350 {
lab=VDDA}
N 570 -490 590 -490 {
lab=ibias}
N 530 -570 530 -540 {
lab=v_sh_out}
N 500 -370 590 -370 {
lab=dac_out}
N 480 -370 500 -370 {
lab=dac_out}
N 480 -520 480 -370 {
lab=dac_out}
N 480 -520 500 -520 {
lab=dac_out}
N 530 -540 590 -540 {
lab=v_sh_out}
N 430 -540 440 -540 {
lab=v_sh_out}
N 440 -540 530 -540 {
lab=v_sh_out}
C {devices/title.sym} 160 -35 0 0 {name=l1 author="Marco Lauffer"}
C {devices/ipin.sym} 920 -370 0 1 {name=p16 lab=D0}
C {r2r_dac.sym} 740 -300 0 1 {name=x1}
C {comparator.sym} 740 -520 0 0 {name=x2}
C {sample_hold.sym} 410 -540 0 0 {name=x3}
C {devices/opin.sym} 920 -520 0 0 {name=p1 lab=comp_out}
C {devices/ipin.sym} 920 -350 0 1 {name=p2 lab=D1}
C {devices/ipin.sym} 920 -330 0 1 {name=p3 lab=D2}
C {devices/ipin.sym} 920 -310 0 1 {name=p4 lab=D3}
C {devices/ipin.sym} 920 -290 0 1 {name=p5 lab=D4}
C {devices/ipin.sym} 920 -270 0 1 {name=p6 lab=D5}
C {devices/ipin.sym} 920 -250 0 1 {name=p7 lab=D6}
C {devices/ipin.sym} 920 -230 0 1 {name=p8 lab=D7}
C {devices/lab_wire.sym} 350 -460 3 0 {name=p10 sig_type=std_logic lab=VSSA}
C {devices/lab_wire.sym} 350 -620 3 1 {name=p11 sig_type=std_logic lab=VDDA}
C {devices/ipin.sym} 560 -270 0 0 {name=p12 lab=V_REF}
C {devices/lab_wire.sym} 570 -230 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {devices/lab_wire.sym} 660 -450 3 0 {name=p14 sig_type=std_logic lab=VSSA}
C {devices/lab_wire.sym} 660 -590 3 1 {name=p15 sig_type=std_logic lab=VDDA}
C {devices/ipin.sym} 260 -620 0 0 {name=p17 lab=SH}
C {devices/ipin.sym} 140 -540 0 0 {name=p18 lab=V_in}
C {devices/ipin.sym} 150 -350 0 0 {name=p19 lab=VDDA}
C {devices/ipin.sym} 150 -310 0 0 {name=p20 lab=VSSA}
C {devices/lab_wire.sym} 170 -310 0 1 {name=p21 sig_type=std_logic lab=VSSA}
C {devices/lab_wire.sym} 170 -350 0 1 {name=p22 sig_type=std_logic lab=VDDA}
C {devices/ipin.sym} 570 -490 0 0 {name=p9 lab=ibias}
C {devices/opin.sym} 480 -370 0 1 {name=p25 lab=dac_out}
C {devices/opin.sym} 530 -570 1 1 {name=p26 lab=v_sh_out}
