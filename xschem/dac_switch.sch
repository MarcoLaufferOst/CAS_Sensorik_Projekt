v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 500 -360 550 -360 {
lab=Dx}
N 500 -460 500 -360 {
lab=Dx}
N 500 -460 550 -460 {
lab=Dx}
N 480 -410 500 -410 {
lab=Dx}
N 590 -360 660 -360 {
lab=Vcom}
N 660 -360 660 -320 {
lab=Vcom}
N 590 -320 660 -320 {
lab=Vcom}
N 590 -330 590 -300 {
lab=Vcom}
N 590 -520 590 -490 {
lab=Vref}
N 590 -460 660 -460 {
lab=Vref}
N 660 -500 660 -460 {
lab=Vref}
N 590 -500 660 -500 {
lab=Vref}
N 590 -430 590 -390 {
lab=Outx}
N 590 -410 640 -410 {
lab=Outx}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Marco Lauffer"}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 570 -460 0 0 {name=M1
L=0.5
W=48
nf=3
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
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 570 -360 0 0 {name=M2
L=0.5
W=21
nf=3
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {devices/ipin.sym} 480 -410 0 0 {name=p1 lab=Dx}
C {devices/opin.sym} 640 -410 0 0 {name=p2 lab=Outx}
C {devices/iopin.sym} 590 -520 0 0 {name=p3 lab=Vref}
C {devices/iopin.sym} 590 -300 0 0 {name=p4 lab=Vcom}
