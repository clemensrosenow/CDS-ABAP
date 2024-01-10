@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aggregations'

define view entity Z_15_Test5
  as select from sflight
{
  carrid,
  count(*)                                             as NumberOfFlights, // count number of entries
  //count(distinct planetype) as Planetypes,
  count(distinct seatsmax)                             as NumberOfDifferentSeats,



  @Semantics.amount.currencyCode: 'currency'
  sum(paymentsum)                                      as TotalRevenue,
  currency                                             as Currency,
  avg(price as abap.dec(16,2))                         as AveragePrice,

  min(seatsocc)                                        as MinimumOccupiedSeats,
  max(seatsocc)                                        as MaximumOccupiedSeats,

  sum(case when seatsocc = 0 then 1 else 0 end)        as NumberOfEmptyFlights,
  sum(case when seatsocc = seatsmax then 1 else 0 end) as NumberOfFullFlights

}
where
  planetype = 'A380-800'
group by
  currency,
  carrid
having
  sum(paymentsum) > 4000000
