class ZCL_EIGEN_COMPOSITION definition
  public
  inheriting from ZCL_PYSAP
  final
  create public .

public section.

  types:
    egvalue type standard table of f with default key .

  constants ZERO type DECFLOAT34 value '0.0' ##NO_TEXT.
  constants ONE type DECFLOAT34 value '1.0' ##NO_TEXT.
  constants NEG1 type DECFLOAT34 value '-1.0' ##NO_TEXT.

  class-methods CLASS_CONSTRUCTOR .
  class-methods GRAM_SCHMIDT_PROCESS
    changing
      !A type ref to ZCL_MATRIX
      !EIGENVALUES type ref to ZCL_VECTOR
      !EIGENVECTORS type ZCL_UTILITIES=>VSPACE .
  class-methods INVERT_JACOBI
    importing
      !A type ref to ZCL_MATRIX
    returning
      value(INV) type ref to ZCL_MATRIX .
  class-methods JACOBI
    importing
      !A type ref to ZCL_MATRIX
    exporting
      !EIGENVALUES type ZCL_UTILITIES=>VSPACE
      !EIGENVECTORS type ZCL_UTILITIES=>VSPACE
      !ROTATIONS type I .
  class-methods QR_PROCESS
    importing
      !A type ref to ZCL_MATRIX
    exporting
      !EIGENVECTORS type ZCL_UTILITIES=>VSPACE
      !EIGENVALUES type ref to ZCL_VECTOR .
  class-methods DOUBLE_SHIFT_FRANCIS
    importing
      !A type ref to ZCL_MATRIX
      !COMPUTE_T type BOOLEAN default ABAP_FALSE
      !BALACE type BOOLEAN default ABAP_FALSE
    exporting
      !EIGENVALUES type ref to ZCL_VECTOR
      !EIGENVECTORS type ZCL_UTILITIES=>VSPACE
      !T type ref to ZCL_MATRIX .
  class-methods GENERALIZED
    importing
      !A type ref to ZCL_MATRIX
      !B type ref to ZCL_MATRIX optional
    exporting
      !EIGENVALUES type ZCL_UTILITIES=>VSPACE
      !EIGENVECTORS type ZCL_UTILITIES=>VSPACE .
  class-methods DOMINANT_EIGENSOLUTION
    importing
      !A type ref to ZCL_MATRIX
    exporting
      value(EIGENVECTORS) type ZCL_UTILITIES=>VSPACE
      value(EIGENVALUES) type ZCL_UTILITIES=>VSPACE .
  class-methods QR_ALGORITHM
    importing
      !A type ref to ZCL_MATRIX
    exporting
      !EIGENVALUES type ZCL_UTILITIES=>VSPACE
      !EIGENVECTORS type ZCL_UTILITIES=>VSPACE .
protected section.

  data EIGENVALUES type ZCL_UTILITIES=>VSPACE .
  data EIGENVECTORS type ZCL_UTILITIES=>VSPACE .

  class-methods HAS_CONVERGED
    importing
      !A type ref to ZCL_MATRIX
    returning
      value(CVG) type BOOLEAN .
  private section.

    class-data row type i .
    class-data col type i .
    constants e type decfloat34 value '1.0e-10' ##NO_TEXT.
    constants delta type decfloat34 value '0.0001' ##NO_TEXT.
    constants max_iteration type i value 1000 ##NO_TEXT.
    constants max_rotation type i value 45 ##NO_TEXT.

    class-methods decompose_qr
      importing
        !a type ref to zcl_matrix
      exporting
        !q type ref to zcl_matrix
        !r type ref to zcl_matrix .
    class-methods qr_decomposition
      importing
        !a type ref to zcl_matrix
      exporting
        !q type ref to zcl_matrix
        !r type ref to zcl_matrix .
    class-methods hypothenuse
      importing
        !x       type any
        !y       type any
      returning
        value(z) type decfloat34 .
    class-methods jacobian
      importing
        !right type boolean default abap_false
        !left  type boolean default abap_false
        !c     type decfloat34
        !s     type decfloat34
        !p     type i
        !q     type i
      changing
        !a     type ref to zcl_matrix .
    class-methods norm
      importing
        !a          type ref to zcl_matrix
      returning
        value(norm) type decfloat34 .
    class-methods symschur2
      exporting
        !c         type decfloat34
        !s         type decfloat34
      changing
        !a         type ref to zcl_matrix
        !p         type i
        !q         type i
      returning
        value(red) type i .
ENDCLASS.



CLASS ZCL_EIGEN_COMPOSITION IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EIGEN_COMPOSITION=>CLASS_CONSTRUCTOR
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method class_constructor.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method ZCL_EIGEN_COMPOSITION=>DECOMPOSE_QR
* +-------------------------------------------------------------------------------------------------+
* | [--->] A                              TYPE REF TO ZCL_MATRIX
* | [<---] Q                              TYPE REF TO ZCL_MATRIX
* | [<---] R                              TYPE REF TO ZCL_MATRIX
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method decompose_qr.
    data:
      converge    type boolean,
      ref         type ref to data,
      b           type ref to zcl_matrix,
      eigenvalue  type ref to zcl_vector,
      tmp         type ref to zcl_vector,
      diag        type ref to zcl_vector,
      diag_x      type ref to zcl_vector,
      vector      type ref to zcl_vector,
      eigenvector type ref to zcl_matrix,
      i           type i,
      j           type i,
      k           type i,
      norm        type decfloat34,
      norm_ar     type standard table of decfloat34,
      dot         type decfloat34.
    field-symbols:
      <fs_a>   type standard table,
      <fs_b>   type standard table,
      <fs_v>   type standard table,
      <fs_tmp> type standard table,
      <fs_vt>  type standard table,
      <fs_vl>  type standard table,
      <fs_q>   type standard table,
      <fs_r>   type standard table,
      <fs_bij> type any,
      <fs_bii> type any,
      <fs_qij> type any,
      <fs_qik> type any,
      <fs_rkj> type any,
      <fs_rkk> type any,
      <fs_x>   type any.

    preparem b <fs_b>.
    norm_ar[] = <fs_b>[].
    deref a <fs_a>.
    <fs_b>[] = <fs_a>[].
    preparem q <fs_q>.
    preparem r <fs_r>.
    i = 1.
    while i <= a->dimension( )-row.
      j = 1.
      while j <= a->dimension( )-row.
        assign component i of structure <fs_q>[ j ] to <fs_qij>.
        assign component i of structure <fs_b>[ j ] to <fs_bij>.
        <fs_qij> =  <fs_bij>.
        add j to i.
      endwhile.
      j = 1.
      while j <= i.
        dot = zero.
        k = 1.
        while k <= a->dimension( )-row.
          assign component i of structure <fs_q>[ k ] to <fs_qik>.
          assign component j of structure <fs_q>[ k ] to <fs_qij>.
          dot = dot + <fs_qij> * <fs_qik>.
          add 1 to k.
        endwhile.
        k = 1.
        while k <= a->dimension( )-row.
          assign component i of structure <fs_q>[ k ] to <fs_qik>.
          assign component j of structure <fs_q>[ k ] to <fs_qij>.
          <fs_qik> = <fs_qik> - dot * <fs_qij>.
          add 1 to k.
        endwhile.
        add 1 to j.
      endwhile.
      norm_ar[ i ] = zero.
      j = 1.
      while j <= a->dimension( )-row.
        assign component i of structure <fs_q>[ j ] to <fs_qik>.
        norm_ar[ i ] = norm_ar[ i ] + <fs_qik> ** 2.
        add j to i.
      endwhile.
      norm_ar[ i ] = sqrt( norm_ar[ i ] ).
      j = 1.
      while j <= a->dimension( )-row.
        assign component j of structure <fs_q>[ i ] to <fs_qik>.
        <fs_qik> = <fs_qik> / norm_ar[ i ].
        add 1 to j.
      endwhile.
      assign component i of structure <fs_r>[ i ] to <fs_rkk>.
      <fs_rkk> = norm_ar[ i ].
      j = 1.
      while j <= i.
        dot = zero.
        k = 1.
        while k <= a->dimension( )-row.
          assign component i of structure <fs_q>[ k ] to <fs_qik>.
          assign component j of structure <fs_q>[ k ] to <fs_qij>.
          dot = dot + <fs_qij> * <fs_qik>.
          add 1 to k.
        endwhile.
        assign component j of structure <fs_r>[ i ] to <fs_x>.
        <fs_x> = dot.
        k = 1.
        while k <= a->dimension( )-row.
          assign component i of structure <fs_q>[ k ] to <fs_qik>.
          assign component j of structure <fs_q>[ k ] to <fs_qij>.
          <fs_qik> = <fs_qik> - dot * <fs_qij>.
          add 1 to k.
        endwhile.
        add 1 to j.
      endwhile.
      add 1 to i.
    endwhile.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EIGEN_COMPOSITION=>DOMINANT_EIGENSOLUTION
* +-------------------------------------------------------------------------------------------------+
* | [--->] A                              TYPE REF TO ZCL_MATRIX
* | [<---] EIGENVECTORS                   TYPE        ZCL_UTILITIES=>VSPACE
* | [<---] EIGENVALUES                    TYPE        ZCL_UTILITIES=>VSPACE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method dominant_eigensolution.
    data:
      i           type i,
      j           type i,
      iter        type i,
      norm        type decfloat34,
      residual    type decfloat34,
      lambda      type decfloat34,
      lambda_x    type decfloat34,
      ref         type ref to data,
      ax          type ref to zcl_matrix,
      eigenvalue  type ref to zcl_vector,
      vector      type ref to zcl_vector,
      temp        type ref to zcl_vector,
      eigenvector type ref to zcl_vector.
    field-symbols:
      <fs_a>    type standard table,
      <fs_evt>  type standard table,
      <fs_ev>   type standard table,
      <fs_evl>  type standard table,
      <fs_ax>   type standard table,
      <fs_tmp>  type standard table,
      <fs_axij> type any,
      <fs_ei>   type any,
      <fs_ei1>  type any,
      <fs_x>    type any.

    preparev eigenvector <fs_evt>.
    preparev vector <fs_ev>.
    preparev temp <fs_tmp>.
    preparev eigenvalue <fs_evl>.
    preparem ax <fs_ax>.
    deref a <fs_a>.
    <fs_ax>[] = <fs_a>.
    loop at <fs_evt> assigning <fs_ei>.
      assign component 1 of structure <fs_ei> to <fs_ei1>.
      <fs_ei1> = one.
    endloop.
    residual = cl_abap_math=>max_decfloat34.
    lambda_x = zero.
    iter = 1.
    while iter <= max_iteration and residual > e.
      norm = zero.
      i = 1.
      while i <= a->dimension( )-row.
        j = 1.
        while j <= a->dimension( )-row.
          assign component j of structure <fs_ax>[ i ] to <fs_axij>.
          <fs_ev>[ j ] = <fs_ev>[ j ] + <fs_axij> * <fs_evt>[ j ].
          j = j + 1.
        endwhile.
        norm = norm + <fs_ev>[ i ] ** 2.
        i = i + 1.
      endwhile.
      norm = sqrt( norm ).
      lambda_x = zero.
      i = 1.
      while i <= a->dimension( )-row and norm > 0.
        <fs_ev>[ i ] = <fs_ev>[ i ] / norm.
        assign component 1 of structure <fs_ax>[ i ] to <fs_axij>.
        lambda_x = lambda_x + <fs_ev>[ i ] * <fs_axij>.
        i = i + 1.
      endwhile.
      residual = lambda_x - lambda.
      lambda = lambda_x.
      <fs_tmp>[] = <fs_evt>[].
      <fs_evt>[] = <fs_ev>[].
      <fs_ev>[] = <fs_tmp>[].
      iter = iter + 1.
    endwhile.
    <fs_evl>[ 1 ] = lambda_x.
    insert eigenvalue into table eigenvalues.
    insert eigenvector into table eigenvectors.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EIGEN_COMPOSITION=>DOUBLE_SHIFT_FRANCIS
* +-------------------------------------------------------------------------------------------------+
* | [--->] A                              TYPE REF TO ZCL_MATRIX
* | [--->] COMPUTE_T                      TYPE        BOOLEAN (default =ABAP_FALSE)
* | [--->] BALACE                         TYPE        BOOLEAN (default =ABAP_FALSE)
* | [<---] EIGENVALUES                    TYPE REF TO ZCL_VECTOR
* | [<---] EIGENVECTORS                   TYPE        ZCL_UTILITIES=>VSPACE
* | [<---] T                              TYPE REF TO ZCL_MATRIX
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method double_shift_francis.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EIGEN_COMPOSITION=>GENERALIZED
* +-------------------------------------------------------------------------------------------------+
* | [--->] A                              TYPE REF TO ZCL_MATRIX
* | [--->] B                              TYPE REF TO ZCL_MATRIX(optional)
* | [<---] EIGENVALUES                    TYPE        ZCL_UTILITIES=>VSPACE
* | [<---] EIGENVECTORS                   TYPE        ZCL_UTILITIES=>VSPACE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method generalized.
    data:
      i            type i,
      p            type i,
      c            type decfloat34,
      s            type decfloat34,
      ep           type decfloat34,
      ev           type decfloat34,
      normal       type decfloat34,
      ax           type ref to zcl_matrix,
      red          type decfloat34,
      max_rotation type i,
      ref          type ref to data,
      q            type ref to zcl_vector,
      z            type ref to zcl_vector,
      eigenvalue   type ref to zcl_vector,
      eigenvector  type ref to zcl_matrix.
    field-symbols:
      <fs_a>   type standard table,
      <fs_ax>  type standard table,
      <fs_z>   type standard table,
      <fs_evl> type standard table,
      <fs_app> type any,
      <fs_x>   type any,
      <fs_y>   type any.


    preparev z <fs_z>.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EIGEN_COMPOSITION=>GRAM_SCHMIDT_PROCESS
* +-------------------------------------------------------------------------------------------------+
* | [<-->] A                              TYPE REF TO ZCL_MATRIX
* | [<-->] EIGENVALUES                    TYPE REF TO ZCL_VECTOR
* | [<-->] EIGENVECTORS                   TYPE        ZCL_UTILITIES=>VSPACE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method gram_schmidt_process.
    data:
      p      type ref to zcl_matrix,
      q      type ref to zcl_matrix,
      r      type ref to zcl_matrix,
      qr     type ref to zcl_matrix,
      b      type ref to zcl_matrix,
      id     type ref to zcl_matrix,
      idx1   type i,
      val    type decfloat34,
      egvl   type ref to zcl_vector,
      ev     type ref to zcl_vector,
      egvt   type ref to zcl_vector,
      egvlx  type ref to zcl_vector,
      strdes type ref to cl_abap_structdescr,
      iter   type i value 100,
      idx    type i,
      max    type decfloat34,
      ref    type ref to data,
      i      type i value 1,
      j      type i,
      k      type i,
      l      type i value 0,
      el     type decfloat34.
    field-symbols:
      <fs_a>     type standard table,
      <fs_p>     type standard table,
      <fs_b>     type standard table,
      <fs_q>     type standard table,
      <fs_r>     type standard table,
      <fs_qr>    type standard table,
      <fs_id>    type standard table,
      <fs_ev>    type standard table,
      <fs_egvt>  type standard table,
      <fs_egvl>  type standard table,
      <fs_egvlx> type standard table,
      <fs_xij>   type any,
      <fs_yji>   type any,
      <fs_i>     type any,
      <fs_j>     type any.

    deref a <fs_a>.
    row = a->dimension( )-row.
    col  = a->dimension( )-col.
    preparem p <fs_p>.
    <fs_p>[] = <fs_a>[].
    preparem q <fs_q>.
    preparem r <fs_r>.
    preparem qr <fs_qr>.
    preparem b <fs_b>.
    preparem id <fs_id>.
    preparev egvt <fs_egvt>.
    preparev egvlx <fs_egvlx>.
    preparev egvl <fs_egvl>.
    preparev ev <fs_ev>.

    id->identity( ).
    q->identity( ).
    l = 1.
    while val >= delta.
      clear: <fs_qr>[], <fs_b>[].
      call method zcl_matrix=>qr_decomposition
        exporting
          a  = a
        importing
          q  = q
          r  = r
          qr = qr.
      deref qr <fs_qr>.
      do row times.
        m_i_j sy-index <fs_qr> sy-index <fs_xij>.
        <fs_egvlx>[ sy-index ] = <fs_xij>.
      enddo.
      idx1 = 1.
      loop at <fs_egvlx> assigning <fs_xij>.
        val = val + abs( <fs_xij> - <fs_egvl>[ idx1 ] ).
        <fs_egvl>[ idx1 ] = <fs_egvlx>[ idx1 ].
        add 1 to idx1.
      endloop.
      l = l + 1.
      if l > iter.
        exit.
      endif.
    endwhile.
    preparev eigenvalues <fs_egvl>.
    loop at <fs_egvl> assigning <fs_xij>.
      egvt ?= zcl_matrix=>inverse_iteration( a = qr eigenvalue = <fs_xij> ).
      egvt->normalize( ).
      insert <fs_xij> into table <fs_egvl>.
      insert egvt into table eigenvectors.
    endloop.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Protected Method ZCL_EIGEN_COMPOSITION=>HAS_CONVERGED
* +-------------------------------------------------------------------------------------------------+
* | [--->] A                              TYPE REF TO ZCL_MATRIX
* | [<-()] CVG                            TYPE        BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method has_converged.
    data:
      ref      type ref to data,
      sum_off  type decfloat34,
      sum_diag type decfloat34,
      i        type  i,
      j        type i.
    field-symbols:
      <fs_a>   type standard table,
      <fs_aij> type any,
      <fs_aji> type any.

    deref a <fs_a>.
    i = 1.
    while i <= a->dimension( )-row.
      j = 1.
      while j <= a->dimension( )-col.
        assign component j of structure <fs_a>[ i ] to <fs_aij>.
        if i <> j.
          sum_off = sum_off + abs( <fs_aij> ).
        else.
          sum_diag = sum_diag + abs( <fs_aij> ).
        endif.
        add 1 to j.
      endwhile.
      add 1 to i.
    endwhile.
    if ( sum_off / sum_diag ) < e.
      cvg = abap_true.
    endif.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method ZCL_EIGEN_COMPOSITION=>HYPOTHENUSE
* +-------------------------------------------------------------------------------------------------+
* | [--->] X                              TYPE        ANY
* | [--->] Y                              TYPE        ANY
* | [<-()] Z                              TYPE        DECFLOAT34
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method hypothenuse.
    data:
      xabs type decfloat34,
      yabs type decfloat34,
      min  type decfloat34,
      max  type decfloat34,
      u    type decfloat34.

    xabs = abs( x ).
    yabs = abs( y ).
    if xabs < yabs.
      min = xabs.
      max = yabs.
    else.
      min = yabs.
      max = xabs.
    endif.
    if min = zero.
      z = max.
    else.
      u = min / max.
      z = max * sqrt( 1 + u ** 2 ).
    endif.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EIGEN_COMPOSITION=>INVERT_JACOBI
* +-------------------------------------------------------------------------------------------------+
* | [--->] A                              TYPE REF TO ZCL_MATRIX
* | [<-()] INV                            TYPE REF TO ZCL_MATRIX
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method invert_jacobi.
    data:
      ref          type ref to data,
      x            type decfloat34,
      y            type decfloat34,
      i            type i,
      j            type i,
      k            type i,
      eigenvector  type ref to zcl_vector,
      eigenvalue   type ref to zcl_vector,
      eigenvalues  type zcl_utilities=>vspace,
      eigenvectors type zcl_utilities=>vspace.
    field-symbols:
      <fs_a>   type standard table,
      <fs_inv> type standard table,
      <fs_vt>  type standard table,
      <fs_vl>  type standard table,
      <fs_iij> type any,
      <fs_vik> type any,
      <fs_vjk> type any,
      <fs_aij> type any.

    if a->dimension( )-row = a->dimension( )-col.
      call method zcl_eigen_composition=>jacobi
        exporting
          a            = a
        importing
          eigenvalues  = eigenvalues
          eigenvectors = eigenvectors.
      deref a <fs_a>.
      preparem inv <fs_inv>.
      i = 1.
      while i <= a->dimension( )-row.
        j = 1.
        while j <= a->dimension( )-row.
          assign component j of structure <fs_inv>[ i ] to <fs_aij>.
          <fs_aij> = zero.
          eigenvalue ?= eigenvalues[ j ].
          deref eigenvalue <fs_vl>.
          eigenvector ?= eigenvectors[ j ].
          deref eigenvector <fs_vt>.
          y = zero.
          k = 1.
          while k <= a->dimension( )-row.
            if <fs_vl>[ k ] <> 0.
              x = one / <fs_vl>[ k ].
            else.
              x = zero.
            endif.
            assign component k of structure <fs_vt>[ i ] to <fs_vik>.
            assign component k of structure <fs_vt>[ j ] to <fs_vjk>.
            y = y + ( <fs_vik> * <fs_vjk> * x ).
            k = k + 1.
          endwhile.
          assign component j of structure <fs_inv>[ i ] to <fs_iij>.
          <fs_iij> = y.
          j = j + 1.
        endwhile.
        i = i + 1.
      endwhile.
    endif.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EIGEN_COMPOSITION=>JACOBI
* +-------------------------------------------------------------------------------------------------+
* | [--->] A                              TYPE REF TO ZCL_MATRIX
* | [<---] EIGENVALUES                    TYPE        ZCL_UTILITIES=>VSPACE
* | [<---] EIGENVECTORS                   TYPE        ZCL_UTILITIES=>VSPACE
* | [<---] ROTATIONS                      TYPE        I
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method jacobi.
    data:
      i            type i,
      p            type i,
      q            type i,
      c            type decfloat34,
      s            type decfloat34,
      ep           type decfloat34,
      ev           type decfloat34,
      normal       type decfloat34,
      ax           type ref to zcl_matrix,
      red          type decfloat34,
      max_rotation type i,
      ref          type ref to data,
      egvt         type ref to zcl_vector,
      eigenvalue   type ref to zcl_vector,
      eigenvector  type ref to zcl_matrix.
    field-symbols:
      <fs_a>   type standard table,
      <fs_ax>  type standard table,
      <fs_evt> type standard table,
      <fs_evl> type standard table,
      <fs_app> type any,
      <fs_x>   type any,
      <fs_y>   type any.
* From the definition of the eigenvector v corresponding to the eigenvalue λ we have A*v=λ*v
* Then:A*v-λ*v=(A-λ*I)*v=0
* Equation has a nonzero solution if and only if det(A-λ*I)=0
    preparem eigenvector <fs_evt>.
    preparev eigenvalue <fs_evl>.
    preparem ax <fs_ax>.
    deref a <fs_a>.
    <fs_ax>[] = <fs_a>[].
    max_rotation = ax->dimension( )-row * ax->dimension( )-col * 5.
    eigenvector->identity( ).
    deref eigenvector <fs_evt>.
    i = 1.
    while i <= max_rotation.
      normal = norm( ax ).
      if normal = zero.
        exit.
      endif.
      p = 1.
      while p <= ax->dimension( )-col.
        q = p + 1.
        while q <= ax->dimension( )-col.
          symschur2( importing c = c s = s changing a = ax p = p q = q ).
* Compute A <- J^T A J
          jacobian( exporting left = abap_true c = c s = s  p = p q = q changing a = ax ).
          jacobian( exporting right = abap_true c = c s = s p = p q = q changing a = ax ).
* Compute V <- V J
          jacobian( exporting right = abap_true c = c s = s p = p q = q changing a = eigenvector ).
          q = q + 1.
        endwhile.
        p = p + 1.
      endwhile.
      i = i + 1.
    endwhile.
    p = 1.
    while p <= ax->dimension( )-col.
      assign component p of structure <fs_ax>[ p ] to <fs_app>.
      <fs_evl>[ p ] = <fs_app>.
      p = p + 1.
    endwhile.
    i = 1.
    while i <= ax->dimension( )-row.
      egvt ?= eigenvector->col( i ).
      insert egvt into table eigenvectors.
      i = 1 + 1.
    endwhile.
    rotations = i.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method ZCL_EIGEN_COMPOSITION=>JACOBIAN
* +-------------------------------------------------------------------------------------------------+
* | [--->] RIGHT                          TYPE        BOOLEAN (default =ABAP_FALSE)
* | [--->] LEFT                           TYPE        BOOLEAN (default =ABAP_FALSE)
* | [--->] C                              TYPE        DECFLOAT34
* | [--->] S                              TYPE        DECFLOAT34
* | [--->] P                              TYPE        I
* | [--->] Q                              TYPE        I
* | [<-->] A                              TYPE REF TO ZCL_MATRIX
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method jacobian.
    data:
      i   type decfloat34,
      j   type decfloat34,
      ref type ref to data.
    field-symbols:
      <fs_aip> type any,
      <fs_aiq> type any,
      <fs_apj> type any,
      <fs_aqj> type any,
      <fs_a>   type standard table.

    deref a <fs_a>.
    check p <= a->dimension( )-row and p >= 1.
    check q <= a->dimension( )-row and q >= 1.
* Apply rotation to matrix A,  A' = J^T A
    if left = abap_true.
      j = 1.
      while j <= a->dimension( )-col.
        assign component j of structure <fs_a>[ p ] to <fs_apj>.
        assign component j of structure <fs_a>[ q ] to <fs_aqj>.
        <fs_apj> = <fs_apj> * c - <fs_aqj> * s.
        <fs_aqj> = <fs_apj> * s + <fs_aqj> * c.
        j = j + 1.
      endwhile.
    elseif right = abap_true.
      i = 1.
      while i <= a->dimension( )-row.
        assign component p of structure <fs_a>[ i ] to <fs_aip>.
        assign component q of structure <fs_a>[ i ] to <fs_aiq>.
        <fs_aip> = <fs_aip> * c - <fs_aiq> * s.
        <fs_aiq> = <fs_aip> * s + <fs_aiq> * c.
        i = i + 1.
      endwhile.
    endif.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method ZCL_EIGEN_COMPOSITION=>NORM
* +-------------------------------------------------------------------------------------------------+
* | [--->] A                              TYPE REF TO ZCL_MATRIX
* | [<-()] NORM                           TYPE        DECFLOAT34
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method norm.
    data:
      ref   type ref to data,
      sum   type decfloat34,
      scale type decfloat34,
      ssq   type decfloat34,
      ax    type decfloat34,
      i     type i,
      j     type i,
      k     type i.
    field-symbols:
      <fs_aij> type any,
      <fs_a>   type standard table.

    deref a <fs_a>.
    ssq = one.
    i = 1.
    while i <= a->dimension( )-row.
      j = 1.
      while j <= a->dimension( )-col.
        assign component j of structure <fs_a>[ i ] to <fs_aij>.
* compute norm of off-diagonal elements
        if i <> j and <fs_aij> <> 0.
          ax = abs( <fs_aij> ).
          if scale < ax.
            ssq = one + ssq * ( ( scale / ax ) ** 2 ).
            scale = ax.
          else.
            ssq = ssq + ( ( scale / ax ) ** 2 ).
          endif.
        endif.
        j = j + 1.
      endwhile.
      i = i + 1.
    endwhile.
    norm = scale * sqrt( ssq ).
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EIGEN_COMPOSITION=>QR_ALGORITHM
* +-------------------------------------------------------------------------------------------------+
* | [--->] A                              TYPE REF TO ZCL_MATRIX
* | [<---] EIGENVALUES                    TYPE        ZCL_UTILITIES=>VSPACE
* | [<---] EIGENVECTORS                   TYPE        ZCL_UTILITIES=>VSPACE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method qr_algorithm.
    data:
      converge    type boolean,
      ref         type ref to data,
      b           type ref to zcl_matrix,
      q           type ref to zcl_matrix,
      r           type ref to zcl_matrix,
      eigenvalue  type ref to zcl_vector,
      tmp         type ref to zcl_vector,
      diag        type ref to zcl_vector,
      diag_x      type ref to zcl_vector,
      vector      type ref to zcl_vector,
      eigenvector type ref to zcl_matrix,
      i           type i,
      j           type i,
      k           type i,
      iter        type i.
    field-symbols:
      <fs_a>    type standard table,
      <fs_b>    type standard table,
      <fs_v>    type standard table,
      <fs_q>    type standard table,
      <fs_r>    type standard table,
      <fs_tmp>  type standard table,
      <fs_vt>   type standard table,
      <fs_vl>   type standard table,
      <fs_d>    type standard table,
      <fs_dx>   type standard table,
      <fs_aij>  type any,
      <fs_bii>  type any,
      <fs_vlij> type any,
      <fs_vtij> type any,
      <fs_vij>  type any,
      <fs_y>    type any,
      <fs_x>    type any.


    preparem eigenvector <fs_vt>.
    preparem b <fs_b>.
    deref a <fs_a>.
    <fs_b>[] = <fs_a>[].
    preparev vector <fs_v>.
    preparev tmp <fs_tmp>.
    preparev eigenvalue <fs_vl>.
    preparev diag <fs_d>.
    preparev diag_x <fs_dx>.
    loop at <fs_vt> assigning <fs_x>.
      do a->dimension( )-col times.
        assign component sy-index of structure <fs_x> to <fs_y>.
        <fs_y> = one.
      enddo.
    endloop.
* The qr decomposition uses Gram-Schmidt
    iter = 1.
    while iter <= max_iteration and converge = abap_false.
      decompose_qr( exporting a = b importing q = q r = r ).
      deref q <fs_q>.
      deref r <fs_r>.
      b ?= zcl_matrix=>multiplications( a = r b = q ).
      deref b <fs_b>.
      eigenvector ?= zcl_matrix=>multiplications( a = eigenvector b = q ).
      deref eigenvector <fs_vt>.
      converge = has_converged( b ).
      add 1 to iter.
    endwhile.
    insert diag_x into table eigenvalues.
    i = 1.
    while i <= a->dimension( )-col.
      vector ?= eigenvector->col( i ).
      insert vector into table eigenvectors.
      add 1 to i.
    endwhile.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method ZCL_EIGEN_COMPOSITION=>QR_DECOMPOSITION
* +-------------------------------------------------------------------------------------------------+
* | [--->] A                              TYPE REF TO ZCL_MATRIX
* | [<---] Q                              TYPE REF TO ZCL_MATRIX
* | [<---] R                              TYPE REF TO ZCL_MATRIX
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method qr_decomposition.
    data:
      ref type ref to data,
      b   type ref to zcl_matrix,
      u   type ref to zcl_matrix,
      v   type ref to zcl_vector,
      w   type ref to zcl_vector,
      wk  type ref to zcl_vector,
      i   type i,
      j   type i,
      k   type i.
    field-symbols:
      <fs_a> type standard table,
      <fs_b> type standard table,
      <fs_u> type standard table,
      <fs_r> type standard table,
      <fs_q> type standard table,
      <fs_v> type standard table,
      <fs_w> type standard table,
      <fs_x> type any.

    preparem u <fs_u>.
    deref a <fs_a>.
    <fs_u>[] = <fs_a>[].
    preparem q <fs_q>.
    preparem r <fs_r>.
    preparev v <fs_v>.
    preparev w <fs_w>.
* The qr decomposition uses Gram-Schmidt
    j = 1.
    while j <= a->dimension( )-row.
      w ?= zcl_matrix=>cols( a = u index = j ).
      v ?= zcl_matrix=>cols( a = u index = j ).
      k  = j - 1.
      while k >= 1.
        wk ?= zcl_matrix=>cols( a = u index = k ).
        v ?= zcl_vector=>subtractions( v1 = w v2 = zcl_vector=>projections( v1 = wk v2 = w ) ).
        k = k - 1.
      endwhile.
      i = 1.
      while i <= a->dimension( )-row.
        assign component j of structure <fs_u>[ i ] to <fs_x>.
        <fs_w>[ i ] = <fs_x>.
        i = i + 1.
      endwhile.
      j = j + 1.
    endwhile.
    w->normalize( ).
    q ?= u.
    r ?= zcl_matrix=>multiplications( a = zcl_matrix=>transposes( q ) b = a ).
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EIGEN_COMPOSITION=>QR_PROCESS
* +-------------------------------------------------------------------------------------------------+
* | [--->] A                              TYPE REF TO ZCL_MATRIX
* | [<---] EIGENVECTORS                   TYPE        ZCL_UTILITIES=>VSPACE
* | [<---] EIGENVALUES                    TYPE REF TO ZCL_VECTOR
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method qr_process.
    data:
      ref type ref to data,
      b   type ref to zcl_matrix,
      u   type ref to zcl_matrix,
      q   type ref to zcl_matrix,
      r   type ref to zcl_matrix,
      v   type ref to zcl_vector,
      i   type i.
    field-symbols:
      <fs_a> type standard table,
      <fs_b> type standard table,
      <fs_u> type standard table,
      <fs_r> type standard table,
      <fs_q> type standard table,
      <fs_v> type standard table,
      <fs_x> type any.

    preparem b <fs_b>.
    deref a <fs_a>.
    <fs_b>[] = <fs_a>[].
    preparem u <fs_u>.
    preparem q <fs_q>.
    preparem r <fs_r>.
    preparev eigenvalues <fs_v>.
    u->identity( ).
    i = 1.
    while i <= max_iteration.
      qr_decomposition( exporting a = b importing q = q r = r ).
      b ?= zcl_matrix=>multiplications( a = r b = q ).
      u ?= zcl_matrix=>multiplications( a = u b = q ).
      i = i + 1.
    endwhile.
* the eigenvalues are the diagonal of matrix U now
    i = 1.
    deref u <fs_u>.
    while i <= a->dimension( )-row.
      assign component i of structure <fs_u>[ i ] to <fs_x>.
      <fs_v>[ i ] = <fs_x>.
      i = i + 1.
    endwhile.
    deref b <fs_b>.
* The eigenvectors are the columns of matrix B now
    i = 1.
    while i <= a->dimension( )-col.
      preparev v <fs_v>.
      v ?= b->col( i ).
      insert v into table eigenvectors.
      i = i + 1.
    endwhile.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Private Method ZCL_EIGEN_COMPOSITION=>SYMSCHUR2
* +-------------------------------------------------------------------------------------------------+
* | [<---] C                              TYPE        DECFLOAT34
* | [<---] S                              TYPE        DECFLOAT34
* | [<-->] A                              TYPE REF TO ZCL_MATRIX
* | [<-->] P                              TYPE        I
* | [<-->] Q                              TYPE        I
* | [<-()] RED                            TYPE        I
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method symschur2.
    data:
      i           type i,
      tan         type decfloat34,
      ref         type ref to data,
      eigenvector type ref to zcl_matrix.
    field-symbols:
      <fs_aqq> type any,
      <fs_apq> type any,
      <fs_app> type any,
      <fs_a>   type standard table.

    deref a <fs_a>.
    check p <= a->dimension( )-row and p >= 1.
    check q <= a->dimension( )-row and q >= 1.
    assign component q of structure <fs_a>[ p ] to <fs_apq>.
    if <fs_apq> <> zero.
      assign component p of structure <fs_a>[ p ] to <fs_app>.
      assign component q of structure <fs_a>[ q ] to <fs_aqq>.
      tan =   ( <fs_aqq> - <fs_app> ) / ( <fs_apq> * 2  ).
      if tan >= 0.
        tan = one / ( tan + hypothenuse( x = one y = tan ) ).
      else.
        tan = neg1 / ( ( hypothenuse( x = one y = tan ) - tan ) ).
      endif.
      c = one / hypothenuse( x = one y = tan ).
      s = tan * c.
    else.
      c = one.
      s = zero.
    endif.
  endmethod.
ENDCLASS.