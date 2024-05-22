class zcl_array definition
  public
  inheriting from zcl_pysap
  final
  create public .

  public section.

    methods constructor
      importing
        !dim  type i
        !kind type abap_typekind .
    methods getdim
      returning
        value(d) type zcl_utilities=>dimension .
    methods getdata
      returning
        value(dat) type ref to data .
    methods getdatatype
      returning
        value(typ) type abap_typekind .
    methods search
      importing
        !tag       type any
      returning
        value(pos) type i .
    methods sort
      importing
        !asc type boolean default abap_true .
    methods insert
      importing
        !index  type i optional
        !sorted type boolean default abap_false
        !node   type ref to data .
    methods remove
      importing
        !index  type i optional
        !sorted type boolean default abap_false
        !node   type ref to data optional .
    methods splice
      importing
        !idx_from  type i
        !idx_to    type i
        !sorted    type boolean default abap_false
      returning
        value(spl) type ref to data .
    methods to_string
      returning
        value(s) type string .
    methods to_vector
      returning
        value(v) type ref to zcl_vector .
  protected section.
    data arr type ref to data.
    data dtype type abap_typekind.
    data datum type ref to data.

  private section.
ENDCLASS.



CLASS ZCL_ARRAY IMPLEMENTATION.


  method constructor.
    super->constructor(  ).
  endmethod.


  method getdata.
    data:
        buffer type ref to data.
    field-symbols:
      <fs_a> type standard table,
      <fs_b> type standard table.

    create data buffer like arr.
    assign arr->* to <fs_a>.
    assign buffer->* to <fs_b>.
    <fs_b>[] = <fs_a>[].
  endmethod.


  method getdatatype.
    typ = dtype.
  endmethod.


  method getdim.
    d = dim.
  endmethod.


  method insert.
    data:
       idx type i.
    field-symbols:
      <fs_a> type standard table,
      <fs_n> type any,
      <fs_x> type any.

    assign arr->* to <fs_a>.
    assign node->* to <fs_n>.
    if index is supplied and index > lines( <fs_a> ).
      sy-subrc = 8.
    elseif index is supplied and index < lines( <fs_a> ).
      sy-subrc = 8.
    elseif index is supplied and index is initial.
      sy-subrc = 8.
    elseif index is supplied.
      insert <fs_n> into <fs_a> index index.
    else.
      insert <fs_n> into table <fs_a>.
    endif.
    if ( sorted = abap_true ).
      sort <fs_a> ascending.
    endif.
  endmethod.


  method remove.
    data:
       idx type i.
    field-symbols:
      <fs_a> type standard table,
      <fs_n> type any,
      <fs_x> type any.

    check index is supplied or node is supplied.
    assign arr->* to <fs_a>.
    if node is supplied.
      if lines( <fs_a> ) = 0.
        sy-subrc = 4.
        return.
      endif.
      assign node->* to <fs_n>.
      loop at <fs_a> assigning <fs_x>.
        if <fs_n> = <fs_x>.
          add 1 to idx.
          if idx > 1.
            sy-subrc = 8.
            return.
          endif.
        endif.
      endloop.
    endif.
    if index is supplied and index > lines( <fs_a> ).
      sy-subrc = 8.
    elseif index is supplied and index <= 0.
      sy-subrc = 8.
    elseif index is supplied.
      delete <fs_a> index index.
    else.
      read table <fs_a> with key table_line = <fs_n> transporting no fields.
      if sy-subrc = 0.
        delete <fs_a> index sy-tabix.
      endif.
    endif.
    if ( sorted = abap_true ).
      sort <fs_a> ascending.
    endif.
  endmethod.


  method search.
    data:
      idx type i.
    field-symbols:
      <fs_x> type any,
      <fs_a> type standard table.

    assign arr->* to <fs_a>.
    loop at <fs_a> assigning <fs_x>.
      if <fs_x> = tag.
        pos = sy-tabix.
        add 1 to idx.
      endif.
    endloop.
    if pos = 0.
      sy-subrc = 8.
    elseif idx > 1.
      sy-subrc = 4.
    endif.
  endmethod.


  method sort.
    data:
    idx type i.
    field-symbols:
      <fs_x> type any,
      <fs_a> type standard table.

    assign arr->* to <fs_a>.
    if asc = abap_true.
      sort <fs_a> ascending.
    else.
      sort <fs_a> descending.
    endif.
  endmethod.


  method splice.
    data:
       ref type ref to data.
    field-symbols:
      <fs_a> type standard table,
      <fs_b> type standard table,
      <fs_n> type any,
      <fs_x> type any.

    create data ref like <fs_a>.
    assign ref->* to <fs_b>.
    assign arr->* to <fs_a>.
    if ( idx_from = 0 and idx_to = 0 ) or ( idx_from < lines( <fs_a> ) ) or ( idx_to > lines( <fs_a> ) ) or lines( <fs_a> ) = 0.
      sy-subrc = 8.
      return.
    endif.
    loop at <fs_a> assigning <fs_x> from idx_from to idx_to.
      insert <fs_x> into table <fs_b>.
    endloop.
    delete <fs_a> from idx_from to idx_to.
    spl ?= ref.
    if ( sorted = abap_true ).
      sort <fs_a> ascending.
    endif.
  endmethod.


  method to_string.
    field-symbols:
      <fs_x>   type any table,
      <fs_idx> type any.

    assign arr->* to <fs_x>.
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


  method to_vector.
    data:
      w    type ref to zcl_vector,
      ref  type ref to data,
      kind type abap_typekind.
    field-symbols:
      <fs_a> type standard table,
      <fs_b> type standard table.

    assign arr->* to <fs_a>.
    if ( zcl_utilities=>is_integer( <fs_a>[ 1 ] ) ).
      kind =  cl_abap_datadescr=>typekind_int.
    else.
      kind =  cl_abap_datadescr=>typekind_decfloat34.
    endif.
    w ?= zcl_vector=>create_instance( kind = kind rank = lines( <fs_a> ) ).
    ref ?= w->get_container( ).
    assign ref->* to <fs_b>.
    <fs_b>[] = <fs_a>[].
    v ?= w.
  endmethod.
ENDCLASS.
