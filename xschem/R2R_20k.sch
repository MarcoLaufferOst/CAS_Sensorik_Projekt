v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 200 -350 200 -310 {
lab=B3}
N 200 -440 200 -410 {
lab=#net1}
N 420 -350 420 -310 {
lab=B4}
N 420 -440 420 -410 {
lab=#net2}
N 640 -350 640 -310 {
lab=B5}
N 640 -440 640 -410 {
lab=#net3}
N 840 -350 840 -310 {
lab=B6}
N 840 -440 840 -410 {
lab=#net4}
N 200 -680 200 -640 {
lab=COM}
N 200 -770 200 -740 {
lab=#net5}
N 420 -680 420 -640 {
lab=B0}
N 420 -770 420 -740 {
lab=#net6}
N 640 -680 640 -640 {
lab=B1}
N 640 -770 640 -740 {
lab=#net7}
N 840 -680 840 -640 {
lab=B2}
N 840 -770 840 -740 {
lab=#net8}
N 420 -860 420 -830 {
lab=#net9}
N 200 -860 420 -860 {
lab=#net9}
N 200 -860 200 -830 {
lab=#net9}
N 420 -860 500 -860 {
lab=#net9}
N 560 -860 640 -860 {
lab=#net10}
N 640 -860 640 -830 {
lab=#net10}
N 640 -860 720 -860 {
lab=#net10}
N 780 -860 840 -860 {
lab=#net11}
N 840 -860 840 -830 {
lab=#net11}
N 1080 -350 1080 -310 {
lab=B7}
N 1080 -440 1080 -410 {
lab=#net12}
N 840 -860 880 -860 {
lab=#net11}
N 160 -520 200 -520 {
lab=H}
N 200 -520 200 -500 {
lab=H}
N 200 -520 280 -520 {
lab=H}
N 340 -520 420 -520 {
lab=#net13}
N 420 -520 420 -500 {
lab=#net13}
N 420 -520 500 -520 {
lab=#net13}
N 560 -520 640 -520 {
lab=#net14}
N 640 -520 640 -500 {
lab=#net14}
N 640 -520 710 -520 {
lab=#net14}
N 770 -520 840 -520 {
lab=#net15}
N 840 -520 840 -500 {
lab=#net15}
N 840 -520 950 -520 {
lab=#net15}
N 1010 -520 1080 -520 {
lab=OUT}
N 1080 -520 1080 -500 {
lab=OUT}
N 1080 -520 1110 -520 {
lab=OUT}
N 937.5 -860 962.5 -860 {
lab=H}
C {devices/title.sym} 160 -40 0 0 {name=l1 author="Marco Lauffer"}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 200 -470 0 0 {name=R1
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 200 -380 0 0 {name=R2
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/iopin.sym} 130 -210 2 0 {name=p1 lab=COM}
C {devices/lab_pin.sym} 180 -380 0 0 {name=p3 lab=COM}
C {devices/lab_pin.sym} 180 -470 0 0 {name=p4 lab=COM}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 420 -470 0 0 {name=R3
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 420 -380 0 0 {name=R4
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 400 -380 0 0 {name=p6 lab=COM}
C {devices/lab_pin.sym} 400 -470 0 0 {name=p7 lab=COM}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 640 -470 0 0 {name=R5
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 640 -380 0 0 {name=R6
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 620 -380 0 0 {name=p9 lab=COM}
C {devices/lab_pin.sym} 620 -470 0 0 {name=p10 lab=COM}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 840 -470 0 0 {name=R7
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 840 -380 0 0 {name=R8
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 820 -380 0 0 {name=p12 lab=COM}
C {devices/lab_pin.sym} 820 -470 0 0 {name=p13 lab=COM}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 200 -800 0 0 {name=R9
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 200 -710 0 0 {name=R10
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 180 -710 0 0 {name=p15 lab=COM}
C {devices/lab_pin.sym} 180 -800 0 0 {name=p16 lab=COM}
C {devices/lab_pin.sym} 200 -640 0 0 {name=p17 lab=COM}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 420 -800 0 0 {name=R11
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 420 -710 0 0 {name=R12
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 400 -710 0 0 {name=p18 lab=COM}
C {devices/lab_pin.sym} 400 -800 0 0 {name=p19 lab=COM}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 640 -800 0 0 {name=R13
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 640 -710 0 0 {name=R14
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 620 -710 0 0 {name=p21 lab=COM}
C {devices/lab_pin.sym} 620 -800 0 0 {name=p22 lab=COM}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 840 -800 0 0 {name=R15
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 840 -710 0 0 {name=R16
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 820 -710 0 0 {name=p24 lab=COM}
C {devices/lab_pin.sym} 820 -800 0 0 {name=p25 lab=COM}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 530 -860 3 0 {name=R18
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 750 -860 3 0 {name=R19
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 310 -520 3 0 {name=R20
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 530 -520 3 0 {name=R21
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 740 -520 3 0 {name=R22
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 310 -500 0 0 {name=p27 lab=COM}
C {devices/lab_pin.sym} 530 -500 0 0 {name=p28 lab=COM}
C {devices/lab_pin.sym} 740 -500 0 0 {name=p29 lab=COM}
C {devices/lab_pin.sym} 530 -840 0 0 {name=p31 lab=COM}
C {devices/lab_pin.sym} 750 -840 0 0 {name=p32 lab=COM}
C {devices/iopin.sym} 420 -640 2 0 {name=p30 lab=B0}
C {devices/iopin.sym} 640 -640 2 0 {name=p20 lab=B1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 1080 -470 0 0 {name=R17
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 1080 -380 0 0 {name=R23
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 1060 -380 0 0 {name=p23 lab=COM}
C {devices/lab_pin.sym} 1060 -470 0 0 {name=p33 lab=COM}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 980 -520 3 0 {name=R24
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 980 -500 0 0 {name=p35 lab=COM}
C {devices/lab_pin.sym} 962.5 -860 0 1 {name=p36 lab=H}
C {devices/lab_pin.sym} 160 -520 0 0 {name=p37 lab=H}
C {devices/iopin.sym} 130 -170 2 0 {name=p38 lab=OUT}
C {devices/lab_pin.sym} 1110 -520 2 0 {name=p40 lab=OUT}
C {devices/iopin.sym} 840 -640 2 0 {name=p26 lab=B2}
C {devices/iopin.sym} 200 -310 2 0 {name=p41 lab=B3}
C {devices/iopin.sym} 420 -310 2 0 {name=p5 lab=B4}
C {devices/iopin.sym} 640 -310 2 0 {name=p8 lab=B5}
C {devices/iopin.sym} 840 -310 2 0 {name=p11 lab=B6}
C {devices/iopin.sym} 1080 -310 2 0 {name=p14 lab=B7}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 907.5 -860 3 0 {name=R25
W=0.69
L=7
model=res_xhigh_po_0p69
spiceprefix=X
 mult=1}
C {devices/lab_pin.sym} 907.5 -840 0 0 {name=p2 lab=COM}
