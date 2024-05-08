interface ZIF_CONTROLLER
  public .


  methods EXECUTE
    importing
      !VERB type STRING default 'GET'
      !VERSION type STRING default 'V1'
      !ROUTE type STRING optional
      !PARMS type STRING optional
      !BODY type STRING optional
    preferred parameter VERB
    changing
      value(RESPONSE) type ref to IF_HTTP_RESPONSE OPTIONAL.
endinterface.
