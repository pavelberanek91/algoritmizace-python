# Kvantové počítání v jazyce Python
Tato lekce ... lorem ...

## 1. Informatické základy
### 1.1. Bit vs. Qubit
#### Bit
Bit je základní reprezentant informace, nabývající diskrétních hodnot {0,1}. Tyto hodnoty vyplývají s z elektronické podstaty (procesor je složen z tranzistorů), které
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

#### Qubit  



## 2. Matematické základy

### 2.1 Pravděpodobnost

### 2.2 Statistika

### 2.3 Komplexní čísla

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


