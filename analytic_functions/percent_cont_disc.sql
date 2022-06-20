use newdb;
go
select e.EmployeeNumber, a.AttendanceMonth, a.NumberAttendance,
CUME_DIST() OVER (PARTITION by e.EmployeeNumber order by a.NumberAttendance) * 100 CumeDist,
PERCENT_RANK() OVER (PARTITION by e.EmployeeNumber order by a.NumberAttendance) * 100 PercentRank,
Percentile_cont(0.4) within group ( order by a.NumberAttendance) OVER (PARTITION by e.EmployeeNumber)  PercentCont,
Percentile_disc(0.4) within group ( order by a.NumberAttendance) OVER (PARTITION by e.EmployeeNumber)  PercentDisc
from tblEmployee e join tblAttendance a on e.EmployeeNumber = a.EmployeeNumber