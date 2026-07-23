v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1160 -240 1200 -240 {lab=N_RST}
N 1160 -240 1160 -200 {lab=N_RST}
N 1160 -200 1520 -200 {lab=N_RST}
N 1840 -230 1840 -210 {lab=Qa}
N 1840 -190 1840 -170 {lab=#net1}
N 1040 -280 1200 -280 {lab=Va}
N 1040 -120 1200 -120 {lab=Vb}
N 1160 -200 1160 -80 {lab=N_RST}
N 1160 -80 1200 -80 {lab=N_RST}
N 1520 -200 1600 -200 {lab=N_RST}
N 1660 -280 1660 -250 {lab=VDD}
N 1660 -220 1660 -180 {lab=N_RST}
N 1660 -150 1660 -120 {lab=GND}
N 1700 -250 1700 -150 {lab=#net2}
N 1700 -200 1760 -200 {lab=#net2}
N 1500 -140 1660 -80 {lab=#net1}
N 1660 -80 1840 -170 {lab=#net1}
N 1500 -300 1660 -380 {lab=Qa}
N 1660 -380 1840 -230 {lab=Qa}
N 1600 -200 1660 -200 {lab=N_RST}
C {devices/code_shown.sym} 10 -875 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
* .lib $::180MCU_MODELS/sm141064.ngspice res_statistical
.lib $::180MCU_MODELS/sm141064.ngspice cap_mim
.lib $::180MCU_MODELS/sm141064.ngspice mimcap_typical
"
lvs_ignore=true}
C {devices/code_shown.sym} 10 -665 0 0 {name=NGSPICE only_toplevel=true
value="
V_VDD vdd 0 3.3v
* V_RST rst 0 pulse(0 3.3 0 1n 1n 10u 20u)
.control
save all
tran 0.10u 100u
plot v(qa) v(qb)
plot va+4 vb qa+4 qb n_rst/8
write VCO_GF180.raw
.endc
"
lvs_ignore=true}
C {vsource.sym} 1040 -250 0 1 {name=V2 value="PULSE(0 3.3 0u 1n 1n 1u 2u)" savecurrent=false only_toplevel=true lvs_ignore=true}
C {gnd.sym} 1040 -220 0 1 {name=l9 lab=GND lvs_ignore=true
only_toplevel=true}
C {vsource.sym} 1040 -90 0 0 {name=V1 value="PULSE(0 3.3 1.25u 1n 1n 1.5u 1.8u)" savecurrent=false lvs_ignore=true
only_toplevel=true}
C {gnd.sym} 1040 -60 0 1 {name=l3 lab=GND lvs_ignore=true
only_toplevel=true}
C {lab_pin.sym} 1800 -170 0 1 {name=p25 lab=GND}
C {lab_wire.sym} 1800 -230 0 1 {name=p14 sig_type=std_logic lab=VDD}
C {ipin.sym} 1040 -120 0 0 {name=p15 lab=Vb}
C {ipin.sym} 1040 -280 0 0 {name=p16 lab=Va}
C {opin.sym} 1840 -230 0 0 {name=p4 lab=Qa}
C {opin.sym} 1500 -160 0 0 {name=p17 lab=Qb}
C {iopin.sym} 780 -480 0 0 {name=p26 lab=VDD}
C {iopin.sym} 780 -460 0 0 {name=p27 lab=GND}
C {lab_wire.sym} 1200 -260 0 0 {name=p31 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 1200 -300 0 0 {name=p13 sig_type=std_logic lab=GND}
C {lab_wire.sym} 1200 -320 0 0 {name=p32 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 1160 -200 0 1 {name=p33 sig_type=std_logic lab=N_RST}
C {lab_wire.sym} 1200 -160 0 0 {name=p34 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 1200 -140 0 0 {name=p35 sig_type=std_logic lab=GND}
C {lab_wire.sym} 1200 -100 0 0 {name=p36 sig_type=std_logic lab=VDD}
C {blocks/pll/nor_dff.sym} 1350 -280 0 0 {name=x1}
C {blocks/pll/nor_dff.sym} 1350 -120 0 0 {name=x2}
C {symbols/pfet_03v3.sym} 1680 -250 0 1 {name=M1
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
C {lab_wire.sym} 1660 -280 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {symbols/nfet_03v3.sym} 1680 -150 0 1 {name=M2
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
C {lab_pin.sym} 1660 -120 0 1 {name=p2 lab=GND}
C {blocks/pll/nor.sym} 1800 -190 0 1 {name=x3}
