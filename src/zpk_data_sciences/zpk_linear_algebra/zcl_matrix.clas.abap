class ZCL_MATRIX definition
  public
  inheriting from ZCL_PYSAP
  final
  create private .

public section.

  methods ADDITION
    importing
      !B type ref to ZCL_MATRIX .
  class-methods ADDITIONS
    importing
      !A type ref to ZCL_MATRIX
      !B type ref to ZCL_MATRIX optional
    returning
      value(C) type ref to ZCL_MATRIX .
  methods ALTER_COL
    importing
      !INDEX type I
      !COLUMN type ref to DATA
    returning
      value(B) type ref to ZCL_MATRIX .
  class-methods ALTER_COLS
    importing
      !INDEX type I
      !A type ref to ZCL_MATRIX
      !COLUMN type ref to DATA
    returning
      value(B) type ref to ZCL_MATRIX .
  methods ALTER_ROW
    importing
      !INDEX type I
      !ROW type ref to DATA
    returning
      value(B) type ref to ZCL_MATRIX .
  class-methods ALTER_ROWS
    importing
      !INDEX type I
      !A type ref to ZCL_MATRIX
      !ROW type ref to DATA
    returning
      value(B) type ref to ZCL_MATRIX .
  methods CHAR_POLYNOMIAL
    returning
      value(P) type ref to OBJECT .
  class-methods CHAR_POLYNOMIALS
    importing
      !A type ref to ZCL_MATRIX optional
    returning
      value(P) type ref to OBJECT .
  methods COL
    importing
      !INDEX type I
    returning
      value(COLUMN) type ref to ZCL_VECTOR .
  class-methods COLS
    importing
      !A type ref to ZCL_MATRIX
      !INDEX type I
    returning
      value(COLUMN) type ref to ZCL_VECTOR .
  class-methods CREATE_INSTANCE
    importing
      !DIM type ZCL_UTILITIES=>DIMENSION
      !KIND type ABAP_TYPEKIND
      !RAND type BOOLEAN default ABAP_FALSE
    returning
      value(A) type ref to ZCL_MATRIX .
  methods DETERMINANT
    returning
      value(DET) type DECFLOAT34 .
  class-methods DETERMINANTS
    importing
      !A type ref to ZCL_MATRIX
    returning
      value(DET) type DECFLOAT34 .
  methods DIAGONALIZE .
  class-methods DIAGONALIZES
    importing
      !A type ref to ZCL_MATRIX optional
    returning
      value(B) type ref to ZCL_MATRIX .
  methods DIMENSION
    returning
      value(DIM) type ZCL_UTILITIES=>DIMENSION .
  class-methods DIMENSIONS
    importing
      !A type ref to ZCL_MATRIX
    returning
      value(DIM) type ZCL_UTILITIES=>DIMENSION .
  methods DOT_PRODUCT
    importing
      !A type ref to ZCL_MATRIX
    returning
      value(DOT) type ref to ZCL_MATRIX .
  class-methods DOT_PRODUCTS
    importing
      !A type ref to ZCL_MATRIX
      !B type ref to ZCL_MATRIX
    returning
      value(DOT) type ref to ZCL_MATRIX .
  methods GET
    returning
      value(CONTAINER) type ref to DATA .
  class-methods GETS
    importing
      !A type ref to ZCL_MATRIX
    returning
      value(CONTAINER) type ref to DATA .
  methods GET_CONTAINER
    returning
      value(CONTAINER) type ref to DATA .
  class-methods GET_CONTAINERS
    importing
      !A type ref to ZCL_MATRIX
    returning
      value(CONTAINER) type ref to DATA .
  methods GET_ELEMENT
    importing
      !DIM type ZCL_UTILITIES=>DIMENSION optional
      !ROW type I optional
      !COL type I optional
    returning
      value(VALUE) type DECFLOAT34 .
  class-methods GET_ELEMENTS
    importing
      !DIM type ZCL_UTILITIES=>DIMENSION
      !A type ref to ZCL_MATRIX
    exporting
      !VALUE type ANY .
  methods IDENTITY
    returning
      value(ID) type ref to ZCL_MATRIX .
  class-methods IDENTITYS
    importing
      !A type ref to ZCL_MATRIX optional
      !KIND type ABAP_TYPEKIND optional
    changing
      !DIM type ZCL_UTILITIES=>DIMENSION optional
    returning
      value(ID) type ref to ZCL_MATRIX .
  methods INTERNAL_PRODUCT
    importing
      !A type ref to ZCL_MATRIX
    returning
      value(DIM) type ZCL_UTILITIES=>DIMENSION .
  class-methods INTERNAL_PRODUCTS
    importing
      !A type ref to ZCL_MATRIX
    returning
      value(DIM) type ZCL_UTILITIES=>DIMENSION .
  class-methods INVERSE_ITERATION
    importing
      !A type ref to ZCL_MATRIX
      !EIGENVALUE type DECFLOAT34
    returning
      value(EIGENVECTOR) type ref to ZCL_VECTOR .
  methods INVERT .
  class-methods INVERTS
    importing
      !A type ref to ZCL_MATRIX optional
    returning
      value(INV) type ref to ZCL_MATRIX .
  class-methods IS_EQUAL
    importing
      !A type ref to ZCL_MATRIX
      !B type ref to ZCL_MATRIX
    returning
      value(EQU) type BOOLEAN .
  class-methods IS_ORTHOGONAL
    importing
      !A type ref to ZCL_MATRIX
    returning
      value(BOOL) type BOOLEAN .
  class-methods KINDS
    importing
      !A type ref to ZCL_MATRIX
    returning
      value(KIND) type ABAP_TYPEKIND .
  methods LAPLACE_EXPANSION
    returning
      value(DET) type DECFLOAT34 .
  class-methods LU_DECOMPOSITION
    importing
      !A type ref to ZCL_MATRIX
    exporting
      !L type ref to ZCL_MATRIX
      !U type ref to ZCL_MATRIX
      !SINGULAR type BOOLEAN .
  methods MULTIPLICATION
    importing
      !B type ref to ZCL_MATRIX
    returning
      value(C) type ref to ZCL_MATRIX .
  class-methods MULTIPLICATIONS
    importing
      !A type ref to ZCL_MATRIX
      !B type ref to ZCL_MATRIX
    returning
      value(C) type ref to ZCL_MATRIX .
  methods MULTIPLY_SCALAR
    importing
      !X type ANY .
  class-methods MULTIPLY_SCALARS
    importing
      !X type ANY
      !A type ref to ZCL_MATRIX
    returning
      value(AX) type ref to ZCL_MATRIX .
  methods PRODUCT
    importing
      !B type ref to ZCL_MATRIX
    returning
      value(C) type ref to ZCL_MATRIX .
  class-methods PRODUCTS
    importing
      !A type ref to ZCL_MATRIX
      !B type ref to ZCL_MATRIX
    returning
      value(C) type ref to ZCL_MATRIX .
  class-methods QR_DECOMPOSITION
    importing
      !A type ref to ZCL_MATRIX
    exporting
      !Q type ref to ZCL_MATRIX
      !R type ref to ZCL_MATRIX
      !QR type ref to ZCL_MATRIX .
  methods ROW
    importing
      !INDEX type I
    returning
      value(ROW) type ref to ZCL_VECTOR .
  class-methods ROWS
    importing
      !A type ref to ZCL_MATRIX
      !INDEX type I
    returning
      value(ROW) type ref to ZCL_VECTOR .
  methods SET
    changing
      !CONTAINER type ref to DATA .
  class-methods SETS
    importing
      !A type ref to ZCL_MATRIX
    changing
      value(CONTAINER) type ref to DATA .
  methods SUB_FROM_ELEMENT
    importing
      !DIM type ZCL_UTILITIES=>DIMENSION optional
      !VALUE type ANY
      !ROW type I optional
      !COL type I optional .
  methods ADD_TO_ELEMENT
    importing
      !DIM type ZCL_UTILITIES=>DIMENSION optional
      !VALUE type ANY
      !ROW type I optional
      !COL type I optional .
  methods SET_ELEMENT
    importing
      !DIM type ZCL_UTILITIES=>DIMENSION optional
      !VALUE type ANY
      !ROW type I optional
      !COL type I optional .
  class-methods SUB_FROM_ELEMENTS
    importing
      !DIM type ZCL_UTILITIES=>DIMENSION
      !VALUE type ANY
      !A type ref to ZCL_MATRIX
      !ROW type I optional
      !COL type I optional .
  class-methods ADD_TO_ELEMENTS
    importing
      !DIM type ZCL_UTILITIES=>DIMENSION
      !VALUE type ANY
      !A type ref to ZCL_MATRIX
      !ROW type I optional
      !COL type I optional .
  class-methods SET_ELEMENTS
    importing
      !DIM type ZCL_UTILITIES=>DIMENSION
      !VALUE type ANY
      !A type ref to ZCL_MATRIX .
  methods SUBTRACT
    importing
      !B type ref to ZCL_MATRIX
    returning
      value(C) type ref to ZCL_MATRIX .
  class-methods SUBTRACTS
    importing
      !A type ref to ZCL_MATRIX
      !B type ref to ZCL_MATRIX optional
    returning
      value(C) type ref to ZCL_MATRIX .
  methods TO_STRING
    returning
      value(S) type STRING .
  class-methods TO_STRINGS
    importing
      !A type ref to ZCL_MATRIX optional
    returning
      value(S) type STRING .
  methods TRANSPOSE
    returning
      value(T) type ref to ZCL_MATRIX .
  class-methods TRANSPOSES
    importing
      !A type ref to ZCL_MATRIX
    returning
      value(T) type ref to ZCL_MATRIX .
  methods VECTOR_MULTIPLICATION .
  class-methods VECTOR_MULTIPLICATIONS
    importing
      !A type ref to ZCL_MATRIX
      !V type ref to ZCL_VECTOR
    returning
      value(Z) type ref to ZCL_VECTOR .
protected section.

  methods CONSTRUCTOR
    importing
      !DIM type ZCL_UTILITIES=>DIMENSION
      !KIND type ABAP_TYPEKIND
      !RAND type BOOLEAN default ABAP_FALSE .
  methods _COMBINE_QUARTERS
    importing
      !A1 type ref to ZCL_MATRIX
      !A2 type ref to ZCL_MATRIX
      !A3 type ref to ZCL_MATRIX
      !A4 type ref to ZCL_MATRIX
    returning
      value(A) type ref to ZCL_MATRIX .
  class-methods _DUPLICATE
    importing
      !A type ref to ZCL_MATRIX
    returning
      value(B) type ref to ZCL_MATRIX .
  class-methods _GET_SET_CONTAINERS
    importing
      !A type ref to ZCL_MATRIX
      !GET type BOOLEAN default ABAP_TRUE
    changing
      !CONTAINER type ref to DATA .
  class-methods _GET_SET_ELEMENT
    importing
      !DIM type ZCL_UTILITIES=>DIMENSION optional
      !SET type BOOLEAN default ABAP_TRUE
      !ROW type I optional
      !COL type I optional
      !ADD_TO type BOOLEAN default ABAP_FALSE
      !SUB_FROM type BOOLEAN default ABAP_FALSE
    changing
      !CONTAINER type ref to DATA
      !VALUE type DECFLOAT34 optional .
  class-methods _IS_EMPTY
    importing
      !A type ref to ZCL_MATRIX
    returning
      value(BOOL) type BOOLEAN .
  class-methods _IS_MULTIPLIABLE
    importing
      !A type ref to ZCL_MATRIX
      !B type ref to ZCL_MATRIX
    returning
      value(BOOL) type BOOLEAN .
  class-methods _IS_SAME_DIMENSION
    importing
      !A type ref to ZCL_MATRIX
      !B type ref to ZCL_MATRIX
    returning
      value(BOOL) type BOOLEAN .
  class-methods _IS_SQUARE
    importing
      !A type ref to ZCL_MATRIX
    returning
      value(BOOL) type BOOLEAN .
  class-methods _LAPLACE_EXPANSION
    importing
      !A type ref to ZCL_MATRIX
    returning
      value(DET) type DECFLOAT34 .
  class-methods _LU_DECOMPOSITION
    importing
      !A type ref to ZCL_MATRIX
    exporting
      !LU type ref to DATA
    changing
      !T type I
      !P type ref to DATA .
  class-methods _PERMUTATE
    importing
      !LU type ref to DATA
      !P type ref to DATA
    returning
      value(PU) type ref to DATA .
  class-methods _PLUS_MINUS
    importing
      !A type ref to ZCL_MATRIX
      !B type ref to ZCL_MATRIX optional
      !PLUS type BOOLEAN default ABAP_TRUE
    returning
      value(C) type ref to ZCL_MATRIX .
  class-methods _SPLIT_INTO_QUARTERS
    importing
      !A type ref to ZCL_MATRIX
    exporting
      !A1 type ref to ZCL_MATRIX
      !A2 type ref to ZCL_MATRIX
      !A3 type ref to ZCL_MATRIX
      !A4 type ref to ZCL_MATRIX .
private section.

  data RANDOM type ref to CL_RANDOM_NUMBER .
  data CONTAINER type ref to DATA .
  data KIND type ABAP_TYPEKIND .
  class-data ST_ROW type I .
  class-data ST_COL type I .

  class-methods GET_ROW_MAX_DIAGONAL
    importing
      !COL type I
      !A type ref to ZCL_MATRIX
    returning
      value(MAX) type I .
  class-methods SWAP_ROWS
    importing
      !RX type I
      !RY type I
      !A type ref to ZCL_MATRIX .
  class-methods ZERO_COL
    importing
      !COL type I
      !A type ref to ZCL_MATRIX .
ENDCLASS.



CLASS ZCL_MATRIX IMPLEMENTATION.


  method addition.
    data:
        me_ type ref to zcl_matrix.

    me_ ?= additions( a = me b = b  ).
    free me->container.
    me->container = me_->container.
    free me_.
  endmethod.


  method additions.
    c ?= _plus_minus( a = a b = b ).
  endmethod.


method add_to_element.
  data:
   val type decfloat34.

  val = value.
  call method zcl_matrix=>_get_set_element
    exporting
      dim       = dim
      row       = row
      col       = col
      add_to    = abap_true
    changing
      container = me->container
      value     = val.

endmethod.


method add_to_elements.
  data:
     val type decfloat34.

  val = value.
  call method zcl_matrix=>_get_set_element
    exporting
      dim       = dim
      row       = row
      col       = col
      add_to    = abap_true
    changing
      container = a->container
      value     = val.
endmethod.


  method alter_col.
    b ?= alter_cols( index = index a = me column = column ).
  endmethod.


  method alter_cols.
    data:
      container type ref to data,
      i         type i.
    field-symbols:
      <fs_column>    type standard table,
      <fs_source>    type any,
      <fs_target>    type any,
      <fs_container> type standard table.

    check a is bound and column is bound.
    check index > 0 and index <= a->dim-col.
    b ?= _duplicate( a ).
    container ?= b->get_container(  ).
    assign container->* to <fs_container>.
    assign column->* to <fs_column>.
    i = 1.
    do a->dim-row times.
      assign component index of structure <fs_container>[ i ] to <fs_target>.
      assign <fs_column>[ i ] to <fs_source>.
      <fs_target> = <fs_source>.
      add 1 to i.
    enddo.
  endmethod.


  method alter_row.
    b ?= alter_rows( index = index  a = me row  = row ).
  endmethod.


  method alter_rows.
    data:
      container type ref to data.
    field-symbols:
      <fs_row>       type any,
      <fs_container> type standard table.

    check a is bound and row is bound.
    check index > 0 and index <= a->dim-row.
    b ?= _duplicate( a ).
    container ?= b->get_container(  ).
    assign container->* to <fs_container>.
    assign row->* to <fs_row>.
    <fs_container>[ index ] = corresponding #( <fs_row> ).
  endmethod.


  method char_polynomial.
  endmethod.


  method char_polynomials.
  endmethod.


  method col.
    column ?= cols( a  = me  index  = index ).
  endmethod.


  method cols.
    data:
      i    type i,
      axis type ref to data.
    field-symbols:
      <fs_mai>  type standard table,
      <fs_cell> type any,
      <fs_caic> type standard table.

    check a is bound.
    assign a->container->* to <fs_mai>.
    column ?= zcl_vector=>create_instance( kind = a->kind lenght = a->dim-row ).
    axis ?= column->get_container( ).
    assign axis->* to <fs_caic>.
    i = 1.
    do a->dim-row times.
      assign component index of structure <fs_mai>[ i ] to <fs_cell>.
      <fs_caic>[ i ] = <fs_cell>.
      add 1 to i.
    enddo.
  endmethod.


  method constructor.
    data:
      type      type ref to data,
      container type ref to data,
      line      type ref to data,
      i         type i,
      j         type i,
      in        type boolean.
    field-symbols:
      <fs_container> type any table,
      <fs_type>      type any,
      <fs_row>       type any,
      <fs_col>       type any.

    super->constructor( ).
    if kind is initial.
      return.
    endif.
    me->kind = kind.
    call method zcl_utilities=>create_type_from_kind
      exporting
        kind = kind
      importing
        type = type.
    assign type->* to <fs_type>.
    check zcl_utilities=>is_numeric( <fs_type> ).
    call method zcl_utilities=>create_dynamic_table_type_t
      exporting
        type  = type
      importing
        table = container
        line  = line.
    check container is bound and line is bound.
    assign container->* to <fs_container>.
    insert initial line into table <fs_container> reference into line.
    call method zcl_utilities=>propagate_columns
      exporting
        column = line
        times  = dim-col
      importing
        table  = container
        line   = line.
    assign container->* to <fs_container>.
    i = dim-row - lines( <fs_container> ).
    if rand = abap_true.
      random = new cl_random_number( ).
      random->if_random_number~init( ).
      do i times.
        insert initial line into table <fs_container> assigning <fs_row>.
        j = 1.
        assign component j of structure <fs_row> to <fs_col>.
        if in = abap_false.
          in = zcl_utilities=>is_integer( <fs_col> ).
        endif.
        while sy-subrc = 0.
          if ( in = abap_true ).
            <fs_col> = random->if_random_number~get_random_int( i_limit = 1024 ).
          else.
            <fs_col> = random->if_random_number~get_random_float( ).
          endif.
          add 1 to j.
          assign component j of structure <fs_row> to <fs_col>.
        endwhile.
      enddo.
    else.
      do i times.
        insert initial line into table <fs_container>.
      enddo.
    endif.
    me->container ?= container.
    me->dim-col = dim-col.
    me->dim-row = dim-row.
  endmethod.


  method create_instance.
    a ?= new zcl_matrix( dim = dim kind = kind rand = rand ).
  endmethod.


  method determinant.
    det = determinants( a = me ).
  endmethod.


  method determinants.
    data:
      dim type zcl_utilities=>dimension,
      i   type i,
      j   type i,
      d   type decfloat34,
      b   type ref to zcl_matrix,
      c   type ref to zcl_matrix,
      p   type ref to data,
      t   type i,
      lu  type ref to data,
      x   type ref to data.
    field-symbols:
      <fs_luji> type any,
      <fs_a>    type standard table,
      <fs_x>    type standard table,
      <fs_lu>   type standard table,
      <fs_b>    type standard table,
      <fs_p>    type standard table.

    check a is bound.
    assign a->container->* to <fs_a>.
    check <fs_a> is not initial.
    dim = a->dim.
    b ?= _duplicate( a ).
    if _is_square( b ).
      assign b->container->* to <fs_b>.
      create data p type standard table of i.
      call method _lu_decomposition
        exporting
          a  = b
        importing
          lu = lu
        changing
          t  = t
          p  = p.
      check p is bound.
      assign p->* to <fs_p>.
      create data x type table of float.
      assign lu->* to <fs_lu>.
      assign x->* to <fs_x>.
      d = t.
      j = lines( <fs_lu> ).
      i = 1.
      while i <= j.
        assign component j of structure <fs_lu>[ i ] to <fs_luji>.
        d = d * <fs_luji>.
        add 1 to i.
      endwhile.
      det = d.
    else.
* See http://www.seas.ucla.edu/~vandenbe/133A/lectures/inverses.pdf
      b ?= transposes( a ).
      if b->dim-row < b->dim-col.
        c ?= multiplications( a = b b = a ).
      else.
        c ?= multiplications( a = a  b = b ).
      endif.
      det = determinants( c ).
    endif.
  endmethod.


  method diagonalize.

  endmethod.


  method diagonalizes.

  endmethod.


  method dimension.
    dim = dimensions( me ).
  endmethod.


  method dimensions.
    dim = a->dim.
  endmethod.


  method dot_product.
    dot ?= multiplications( a = me b = a ).
  endmethod.


  method dot_products.
    dot ?= multiplications( a = a b = b ).
  endmethod.


  method get.
    container = gets( me ).
  endmethod.


  method gets.
    call method zcl_matrix=>_get_set_containers
      exporting
        a         = a
      changing
        container = container.
  endmethod.


  method get_container.
    container ?= get_containers( me ).
  endmethod.


  method get_containers.
    check a is bound.
    container ?= a->container.
  endmethod.


  method get_element.
    field-symbols:
      <fs_v> type any.

    call method zcl_matrix=>_get_set_element
      exporting
        dim       = dim
        row       = row
        col       = col
        set       = abap_false
      changing
        container = me->container
        value     = value.
  endmethod.


  method get_elements.
    check a is bound.
    call method zcl_matrix=>_get_set_element
      exporting
        dim   = dim
        set   = abap_false
      changing
        container = a->container
        value = value.
  endmethod.


  method get_row_max_diagonal.
    data:
      i                 type i,
      j                 type i,
      dim               type zcl_utilities=>dimension,
      diagonal_row      type i,
      diagonal_col      type i,
      diagonal_row_next type i,
      max_cell          type decfloat34,
      max_row           type i.
    field-symbols:
      <fs_a>   type any,
      <fs_aij> type any.

    diagonal_row = col.
    diagonal_col = col.
    diagonal_row_next = col + 1.
    max_cell = a->get_element( row = diagonal_row col = diagonal_col ).
    max = diagonal_row.
    dim = a->dimension( ).
    for_n i diagonal_row_next dim-row.
    if abs( a->get_element( row = i col = diagonal_col ) ) > max_cell.
      max_cell = abs( a->get_element( row = i col = diagonal_col ) ).
      max = i.
    endif.
  endfor i.
endmethod.


method identity.
  id ?= zcl_matrix=>identitys( a = me ).
  me->container ?= id->container.
endmethod.


method identitys.
  data:
    i  type i.
  field-symbols:
    <fs_ii> type any,
    <fs_im> type standard table,
    <fs_t>  type any.

  if a is not supplied.
    if dim is initial.
      return.
    endif.
    id ?= zcl_matrix=>create_instance( dim = dim kind = kind ).
  else.
    id ?= _duplicate( a ).
    dim = a->dim.
  endif.
  assign id->container->* to <fs_im>.
  i = 1.
  do dim-row times.
    assign <fs_im>[ i ] to <fs_ii>.
    clear <fs_ii>.
    assign component i of structure <fs_ii> to <fs_t>.
    <fs_t> = 1.
    add 1 to i.
  enddo.
endmethod.


method internal_product.
  dim = a->dim.
endmethod.


method internal_products.
  dim = a->dim.
endmethod.


method inverse_iteration.
  data:
    i     type i,
    j     type i,
    k     type i,
    idx1  type i,
    idx2  type i,
    idx3  type i,
    sum   type decfloat34,
    pivot type i,
    temp  type decfloat34,
    ref   type ref to data,
    id    type ref to zcl_matrix,
    tmp   type ref to zcl_matrix,
    res   type ref to zcl_matrix,
    lower type ref to zcl_matrix,
    upper type ref to zcl_matrix.
  field-symbols:
    <fs_a>    type standard table,
    <fs_id>   type standard table,
    <fs_tmp>  type standard table,
    <fs_res>  type standard table,
    <fs_egvt> type standard table,
    <fs_low>  type standard table,
    <fs_up>   type standard table,
    <fs_xij>  type any,
    <fs_yij>  type any.

  preparem id <fs_id> a.
  preparem tmp <fs_tmp> a.
  preparem res <fs_res> a.
  preparem lower <fs_low> a.
  preparem upper <fs_up> a.
  preparev eigenvector <fs_egvt> a.
  deref a <fs_a>.
  <fs_res>[] = <fs_a>[].
  id->identity( ).
  st_row = a->dimension( )-row.
  st_col = a->dimension( )-col.
  " Subtract the eigenvalue times the identity matrix from the original matrix
  i = 1.
  <fs_tmp>[] = <fs_id>.
  do st_row - 1 times.
    j = 1.
    do st_col times.
      m_i_j j <fs_tmp> i <fs_xij>.
      <fs_xij> = <fs_xij> * eigenvalue.
      m_i_j j <fs_res> i <fs_yij>.
      <fs_xij> = <fs_yij> - <fs_xij>.
      add 1 to j.
    enddo.
    add 1 to i.
  enddo.
* Perform LU decomposition
  idx1 = 1.
  do st_row - 1 times.
    i = idx1 + 1.
* Partial pivoting
    pivot = idx1.
    idx2 = 1.
    do ( st_row - idx1 ) + 1  times.
      m_i_j idx2 <fs_res> i <fs_xij>.
      m_i_j idx2 <fs_res> pivot <fs_yij>.
      if abs( <fs_xij> ) > abs( <fs_yij> ).
        pivot = i.
      endif.
      add 1 to idx2.
    enddo.
* Swap rows in the matrix
    if pivot <> idx1.
      <fs_tmp>[ 1 ] = <fs_res>[ idx1 ].
      <fs_res>[ idx1 ] = <fs_res>[ pivot ].
      <fs_res>[ pivot ] = <fs_tmp>[ 1 ].
    endif.
* Elimination
    idx2 = 1.
    do st_row - i times.
      m_i_j idx2 <fs_res> i <fs_xij>.
      m_i_j idx2 <fs_res> idx2 <fs_yij>.
      temp = <fs_xij> / <fs_yij>.
      m_i_j idx2 <fs_low> i <fs_xij>.
      <fs_xij> = temp.
      idx3 = 1.
      j = idx2 + 1.
      do st_row - ( i + 1 ) times.
        m_i_j j <fs_res> i <fs_xij>.
        m_i_j j <fs_res> idx3 <fs_yij>.
        <fs_yij> = <fs_yij> - temp * <fs_xij>.
        add 1 to idx3.
      enddo.
    enddo.
  enddo.
* Copy upper triangular matrix
  <fs_up>[] = <fs_res>.
* Solve the system of linear equations L * x = u for x using forward substitution
  idx1 = 1.
  do st_row times.
    sum = 0.
    idx2 = 1.
    do st_row times.
      m_i_j idx2 <fs_low> idx1 <fs_xij>.
      temp = <fs_egvt>[ idx1 ].
      sum = sum + <fs_xij> * temp.
      add 1 to idx2.
    enddo.
    m_i_j idx1 <fs_up> idx1 <fs_xij>.
    m_i_j idx1 <fs_low> idx1 <fs_yij>.
    if <fs_yij> <> 0.
      temp = ( <fs_xij> - sum ) / <fs_yij>.
    else.
      temp = <fs_xij>.
    endif.
    insert temp into table <fs_egvt>.
    add 1 to idx1.
  enddo.
  eigenvector ?= eigenvector->normalize( ).
endmethod.


method invert.
  data:
     inv_ type ref to zcl_matrix.

  inv_ ?= inverts( a = me ).
  call method me->set
    changing
      container = inv_->container.
endmethod.


method inverts.
  constants:
    f1 type decfloat34 value 1,
    f0 type decfloat34 value 0.
  data:
    i   type i,
    j   type i,
    dim type zcl_utilities=>dimension,
    p   type ref to data,
    t   type i,
    lu  type ref to data,
    x   type ref to data,
    y   type ref to data.
  field-symbols:
    <fs_mji> type any,
    <fs_a>   type standard table,
    <fs_x>   type standard table,
    <fs_y>   type standard table,
    <fs_inv> type standard table,
    <fs_p>   type standard table.

  check a is bound.
  if _is_empty( a ).
    return.
  endif.
  dim = a->dimension( ).
  inv ?= _duplicate( a ).
  assign a->container->* to <fs_a>.
  create data p type standard table of i.
  call method _lu_decomposition
    exporting
      a  = inv
    importing
      lu = lu
    changing
      t  = t
      p  = p.
  check inv is bound.
  check p is bound.
  assign inv->container->* to <fs_inv>.
  assign p->* to <fs_p>.
  create data x type table of float.
  assign x->* to <fs_x>.
  i = 1.
  do dim-row times.
    j = 1.
    do dim-row times.
      if i = <fs_p>[ j ].
        insert f1 into table <fs_x>.
      else.
        insert f0 into table <fs_x>.
      endif.
      add 1 to j.
    enddo.
    y ?= _permutate( lu = lu p = x ).
    assign y->* to <fs_y>.
    j = 1.
    do dim-row times.
      assign component i of structure <fs_inv>[ j ] to <fs_mji>.
      <fs_mji> = <fs_y>[ j ].
      add 1 to j.
    enddo.
    add 1 to i.
  enddo.
endmethod.


method is_equal.
  data:
    c type ref to zcl_matrix,
    i type i.
  field-symbols:
    <fs_a>   type any table,
    <fs_b>   type standard table,
    <fs_aix> type any,
    <fs_bix> type any.

  check a is bound and b is bound.
  assign a->container->* to <fs_a>.
  assign b->container->* to <fs_b>.
  loop at <fs_a> assigning <fs_aix>.
    assign component 1 of structure <fs_b>[ sy-tabix ] to <fs_bix>.
    if <fs_aix> <> <fs_bix>.
      return.
    endif.
  endloop.
  equ = abap_true.
endmethod.


method is_orthogonal.
  data:
    b   type ref to zcl_matrix,
    c   type ref to zcl_matrix,
    d   type ref to zcl_matrix,
    i   type ref to zcl_matrix,
    dim type zcl_utilities=>dimension.

  b ?= transposes( a ).
  c ?= multiplications( a = b b = a ).
  d ?= multiplications( a = a b = b ).
  call method identitys
    exporting
      a    = i
      kind = a->kind
    changing
      dim  = dim.
  bool = is_equal( a = c b = d ).
endmethod.


method kinds.
  kind = a->kind.
endmethod.


method laplace_expansion.
  det = _laplace_expansion( a = me ).
endmethod.


method lu_decomposition.
  types:
    begin of sub_matrix,
      row_str type i,
      row_end type i,
      col_str type i,
      col_end type i,
    end of sub_matrix,
    t_sub_matrix type standard table of sub_matrix with default key.
  data:
    dim   type zcl_utilities=>dimension,
    cell  type zcl_utilities=>dimension,
    sm_l  type sub_matrix,
    sm_u  type sub_matrix,
    max   type i,
    pivot type decfloat34,
    elem1 type decfloat34,
    elem2 type decfloat34,
    elem3 type decfloat34,
    elem4 type decfloat34,
    elem5 type decfloat34,
    elem6 type decfloat34,
    j     type i,
    i     type i,
    k     type i,
    rc    type i,
    q     type i.
  field-symbols:
    <fs_l> type standard table,
    <fs_u> type standard table,
    <fs_a> type standard table.

  check a is bound.
  check _is_square( a ).
  dim = a->dim.
  deref a <fs_a>.
  preparem l <fs_l> a.
  preparem u <fs_u> a.
  l->identity( ).
* Set submatrix info for L
  sm_l-row_str = 2.
  sm_l-col_str = 1.
  sm_l-row_end = a->dimension( )-row.
  sm_l-col_end = sm_l-row_end - 1.

  for_n j sm_l-col_str sm_l-col_end.
  max = get_row_max_diagonal( col = j a = a ).
  if max <> j.
    swap_rows( exporting rx = max ry = j a  = a ).
  endif.
  zero_col( col = j a = a ).
endfor j.
* Split L in L and U
for i a->dim-row.
  for j a->dim-col.
    if i <= j.
      u->set_element( row = i col = j value = l->get_element( row = i col = j ) ).
      if i <> j.
        l->set_element( row = i col = j value = zero ).
      endif.
    endif.
  endfor j.
endfor i.
*  for j dim-col.
*    u->set_element( row = 1 col = j value = a->get_element( row = 1 col = j ) ).
*  endfor j.
*  for i dim-row.
*    elem1 = a->get_element( row = i col = 1 ).
*    elem2 = u->get_element( row = 1 col = 1 ).
*    l->set_element( row = i col = 1 value = ( elem1 / elem2 ) ).
*  endfor i.
*  for_n i 2 dim-row.
*  rc = i - 1.
*  for j dim-col.
*    for k rc.
*      elem1 = a->get_element( row = i col = j ) .
*      elem2 = l->get_element( row = i col = k ).
*      elem3 = u->get_element( row = k col = j ).
*      u->set_element( row = i col = j value = ( elem1 - elem2 * elem3 ) ).
*    endfor k.
*  endfor j.
*  rc = i + 1.
*  for_n j rc dim-col.
*  rc = i - 1.
*  for_n k rc dim-col.
*  elem1 = a->get_element( row = j col = i ).
*  elem2 = l->get_element( row = j col = k ).
*  elem3 = u->get_element( row = k col = i ).
*  elem4 = u->get_element( row = i col = i ).
*  l->set_element( row = k col = i value = ( elem1 - ( elem2 * elem3 ) / elem4 ) ).
*endfor k.
*endfor j.
*endfor i.
endmethod.


method multiplication.
c ?= multiplications( a = me b = b ).
endmethod.


method multiplications.
data:
  i   type i,
  j   type i,
  k   type i,
  dim type zcl_utilities=>dimension,
  da  type zcl_utilities=>dimension,
  db  type zcl_utilities=>dimension,
  dc  type zcl_utilities=>dimension.
field-symbols:
  <fs_c>   type standard table,
  <fs_a>   type standard table,
  <fs_b>   type standard table,
  <fs_cij> type any,
  <fs_aij> type any,
  <fs_bjk> type any.

if _is_empty( a ) or _is_empty( b ).
  return.
endif.
check _is_multipliable( a = a b = b ).
dim-row = a->dim-row.
dim-col = b->dim-col.
c ?= zcl_matrix=>create_instance( dim = dim kind = a->kind ).
da = a->dim.
db = b->dim.
assign c->container->* to <fs_c>.
dc = c->dim.
i = 1.
assign a->container->* to <fs_a>.
assign b->container->* to <fs_b>.
do dc-row times.
  j = 1.
  do dc-col times.
    assign component j of structure <fs_a>[ i ] to <fs_aij>.
    k = 1.
    do da-col times.
      assign component k of structure <fs_b>[ j ] to <fs_bjk>.
      assign component j of structure <fs_c>[ i ] to  <fs_cij>.
      <fs_cij> =  <fs_cij> + ( <fs_aij> * <fs_bjk>  ).
      add 1 to k.
    enddo.
    add 1 to j.
  enddo.
  add 1 to i.
enddo.
endmethod.


method multiply_scalar.
data:
   ax type ref to zcl_matrix.

ax ?= create_instance( dim = me->dim kind = me->kind ).
call method multiply_scalars
  exporting
    x  = x
    a  = me
  receiving
    ax = ax.
free me->container.
me->container ?= ax->container.
free ax.
endmethod.


method multiply_scalars.
data:
  i type i,
  j type i.
field-symbols:
  <fs_ax>  type standard table,
  <fs_aij> type any.

check x is not initial.
if a is bound and a->container is not initial.
  ax = _duplicate( a ).
  assign ax->container->* to <fs_ax>.
  i = 1.
  do ax->dim-row times.
    j = 1.
    do ax->dim-col times.
      assign component j of structure <fs_ax>[ i ] to <fs_aij>.
      <fs_aij> = <fs_aij> * x.
      add 1 to j.
    enddo.
    add 1 to i.
  enddo.
endif.
endmethod.


method product.
c ?= products( a = me b = b ).
endmethod.


method products.
data:
  i   type i,
  j   type i,
  k   type i,
  ref type ref to data,
  dim type zcl_utilities=>dimension,
  da  type zcl_utilities=>dimension,
  db  type zcl_utilities=>dimension,
  dc  type zcl_utilities=>dimension.
field-symbols:
  <fs_c>   type standard table,
  <fs_a>   type standard table,
  <fs_b>   type standard table,
  <fs_cij> type any,
  <fs_aik> type any,
  <fs_bkj> type any.

preparem c <fs_c> b.
check _is_multipliable( a = a b = b ).
dim-row = a->dim-row.
dim-col = b->dim-col.
deref a <fs_a>.
deref b <fs_b>.
for i dim-row.
  for j dim-col.
    m_i_j j <fs_c> i <fs_cij>.
    for k dim-col.
      m_i_j k <fs_a> i <fs_aik>.
      m_i_j j <fs_b> k <fs_bkj>.
      <fs_cij> = <fs_cij> + <fs_aik> * <fs_bkj>.
    endfor k.
  endfor j.
endfor i.
endmethod.


method qr_decomposition.
data:
  i   type i,
  j   type i,
  k   type i,
  ii  type i,
  jj  type i,
  kk  type i,
  sum type decfloat34,
  ref type ref to data,
  dim type zcl_utilities=>dimension.
field-symbols:
  <fs_a>   type standard table,
  <fs_q>   type standard table,
  <fs_r>   type standard table,
  <fs_qr>  type standard table,
  <fs_xij> type any,
  <fs_yij> type any.

preparem q <fs_q> a.
preparem r <fs_r> a.
preparem qr <fs_qr> a.
deref a <fs_a>.
<fs_qr>[] = <fs_a>[].
st_row = a->dimension( )-row.
st_col = a->dimension( )-col.
r->identity( ).
deref r <fs_r>.
do st_row - 1 times.
  i = st_row - sy-index + 1.
  ii = 1.
  do i times.
    " Compute the magnitude of the vector from element (i, j) to (n, j)
    sum = 0.
    j = st_row - ii.
    jj = 1.
    do j times.
      m_i_j jj <fs_qr> ii <fs_xij>.
      sum = sum + <fs_xij> ** 2.
      add 1 to jj.
    enddo.
    " Compute the norm of the vector
    sum = sqrt( sum ).
    " Check if the first element of the vector is negative
    m_i_j 1 <fs_qr> ii <fs_xij>.
    if <fs_xij> < 0.
      sum = sum * -1.
    endif.
    " Compute the scaling factor for the vector
    if sum <> 0.
      sum = 1 / sum.
    endif.
    " Update the vector in the matrix
    jj = 1.
    do st_row times.
      m_i_j jj <fs_qr> ii <fs_xij>.
      <fs_xij> = <fs_xij> * sum.
      add 1 to jj.
    enddo.
    " Compute the projection of the vector onto the (n - i + 1)th standard basis vector
    sum = 0.
    jj = 1.
    do st_row times.
      m_i_j jj <fs_qr> ii <fs_xij>.
      sum = sum + <fs_xij> ** 2.
    enddo.
    " Compute the scaling factor for the projection
    if sum <> 0.
      sum = 1 / sum.
    endif.
    " Update the projection in the matrix
    do st_row times.
      m_i_j jj <fs_qr> ii <fs_xij>.
      <fs_xij> = <fs_xij> * sum.
      add 1 to jj.
    enddo.
    add 1 to ii.
  enddo.
enddo.
" Update Q and R matrices
i = 1.
do st_row times.
  j = 1.
  do st_col times.
    m_i_j j <fs_qr> i <fs_xij>.
    m_i_j j <fs_q> i <fs_yij>.
    <fs_yij> = <fs_yij> && <fs_xij>.
    add 1 to j.
  enddo.
  add 1 to i.
enddo.
<fs_r>[] = <fs_qr>[].
endmethod.


method row.
row ?= rows( a = me index = index ).
endmethod.


method rows.
data:
  ref type ref to data,
  i   type i,
  j   type i.
field-symbols:
  <fs_a> type standard table,
  <fs_v> type standard table,
  <fs_x> type any.

check a is bound.
check index > 0 and index <= a->dim-col.
deref a <fs_a>.
preparev row <fs_v> a.
i = 1.
while i <= a->dim-col.
  assign component i of structure <fs_a>[ index ] to <fs_x>.
  <fs_v>[ i ] = <fs_x>.
  i = i + 1.
endwhile.
endmethod.


method set.
call method _get_set_containers
  exporting
    a         = me
    get       = abap_false
  changing
    container = container.
endmethod.


method sets.
call method _get_set_containers
  exporting
    a         = a
    get       = abap_false
  changing
    container = container.
endmethod.


method set_element.
  data:
    val type decfloat34.

  val = value.
  call method zcl_matrix=>_get_set_element
    exporting
      dim       = dim
      row       = row
      col       = col
    changing
      container = me->container
      value     = val.
endmethod.


method set_elements.
  call method zcl_matrix=>_get_set_element
    exporting
      dim       = dim
    changing
      container = a->container.
endmethod.


method subtract.
call method zcl_matrix=>_plus_minus
  exporting
    a    = me
    b    = b
    plus = abap_false
  receiving
    c    = c.
endmethod.


method subtracts.
call method zcl_matrix=>_plus_minus
  exporting
    a    = a
    b    = b
    plus = abap_false
  receiving
    c    = c.
endmethod.


method sub_from_element.
  data:
   val type decfloat34.

  val = value.
  call method zcl_matrix=>_get_set_element
    exporting
      dim       = dim
      row       = row
      col       = col
      sub_from  = abap_true
    changing
      container = me->container
      value     = val.
endmethod.


method sub_from_elements.
  data:
     val type decfloat34.

  val = value.
  call method zcl_matrix=>_get_set_element
    exporting
      dim       = dim
      row       = row
      col       = col
      sub_from  = abap_true
    changing
      container = a->container
      value     = val.
endmethod.


method swap_rows.
data:
  tmp type decfloat34,
  i   type i.

for i a->dim-col.
  tmp = a->get_element( row = rx col = i ).
  a->set_element( row = rx col = i value = a->get_element( row = ry col = i ) ).
  a->set_element( row = ry col = i value = tmp ).
endfor i.
endmethod.


method to_string.
call method zcl_matrix=>to_strings
  exporting
    a = me
  receiving
    s = s.
endmethod.


method to_strings.
data:
  i type i,
  j type i.
field-symbols:
  <fs_a>   type standard table,
  <fs_aij> type any.

assign a->container->* to <fs_a>.
i = 1.
do a->dim-row times.
  j = 1.
  do a->dim-col times.
    assign component j of structure <fs_a>[ i ] to <fs_aij>.
    s =  s && '{' && |{ i - 1 }| && ':' && |{ j - 1 }| && '} = ' && |{ <fs_aij> }| && ','.
    add 1 to j.
  enddo.
  s = substring( val = s len = strlen( s ) - 1 ).
  s = s && cl_abap_char_utilities=>newline.
  add 1 to i.
enddo.
endmethod.


method transpose.
field-symbols:
  <fs_me> type standard table,
  <fs_t>  type standard table.

t ?= transposes( me ).
deref me <fs_me>.
deref t <fs_t>.
<fs_me>[] = <fs_t>[].
free t.
endmethod.


method transposes.
data:
  i type i,
  j type i.
field-symbols:
  <fs_a>   type standard table,
  <fs_t>   type standard table,
  <fs_aij> type any,
  <fs_tji> type any.

check a is bound and a->container is not initial.
if t is initial.
  preparem t <fs_t> a.
endif.
deref a <fs_a>.
deref t <fs_t>.
for i 1.
  for j 1.
    m_i_j j <fs_a> i <fs_aij>.
    m_i_j i <fs_t> j <fs_tji>.
    <fs_tji> = <fs_aij>.
  endfor j.
endfor i.
endmethod.


method vector_multiplication.
endmethod.


method vector_multiplications.
endmethod.


method zero_col.
data:
  i              type i,
  j              type i,
  this_rc        type decfloat34,
  element        type decfloat34,
  same_col_diag  type i,
  row_multiplier type decfloat34,
  row_under_diag type i.

row_under_diag = col + 1.
for_n i row_under_diag a->dim-row.
element = a->get_element( row = i col = col ).
same_col_diag = a->get_element( row = col col = col ).
row_multiplier = neg1 * element / same_col_diag.
for_n j col a->dim-col.
this_rc = a->get_element( row = i col = col ).
a->set_element( row = i col = col value = ( this_rc + row_multiplier * a->get_element( row = col col = j ) ) ).
endfor j.
a->set_element( row = i col = col value = ( neg1 * row_multiplier ) ).
endfor i.
endmethod.


method _combine_quarters.
define bounds.
check a&1 is bound.
end-of-definition.
define container.
assign &1->container->* to &2.
end-of-definition.

data:
da  type zcl_utilities=>dimension,
dim type zcl_utilities=>dimension,
i   type i,
j   type i.
field-symbols:
<fs_aij>  type any,
<fs_aqij> type any,
<fs_a>    type standard table,
<fs_a1>   type standard table,
<fs_a2>   type standard table,
<fs_a3>   type standard table,
<fs_a4>   type standard table.

bounds 1.
bounds 2.
bounds 3.
bounds 4.

dim-row = a1->dim-row.
dim-col = a1->dim-col.
da-row = dim-row * 2.
da-col = dim-col * 2.
a ?= zcl_matrix=>create_instance( dim = dim kind = a1->kind ).
container a <fs_a>.
container a1 <fs_a1>.
container a2 <fs_a2>.
container a3 <fs_a3>.
container a4 <fs_a4>.
i = 1.
do dim-row times. "a1
j = 1.
do dim-col times.
assign component j of structure <fs_a>[ i ] to <fs_aij>.
assign component j of structure <fs_a1>[ i ] to <fs_aqij>.
<fs_aij> = <fs_aqij>.
add 1 to j.
enddo.
add 1 to i.
enddo.
i = 1.
do dim-row times. "a2
j = dim-col + 1.
do dim-col times.
assign component j of structure <fs_a>[ i ] to <fs_aij>.
assign component j of structure <fs_a1>[ i ] to <fs_aqij>.
<fs_aij> = <fs_aqij>.
add 1 to j.
enddo.
add 1 to i.
enddo.
i =  dim-row + 1.
do dim-row times. "a3
j = 1.
do dim-col times.
assign component j of structure <fs_a>[ i ] to <fs_aij>.
assign component j of structure <fs_a1>[ i ] to <fs_aqij>.
<fs_aij> = <fs_aqij>.
add 1 to j.
enddo.
add 1 to i.
enddo.
i =  dim-row + 1.
do dim-row times. "a4
j = dim-col + 1.
do dim-col times.
assign component j of structure <fs_a>[ i ] to <fs_aij>.
assign component j of structure <fs_a1>[ i ] to <fs_aqij>.
<fs_aij> = <fs_aqij>.
add 1 to j.
enddo.
add 1 to i.
enddo.
endmethod.


method _duplicate.
field-symbols:
<fs_a> type any table,
<fs_b> type any table.

b ?= new zcl_matrix( dim = a->dim kind = a->kind ).
assign a->container->* to <fs_a>.
assign b->container->* to <fs_b>.
<fs_b> = corresponding #( <fs_a> ).
endmethod.


method _get_set_containers.
check a is bound.
if zcl_utilities=>is_true( get ).
container ?= a->container.
else.
a->container ?= container.
endif.
endmethod.


method _get_set_element.
  data:
    dim_ type zcl_utilities=>dimension.
  field-symbols:
    <fs_a> type standard table,
    <fs_v> type any,
    <fs_c> type any.

  if dim is not initial.
    dim_ = dim.
  elseif row is not initial and col is initial.
    dim_-row = row.
    dim_-col = 1.
  elseif col is initial and row is not initial.
    dim_-row = 1.
    dim_-col = col.
  elseif row is not initial and col is not initial.
    dim_-row = row.
    dim_-col = col.
  else.
    return.
  endif.
  assign container->* to <fs_a>.
  check dim_-col <= lines( <fs_a> ) and dim_-row <= lines( <fs_a> ) and dim_-col > 0 and dim_-row > 0.
  assign component dim_-col of structure <fs_a>[ dim_-row ] to <fs_c>.
  check <fs_c> is assigned.
  assign value to <fs_v>.
  if set = abap_true.
    if add_to = abap_true.
      <fs_c> = <fs_c> + <fs_v>.
    elseif sub_from = abap_true.
      <fs_c> = <fs_c> - <fs_v>.
    else.
      <fs_c> = <fs_v>.
    endif.
    <fs_v> = <fs_c>.
  else.
    <fs_v> = <fs_c>.
  endif.
endmethod.


method _is_empty.
field-symbols:
<fs_am> type standard table.

bool = abap_true.
check a is bound.
assign a->container->* to <fs_am>.
check  <fs_am> is assigned.
check lines( <fs_am> ) > 0.
check a->dimension( ) is not initial.
bool = abap_false.
endmethod.


method _is_multipliable.
bool = xsdbool( a->dim-col = b->dim-col ).
endmethod.


method _is_same_dimension.
bool = xsdbool( a->dimension( ) = b->dimension( ) ).
endmethod.


method _is_square.
check a is bound.
bool = xsdbool( a->dim-col = a->dim-row ).
endmethod.


method _laplace_expansion.
data:
i         type i,
j         type i,
k         type i,
l         type i,
container type ref to data,
mincont   type ref to data,
cofactor  type decfloat34,
dim       type zcl_utilities=>dimension,
minor     type ref to zcl_matrix.
field-symbols:
<fs_ajk>       type any,
<fs_mjl>       type any,
<fs_a1i>       type any,
<fs_container> type standard table,
<fs_minor>     type standard table.

check a is bound.
dim = a->dim.
container ?= a->get_container( ).
assign container->* to <fs_container>.
subtract 1 from dim-row.
subtract 1 from dim-col.
i = 1.
while i <= a->dim-row.
minor ?= new zcl_matrix( dim = dim kind = a->kind ).
mincont ?= minor->get_container( ).
assign mincont->* to <fs_minor>.
j = 2.
while j <= a->dim-row.
k = 1.
l = 1.
while k <= a->dim-row.
  if k <> i.
    assign component k of structure <fs_container>[ j ] to <fs_ajk>.
    assign component l of structure <fs_minor>[ j - 1 ] to <fs_mjl>.
    <fs_mjl> = <fs_ajk>.
    add 1 to l.
  endif.
  add 1 to k.
endwhile.
add 1 to j.
endwhile.
assign component i of structure <fs_container>[ 1 ] to <fs_a1i>.
cofactor = ipow( base = -1 exp = i ).
cofactor = cofactor * <fs_a1i>.
cofactor = cofactor * _laplace_expansion( a = minor ).
add cofactor to det.
add 1 to i.
endwhile.
endmethod.


method _lu_decomposition.
data:
b    type ref to zcl_matrix,
bi   type ref to data,
dim  type zcl_utilities=>dimension,
max_ type decfloat34,
j    type i,
i    type i,
k    type i,
l    type i,
r    type i,
q    type i.
field-symbols:
<fs_p>    type standard table,
<fs_b>    type standard table,
<fs_b_jk> type any,
<fs_tx_>  type any,
<fs_b_ii> type any,
<fs_b_ji> type any,
<fs_b_ik> type any,
<fs_b_rj> type any.

check a is bound.
check _is_square( a ).
dim = a->dim.
b ?= _duplicate( a ).
check b is bound.
assign b->container->* to <fs_b>.
create data p like table of j.
assign p->* to <fs_p>.
j = 1.
do dim-row times.
insert j into table <fs_p>.
add 1 to j.
enddo.
t = 1.
i = 1.
do dim-row - 1 times.
assign component i of structure <fs_b>[ i ] to <fs_b_ii>.
max_ = abs( <fs_b_ii> ).
k = i.
j = i + 1.
while j <= dim-row.
assign component i of structure <fs_b>[ j ] to <fs_b_ji>.
if abs( <fs_b_ji> ) > max_.
  max_ = abs( <fs_b_ji> ).
  k = j.
endif.
add 1 to j.
endwhile.
create data bi like line of <fs_b>.
assign bi->* to <fs_b_jk>.
if l <> i.
<fs_b_jk> = corresponding #( <fs_b>[ k ] ).
<fs_b>[ k ] = <fs_b>[ i ].
<fs_b>[ i ] = <fs_b_jk>.
q = <fs_p>[ k ].
<fs_p>[ k ] = <fs_p>[ i ].
<fs_p>[ i ] = q.
t = - t.
endif.
assign component i of structure <fs_b>[  i ] to <fs_b_ii>.
if <fs_b_ii> is initial.
l = -1.
r = i + 1.
while r <= dim-row.
  assign component i of structure <fs_b>[ r ] to <fs_b_rj>.
  if <fs_b_rj> is not initial.
    l = r.
  endif.
  add 1 to r.
endwhile.
check l <> '-1'.
<fs_tx_> = corresponding #( <fs_b>[ l ] ).
<fs_b>[ l ] = <fs_b>[ i ].
<fs_b>[ i ] =  <fs_tx_> .
q = <fs_p>[ l ].
<fs_p>[ l ] = <fs_p>[ i ].
<fs_p>[ i ] = q.
t = - t.
endif.
j = i + 1.
while j <= dim-row.
assign component i of structure <fs_b>[ j ] to <fs_b_ji>.
assign component i of structure <fs_b>[ i ] to <fs_b_ii>.
assert <fs_b_ii> is assigned and <fs_b_ii> <> 0.
<fs_b_ji> = <fs_b_ji> / <fs_b_ii>.
k = i + 1.
while k <= dim-row.
  assign component k of structure <fs_b>[ i ] to <fs_b_ik>.
  assign component k of structure <fs_b>[ j ] to <fs_b_jk>.
  <fs_b_jk> = <fs_b_jk> - ( <fs_b_ji> *  <fs_b_ik> ).
  add 1 to k.
endwhile.
add 1 to j.
endwhile.
add 1 to i.
enddo.
lu ?= b->container.
endmethod.


method _permutate.
data:
i   type i,
j   type i,
dim type zcl_utilities=>dimension,
plu type ref to data,
sum type decfloat34.
field-symbols:
<fs_lu>    type standard table,
<fs_p>     type standard table,
<fs_lu_ii> type any,
<fs_lu_ij> type any,
<fs_lu_nn> type any,
<fs_f>     type standard table.

check lu is bound.
assign lu->* to <fs_lu>.
dim-row = lines( <fs_lu> ).
create data plu type standard table of decfloat34.
assign plu->* to <fs_f>.
assign p->* to <fs_p>.
insert lines of <fs_p> into table <fs_f>.
i = 2.
while i <= dim-row.
sum = <fs_f>[ i ].
j = 1.
while j <= i.
assign component j of structure <fs_lu>[ i ] to <fs_lu_ij>.
sum = sum - ( <fs_lu_ij> * <fs_f>[ j ] ).
add 1 to j.
endwhile.
<fs_f>[ i ] = sum.
add 1 to i.
endwhile.
assign component ( dim-row - 1 ) of structure <fs_lu>[ dim-row - 1 ] to <fs_lu_nn>.
check <fs_lu_nn> is assigned and <fs_lu_nn> <> 0.
<fs_f>[ dim-row - 1 ] = <fs_f>[ dim-row - 1 ] / <fs_lu_nn>.
i = dim-row - 2.
while i > 0.
sum = <fs_f>[ i ].
j = i + 1.
while j <= dim-row.
assign component j of structure <fs_lu>[ i ] to <fs_lu_ij>.
sum = sum - ( <fs_lu_ij> * <fs_f>[ j ] ).
add 1 to j.
endwhile.
assign component i of structure <fs_lu>[ i ] to <fs_lu_ii>.
check <fs_lu_ii> is assigned and <fs_lu_ii> <> 0.
<fs_f>[ i ] = sum / <fs_lu_ii>.
subtract 1 from i.
endwhile.
pu ?= plu.
endmethod.


method _plus_minus.
data:
i type i,
j type i.
field-symbols:
<fs_c>   type standard table,
<fs_a>   type standard table,
<fs_b>   type standard table,
<fs_aij> type any,
<fs_bij> type any,
<fs_cij> type any.

check a is bound and b is bound.
if zcl_utilities=>is_same_kind( kind_a = a->kind kind_b = b->kind ) and _is_same_dimension( a = a b = b ).
free c.
c ?= zcl_matrix=>create_instance( dim = a->dim kind = a->kind ).
assign c->container->* to <fs_c>.
assign a->container->* to <fs_a>.
assign b->container->* to <fs_b>.
i = 1.
do a->dim-row times.
j = 1.
do a->dim-col times.
  assign component j of structure <fs_c>[ i ] to <fs_cij>.
  assign component j of structure <fs_b>[ i ] to <fs_bij>.
  assign component j of structure <fs_a>[ i ] to <fs_aij>.
  if plus = abap_true.
    <fs_cij> = <fs_aij> + <fs_bij>.
  else.
    <fs_cij> = <fs_aij> - <fs_bij>.
  endif.
  add 1 to j.
enddo.
add 1 to i.
enddo.
endif.
endmethod.


method _split_into_quarters.
define create_split.
&1 ?= zcl_matrix=>create_instance( dim = dim kind = a->kind ).
assign &1->container->* to <fs_q>.
i = &2-row.
k_ = 1.
do dim-row times.
j = &2-col.
l = 1.
do dim-col times.
  assign component j of structure <fs_a>[ i ] to <fs_aij>.
  assign component l of structure <fs_q>[ k_ ] to <fs_qkl>.
  <fs_qkl> = <fs_aij>.
  add 1 to j.
  add 1 to l.
enddo.
add 1 to i.
add 1 to k_.
enddo.
end-of-definition.

data:
dim  type zcl_utilities=>dimension,
dims type zcl_utilities=>dimension,
i    type i,
j    type i,
l    type i,
k_   type i.
field-symbols:
<fs_a>   type standard table,
<fs_q>   type standard table,
<fs_aij> type any,
<fs_qkl> type any.

check a is bound and a->container is not initial.
assign a->container->* to <fs_a>.
check lines( <fs_a> ) > 0 and _is_square( a ).
dim-row = a->dim-row / 2.
dim-col = a->dim-col / 2.

"q1 - a1
dims-row = 1.
dims-col = 1.
create_split a1 dims.
"q2 - a2
dims-col = dim-col + 1.
create_split a2 dims.
"q3 - a3
dims-col = 1.
dims-row = dim-row + 1.
create_split a3 dims.
"q4 - a4
dims-col = dim-col + 1.
dims-row = dim-row + 1.
create_split a4 dims.
endmethod.
ENDCLASS.
