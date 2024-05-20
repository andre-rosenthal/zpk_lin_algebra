class zcl_eigen_composition definition
  public
  inheriting from zcl_pysap
  final
  create public .

  public section.

    types:
      egvalue type standard table of f with default key .

    class-methods class_constructor .
    class-methods do_hessenberg
      importing
        !a            type zcl_complex=>t_complex_matrix
      exporting
        !eigenvalues  type zcl_complex=>t_complex_vector
        !eigenvectors type zcl_complex=>t_complex_matrix .
    class-methods do_qr_decomposition .
  protected section.


private section.

  class-data ROW type I .
  class-data COL type I .
  class-data REF type ref to DATA .
  class-data DIM type ZCL_UTILITIES=>DIMENSION .
  class-data ORIGIN type ZCL_COMPLEX=>T_COMPLEX_MATRIX .
  class-data ROT type ZCL_COMPLEX=>T_COMPLEX_MATRIX .
  class-data M type ZCL_COMPLEX=>T_COMPLEX_MATRIX .
  class-data EVECTORS type ZCL_COMPLEX=>T_COMPLEX_MATRIX .
  class-data EVALUES type ZCL_COMPLEX=>T_COMPLEX_VECTOR .
  class-data X type ZCL_COMPLEX=>T_COMPLEX_VECTOR .
  class-data Y type ZCL_COMPLEX=>T_COMPLEX_VECTOR .
  class-data OLD type ref to ZCL_MATRIX .
  class-data OLD_VALUES type ref to ZCL_MATRIX .
  class-data OLD_VECTORS type ref to ZCL_MATRIX .
  class-data COS type ZCL_COMPLEX=>T_FLOAT34 .
  class-data SIN type ZCL_COMPLEX=>T_FLOAT34 .
  class-data TEMP type ZCL_COMPLEX=>T_FLOAT34 .
  class-data PHI type DECFLOAT34 .

  class-methods GAUSSIAN
    importing
      !A type ZCL_COMPLEX=>T_COMPLEX_MATRIX
    exporting
      !EIGENVALUES type ZCL_COMPLEX=>T_COMPLEX_VECTOR
      !EIGENVECTORS type ZCL_COMPLEX=>T_COMPLEX_MATRIX .
  class-methods SWITCH_ROWS
    importing
      !START type I .
  class-methods ELIMINATE .
  class-methods SOLVE .
  class-methods HESSENBERG
    importing
      !A type ZCL_COMPLEX=>T_COMPLEX_MATRIX
    exporting
      !EIGENVALUES type ZCL_COMPLEX=>T_COMPLEX_VECTOR
      !EIGENVECTORS type ZCL_COMPLEX=>T_COMPLEX_MATRIX .
  class-methods QR .
  class-methods RQ .
  class-methods RUN_HESSENBERG
    importing
      !A type ZCL_COMPLEX=>T_COMPLEX_MATRIX
    exporting
      !EIGENVALUES type ZCL_COMPLEX=>T_COMPLEX_VECTOR
      !EIGENVECTORS type ZCL_COMPLEX=>T_COMPLEX_MATRIX .
  class-methods RUN_QR .
  class-methods RUN_RQ .
  class-methods CALCULATE_EVALUES .
  class-methods IS_DELTA_OK .
  class-methods CALCULATE_EVECTORS .
ENDCLASS.



CLASS ZCL_EIGEN_COMPOSITION IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method ZCL_EIGEN_COMPOSITION=>CALCULATE_EVALUES
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method calculate_evalues.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method ZCL_EIGEN_COMPOSITION=>CALCULATE_EVECTORS
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method calculate_evectors.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EIGEN_COMPOSITION=>CLASS_CONSTRUCTOR
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method class_constructor.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EIGEN_COMPOSITION=>DO_HESSENBERG
* +-------------------------------------------------------------------------------------------------+
* | [--->] A                              TYPE        ZCL_COMPLEX=>T_COMPLEX_MATRIX
* | [<---] EIGENVALUES                    TYPE        ZCL_COMPLEX=>T_COMPLEX_VECTOR
* | [<---] EIGENVECTORS                   TYPE        ZCL_COMPLEX=>T_COMPLEX_MATRIX
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method do_hessenberg.
    data:
      i      type i,
      k      type i,
      buffer type zcl_complex=>t_float34.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EIGEN_COMPOSITION=>DO_QR_DECOMPOSITION
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method do_qr_decomposition.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method ZCL_EIGEN_COMPOSITION=>ELIMINATE
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method eliminate.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method ZCL_EIGEN_COMPOSITION=>GAUSSIAN
* +-------------------------------------------------------------------------------------------------+
* | [--->] A                              TYPE        ZCL_COMPLEX=>T_COMPLEX_MATRIX
* | [<---] EIGENVALUES                    TYPE        ZCL_COMPLEX=>T_COMPLEX_VECTOR
* | [<---] EIGENVECTORS                   TYPE        ZCL_COMPLEX=>T_COMPLEX_MATRIX
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method gaussian.
    origin[] = a[].
    dim-row = lines( a ).
    dim-col = dim-row.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method ZCL_EIGEN_COMPOSITION=>HESSENBERG
* +-------------------------------------------------------------------------------------------------+
* | [--->] A                              TYPE        ZCL_COMPLEX=>T_COMPLEX_MATRIX
* | [<---] EIGENVALUES                    TYPE        ZCL_COMPLEX=>T_COMPLEX_VECTOR
* | [<---] EIGENVECTORS                   TYPE        ZCL_COMPLEX=>T_COMPLEX_MATRIX
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method hessenberg.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method ZCL_EIGEN_COMPOSITION=>IS_DELTA_OK
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method is_delta_ok.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method ZCL_EIGEN_COMPOSITION=>QR
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method qr.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method ZCL_EIGEN_COMPOSITION=>RQ
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method rq.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method ZCL_EIGEN_COMPOSITION=>RUN_HESSENBERG
* +-------------------------------------------------------------------------------------------------+
* | [--->] A                              TYPE        ZCL_COMPLEX=>T_COMPLEX_MATRIX
* | [<---] EIGENVALUES                    TYPE        ZCL_COMPLEX=>T_COMPLEX_VECTOR
* | [<---] EIGENVECTORS                   TYPE        ZCL_COMPLEX=>T_COMPLEX_MATRIX
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method run_hessenberg.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method ZCL_EIGEN_COMPOSITION=>RUN_QR
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method run_qr.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method ZCL_EIGEN_COMPOSITION=>RUN_RQ
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method run_rq.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method ZCL_EIGEN_COMPOSITION=>SOLVE
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method solve.
    data:
      i   type i,
      j   type i,
      k   type i,
      rf  type ref to data,
      tmp type ref to zcl_matrix.
    field-symbols:
      <fs_o>   type standard table,
      <fs_y>   type standard table,

      <fs_tmp> type standard table,
      <fs_okl> type any,
      <fs_okk> type any.

    dpreparem tmp <fs_tmp>.
    deref y <fs_y>.
    get reference of <fs_y> INTO rf.
    tmp->alter_col( index = 1 column = rf ).
    x[ dim-row - 1 ]-re = one.
    x[ dim-row - 1 ]-im = zero.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method ZCL_EIGEN_COMPOSITION=>SWITCH_ROWS
* +-------------------------------------------------------------------------------------------------+
* | [--->] START                          TYPE        I
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method switch_rows.
    data:
      tmp type zcl_complex=>cplx,
      i   type i,
      j   type i,
      k   type i,
      l   type i,
      m   type i.
    field-symbols:
      <fs_o>   type standard table,
      <fs_y>   type standard table,
      <fs_oik> type any,
      <fs_oij> type any.

    assign origin to <fs_o>.
    m = dim-row - 2.
    l = m + 1.
    for_n i 2 m.
    for j l.
      m_i_j j <fs_o> i <fs_oij>.
      tmp = <fs_oij>.
      k = i + 1.
      m_i_j j <fs_o> k <fs_oik>.
      <fs_oij> = <fs_oik>.
      <fs_oik> = tmp.
    endfor j.
    deref y <fs_y>.
    tmp = <fs_y>[ i ].
    k = i + 1.
    <fs_y>[ i ] = <fs_y>[ k ].
    <fs_y>[ k ] = tmp.
  endfor i.
endmethod.
ENDCLASS.