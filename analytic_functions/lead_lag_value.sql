use AdventureWorks2019;
go
SELECT BusinessEntityID, YEAR(QuotaDate) AS SalesYear, SalesQuota AS CurrentQuota,   
       LAG(SalesQuota, 1,23333) OVER (partition by BusinessEntityID, year(QuotaDate) ORDER BY YEAR(QuotaDate)) AS PreviousQuota ,
        LEAD(SalesQuota, 1, 111) OVER (partition by BusinessEntityID, year(QuotaDate) ORDER BY YEAR(QuotaDate)) AS NextQuota
FROM Sales.SalesPersonQuotaHistory  


use newdb;
go 
select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance,
lag(NumberAttendance, 1, 1) over (partition by e.EmployeeNumber order by a.AttendanceMonth) as MyLag,
lead(NumberAttendance, 1, 11) over (partition by e.EmployeeNumber order by a.AttendanceMonth) as MyLead
from tblEmployee e join tblAttendance a 
on e.EmployeeNumber = a.EmployeeNumber


