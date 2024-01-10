@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
define view entity ZI_15_Booking as select from sbook
association to parent ZI_15_Flight as _Flight
    on $projection.Carrid = _Flight.CarrierId
    and $projection.Connid = _Flight.ConnectionId
    and $projection.Fldate = _Flight.FlightDate
{
    key sbook.carrid as Carrid,
    key sbook.connid as Connid,
    key sbook.fldate as Fldate,
    key sbook.bookid as Bookid,
    sbook.customid as Customid,
    sbook.custtype as Custtype,
    sbook.smoker as Smoker,
    @Semantics.quantity.unitOfMeasure: 'Wunit'
    sbook.luggweight as Luggweight,
    sbook.wunit as Wunit,
    sbook.invoice as Invoice,
    sbook.class as Class,
    sbook.forcuram as Forcuram,
    sbook.forcurkey as Forcurkey,
    sbook.loccuram as Loccuram,
    sbook.loccurkey as Loccurkey,
    sbook.order_date as OrderDate,
    sbook.counter as Counter,
    sbook.agencynum as Agencynum,
    sbook.cancelled as Cancelled,
    sbook.reserved as Reserved,
    sbook.passname as Passname,
    sbook.passform as Passform,
    sbook.passbirth as Passbirth,
    _Flight // Make association public
}
