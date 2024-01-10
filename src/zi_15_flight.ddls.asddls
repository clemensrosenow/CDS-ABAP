@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight'
define root view entity ZI_15_Flight
  as select from sflight
  composition [0..*] of ZI_15_Booking     as _Bookings
  association [1..1] to ZI_15_CarrierText as _CarrierText on $projection.CarrierId = _CarrierText.Carrid
{
      @ObjectModel.text.element: [ 'CarrierName' ]
  key carrid                as CarrierId,
  key connid                as ConnectionId,
  key fldate                as FlightDate,
      @Semantics.amount.currencyCode: 'Currency'
      price                 as Price,
      currency              as Currency,
      planetype             as PlaneType,
      seatsmax              as MaximumSeatsEconomyClass,
      seatsocc              as OccupiedSeatsEconomyClass,
      @Semantics.amount.currencyCode: 'Currency'
      paymentsum            as PaymentSum,
      seatsmax_b            as MaximumSeatsBusinessClass,
      seatsocc_b            as OccupiedSeatsBusinessClass,
      seatsmax_f            as MaximumSeatsFirstClass,
      seatsocc_f            as OccupiedSeatsFirstClass,

      _CarrierText.Carrname as CarrierName,
      case when dats_days_between($session.system_date, fldate) >= 14 then 3
      when dats_days_between($session.system_date, fldate) >= 7 then 2
      when dats_days_between($session.system_date, fldate) >= 0 then 1
      else 0 end            as FlightDateCriticality,


      _Bookings // Make association public
}
