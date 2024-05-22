class ZCL_PYSAP definition
  public
  abstract
  create public .

public section.

  constants ZERO type DECFLOAT34 value '0.0' ##NO_TEXT.
  constants ONE type DECFLOAT34 value '1.0' ##NO_TEXT.
  constants NEG1 type DECFLOAT34 value '-1.0' ##NO_TEXT.
  constants E type DECFLOAT34 value '1.0e-10' ##NO_TEXT.
  constants DELTA type DECFLOAT34 value '0.0001' ##NO_TEXT.
  constants MAX_ITERATION type I value 1000 ##NO_TEXT.
  constants MAX_ROTATION type I value 45 ##NO_TEXT.

  methods DEEP_COPY
    importing
      !SOURCE type ref to ZCL_PYSAP optional
    returning
      value(TARGET) type ref to ZCL_PYSAP .
  protected section.
    class-data ref type ref to data.
    class-data dim type zcl_utilities=>dimension .
    class-data pysap type string .
private section.

  data SIGNATURE type STRING .
ENDCLASS.



CLASS ZCL_PYSAP IMPLEMENTATION.


  method DEEP_COPY.
  endmethod.
ENDCLASS.
