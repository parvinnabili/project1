# Building a Database project - MySQL
## By Parvin Nabili
### For this project, I built a database system for a Bank (namely "The Bank of Azerbaijan") and run several queries to drive insights. The following was developed:

- Conceptual Data Model
- Logical Data Model
- Database Design

### The ER Diagram of the Bank is as follows:

![ER Model](https://github.com/parvinnabili/project1/blob/b8df707869d46e8dc78ab0a53687fdfcf333a3ad/Banking%20ER%20diagram.drawio.png)

## Overview of the database:
### Bank of Azerbaijan is a private bank in Azerbaijan. It offers financial services to individuals and businesses. Bank’s clients can open bank accounts, through which they can conduct various bank transactions, such as applying for a loan and depositing funds. Clients can open as many bank accounts and conduct as many bank transactions as they wish. A single bank account can only belong to one client (private client or corporate client). A bank transaction can only be conducted through a single bank account. The bank has several branches in Azerbaijan, and in each branch, there are various departments operating. Each department can operate in one-to-many branches, and in each branch, there are multiple departments operating. Bank’s staff is mainly divided into two categories: managers and officers, however there are other types of employees as well (those who are neither an officer nor a manager). Officers are responsible bringing new clients into the bank and facilitating their bank transactions. In order to remain in the bank, each officer should bring at least 5 new clients to the bank, and they can have up to 30 clients at the same time. For each client brought, officers get a bonus payment. Each transaction is facilitated by only one officer. Managers approves client’s loans. A manager cannot approve more than 20 loans. Each loan is approved by only one manager. There are 3 types of users that can access the database system. First type is the officers, who can input information regarding bank transactions. Whereas the clients can input data about themselves and view their bank account details, as well as some data about bank transactions. Lastly, the managers have access to the whole database system and can edit anything.![image](https://user-images.githubusercontent.com/128379475/226431524-814a17ed-3545-4851-a06c-2647e7c5956f.png)


### The SQL code for creating the database: https://github.com/parvinnabili/project1/blob/b64f67c4f464ce1de73e453078eba84658813710/BankOfAzerbaijan.sql
### The SQL code for queries: https://github.com/parvinnabili/project1/blob/b64f67c4f464ce1de73e453078eba84658813710/BankOfAzerbaijan_queries.sql
