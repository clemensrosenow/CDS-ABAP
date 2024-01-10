@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Selections & Inner Joins'

define view entity Z_15_Test2
  as select from spfli   as Connection
    inner join   scarr   as Carrier on Carrier.carrid = Connection.carrid
    inner join   sflight as Flight  on  Flight.carrid = Connection.carrid
                                    and Flight.connid = Connection.connid
{
  key Carrier.carrid as CarrierId,
  key Flight.connid as ConnectionId,
  key Flight.fldate as FlightDate,
  Carrier.carrname as CarrierName,
  Connection.cityfrom as CityFrom,
  Connection.cityto as CityTo
}
where Connection.fltype <> 'X' //Not chartered flights
