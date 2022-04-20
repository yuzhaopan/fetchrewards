-- ￼How does the ranking of the top 5 brands by receipts scanned for the recent month compare to the ranking for the previous month?

create view [top5_bands_recent_month] as:
select b.name
from receipts r 
right join itemslist i on r.receiptId = i.receiptId
left join product p on i.barcode = p.barcode 
left join brand b on b.barcode = p.barcode
where date_format(from_unixtime(r.dataScanned), '%Y%m') = date_format(curdate(), '%Y%m')
group by b.brandId order by count(*) desc
limit 5

create [brands_ranking]:
select b.name, date_format(from_unixtime(p.dataScanned)) as Year_month, rank() over (partition by date_format(from_unixtime(p.dataScanned)) orderby count(*) desc) the_rank
from receipts r 
right join itemslist i on r.receiptId = i.receiptId
left join product p on i.barcode = p.barcode 
left join brand b on b.barcode = p.barcode
group by b.brandId, date_format(from_unixtime(r.dataScanned))
order by Year_month desc, the_rank

select name, Year_month, the_rank from brands_ranking
where name in (select * from top5_bands_recent_month)t 
