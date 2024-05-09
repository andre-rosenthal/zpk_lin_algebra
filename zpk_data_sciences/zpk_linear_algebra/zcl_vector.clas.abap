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
      !VRANK type I optional
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
      !RANK type I default 3
    returning
      value(V) type ref to OBJECT .
  methods CROSS_PRODUCT
    importing
      !V2 type ref to ZCL_VECTOR
    returning
      value(CROSS) type ref to ZCL_VECTOR .
  class-methods CROSS_PRODUCTS
    importing
      !VS type ZCL_UTILITIES=>RSPACE
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
  methods NORMALIZE
    returning
      value(V1_NORM) type ref to ZCL_VECTOR .
  class-methods NORMALIZES
    importing
      !V1 type ref to ZCL_VECTOR
      !KIND type ABAP_TYPEKIND
    returning
      value(V1_NORM) type ref to ZCL_VECTOR .
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
  methods TO_ARRAY
    returning
      value(ARR) type ref to ZCL_ARRAY .
  class-methods TO_ARRAYS
    importing
      !V type ref to ZCL_VECTOR
    returning
      value(ARR) type ref to ZCL_ARRAY .
  methods SHAPE
    returning
      value(SHP) type ref to DATA .
  class-methods SHAPES
    importing
      !V type ref to ZCL_VECTOR
    returning
      value(SHP) type ref to DATA .
  class-methods RANKS
    importing
      !V type ref to ZCL_VECTOR
    returning
      value(RANK) type I .
  class-methods KINDS
    importing
      !V type ref to ZCL_VECTOR
    returning
      value(KIND) type ABAP_TYPEKIND .
  protected section.

    data kind type abap_typekind .
    data random type ref to cl_random_number .
    data axis type zcl_utilities=>axis .
    data rank type zcl_utilities=>rank .
    data type type ref to data .
    class-data vt type ref to zcl_vector .

    methods constructor
      importing
        !axis type zcl_utilities=>axis optional
        !v1   type ref to zcl_vector optional
        !deep type boolean default abap_false
        !kind type abap_typekind
        !rand type boolean default abap_false
        !rank type i .
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


  method base.
    space_base ?=  basis( v = me ).
  endmethod.


  method basis.
    data:
      vx   type ref to zcl_vector,
      vy   type ref to zcl_vector,
      i    type i,
      j    type i,
      rank type i.
    field-symbols:
      <fs_axis>  type standard table,
      <fs_space> type standard table.

    i = 1.
    create data space_base type zcl_utilities=>rspace.
    assign space_base->* to <fs_space>.
    if v is bound.
      rank = v->rank.
      vy ?= v.
    else.
      rank = vrank.
      vy ?= create_instance( kind = kind rank = rank ).
    endif.
    do rank times.
      vx ?= _duplicate( vy ).
      assign vx->axis->* to <fs_axis>.
      j = 1.
      do vx->rank times.
        clear <fs_axis>[ j ].
        add 1 to j.
      enddo.
      <fs_axis>[ i ] = zcl_utilities=>f1.
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
      me->rank = lines( <fs_y> ).
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
        do rank times.
          insert initial line into table <fs_x> assigning <fs_t>.
          if int = abap_true.
            <fs_t> = random->if_random_number~get_random_int( i_limit = 1024 ).
          else.
            <fs_t> = random->if_random_number~get_random_float( ).
          endif.
        enddo.
        me->rank = rank.
      else.
        me->rank = rank.
        do rank times.
          insert initial line into table <fs_x>.
        enddo.
      endif.
    endif.
  endmethod.


  method create_instance.
    v ?= new zcl_vector( axis = x v1 = v1 deep = deep kind = kind rand = rand rank = rank ).
  endmethod.


  method cross_product.
    data:
        set type zcl_utilities=>rspace.

    insert me into table set.
    insert v2 into table set.
    cross ?= cross_products( set ).
  endmethod.


  method cross_products.
    data:
      i           type i,
      j           type i,
      k           type i,
      rank        type i,
      det         type f,
      dets        type standard table of f,
      axis        type ref to data,
      laplace_det type ref to data,
      container   type ref to data,
      dim         type zcl_utilities=>dimension,
      laplacian   type zcl_utilities=>laplacian,
      laplace     type ref to zcl_matrix,
      base_set    type ref to data,
      base        type ref to zcl_vector,
      matrix      type ref to zcl_matrix,
      v           type ref to zcl_vector,
      vector      type ref to zcl_vector.
    field-symbols:
      <fs_space>     type zcl_utilities=>rspace,
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
          if rank = 0.
            rank = vector->rank.
          else.
            if rank <> vector->rank.
              return.
            endif.
          endif.
          add 1 to i.
        enddo.
        check rank - 1 = lines( vs ).
        dim-row = vector->rank.
        dim-col = vector->rank.
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
        v ?= zcl_vector=>create_instance( x = laplace_det kind = vector->kind rank = rank  ).
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
      v3 = new #( kind = v1->kind rank = v1->rank ).
      assign v3->axis->* to <fs_z>.
    elseif zcl_utilities=>is_same( obj_1 = v1 obj_2 = v3 ).
      vt ?= _duplicate( v1 = v1 ).
      assign vt->axis->* to <fs_z>.
    else.
      check v3->rank = v1->rank.
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


  method KINDS.
    kind = v->kind.
  endmethod.


  method normalize.
    v1_norm ?= normalizes( v1 = me kind = me->kind ).
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


  method RANKS.
    rank = v->rank.
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
    assign v1->axis->* to <fs_x>.
    assign v2->axis->* to <fs_y>.
    loop at <fs_x> assigning <fs_row>.
      <fs_y>[ sy-tabix ] = <fs_row> * a.
    endloop.
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


  method to_array.
    arr ?= to_arrays( me ).
  endmethod.


  method to_arrays.
    data:
        array_ type ref to zcl_array,
        ctnr    type ref to data.
    field-symbols:
      <fs_s> type any,
      <fs_x> type standard table,
      <fs_a> type standard table.

    array_ = new #( dim = v->rank kind = v->kind ).
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
          times  = v->rank
        importing
          table  = container
          line   = line.
      assign container->* to <fs_container>.
      i = 1.
      transp ?= line.
      assign transp->* to <fs_row>.
      axis ?= v->get_container( ).
      assign axis->* to <fs_axis>.
      do v->rank times.
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

    v2 ?= create_instance( kind = v1->kind rank = v1->rank ).
    assign v1->axis->* to <fs_v1a>.
    assign v2->axis->* to <fs_v2a>.
    <fs_v2a> = corresponding #( <fs_v1a> ).
  endmethod.


  method _is_empty.
    field-symbols:
      <fs_av> type standard table.

    bool = abap_true.
    check v is bound.
    assign v->axis->* to <fs_av>.
    check <fs_av> is assigned.
    check v->rank > 0.
    check v->type is not initial.
    bool = abap_false.
  endmethod.


  method _overrider.
    field-symbols:
      <fs_lhs> type any table.

    check v1 is bound.
    if v2 is initial.
      v2 = new #( kind = v1->kind rank = v1->rank ).
    elseif zcl_utilities=>is_same( obj_1 = v1 obj_2 = v2 ).
      vt ?= _duplicate( v1 = v1 ).
      v2 ?= _duplicate( v1 = vt ).
      assign v2->axis->* to <fs_lhs>.
      if clean = abap_true.
        clear <fs_lhs>.
      endif.
    else.
      assign v2->axis->* to <fs_lhs>.
      if clean = abap_true.
        clear <fs_lhs>.
      endif.
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
      v3 ?= zcl_vector=>create_instance( kind = v1->kind rank = v1->rank ).
    endif.
    assign v3->axis->* to <fs_z>.
    loop at <fs_x> assigning <fs_idx>.
      <fs_z>[ sy-tabix ] = <fs_y>[ sy-tabix ] + (  <fs_sign> * <fs_idx> ).
    endloop.
  endmethod.
ENDCLASS.
