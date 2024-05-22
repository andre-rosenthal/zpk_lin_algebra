*"* use this source file for any macro definitions you need
*"* in the implementation part of the class
define bad_request.
  response->set_status( code = 404 reason = 'Not Found' ).
  response->set_cdata( data = 'Endpoint not found' ).
end-of-definition.
