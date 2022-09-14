-- Damage Query Of Perishable

SELECT max(te.ThingId) MaximumThingId,min(te.ThingId) MinimumThingId
FROM ThingEvent te
JOIN ThingTransaction tt on tt.id = te.ThingTransactionId
WHERE tt.CreatedOn >= '2022-08-11 00:00 +6:00'
AND tt.CreatedOn < '2022-08-12 00:01 +6:00'
AND ToState in ( 8, 32 )

--#########################################################


Select te.WarehouseId,
	   w.Name [Warehouse],
	   pv.id, 
	   pv.Name, 
	   count(*) Quantity

from thing t
join ThingEvent te on te.ThingId=t.id
join ThingTransaction tt on tt.id=te.ThingTransactionId
join productvariant pv on pv.id=t.ProductVariantId
join Warehouse w on w.Id=te.WarehouseId

where tt.CreatedOn >= '2022-08-11 00:00 +6:00'
and tt.CreatedOn < '2022-08-12 00:01 +6:00'
and ToState in (8,32)
and t.id>=144311399 ------ MinimumThingId
and t.id<=160250772 ------ MaximumThingId
and pv.DistributionNetworkId = 1
and pv.ShelfType in (5,9)

group by te.WarehouseId,w.Name,pv.id,pv.name




