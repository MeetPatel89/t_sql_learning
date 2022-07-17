-- Using partition to aggregate the data (vertical pivot)
with AggTable as (
    select year(DateOfTransaction) MyYear, month(DateOfTransaction) MyMonth, Amount from tblTransaction
) 
select MyYear, MyMonth, sum(Amount) from AggTable
group by MyYear, MyMonth 
order by Myyear, MyMonth

-- using pivot clause to widen the data with month as columns, year as rows and amount aggregated using sum function
go
with myTable as (
    select year(DateOfTransaction) MyYear, month(DateOfTransaction) MyMonth, Amount from tblTransaction
),
MyPivot as (
        select * from MyTable
    PIVOT
    (
        Sum(Amount) for MyMonth in ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])
    ) as PvtData
)
select MyYear, isnull([1], 0) [1],
                isnull([2], 0) [2],
                isnull([3], 0) [3],
                isnull([4], 0) [4],
                isnull([5], 0) [5],
                isnull([6], 0) [6],
                isnull([7], 0) [7],
                isnull([8], 0) [8],
                isnull([9], 0) [9],
                isnull([10], 0) [10],
                isnull([11], 0) [11],
                isnull([12], 0) [12] 
                into PivotTab
                from MyPivot 
order by MyYear
