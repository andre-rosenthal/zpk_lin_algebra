class zcl_http_handler definition
  public
  inheriting from zcl_pysap
  final
  create public .

  public section.

    interfaces if_http_extension .

    class-methods class_constructor .
    methods constructor .
  protected section.
  private section.

    class-data this type ref to zif_controller .
ENDCLASS.



CLASS ZCL_HTTP_HANDLER IMPLEMENTATION.


  method class_constructor.
    this ?= new zcl_controller( ).
  endmethod.


  method constructor.
    super->constructor( ).
  endmethod.


  method if_http_extension~handle_request.
    constants:
      parm_del type char1 value '?',
      equal    type char1 value '=',
      sep      type char1 value '_',
      slash    type char1 value '/',
      parm_sep type char1 value '&'.
    data:
      dummy      type string,
      path       type string,
      verb       type string,
      version    type string,
      log        type string_table,
      body       type string,
      request    type ref to if_http_request,
      route      type string,
      response   type ref to if_http_response,
      parms      type string,
      api        type string,
      controller type ref to zif_controller,
      next_path  type string,
      exc        type ref to cx_root,
      req        type ref to data.
    field-symbols:
      <fs_token> type any.

    request ?= server->request.
    response ?= server->response.
    path = request->get_header_field( name = '~request_uri' ).
    body = request->get_cdata( ).
    verb = request->get_method( ).
    split path at slash into dummy pysap api version route.
    split route at parm_del into route parms.
    if version is not initial.
      next_path = request->get_header_field( name = '~request_uri' ).
      split version at parm_del into version dummy.
      api = to_upper( |{ cl_abap_classdescr=>get_class_name( this ) }| & |{ sep }| & |{ version }| ).
      split api at equal into dummy api.
      create object controller type (api).
      if controller is bound.
        try.
            call method controller->execute
              exporting
                verb     = verb
                version  = version
                route    = route
                parms    = parms
                body     = body
              changing
                response = response.
          catch cx_root into exc.
        endtry.
      else.
        bad_request.
      endif.
    else.
      bad_request.
    endif.
  endmethod.
ENDCLASS.
