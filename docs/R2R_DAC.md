# R2R DAC

Der DAC wird zur Erzeugung der Referenz-Komparatorspannung verwendet. Für das Design soll ein einfacher DAC ohne Bufferstufe (OP-Amp) erstellt werden.  
Nachfolgend ist eine schematische Darstellung des DACs zu sehen:  

![DAC_Schem](./img/R2R_DAC_Schem.png)  

Der DAC soll im SKY130-Prozess gefertigt werden. Die Widerstände und FETs sind in der Readthedocs-Dokumentation des PDK spezifiziert. Siehe [readthedocs](https://skywater-pdk.readthedocs.io/en/main/rules/device-details.html#generic-resistors).  


## Dimensionierung der Widerstände

Die `Generic resistors` werden nicht für analoge Designs empfohlen. Der `P-poly precision resistor` unterscheidet sich vom `P-poly resistor` durch ein separates Implantat, sodass der spezifische Flächenwiderstand bei 2000 Ohm/sq liegt (siehe readthedocs).  

Die Breiten sind dabei auf fünf Werte festgelegt:  
* 0.35 (0p35)  
* 0.69 (0p69)  
* 1.41 (1p41)  
* 2.85 (2p83)  
* 5.73 (5p73)  

Die Formel für den Widerstand lautet:  

$$
R = R_{sq} \cdot \frac{L}{W}
$$  

- $R$: Gesamtwiderstand  
- $R_{sq}$: Widerstand pro Quadrat (spezifischer Flächenwiderstand)  
- $L$: Länge des Widerstands  
- $W$: Breite des Widerstands  

Um einen Widerstand von $20 \text{k}\Omega$ zu erhalten, werden bei einem spezifischen Widerstand von $2000 \Omega/sq$ 10 Quadrate benötigt.  

Die Anzahl der Quadrate $N$ wird berechnet durch:  

$$
N = \frac{R_{\text{ges}}}{R_{sq}}
$$  

Dabei gilt:  
- $R_{\text{ges}} = 20 \text{k}\Omega$ (gewünschter Gesamtwiderstand)  
- $R_{sq} = 2000 \Omega/sq$ (spezifischer Widerstand pro Quadrat)  

$$
N = \frac{20 \text{k}\Omega}{2000 \Omega/sq} = 10 sq
$$  

Wenn die Breite des Widerstands $W = 35 \mu m$ beträgt, ergibt sich die Länge $L$ mit folgender Formel:  

$$
L = N \cdot W
$$  

$$
L = 10 \cdot 35 \mu m = 350 \mu m
$$  

Daraus folgt, dass der Widerstand eine Dimension von:  

$$
W = 35 \mu m, \quad L = 350 \mu m
$$  

oder:  

$$
0.35 \times 3.5 \mu m
$$  

### Magic PCELL-Konfigurationen / Einheitswiderstand  

Die Modellierung des Widerstands kann mit einer `PCELL` in Magic vorgenommen werden. Dabei wird der Widerstand direkt anhand des extrahierten Spice berechnet. Bei einer Länge von 3.5 µm und einer Breite von 0p35 beträgt der Widerstand 21.075 kΩ.  

![magic_pcell_no_snake](./img/poli_res_pcell_no_snake.png)  

Folgende Trade-offs müssen beachtet werden:  

- Der Strom durch den Widerstand darf 100 µA/µm nicht überschreiten (siehe readthedocs des PDKs).  
- Je kleiner der Widerstand, desto grösser wird der Fehler durch das $R_{DS_{on}}$ des MOS-Schalters.  
- Je grösser der Widerstand, desto stärker beeinflusst die Belastung den DAC, da die Ausgangsimpedanz zunimmt.  

Es wird 10 kΩ als Einheit gewählt. Bei einer Breite von 0p69 wird eine Länge von 3.5 µm pro Einheitswiderstand benötigt.  
Wenn alle Widerstände in eine Wanne mit Guardring gesetzt werden, können ohne Meander-Struktur (Snake Geometry) 28 Widerstände auf 9.37 µm x 33.86 µm platziert werden.  
Für einen 8-Bit-DAC werden 26 Widerstände benötigt.  

![magic_pcell_no_snake](./img/high_poli_res_28.png)  

Der maximale Strom, der durch den Widerstand fliesst, könnte analytisch berechnet werden. Dabei müssen jedoch einige Schleifen und Formeln aufgestellt werden. Eine einfache und sichere Alternative ist die Simulation mit SPICE. Ist der Umgang mit dem Simulator vertraut, kann diese Simulation schnell durchgeführt werden. Es wurde entschieden, dies in LTspice durchzuführen:

![magic_pcell_no_snake](./img/R2R_LTspice_current.png) 

Der R2R-DAC wird mit entsprechenden Widerständen aufgebaut. Mit D-Flip-Flops (DFF) wird ein Zähler konstruiert, der alle DAC-Werte erstellt. Die Ausgangsspannung beträgt dabei 1 V. Mit einer B-Source wird das jeweilige Bit (DFF-Ausgang: 1 V oder 0 V) auf 2 V ($V_{REF}$) verstärkt.

Bei einem Einheitswiderstand von 10 kΩ wird ein Strom von $\pm 75 \mu A$ erwartet.


### Test der Mismatch-Simulation  

Der Mismatch bestimmt die DNL und INL des DACs. Die Toleranz von Wafer zu Wafer ist vernachlässigbar, da mit reinen Verhältnissen gearbeitet wird. 2R muss einfach doppelt so gross wie R sein.  
Jeder Anschluss erhöht den Widerstand. Wenn ein 2R-Widerstand benötigt wird, sollten besser zwei einzelne Widerstände anstelle eines längeren Widerstands verwendet werden.  
Es wird angenommen, dass die Wanne keinen grossen Einfluss auf das Matching hat. Ebenso wird angenommen, dass die Einflüsse parasitärer Kapazitäten vernachlässigt werden können, da die Taktfrequenz sehr niedrig gewählt werden kann. Daher reichen `op`- oder `dc`-Simulationen aus.  

Die Dokumentation zu den Mismatch-Parametern des PDK ist begrenzt. Ein Codeblock `Corner` wird bereitgestellt, dem ein Argument wie `mc`, `tt`, `ff`, `ss`, `fs` oder `sf` übergeben werden kann.  
Ausser `mc` kann jeder Parameter mit dem Postfix `_mm` für Mismatch modifiziert werden. Für FETs konnte bereits erfolgreich eine Mismatch-Simulation erstellt werden (siehe `xschem/mismatch_test.sch`).  
Ob diese Parameter auch für Widerstände und Kondensatoren gelten, muss noch getestet werden.  

Es wurde eine Testbench erstellt, in der zwei Widerstände mit einer Spannungsquelle versorgt werden. Bei Mismatch sollten sich die Widerstandswerte unterscheiden.  
Bei Monte-Carlo-Simulationen sollte sich der Wert bei mehreren Simulationsläufen ändern.  

Da kein dynamisches Verhalten (Umladen von Cs) oder Spannungsänderungen (`dc`-Simulation) für den Test benötigt wird, wird eine `op`-Simulation in einer Schleife durchgeführt.  
Der Widerstandswert wird bei jedem Durchlauf berechnet und in einem Vektor gespeichert. Mit `ngspice` kann der Vektor dann als Graph ausgegeben werden:  

![res_mm_op](./img/res_mm_op.png)  

Die Widerstände zeigen wie erwartet unterschiedliche Werte. Diese bleiben jedoch über mehrere Simulationsläufe konstant!  
Direkt in `xschem` kann der Vektor nicht ausgegeben werden, da der Sweep-Vektor (X-Achse) nicht für den `const`-Plot verwendet werden kann. In `ngspice` kann mit `plot y vs x` der Sweep (X-Achse) ausgewählt werden (siehe README `xschem_ngspice.md`).  

Das Simulationssetup wird auf eine `dc`-Simulation umgestellt, um die Darstellung in `xschem` zu erleichtern. Dabei wird die Temperatur anstelle der Spannung variiert.  
Es wird keine Spannungsabhängigkeit des Widerstands erwartet.  

![dc_temp_sim](./img/res_mm_dc_temp.png)  

Auch hier ist keine Variation zwischen den Läufen erkennbar. Alle 100 Läufe liegen exakt übereinander. Der Mismatch scheint jedoch zu funktionieren, da die Widerstände unterschiedliche Werte aufweisen.  

> **Wichtig:**  
> Im Loop/Repeat muss der `reset`-Befehl gegeben werden, um die Parameter neu zu setzen (siehe Videoanleitung von [bminch](https://www.youtube.com/watch?v=fXaXTALecr8&t=233s)).  

Durch den `reset`-Befehl im Loop sind Änderungen bei jedem Durchlauf sichtbar:  

![res_op_mm_mc](./img/res_op_mm_mc_100_runs.png)  


Etwas unklar bleibt der Parametersatz `mc` und `tt_mm`. Im Slack-Kanal **open-source-silicon.dev** sind die Maintainer von `xschem` und des PDK aktiv. Dabei wurde auch auf die Corners eingegangen.  

Nach dem Chatverlauf sollte der Parameter `mc_mm` zur Verfügung stehen. Dieser ist jedoch nicht im PDK enthalten.  
![slack_mm_mc](./img/slack_mm_mc.png)  

Wird jedoch `tt_mm` gewählt, können die importierten Spice-Files in der Netzliste eingesehen werden. Es wird angenommen, dass der Mismatch die Änderung des Widerstandswerts von einem zum anderen Widerstand auf demselben Wafer beschreibt. Dies ist relevant.  
Wenn der gesamte Wafer um 10 % höhere Widerstandswerte aufweist, ist dies beim R2R irrelevant, solange die Lastimpedanz und das $R_{DS_{on}}$ des Schalters sehr klein sind.  

Für diese Simulationen wird der Corner `tt_mm` gewählt.  

```plaintext
.param mc_mm_switch=1
.param mc_pr_switch=0
.include /home/ttuser/pdk/sky130A/libs.tech/ngspice/corners/tt.spice
.include /home/ttuser/pdk/sky130A/libs.tech/ngspice/r+c/res_typical__cap_typical.spice
.include /home/ttuser/pdk/sky130A/libs.tech/ngspice/r+c/res_typical__cap_typical__lin.spice
.include /home/ttuser/pdk/sky130A/libs.tech/ngspice/corners/tt/spespecialized_cells.spice
```

## Dimensionierung der FET

Für jedes Bit muss zwischen $V_{Ref}$ und $V_{COM}$ umgeschaltet werden. Dies kann mit einem Inverter (PFET - NFET) wie im folgenden Schema realisiert werden:  

![DAC_FET_Switch](./img/R2R_DAC_Switch.png)  

Folgende Trade-offs müssen beachtet werden:  

- Der Widerstand $R_{DS_{on}}$ muss deutlich kleiner sein als $R$, damit der Fehler möglichst gering bleibt.  
- Die Ansteuerung erfolgt durch den digitalen Teil. Entsprechend liegt die Spannung $D_x$ bei $V_{D_{PWR}} = 1.8\,$V.  
- Der Querstrom sollte überprüft und optimiert werden (dies ist jedoch weniger kritisch als bei einem CAP-DAC, da keine Ladung verloren geht). Dies kann durch die Dimensionierung oder durch den digitalen Teil mittels `Break-Before-Make` erreicht werden.  

Die FETs werden als Schalter dimensioniert.  

Bei kleinen Drain-Source-Spannungen $V_{DS}$ kann der Drain-Source-Strom $I_D$ mit folgender Gleichung beschrieben werden [1, Eq. (1.51)]:  

$$
I_D = \mu_n Q_n \frac{W}{L} V_{DS}\tag{1.51}
$$  

- \( \mu_n \): Beweglichkeit der Elektronen in der Nähe der Siliziumoberfläche  
- \( Q_n \): Ladungskonzentration des Kanals pro Flächeneinheit    
- \( W \): Breite des MOSFET-Kanals    
- \( L \): Länge des Kanals    
- \( V_{DS} \): Drain-Source-Spannung    

Die folgende Abbildung stammt aus [1]:  

![FET_as_Switch](./img/fet_as_switch_id_vs_vds.png)  

Herr Carsten Wulff zeigt jedoch in seiner [Präsentation](https://analogicus.com/aic2024/2024/09/11/SPICE.html) und seinem [YouTube-Video](https://youtu.be/z9go-m0hnIg?si=Wjbk-50xM0hINQm7&t=849), dass diese Formeln bei kleinen Strukturen nicht mehr gültig sind. Die Zusammenhänge sind komplex. Beispielsweise besitzt das `BSIM 4.5` (Berkeley Short-channel IGFET Model) SPICE-Modell 284 Parameter.  

Seine Empfehlung: Für Analogdesign sollte ein Transistor mit `unit size` verwendet werden, und $L_{min}$ sollte aufgrund der verwendeten `Halo Doping`-Technologie bei minimalen Strukturen um ca. den Faktor 1.2 vergrössert werden. Der FET sollte mit einer SPICE-Simulation charakterisiert werden.  

Formel (1.51) kann jedoch für eine heuristische Abschätzung verwendet werden. Je grösser $W$ und je kleiner $L$, desto grösser ist $I_D$. Die Schaltaufgabe ist nicht besonders kritisch.  

Im PDK sind bestimmte $W/L$-Verhältnisse bereits charakterisiert (siehe [read-the-docs](https://skywater-pdk.readthedocs.io/en/main/rules/device-details.html#v-10-5v-nmos-fet)). Es wird der `IDSNS50H` ausgewählt ($W/L = 7/0.5$) und in einer Testbench charakterisiert. Dies ergibt einen Widerstand von etwa 600 $\Omega$:  

![FET_as_Switch_tb](./img/mos_spec_sw_mm.png)  

Die gleiche Simulation wurde mit dem PFET durchgeführt. Damit sich auch hier ein Widerstand von etwa 800 $\Omega$ ergibt, muss ein $W$ von $16\,\mu m$ gewählt werden:  

![FET_as_Switch_tb](./img/mos_spec_sw_mm_pfet.png)  

### Referenzen  

[1] Carusone, T. C., Johns, D., Martin, K. (2012). *Analog Integrated Circuit Design*. Vereinigtes Königreich: Wiley.  
