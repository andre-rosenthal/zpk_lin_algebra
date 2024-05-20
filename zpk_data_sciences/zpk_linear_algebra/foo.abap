CLASS zcl_eigen_calculation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: tt_matrix TYPE STANDARD TABLE OF STANDARD TABLE OF f WITH DEFAULT KEY.
    METHODS: constructor IMPORTING iv_size TYPE i,
             set_matrix IMPORTING it_matrix TYPE tt_matrix,
             calculate_eigenvalues RETURNING VALUE(rt_eigenvalues) TYPE tt_matrix,
             validate_matrix RETURNING VALUE(rv_valid) TYPE abap_bool.

  PRIVATE SECTION.
    DATA: gv_size TYPE i,
          gt_matrix TYPE tt_matrix.

ENDCLASS.

CLASS zcl_eigen_calculation IMPLEMENTATION.

  METHOD constructor.
    gv_size = iv_size.
  ENDMETHOD.

  METHOD set_matrix.
    gt_matrix = it_matrix.
  ENDMETHOD.

  METHOD validate_matrix.
    DATA: lv_row_count TYPE i,
          lv_col_count TYPE i.

    lv_row_count = lines( gt_matrix ).
    CHECK lv_row_count = gv_size.

    LOOP AT gt_matrix INTO DATA(lt_row).
      lv_col_count = lines( lt_row ).
      IF lv_col_count <> gv_size.
        rv_valid = abap_false.
        RETURN.
      ENDIF.
    ENDLOOP.

    rv_valid = abap_true.
  ENDMETHOD.

  METHOD calculate_eigenvalues.
    IF NOT validate_matrix( ).
      RAISE EXCEPTION TYPE cx_sy_arithmetic_error
        EXPORTING textid = cx_sy_arithmetic_error=>standard
                  text   = 'Matrix is not set properly'.
    ENDIF.

    DATA: lv_max_el TYPE f,
          lv_max_row TYPE i,
          lv_tmp TYPE f,
          lv_c TYPE f,
          lv_x TYPE f,
          lt_x TYPE tt_matrix,
          lv_i TYPE i,
          lv_j TYPE i,
          lv_k TYPE i.

    FIELD-SYMBOLS: <row> TYPE TABLE,
                   <max_row> TYPE TABLE,
                   <elem> TYPE f.

    " Conversion to upper triangular form with pivoting
    DO gv_size TIMES.
      lv_i = sy-index - 1;

      " Find maximum element for pivoting
      lv_max_el = abs( gt_matrix[ lv_i ][ lv_i ] );
      lv_max_row = lv_i;
      DO gv_size - lv_i TIMES.
        lv_k = lv_i + sy-index;
        IF abs( gt_matrix[ lv_k ][ lv_i ] ) > lv_max_el.
          lv_max_el = abs( gt_matrix[ lv_k ][ lv_i ] );
          lv_max_row = lv_k.
        ENDIF.
      ENDDO.

      " Swap rows if necessary
      IF lv_max_row <> lv_i.
        ASSIGN gt_matrix[ lv_i ] TO <row>.
        ASSIGN gt_matrix[ lv_max_row ] TO <max_row>.
        LOOP AT <row> INTO <elem> FROM 1.
          lv_tmp = <elem>.
          <elem> = <max_row>[ sy-tabix ].
          <max_row>[ sy-tabix ] = lv_tmp.
        ENDLOOP.
      ENDIF.

      " Zero out elements below the pivot
      DO gv_size - lv_i - 1 TIMES.
        lv_k = lv_i + 1 + sy-index;
        lv_c = -gt_matrix[ lv_k ][ lv_i ] / gt_matrix[ lv_i ][ lv_i ].
        DO gv_size TIMES.
          lv_j = sy-index.
          IF lv_i = lv_j.
            gt_matrix[ lv_k ][ lv_j ] = 0.
          ELSE.
            gt_matrix[ lv_k ][ lv_j ] += lv_c * gt_matrix[ lv_i ][ lv_j ].
          ENDIF.
        ENDDO.
      ENDDO.
    ENDDO.

    " Extract eigenvalues from the diagonal
    lt_x = VALUE tt_matrix( FOR lv_i IN 0 .. gv_size - 1
                            ( VALUE #( BASE lt_x COMPONENTS OF gt_matrix[ lv_i ][ lv_i ] ) ) ).

    rt_eigenvalues = lt_x.
  ENDMETHOD.

ENDCLASS.
