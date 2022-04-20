-- ￼When considering average spend from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?

select avg(totalSpent) as averageSpent
from receipts
where rewardsReceiptStatus = 'FINISHED' or rewardsReceiptStatus = 'RejecREJECTEDted'
group by rewardsReceiptStatus
order by averageSpent desc

