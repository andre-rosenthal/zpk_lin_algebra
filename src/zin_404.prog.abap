*&---------------------------------------------------------------------*
*& Include          ZIN_404
*&---------------------------------------------------------------------*
define bad_request.
  response->set_status( code = 404 reason = 'Not Found' ).
  response->set_cdata( data = 'Endpoint not found' ).
end-of-definition.
define timestamp.
  set run time clock resolution high.
  &1 = cl_abap_runtime=>create_hr_timer( ).
end-of-definition.
