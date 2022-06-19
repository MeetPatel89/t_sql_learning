-- run ddl_dml_query_5 before running below query

with
    tblAttendanceTwice
    as
    (
                    select *
            from tblAttendance
        union all
            select *
            from tblAttendance
    )
select a.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance,
    sum(NumberAttendance) 
over (
    partition by a.EmployeeNumber, year(AttendanceMonth) 
    order by AttendanceMonth
    rows between current row and unbounded following) RowTotal,
    sum(NumberAttendance) 
over (
    partition by a.EmployeeNumber, year(AttendanceMonth) 
    order by AttendanceMonth
    range between current row and unbounded following) RangeTotal
--, convert(numeric(10, 7), NumberAttendance) / sum(NumberAttendance) over (partition by EmployeeNumber, year(AttendanceMonth)) * 100 percentAttendance
from tblEmployee e join tblAttendanceTwice a
    on e.EmployeeNumber = a.EmployeeNumber
order by a.EmployeeNumber, AttendanceMonth


 