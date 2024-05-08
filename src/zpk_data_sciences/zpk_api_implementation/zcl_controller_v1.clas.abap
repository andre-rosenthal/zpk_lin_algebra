class zcl_controller_v1 definition
  public
  inheriting from zcl_pysap
  create public .

  public section.

    interfaces zif_controller .

    aliases execute
      for zif_controller~execute .

    class-methods class_constructor .
    methods constructor .
  protected section.
private section.

  class-data THIS type ref to ZCL_MODEL .
ENDCLASS.



CLASS ZCL_CONTROLLER_V1 IMPLEMENTATION.


  method class_constructor.
    if this is initial.
      this ?= new zcl_model( ).
    endif.
  endmethod.


  method constructor.
    super->constructor( ).
  endmethod.


  method zif_controller~execute.
    constants:
      parm_del type char1 value '?',
      sep      type char1 value '_',
      slash    type char1 value '/',
      parm_sep type char1 value '&'.
    data:
      path      type string,
      log       type string_table,
      api       type string,
      delegate  type ref to zif_model,
      next_path type string,
      exc       type ref to cx_root,
      req       type ref to data.
    field-symbols:
      <fs_token> type any.

    api = to_upper( |{ cl_abap_classdescr=>get_class_name( this ) }| & |{ sep }| & |{ version }| ).
    create object delegate type (api).
    check delegate is bound.
    case verb.
      when if_rest_message=>gc_method_get.
        call method delegate->execute
          exporting
            parms    = parms
            route    = route
          changing
            response = response.
      when if_rest_message=>gc_method_post.
        call method delegate->execute
          exporting
            body     = body
            route    = route
          changing
            response = response.
      when others.
        bad_request.
    endcase.
  endmethod.
ENDCLASS.
