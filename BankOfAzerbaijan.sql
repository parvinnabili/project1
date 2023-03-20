## Parvin Nabili - W20100428
## Data Modelling and Analytics - Assignment
## 'Bank of Azerbaijan' database

create database BankOfAzerbaijan;

use BankOfAzerbaijan;

create table PrivateClient 
(pclientno varchar(8) not null,
caddress varchar(50) not null,
ctelno varchar(15) not null,
cfname varchar(20) not null,
clname varchar(20) not null,
cdob date,
workplace varchar(30) not null,
csalary varchar(10) not null,
Primary Key (pclientno)
);

create table CorporateClient
(bclientno varchar(8) not null,
caddress varchar(50) not null,
ctelno varchar(15) not null,
bname varchar(30) not null,
contactname varchar(30) not null,
netprofit varchar(30) not null,
empno varchar(10),
primary key (bclientno)
);

create table BankAccount
(accno int not null,
balance varchar(25) not null,
opendate date not null,
closedate date,
primary key(accno)
);

create table Owns
(pclientno varchar(8),
bclientno varchar(8),
accno int not null,
primary key (accno),  
foreign key(pclientno) references PrivateClient(pclientno), 
foreign key(bclientno) references CorporateClient(bclientno),
foreign key(accno) references BankAccount(accno)
);

insert into PrivateClient (pclientno, caddress, ctelno, cfname, clname, cdob, workplace, csalary)
Values ('20100428', '111 Azadlig, Baku', '0502803230', 'Solmaz', 'Teymurlu', '2000-07-31', 'Nobel Oil', '1500'),
('20100429', '13 Khatai, Sumgait', '0552251964', 'Said', 'Ahadov', '2000-07-06', 'Self-employed', '5000'),
('20100430', '28 Abbas Sahhat, Gabala', '0702382739', 'Susan', 'Hasanova', '1992-09-02', 'Coca-Cola', '2800'),
('20100431', '78 Bayil D, Baku', '0502476392', 'Mardan', 'Babali', '1983-03-05', 'Nokia', '4300'),
('20100432', '15 Neftchilar S, Mingachevir', '0513849384', 'Farid', 'Ganbarli', '1965-07-09', 'Deloitte', '3400'),
('20100433', '26 Kaghithane, Gakh', '0502839484', 'Sanan', 'Ahmadli', '1996-09-02', 'Unemployed', '0');

insert into CorporateClient (bclientno, caddress, ctelno, bname, contactname, netprofit, empno)
Values ('47941213', 'Landmark Office Plaza 3, Baku', '0124839423', 'Akkord Construction', 'Leyla Taghiyeva', '823903', '120'),
('47941214', 'White City Office Building, Baku', '0123827493', 'Unilever Azerbaijan', 'Araz Tehmasibi', '3263830', '450'),
('47941215', 'Port Baku Towers, Baku', '0123928302', 'Keepface', 'Manaf Abbasov', '950000', '70'),
('47941216', '35 Ayaz Ismayilov, Sumgayit', '0124729420', 'Azerishiq', 'Afet Ilyasova', '7372930', '300'),
('47941217', '47 S.Rustam, Shaki', '0128392732', 'Milla', 'Fuad Nabiyev', '820350', '80'),
('47941218', '16/18 H.Z.Taghiyev, Lankaran', '0127403749', 'ADA LLT', 'Narmin Mammadova', '70850', '20'),
('47941219', '23 Sarayev, Baku', '0122389283', 'BakuBus', 'Nurlan Orujov', '747200', '300');

insert into BankAccount (accno, balance, opendate, closedate)
Values ('778028', '0', '2015-02-02', '2020-04-02'),
('391203', '12000', '2018-07-03', null),
('550659', '8000', '2019-03-03', null),
('302668', '16400','2020-04-02', null),
('142325', '23490', '2015-02-11', null),
('659483', '200320', '2017-03-12', null),
('524996', '50230', '2021-03-23', null),
('452146','130830', '2019-02-13', null),
('798835', '30520', '2012-03-25', null),
('728085', '1290', '2022-03-13', null),
('829249', '80230', '2018-09-27', null);

insert into Owns (pclientno, bclientno, accno)
Values ('20100428', null, '778028'),
('20100429', null, '391203'), ('20100430', null, '550659'), ('20100431',null, '302668'), ('20100432', null, '142325');

insert into Owns (pclientno, bclientno, accno)
Values (null, '47941213', '659483'), (null, '47941214', '524996'), (null, '47941215', '452146'), (null, '47941216', '798835'), 
(null, '47941218', '728085'), (null, '47941219', '829249');

create table Branch
(branchid varchar(5) not null,
branchaddress varchar (50) not null,
branchname varchar(20) not null,
primary key(branchid)
);

insert into Branch (branchid, branchaddress, branchname)
Values ('34572', '20 Bulbul ave., Baku', 'Ticarat'), 
('24753', '172 Heydar Aliyev, Nizami', 'Bravo 3'),
('24754', '13 Khalil Rza, Nasimi', 'Ulduz'),
('24755', '2E Mikayil Mushvig, Badamdar', 'Badamdar'),
('24756', '44D Rustamov, Baku', 'Port Baku');

create table Department 
(depid varchar(5) not null,
depname varchar (20) not null,
primary key(depid)
);

Insert into Department (depid, depname)
Values ('56117', 'Sales'), 
('56118', 'Management'), 
('56119', 'Marketing'), 
('56120', 'Administrative'),
('56121', 'Other');

create table Has
(branchid varchar(5) not null,
depid varchar(5) not null,
primary key (branchid, depid),
foreign key(branchid) references Branch(branchid),
foreign key(depid) references Department(depid)
);

Insert into Has (branchid, depid)
Values ('34572', '56117'), ('34572', '56118'), ('34572', '56119'), ('34572', '56120'), ('34572', '56121'),
('24753', '56117'), ('24753', '56121'), ('24753', '56118'), 
('24754', '56117'), ('24754', '56121'),
('24755', '56117'), ('24755', '56118'), ('24755', '56120'),
('24756', '56117'), ('24756', '56118'), ('24756', '56120'), ('24756', '56121');

create table Staff
(staffid varchar(6) not null,
sfname varchar(20) not null,
slname varchar(20) not null,
stafftelno varchar(12),
hiredate date not null,
ssalary varchar(10) not null,
saddress varchar(50) not null,
gender ENUM('M','F'),
sdob date not null,
position varchar(100) not null,
depid varchar(5) not null,
branchid varchar(5) not null,
primary key (staffid),
foreign key (depid) references Department(depid),
foreign key (branchid) references Branch(branchid)
);

insert into Staff (staffid, sfname, slname, stafftelno, hiredate, ssalary, saddress, gender, sdob, position, depid, branchid)
Values ('145202', 'Sahib', 'Nazarli', '0502830237', '2018-04-30', '2000', '222 D. Aliyeva, Absheron', 'M', '1994-03-04', 'Marketing Manager', '56119', '34572'),
('145203', 'Aysu', 'Talibova', '0552837293', '2015-05-28', '900', '52 Z.Taghiyev, Sumgayit', 'F', '1993-04-30', 'Cleaner', '56121', '24756'),
('145204', 'Alikhan', 'Rajabov', '0703784934', '2012-03-27', '4500', '88A Zardabi, Baku', 'M', '1994-09-03','Administrative Manager', '56121', '24754'),
('145205', 'Gunel', 'Rahimova', '0508273928', '2019-03-23', '1400', '97 Tabriz, Gabala', 'F', '1998-03-29', 'Junior Marketing Manager', '56119', '34572'),
('145206', 'Imran', 'Aliyev', '0550394730', '2020-04-03', '1000', '15 Khagani, Mingachevir', 'M', '1990-02-18', 'Administrative Staff', '56120', '24756'),
('145207', 'Khatira', 'Yuzbeyova', '0508273972', '2014-04-30', '1800', '22 R. Behbudov, Imishli', 'F', '1982-03-14','CEO Assistant', '56121', '24754');

insert into Staff (staffid, sfname, slname, stafftelno, hiredate, ssalary, saddress, gender, sdob, position, depid, branchid)
Values ('145208', 'Orkhan', 'Mardanov', '0509283049', '2021-02-27', '500', '26 Babek ave., Badamdar', 'M', '1994-03-23', 'Cleaner', '56121', '24756'),
('145209', 'Elturan', 'Mammadov', '0502930239', '2017-03-19', '1300', '115 H.Aslanov, Baku', 'M', '1992-05-02', 'Driver', '56121', '34572'),
('145210', 'Nargiz', 'Mehdiyeva', '0708293093', '2019-04-02', '1600', '20 H.Aslanov, Ulduz', 'F', '1995-02-19', 'Clerk', '56120', '24755'),
('145211', 'Elshan', 'Askarov', '0502830930', '2021-02-03', '2000', '62 G. Abbasov, Nasimi', 'M', '1993-04-23', 'PR Manager', '56119', '34572');

create table Officer
(staffid varchar(6) not null,
sfname varchar(20) not null,
slname varchar(20) not null,
stafftelno varchar(12),
hiredate date not null,
ssalary varchar(10) not null,
saddress varchar(50) not null,
gender ENUM('M','F'),
sdob date not null,
position varchar(20) not null,
bonus varchar(10),
depid varchar(5) not null,
branchid varchar(5) not null,
primary key (staffid),
foreign key (depid) references Department(depid),
foreign key (branchid) references Branch(branchid)
);

insert into Officer (staffid, sfname, slname, stafftelno, hiredate, ssalary, saddress, gender, sdob, position, bonus, depid, branchid)
Values ('145400', 'Bayram', 'Nurlu', '0502830493', '2016-03-23', '3000', '17 Zarifa Aliyeva, Baku', 'M', '1994-03-14','Senior Officer', '1000', '56117', '34572'),
('145401', 'Maral', 'Tahirgizi', '0702934020', '2020-05-19', '1500', '31 Aga Nematulla, Absheron', 'F', '1983-06-30', 'Officer', '400', '56117', '24753'),
('145402', 'Faig', 'Aghayev', '0553749304', '2019-03-25', '2000', '121 Nizami, Baku', 'M', '1993-04-05', 'Officer', '450', '56117', '24754'),
('145403', 'Brilliant', 'Dadashova', '0519384938', '2018-03-29', '2500', '24 K.Shushunski, Ordubad', 'F', '1995-04-05', 'Senior Officer', '600', '56117', '24755'),
('145404', 'Rashid', 'Behbudov', '0502384095', '2017-11-29', '2800', '29 H. Javid, Nakhchivan', 'M', '1993-12-30', 'Senior Officer', '800', '56117', '24756'),
('145405', 'Kerimcan', 'Durmaz', '0704839403', '2021-04-24', '1300', '145 Neftchilar', 'M', '1999-02-22', 'Junior Officer', '200', '56117', '34572'),
('145406', 'Bahar', 'Candan', '050273849', '2022-04-02', '1000', '9 N.Narimanov, Gandja', 'F', '1998-06-03', 'Junior Officer', '150', '56117', '24753'),
('145407', 'Javad', 'Aliyev', '0513749483', '2020-03-04', '1500', '8 A. Aliyev, Sumgayit', 'M', '1997-12-08', 'Officer', '400', '56117', '24755'),
('145408', 'Narmin', 'Azimova', '0503489340', '2022-10-20', '1000', '30 Tbili ave, Shusha', 'F', '2000-08-02', 'Junior Officer', '150', '56117', '24755');

create table Manager
(staffid varchar(6) not null,
managerid varchar(8) not null,
sfname varchar(20) not null,
slname varchar(20) not null,
stafftelno varchar(12),
hiredate date not null,
ssalary varchar(10) not null,
saddress varchar(50) not null,
gender ENUM('M','F'),
sdob date not null,
position varchar(20) not null,
depid varchar(5) not null,
branchid varchar(5) not null,
primary key (managerid),
foreign key (depid) references Department(depid),
foreign key (branchid) references Branch(branchid)
);

insert into Manager (staffid, managerid, sfname, slname, stafftelno, hiredate, ssalary, saddress, gender, sdob, position, depid, branchid)
Values ('145700', '30096117', 'Gamar', 'Gadimli', '0558394820', '2013-04-29', '4500', '5A A. Sahhat, Binagadi', 'F', '1990-02-03', 'Manager', '56118', '34572'),
('145701', '30096118', 'Ali', 'Sadigov', '0703748293', '2015-03-23', '4000', '62 Ataturk, Tovuz', 'M', '1994-03-18', 'Assistant Manager', '56118', '24753'),
('145702', '30096119', 'Heydar', 'Hasanov', '0502839304', '2010-03-16', '6000', '340 Nizami, Gazakh', 'M', '1985-04-14', 'Senior Manager', '56118', '24755'),
('145703', '30096120', 'Tural', 'Hajiyev', '0502839985', '2019-02-04', '3800', '64 A.Jamil, Baku', 'M','1991-03-23', 'Assistant Manager', '56118', '24756'),
('145704', '30096121', 'Nurana', 'Jafarova', '0503472930', '2014-03-20', '5800', '4 J.Jabbarly, Baku', 'F', '1987-04-23', 'Manager', '56118', '34572'),
('145705', '30096122', 'Elgun', 'Rashadov', '0557340492', '2018-03-02', '3750', '2 A.Isazadeh, Nakhchivan', 'M', '1993-04-23', 'Assistant Manager', '56118', '24755'),
('145706', '30096123', 'Bahman', 'Rzayev', '0704839239', '2006-12-23', '15000', '82 Azadlig, Baku', 'M', '1978-04-23', 'Partner', '56118', '34572'),
('145707', '30096124', 'Suleyman', 'Rustamov', '0552830230', '2008-03-23', '8000', '20 Yanvar, Gandja', 'M', '1975-02-12', 'Senior Manager', '56118', '24756');

create table Loan
(transactionno varchar(8) not null,
transactiondate date not null,
loanamount int not null,
loanintrate decimal(4,2) not null,
loanduration varchar(6) not null,
remainingamount int,
accno int not null,
staffid varchar(6) not null,
managerid varchar(8) not null,
primary key (transactionno),
foreign key (accno) references BankAccount(accno),
foreign key (staffid) references Officer(staffid),
foreign key (managerid) references Manager(managerid)
);

insert into Loan (transactionno, transactiondate, loanamount, loanintrate, loanduration, remainingamount, accno, staffid, managerid)
Values ('77735123', '2022-04-05', '5000', '12.60','365', '2500', '778028', '145400', '30096117'),
('77735124', '2022-07-12', '7500', '11.05', '180', '7000', '391203', '145401', '30096118'),
('77735125', '2022-09-17', '4000', '08.20', '365', '3000', '550659', '145402', '30096119'),
('77735126', '2022-11-20', '6000', '05.50', '180', '6000', '302668', '145403', '30096120'),
('77735127', '2021-05-02', '7300', '10.05', '120', '0', '142325', '145404', '30096121'),
('77735128', '2022-03-23', '300000', '13.50', '365', '170000', '659483', '145405', '30096122'),
('77735129', '2022-08-30', '800000', '17.50', '400', '750000', '524996', '145406', '30096124'), 
('77735130', '2022-03-14', '150000', '13.50', '365', '130000', '452146', '145407', '30096117'),
('77735131', '2020-02-02', '200000', '15.05', '200', '0', '798835', '145408', '30096118'),
('77735132', '2022-03-28', '170000', '11.20', '365', '120000', '728085', '145400', '30096119'),
('77735133', '2022-06-30', '30000', '17.40', '300', '12000', '829249', '145401', '30096120');

create table Deposit
(transactionno varchar(8) not null,
transactiondate date not null,
depositamount int not null,
depositintrate decimal(4,2) not null,
accno int not null,
staffid varchar(6) not null,
primary key (transactionno),
foreign key (accno) references BankAccount(accno),
foreign key (staffid) references Officer(staffid)
);

insert into Deposit (transactionno, transactiondate, depositamount, depositintrate, accno, staffid)
values ('48174795', '2019-03-24', '10000', '02.04', '391203', '145400'),
('48174796', '2020-05-23', '6500', '03.20', '550659', '145401'),
('48174797', '2021-04-03', '15000', '01.15', '302668', '145402'),
('48174798', '2016-02-26', '20000', '05.25', '142325', '145403'), 
('48174799', '2017-03-13', '150000', '03.20', '659483', '145404'),
('48174800', '2021-03-25', '50000', '02.50', '524996', '145405'),
('48174801', '2019-02-15', '55000', '03.50', '452146', '145406'),
('48174802', '2013-04-24', '10000', '02.20', '798835', '145407'),
('48174803', '2022-03-15', '1000', '04.02', '728085', '145408'), 
('48174804', '2018-12-25', '50000', '02.35', '829249', '145400'),
('48174805', '2017-03-27', '17000', '02.50', '798835','145407'),
('48174806', '2021-11-02', '30000', '02.50', '452146', '145406');

## Updating a cell in a table
Update Deposit set depositamount = '1100' where transactionno = '48174803';

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












