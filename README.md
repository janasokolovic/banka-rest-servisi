## **Opis projekta**

Projekat omogućava rad sa više resursa: **Klijent, Račun, Kartica, TipKartice, TipRačuna, Transakcija, Zaposleni, Kredit.**  
Za svaki resurs implementirane su **CRUD** operacije (Create, Read, Update, Delete), uz validaciju, obradu izuzetaka i logovanje.

---

## **Tehnologije i alati**

- MuleSoft Anypoint Studio  
- RAML (RESTful API Modeling Language)  
- MySQL baza podataka  
- JSON i XML formati razmene podataka  


---



## **POST metode**

Svaka POST metoda obezbeđuje:  
- vraćanje greške ako nedostaje podatak ili je pogrešnog tipa,  
- vraćanje greške ako se unese nepostojeći strani ključ,  
- obradu duplih vrednosti za podatke koji moraju biti jedinstveni (npr. JMBG, username, broj računa).  

**POST: TRANSAKCIJA** – dodaje novu transakciju u bazu.  
Svaka transakcija se upisuje u fajl sa prefiksom *internalERP* u XML formatu (lokacija: `src/main/resources/internalERP`).  
Ako je transakcija tipa *prenos* i iznos veći od 100, dodatno se upisuje i u JSON fajl sa prefiksom *chineseERP* (lokacija: `src/main/resources/chineseERP`).  
U tom slučaju, vrednost iznosa se u bazi i fajlu duplira.  


## **PUT metode**

Svaka PUT metoda obezbeđuje:  
- vraćanje greške ako nedostaje podatak ili je pogrešnog tipa,  
- vraćanje greške ako se unese nepostojeći strani ključ,  
- vraćanje odgovora da li je podatak ažuriran ili kreiran kao novi.  

**PUT** metode proveravaju da li podatak postoji u bazi:  
- ako postoji – ažurira se,  
- ako ne postoji – dodaje se kao novi.  

---

## **GET metode**

Svaka GET metoda:  
- vraća sve podatke iz tabele,  
- vraća poruku ako tabela nema nijedan podatak.  

**GET: KLIJENT** – omogućava filtriranje po headeru `active` (true / false).  
Ako je uneta neka druga vrednost, vraća se poruka o grešci.  
Ako header nije naveden, vraćaju se svi klijenti.  


---

## **GET BY ID metode**

Svaka GET BY ID metoda vraća podatak po ID-u i:  
- vraća poruku ako podatak ne postoji u bazi,  
- upisuje preuzeti podatak u log fajl ako je potrebno.  

**GET BY ID: KLIJENT** – upisuje svaki pronađeni klijent u fajl `klijenti_log.json`.  
Isto važi za ostale entitete: **Račun, Kartica, TipKartice, TipRačuna, Transakcija, Zaposleni, Kredit.**

---

## **DELETE metode**

Svaka DELETE metoda:  
- briše podatak po ID-u,  
- vraća odgovor o uspehu brisanja,  
- ako ID ne postoji, vraća poruku o grešci,  
- ako je podatak strani ključ u drugim tabelama, brišu se i povezani podaci.  

---

## **Struktura baze podataka**

Baza podataka obuhvata sledeće tabele:  
- **Klijent** – podaci o korisnicima (ID, ime, prezime, aktivnost, pol, korisničko ime, datum rođenja)  
- **Račun** – povezan sa klijentom  
- **Kartica** – povezana sa računom  
- **TipKartice** i **TipRačuna** – referentne vrednosti  
- **Transakcija** – sadrži sve transakcije i povezana polja  
- **Zaposleni** i **Kredit** – dodatni entiteti sistema  

---

## **Statusni kodovi i greške**

- **200 OK** – uspešna operacija  
- **201 Created** – novi resurs je kreiran  
- **400 Bad Request** – neispravan zahtev (nedostaje podatak, pogrešan tip)  
- **404 Not Found** – nepostojeći podatak  
- **409 Conflict** – duplikat podataka  
- **500 Internal Server Error** – greška u sistemu  

---

## **Naučene veštine i znanja primenjena kroz projekat**

- Dizajn i implementacija REST API servisa  
- Korišćenje HTTP metoda i statusnih kodova  
- Integracija sistema sa ERP okruženjima (XML / JSON zapis)  
- Validacija podataka i obrada izuzetaka  
- Rad sa bazom podataka i SQL skriptama  
- Verziona kontrola i rad sa GitHub platformom  

