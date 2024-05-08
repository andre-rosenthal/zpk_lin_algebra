interface ZIF_MODEL
  public .


  methods EXECUTE
    importing
      !PARMS type STRING optional
      !BODY type STRING optional
      !ROUTE type STRING optional
    preferred parameter PARMS
    changing
      value(RESPONSE) type ref to IF_HTTP_RESPONSE optional .
endinterface.
