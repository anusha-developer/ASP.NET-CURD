USE [ASPNETCURD]
GO
/****** Object:  StoredProcedure [dbo].[ASPCURD_EmployeeViewall]    Script Date: 8/2/2021 11:03:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  PROC [dbo].[ASPCURD_EmployeeViewall]
AS
BEGIN
select * from  ASPCURD_Tbl_Employee
END