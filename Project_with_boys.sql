 CREATE TABLE firma (
 id INT PRIMARY KEY AUTO_INCREMENT,
 nazev VARCHAR(100)
 );
 
 CREATE TABLE vyrobce (
 id INT PRIMARY KEY AUTO_INCREMENT,
 nazev VARCHAR(100)
 ); 
 
  CREATE TABLE osoba (
 id INT PRIMARY KEY AUTO_INCREMENT,
 jmeno VARCHAR(100),
 firma_id INT,
 email VARCHAR(100),
 FOREIGN KEY (firma_id) REFERENCES firma(id)
 ); 
 
  CREATE TABLE skoleni_typ (
 id INT PRIMARY KEY AUTO_INCREMENT,
 vyrobce_id INT,
 typ VARCHAR(100),
 popis VARCHAR(160),
 detail TEXT,
 FOREIGN KEY (vyrobce_id) REFERENCES vyrobce(id)
 );
 
  CREATE TABLE skoleni (
 id INT PRIMARY KEY AUTO_INCREMENT,
 datum_konani DATE,
 kapacita INT,
 stav ENUM ("planovane", "uskutocnene", "zrusene"),
 mitto VARCHAR (160),
 typ_id INT, 
 FOREIGN KEY (typ_id) REFERENCES skoleni_typ(id)
);
  
CREATE TABLE ucastnici (
-- id INT PRIMARY KEY AUTO_INCREMENT,
 skoleni_id INT,
 osoba_id INT,
dokonceno BOOLEAN,
nahradnik BOOLEAN,
 ucast BOOLEAN,
 PRIMARY KEY (skoleni_id, osoba_id),
 FOREIGN KEY (skoleni_id) REFERENCES skoleni(id),
  FOREIGN KEY (osoba_id) REFERENCES osoba(id)
  );

insert into vyrobce (nazev) values 
("Control4"),
("AMX"),
("Crestron"),
("Savant"),
("Loxone");

insert into firma (nazev) values
("ALSYKO security, s.r.o."),
("Aremic s.r.o."),
("Homesystems, s.r.o"),
("KAWAD s.r.o."),
("ML Systems s.r.o.");

INSERT INTO osoba (firma_id, jmeno, prijmeni, email)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'jane.smith@example.com'),
(4, 'Peter', 'Parker', 'peter.parker@example.com'),
(5, 'Clark', 'Kent', 'clark.kent@example.com'),
(2, 'Bruce', 'Wayne', 'bruce.wayne@example.com'),
(3, 'Diana', 'Prince', 'diana.prince@example.com'),
(2, 'Tony', 'Stark', 'tony.stark@example.com'),
(1, 'Steve', 'Rogers', 'steve.rogers@example.com'),
(2, 'Natasha', 'Romanoff', 'natasha.romanoff@example.com'),
(3, 'Wanda', 'Maximoff', 'wanda.maximoff@example.com'),
(2, 'Barry', 'Allen', 'barry.allen@example.com'),
(1, 'Arthur', 'Curry', 'arthur.curry@example.com'),
(3, 'Hal', 'Jordan', 'hal.jordan@example.com'),
(5, 'Victor', 'Stone', 'victor.stone@example.com'),
(1, 'Shuri', 'Udaku', 'shuri.udaku@example.com'); 

INSERT INTO skoleni_typ (typ, vyrobce_id, popis, detail)
VALUES
('Bezpečnostné školenie', 1, 'Základné školenie o bezpečnosti na pracovisku.', 'Toto školenie pokrýva základy bezpečnosti vrátane prvej pomoci a núdzových postupov.'),
('Technické školenie', 2, 'Pokročilé technické školenie pre odborníkov.', 'Školenie zahŕňa podrobnosti o údržbe a opravách technických zariadení.'),
('Školenie pre manažérov', 3, 'Manažérske školenie pre stredný a vyšší manažment.', 'Zamerané na vedenie tímu, plánovanie a komunikáciu s pracovníkmi.'),
('Počítačové školenie', 4, 'Kurz na zlepšenie počítačových zručností.', 'Obsahuje základy používania kancelárskych balíkov a internetu.'),
('Školenie zamerané na komunikáciu', 5, 'Zlepšovanie komunikačných schopností pre pracovníkov.', 'Zamerané na efektívnu komunikáciu v rámci firmy a so zákazníkmi.'),
('Školenie BOZP', 1, 'Školenie o bezpečnosti a ochrane zdravia pri práci.', 'Podrobné školenie o prevencii pracovných úrazov a chorôb z povolania.'),
('Školenie prvej pomoci', 2, 'Praktické školenie o poskytovaní prvej pomoci.', 'Zamerané na základné postupy pri úrazoch a iných zdravotných komplikáciách.'),
('IT školenie', 3, 'Pokročilé IT školenie pre špecialistov.', 'Témami sú programovanie, sieťové technológie a kybernetická bezpečnosť.'),
('Školenie zákazníckeho servisu', 4, 'Zlepšovanie služieb pre zákazníkov.', 'Obsahuje základy komunikácie so zákazníkmi, riešenie problémov a zvyšovanie spokojnosti.'),
('Marketingové školenie', 5, 'Školenie pre marketingových špecialistov.', 'Zamerané na digitálny marketing, sociálne siete a reklamnú stratégiu.');

INSERT INTO skoleni (typ_id, datum_konani, kapacita, stav, misto)
VALUES
(1, '2024-11-10', 30, 'planovane', 'Bratislava'),
(2, '2023-10-25', 20, 'uskutocnene', 'Praha'),
(3, '2024-12-01', 25, 'planovane', 'Kosice'),
(4, '2023-09-15', 15, 'uskutocnene', 'Brno'),
(5, '2024-10-20', 50, 'zrusene', 'Zvolen'),
(6, '2024-11-05', 40, 'planovane', 'Zilina'),
(7, '2023-08-30', 35, 'uskutocnene', 'Plzen'),
(8, '2024-12-20', 60, 'planovane', 'Ostrava'),
(9, '2024-07-10', 10, 'zrusene', 'Banska Bystrica'),
(10, '2023-10-01', 45, 'uskutocnene', 'Olomouc');

INSERT INTO ucastnici (skoleni_id, osoba_id, dokonceno, nahradnik, ucast)
VALUES
(1, 1, TRUE, FALSE, TRUE),
(1, 2, TRUE, FALSE, TRUE),
(2, 3, TRUE, FALSE, TRUE),
(2, 4, TRUE, FALSE, TRUE),
(3, 5, FALSE, TRUE, FALSE),
(3, 6, FALSE, TRUE, FALSE),
(4, 7, TRUE, FALSE, TRUE),
(5, 8, FALSE, TRUE, FALSE),
(5, 9, FALSE, TRUE, FALSE),
(6, 10, TRUE, FALSE, TRUE),
(7, 11, TRUE, FALSE, TRUE),
(7, 12, FALSE, TRUE, FALSE),
(8, 13, TRUE, FALSE, TRUE),
(9, 14, FALSE, TRUE, FALSE),
(9, 15, FALSE, TRUE, FALSE),
(10, 1, TRUE, FALSE, TRUE),
(10, 2, TRUE, FALSE, TRUE),
(1, 3, TRUE, FALSE, TRUE),
(4, 4, TRUE, FALSE, TRUE),
(5, 5, FALSE, TRUE, FALSE);



 