CREATE PROC EmployeeCreateUpdate
@EmpID int,
@EmpName varchar(100),
@EmpDesignation varchar(150),
@EmpMobileno bigint,
@EmpGender varchar(300),
@EmpAddress varchar(250)
AS
BEGIN
if(@EmpID=0)
   BEGIN
   insert into ASPCURD_Tbl_Employee(EmpName,EmpDesignation,EmpMobileno,EmpGender,EmpAddress)
    values(@EmpName,@EmpDesignation,@EmpMobileno,@EmpGender,@EmpAddress)
   END
else
BEGIN
update ASPCURD_Tbl_Employee
set
   EmpName=@EmpName,
   EmpDesignation=@EmpDesignation,
   EmpMobileno=@EmpMobileno,
   EmpGender=@EmpGender,
   EmpAddress=@EmpAddress
  WHERE EmpID=@EmpID
  END

END