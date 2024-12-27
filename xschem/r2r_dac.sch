v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 460 -890 480 -890 {
lab=V_COM}
N 720 -890 740 -890 {
lab=V_out}
N 380 -680 380 -660 {
lab=V_COM}
N 290 -740 320 -740 {
lab=D0}
N 380 -500 380 -480 {
lab=V_COM}
N 290 -560 320 -560 {
lab=D1}
N 380 -320 380 -300 {
lab=V_COM}
N 290 -380 320 -380 {
lab=D2}
N 380 -150 380 -130 {
lab=V_COM}
N 290 -210 320 -210 {
lab=D3}
N 840 -680 840 -660 {
lab=V_COM}
N 900 -740 930 -740 {
lab=D7}
N 840 -500 840 -480 {
lab=V_COM}
N 900 -560 930 -560 {
lab=D6}
N 840 -320 840 -300 {
lab=V_COM}
N 900 -380 930 -380 {
lab=D5}
N 840 -150 840 -130 {
lab=V_COM}
N 900 -210 930 -210 {
lab=D4}
N 520 -840 520 -740 {
lab=#net1}
N 440 -740 520 -740 {
lab=#net1}
N 540 -840 540 -560 {
lab=#net2}
N 440 -560 540 -560 {
lab=#net2}
N 560 -840 560 -380 {
lab=#net3}
N 440 -380 560 -380 {
lab=#net3}
N 440 -210 580 -210 {
lab=#net4}
N 580 -840 580 -210 {
lab=#net4}
N 620 -840 620 -210 {
lab=#net5}
N 620 -210 780 -210 {
lab=#net5}
N 640 -380 780 -380 {
lab=#net6}
N 640 -840 640 -380 {
lab=#net6}
N 660 -560 780 -560 {
lab=#net7}
N 660 -840 660 -560 {
lab=#net7}
N 680 -840 680 -740 {
lab=#net8}
N 680 -740 780 -740 {
lab=#net8}
C {devices/title.sym} 160 -35 0 0 {name=l1 author="Marco Lauffer"}
C {R2R_20k.sym} 600 -890 0 0 {name=x1}
C {dac_switch.sym} 380 -740 0 0 {name=x2}
C {devices/ipin.sym} 290 -740 0 0 {name=p1 lab=D0}
C {devices/opin.sym} 740 -890 0 0 {name=p2 lab=V_out}
C {devices/iopin.sym} 100 -160 0 1 {name=p3 lab=V_REF}
C {devices/iopin.sym} 100 -120 0 1 {name=p4 lab=V_COM}
C {devices/lab_wire.sym} 380 -800 0 1 {name=p8 sig_type=std_logic lab=V_REF}
C {devices/lab_wire.sym} 460 -890 0 0 {name=p5 sig_type=std_logic lab=V_COM}
C {dac_switch.sym} 380 -560 0 0 {name=x3}
C {devices/ipin.sym} 290 -560 0 0 {name=p10 lab=D1}
C {devices/lab_wire.sym} 380 -620 0 1 {name=p11 sig_type=std_logic lab=V_REF}
C {dac_switch.sym} 380 -380 0 0 {name=x4}
C {devices/ipin.sym} 290 -380 0 0 {name=p13 lab=D2}
C {devices/lab_wire.sym} 380 -440 0 1 {name=p14 sig_type=std_logic lab=V_REF}
C {dac_switch.sym} 380 -210 0 0 {name=x5}
C {devices/ipin.sym} 290 -210 0 0 {name=p16 lab=D3}
C {devices/lab_wire.sym} 380 -270 0 1 {name=p17 sig_type=std_logic lab=V_REF}
C {dac_switch.sym} 840 -740 0 1 {name=x6}
C {devices/ipin.sym} 930 -740 0 1 {name=p19 lab=D7}
C {devices/lab_wire.sym} 840 -800 0 0 {name=p20 sig_type=std_logic lab=V_REF}
C {dac_switch.sym} 840 -560 0 1 {name=x7}
C {devices/ipin.sym} 930 -560 0 1 {name=p22 lab=D6}
C {devices/lab_wire.sym} 840 -620 0 0 {name=p23 sig_type=std_logic lab=V_REF}
C {dac_switch.sym} 840 -380 0 1 {name=x8}
C {devices/ipin.sym} 930 -380 0 1 {name=p25 lab=D5}
C {devices/lab_wire.sym} 840 -440 0 0 {name=p26 sig_type=std_logic lab=V_REF}
C {dac_switch.sym} 840 -210 0 1 {name=x9}
C {devices/ipin.sym} 930 -210 0 1 {name=p28 lab=D4}
C {devices/lab_wire.sym} 840 -270 0 0 {name=p29 sig_type=std_logic lab=V_REF}
C {devices/lab_wire.sym} 380 -660 0 0 {name=p6 sig_type=std_logic lab=V_COM}
C {devices/lab_wire.sym} 380 -480 0 0 {name=p7 sig_type=std_logic lab=V_COM}
C {devices/lab_wire.sym} 380 -300 0 0 {name=p9 sig_type=std_logic lab=V_COM}
C {devices/lab_wire.sym} 380 -130 0 0 {name=p12 sig_type=std_logic lab=V_COM}
C {devices/lab_wire.sym} 840 -130 0 1 {name=p15 sig_type=std_logic lab=V_COM}
C {devices/lab_wire.sym} 840 -300 0 1 {name=p18 sig_type=std_logic lab=V_COM}
C {devices/lab_wire.sym} 840 -480 0 1 {name=p27 sig_type=std_logic lab=V_COM}
C {devices/lab_wire.sym} 840 -660 0 1 {name=p24 sig_type=std_logic lab=V_COM}
