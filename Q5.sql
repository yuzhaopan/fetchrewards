-- ￼Which brand has the most spend among users who were created within the past 6 months?

select b.name
from receipts r 
left join users u on r.usersId = u.usersId
right join itemslist i on r.receiptId = i.receiptId
left join product p on i.barcode = p.barcode 
left join brand b on b.barcode = p.barcode
where period_diff(date_format(curdate(), '%Y%m'), date_format(from_unixtime(u.createdDate), '%Y%m')) <= 6
group by b.brandId order by sum(r.totalSpent) desc
limit 1