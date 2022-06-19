-- run ddl_dml_query_5 before running below query

select a.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance,
    NTILE(10) OVER(partition by a.EmployeeNumber order by a.EmployeeNumber, a.AttendanceMonth) Decile
from tblEmployee e join tblAttendance a
    on e.EmployeeNumber = a.EmployeeNumber