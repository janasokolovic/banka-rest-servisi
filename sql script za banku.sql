-- Kreiranje baze
CREATE DATABASE IF NOT EXISTS banka;
USE banka;

-- Tabela Klijent
CREATE TABLE Klijent (
    KlijentID INT AUTO_INCREMENT PRIMARY KEY,
    Ime VARCHAR(50) NOT NULL,
    Prezime VARCHAR(50) NOT NULL,
    JMBG CHAR(13) UNIQUE NOT NULL,
    Adresa VARCHAR(100),
    Grad VARCHAR(50),
    Drzava VARCHAR(50),
    KontaktTelefon VARCHAR(20),
    Pol VARCHAR(10) CHECK (Pol IN ('male','female')),
    DatumRodjenja DATE,
    Aktivan TINYINT(1) NOT NULL DEFAULT 1,
    Username VARCHAR(50) UNIQUE NOT NULL
);
INSERT INTO Klijent (Ime, Prezime, JMBG, Adresa, Grad, Drzava, KontaktTelefon, Pol, DatumRodjenja, Aktivan, Username)
VALUES ('Jana', 'Sokolović', '1234567770123', 'Bulevar 1', 'Beograd', 'Srbija', '0612345678', 'female', '2000-05-15', 0, 'jana123');
select *
from racun
-- Tabela Zaposleni
CREATE TABLE Zaposleni (
    ZaposleniID INT AUTO_INCREMENT PRIMARY KEY,
    Ime VARCHAR(50) NOT NULL,
    Prezime VARCHAR(50) NOT NULL,
    JMBG CHAR(13) UNIQUE NOT NULL,
    Odjeljenje VARCHAR(50),
    KontaktTelefon VARCHAR(20)
);

-- Tabela TipRacuna
CREATE TABLE TipRacuna (
    TipRacunaID INT AUTO_INCREMENT PRIMARY KEY,
    Naziv VARCHAR(50) NOT NULL,
    Aktivno TINYINT(1) DEFAULT 1
);
select *
from KLIJENT
-- Tabela Racun
CREATE TABLE Racun (
    RacunID INT AUTO_INCREMENT PRIMARY KEY,
    BrojRacuna VARCHAR(30) UNIQUE NOT NULL,
    Stanje DECIMAL(15,2) NOT NULL DEFAULT 0,
    KlijentID INT,
    TipRacunaID INT,
    FOREIGN KEY (KlijentID) REFERENCES Klijent(KlijentID),
    FOREIGN KEY (TipRacunaID) REFERENCES TipRacuna(TipRacunaID)
);

INSERT INTO Racun (BrojRacuna, Stanje, KlijentID, TipRacunaID)
VALUES ('20250001', 1000.00, 1, 13);

SELECT *
FROM TRANSAKCIJA
-- Tabela TipKartice
CREATE TABLE TipKartice (
    TipKarticeID INT AUTO_INCREMENT PRIMARY KEY,
    Naziv VARCHAR(50) NOT NULL
);

-- Tabela Kartica
CREATE TABLE Kartica (
    KarticaID INT AUTO_INCREMENT PRIMARY KEY,
    BrojKartice VARCHAR(20) UNIQUE NOT NULL,
    DatumIsteka DATE NOT NULL,
    RacunID INT,
    TipKarticeID INT,
    FOREIGN KEY (RacunID) REFERENCES Racun(RacunID),
    FOREIGN KEY (TipKarticeID) REFERENCES TipKartice(TipKarticeID)
);

-- Tabela Kredit
CREATE TABLE Kredit (
    KreditID INT AUTO_INCREMENT PRIMARY KEY,
    Iznos DECIMAL(15,2) NOT NULL,
    PeriodOtplate INT NOT NULL,
    Kamata DECIMAL(5,2),
    KlijentID INT,
    RacunID INT,
    FOREIGN KEY (KlijentID) REFERENCES Klijent(KlijentID),
    FOREIGN KEY (RacunID) REFERENCES Racun(RacunID)
);

-- Tabela Transakcija
CREATE TABLE Transakcija (
    TransakcijaID INT AUTO_INCREMENT PRIMARY KEY,
    KlijentID INT,
    RacunID INT,
    Iznos DECIMAL(15,2) NOT NULL,
    Vrsta VARCHAR(20) CHECK (Vrsta IN ('uplata','isplata','prenos')),
    Datum DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (KlijentID) REFERENCES Klijent(KlijentID),
    FOREIGN KEY (RacunID) REFERENCES Racun(RacunID)
);

-- =========================
-- Unos podataka u tabelu Klijent
-- =========================
INSERT INTO Klijent (Ime, Prezime, JMBG, Adresa, Grad, Drzava, KontaktTelefon, Pol, DatumRodjenja, Aktivan, Username)
VALUES
('Aleksa', 'Petrovic', '1255567890123', 'Racanska 12', 'Bijeljina', 'BiH', '0621114785', 'male', '1980-05-12','0', 'peraP'),
('Maja', 'Panic', '1234567890124', 'Banjalucka 45', 'Bijeljina', 'BiH', '0621114786', 'female', '1990-08-20', 'majaP'),
('Boris', 'Duric', '1234567890125', 'Bulevar Oslobodjenja 7', 'Novi Sad', 'Srbija', '062187468', 'male', '1985-03-15', 'borisD'),
('Kristina', 'Djokic', '1234567890126', 'Carice Milice 9', 'Zrenjanin', 'Srbija', '0621114787', 'female', '1992-11-01', 'kristinaD'),
('Angelina', 'Todorovic', '1234567890127', 'Sime Milosevica 23', 'Valjevo', 'Srbija', '0621166785', 'female', '1988-07-22', 'angelinaT');
select *
from klijent
-- =========================
-- Unos podataka u tabelu Zaposleni
-- =========================
INSERT INTO Zaposleni (Ime, Prezime, JMBG, Odjeljenje, KontaktTelefon)
VALUES
('Mitar', 'Marinkovic', '2104199978000', 'sluzba za korisnike', '0655258559'),
('Mara', 'Tomic', '2104198978000', 'recepcija', '06878887885'),
('Sara', 'Katic', '0258198978000', 'finansije', '06222287885');

-- =========================
-- Unos podataka u tabelu TipRacuna
-- =========================
INSERT INTO TipRacuna (Naziv, Aktivno)
VALUES
('Tekuci', 1),
('Stedni', 0),
('Devizni', 1);

-- =========================
-- Unos podataka u tabelu Racun
-- =========================
INSERT INTO Racun (BrojRacuna, Stanje, KlijentID, TipRacunaID)
VALUES
('1002012101', 5000.00, 10, 8),
('1002055002', 15000.00, 2, 8),
('1002088003', 2500.00, 5, 8),
('1002088004', 10000.00, 5, 8),
('1002000005', 7500.00, 5, 8);
select *
from kredit
`banka`
delete from kartica
where kartica id in(8,24)
-- =========================
-- Unos podataka u tabelu TipKartice
-- =========================
INSERT INTO TipKartice (Naziv)
VALUES
('Debit'), 
('Kredit');
select *
from kredit
-- =========================
-- Unos podataka u tabelu Kartica
-- =========================
INSERT INTO Kartica (BrojKartice, DatumIsteka, RacunID, TipKarticeID)
VALUES
('1166221233345444', '2026-12-31', 29, 4),
('5699666677778778', '2025-06-30', 29, 3)
('9999000055452222', '2027-09-30', 9, 9);

-- =========================
-- Unos podataka u tabelu Kredit
-- =========================
INSERT INTO Kredit (Iznos, PeriodOtplate, Kamata, KlijentID, RacunID)
VALUES
(10330.00, 24, 5.5, 1, 29);
(5000.00, 12, 4.2, 3, 3),
(20000.00, 36, 6.0, 2, 2)

select *
from karitca


DELETE FROM klijent
where KlijentID = 55

 =========================
-- Unos podataka u tabelu Transakcija
-- =========================
INSERT INTO Transakcija (KlijentID, RacunID, Iznos, Vrsta)
VALUES
(1, 29, 2000.00, 'uplata'),
(2, 2, 1500.00, 'isplata'),
(3, 3, 500.00, 'prenos'),
(4, 4, 3000.00, 'uplata'),
(5, 5, 1000.00, 'isplata');
