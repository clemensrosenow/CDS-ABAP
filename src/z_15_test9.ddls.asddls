@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Path Expressions'

define view entity Z_15_Test9 as select from Z_15_TEST8
{
    key CarrierId,
    key ConnectionId,
    CityFrom,
    CityTo,
    _Carrier.carrname as CarrierName,
    
    /* Associations */
    _Flights
}
