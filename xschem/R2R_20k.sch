v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 160 -320 160 -280 {
lab=B3}
N 160 -410 160 -380 {
lab=#net1}
N 380 -320 380 -280 {
lab=B4}
N 380 -410 380 -380 {
lab=#net2}
N 600 -320 600 -280 {
lab=B5}
N 600 -410 600 -380 {
lab=#net3}
N 800 -320 800 -280 {
lab=B6}
N 800 -410 800 -380 {
lab=#net4}
N 160 -650 160 -610 {
lab=COM}
N 160 -740 160 -710 {
lab=#net5}
N 380 -650 380 -610 {
lab=B0}
N 380 -740 380 -710 {
lab=#net6}
N 600 -650 600 -610 {
lab=B1}
N 600 -740 600 -710 {
lab=#net7}
N 800 -650 800 -610 {
lab=B2}
N 800 -740 800 -710 {
lab=#net8}
N 380 -830 380 -800 {
lab=#net9}
N 160 -830 380 -830 {
lab=#net9}
N 160 -830 160 -800 {
lab=#net9}
N 380 -830 460 -830 {
lab=#net9}
N 520 -830 600 -830 {
lab=#net10}
N 600 -830 600 -800 {
lab=#net10}
N 600 -830 680 -830 {
lab=#net10}
N 740 -830 800 -830 {
lab=#net11}
N 800 -830 800 -800 {
lab=#net11}
N 1040 -320 1040 -280 {
lab=B7}
N 1040 -410 1040 -380 {
lab=#net12}
N 800 -830 840 -830 {
lab=#net11}
N 120 -490 160 -490 {
lab=H}
N 160 -490 160 -470 {
lab=H}
N 160 -490 240 -490 {
lab=H}
N 300 -490 380 -490 {
lab=#net13}
N 380 -490 380 -470 {
lab=#net13}
N 380 -490 460 -490 {
lab=#net13}
N 520 -490 600 -490 {
lab=#net14}
N 600 -490 600 -470 {
lab=#net14}
N 600 -490 670 -490 {
lab=#net14}
N 730 -490 800 -490 {
lab=#net15}
N 800 -490 800 -470 {
lab=#net15}
N 800 -490 910 -490 {
lab=#net15}
N 970 -490 1040 -490 {
lab=OUT}
N 1040 -490 1040 -470 {
lab=OUT}
N 1040 -490 1070 -490 {
lab=OUT}
N 897.5 -830 922.5 -830 {
lab=H}
N 1000 -770 1020 -770 {
lab=#net16}
N 1000 -800 1000 -770 {
lab=#net16}
N 1000 -800 1040 -800 {
lab=#net16}
N 1010 -680 1040 -680 {
lab=#net17}
N 1000 -680 1010 -680 {
lab=#net17}
N 1000 -680 1000 -650 {
lab=#net17}
N 1000 -650 1020 -650 {
lab=#net17}
N 1000 -620 1040 -620 {
lab=#net17}
N 1000 -650 1000 -620 {
lab=#net17}
N 1000 -740 1040 -740 {
lab=#net16}
N 1000 -770 1000 -740 {
lab=#net16}
N 1040 -710 1040 -680 {}
N 1040 -740 1040 -710 {}
C {devices/title.sym} 160 -40 0 0 {name=l1 author="Marco Lauffer"}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 160 -440 0 0 {name=R1
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 160 -350 0 0 {name=R2
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/iopin.sym} 130 -210 2 0 {name=p1 lab=COM}
C {devices/lab_pin.sym} 140 -350 0 0 {name=p3 lab=COM}
C {devices/lab_pin.sym} 140 -440 0 0 {name=p4 lab=COM}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 380 -440 0 0 {name=R3
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 380 -350 0 0 {name=R4
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 360 -350 0 0 {name=p6 lab=COM}
C {devices/lab_pin.sym} 360 -440 0 0 {name=p7 lab=COM}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 600 -440 0 0 {name=R5
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 600 -350 0 0 {name=R6
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 580 -350 0 0 {name=p9 lab=COM}
C {devices/lab_pin.sym} 580 -440 0 0 {name=p10 lab=COM}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 800 -440 0 0 {name=R7
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 800 -350 0 0 {name=R8
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 780 -350 0 0 {name=p12 lab=COM}
C {devices/lab_pin.sym} 780 -440 0 0 {name=p13 lab=COM}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 160 -770 0 0 {name=R9
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 160 -680 0 0 {name=R10
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 140 -680 0 0 {name=p15 lab=COM}
C {devices/lab_pin.sym} 140 -770 0 0 {name=p16 lab=COM}
C {devices/lab_pin.sym} 160 -610 0 0 {name=p17 lab=COM}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 380 -770 0 0 {name=R11
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 380 -680 0 0 {name=R12
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 360 -680 0 0 {name=p18 lab=COM}
C {devices/lab_pin.sym} 360 -770 0 0 {name=p19 lab=COM}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 600 -770 0 0 {name=R13
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 600 -680 0 0 {name=R14
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 580 -680 0 0 {name=p21 lab=COM}
C {devices/lab_pin.sym} 580 -770 0 0 {name=p22 lab=COM}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 800 -770 0 0 {name=R15
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 800 -680 0 0 {name=R16
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 780 -680 0 0 {name=p24 lab=COM}
C {devices/lab_pin.sym} 780 -770 0 0 {name=p25 lab=COM}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 490 -830 3 0 {name=R18
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 710 -830 3 0 {name=R19
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 270 -490 3 0 {name=R20
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 490 -490 3 0 {name=R21
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 700 -490 3 0 {name=R22
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 270 -470 0 0 {name=p27 lab=COM}
C {devices/lab_pin.sym} 490 -470 0 0 {name=p28 lab=COM}
C {devices/lab_pin.sym} 700 -470 0 0 {name=p29 lab=COM}
C {devices/lab_pin.sym} 490 -810 0 0 {name=p31 lab=COM}
C {devices/lab_pin.sym} 710 -810 0 0 {name=p32 lab=COM}
C {devices/iopin.sym} 380 -610 2 0 {name=p30 lab=B0}
C {devices/iopin.sym} 600 -610 2 0 {name=p20 lab=B1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 1040 -440 0 0 {name=R17
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 1040 -350 0 0 {name=R23
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 1020 -350 0 0 {name=p23 lab=COM}
C {devices/lab_pin.sym} 1020 -440 0 0 {name=p33 lab=COM}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 940 -490 3 0 {name=R24
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 940 -470 0 0 {name=p35 lab=COM}
C {devices/lab_pin.sym} 922.5 -830 0 1 {name=p36 lab=H}
C {devices/lab_pin.sym} 120 -490 0 0 {name=p37 lab=H}
C {devices/iopin.sym} 130 -170 2 0 {name=p38 lab=OUT}
C {devices/lab_pin.sym} 1070 -490 2 0 {name=p40 lab=OUT}
C {devices/iopin.sym} 800 -610 2 0 {name=p26 lab=B2}
C {devices/iopin.sym} 160 -280 2 0 {name=p41 lab=B3}
C {devices/iopin.sym} 380 -280 2 0 {name=p5 lab=B4}
C {devices/iopin.sym} 600 -280 2 0 {name=p8 lab=B5}
C {devices/iopin.sym} 800 -280 2 0 {name=p11 lab=B6}
C {devices/iopin.sym} 1040 -280 2 0 {name=p14 lab=B7}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 867.5 -830 3 0 {name=R25
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 867.5 -810 0 0 {name=p2 lab=COM}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 1040 -770 0 0 {name=R26
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 1040 -650 0 0 {name=R27
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 1040 -710 0 0 {name=p34 lab=COM}
