class zcl_utilities definition
  public
  inheriting from zcl_pysap
  create public .

  public section.

    types:
      begin of dimension,
        row type i,
        col type i,
      end of dimension .
    types axis type ref to data .
    types rank type i .

    constants type type c value 'T' ##NO_TEXT.
    constants like type c value 'L' ##NO_TEXT.
    constants i1 type i value 1 ##NO_TEXT.
    constants i0 type i value 0 ##NO_TEXT.

    class-methods is_same
      importing
        !obj_1      type ref to object
        !obj_2      type ref to object
      returning
        value(bool) type boolean .
    class-methods heap_address
      importing
        !obj     type ref to object
      returning
        value(s) type string .
    class-methods propagate_columns
      importing
        !column type ref to data
        !times  type i
        !resize type boolean default abap_true
      exporting
        !comps  type abap_component_tab
        !table  type ref to data
        !line   type any .
    class-methods create_typed_struct_of_len_n
      importing
        !kind   type abap_typekind
        !len    type i
      exporting
        !struct type ref to data .
    class-methods create_type_from_kind
      importing
        !kind type abap_typekind
      exporting
        !type type ref to data .
    class-methods create_dynamic_table_type_t
      importing
        !type  type ref to data optional
      exporting
        !table type data
        !line  type any .
    class-methods create_dynamic_table_like_t
      importing
        !type  type any
      exporting
        !table type ref to data
        !line  type any .
    class-methods is_numeric
      importing
        !var        type any
      returning
        value(bool) type boolean .
    class-methods is_integer
      importing
        !var        type any
      returning
        value(bool) type boolean .
    class-methods is_table
      importing
        !var        type any
      returning
        value(bool) type boolean .
    class-methods is_struct
      importing
        !var        type any
      returning
        value(bool) type boolean .
    class-methods is_ref
      importing
        !var        type any
      returning
        value(bool) type boolean .
    class-methods is_same_kind
      importing
        !kind_a     type abap_typekind
        !kind_b     type abap_typekind optional
        !var        type ref to data optional
      returning
        value(bool) type abap_bool .
    class-methods is_true
      importing
        !val        type any
      returning
        value(bool) type boolean .
    class-methods get_ref_of_row
      importing
        !var       type any optional
        !row       type i default 1
          preferred parameter var
      returning
        value(ref) type ref to data .
  protected section.

    class-methods is_generic
      importing
        !var        type any
        !kind       type any
      returning
        value(bool) type boolean .
    class-methods describe
      importing
        !var            type any
      returning
        value(type_des) type ref to cl_abap_typedescr .
    class-methods create_generic_dynamic_table
      importing
        !source type ref to data optional
        !type   type any optional
        !mode   type c
      exporting
        !table  type ref to data
        !line   type any .
  private section.
    class-data var type ref to data .
ENDCLASS.



CLASS ZCL_UTILITIES IMPLEMENTATION.


  method create_dynamic_table_like_t.
    call method create_generic_dynamic_table
      exporting
        type  = type
        mode  = zcl_utilities=>like
      importing
        table = table
        line  = line.
  endmethod.


  method create_dynamic_table_type_t.
    call method create_generic_dynamic_table
      exporting
        type  = type
        mode  = zcl_utilities=>type
      importing
        line  = line
        table = table.
  endmethod.


  method create_generic_dynamic_table.
    data :
      type_des   type ref to cl_abap_typedescr,
      struc_des  type ref to cl_abap_structdescr,
      line_des   type ref to cl_abap_structdescr,
      table_des  type ref to cl_abap_tabledescr,
      handle_des type ref to cl_abap_datadescr,
      comps      type abap_component_tab.

    field-symbols:
      <fs_table> type standard table,
      <fs_elem>  type any.

    if mode = zcl_utilities=>type.
      type_des ?=  cl_abap_typedescr=>describe_by_data_ref( type ).
    elseif mode = zcl_utilities=>like.
      type_des ?=  cl_abap_typedescr=>describe_by_data( type ).
    endif.
    assign type->* to <fs_elem>.
    if is_numeric( <fs_elem> ).
      handle_des ?= cl_abap_typedescr=>describe_by_data( <fs_elem> ).
      table_des ?= cl_abap_tabledescr=>create( p_line_type  = handle_des
                                                p_table_kind = cl_abap_tabledescr=>tablekind_std
                                                p_unique     = abap_false
                                              ).
    elseif type_des->kind = cl_abap_typedescr=>typekind_struct1 or type_des->kind = cl_abap_typedescr=>typekind_struct2.
      struc_des ?= type_des.
      comps = struc_des->get_components( ) .
      line_des = cl_abap_structdescr=>create( p_components = comps ) .
      table_des = cl_abap_tabledescr=>create( p_line_type  = line_des
                                               p_table_kind = cl_abap_tabledescr=>tablekind_std
                                               p_unique     = abap_false
                                             ).
    else.
      return.
    endif.
    create data table type handle table_des.
    assign table->* to <fs_table>.
    create data line like line of <fs_table>.
    check line is bound.
  endmethod.


  method create_typed_struct_of_len_n.
    data:
      type  type ref to data,
      table type ref to data.
    field-symbols:
      <fs_field> type any,
      <fs_col>   type standard table,
      <fs_type>  type any.

    call method create_type_from_kind
      exporting
        kind = kind
      importing
        type = type.
    check type is bound.
    assign type->* to <fs_type>.
    create data table like table of <fs_type>.
    assign table->* to <fs_col>.
    do len times.
      insert initial line into table <fs_col> assigning <fs_field>.
      clear <fs_field>.
    enddo.
  endmethod.


  method create_type_from_kind.
    data:
        elem_des type ref to cl_abap_elemdescr.
    case kind.
      when cl_abap_datadescr=>typekind_struct1 or cl_abap_datadescr=>typekind_struct2 or cl_abap_datadescr=>typekind_table or
           cl_abap_datadescr=>typekind_bref or cl_abap_datadescr=>typekind_class or cl_abap_datadescr=>typekind_dref or
           cl_abap_datadescr=>typekind_iref.
        free type.
        return.
      when cl_abap_datadescr=>typekind_char or cl_abap_datadescr=>typekind_clike or cl_abap_datadescr=>typekind_csequence.
        elem_des ?= cl_abap_elemdescr=>get_c( 1 ).
      when cl_abap_datadescr=>typekind_decfloat or cl_abap_datadescr=>typekind_decfloat16 or
           cl_abap_datadescr=>typekind_decfloat34 or cl_abap_datadescr=>typekind_float.
        elem_des ?= cl_abap_elemdescr=>get_decfloat34(  ).
      when cl_abap_datadescr=>typekind_hex.
        elem_des ?= cl_abap_elemdescr=>get_x( 1 ).
      when cl_abap_datadescr=>typekind_int or cl_abap_datadescr=>typekind_int1 or
           cl_abap_datadescr=>typekind_int2 or cl_abap_datadescr=>typekind_int8.
        elem_des ?= cl_abap_elemdescr=>get_int8(  ).
      when cl_abap_datadescr=>typekind_num or cl_abap_datadescr=>typekind_numeric.
        elem_des ?= cl_abap_elemdescr=>get_n( 1 ).
      when cl_abap_datadescr=>typekind_xstring or cl_abap_datadescr=>typekind_xsequence.
        elem_des ?= cl_abap_elemdescr=>get_xstring(  ).
      when cl_abap_datadescr=>typekind_packed.
        elem_des ?= cl_abap_elemdescr=>get_d(  ).
    endcase.
    if elem_des is bound.
      create data type type handle elem_des.
    endif.
  endmethod.


  method describe.
    field-symbols:
        <fs_var> type any.

    free: type_des, zcl_utilities=>var.
    try.
        type_des ?= cl_abap_typedescr=>describe_by_data_ref( var ).
        zcl_utilities=>var ?= var.
        check var is bound.
        assign var->* to <fs_var>.
        type_des ?= cl_abap_typedescr=>describe_by_data( <fs_var> ).
      catch cx_root.
        try.
            type_des ?= cl_abap_typedescr=>describe_by_data( var ).
            zcl_utilities=>var ?= var.
          catch cx_root.
        endtry.
    endtry.
  endmethod.


  method get_ref_of_row.

  endmethod.


  method heap_address.
    data:
      addr type i.

    call 'OBJMGR_GET_INFO' id 'OPNAME' field 'GET_OBJID'
                           id 'OBJID'  field addr
                           id 'OBJ'    field obj.
    s = '{0:' && |{ addr }| && '}'.
  endmethod.


  method is_generic.
    data:
      type_des  type ref to cl_abap_typedescr,
      struc_des type ref to cl_abap_datadescr,
      var_kind  type abap_typekind.
    field-symbols:
        <fs_var> type any.

    type_des ?= describe( var ).
    check type_des is bound.
    assign var->* to <fs_var>.
    struc_des ?= type_des.
    var_kind = struc_des->get_data_type_kind( <fs_var> ).
    case var_kind.
      when kind.
        bool = abap_true.
      when others.
        bool = abap_false.
    endcase.
  endmethod.


  method is_integer.
    data:
      type_des  type ref to cl_abap_typedescr,
      struc_des type ref to cl_abap_datadescr,
      var_kind  type abap_typekind.
    field-symbols:
        <fs_var> type any.

    type_des ?= describe( var ).
    assign var to <fs_var>.
    struc_des ?= type_des.
    var_kind = struc_des->get_data_type_kind( <fs_var> ).
    case var_kind.
      when cl_abap_datadescr=>typekind_int or cl_abap_datadescr=>typekind_int2 or cl_abap_datadescr=>typekind_int8.
        bool = abap_true.
      when others.
        bool = abap_false.
    endcase.
  endmethod.


  method is_numeric.
    data:
      type_des  type ref to cl_abap_typedescr,
      struc_des type ref to cl_abap_datadescr,
      kind      type abap_typekind.
    field-symbols:
        <fs_var> type any.

    type_des ?= describe( var ).
    check type_des is bound.
    assign var to <fs_var>.
    struc_des ?= type_des.
    kind = struc_des->get_data_type_kind( <fs_var> ).
    case kind.
      when cl_abap_datadescr=>typekind_decfloat or cl_abap_datadescr=>typekind_decfloat16 or cl_abap_datadescr=>typekind_decfloat34 or
           cl_abap_datadescr=>typekind_float or cl_abap_datadescr=>typekind_int or cl_abap_datadescr=>typekind_int2 or
           cl_abap_datadescr=>typekind_int8 or cl_abap_datadescr=>typekind_num or cl_abap_datadescr=>typekind_numeric or cl_abap_datadescr=>typekind_packed.
        bool = abap_true.
      when others.
        bool = abap_false.
    endcase.
  endmethod.


  method is_ref.
    bool = abap_false.
    if is_generic( var = var kind = cl_abap_datadescr=>typekind_bref ) or is_generic( var = var kind = cl_abap_datadescr=>typekind_dref ) or is_generic( var = var kind = cl_abap_datadescr=>typekind_iref ).
      bool = abap_true.
    endif.
  endmethod.


  method is_same.
    bool = xsdbool( heap_address( obj_1 ) = heap_address( obj_2  ) ).
  endmethod.


  method is_same_kind.
    data:
      type_des  type ref to cl_abap_typedescr,
      struc_des type ref to cl_abap_datadescr,
      var_kind  type abap_typekind.
    field-symbols:
        <fs_var> type any.

    if kind_b is supplied and kind_b is not initial.
      bool = xsdbool( kind_a = kind_b ).
    elseif var is supplied.
      clear bool.
      type_des ?= describe( var ).
      check type_des is bound.
      assign var->* to <fs_var>.
      struc_des ?= type_des.
      var_kind = struc_des->get_data_type_kind( <fs_var> ).
      if kind_a = var_kind.
        bool = abap_true.
      endif.
    endif.
  endmethod.


  method is_struct.
    bool = abap_false.
    if is_generic( var = var kind = cl_abap_datadescr=>typekind_struct1 ) or is_generic( var = var kind = cl_abap_datadescr=>typekind_struct2 ) .
      bool = abap_true.
    endif.
  endmethod.


  method is_table.
    bool = is_generic( var = var kind = cl_abap_datadescr=>typekind_table ).
  endmethod.


  method is_true.
    bool = xsdbool( val = abap_true ).
  endmethod.


  method propagate_columns.
    data:
      struc_des type ref to cl_abap_structdescr,
      line_des  type ref to cl_abap_structdescr,
      elem_des  type ref to cl_abap_elemdescr,
      table_des type ref to cl_abap_tabledescr,
      data_des  type ref to cl_abap_datadescr,
      comp      type abap_componentdescr.
    field-symbols:
      <fs_table> type standard table,
      <fscomp>   type abap_componentdescr.

    try.
        struc_des ?= cl_abap_typedescr=>describe_by_data_ref( column ).
        comps = struc_des->get_components(  ).
        check lines( comps ) < times.
        comp = comps[ 1 ].
        do times times.
          insert initial line into table comps assigning <fscomp>.
          <fscomp>-name =  'x' && |{ sy-index - 1 }|.
          <fscomp>-type = comp-type.
        enddo.
      catch cx_root.
        elem_des ?= cl_abap_typedescr=>describe_by_data_ref( column ).
        insert initial line into table comps assigning <fscomp>.
        <fscomp>-name = 'x0'.
        data_des ?= elem_des.
        <fscomp>-type = data_des.
        do times - 1 times.
          insert initial line into table comps assigning <fscomp>.
          <fscomp>-name =  'x' && |{ sy-index }|.
          <fscomp>-type = data_des.
        enddo.
    endtry.
    if resize = abap_true.
      line_des = cl_abap_structdescr=>create( p_components = comps ) .
      table_des = cl_abap_tabledescr=>create( p_line_type  = line_des
                                               p_table_kind = cl_abap_tabledescr=>tablekind_std
                                               p_unique     = abap_false
                                             ).
      create data table type handle table_des.
      assign table->* to <fs_table>.
      create data line like line of <fs_table>.
    endif.
  endmethod.
ENDCLASS.
