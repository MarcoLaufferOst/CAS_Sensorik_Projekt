v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 60 -90 110 -90 {
lab=A}
N 60 -90 60 -50 {
lab=A}
N 60 20 110 20 {
lab=A}
N 60 -30 60 20 {
lab=A}
N 60 -50 60 -30 {
lab=A}
N 150 50 150 80 {
lab=#net1}
N 150 20 230 20 {
lab=#net1}
N 230 20 230 80 {
lab=#net1}
N 150 80 230 80 {
lab=#net1}
N 150 -60 150 -10 {
lab=Y}
N 150 -30 180 -30 {
lab=Y}
N 150 -90 170 -90 {
lab=VDD}
N 170 -90 240 -90 {
lab=VDD}
N 240 -140 240 -90 {
lab=VDD}
N 150 -140 240 -140 {
lab=VDD}
N 150 -140 150 -120 {
lab=VDD}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 130 -90 0 0 {name=M2
L=0.35
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 130 20 0 0 {name=M1
L=0.15
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {devices/ipin.sym} 150 -140 0 0 {name=p5 lab=VDD}
C {devices/ipin.sym} 60 -30 0 0 {name=p1 lab=A}
C {devices/opin.sym} 180 -30 0 0 {name=p2 lab=Y}
C {devices/ipin.sym} 150 80 0 0 {name=p3 lab=VSS}
