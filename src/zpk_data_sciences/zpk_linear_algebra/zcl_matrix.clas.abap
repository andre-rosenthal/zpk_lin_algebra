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
      value(DET) type F .
  class-methods DETERMINANTS
    importing
      !A type ref to ZCL_MATRIX
    returning
      value(DET) type F .
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
      !DIM type ZCL_UTILITIES=>DIMENSION
    changing
      value(VALUE) type ANY .
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
  methods INVERT .
  class-methods INVERTS
    importing
      !A type ref to ZCL_MATRIX optional
    returning
      value(INV) type ref to ZCL_MATRIX .
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
  methods MULTIPLY_SCALAR
    importing
      !X type ANY .
  class-methods MULTIPLY_SCALARS
    importing
      !X type ANY
      !A type ref to ZCL_MATRIX
    returning
      value(AX) type ref to ZCL_MATRIX .
  methods LAPLACE_EXPANSION
    returning
      value(DET) type F .
  methods ROW
    importing
      !INDEX type I
    returning
      value(ROW) type ref to DATA .
  class-methods ROWS
    importing
      !A type ref to ZCL_MATRIX
      !INDEX type I
    returning
      value(ROW) type ref to DATA .
  methods SET
    changing
      !CONTAINER type ref to DATA .
  class-methods SETS
    importing
      !A type ref to ZCL_MATRIX
    changing
      value(CONTAINER) type ref to DATA .
  methods SET_ELEMENT
    importing
      !DIM type ZCL_UTILITIES=>DIMENSION
      !VALUE type ANY .
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
  class-methods IS_EQUAL
    importing
      !A type ref to ZCL_MATRIX
      !B type ref to ZCL_MATRIX
    returning
      value(EQU) type BOOLEAN .
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
      !DIM type ZCL_UTILITIES=>DIMENSION
      !SET type BOOLEAN default ABAP_TRUE
      !A type ref to ZCL_MATRIX
    changing
      !VALUE type ANY optional .
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
  class-methods _LAPLACE_EXPANSION
    importing
      !A type ref to ZCL_MATRIX
    returning
      value(DET) type F .
  private section.

    data random type ref to cl_random_number .
    data dim type zcl_utilities=>dimension .
    data container type ref to data .
    data kind type abap_typekind .
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
    column ?= zcl_vector=>create_instance( kind = a->kind rank = a->dim-row ).
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
      d   type f,
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


  method DOT_PRODUCT.
    dot ?= multiplications( a = me b = a ).
  endmethod.


  method DOT_PRODUCTS.
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
    call method zcl_matrix=>_get_set_element
      exporting
        dim   = dim
        set   = abap_false
        a     = me
      changing
        value = value.
  endmethod.


  method get_elements.
    check a is bound.
    call method zcl_matrix=>_get_set_element
      exporting
        dim   = dim
        set   = abap_false
        a     = a
      changing
        value = value.
  endmethod.


  method identity.
    id ?= zcl_matrix=>identitys( a = me ).
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


  method INTERNAL_PRODUCT.
    dim = a->dim.
  endmethod.


  method INTERNAL_PRODUCTS.
    dim = a->dim.
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
      f1 type float value 1,
      f0 type float value 0.
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
      b    type ref to zcl_matrix,
      c    type ref to zcl_matrix,
      d    type ref to zcl_matrix,
      i    type ref to zcl_matrix,
      dim  type zcl_utilities=>dimension.

    b ?= transposes( a ).
    c ?= multiplications( a = b b = a ).
    d ?= multiplications( a = a b = b ).
    call method Identitys
      exporting
        a    = i
        kind = a->kind
      changing
        dim  = dim.
    bool = is_equal( a = c b = d ).
    endmethod.


  method KINDS.
    kind = a->kind.
  endmethod.


  method laplace_expansion.
    det = _laplace_expansion( a = me ).
  endmethod.


  method multiplication.
    c ?= multiplications( a = me b = c ).
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


  method row.
    row ?= rows( a = me index = index ).
  endmethod.


  method rows.
    field-symbols:
      <fs_container> type standard table.

    check a is bound.
    check index > 0 and index <= a->dim-col.
    assign a->container->* to <fs_container>.
    row ?= <fs_container>[ index ].
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
    call method zcl_matrix=>_get_set_element
      exporting
        dim = dim
        a   = me.
  endmethod.


  method set_elements.
    call method zcl_matrix=>_get_set_element
      exporting
        dim = dim
        a   = a.
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
    t ?= transposes( me ).
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
    t ?= zcl_matrix=>create_instance( dim = a->dim kind = a->kind ).
    assign a->container->* to <fs_a>.
    assign t->container->* to <fs_t>.
    i = 1.
    do a->dim-row times.
      j = 1.
      do a->dim-col times.
        assign component j of structure <fs_a>[ i ] to <fs_aij>.
        assign component i of structure <fs_t>[ j ] to <fs_tji>.
        <fs_tji> = <fs_aij>.
        add 1 to j.
      enddo.
      add 1 to i.
    enddo.
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
    field-symbols:
      <fs_a> type standard table,
      <fs_v> type any.

    if zcl_utilities=>is_same_kind( kind_a = a->kind var  = ref #( value ) ).
      if a->dim-row >= dim-row and a->dim-col >= dim-col.
        assign a->container->* to <fs_a>.
        assign component dim-col of structure <fs_a>[ dim-row ] to <fs_v>.
        if set = abap_true.
          <fs_v> = value.
        else.
          value = <fs_v>.
        endif.
      endif.
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
      cofactor  type f,
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
      max_ type f,
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
      sum type float.
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
    create data plu type standard table of float.
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
