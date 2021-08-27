Create  PROC ASPCURD_EmployeedDeleteById
@EmpID int
AS
BEGIN
delete from  ASPCURD_Tbl_Employee
WHERE EmpID=@EmpID
END