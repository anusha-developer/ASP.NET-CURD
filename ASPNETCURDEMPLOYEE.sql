Create table ASPCURD_Tbl_Employee(
EmpID int Identity(1,1) primary key,
EmpName varchar(100),
EmpDesignation varchar(150),
EmpMobileno bigint,
EmpGender varchar(100),
EmpAddress varchar(200),
);
select * from ASPCURD_Tbl_Employee;

insert into ASPCURD_Tbl_Employee values('Anusha','Developer',8748347992,'Female','Hyderabad');