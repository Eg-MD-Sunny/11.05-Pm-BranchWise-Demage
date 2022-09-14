--Sales Report 

Select w.Id [WID],
	   w.name [WName],
	   pv.id [PVID],
	   pv.name [Product],
	   Count(*) [Sale Quantity]

from ProductVariant pv
join ThingRequest tr on tr.ProductVariantId=pv.id
join thing t on t.id=tr.AssignedThingId
join Shipment s on s.id=tr.ShipmentId
join Warehouse w on w.Id = s.WarehouseId 

where s.ReconciledOn is not null
and s.ReconciledOn >= '2022-08-11 00:00 +06:00'
and s.ReconciledOn < '2022-08-12 00:00 +06:00'
and pv.ShelfType in (5,9)
and s.ShipmentStatus not in (1,9,10)
and IsReturned=0
and IsCancelled=0
and HasFailedBeforeDispatch=0
and IsMissingAfterDispatch=0
and pv.DistributionNetworkId = 1

group by w.Id,
	     w.name,
		 pv.id,
		 pv.name

order by 3 desc