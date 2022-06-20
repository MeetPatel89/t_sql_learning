USE AdventureWorks2019;  
GO  
SELECT Department, LastName, Rate,   
       CUME_DIST () OVER (PARTITION BY Department ORDER BY Rate) AS CumeDist,   
       PERCENT_RANK() OVER (PARTITION BY Department ORDER BY Rate ) AS PctRank  
FROM HumanResources.vEmployeeDepartmentHistory AS edh  
    INNER JOIN HumanResources.EmployeePayHistory AS e    
    ON e.BusinessEntityID = edh.BusinessEntityID  
WHERE Department IN (N'Information Services',N'Document Control')   
ORDER BY Department, Rate DESC;  

use newdb;
go
select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance,
CUME_DIST() OVER (PARTITION by e.EmployeeNumber order by a.AttendanceMonth) CumeDist,
PERCENT_RANK() OVER (PARTITION by e.EmployeeNumber order by a.AttendanceMonth) PercentRank
from tblEmployee e join tblAttendance a on e.EmployeeNumber = a.EmployeeNumber
