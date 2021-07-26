# Kvantové počítání v jazyce Python
Tato lekce ... lorem ...

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



## 2. Matematické základy

### 2.1 Pravděpodobnost

P(A) = pravděpodobnost (šance), že nastane jev A (např.: dnes bude pršet). Uvádí se od 0 do 1, kde 0 je 0 % a 1 je 100 %.

P(A and B) = pravděpodobnost, že nastane jev A a B zároveň (např:. dnes bude pršet a také si dnes zlomím nohu).

P( (A and B) or C) = pravděpodobnost, že nastane jev A a B zároveň nebo nastane jev C, nebo nastane A and B a C zároveň.

P(A and B) = P(A) * P(B), pak A a B jsou nezávislé jevy (vůbec spolu nesouvisí). Pokud bude dnes pršet, tak je větší šance, že si zlomím nohu. Tyto dva jevy spolu
souvisí. Avšak pravděpodobnost, že sousedka bude snídat ovesné vločky a pravděpodobnost, že dnes naleznu draka na střeše spolu téměř nesouvisí (leda by ho ty ovesné
vločky přilákaly). Takové jevy budou tedy nezávislé a celkové pravděpodobnost, že sousedka bude jíst vločky a drak mi přistane na střeše je součin pravděpodobností
obou jevů nezávisle na sobě.
 
P(A and B) = 0, pak A a B jsou vzájemně výlučné jevy. Takové jevy se negují. Šance že bude dnes pršet a zároveň ve stejný čas nebude pršet je nulová, jelikož tato
kombinace jevů nemůže nastat. Nebo například šance, že zítra vyjde nový Fallout, a šance, že bude bez bugů je také vzájemně výlučné :) ...

P(A or B) = P(A) + P(B) u vzájemně výlučných jevů. Nemohou nastat oba zároveň, ale může nastat alespoň jeden z nich. Nemůže nastat, že bude a nebude pršet zároveň, 
ale může nastat, že bude buď pršet nebo nebude pršet. Pravděpodobnosti se sčítají (výsledek může být klidně 100 % jako ve zmíněném příkladě).

P(A or B) = P(A) + P(B) - P(A and B) u nezávislých jevů. Nezávislé jevy se dějí nezávislé na druhém, proto je nutné odečíst od výsledku pravděpodobnost jejich
vzájemného nastání. Pokud jsem se nedohodl s kamarádem, že půjdeme dnes do hospody, pak je šance, že se tam oba setkáme na sobě zcela nezávislá. Tyto jevy se
nevylučují, může nastat jeden z nich nebo oba zároveň. Pro výpočet toho, zda bude alespoň jeden z nás v hospodě, je nutné ze součtu pravděpodobností odečíst
šanci jevu, že dorazíme oba zároveň.

### 2.2 Statistika

#### Statistický soubor

TODO

Př.: statistický soubor obsahuje následující čísla [7, 3, 1, 4, 5]

#### Základní statistické ukazatele

střední hodnota - suma všech čísel / počet čísel = (7 + 3 + 1 + 4 + 5) / 5 = 4

medián - hodnota uprostřed seřazeného souboru čísel = medián [1, 3, 4, 5, 7] = 4

minimum - nejmenší hodnota ve statistickém souboru = 1

maximum - největší hodnota ve statistickém souboru = 7

#### Rozptyl

rozptyl (variance)- jak daleko jsou čísla od sebe? - suma (rozdílu hodnot od střední hodnoty)^2 
= (7-4)^2 + (3-4)^2 + (1-4)^2 + (4-4)^2 + (5-4)^2 = 9 + 1 + 9 + 1 = 20

#### Směrodatná odchylka

směrodatná odchylka (standard deviation) - jak moc se průměrně odchylují hodnota od střední hodnoty, počítá se jako odmocnina z rozptylu = sqrt(20)

### 2.3 Komplexní čísla

#### Imaginární jednotka

Čísla s přidanou imaginární jednotkou (nadstavba nad reálnými čísly) ve tvaru (a + bi). Pro imaginární jednotku platí vzorce: 
i^0 = 1, i^1 = i, i^2 = -1, i^3 = -i, i^4 = i^0.

Lze díky nim provádět odmocninu ze záporných čísel (pokud jsou čísly komplexními), např.: sqrt(-4) = sqrt(i^2 * 4) = 2i, kde jsme odmocňovali číslo (0 + 4i^2). 

#### Aritmetika komplexních čísel

(a + bi) + (c + di) = ( (a+c) + (b+d)i ), př.: (1 + 2i) + (2 + 3i) = (3 + 5i) 
(a + bi) - (c + di) = ( (a-c) + (b-d)i ), př.: (1 + 2i) - (2 + 3i) = (-1, -i)
c * (a + bi) = (c*a + c*bi), př.: 2*(1 + 2i) = (2 + 4i)
(a + bi) / c = (a/c + bi/c), př.: (1 + 2i)/2 = (0.5 + i)
i * (a + bi) = (ai + bi*i), př.: i * (3 + 2i) = (3i + 2i*i) = (-2 + 3i)
(a + bi) * (c + di) = (a*c + a*di + bi*c a bi*di), př.: (1 + 2i) * (2 + 3i) = (2 + 3i + 4i + 6i^2) = (2 + 7i -6) = (-4 + 7i)

#### Komplexní doplněk (complex conjugate)

(a + bi) -> doplněk = (a - bi), mění se znaménko komplexní části

#### Velikost komplexniho čísla (squared magnitude)

|a + bi|^2 = a^2 + b^2

platí vzorec, že komplexní číslo * komplexní doplněk k číslu = velikost komplexního čísla
(a + bi) * (a - bi) = a^2 - a*bi + a*bi - (bi)^2 = a^2 - (b^2)*(i^2)  = a^2 + b^2


### 2.4 Matice



### 2.5 Maticové operace



### 2.6 Speciální typy matic



### 2.7 Lineární transformace



## 3. Fyzikální základy


## 4. Kvantové algoritmy


### 4.1. Bernstein Vazirai Algorithm


### 4.2. Deutsch Algorithm 


### 4.3 Grover's Algorithm


### 4.4 Shor's Algorithm


