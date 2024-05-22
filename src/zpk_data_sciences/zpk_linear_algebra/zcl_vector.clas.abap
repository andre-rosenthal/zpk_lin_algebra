class ZCL_VECTOR definition
  public
  inheriting from ZCL_PYSAP
  final
  create private .

public section.

  methods ADDITION
    importing
      !V2 type ref to ZCL_VECTOR
    returning
      value(V3) type ref to ZCL_VECTOR .
  class-methods ADDITIONS
    importing
      !V1 type ref to ZCL_VECTOR
      !V2 type ref to ZCL_VECTOR
    returning
      value(V3) type ref to ZCL_VECTOR .
  methods BASE
    returning
      value(SPACE_BASE) type ref to DATA .
  class-methods BASIS
    importing
      !V type ref to ZCL_VECTOR optional
      !VLENGHT type I optional
      !KIND type ABAP_TYPEKIND optional
    returning
      value(SPACE_BASE) type ref to DATA .
  class-methods CREATE_INSTANCE
    importing
      !X type ZCL_UTILITIES=>AXIS optional
      !V1 type ref to ZCL_VECTOR optional
      !DEEP type BOOLEAN default ABAP_FALSE
      !KIND type ABAP_TYPEKIND
      !RAND type BOOLEAN default ABAP_FALSE
      !LENGHT type I default 3
    returning
      value(V) type ref to OBJECT .
  methods CROSS_PRODUCT
    importing
      !V2 type ref to ZCL_VECTOR
    returning
      value(CROSS) type ref to ZCL_VECTOR .
  class-methods CROSS_PRODUCTS
    importing
      !VS type ZCL_EIGENSPACE=>RSPACE
    returning
      value(CROSS) type ref to ZCL_VECTOR .
  methods DOT_PRODUCT
    importing
      !V2 type ref to ZCL_VECTOR
    returning
      value(DOT) type ref to DATA .
  class-methods DOT_PRODUCTS
    importing
      !V1 type ref to ZCL_VECTOR
      !V2 type ref to ZCL_VECTOR
    returning
      value(DOT) type ref to DATA .
  methods ELEMENTWISE_MULTIPLICATION
    importing
      !V2 type ref to ZCL_VECTOR
    returning
      value(V3) type ref to ZCL_VECTOR .
  class-methods ELEMENTWISE_MULTIPLICATIONS
    importing
      !V1 type ref to ZCL_VECTOR
      !V2 type ref to ZCL_VECTOR
    returning
      value(V3) type ref to ZCL_VECTOR .
  methods GET_CONTAINER
    returning
      value(CONTAINER) type ZCL_UTILITIES=>AXIS .
  class-methods GET_CONTAINERS
    importing
      !V1 type ref to ZCL_VECTOR
    returning
      value(CONTAINER) type ZCL_UTILITIES=>AXIS .
  methods GET_ELEMENT
    importing
      !I type I
    returning
      value(VALUE) type DECFLOAT34 .
  class-methods GET_ELEMENTS
    importing
      !I type I
      !V type ref to ZCL_VECTOR
    returning
      value(VALUE) type DECFLOAT34 .
  class-methods KINDS
    importing
      !V type ref to ZCL_VECTOR
    returning
      value(KIND) type ABAP_TYPEKIND .
  methods MAGNITUDE
    returning
      value(MAG) type DECFLOAT34 .
  class-methods MAGNITUDES
    importing
      !V1 type ref to ZCL_VECTOR
    returning
      value(MAG) type DECFLOAT34 .
  methods NORMALIZE
    returning
      value(V1_NORM) type ref to ZCL_VECTOR .
  class-methods NORMALIZES
    importing
      !V1 type ref to ZCL_VECTOR
      !KIND type ABAP_TYPEKIND
    returning
      value(V1_NORM) type ref to ZCL_VECTOR .
  methods OUTER_PRODUCT
    importing
      !V1 type ref to ZCL_VECTOR
    returning
      value(A) type ref to ZCL_MATRIX .
  class-methods OUTER_PRODUCTS
    importing
      !V1 type ref to ZCL_VECTOR
      !V2 type ref to ZCL_VECTOR
    returning
      value(A) type ref to ZCL_MATRIX .
  methods PRODUCT
    importing
      !A type ref to ZCL_MATRIX
    returning
      value(P) type ref to ZCL_VECTOR .
  class-methods PRODUCTS
    importing
      !V type ref to ZCL_VECTOR
      !A type ref to ZCL_MATRIX
    returning
      value(P) type ref to ZCL_VECTOR .
  methods PROJECT
    importing
      !V1 type ref to ZCL_VECTOR
    returning
      value(P) type ref to ZCL_VECTOR .
  class-methods PROJECTIONS
    importing
      !V1 type ref to ZCL_VECTOR
      !V2 type ref to ZCL_VECTOR
    returning
      value(P) type ref to ZCL_VECTOR .
  class-methods PROJECTS
    importing
      !V1 type ref to ZCL_VECTOR
      !V2 type ref to ZCL_VECTOR
    returning
      value(P) type ref to ZCL_VECTOR .
  methods RANK
    returning
      value(LENGHT) type I .
  class-methods RANKS
    importing
      !V type ref to ZCL_VECTOR
    returning
      value(LENGHT) type I .
  methods SCALAR_MULTIPLICATION
    importing
      !A type ANY
    returning
      value(V2) type ref to ZCL_VECTOR .
  class-methods SCALAR_MULTIPLICATIONS
    importing
      !A type ANY
      !V1 type ref to ZCL_VECTOR
    returning
      value(V2) type ref to ZCL_VECTOR .
  class-methods SCALAR_PRODUCTS
    importing
      !V1 type ref to ZCL_VECTOR
      !V2 type ref to ZCL_VECTOR
    returning
      value(SPROD) type DECFLOAT34 .
  methods SUB_FROM_ELEMENT
    importing
      !I type I
      value(VALUE) type DECFLOAT34 .
  methods ADD_TO_ELEMENT
    importing
      !I type I
      value(VALUE) type DECFLOAT34 .
  methods SET_ELEMENT
    importing
      !I type I
      value(VALUE) type ANY .
  class-methods SUB_FROM_ELEMENTS
    importing
      !I type I
      !V type ref to ZCL_VECTOR
      value(VALUE) type DECFLOAT34 .
  class-methods ADD_TO_ELEMENTS
    importing
      !I type I
      !V type ref to ZCL_VECTOR
      value(VALUE) type DECFLOAT34 .
  class-methods SET_ELEMENTS
    importing
      !I type I
      !V type ref to ZCL_VECTOR
      value(VALUE) type DECFLOAT34
      !ADD_TO type BOOLEAN default ABAP_FALSE
      !SUB_FROM type BOOLEAN default ABAP_FALSE .
  methods SHAPE
    returning
      value(SHP) type ref to DATA .
  class-methods SHAPES
    importing
      !V type ref to ZCL_VECTOR
    returning
      value(SHP) type ref to DATA .
  methods SUBTRACTION
    importing
      !V2 type ref to ZCL_VECTOR
    returning
      value(V3) type ref to ZCL_VECTOR .
  class-methods SUBTRACTIONS
    importing
      !V1 type ref to ZCL_VECTOR
      !V2 type ref to ZCL_VECTOR
    returning
      value(V3) type ref to ZCL_VECTOR .
  methods TO_ARRAY
    returning
      value(ARR) type ref to ZCL_ARRAY .
  class-methods TO_ARRAYS
    importing
      !V type ref to ZCL_VECTOR
    returning
      value(ARR) type ref to ZCL_ARRAY .
  methods TO_STRING
    returning
      value(S) type STRING .
  class-methods TO_STRINGS
    importing
      !V type ref to ZCL_VECTOR
    returning
      value(S) type STRING .
  methods TRANSPOSE
    importing
      !VERTICAL type BOOLEAN default ABAP_TRUE
    returning
      value(TRANSP) type ref to DATA .
  class-methods TRANSPOSES
    importing
      !V type ref to ZCL_VECTOR optional
      !VERTICAL type BOOLEAN default ABAP_TRUE
      !VROW type ref to DATA optional
    returning
      value(TRANSP) type ref to DATA .
  methods ALL_ONE .
  class-methods ALL_ONES
    importing
      !V type ref to ZCL_VECTOR .
protected section.

  data KIND type ABAP_TYPEKIND .
  data RANDOM type ref to CL_RANDOM_NUMBER .
  data AXIS type ZCL_UTILITIES=>AXIS .
  data lenght type ZCL_UTILITIES=>rank .
  data TYPE type ref to DATA .
  class-data VT type ref to ZCL_VECTOR .

  methods CONSTRUCTOR
    importing
      !AXIS type ZCL_UTILITIES=>AXIS optional
      !V1 type ref to ZCL_VECTOR optional
      !DEEP type BOOLEAN default ABAP_FALSE
      !KIND type ABAP_TYPEKIND
      !RAND type BOOLEAN default ABAP_FALSE
      !lenght type I .
private section.

  class-methods _DUPLICATE
    importing
      !V1 type ref to ZCL_VECTOR
    returning
      value(V2) type ref to ZCL_VECTOR .
  class-methods _IS_EMPTY
    importing
      !V type ref to ZCL_VECTOR
    returning
      value(BOOL) type BOOLEAN .
  class-methods _OVERRIDER
    importing
      !V1 type ref to ZCL_VECTOR
      !CLEAN type BOOLEAN default ABAP_FALSE
    returning
      value(V2) type ref to ZCL_VECTOR .
  class-methods _PLUS_MINUS
    importing
      !V1 type ref to ZCL_VECTOR
      !V2 type ref to ZCL_VECTOR optional
      !PLUS type BOOLEAN default ABAP_TRUE
      !TYPE type ANY
    returning
      value(V3) type ref to ZCL_VECTOR .
ENDCLASS.



CLASS ZCL_VECTOR IMPLEMENTATION.


  method addition.
    v3 ?= additions( v1 = me v2 = v2 ).
  endmethod.


  method additions.
    v3 ?= _plus_minus( v1 = v1 v2 = v2 plus = abap_true type = v1->type ).
  endmethod.


  method ADD_TO_ELEMENT.
    add_to_elements( v = me i = i value = value ).
  endmethod.


  method ADD_TO_ELEMENTS.
    set_elements( v = v i = i value = value add_to = abap_true ).
  endmethod.


  method all_one.
    zcl_vector=>all_ones( me ).
  endmethod.


  method all_ones.
    data:
       i  type i.
    field-symbols:
      <fs_v> type standard table,
      <fs_x> type any.

    deref v <fs_v>.
    forx i 1 v->lenght.
      v->set_element( i = i value = one ).
    endfor i.
  endmethod.


  method base.
    space_base ?=  basis( v = me ).
  endmethod.


  method basis.
    data:
      vx   type ref to zcl_vector,
      vy   type ref to zcl_vector,
      i    type i,
      j    type i,
      lenght type i.
    field-symbols:
      <fs_axis>  type standard table,
      <fs_space> type standard table.

    i = 1.
    create data space_base type zcl_eigenspace=>rspace.
    assign space_base->* to <fs_space>.
    if v is bound.
      lenght = v->lenght.
      vy ?= v.
    else.
      lenght = vlenght.
      vy ?= create_instance( kind = kind lenght = lenght ).
    endif.
    do lenght times.
      vx ?= _duplicate( vy ).
      assign vx->axis->* to <fs_axis>.
      j = 1.
      do vx->lenght times.
        clear <fs_axis>[ j ].
        add 1 to j.
      enddo.
      <fs_axis>[ i ] = one.
      insert vx into table <fs_space>.
      add 1 to i.
    enddo.
  endmethod.


  method constructor.
    data:
      line type ref to data,
      int  type boolean.
    field-symbols:
      <fs_t> type any,
      <fs_x> type standard table,
      <fs_y> type standard table.

    super->constructor( ).
    if kind is initial.
      return.
    endif.
    me->kind = kind.
    if axis is bound.
      me->axis = axis.
    elseif v1 is bound.
      call method zcl_utilities=>create_type_from_kind
        exporting
          kind = kind
        importing
          type = type.
      if zcl_utilities=>is_same_kind( kind_a = kind kind_b = v1->kind var = type ) = abap_false.
        return.
      endif.
      if deep = abap_false.
        me->axis = v1->axis.
      else.
        assign me->axis->* to <fs_x>.
        assign v1->axis->* to <fs_y>.
        <fs_x>[] = <fs_y>[].
      endif.
      me->lenght = lines( <fs_y> ).
    else.
      call method zcl_utilities=>create_type_from_kind
        exporting
          kind = kind
        importing
          type = type.
      call method zcl_utilities=>create_dynamic_table_type_t
        exporting
          type  = type
        importing
          table = me->axis
          line  = line.
      assign type->* to <fs_t>.
      if int = abap_false.
        int = zcl_utilities=>is_integer( <fs_t> ).
      endif.
      assign me->axis->* to <fs_x>.
      if rand = abap_true.
        random = new cl_random_number( ).
        random->if_random_number~init( ).
        do lenght times.
          insert initial line into table <fs_x> assigning <fs_t>.
          if int = abap_true.
            <fs_t> = random->if_random_number~get_random_int( i_limit = 1024 ).
          else.
            <fs_t> = random->if_random_number~get_random_float( ).
          endif.
        enddo.
        me->lenght = lenght.
      else.
        me->lenght = lenght.
        do lenght times.
          insert initial line into table <fs_x>.
        enddo.
      endif.
    endif.
  endmethod.


  method create_instance.
    v ?= new zcl_vector( axis = x v1 = v1 deep = deep kind = kind rand = rand lenght = lenght ).
  endmethod.


  method cross_product.
    data:
        set type zcl_eigenspace=>rspace.

    insert me into table set.
    insert v2 into table set.
    cross ?= cross_products( set ).
  endmethod.


  method cross_products.
    data:
      i           type i,
      j           type i,
      k           type i,
      lenght        type i,
      det         type decfloat34,
      dets        type standard table of decfloat34,
      axis        type ref to data,
      laplace_det type ref to data,
      container   type ref to data,
      dim         type zcl_utilities=>dimension,
      laplacian   type zcl_eigenspace=>laplacian,
      laplace     type ref to zcl_matrix,
      base_set    type ref to data,
      base        type ref to zcl_vector,
      matrix      type ref to zcl_matrix,
      v           type ref to zcl_vector,
      vector      type ref to zcl_vector.
    field-symbols:
      <fs_space>     type zcl_eigenspace=>rspace,
      <fs_laplace>   type any,
      <fs_axis>      type standard table,
      <fs_container> type standard table,
      <fs_v1ax>      type standard table.

    check vs is not initial.
    case lines( vs ).
      when 1.
        v ?= vs[ 1 ].
        cross ?= _overrider( v ).
        assign cross->axis->* to <fs_v1ax>.
        i = 1.
        do lines( <fs_v1ax> ) times.
          clear <fs_v1ax>[ i ].
          add 1 to i.
        enddo.
      when others.
        i = 1.
        do lines( vs ) times.
          vector ?= vs[ i ].
          if lenght = 0.
            lenght = vector->lenght.
          else.
            if lenght <> vector->lenght.
              return.
            endif.
          endif.
          add 1 to i.
        enddo.
        check lenght - 1 = lines( vs ).
        dim-row = vector->lenght.
        dim-col = vector->lenght.
        base_set ?= zcl_vector=>basis( v = vector ).
        " the Laplacian contains a matrix of matrix for each vector + base combination
        assign base_set->* to <fs_space>.
        " now add the column for the base set ...
        matrix ?= zcl_matrix=>create_instance( dim = dim kind = vector->kind ).
        container ?= matrix->get_container( ).
        assign container->* to <fs_container>.
        i = 1.
        do dim-row times.
          "create the base vector column
          base ?= <fs_space>[ i ].
          axis ?= base->get_container( ).
          assign axis->* to <fs_axis>.
          laplace ?= matrix->alter_col( index  = 1 column = axis ).
          "now add each vector on vs ...
          j = 2.
          k = 1.
          do lines( vs ) times.
            vector ?= vs[ k ].
            axis ?= vector->get_container( ).
            assign axis->* to <fs_axis>.
            laplace ?= laplace->alter_col( index  = j column = axis ).
            add 1 to j.
            add 1 to k.
          enddo.
          " our base matrix for base 1 is complete
          insert laplace into table laplacian.
          add 1 to i.
        enddo.
        " the laplacian is completed. we now proceed with the calcs
        loop at laplacian  assigning <fs_laplace>.
          laplace ?= <fs_laplace>.
          det = laplace->laplace_expansion( ).
          insert det into table dets.
        endloop.
        get reference of dets into laplace_det.
        v ?= zcl_vector=>create_instance( x = laplace_det kind = vector->kind lenght = lenght  ).
        cross ?= zcl_vector=>_duplicate( v ).
    endcase.
  endmethod.


  method dot_product.
    dot ?= dot_products( v1  = me  v2  = v2 ).
  endmethod.


  method dot_products.
    field-symbols:
      <fs_xt>  type standard table,
      <fs_x>   type any,
      <fs_yt>  type standard table,
      <fs_xr>  type any,
      <fs_yr>  type any,
      <fs_dot> type any.

    check v1 is bound and v2 is bound.
    assign v1->axis->* to <fs_xt>.
    assign v2->axis->* to <fs_yt>.

    if dot is not bound.
      assign v2->type->* to <fs_x>.
      create data dot like <fs_x>.
    endif.
    check dot is bound.
    assign dot->* to <fs_dot>.
    loop at <fs_xt> assigning <fs_xr>.
      assign <fs_yt>[ sy-tabix ] to <fs_yr>.
      <fs_dot> = <fs_dot> + ( <fs_xr> * <fs_yr> ).
    endloop.
  endmethod.


  method elementwise_multiplication.
    v3 ?= elementwise_multiplications( v1 = me v2 = v2 ).
  endmethod.


  method elementwise_multiplications.
    data:
      vt type ref to zcl_vector.
    field-symbols:
      <fs_x>   type standard table,
      <fs_y>   type standard table,
      <fs_z>   type standard table,
      <fs_row> type any.

    check v1 is bound and v2 is bound.
    v3 ?= _overrider( v1 ).
    if v3 is initial.
      v3 = new #( kind = v1->kind lenght = v1->lenght ).
      assign v3->axis->* to <fs_z>.
    elseif zcl_utilities=>is_same( obj_1 = v1 obj_2 = v3 ).
      vt ?= _duplicate( v1 = v1 ).
      assign vt->axis->* to <fs_z>.
    else.
      check v3->lenght = v1->lenght.
      assign v3->axis->* to <fs_z>.
    endif.
    assign v1->axis->* to <fs_x>.
    assign v2->axis->* to <fs_y>.
    loop at <fs_z> assigning <fs_row>.
      <fs_row> = <fs_x>[ sy-tabix ] * <fs_y>[ sy-tabix ].
    endloop.
  endmethod.


  method get_container.
    container ?= get_containers( me ).
  endmethod.


  method get_containers.
    container ?= v1->axis.
  endmethod.


  method get_element.
    value = get_elements( v = me i = i ).
  endmethod.


  method get_elements.
    field-symbols:
      <fs_v> type standard table.

    deref v <fs_v>.
    check i > 0 and i <= lines( <fs_v> ).
    value = <fs_v>[ i ].
  endmethod.


  method kinds.
    kind = v->kind.
  endmethod.


  method magnitude.
    mag = zcl_vector=>magnitudes( me ).
  endmethod.


  method magnitudes.
    data:
       i type i.
    field-symbols:
       <fs_v1> type standard table.

    deref v1 <fs_v1>.
    for i v1->lenght.
      mag = mag + <fs_v1>[ i ] ** 2.
    endfor i.
    mag = sqrt( mag ).
  endmethod.


  method normalize.
    v1_norm ?= normalizes( v1 = me kind = me->kind ).
    me->axis ?= v1_norm->axis.
  endmethod.


  method normalizes.
    data:
      mag    type ref to data,
      type   type ref to data,
      sqrsum type ref to data.
    field-symbols:
      <fs_mag>    type any,
      <fs_sqrsum> type any,
      <fs_x>      type standard table,
      <fs_norm>   type standard table,
      <fs_idx>    type any.

    check v1 is bound.
    v1_norm ?= _overrider( v1 ).
    call method zcl_utilities=>create_type_from_kind
      exporting
        kind = kind
      importing
        type = sqrsum.
    assign sqrsum->* to <fs_sqrsum>.
    clear <fs_sqrsum>.
    assign v1->axis->* to <fs_x>.
    assign v1_norm->axis->* to <fs_norm>.
    loop at <fs_x> assigning <fs_idx>.
      <fs_sqrsum> = <fs_sqrsum> + <fs_idx> * <fs_idx>.
    endloop.
    call method zcl_utilities=>create_type_from_kind
      exporting
        kind = kind
      importing
        type = mag.
    assign sqrsum->* to <fs_mag>.
    <fs_mag> = sqrt( <fs_sqrsum> ).
    check <fs_mag> is assigned.
    loop at <fs_x> assigning <fs_idx>.
      <fs_norm>[ sy-tabix ] = <fs_idx> / <fs_mag>.
    endloop.
  endmethod.


  method outer_product.
    a ?= outer_products( v1 = me v2 = v1 ).
  endmethod.


  method outer_products.
    data:
      i   type i,
      dim type zcl_utilities=>dimension,
      j   type i.
    field-symbols:
      <fs_v1>  type standard table,
      <fs_v2>  type standard table,
      <fs_a>   type standard table,
      <fs_aij> type any.

    dim-row = v1->lenght.
    dim-col = dim-row.
    dpreparem a <fs_a>.
    deref v1 <fs_v1>.
    deref v2 <fs_v2>.
    for i dim-row.
      for j dim-col.
        m_i_j j <fs_a> i <fs_aij>.
        <fs_aij> = <fs_v1>[ i ] * <fs_v2>[ j ].
      endfor j.
    endfor i.
  endmethod.


  method product.
    p ?= products( a = a v = me ).
  endmethod.


  method products.
    data:
      i   type i,
      j   type i,
      dim type zcl_utilities=>dimension.
    field-symbols:
      <fs_a>   type standard table,
      <fs_v>   type standard table,
      <fs_p>   type standard table,
      <fs_aij> type any.

    deref a <fs_a>.
    deref v <fs_v>.
    dpreparev p <fs_p> v.
    dim-row = a->dimension( )-row.
    dim-col = a->dimension( )-col.
    for i dim-row.
      for j dim-col.
        m_i_j j <fs_a> i <fs_aij>.
        <fs_p>[ i ] = <fs_p>[ i ] + <fs_aij> * <fs_v>[ j ].
      endfor j.
    endfor i.
  endmethod.


  method project.
    p ?= projects( v1 = me v2 = v1 ).
  endmethod.


  method projections.
    data:
      ref     type ref to data,
      scalar  type decfloat34,
      factor  type decfloat34,
      squared type decfloat34,
      i       type i,
      j       type i,
      comp1   type decfloat34,
      comp2   type decfloat34.
    field-symbols:
      <fs_v> type standard table,
      <fs_u> type standard table,
      <fs_p> type standard table,
      <fs_x> type any.

* Scalar product of v1 and v2
    scalar = zcl_vector=>scalar_products( v1 = v1 v2 = v2 ).
    deref v1 <fs_v>.
    deref v2 <fs_u>.
    i = 1.
    while i <= v2->lenght.
      comp2 = <fs_u>[ i ].
      squared = squared + ( comp2 ** 2 ).
      i = i + 1.
    endwhile.
    if squared <> 0.
      factor = scalar / squared.
    endif.
    dpreparev p <fs_p> v1.
    i = 1.
    while i <= v1->lenght.
      comp2 = <fs_u>[ i ].
      <fs_p>[ i ] = factor * comp2.
      i = i + 1.
    endwhile.
  endmethod.


  method projects.
    data:
      ref     type ref to data,
      dotv1v2 type ref to data,
      dotv1v1 type ref to data.
    field-symbols:
      <fs_p>   type standard table,
      <fs_d12> type any,
      <fs_d11> type any.

    dotv1v2 ?= zcl_vector=>dot_products( v1 = v1 v2 = v2 ).
    dotv1v1 ?= zcl_vector=>dot_products( v1 = v1 v2 = v1 ).
    assign dotv1v2->* to <fs_d12>.
    assign dotv1v1->* to <fs_d11>.
    dpreparev p <fs_p> v1.
    if <fs_d11> <> 0.
      free p.
      p ?= zcl_vector=>scalar_multiplications( a = ( <fs_d12> / <fs_d11> ) v1 = v1 ).
    endif.
  endmethod.


  method RANK.
    lenght = me->lenght.
  endmethod.


  method RANKS.
    lenght = v->lenght.
  endmethod.


  method scalar_multiplication.
    v2 ?= scalar_multiplications( a  = a v1 = me ).
  endmethod.


  method scalar_multiplications.
    field-symbols:
      <fs_x>   type standard table,
      <fs_y>   type standard table,
      <fs_row> type any.

    check v1 is bound.
    v2 ?= _overrider( v1 ).
    deref v1 <fs_x>.
    deref v2 <fs_y>.
    loop at <fs_x> assigning <fs_row>.
      <fs_y>[ sy-tabix ] = <fs_row> * a.
    endloop.
  endmethod.


  method scalar_products.
    data:
      ref     type ref to data,
      squared type decfloat34,
      factor  type decfloat34,
      i       type i,
      j       type i,
      comp1   type decfloat34,
      comp2   type decfloat34.
    field-symbols:
      <fs_v> type standard table,
      <fs_u> type standard table,
      <fs_x> type any.

    deref v1 <fs_v>.
    deref v2 <fs_u>.
    i = 1.
    while i <= v1->lenght.
      comp1 = <fs_u>[ i ].
      comp2 = <fs_v>[ i ].
      sprod = sprod + ( comp1 * comp2 ).
      i = i + 1.
    endwhile.
  endmethod.


  method SET_ELEMENT.
    set_elements( v = me i = i value = value ).
  endmethod.


  method SET_ELEMENTS.
    field-symbols:
      <fs_v> type standard table.

    deref v <fs_v>.
    check i > 0 and i <= lines( <fs_v> ).
    if add_to = abap_true.
      <fs_v>[ i ] = <fs_v>[ i ] + value.
    elseif sub_from = abap_true.
      <fs_v>[ i ] = <fs_v>[ i ] - value.
    else.
      <fs_v>[ i ] = value.
    endif.
  endmethod.


  method shape.
    shp = shapes( me ).
  endmethod.


  method shapes.
    data:
        shape_ type ref to string.
    field-symbols:
      <fs_s> type any,
      <fs_x> type standard table.

    shape_ = new #(  ).
    assign shape_->* to <fs_s>.
    assign v->axis->* to <fs_x>.
    <fs_s> = |[| && |{ lines( <fs_x> ) }| && |]   dtype:| && |{ v->kind }|.
    shp ?= shape_.
  endmethod.


  method subtraction.
    v3 ?= subtractions( v1 = me v2 = v2 ).
  endmethod.


  method subtractions.
    v3 ?= _plus_minus( v1 = v1 v2 = v2 plus = abap_false type = v1->type ).
  endmethod.


  method SUB_FROM_ELEMENT.
    sub_from_elements( v = me i = i value = value ).
  endmethod.


  method SUB_FROM_ELEMENTS.
    set_elements( v = v i = i value = value sub_from = abap_true ).
  endmethod.


  method to_array.
    arr ?= to_arrays( me ).
  endmethod.


  method to_arrays.
    data:
      array_ type ref to zcl_array,
      ctnr   type ref to data.
    field-symbols:
      <fs_s> type any,
      <fs_x> type standard table,
      <fs_a> type standard table.

    array_ = new #( dim = v->lenght kind = v->kind ).
    ctnr ?= array_->getdata(   ).
    assign ctnr->* to <fs_x>.
    assign v->axis->* to <fs_a>.
    <fs_x>[] = <fs_a>[].
    arr ?= arr.
  endmethod.


  method to_string.
    s = to_strings( v = me ).
  endmethod.


  method to_strings.
    field-symbols:
      <fs_x>   type any table,
      <fs_idx> type any.

    if v is not bound.
      return.
    endif.
    assign v->axis->* to <fs_x>.
    loop at <fs_x> assigning <fs_idx>.
      at first.
        s = '|'.
      endat.
      s = |{ s }| && |{ <fs_idx> }| && '|'.
      at last.
        shift s right.
      endat.
    endloop.
  endmethod.


  method transpose.
    transp ?= transposes( v = me ).
  endmethod.


  method transposes.
    data:
      container type ref to data,
      line      type ref to data,
      axis      type ref to data,
      i         type i.
    field-symbols:
      <fs_container> type any table,
      <fs_axis>      type standard table,
      <fs_row>       type any,
      <fs_col>       type any.

    if vertical = abap_true.
      call method zcl_utilities=>create_dynamic_table_type_t
        exporting
          type  = v->type
        importing
          table = container
          line  = line.
      check container is bound and line is bound.
      assign container->* to <fs_container>.
      insert initial line into table <fs_container> reference into line.
      call method zcl_utilities=>propagate_columns
        exporting
          column = line
          times  = v->lenght
        importing
          table  = container
          line   = line.
      assign container->* to <fs_container>.
      i = 1.
      transp ?= line.
      assign transp->* to <fs_row>.
      axis ?= v->get_container( ).
      assign axis->* to <fs_axis>.
      do v->lenght times.
        assign component i of structure <fs_row> to <fs_col>.
        <fs_col> = <fs_axis>[ i ].
      enddo.
    else.
      " from struct to table
    endif.
  endmethod.


  method _duplicate.
    field-symbols:
      <fs_v1a> type any table,
      <fs_v2a> type any table.

    dpreparev v2 <fs_v2a> v1.
    deref v1 <fs_v1a>.
    <fs_v2a> = corresponding #( <fs_v1a> ).
  endmethod.


  method _is_empty.
    field-symbols:
      <fs_av> type standard table.

    bool = abap_true.
    check v is bound.
    assign v->axis->* to <fs_av>.
    check <fs_av> is assigned.
    check v->lenght > 0.
    check v->type is not initial.
    bool = abap_false.
  endmethod.


  method _overrider.
    field-symbols:
      <fs_lhs> type any table.

    check v1 is bound.
    dpreparev v2 <fs_lhs> v1.
    if zcl_utilities=>is_same( obj_1 = v1 obj_2 = v2 ).
      vt ?= _duplicate( v1 = v1 ).
      v2 ?= _duplicate( v1 = vt ).
    endif.
    deref v2 <fs_lhs>.
    if clean = abap_true.
      clear <fs_lhs>.
    endif.
  endmethod.


  method _plus_minus.
    field-symbols:
      <fs_sign> type any,
      <fs_x>    type standard table,
      <fs_y>    type standard table,
      <fs_z>    type standard table,
      <fs_idx>  type any.

    assign type->* to <fs_sign>.
    if plus = abap_false.
      <fs_sign> = -1.
    else.
      <fs_sign> = 1.
    endif.
    assign v1->axis->* to <fs_x>.
    assign v2->axis->* to <fs_y>.
    if v3 is initial.
      v3 ?= zcl_vector=>create_instance( kind = v1->kind lenght = v1->lenght ).
    endif.
    assign v3->axis->* to <fs_z>.
    loop at <fs_x> assigning <fs_idx>.
      <fs_z>[ sy-tabix ] = <fs_y>[ sy-tabix ] + (  <fs_sign> * <fs_idx> ).
    endloop.
  endmethod.
ENDCLASS.
