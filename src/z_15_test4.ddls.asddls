@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Built-in Functions'

define view entity Z_15_Test4
  as select from sflight
{
  /* Numeric Functions */
  DIVISION(5,3,2)                       as RoundedDivision,

  price,
  currency,
  @Semantics.amount.currencyCode: 'currency'
  ROUND(price,-1)                       as Rounded, //negative number: before decimal point

  /* String Functions */
  CONCAT_WITH_SPACE('Hello', 'Hugo', 1) as Concatenation,
  length('X  ') as TrailingSpaces,
  length('  X') as PrecedingSpaces,
  length('   ') as SpaceLength,
  // => Preceding Spaces are removed by compiler, spaces have length=0
  

  /* Unit & Currency Conversions */
  @Semantics.amount.currencyCode: 'ConvertedCurrencyCode'
  CURRENCY_CONVERSION(
    amount => price,
    source_currency => currency,
    target_currency => cast('EUR' as abap.cuky),
    exchange_rate_date => fldate)       as ConvertedPrice,
  cast('EUR' as abap.cuky)              as ConvertedCurrencyCode,

  /* Date & Time Functions */
  dats_add_days(fldate, -32000, 'FAIL') as DatsAddDays
}
