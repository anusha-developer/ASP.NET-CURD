Create PROC ASPCURD_EmployeeViewById
@EmpID int
AS
BEGIN
 select * from ASPCURD_Tbl_Employee
 WHERE
 EmpID=@EmpID
 END