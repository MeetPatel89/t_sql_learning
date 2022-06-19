select *,
convert(numeric(10, 7), NumberAttendance) / sum(NumberAttendance) over() * 100 percentAttendance,
sum(NumberAttendance) over() total_attendance
 from tblAttendance
 