
use newdb;
go
select a.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance,
    FIRST_VALUE(NumberAttendance) 
    OVER (partition by e.EmployeeNumber 
    order by a.AttendanceMonth) firstMonth,
    LAST_VALUE(NumberAttendance) 
    OVER (partition by e.EmployeeNumber 
    order by a.AttendanceMonth
    rows between unbounded preceding and unbounded following) lastMonth
from tblEmployee e join tblAttendance a
    on e.EmployeeNumber = a.EmployeeNumber

use AdventureWorks2019;

-- find most expensive item using ascending order by and rows clauses
go
select Name, ListPrice,
    FIRST_VALUE(Name) OVER (ORDER by ListPrice) LeastExpensive,
    LAST_VALUE(Name) OVER (order by ListPrice rows between unbounded preceding and unbounded following) MostExpensive
from Production.Product
where ProductSubcategoryID = 37

-- find most expensive item using descending order by clause
go
select Name, ListPrice,
    FIRST_VALUE(Name) OVER (ORDER by ListPrice) LeastExpensive,
    FIRST_VALUE(Name) OVER (order by ListPrice desc) MostExpensive
from Production.Product
where ProductSubcategoryID = 37
