# Kvantové počítání v jazyce Python
Tato lekce ... lorem ...

## Materiály

TODO ... quiskit dokumentace, pro pochopení je nutné umět matematické a fyzikální základy, které jsou v této lekci.

## 1. Informatické základy

### 1.1 Bit
Bit je základní reprezentant informace, nabývající diskrétních hodnot {0,1}. Tyto hodnoty vyplývají z elektronické podstaty (procesor je složen z tranzistorů), které
detekují elektrický proud nebo jeho absenci. Když napíšeme nějaký program (např.: print("hello world")), pak je převeden na sekvenci bitů.

Př.: Obrázek ve stupních šedi je matice celých čísel v rozsahu <0, 255>. Hodnota pixelu na konkrétní souřadnici (x,y) je 26. Pak tato hodnota je reprezentována
binární informací 11010, protože 0*2^0 (=0) + 1*2^1 (=2) + 0*2^2 (=0) + 1*2^3 (=8) + 1*2^4 (=16), což je po sečtení 2 + 8 + 16 = 26. Obdobným způsobem můžeme
reprezentovat barevný obrázek, hlas, video, zprávy na sociálních sítích, programový kód videoher, atd.

Pro zkrácený zápis se informace reprezentují v hexadecimální soustavě (šestnáctková). Naše hodnota pixelu 26 v decimální (desítkové) soustavě by byla rovna hodnotě
1A, jelikož A*16^0 (=10) + 1*16^1 (=16) = 10 + 16 = 26, kde A představuje decimálně hodnotu 10. Hexadecimální soustava má tedy více symbolů než naše běžně používaná
desítková (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A=10, B=11, C=12, D=13, E=14, F=15).

Písmena se dají vyjádřit také sekvencí binárních (nebo hexadecimálních) symbolů. Toto není jednoznačně dáno. Každý stát, organizace, parta přátel, se může svobodně
rozhodnout, jakou sekvencí nul a jedniček bude reprezentovat jaké písmeno. Proto existují určité standardy (kódování), např.: ASCII, UTF-8, atd.). Například písmenko
malé a je reprezentováno v ASCII binární sekvencí 01100001 (dáno tabulkou, nikoliv výpočtem jako v předchozích příkladech). Tím jsme schopni ukládat text do operační 
paměti, úložné paměti, posílat ho po komunikační síti a transformovat ho programy, jelikož jsme schopni ho fyzikálně vyjádřit (jinak, než inkoustem na papíře). 
Pomocí scanneru jsme schopni i text v jedné fyzikální podstatě převést na stejný text ale v jiné fyzikální podstatě. 

Obdobně jsem schopen reprezentovat obraz našeho světa pomocí digitálního fotoaparátu nebo videokamery do digitální podoby, se kterou si mohu manipulovat jakýmkoliv
způsobem, kterým uznám za vhodný. Mohu na obraz pokládat obrazové filtry (odbarvení, rozmazání, změna kontrastu), vyhledávat v obrazu objekty a označovat je, aj.

### 1.2 Qubit  

### 1.3 Kvantový hardware

#### Superconducting qubits (Google, IBM, Rigetti)
Čipy, které jsou snadno konstruovatelné, jelikož jsou quibity reprezentované elektrickým proudem, avšak je těžké udržet kvantové stavy (šum z okolí ho naruší). 
Z toho důvodu jsou čipy extrémně chlazené, aby se kvantové chování projevilo. Pracují aktuálně s 60 až 100 quibity.

#### Photonic quantum computer (Xanadu, PsiQuantum)
Používají fotony pro vyjádření quibitu a ty jsou udržitelné i při pokojové teplotě, avšak jsou velké při velkém počtu quibitů. Umožňují aktuálně až tisíce quibitů.

#### Iontové pasti (Honeywell, IonQ)
Qubity jsou realizovány ionty (atom s chybějícím elektronem). Pomalejší, ale stabilnější technologie.

#### DWave (DWave)
Hodně quibitů (i 5000) a prodává se již pro komerční účely (hotový počítač), avšak konstruuje se pro nějaký algoritmus (nelze přeprogramovat).

## 2. Matematické základy

### 2.1 Pravděpodobnost

`P(A)` = pravděpodobnost (šance), že nastane jev A (např.: dnes bude pršet). Uvádí se od 0 do 1, kde 0 je 0 % a 1 je 100 %.

`P(A and B)` = pravděpodobnost, že nastane jev A a B zároveň (např:. dnes bude pršet a také si dnes zlomím nohu).

`P( (A and B) or C)` = pravděpodobnost, že nastane jev A a B zároveň nebo nastane jev C, nebo nastane A and B a C zároveň.

`P(A and B) = P(A) * P(B)`, pak A a B jsou nezávislé jevy (vůbec spolu nesouvisí). Pokud bude dnes pršet, tak je větší šance, že si zlomím nohu. Tyto dva jevy spolu
souvisí. Avšak pravděpodobnost, že sousedka bude snídat ovesné vločky a pravděpodobnost, že dnes naleznu draka na střeše spolu téměř nesouvisí (leda by ho ty ovesné
vločky přilákaly). Takové jevy budou tedy nezávislé a celkové pravděpodobnost, že sousedka bude jíst vločky a drak mi přistane na střeše je součin pravděpodobností
obou jevů nezávisle na sobě.
 
`P(A and B) = 0`, pak A a B jsou vzájemně výlučné jevy. Takové jevy se negují. Šance že bude dnes pršet a zároveň ve stejný čas nebude pršet je nulová, jelikož tato
kombinace jevů nemůže nastat. Nebo například šance, že zítra vyjde nový Fallout, a šance, že bude bez bugů je také vzájemně výlučné :) ...

`P(A or B) = P(A) + P(B)` u vzájemně výlučných jevů. Nemohou nastat oba zároveň, ale může nastat alespoň jeden z nich. Nemůže nastat, že bude a nebude pršet zároveň, 
ale může nastat, že bude buď pršet nebo nebude pršet. Pravděpodobnosti se sčítají (výsledek může být klidně 100 % jako ve zmíněném příkladě).

`P(A or B) = P(A) + P(B) - P(A and B)` u nezávislých jevů. Nezávislé jevy se dějí nezávislé na druhém, proto je nutné odečíst od výsledku pravděpodobnost jejich
vzájemného nastání. Pokud jsem se nedohodl s kamarádem, že půjdeme dnes do hospody, pak je šance, že se tam oba setkáme na sobě zcela nezávislá. Tyto jevy se
nevylučují, může nastat jeden z nich nebo oba zároveň. Pro výpočet toho, zda bude alespoň jeden z nás v hospodě, je nutné ze součtu pravděpodobností odečíst
šanci jevu, že dorazíme oba zároveň.

### 2.2 Statistika

#### Statistický soubor a jeho charakteristiky

Statistický soubor je množina objektů, na kterých zkoumáme určitý znak, vyjádření číslem. S hodnoty těchto znaků následně počítáme. Např.: soubor mohou být vybraní
lidé z města Ústí nad Labem, kteří se zúčastní výzkumu v behaviorální laboratoři FSE UJEP. Znak, který zkoumáme, je reakční doba vyjádřená v milisekundách. Nad
hodnoty znaků ze souboru následně provádíme měření určitých charakteristik, která nám o souboru vypovídají nějakou informaci.

Mezi nejzákladnější charakteristiky, které se používají v mnohých vědách, patří:
1. Střední hodnota
2. Medián
3. Minimum
4. Maximum
5. Rozptyl (anglicky variance)
6. Směrodatná odchylka (anglicky standard deviation)

#### Střední hodnota
Střední hodnota je suma všech čísel podělená počtem čísel.
```
soubor = [7, 3, 1, 4, 5]
stredni_hodnota = sum(soubor)/len(soubor)
```
#### Medián
Medián je hodnota uprostřed seřazeného souboru čísel. V případě sudého počtu znaků v souboru je nutné vzít průměr z dvou prostředních prvků.
```
soubor = [7, 3, 1, 4, 5]
soubor.sort()
n = len(soubor)

if n%2 == 0:
    median = (soubor[int(n/2)-1] + soubor[int(n/2)])/2
else:
    median = soubor[int(n/2)]
```

#### Minimum
Minimum představuje nejmenší hodnotu ve statistickém souboru.
```
soubor = [7, 3, 1, 4, 5]
minimum = min(soubor)
```
#### Maximum
Maximum představuje největší hodnotu ve statistickém souboru
```
soubor = [7, 3, 1, 4, 5]
maximum = max(soubor)
```

#### Rozptyl
Rozptyl představuje míru toho, jak daleko jsou čísla od sebe ve statistickém souboru a je počítán jako suma kvadratů rozdílů hodnot od střední hodnoty 
```
soubor = [7, 3, 1, 4, 5]
mu = sum(soubor)/len(soubor) #střední hodnota, typicky se značí řeckým písmenkem mu [mí]
rozptyl = 0
for x in soubor:
    rozptyl += (x-mu)**2
```

#### Směrodatná odchylka
Směrodatná odchylka představuje míru toho, jak moc se průměrně odchylují hodnota od střední hodnoty. Počítá se jako odmocnina z rozptylu.
```
import math
soubor = [7, 3, 1, 4, 5]
mu = sum(soubor)/len(soubor)
rozptyl = 0
for x in soubor:
    rozptyl += (x-mu)**2
smerodatna_odchylka = math.sqrt(rozptyl)
```

### 2.3 Komplexní čísla

#### Imaginární jednotka

Čísla s přidanou imaginární jednotkou (nadstavba nad reálnými čísly) ve tvaru (a + bi). Pro imaginární jednotku platí vzorce: 
* i^0 = 1
* i^1 = i
* i^2 = -1
* i^3 = -i
* i^4 = i^0.

Lze díky nim provádět odmocninu ze záporných čísel (pokud jsou čísly komplexními), např.: sqrt(-4) = sqrt(i^2 * 4) = 2i, kde jsme odmocňovali číslo (0 + 4i^2). 

#### Aritmetika komplexních čísel

Součet dvou imaginárních čísel
```
(a + bi) + (c + di) = ( (a+c) + (b+d)i )
př.: (1 + 2i) + (2 + 3i) = (3 + 5i) 
```

Rozdíl dvou imaginárních čísel
```
(a + bi) - (c + di) = ( (a-c) + (b-d)i )
př.: (1 + 2i) - (2 + 3i) = (-1, -i)
```

Součin reálného čísla s imaginárním číslem
```
c * (a + bi) = (c*a + c*bi)
př.: 2*(1 + 2i) = (2 + 4i)
```

Podíl imaginárního čísla reálným číslem
```
(a + bi) / c = (a/c + (b/c)i)
př.: (1 + 2i)/2 = (0.5 + i)
```

Součin imaginární jednotky a komplexního čísla
```
i * (a + bi) = (ai + bi*i)
př.: i * (3 + 2i) = (3i + 2i*i) = (-2 + 3i)
```

Součin dvou komplexních čísel
```
(a + bi) * (c + di) = (a*c + a*di + bi*c a bi*di)
př.: (1 + 2i) * (2 + 3i) = (2 + 3i + 4i + 6i^2) = (2 + 7i -6) = (-4 + 7i)
```
#### Komplexní doplněk (complex conjugate)

(a + bi) -> doplněk = (a - bi), mění se znaménko komplexní části

#### Velikost komplexniho čísla (squared magnitude)

```
|a + bi|^2 = a^2 + b^2
```

platí vzorec, že komplexní číslo * komplexní doplněk k číslu = velikost komplexního čísla

```
(a + bi) * (a - bi) = a^2 - a*bi + a*bi - (bi)^2 = a^2 - (b^2)*(i^2)  = a^2 + b^2
```

#### Dělení komplexního čísla komplexním číslem

Využívá se 3 aritmetických vlastnosti komplexních čísel:

1. dělení komplexního čísla reálným číslem je jednoduchá operace se vzorcem: (a + bi)/c = (a/c + (b/c)i)
2. velikost komplexního čísla je reálné číslo
3. velikost lze spočítat pomocí vynásobení komplexního čísla komplexním doplňkem.

```
(a + bi)/(c + di) = (a + bi)/(c + di) * (c - di)/(c - di) = (a + bi)*(c - di)/(c^2 + d^2) = (ac - a*di + c*bi + b*d)/(c^2 a d^2)
př.: (1 + 2i) / (2 + 3i) = (1 + 2i)/(2 + 3i) * (2 - 3i)/(2 - 3i) = (1*2 - 3i + 4i -6i^2)/(4 + 9) = (8 + i)/13 = (8/13 + i/13)
```

### 2.4 Matice

#### Maticová aritmetika

sčítání matic (u odečítání bude místo + znaménko -), čísla mohou být komplexní a platí pro ně aritmetika z předchozí části lekce.
```
|a b c|   |j k l|   |a+j b+k c+l|
|d e f| + |m n o| = |d+m e+n f+o|
|g h i|   |p q r|   |g+p h+q i+r|

     |(1+2i)   (3)|   |(3+2i) (4+4i)|   |(4 + 4i) (8 + 4i)|
př.: |(4)   (2+3i)| + |(-2)   (5)   | = |(2)      (7 + 3i)| 
```

škálování matice, j může být reálné nebo komplexní číslo
```
    |a b c|   |j*a j*b j*c|
j * |d e f| = |j*d j*e j*f|
    |g h i|   |j*g j*h j*i|

                |1 2|   |(1+2i)  (2+4i) |
př.: (1 + 2i) * |3 4| = |(3+6i)  (4+8i) |
                |5 6|   |(5+10i) (6+12i)|
```

násobení matic, čísla opět mohou být komplexní a platí pro ně aritmetika násobení komplexních čísel
```
|a b c|   |j k l|   | (a*j + b*m + c*p) (a*k + b*n + c*q) (a*l + b*o + c*r)|
|d e f| * |m n o| = | (d*j + e*m + f*p) (d*k + e*n + f*q) (d*l + e*o + f*r)|
|g h i|   |p q r|   | (g*j + h*m + i*p) (g*k + h*n + i*q) (g*l + h*o + i*r)|
```
výsledná matice bude mít tolik řádků, kolik první matice, a tolik sloupců, kolik druhá matice. Z toho vyplývá, že násobení matic neni komutativní A*B != B*A.

#### Tenzorový součin

```
            |a*c|
            |a*d|
|a|   |c|   |a*e|
|b| x |d| = |b*c|
      |e|   |b*d|
            |b*e|
```

### 2.5 Maticové operace



### 2.6 Speciální typy matic



### 2.7 Lineární transformace



## 3. Fyzikální základy


## 4. Kvantové algoritmy


### 4.1. Bernstein Vazirai Algorithm

Algoritmus, který ukazuje, že kvantové počítače umí být při řešení některých problémů efektivnější, než běžné počítače. Řekněme, že mámě nějaké binární číslo, např.:
1011011. Počítač má toto číslo uhodnout a může si pomoct nějakou logickou operací nad jednotlivými bity. Pokud použijeme operaci AND nad jednotlivými bity s druhou
hodnotou vždy 1, pak nám operace AND detekuje přítomnost nebo nepřítomnost jedničky.

```
??????? = 1011011

0000001      0000010    0000100
AND          AND        AND
???????   -> ??????? -> ???????  atd.
=            =          =
??????1      ?????11    ????011 
```

Pro sedmibitové binární číslo stačí počítači provést 7 AND operací, aby neznámé číslo odhalil. Berstein Vazirai algoritmus ukazuje, že kvantovému počítači stačí 1
operace pro odkrytí N-bitového čísla.


### 4.2. Deutsch Algorithm 


### 4.3 Grover's Algorithm


### 4.4 Shor's Algorithm


