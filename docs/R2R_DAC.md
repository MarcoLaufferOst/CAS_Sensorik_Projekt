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
Direkt in `xschem` kann der Vektor nicht ausgegeben werden, da der Sweep-Vektor (X-Achse) nicht aus dem `const`-Plot verwendet werden kann. In `ngspice` kann mit `plot y vs x` der Sweep (X-Achse) ausgewählt werden (siehe README `xschem_ngspice.md`).  

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

Aufgrund des Chatverlauf wird angenommen, dass der Mismatch die Änderung des Widerstandswerts von einem zum anderen Widerstand auf demselben Wafer beschreibt. Dies ist relevant.  
Wenn der gesamte Wafer um 10 % höhere Widerstandswerte aufweist, ist dies beim R2R irrelevant, solange die Lastimpedanz und das $R_{DS_{on}}$ des Schalters sehr klein sind.  

Für diese Simulationen wird der Corner `tt_mm` gewählt.  


## Dimensionierung der FET

Für jedes Bit muss zwischen $V_{Ref}$ und $V_{COM}$ umgeschaltet werden. Dies kann mit einem Inverter (PFET - NFET) wie im folgenden Schema realisiert werden:  

![DAC_FET_Switch](./img/R2R_DAC_Switch.png)  

Folgende Trade-offs müssen beachtet werden:  

- Der Widerstand $R_{DS_{on}}$ muss deutlich kleiner sein als $R$, damit der Fehler möglichst gering bleibt.  
- Die Ansteuerung erfolgt durch den digitalen Teil. Entsprechend liegt die Spannung $D_x$ bei $V_{D_{PWR}} = 1.8V$.  
- Der Querstrom sollte überprüft und optimiert werden (dies ist jedoch weniger kritisch als bei einem CAP-DAC, da keine Ladung verloren geht). Dies kann durch die Dimensionierung oder durch den digitalen Teil mittels `Break-Before-Make` erreicht werden.  

Die FETs werden als Schalter dimensioniert.  

Bei kleinen Drain-Source-Spannungen $V_{DS}$ kann der Drain-Source-Strom $I_D$ mit folgender Gleichung beschrieben werden [1, Eq. (1.51)]:  

$$ 
I_D = \mu_n Q_n \frac{W}{L} V_{DS} 
$$  

- $\mu_n$: Beweglichkeit der Elektronen in der Nähe der Siliziumoberfläche  
- $Q_n$: Ladungskonzentration des Kanals pro Flächeneinheit    
- $W$: Breite des MOSFET-Kanals    
- $L$: Länge des Kanals    
- $V_{DS}$: Drain-Source-Spannung    

Die folgende Abbildung stammt aus [1]:  

![FET_as_Switch](./img/fet_as_switch_id_vs_vds.png)  

Herr Carsten Wulff zeigt jedoch in seiner [Präsentation](https://analogicus.com/aic2024/2024/09/11/SPICE.html) und seinem [YouTube-Video](https://youtu.be/z9go-m0hnIg?si=Wjbk-50xM0hINQm7&t=849), dass diese Formeln bei kleinen Strukturen nicht mehr gültig sind. Die Zusammenhänge sind komplex. Beispielsweise besitzt das `BSIM 4.5` (Berkeley Short-channel IGFET Model) SPICE-Modell 284 Parameter.  

Seine Empfehlung: Für Analogdesign sollte ein Transistor mit `unit size` verwendet werden, und $L_{min}$ sollte aufgrund der verwendeten `Halo Doping`-Technologie bei minimalen Strukturen um ca. den Faktor 1.2 vergrössert werden. Der FET sollte mit einer SPICE-Simulation charakterisiert werden.  

Formel (1.51) kann jedoch für eine heuristische Abschätzung verwendet werden. Je grösser $W$ und je kleiner $L$, desto grösser ist $I_D$. Die Schaltaufgabe ist nicht besonders kritisch.  

Im PDK sind bestimmte $W/L$-Verhältnisse bereits charakterisiert (siehe [read-the-docs](https://skywater-pdk.readthedocs.io/en/main/rules/device-details.html#v-10-5v-nmos-fet)). Es wird der `IDSNS50H` ausgewählt ($W/L = 7/0.5$) und in einer Testbench charakterisiert. Dies ergibt einen Widerstand von etwa 600 $\Omega$:  

![FET_as_Switch_tb](./img/mos_spec_sw_mm.png)  

Die gleiche Simulation wurde mit dem PFET durchgeführt. Damit sich auch hier ein Widerstand von etwa 800 $\Omega$ ergibt, muss ein $W$ von $16\,\mu m$ gewählt werden:  

![FET_as_Switch_tb](./img/mos_spec_sw_mm_pfet.png)  

600 $\Omega$ und 800 $\Omega$ gegenüber dem 2R-Pfad von 20k verursachen einen Fehler von 4 %. Dies ist vergleichsweise hoch. Eine Verbesserung lässt sich durch Optimierung der Schalter oder durch Erhöhung der Widerstände von R = 10k auf R = 20k erreichen. Der Komparator sollte eine sehr hohe Eingangsimpedanz aufweisen. Dadurch wird die Quellenimpedanz des DACs weniger relevant. Es wurde entschieden, den Einheitswiderstand auf 20k zu erhöhen.  

Der DAC-Schalter wurde in ein Schaltplansymbol gewandelt und die DC-Eigenschaften mit einer Testbench überprüft. Der zu schaltende Strom liegt bei ca. $37\mu A$. Bei $V_{REF}$ von 2 V ergibt sich ein Widerstand von ca. $54k\Omega$. Für die Simulation wurde ein tieferer Widerstand von 40k angesetzt. Damit wird der schlechtere Fall Simuliert. Der Treiberstufe wurde ein Steuersignal von 1,8 V und 0 V zugeführt. Mit einer `op`-Simulation wurden die Knoten berechnet und die Spannung am Ausgang aufgezeichnet. In der Simulation wurden Temperatur, Versorgungsspannung (Vcontrol) und die FET-Parameter mit Mismatch berücksichtigt. Die gemessenen Daten können in eine Textdatei geschrieben und mit Octave geplottet werden.  

![DAC_SW_DC_SW](./img/tb_dac_switch_dc_switching.png)  

![DAC_SW_DC_SW_PLOT](./img/v_low_v_high_op_dac_switch.jpg)  

Das transiente Verhalten kann ebenfalls simuliert werden. Dabei sollte der Querstrom beobachtet werden. Dieser liegt bei einer Ansteuerung mit 1 ns $T_{rise}$ bei ca. 210 $\mu A$. Eine Optimierung ist möglich, wird aber zum aktuellen Zeitpunkt als ausreichend angesehen.  

![DAC_SW_TRAN_SHOOT_THROUGH](./img/tb_dac_switch_trans_sw.png)  

Typischerweise werden Inverter mit einer DC-Analyse verifiziert. Die folgenden Abbildungen stammen aus [1], Kapitel 11.  

![inverter_spec](./img/inv_charact_lit_fig_11_2_11_4.png)  

Der DAC-Schalter wurde ebenfalls mit einer DC-Analyse verifiziert. Das transiente Verhalten ist jedoch deutlich pessimistischer als die DC-Analyse. Simulationen wurden auch mit anderen Corners (`ff`, `sf`, `fs`) durchgeführt. Dabei wurde jedoch nie mehr als 210 $\mu A$ gemessen.  

![dc_dac_switch](./img/tb_dac_switch_dc_transfer.png)  

### Toplevel DAC-Simulation  

Der Schalter für den DAC und die entsprechenden Widerstände wurden ausgewählt. Diese müssen nun mittels hierarchischen Schaltplänen zu einem Top-Level-Spice-Block zusammengesetzt werden. Mit diesem Modell kann die Performance des DACs in einer Testbench ermittelt werden.  
Für den DAC-Schalter wurde bereits ein Modell erstellt, ebenso für die Widerstände. Diese beiden Blöcke wurden in einem Schaltplan verbunden, woraus erneut ein Modell generiert wurde. Die folgende Abbildung zeigt das Schema:  

![r2r_dac_xschem](./img/R2R_DAC_xschem.png)  

Mit dem Modell wurde eine Testbench erstellt. `xschem` bietet die Möglichkeit, Spice-Quellen mit einer Metasprache, dem `utile Stimuli Editor`, zu beschreiben. Dies vereinfacht die Erstellung der `PWL Vsource`. Der folgende Ausschnitt setzt alle Spannungen `v_b[0:7]` nach 5 ns auf 0. Nach weiteren 5 ns wird `v_b0` auf logisch `1` gesetzt. Das logische `1` kann mit einem Spice-Parameter festgelegt werden. In diesem Fall entspricht es der Betriebsspannung von 1,8 V.  

```plaintext
beginfile stimuli_tb_dac_codes.cir

s 5
set v_b0 0
set v_b1 0
set v_b2 0
set v_b3 0
set v_b4 0
set v_b5 0
set v_b6 0
set v_b7 0

s 5
set v_b0 1


```
Die Quellen werden in der Datei `stimuli_tb_dac_codes.cir` geschrieben. Im Testbench-Code wird diese Datei inkludiert.
Mit Python kann eine `utile Stimuli`-Datei für alle 256 Codewörter erstellt werden. Der folgende Code zeigt die benötigte Schleife:

```Python
for i in range(256):

    print("")
    print("s 5")

    bin_str = f"{i:08b}"
    for j in range(8):
        print(f"set v_b{j} {bin_str[7-j]}")
```

Die Funktion des DACs kann initial überprüft werden. Eine Testbench wurde erstellt, die die Stimuli-Datei lädt und den DAC entsprechend verbindet. Der DAC scheint korrekt zu funktionieren. Es sind auch die typischen Umschaltspitzen bei der Hälfte und beim Viertel zu erkennen. Diese entstehen durch den Signalwechsel am Eingang des DACs.


![r2r_dac_tb](./img/r2r_dac_trans_data.png)

Anschliessend wurde der mittlere Übergang vergrössert dargestellt. Beim Wechsel vom Codewort 0x7F auf 0x80 werden einige Zwischenwerte durchlaufen:

![r2r_dac_tb_zoom](./img/dac_switch_7F_80.png)


In der `tran`-Simulation wird alle 5 ns der Eingangscode gewechselt. Kurz vor dem Wechsel soll eine Messung durchgeführt werden, die zur Performance-Verifizierung des DACs verwendet wird.  

In der Testbench des DACs werden die Ausgangswerte in eine `raw`-Datei gespeichert. `ngspice` kann diese `raw`-Datei einlesen und nachträglich Messungen ausführen.  

Im File `dac_perf_sim.cir` werden die Simulatoranweisungen für die Messung geschrieben. Die Messungen werden in eine Textdatei ausgegeben. Nachfolgend ein Ausschnitt der Simulatoranweisungen:  

```spice
.control
*.... other code here

load simulation/tb_dac_performance.raw

repeat $&sim_loops

    * set the tran sim run
    setplot tran{$&plotnr}
    repeat 256
        
        meas tran v_dac find v(dac_out) at=$&tm

        let dac_values[index] = v_dac
        let x_ax[index] = index
        let tm = tm + 5n
        let index = index + 1

    end
* .... other code here

wrdata dac_data.txt dac_values vs x_ax
```

Am Simulator kann dieses File mitgegeben werden:

```sh
$> ngspice -i simulation/dac_perf_sim.cir -a
```

Aus diesen Messdaten kann dann die Integral Nonlinearity (INL) und die Differential Nonlinearity (DNL) berechnet werden.

Die DNL kann mit folgender Formel bestimmt werden:

$$
DNL(i) = \frac{V_{out}(i+1) - V_{out}(i)}{V_{LSB}} - 1
$$

Die INL kann mit folgender Formel bestimmt werden:

$$
INL(i) = \frac{V_{out}(i) - V_{ideal}(i)}{V_{LSB}}
$$

Das erstellte Textfile kann mit Python eingelesen und die entsprechenden Werte können berechnet werden.  

Die folgenden Plots entstanden mit dem Python-Skript `dac_perf.py` im Ordner `xschem/python`.

![dac_perf_v1](./img/dac_performance_v1.png)

### Referenzen  

[1] Carusone, T. C., Johns, D., Martin, K. (2012). *Analog Integrated Circuit Design*. Vereinigtes Königreich: Wiley.  
