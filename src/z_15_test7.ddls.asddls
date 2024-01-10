@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Outer Joins'

define view entity Z_15_Test7
  as select from spfli   as Connection
//    left outer join   scarr   as Carrier on Carrier.carrid = Connection.carrid
    left outer join   sflight as Flight  on  Flight.carrid = Connection.carrid
                                    and Flight.connid = Connection.connid
{
  key Flight.carrid      as CarrierId,
  key Flight.connid       as ConnectionId,
  key Flight.fldate       as FlightDate,
//      Carrier.carrname    as CarrierName,
      Connection.cityfrom as CityFrom,
      Connection.cityto   as CityTo
}
