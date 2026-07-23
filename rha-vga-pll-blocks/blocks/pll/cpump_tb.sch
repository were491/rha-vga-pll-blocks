v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 360 -110 440 -110 {lab=V_out}
N -260 -140 60 -120 {lab=Iref_pos}
N -50 -80 60 -80 {lab=V_up}
N 40 -60 60 -60 {lab=V_down}
N -340 -380 -260 -380 {lab=VDD}
N -260 -380 -260 -350 {lab=VDD}
N -340 -380 -340 -350 {lab=VDD}
N -260 -290 -250 -290 {lab=VDD}
N -250 -350 -250 -290 {lab=VDD}
N -260 -350 -250 -350 {lab=VDD}
N -340 20 -300 20 {lab=#net1}
N -300 20 -300 50 {lab=#net1}
N -340 50 -340 80 {lab=GND}
N -260 -10 -250 -10 {lab=GND}
N -250 -10 -250 50 {lab=GND}
N -260 50 -250 50 {lab=GND}
N 440 -110 440 -100 {lab=V_out}
N -260 -100 -160 -100 {lab=Iref_neg}
N -260 -200 -260 -140 {lab=Iref_pos}
N -160 -100 60 -100 {lab=Iref_neg}
N -340 -320 -300 -320 {lab=#net2}
N -300 -350 -300 -320 {lab=#net2}
N -340 -260 -300 -260 {lab=#net3}
N -300 -290 -300 -260 {lab=#net3}
N -350 -290 -340 -290 {lab=VDD}
N -350 -350 -350 -290 {lab=VDD}
N -350 -350 -340 -350 {lab=VDD}
N -340 -40 -300 -40 {lab=#net4}
N -300 -40 -300 -10 {lab=#net4}
N -350 -10 -340 -10 {lab=GND}
N -350 -10 -350 50 {lab=GND}
N -350 50 -340 50 {lab=GND}
N -260 50 -260 80 {lab=GND}
C {blocks/pll/cpump.sym} 210 -110 0 0 {name=x1}
C {lab_wire.sym} 440 -110 0 1 {name=p1 sig_type=std_logic lab=V_out}
C {code_shown.sym} 110 170 0 0 {name=simcode only_toplevel=true spice_ignore=false lvs_ignore=true
value=".include /foss/pdks/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice bjt_typical
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice diode_typical
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice res_typical
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice mimcap_typical
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice moscap_typical
.option method = gear

.control
    set temp = 25

    let amp = 0.5
    let freq = 50meg
    let pers = 50
    let persteps = 2000

    let v3y = vector(100)
    compose v3x start = 0  stop = 3.3  lin = 100
    let j = 0
    while j < 100
        alter @v4[dc] = v3x[j]
        op
        let v3y[j] = v4#branch
        let j = j + 1
    end
    plot v3y vs v3x title 'Iref_pos vs voltage'
    alter @v4[dc] = [ 0 ]

    alter @v2[pulse] = [ 3.3 0 10p 1n 1n 4n 20n 20 ]
    alter @v3[pulse] = [ 0 3.3 145n 1n 1n 4n 20n ]
    * alter @v3[sin] = [ 1.65 $&amp $&freq 0 0 0 ]

    let tper = 1 / freq
    let tfin = tper * pers
    let tstep = tper / persteps
    let tplotst = tfin - 2 * tper

    tran 10n 800n
    write cpump.raw

    plot V_out V_up V_down
    plot v4#branch v5#branch
.endc
"}
C {vsource.sym} -40 80 0 0 {name=V1 value=3.3 savecurrent=false
lvs_ignore=true}
C {gnd.sym} -40 110 0 0 {name=l1 lab=GND
lvs_ignore=true}
C {lab_wire.sym} -40 50 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 60 -160 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {vsource.sym} -50 -50 0 0 {name=V2 value=3.3 savecurrent=false
lvs_ignore=true}
C {vsource.sym} 40 -30 0 0 {name=V3 value=0 savecurrent=false
lvs_ignore=true}
C {gnd.sym} -50 -20 0 0 {name=l4 lab=GND
lvs_ignore=true}
C {gnd.sym} 40 0 0 0 {name=l5 lab=GND
lvs_ignore=true}
C {lab_wire.sym} -50 -80 0 0 {name=p5 sig_type=std_logic lab=V_up}
C {lab_wire.sym} 40 -60 0 0 {name=p6 sig_type=std_logic lab=V_down}
C {gnd.sym} 440 -40 0 0 {name=l6 lab=GND
lvs_ignore=true}
C {isource.sym} -340 -230 0 0 {name=I1 value=20u
lvs_ignore=true}
C {lab_wire.sym} -340 -380 0 0 {name=p57 sig_type=std_logic lab=VDD}
C {symbols/pfet_03v3.sym} -320 -350 0 1 {name=M5
L=0.56u
W=2u
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
C {symbols/pfet_03v3.sym} -280 -350 0 0 {name=M6
L=0.56u
W=32u
nf=16
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
C {gnd.sym} -340 -200 0 0 {name=l3 lab=GND
lvs_ignore=true}
C {symbols/pfet_03v3.sym} -280 -290 0 0 {name=M7
L=0.56u
W=32u
nf=16
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
C {vsource.sym} -260 -230 0 0 {name=V4 value=0 savecurrent=false}
C {isource.sym} -340 -70 0 0 {name=I4 value=20u
lvs_ignore=true}
C {lab_wire.sym} -340 -100 0 0 {name=p77 sig_type=std_logic lab=VDD}
C {symbols/nfet_03v3.sym} -320 50 0 1 {name=M11
L=0.56u
W=2u
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
C {symbols/nfet_03v3.sym} -280 50 0 0 {name=M12
L=0.56u
W=24u
nf=12
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
C {gnd.sym} -340 80 0 0 {name=l8 lab=GND
lvs_ignore=true}
C {lab_wire.sym} -260 -100 0 0 {name=p37 sig_type=std_logic lab=Iref_neg}
C {symbols/nfet_03v3.sym} -280 -10 0 0 {name=M17
L=0.56u
W=24u
nf=12
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
C {vsource.sym} -260 -70 0 0 {name=V5 value=0 savecurrent=false}
C {capa-2.sym} 440 -70 0 0 {name=C1
m=1
value=11.5p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 60 -140 0 0 {name=p4 sig_type=std_logic lab=GND}
C {symbols/pfet_03v3.sym} -320 -290 0 1 {name=M1
L=0.56u
W=2u
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
C {lab_wire.sym} -260 -140 0 0 {name=p7 sig_type=std_logic lab=Iref_pos}
C {symbols/nfet_03v3.sym} -320 -10 0 1 {name=M2
L=0.56u
W=2u
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
C {gnd.sym} -260 80 0 0 {name=l2 lab=GND
lvs_ignore=true}
