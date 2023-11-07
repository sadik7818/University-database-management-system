create database VIIT_University
use VIIT_University

Create table College_Table(College_ID int Primary Key,College_Name Varchar(max),College_Area Varchar(max))
Create table Department_table(Department_ID int Foreign key references College_Table (College_ID),Department_Name Varchar(max),Department_Faculty Varchar(max))
Create table Professor_Table(Professor_ID int Primary Key,Professor_Name Varchar(max),Professor_subject varchar(max))
Create table Student_Table(Student_ID int Foreign key References Professor_Table(Professor_ID) ,Student_Name VArchar(max),Student_Stream varchar(max))

insert Into College_Table values(1101,'College Of Engineering Pune','Shivaji  Nagar'),(1102,'Dr.D.Y. Patil Institue of Technology','Pimpri'),
(1103,'Pune Institue Of Computer Technology,Pune','Pune satara Road'),(1104,'Rajashri Shahu College Of Engineering','Tathawade'),(1105,'Pimpri Chinchwad college Of Engineering','Nigdi'),
(1106,'Vishwakarma Institue Of Information Technology Pune','Kondhwa'),(1107,'Army Institue Of Technology','Dighi Hills'),(1108,'G H Raisoni College of Engineering and Managment Pune','Wagholi'),
(1109,'JSPM Narhe Technical Campus,Pune','Narhe'),(1110,'MIT-WPU','Kothrud')
select * from College_Table

insert into Department_table values(1101,'Mechanical Department','John Doe'),(1102,'E&TC Department','Jane Smith'),(1103,'Civil Department','Robert Johnson'),
(1104,'Electrical Department','Emily Brown'),(1105,'Information Technology','Michael Davis'),(1106,'Computer Science','Sarah Wilson'),(1107,'Automobile  Engineering','David Thompson'),
(1108,'Chemical Engineering','Jessica Lee'),(1109,'Software Engineering','William Turner'),(1110,'Power Engineering', 'Olivia Martinez')
select * from Department_table

insert into Professor_Table values(1101,'SUNIL SHARMA','Fluid Mechanics'),(1102,'SANDEEP SABOO','Digital Communication'),(1103,'AMOL PANDE','Structural Engineering'),
(1104,'SHEKHAR SHINDE','Control System'),(1105,'PRIYA SHAH','Operating System'),(1106,'URJIT GOKHALE','Computer Newtworks'),(1107,'ANAND PANSE','Engineering Drawing')
,(1108,'SWATI DANI','Mass Transfer'),(1109,'GARIMA KHETAN','Computer Programming'),(1110,'CHETAN PANDE','Nuclear Power Generation')
select * from Professor_Table

insert into Student_Table values(1101,'Gavin Bell','Mechanical Department'),(1102,'Hector Madden','E&TC Department'),(1103,'Hayes Gonzales','Civil Department'),
(1104,'Henry Holcomb','Electrical Department'),(1105,'Rafael Griffith','Electrical Department'),(1106,'Sawyer Byers','Computer Science'),
(1107,'Rashad Zimmerman','Automobile  Engineering'),(1108,'Stone Bush','Chemical Engineering'),(1109,'Declan Larson','Software Engineering'),(1110,'Wylie Burris','Power Engineering')
select * from Student_Table


--Give the information of College_ID and College_name from College_Table
select College_ID,College_name from College_Table

--Show  Top 5 rows from Student table.
select top 5 * from Student_Table

--what is the name of  professor  whose ID  is 5
select Professor_name from Professor_Table where Professor_ID=1105

--Convert the name of the Professor into Upper case 
select UPPER(Professor_name) from Professor_Table

--Show me the names of those students whose name is start with S
select Student_name from Student_Table where Student_Name like 'S%'

--Give the name of those colleges whose end with g
select * from College_Table where College_Name like '%g'

-- Add one Salary Column in Professor_Table
alter table Professor_table
add Salary int
insert into Professor_Table (Salary) values(54000,43000,56000,70654,54900,56000,54700,65400,60000,51000)

--Add one Contact Column in Student_table
alter table Student_table
add Contact Int
insert into Student_Table(Contact) values (7775853492,8752462887,8974329876,9875432186,9745321678,8765654326,9876567890,9873215463,9876543210,8976546785)
--There are fewer columns in the INSERT statement than values specified in the VALUES clause. The number of values in the VALUES clause must match the number of columns specified in the INSERT statement.
--Arithmetic overflow error converting expression to data type int.

--Find the total Salary of Professor 
select sum(Salary)'Total Salary' from Professor_Table

--Change datatype of any one column of any one Table
alter table Department_table
alter column department_faculty varchar(50)

--Show first 5 records from Students table and Professor table Combine
select top 5 * from Student_Table
join Professor_Table
on Student_Table.Student_ID=Professor_Table.Professor_ID

--Apply Inner join on all 4 tables together
select * from College_table
inner join Department_table 
on College_Table.College_ID=Department_Table.Department_ID
inner join Professor_table
on Department_table.Department_ID =Professor_table.PRofessor_ID
inner join Student_table 
on Professor_table.PRofessor_ID=Student_table.Student_Id

--Show Some null values from Department table and Professor table.
select * from Professor_table

--Create a View from College Table  and give those records whose college name starts with C
create view College as 
select * from college_table
where College_name like 'C%'

select * from College

--Create Stored Procedure  of Professor table whatever customer ID will be given by user it should show whole records of it.
Create proc Professor_ID
@ID int
as begin
select * from Professor_table where Professor_ID=@ID
end 

exec Professor_ID 1101

--Rename the College_Table to College_Tables_Data .
sp_rename 'College_table' , 'College_Tables_Data'
