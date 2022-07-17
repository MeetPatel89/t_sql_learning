-- using unpivot clause to convert wide pivotted data in PivotTab table to narrow long data form 
go
select * from PivotTab
UNPIVOT (
    Amount for MyMonth in ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])
) as UnPvtData 
where Amount != 0