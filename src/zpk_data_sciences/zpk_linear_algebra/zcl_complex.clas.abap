class zcl_complex definition
  public
    inheriting from zcl_pysap
  final
  create public .

  public section.

    types:
      t_float34 type standard table of decfloat34 with default key .
    types:
      begin of cplx,
        re type decfloat34,
        im type decfloat34,
      end of cplx .
    types:
      t_complex_vector type standard table of cplx with default key .
    types:
      t_complex_matrix type standard table of t_complex_vector with default key .

    data row type i .
    data col type i .
    data a type t_complex_matrix .
    data y type t_complex_vector .
    data x type t_complex_vector .

    methods constructor
      importing
        !dim type zcl_utilities=>dimension .
    methods multiply
      importing
        !p type i
        !q type i
        !b type t_complex_matrix .
    class-methods abs
      importing
        !a        type cplx
      returning
        value(re) type decfloat34 .
    class-methods sum
      importing
        !a       type cplx
        !b       type cplx
      returning
        value(c) type cplx .
    class-methods difference
      importing
        !a       type cplx
        !b       type cplx
      returning
        value(c) type cplx .
    class-methods product
      importing
        !a       type cplx
        !b       type cplx
      returning
        value(c) type cplx .
    class-methods quotient
      importing
        !a       type cplx
        !b       type cplx
      returning
        value(c) type cplx .
  protected section.

    methods multiply_right
      importing
        !p type i
        !q type i
        !b type t_complex_matrix .
    methods multiply_left
      importing
        !p type i
        !q type i
        !b type t_complex_matrix .
    methods multiply_transpose_left
      importing
        !p type i
        !q type i
        !b type t_complex_matrix .
    methods multiply_transpose_right
      importing
        !p type i
        !q type i
        !b type t_complex_matrix .
  private section.


    class-methods c_real
      importing
        !complex    type cplx
      returning
        value(real) type decfloat34 .
    class-methods c_im
      importing
        !complex  type cplx
      returning
        value(im) type decfloat34 .
ENDCLASS.



CLASS ZCL_COMPLEX IMPLEMENTATION.


  method abs.
    re = sqrt( c_real( a ) ** 2  + c_im( a ) ** 2 ).
  endmethod.


  method constructor.
    super->constructor( ).
    col = dim-col.
    row = dim-row.
    zcl_complex=>dim = dim.
  endmethod.


  method c_im.
    im = complex-im.
  endmethod.


  method c_real.
    real = complex-re.
  endmethod.


  method difference.
    c-re = a-re - b-re.
    c-im = a-im - b-im.
  endmethod.


  method multiply.
    data:
      i      type i,
      j      type i,
      k      type i,
      a_left type ref to zcl_matrix,
      y_left type t_float34.
    field-symbols:
      <fs_a>      type standard table,
      <fs_alf>    type standard table,
      <fs_b>      type standard table,
      <fs_a_ij>   type any,
      <fs_alf_ij> type any,
      <fs_b_ik>   type any,
      <fs_a_kj>   type any,
      <fs_re>     type any,
      <fs_im>     type any.

    dpreparem a_left <fs_alf>.
    assign b to <fs_b>.
    assign a to <fs_a>.
    for i row.
      if i = p or i = q.
        y_left[ i ] = zero.
        for j col.
          assign component j of structure <fs_alf>[ i ] to <fs_alf_ij>.
          <fs_alf_ij> = zero.
        endfor j.
        for k col.
          assign component j of structure <fs_alf>[ i ] to <fs_alf_ij>.
          assign component j of structure <fs_a>[ i ] to <fs_a_ij>.
          assign component k of structure <fs_b>[ i ] to <fs_b_ik>.
          assign component j of structure <fs_a>[ k ] to <fs_a_kj>.
          <fs_alf_ij> = <fs_alf_ij> + ( c_real( <fs_b_ik> ) * c_real( <fs_a_kj> ) ).
        endfor k.
      else.
        for j col.
          assign component j of structure <fs_alf>[ i ] to <fs_alf_ij>.
          assign component j of structure <fs_a>[ i ] to <fs_a_ij>.
          <fs_alf_ij> = c_real( <fs_a_ij> ).
        endfor j.
      endif.
    endfor i.
    for i row.
      for j col.
        assign component j of structure <fs_alf>[ i ] to <fs_alf_ij>.
        assign component j of structure <fs_a>[ i ] to <fs_a_ij>.
        real <fs_a_ij>.
        <fs_re> =  <fs_alf_ij>.
      endfor j.
    endfor i.
  endmethod.


  method multiply_left.
    data:
      i      type i,
      j      type i,
      k      type i,
      a_left type ref to zcl_matrix,
      y_left type t_float34.
    field-symbols:
      <fs_a>      type standard table,
      <fs_alf>    type standard table,
      <fs_b>      type standard table,
      <fs_a_ij>   type any,
      <fs_alf_ij> type any,
      <fs_b_ik>   type any,
      <fs_a_kj>   type any,
      <fs_re>     type any,
      <fs_im>     type any.

    dpreparem a_left <fs_alf>.
    assign b to <fs_b>.
    assign a to <fs_a>.
    for i row.
      if i = p or i = q.
        y_left[ i ] = zero.
        for j col.
          assign component j of structure <fs_alf>[ i ] to <fs_alf_ij>.
          <fs_alf_ij> = zero.
        endfor j.
        for k col.
          assign component j of structure <fs_alf>[ i ] to <fs_alf_ij>.
          assign component j of structure <fs_a>[ i ] to <fs_a_ij>.
          assign component k of structure <fs_b>[ i ] to <fs_b_ik>.
          assign component j of structure <fs_a>[ k ] to <fs_a_kj>.
          <fs_alf_ij> = <fs_alf_ij> + ( c_real( <fs_b_ik> ) * c_real( <fs_a_kj> ) ).
        endfor k.
      else.
        for j col.
          assign component j of structure <fs_alf>[ i ] to <fs_alf_ij>.
          assign component j of structure <fs_a>[ i ] to <fs_a_ij>.
          <fs_alf_ij> = c_real( <fs_a_ij> ).
        endfor j.
      endif.
    endfor i.
    for i row.
      for j col.
        assign component j of structure <fs_alf>[ i ] to <fs_alf_ij>.
        assign component j of structure <fs_a>[ i ] to <fs_a_ij>.
        real <fs_a_ij>.
        <fs_re> =  <fs_alf_ij>.
      endfor j.
    endfor i.
  endmethod.


  method multiply_right.
    data:
      i      type i,
      j      type i,
      k      type i,
      a_left type ref to zcl_matrix,
      y_left type t_float34.
    field-symbols:
      <fs_a>      type standard table,
      <fs_alf>    type standard table,
      <fs_b>      type standard table,
      <fs_a_ij>   type any,
      <fs_alf_ij> type any,
      <fs_b_ik>   type any,
      <fs_a_kj>   type any,
      <fs_re>     type any,
      <fs_im>     type any.

    dpreparem a_left <fs_alf>.
    assign b to <fs_b>.
    assign a to <fs_a>.
    for i row.
      for j col.
        assign component j of structure <fs_alf>[ i ] to <fs_alf_ij>.
        assign component j of structure <fs_a>[ i ] to <fs_a_ij>.
        <fs_alf_ij> = c_real( <fs_a_ij> ).
      endfor j.
    endfor i.
    for i row.
      for j col.
        assign component j of structure <fs_alf>[ i ] to <fs_alf_ij>.
        assign component j of structure <fs_a>[ i ] to <fs_a_ij>.
        real <fs_a_ij>.
        <fs_re> =  <fs_alf_ij>.
      endfor j.
    endfor i.
  endmethod.


  method multiply_transpose_left.
    data:
      i      type i,
      j      type i,
      k      type i,
      a_left type ref to zcl_matrix,
      y_left type t_float34.
    field-symbols:
      <fs_a>      type standard table,
      <fs_alf>    type standard table,
      <fs_b>      type standard table,
      <fs_a_ij>   type any,
      <fs_alf_ij> type any,
      <fs_b_ik>   type any,
      <fs_a_kj>   type any,
      <fs_re>     type any,
      <fs_im>     type any.

    dpreparem a_left <fs_alf>.
    assign b to <fs_b>.
    assign a to <fs_a>.
    for i row.
      if i = p or i = q.
        y_left[ i ] = zero.
        for j col.
          assign component j of structure <fs_alf>[ i ] to <fs_alf_ij>.
          <fs_alf_ij> = zero.
        endfor j.
        for k col.
          assign component j of structure <fs_alf>[ i ] to <fs_alf_ij>.
          assign component j of structure <fs_a>[ i ] to <fs_a_ij>.
          assign component k of structure <fs_b>[ i ] to <fs_b_ik>.
          assign component j of structure <fs_a>[ k ] to <fs_a_kj>.
          <fs_alf_ij> = <fs_alf_ij> + ( c_real( <fs_b_ik> ) * c_real( <fs_a_kj> ) ).
        endfor k.
      else.
        for j col.
          assign component j of structure <fs_alf>[ i ] to <fs_alf_ij>.
          assign component j of structure <fs_a>[ i ] to <fs_a_ij>.
          <fs_alf_ij> = c_real( <fs_a_ij> ).
        endfor j.
      endif.
    endfor i.
    for i row.
      for j col.
        assign component j of structure <fs_alf>[ i ] to <fs_alf_ij>.
        assign component j of structure <fs_a>[ i ] to <fs_a_ij>.
        real <fs_a_ij>.
        <fs_re> =  <fs_alf_ij>.
      endfor j.
    endfor i.
  endmethod.


  method multiply_transpose_right.
    data:
      i      type i,
      j      type i,
      k      type i,
      a_left type ref to zcl_matrix,
      y_left type t_float34.
    field-symbols:
      <fs_a>      type standard table,
      <fs_alf>    type standard table,
      <fs_b>      type standard table,
      <fs_a_ij>   type any,
      <fs_alf_ij> type any,
      <fs_b_ik>   type any,
      <fs_a_kj>   type any,
      <fs_re>     type any,
      <fs_im>     type any.

    dpreparem a_left <fs_alf>.
    assign b to <fs_b>.
    assign a to <fs_a>.
    for i row.
      for j col.
        assign component j of structure <fs_alf>[ i ] to <fs_alf_ij>.
        assign component j of structure <fs_a>[ i ] to <fs_a_ij>.
        <fs_alf_ij> = c_real( <fs_a_ij> ).
      endfor j.
    endfor i.
    for i row.
      for j col.
        assign component j of structure <fs_alf>[ i ] to <fs_alf_ij>.
        assign component j of structure <fs_a>[ i ] to <fs_a_ij>.
        real <fs_a_ij>.
        <fs_re> =  <fs_alf_ij>.
      endfor j.
    endfor i.
  endmethod.


  method product.
    c-re = a-re * b-re - a-im * b-im.
    c-im = a-re * b-im + a-im * b-re.
  endmethod.


  method quotient.
    data:
      x type decfloat34.

    x = b-im * b-im + b-re * b-re.
    if x > zero.
      c-re = ( a-re * b-re + a-im * b-im ) / x.
      c-im = ( neg1 * a-re * b-im + a-im * b-re ) / x.
    else.
      c-re = cl_abap_math=>max_decfloat34.
      c-im = zero.
    endif.
  endmethod.


  method sum.
    c-re = a-re + b-re.
    c-im = a-im + b-im.
  endmethod.
ENDCLASS.
