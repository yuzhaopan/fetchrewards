-- What are the top 5 brands by receipts scanned for most recent month?

select b.name
from receipts r 
right join itemslist i on r.receiptId = i.receiptId
left join product p on i.barcode = p.barcode 
left join brand b on b.barcode = p.barcode
where date_format(from_unixtime(r.dataScanned), '%Y%m') = date_format(curdate(), '%Y%m') 
group by b.brandId order by count(*) desc
limit 5