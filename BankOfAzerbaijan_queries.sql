## Parvin Nabili - W20100428
## Data Modelling and Analytics - Assignment
## 'Bank of Azerbaijan' database

use bankofazerbaijan;

## Updating a cell in a table
Update Deposit set depositamount = '900' where transactionno = '48174803';

select * from deposit;

## Showing all the employees that work in Marketing Department
Select * from staff where depid = '56119';

## Searching for private clients alphabetically ordered by their first name
select cfname, clname from PrivateClient Order by cfname ASC;

## Searching for first and last names of employees who hold positions of Manager and above
Select sfname, slname, position from Manager where position = 'Manager' OR position = 'Senior Manager' or position = 'Partner';

## Searching for private clients that have loan amount payables between 5000 and 12000
select * from Loan where remainingamount between '5000' and  '12000';

## Searching for employees who are either working in Marketing or Administrative Department
Select sfname, slname, position from staff where depid in ('56119', '56120');

## Searching for the sum of all bank account balances
Select sum(Balance) from BankAccount;

## Searching for the maximum balance in all bank accounts
Select max(Balance) from BankAccount;

## Searching for the average salaries of Management level employees grouped by positions
Select avg(ssalary), position from Manager group by position;

## Searching for the positions of Officers that have average salaries of higher than 1500 AZN
Select avg(ssalary), position from Officer group by position having avg(ssalary) > 1500;

## Searching for the bank accounts that have already been closed
Select * from BankAccount where closedate is not null;

## Searching for active bank accounts
Select * from BankAccount where closedate is null;

## Searching for employees ordered by their hiring date in descending order
Select sfname, slname, hiredate, position from Staff order by hiredate desc;

## Searching for female employee full names, positions and hiredates
Select Concat(sfname, ' ', slname) as 'Full Name', position, hiredate, ssalary from Staff where Gender = 'F';

## Searching for private clients and their bank account details ordered by client's first name, last name, and open date respectively
Select cfname, clname, accno, balance, opendate, closedate
from PrivateClient 
Natural Join BankAccount
Natural Join Owns
order by cfname, clname, opendate;

## Searching for information about employees and their department names
Select Concat(sfname, ' ', slname) as 'Full Name', ssalary, hiredate, gender, sdob, position, depname
from Staff
Join Department
on department.depid = staff.depid 
where depname in ('Marketing');

## Searching for all Corporate Clients which have loans payable more than 200000 AZN
Select * from CorporateClient
Join Loan 
Where remainingamount > '200000';

## Searching for all the employee name, surname, position, hiring date, salary, department name, branch name and branch addess

Select Concat(sfname, ' ', slname) as 'Full Name', position, hiredate, ssalary, branchname, depname, branchaddress
from Staff
Natural Join Branch
Natural Join Department;

## Searching for the full names, positions, deparments and salaries of employees working in the Port Baku branch
Select Concat(sfname, ' ', slname) as 'Full Name', position, ssalary, depname
From Staff
Natural join Department
Where branchid in (Select branchid from Branch where Branchname = 'Port Baku');

## Searching for the Managers in Ticarat Branch
Select Concat(sfname, ' ', slname) as 'Full Name', position, hiredate, depname from Manager 
Natural Join Department
Where branchid in (Select branchid from Branch where Branchname = 'Ticarat');

## Creating a view for Active Accounts

create view ActiveAccounts as 
Select accno, balance, opendate 
from BankAccount
Where closedate is null;

## Deleting a client row from Private Client Table
Delete from privateclient where clientno = '20100433';

## Creating users for database: 1. Manager has access to everything and can do anything in the database

create user Manager Identified by 'manager';
Grant insert, update, delete, select on BankofAzerbaijan.* to Manager;


## Officers can only insert, update and select data on Loan and Deposit tables
Create user Officer Identified by 'officer';
Grant insert, update, select on BankofAzerbaijan.Loan to Officer;
Grant insert, update, select on BankofAzerbaijan.Deposit to Officer;

## Clients can only insert information about themselves to PrivateClient and CorporateClient tables depending on the Client Type
Create user Client Identified by 'client';
Grant insert on BankofAzerbaijan.PrivateClient to Client;
Grant insert on BankofAzerbaijan.CorporateClient to Client;