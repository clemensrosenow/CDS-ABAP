@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Literals, Cases, Arithmetic Expressions, Casting'

define view entity Z_15_Test3
  as select from sbook
{
  /*Literals*/
  'Mr. Stahl'                                                               as LieblingsLehrer,
  42                                                                        as MyIQ,
  3.1415926578                                                              as Pi,

  /*Cases*/
  //Switch-Statement
  cancelled,
  case cancelled
   when '' then 'Booked'
   when 'X' then 'Cancelled'
   else cancelled
  end                                                                       as CancelledText,


  //If-Statement
  case when class <> 'F' and luggweight > 25 and wunit = 'KG' then 'true'
  //when ... more if-statements
    else 'false'
   end                                                                      as ExcessLuggageWeight,

  /* Arithmetic Expressions */
  loccuram,
  loccurkey,
  forcuram,
  forcurkey,
  cast(loccuram as abap.dec( 16, 2 )) + cast(forcuram as abap.dec( 16, 2 )) as Add1,
  cast(loccuram as abap.dec( 16, 2 )) - cast(forcuram as abap.dec( 16, 2 )) as Subtract1,
  cast(loccuram as abap.dec( 16, 2 )) * cast(forcuram as abap.dec( 16, 2 )) as Multiply1,
  cast(loccuram as abap.fltp) / cast(forcuram as abap.fltp)                 as Divide1



}
