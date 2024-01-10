@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Associations'

define view entity Z_15_TEST8
  as select from spfli as Connection
  association [1..1] to scarr   as _Carrier on  _Carrier.carrid = Connection.carrid
  association [0..*] to sflight as _Flights on  _Flights.carrid = Connection.carrid
                                            and _Flights.connid = Connection.connid
{
  key Connection.carrid     as CarrierId,
  key Connection.connid     as ConnectionId,
      Connection.cityfrom as CityFrom,
      Connection.cityto   as CityTo,
      
      
      /* Associations */
      _Carrier, //Spezifische Attribute werden nicht direkt verwendet, sondern nur zur Verfügung gestellt
      _Flights //Daher werden Joins nur dann berechnet, wenn nötig -> bessere Performance
}
