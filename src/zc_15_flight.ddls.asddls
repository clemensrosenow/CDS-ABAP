@EndUserText.label: 'Flight Projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_15_Flight
  as projection on ZI_15_Flight
{
      @Consumption.valueHelpDefinition: [{ entity: {name:'ZI_15_CarrierVH', element: 'Carrid'} }]
  key CarrierId,
  key ConnectionId,
  key FlightDate,
      Price,
      
      @Consumption.valueHelpDefinition: [{ entity: {name:'I_CurrencySTDVH', element: 'Currency'} }]
      Currency,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      PlaneType,
      MaximumSeatsEconomyClass,
      OccupiedSeatsEconomyClass,
      PaymentSum,
      MaximumSeatsBusinessClass,
      OccupiedSeatsBusinessClass,
      MaximumSeatsFirstClass,
      OccupiedSeatsFirstClass,
      
      CarrierName,
      FlightDateCriticality,

      _Bookings : redirected to composition child ZC_15_Booking
}
