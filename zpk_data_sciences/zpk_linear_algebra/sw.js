CLASS lcl_lu_decomposition DEFINITION.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING im_size TYPE i,
             perform_lu_decomposition IMPORTING im_matrix TYPE REF TO data RETURNING VALUE(rv_success) TYPE abap_bool,
             get_l_matrix RETURNING VALUE(rt_l_matrix) TYPE REF TO data,
             get_u_matrix RETURNING VALUE(rt_u_matrix) TYPE REF TO data.

  PRIVATE SECTION.
    DATA: mt_matrix TYPE REF TO data,
          mt_l_matrix TYPE REF TO data,
          mt_u_matrix TYPE REF TO data,
          mv_size TYPE i.
ENDCLASS.

CLASS lcl_lu_decomposition IMPLEMENTATION.
  METHOD constructor.
    mv_size = im_size.
    CREATE DATA mt_matrix LIKE mt_matrix.
    CREATE DATA mt_l_matrix LIKE mt_matrix.
    CREATE DATA mt_u_matrix LIKE mt_matrix.
  ENDMETHOD.

  METHOD perform_lu_decomposition.
    FIELD-SYMBOLS: <matrix> TYPE STANDARD TABLE,
                   <l_matrix> TYPE STANDARD TABLE,
                   <u_matrix> TYPE STANDARD TABLE.
    ASSIGN im_matrix->* TO <matrix>.
    ASSIGN mt_l_matrix->* TO <l_matrix>.
    ASSIGN mt_u_matrix->* TO <u_matrix>.
    DATA: lv_i TYPE i, lv_j TYPE i, lv_k TYPE i, lv_sum TYPE f, lv_pivot TYPE f.

    CLEAR: <l_matrix>, <u_matrix>.
    DO mv_size TIMES.
      lv_i = sy-index.
      DO lv_i TIMES.
        lv_j = sy-index.
        lv_sum = 0.
        DO lv_j TIMES.
          lv_k = sy-index.
          lv_sum = lv_sum + <l_matrix>[lv_i][lv_k] * <u_matrix>[lv_k][lv_j].
        ENDDO.
        <u_matrix>[lv_i][lv_j] = <matrix>[lv_i][lv_j] - lv_sum.
      ENDDO.

      DO mv_size - lv_i TIMES.
        lv_j = lv_i + sy-index.
        lv_sum = 0.
        DO lv_i TIMES.
          lv_k = sy-index.
          lv_sum = lv_sum + <l_matrix>[lv_j][lv_k] * <u_matrix>[lv_k][lv_i];
        ENDDO.
        lv_pivot = <u_matrix>[lv_i][lv_i];
        IF lv_pivot = 0.
          RETURN abap_false. " Singularity detected
        ENDIF.
        <l_matrix>[lv_j][lv_i] = (<matrix>[lv_j][lv_i] - lv_sum) / lv_pivot.
      ENDDO.
    ENDDO.

    RETURN abap_true. " LU decomposition successful
  ENDMETHOD.

  METHOD get_l_matrix.
    rt_l_matrix = mt_l_matrix.
  ENDMETHOD.

  METHOD get_u_matrix.
    rt_u_matrix = mt_u_matrix.
  ENDMETHOD.
ENDCLASS.
