@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projections'

define view entity Z_15_Test1
  as select from sflight
{
  key carrid     as CarrierId,
  key connid     as ConnectionId,
  key fldate     as FlightDate,
      price      as FlightPrice,
      currency   as Currency,
      planetype  as PlaneType
}
