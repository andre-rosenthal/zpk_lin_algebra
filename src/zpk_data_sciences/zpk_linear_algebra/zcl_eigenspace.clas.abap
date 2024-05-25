class zcl_eigenspace definition
  public
  inheriting from zcl_pysap
  final
  create public .

  public section.
    types:
      laplacian type standard table of ref to object .
    types:
      rspace  type standard table of ref to object,
      lspace  type standard table of decfloat34 with default key,
      l2space type standard table of lspace with default key,
      mspace  type standard table of ref to zcl_matrix,
      vspace  type standard table of ref to zcl_vector,
      cspace  type standard table of ref to zcl_complex.
    class-data:
      lspace_ type lspace.
    class-methods class_constructor .
    methods constructor .

    methods deep_copy
        redefinition .
  protected section.
  private section.
ENDCLASS.



CLASS ZCL_EIGENSPACE IMPLEMENTATION.


  method class_constructor.
  endmethod.


  method constructor.
    super->constructor( ).
  endmethod.


  method deep_copy.
  endmethod.
ENDCLASS.
