class ZCL_EIGEN_COMPOSITION definition
  public
  inheriting from ZCL_PYSAP
  final
  create public .

public section.

  class-methods CLASS_CONSTRUCTOR .
  class-methods GRAM_SCHMIDT_PROCESS
    importing
      !A type ref to ZCL_MATRIX
    exporting
      !EIGENVALUES type ZCL_UTILITIES=>RSPACE
      !EIGENVECTORS type ZCL_UTILITIES=>RSPACE .
protected section.

  data EIGENVALUE type ref to ZCL_MATRIX .
  data EIGENVECTORS type ref to ZCL_MATRIX .

  class-methods _QR_DECOMPOSITION
    importing
      !A type ref to ZCL_MATRIX
    changing
      !QR type ref to ZCL_MATRIX .
private section.

  class-methods INVERSE_ITERATIONS
    importing
      !A type ref to ZCL_MATRIX
      !EGL type F
    returning
      value(EGV) type ref to ZCL_VECTOR .
  class-methods NORMALIZE_VECTOR
    importing
      !V type ref to ZCL_VECTOR
    returning
      value(EV) type ref to ZCL_VECTOR .
ENDCLASS.



CLASS ZCL_EIGEN_COMPOSITION IMPLEMENTATION.


  method CLASS_CONSTRUCTOR.
  endmethod.


  method gram_schmidt_process.
    define prepare.
      &1 ?= zcl_matrix=>create_instance( dim = a->dimension( ) kind = zcl_matrix=>Kinds( a ) ).
      ref ?= &1->Get_Container( ).
      assign ref->* to &2.
    end-of-definition.
    define preparev.
      &1 ?= zcl_vector=>create_instance( rank = a->dimension( )-row kind = zcl_matrix=>Kinds( a ) ).
      ref ?= &1->Get_Container( ).
      assign ref->* to &2.
    end-of-definition.
    define deref.
      ref ?= &1->get_container( ).
      assign ref->* to &2.
    end-of-definition.
    constants:
      e         type f value '1.0e-10'.
    data:
      p      type ref to zcl_matrix,
      q      type ref to zcl_matrix,
      r      type ref to zcl_matrix,
      qr     type ref to zcl_matrix,
      b      type ref to zcl_matrix,
      id     type ref to zcl_matrix,
      egv    type ref to zcl_vector,
      ev     type ref to zcl_vector,
      egl    type ref to zcl_vector,
      strdes type ref to cl_abap_structdescr,
      iter   type i value 100,
      delta  type f value '0.0001',
      size   type i,
      idx    type i,
      max    type f,
      ref    type ref to data,
      i      type i value 1,
      j      type i,
      k      type i,
      l      type i value 0,
      el     type f.
    field-symbols:
      <fs_a>   type standard table,
      <fs_p>   type standard table,
      <fs_b>   type standard table,
      <fs_q>   type standard table,
      <fs_r>   type standard table,
      <fs_qr>  type standard table,
      <fs_id>  type standard table,
      <fs_ev>  type standard table,
      <fs_egv> type standard table,
      <fs_egl> type standard table,
      <fs_x>   type any,
      <fs_y>   type any.

    deref a <fs_a>.
    ev ?= zcl_vector=>create_instance( kind = zcl_matrix=>kinds( a ) rank = a->dimension( )-row  ).
    deref ev <fs_ev>.
    prepare p <fs_p>.
    <fs_p>[] = <fs_a>[].
    prepare q <fs_q>.
    prepare r <fs_r>.
    prepare qr <fs_qr>.
    prepare b <fs_b>.
    prepare id <fs_id>.
    preparev egv <fs_egv>.
    size = lines( <fs_p> ).
    do size times.
      clear: <fs_q>[ i ], <fs_id>[ i ].
      assign component i of structure <fs_q>[ i ] to <fs_x>.
      <fs_x> = 1.
      assign component i of structure <fs_id>[ i ] to <fs_x>.
      <fs_x> = 1.
      i = i + 1.
    enddo.
    do iter times.
      clear: <fs_qr>[], <fs_b>[].
      call method _qr_decomposition
        exporting
          a  = a
        changing
          qr = qr.
      b ?= zcl_matrix=>multiplications( a = q b = qr ).
      <fs_q>[] = <fs_b>[].
      b ?= zcl_matrix=>multiplications( a = qr b = p ).
      <fs_p> = <fs_b>.
      k = 1.
      j = 1.
      i = 1.
      loop at <fs_p> assigning <fs_x>.
        at first.
          if l = 0.
            strdes ?= cl_abap_structdescr=>describe_by_data( <fs_x> ).
            l = lines( strdes->get_components( ) ).
          endif.
        endat.
        do l times.
          assign component i of structure <fs_x> to <fs_y>.
          check <fs_y> <> 0.
          if k <> j and <fs_y> > delta.
            exit.
          endif.
          k = k + 1.
          i = i + 1.
        enddo.
      endloop.
      if k = j.
        exit.
      endif.
    enddo.
    j = 1.
    loop at <fs_p> assigning <fs_x>.
      assign component j of structure <fs_x> to <fs_y>.
      append <fs_y> to <fs_ev>.
      j = j + 1.
    endloop.
    <fs_egv>[] = <fs_id>.
    i = 1.
    j = 1.
    do size times.
      assign component i of structure <fs_egl>[ j ] to <fs_y>.
      el = <fs_y>.
      egv ?= inverse_iterations( a = p egl = el ).
      deref egv <fs_egv>.
      ev ?= normalize_vector( egv ).
      deref ev <fs_ev>.
      loop at <fs_ev> assigning <fs_y>.
        max = abs( <fs_y> ).
        if max > e.
          idx = sy-tabix.
          exit.
        endif.
      endloop.
      k = 1.
      do size times.
        assign component max of structure <fs_egl>[ k ] to <fs_y>.
        if sy-subrc = 0.
          max = <fs_y>.
          exit.
        endif.
      enddo.
      if max <> 0.
        ev ?= zcl_vector=>scalar_multiplications( v1 = ev a = 1 / max ).
      endif.
      <fs_egv>[ j ] = <fs_egl>[ i ] && <fs_b>[ j ].
    enddo.
  endmethod.


  method inverse_iterations.
    define prepare.
      &1 ?= zcl_matrix=>create_instance( dim = a->dimension( ) kind = zcl_matrix=>Kinds( a ) ).
      ref ?= &1->Get_Container( ).
      assign ref->* to &2.
    end-of-definition.
    define deref.
      ref ?= &1->get_container( ).
      assign ref->* to &2.
    end-of-definition.
    data:
      matrix_size     type i,
      i               type i,
      j               type i,
      k               type i,
      v               type ref to zcl_vector,
      ref             type ref to data,
      tolerance       type f value '0.0001',
      identity_matrix type ref to zcl_matrix,
      inverse_matrix  type ref to zcl_matrix,
      temp_matrix     type ref to zcl_matrix,
      resumatrix      type ref to zcl_matrix.
    field-symbols:
      <fs_a>    type standard table,
      <fs_id>   type standard table,
      <fs_temp> type standard table,
      <fs_v>    type standard table,
      <fs_ev>   type standard table,
      <fs_res>  type standard table,
      <fs_t>    type any,
      <fs_x>    type any.

    deref a <fs_a>.
    matrix_size = lines( <fs_a> ).
    prepare identity_matrix <fs_id>.
    prepare temp_matrix <fs_temp>.
    do matrix_size times.
      append 1 to <fs_id>.
    enddo.
    loop at <fs_a> assigning <fs_x>.
      insert initial line into table <fs_temp> assigning <fs_t>.
      <fs_t> = <fs_x> - egl.
    endloop.
    inverse_matrix ?= zcl_matrix=>inverts( temp_matrix ).
    resumatrix ?= zcl_matrix=>multiplications( a = inverse_matrix b = identity_matrix ).
    deref resumatrix <fs_res>.
    v ?= zcl_vector=>create_instance( rank = lines( <fs_res> ) kind = zcl_matrix=>kinds( resumatrix ) ).
    deref v <fs_ev>.
    insert lines of <fs_res> into table <fs_ev>.
    egv ?= normalize_vector( v ).
  endmethod.


  method normalize_vector.
    define prepare.
    end-of-definition.
    define deref.
      ref ?= &1->get_container( ).
      assign ref->* to &2.
    end-of-definition.
    data:
      ref  type ref to data,
      size type i,
      i    type i,
      sum  type f.
    field-symbols:
      <fs_ev> type standard table,
      <fs_v>  type standard table,
      <fs_x>  type any,
      <fs_y>  type any.

    sum = 0.
    deref v <fs_v>.
    size = lines( <fs_v> ).
    ev ?= zcl_vector=>create_instance( kind = zcl_vector=>kinds( v )  rank = zcl_vector=>ranks( v ) ).
    ref ?= ev->get_container( ).
    assign ref->* to <fs_ev>.
    loop at <fs_v> assigning <fs_x>.
      sum = sum + <fs_x> ** 2.
    endloop.
    sum = sqrt( sum ).
    loop at <fs_v> assigning <fs_x>.
      insert initial line into table <fs_ev> assigning <fs_y>.
      <fs_y> = <fs_x> / sum.
    endloop.
  endmethod.


  method _qr_decomposition.
    data:
      size   type i,
      i      type i,
      j      type i,
      k      type i,
      l      type i,
      m      type i,
      sum    type f,
      ref    type ref to data,
      strdes type ref to cl_abap_structdescr,
      b      type ref to zcl_matrix.
    field-symbols:
      <fs_a> type standard table,
      <fs_b> type standard table,
      <fs_x> type any,
      <fs_y> type any.

    check a is bound.
    ref ?= a->get_container( ).
    assign ref->* to <fs_a>.
    size = lines( <fs_a> ).
    b ?= zcl_matrix=>create_instance( dim = a->dimension( ) kind = zcl_matrix=>kinds( a ) ).
    ref ?= b->get_container( ).
    assign ref->* to <fs_b>.
    <fs_b>[] = <fs_a>[].
    strdes ?= cl_abap_structdescr=>describe_by_data( <fs_b>[ 1 ] ).
    l = lines( strdes->get_components( ) ).
    do size - 1 times.
      do size - sy-index + 1 times.
        sum = 0.
        j = size - sy-index.
        k = j.
        do k times.
          m = 1.
          do l times.
            assign component m of structure <fs_b>[ sy-index ] to <fs_x>.
            sum = sum + <fs_x> ** 2.
            add 1 to m.
          enddo.
        enddo.
        sum = sqrt( sum ).
        assign component 1 of structure <fs_b>[ sy-index ] to <fs_x>.
        if <fs_x> < 0.
          sum = sum * -1.
        endif.
        sum = sum + <fs_x>.
        sum = <fs_x> / sum.
        m = 1.
        do size times.
          assign component m of structure <fs_b>[ sy-index ] to <fs_x>.
          <fs_x> = <fs_x> * sum.
          add 1 to m.
        enddo.
        sum = 0.
        m = 1.
        do size times.
          assign component m of structure <fs_b>[ sy-index ] to <fs_x>.
          sum = sum + <fs_x> ** 2.
          add 1 to m.
        enddo.
        assign component sy-index of structure <fs_b>[ sy-index ] to <fs_x>.
        sum = <fs_x> / sum.
        m = 1.
        do size times.
          assign component m of structure <fs_b>[ sy-index ] to <fs_x>.
          <fs_x> = <fs_x> * sum.
          add 1 to m.
        enddo.
      enddo.
      k = lines( <fs_a> ) - sy-index.
      j = k.
      do k times.
        m = 1.
        do l times.
          assign component m of structure <fs_b>[ j ] to <fs_x>.
          assign component m of structure <fs_a>[ j ] to <fs_y>.
          <fs_x> = <fs_x> + <fs_y>.
          add 1 to m.
        enddo.
      enddo.
    enddo.
    qr ?= b.
  endmethod.
ENDCLASS.
