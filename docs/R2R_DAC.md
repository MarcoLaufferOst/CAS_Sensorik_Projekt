# R2R DAC

Der DAC wird zur Erzeugung der Referenz-Komparatorspannung verwendet. Für das Design soll ein einfacher DAC ohne Bufferstufe (OP-Amp) erstellt werden.  
Nachfolgend ist eine schematische Darstellung des DACs zu sehen:  

![DAC_Schem](./img/R2R_DAC_Schem.png)  

Der DAC soll im SKY130-Prozess gefertigt werden. Die Widerstände sind in der Readthedocs-Dokumentation des PDK spezifiziert. Siehe [readthedocs](https://skywater-pdk.readthedocs.io/en/main/rules/device-details.html#generic-resistors).  

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
