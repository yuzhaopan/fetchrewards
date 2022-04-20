-- ￼When considering total number of items purchased from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?

select p.rewardsReceiptStatus, sum(p.purchasedItemCount) as totalItems
from receipts r 
right join itemlist i on r.receiptId = i.receiptId
where r.rewardsReceiptStatus = 'FINISHED' or r.rewardsReceiptStatus = 'RejecREJECTEDted'
group by r.rewardsReceiptStatus
order by totalItems desc