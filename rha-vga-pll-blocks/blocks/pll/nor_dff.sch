v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 140 40 200 40 {lab=#net1}
N 140 180 200 180 {lab=#net2}
N 300 110 300 180 {lab=#net3}
N 180 110 300 110 {lab=#net3}
N 180 60 180 110 {lab=#net3}
N 180 60 200 60 {lab=#net3}
N 280 50 280 100 {lab=#net4}
N 200 100 280 100 {lab=#net4}
N 200 100 200 160 {lab=#net4}
N 40 170 60 170 {lab=#net5}
N -60 30 60 30 {lab=D}
N -110 150 -70 150 {lab=#net5}
N -140 110 -40 110 {lab=D}
N -40 150 -10 150 {lab=VDD}
N -170 150 -140 150 {lab=VSS}
N -80 260 20 260 {lab=#net6}
N 20 50 20 260 {lab=#net6}
N 20 50 60 50 {lab=#net6}
N 20 190 60 190 {lab=#net6}
N 20 260 20 360 {lab=#net6}
N 60 360 60 390 {lab=VSS}
N 60 230 60 260 {lab=VDD}
N 60 290 60 330 {lab=#net7}
N 280 50 360 50 {lab=#net4}
N 320 70 360 70 {lab=#net7}
N 320 70 320 210 {lab=#net7}
N 320 210 360 210 {lab=#net7}
N 320 210 320 310 {lab=#net7}
N 60 310 320 310 {lab=#net7}
N 440 60 500 60 {lab=#net8}
N 460 60 460 120 {lab=#net8}
N 340 120 460 120 {lab=#net8}
N 340 120 340 190 {lab=#net8}
N 340 190 360 190 {lab=#net8}
N 440 200 500 200 {lab=#net9}
N 580 70 580 120 {lab=Q}
N 500 120 580 120 {lab=Q}
N 500 120 500 180 {lab=Q}
N 480 140 600 140 {lab=Qn}
N 480 80 480 140 {lab=Qn}
N 480 80 500 80 {lab=Qn}
N 290 180 300 180 {lab=#net3}
N -40 30 -40 110 {lab=D}
N -70 150 -70 170 {lab=#net5}
N -70 170 40 170 {lab=#net5}
N 600 140 600 200 {lab=Qn}
N 590 200 600 200 {lab=Qn}
N 200 200 200 340 {lab=N_RST}
N 200 340 500 340 {lab=N_RST}
N 500 220 500 340 {lab=N_RST}
N -80 260 -80 300 {lab=#net6}
N -80 330 -80 360 {lab=VSS}
N -80 200 -80 230 {lab=VDD}
N -120 230 -120 330 {lab=CLK}
N -190 260 -120 260 {lab=CLK}
C {ipin.sym} -20 -140 0 0 {name=p1 lab=CLK}
C {ipin.sym} -20 -120 0 0 {name=p2 lab=D}
C {ipin.sym} -20 -100 0 0 {name=p3 lab=N_RST}
C {opin.sym} 20 -100 0 0 {name=p4 lab=Q}
C {blocks/pll/nand.sym} 100 40 0 0 {name=x1}
C {ipin.sym} -20 -160 0 0 {name=p5 lab=VSS}
C {ipin.sym} -20 -180 0 0 {name=p6 lab=VDD}
C {lab_wire.sym} 90 0 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 90 80 2 1 {name=p8 sig_type=std_logic lab=VSS}
C {blocks/pll/nand.sym} 240 50 0 0 {name=x2}
C {lab_wire.sym} 230 10 0 0 {name=p9 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 230 90 0 0 {name=p10 sig_type=std_logic lab=VSS}
C {blocks/pll/nand.sym} 100 180 0 0 {name=x3}
C {lab_wire.sym} 90 140 0 0 {name=p11 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 90 220 2 0 {name=p12 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 230 130 2 1 {name=p13 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 230 230 2 1 {name=p14 sig_type=std_logic lab=VSS}
C {lab_wire.sym} -60 30 0 0 {name=p15 sig_type=std_logic lab=D}
C {symbols/nfet_03v3.sym} -140 130 1 0 {name=M1
L=0.28u
W=0.3u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} -40 130 1 0 {name=M2
L=0.28u
W=0.3u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {lab_wire.sym} -10 150 1 0 {name=p16 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -170 150 3 1 {name=p17 sig_type=std_logic lab=VSS}
C {lab_wire.sym} -190 260 0 0 {name=p18 sig_type=std_logic lab=CLK}
C {symbols/nfet_03v3.sym} 40 360 0 0 {name=M3
L=0.28u
W=0.3u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 40 260 0 0 {name=M4
L=0.28u
W=0.3u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {lab_wire.sym} 60 230 0 0 {name=p19 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 60 390 2 1 {name=p20 sig_type=std_logic lab=VSS}
C {blocks/pll/nand.sym} 400 60 0 0 {name=x5}
C {lab_wire.sym} 390 20 0 0 {name=p21 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 390 100 2 1 {name=p22 sig_type=std_logic lab=VSS}
C {blocks/pll/nand.sym} 540 70 0 0 {name=x6}
C {lab_wire.sym} 530 30 0 0 {name=p23 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 530 110 0 0 {name=p24 sig_type=std_logic lab=VSS}
C {blocks/pll/nand.sym} 400 200 0 0 {name=x7}
C {lab_wire.sym} 390 160 0 0 {name=p25 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 390 240 2 0 {name=p26 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 530 150 2 1 {name=p27 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 530 250 2 1 {name=p28 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 580 70 0 1 {name=p29 sig_type=std_logic lab=Q}
C {blocks/pll/nand3.sym} 240 170 0 0 {name=x4}
C {blocks/pll/nand3.sym} 540 190 0 0 {name=x8}
C {lab_wire.sym} 200 340 0 0 {name=p30 sig_type=std_logic lab=N_RST}
C {symbols/nfet_03v3.sym} -100 330 0 0 {name=M5
L=0.28u
W=0.3u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} -100 230 0 0 {name=M6
L=0.28u
W=0.3u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {lab_wire.sym} -80 200 0 0 {name=p31 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -80 360 2 1 {name=p32 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 600 140 0 1 {name=p33 sig_type=std_logic lab=Qn}
C {opin.sym} 20 -120 0 0 {name=p34 lab=Qn}
