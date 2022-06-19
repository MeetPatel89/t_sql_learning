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
    ROW_NUMBER() OVER(partition by a.EmployeeNumber order by a.EmployeeNumber, a.AttendanceMonth) RowNum,
    RANK() OVER(partition by a.EmployeeNumber order by a.EmployeeNumber, a.AttendanceMonth) RowRank,
    DENSE_RANK() OVER(partition by a.EmployeeNumber order by a.EmployeeNumber, a.AttendanceMonth) RowDenseRank
from tblEmployee e join tblAttendanceTwice a
    on e.EmployeeNumber = a.EmployeeNumber