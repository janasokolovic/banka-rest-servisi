## **Project Description**

The project provides operations for multiple resources: **Client, Account, Card, CardType, AccountType, Transaction, Employee, Loan.**  
Each resource implements full **CRUD** functionality (Create, Read, Update, Delete), along with data validation, exception handling, and logging.

---

## **Technologies and Tools**

- MuleSoft Anypoint Studio  
- RAML (RESTful API Modeling Language)  
- MySQL database  
- JSON and XML data exchange formats  

---

## **POST Methods**

Each POST method ensures:  
- returning an error if a required field is missing or of an incorrect type,  
- returning an error if a non-existing foreign key is entered,  
- handling duplicate values for fields that must be unique (e.g., JMBG, username, account number).  

**POST: TRANSACTION** – adds a new transaction to the database.  
Each transaction is written to a file with the *internalERP* prefix in XML format (location: `src/main/resources/internalERP`).  
If the transaction type is *transfer* and the amount exceeds 100, it is also written to a JSON file with the *chineseERP* prefix (location: `src/main/resources/chineseERP`).  
In such cases, the transaction amount is doubled in both the database and the file.  

---

## **PUT Methods**

Each PUT method ensures:  
- returning an error if a required field is missing or of an incorrect type,  
- returning an error if a non-existing foreign key is entered,  
- returning a response indicating whether the record was updated or newly created.  

**PUT** methods verify whether the record already exists in the database:  
- if it exists – it is updated,  
- if it does not exist – it is created as a new record.  

---

## **GET Methods**

Each GET method:  
- returns all records from the table,  
- returns a message if the table is empty.  

**GET: CLIENT** – allows filtering by the `active` header (true / false).  
If another value is provided, an error message is returned.  
If no header is provided, all clients are returned.  

---

## **GET BY ID Methods**

Each GET BY ID method retrieves a record by its ID and:  
- returns a message if the record does not exist in the database,  
- logs the retrieved record to a file when applicable.  

**GET BY ID: CLIENT** – logs each retrieved client into the `clients_log.json` file.  
The same logic applies to other entities: **Account, Card, CardType, AccountType, Transaction, Employee, Loan.**

---

## **DELETE Methods**

Each DELETE method:  
- deletes a record by its ID,  
- returns a response confirming successful deletion,  
- returns an error message if the ID does not exist,  
- deletes all related records if the data serves as a foreign key in other tables.  

---

## **Database Structure**

The database consists of the following tables:  
- **Client** – user data (ID, first name, last name, activity status, gender, username, date of birth)  
- **Account** – linked to the client  
- **Card** – linked to the account  
- **CardType** and **AccountType** – reference tables  
- **Transaction** – contains all transactions and related fields  
- **Employee** and **Loan** – additional entities within the system  

---

## **Status Codes and Error Handling**

- **200 OK** – operation successful  
- **201 Created** – new resource created  
- **400 Bad Request** – invalid request (missing or invalid field)  
- **404 Not Found** – record does not exist  
- **409 Conflict** – duplicate data entry  
- **500 Internal Server Error** – system error  

---

## **Skills and Knowledge Applied Through the Project**

- Design and implementation of REST API services  
- Use of HTTP methods and status codes  
- Integration with ERP systems (XML / JSON data logging)  
- Data validation and exception handling  
- Working with databases and SQL scripts  
- Version control and collaboration using GitHub  
