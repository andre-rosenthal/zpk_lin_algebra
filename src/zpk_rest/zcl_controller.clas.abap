class zcl_controller definition
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

    class-data this type ref to zcl_controller .
ENDCLASS.



CLASS ZCL_CONTROLLER IMPLEMENTATION.


  method class_constructor.
    if this is initial.
      this = new #( ).
    endif.
  endmethod.


  method constructor.
    super->constructor( ).
  endmethod.


  method zif_controller~execute.
  endmethod.
ENDCLASS.
