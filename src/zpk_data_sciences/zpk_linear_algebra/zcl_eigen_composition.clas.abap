class ZCL_EIGEN_COMPOSITION definition
  public
  inheriting from ZCL_PYSAP
  final
  create public .

public section.

  class-methods CLASS_CONSTRUCTOR .
  class-methods GRAM_SCHMIDT_REDUCED
    importing
      !A type ref to ZCL_MATRIX
      !ITERATIONS type I
    exporting
      !EIGENVALUES type ref to ZCL_VECTOR
      !EIGENVECTORS type ref to ZCL_MATRIX .
  class-methods QR_DECOMPOSITION
    importing
      !A type ref to ZCL_MATRIX
    exporting
      !Q type ref to ZCL_MATRIX
      !R type ref to ZCL_MATRIX .
  class-methods CREATE .
  class-methods CREATEBUF .
  class-methods CONTINUE .
  class-methods GETREQUEST_DATA .
  class-methods GETREQUEST_INFO .
  class-methods SENDRESULT .
  class-methods START .
  class-methods STOP .
  class-methods SET_COND .
  class-methods SET_WARM_START .
  class-methods SOLVE_DENSES
    importing
      !EIGSPACE type ref to ZCL_EIGENSPACE
      !A type ref to ZCL_MATRIX
      !IS_UPPER type BOOLEAN default ABAP_TRUE
    exporting
      !W type ref to ZCL_VECTOR
      !Z type ref to ZCL_MATRIX .
  class-methods SOLVE_SPARSES .
  class-methods CALCULATE_REAL_EIGENVALUES
    importing
      !A type ref to ZCL_MATRIX
    changing
      !U type ref to ZCL_MATRIX optional
    returning
      value(EIGENVALUES) type ref to ZCL_VECTOR .
  class-methods CALCULATE_EIGENVECTORS
    importing
      !A type ref to ZCL_MATRIX
      !BOTH type BOOLEAN default ABAP_FALSE
    exporting
      !EIGENVALUES type ref to ZCL_VECTOR
      !EIGENVECTORS type ZCL_EIGENSPACE=>VSPACE
      !SINGULAR type BOOLEAN
    changing
      !U type ref to ZCL_MATRIX optional
      !L type ref to ZCL_MATRIX optional .
  class-methods POWER_METHOD
    importing
      !A type ref to ZCL_MATRIX
      !COLUMN_VIEW type BOOLEAN default ABAP_TRUE
      !MAX_ITERATIONS type I default 100
      !FREQUENCY type I default 10
      !EPSILON type DECFLOAT34 default '1.0E-7'
    exporting
      !EIGENVALUES type ref to ZCL_VECTOR
      !EIGENVECTORS type ref to ZCL_MATRIX .
  class-methods POWER_METHOD_MACRO
    importing
      !A type ref to ZCL_MATRIX
      !COLUMN_VIEW type BOOLEAN default ABAP_TRUE
      !MAX_ITERATIONS type I default 100
      !FREQUENCY type I default 10
      !EPSILON type DECFLOAT34 default '1.0E-7'
    exporting
      !EIGENVALUES type ref to ZCL_VECTOR
      !EIGENVECTORS type ref to ZCL_MATRIX .
  class-methods RUTISHAUSER_LR_TRANSFORMATION
    importing
      !A type ref to ZCL_MATRIX
      !EPSILON_1 type DECFLOAT34 default '1.0E-10'
      !EPSILON_2 type DECFLOAT34 default '1.0E-6'
      !EPSILON_3 type DECFLOAT34 default '1.0E-8'
      !EPSILON_4 type DECFLOAT34 default '1.0E-1'
      !FREQUENCY type I default 5
      !SWEEP type BOOLEAN default ABAP_TRUE
      !COLUMN_VIEW type BOOLEAN default ABAP_TRUE
      !MAX_ITERATIONS type I default 500
    exporting
      !EIGENVALUES type ref to ZCL_VECTOR
      !EIGENVECTORS type ref to ZCL_MATRIX .
  class-methods RUTISHAUSER_LR_TRANSFORMATION1
    importing
      !A type ref to ZCL_MATRIX
      !EPSILON_1 type DECFLOAT34 default '1.0E-10'
      !EPSILON_2 type DECFLOAT34 default '1.0E-6'
      !EPSILON_3 type DECFLOAT34 default '1.0E-8'
      !EPSILON_4 type DECFLOAT34 default '1.0E-1'
      !FREQUENCY type I default 5
      !SWEEP type BOOLEAN default ABAP_TRUE
      !COLUMN_VIEW type BOOLEAN default ABAP_TRUE
      !MAX_ITERATIONS type I default 500
    exporting
      !EIGENVALUES type ref to ZCL_VECTOR
      !EIGENVECTORS type ref to ZCL_MATRIX .
  protected section.
private section.

  class-methods VECLEN
    importing
      !X type ref to ZCL_VECTOR
    returning
      value(S) type DECFLOAT34 .
  class-methods SCAVEC
    importing
      !S type DECFLOAT34
      !X type ref to ZCL_VECTOR
    returning
      value(Y) type ref to ZCL_VECTOR .
  class-methods SCAMAT
    importing
      !A type ref to ZCL_MATRIX
      !S type ANY
    returning
      value(B) type ref to ZCL_MATRIX .
  class-methods MATVEC
    importing
      !A type ref to ZCL_MATRIX
      !X type ref to ZCL_VECTOR
    returning
      value(Z) type ref to ZCL_VECTOR .
  class-methods MATSUB
    importing
      !A type ref to ZCL_MATRIX
      !B type ref to ZCL_MATRIX
    returning
      value(C) type ref to ZCL_MATRIX .
  class-methods MATMUL
    importing
      !A type ref to ZCL_MATRIX
      !U type ref to ZCL_MATRIX
    returning
      value(T) type ref to ZCL_MATRIX .
  class-methods MATEQ
    importing
      !A type ref to ZCL_MATRIX
    returning
      value(B) type ref to ZCL_MATRIX .
  class-methods SOLVE_HOMOGENEOUS_SYSTEM
    importing
      !A type ref to ZCL_MATRIX
    changing
      !EIGENVECTORS type ZCL_EIGENSPACE=>VSPACE .
ENDCLASS.



CLASS ZCL_EIGEN_COMPOSITION IMPLEMENTATION.


  method calculate_eigenvectors.
    data:
      m           type ref to zcl_matrix,
      egvectors   type ref to zcl_vector,
      temp_matrix type ref to data,
      lambda      type decfloat34,
      i           type i,
      j           type i.

    field-symbols:
      <fs_a>   type standard table,
      <fs_u>   type standard table,
      <fs_l>   type standard table,
      <fs_v>   type standard table,
      <fs_m>   type standard table,
      <fs_tmp> type standard table,
      <fs_mii> type any.

    if both = abap_true or u is not supplied.
      call method calculate_real_eigenvalues
        exporting
          a           = a                 " π SAP : Matrices
        changing
          u           = u                 " π SAP : Matrices
        receiving
          eigenvalues = eigenvalues.      " π SAP : Vector and Tensor
    endif.
    deref eigenvalues <fs_v>.
    deref u <fs_u>.
    preparem m <fs_m> a.
    loop at <fs_v> assigning <fs_l>.
      lambda = <fs_l>[ 1 ].
      " Copy U matrix from LU decomposition
      <fs_m>[] = <fs_u>[].
      j = u->dimension( )-row.
      " Modify U matrix to (U - lambda*I)
      for i j.
        m_i_j i <fs_m> i <fs_mii>.
        <fs_mii> = <fs_mii> - lambda.
      endfor i.
      call method solve_homogeneous_system
        exporting
          a            = m                 " π SAP : Matrices
        changing
          eigenvectors = eigenvectors.
    endloop.
  endmethod.


  method calculate_real_eigenvalues.
    data:
      i        type i,
      j        type i,
      k        type i,
      delta    type decfloat34,
      max      type decfloat34,
      l        type ref to zcl_matrix,
      singular type boolean,
      a_old    type ref to zcl_matrix,
      a_new    type ref to zcl_matrix.
    field-symbols:
      <fs_a>    type standard table,
      <fs_ao>   type standard table,
      <fs_aoij> type any,
      <fs_anij> type any,
      <fs_u>    type standard table,
      <fs_uij>  type any,
      <fs_l>    type standard table,
      <fs_an>   type standard table,
      <fs_evl>  type standard table.

    preparev eigenvalues <fs_evl> a.
    deref a <fs_a>.
    preparem a_new <fs_an> a.
    preparem a_old <fs_ao> a.
    <fs_an>[] = <fs_a>[].
    do 100 times.
      call method zcl_matrix=>lu_decomposition
        exporting
          a        = a_new             " π SAP : Matrices
        importing
          l        = l                 " π SAP : Matrices
          u        = u                 " π SAP : Matrices
          singular = singular.
      a_old = zcl_matrix=>multiplications( a = u b = l ).
      deref a_old <fs_ao>.
      for i dim-row.
        for j dim-col.
          m_i_j j <fs_an> i <fs_anij>.
          m_i_j j <fs_ao> i <fs_aoij>.
          delta = abs( <fs_aoij> - <fs_anij> ).
          if delta > max.
            max = delta.
          endif.
        endfor j.
      endfor i.
      check delta >= e.
      a_new = a_old.
      deref a_new <fs_an>.
    enddo.
    deref u <fs_u>.
    loop at <fs_u> assigning <fs_uij>.
      assign component sy-tabix of structure <fs_uij> to <fs_uij>.
      <fs_evl>[ sy-tabix ] = <fs_uij>.
    endloop.
    free: l, a_new, a_old.
  endmethod.


  method class_constructor.
  endmethod.


  method continue.
* This function performs subspace iteration  in  the  iterative  mode.  It
* should be used in conjunction with other iterative-related functions  of
* this subspackage in a loop like below:
*
*  eigcompstart( exp state)
*  while eigcompcontinue( exp state) do
*      eigcompgetrequestinfo( exp state, imp RequestType, imp M)
*      eigcompgetrequestdata( exp state, imp X)
*      [calculate  Y=A* X, with X=R^NxM]
*      eigcompsendresult( exp state, in Y)
*  eigcompstop( exp state, imp W, imp Z, imp Report)

  endmethod.


  method create.
* This function initializes subspace iteration solver. This solver  is  used
* to solve symmetric real eigenproblems where just a few (top K) eigenvalues
* and corresponding eigenvectors is required.
*
* This solver can be significantly faster than  complete  EVD  decomposition
* in the following case:
*   when only just a small fraction  of  top  eigenpairs  of dense matrix is
*   required. When K approaches N, this solver is slower than complete dense
*   EVD
*   when problem matrix is sparse (and/or is not known explicitly, i.e. only
*   matrix-matrix product can be performed)
*
* USAGE (explicit dense/sparse matrix):
* 1. User initializes algorithm state with eigcompspacecreate() call
* 2. [optional] User tunes solver parameters by calling eigcompspacesetcond()
*    or other functions
* 3. User  calls  eigcompspacesolvedense() or eigcompspacesolvesparse() methods,
*    which take algorithm state and 2D array or sparsematrix object.
*
* USAGE (iterative mode):
* 1. User initializes algorithm state with eigcompspacecreate() call
* 2. [optional] User tunes solver parameters by calling eigcompspacesetcond()
*    or other functions
* 3. User activates iterative mode of  the  solver  and  repeatedly  calls
*    communication functions in a loop like below:
*     eigcompspacestart( exp state)
*     while eigcompspacecontinue( exp state) do
*         eigcompspacegetrequestinfo( exp state, imp RequestType, imp M)
*         eigcompspacegetrequestdata( exp state, imp X)
*         [calculate  Y=A* X, with X=R^NxM]
*         eigcompspacesendresult( exp state, in Y)
*     eigcompspacestop( exp state, imp W, imp Z, imp Report)
*
* INPUT PARAMETERS:
*     N       -   problem dimensionality, N0
*     K       -   number of top eigenvector to calculate, 0<K<=N.
*
* OUTPUT PARAMETERS:
*     State   -   structure which stores algorithm state
*
* NOTE: if you solve many similar EVD problems you may  find  it  useful  to
*       reuse previous subspace as warm-start point for new EVD problem.  It
*       can be done with eigcompspacesetwarmstart() function.

  endmethod.


  method createbuf.
* Buffered version of constructor which aims to reuse  previously  allocated
* memory as much as possible.
  endmethod.


  method getrequest_data.
* This function is used to retrieve information  about iterative  request
* sent by solver to user code: matrix X (array[N,RequestSize) which have  to
* be multiplied by the iterative matrix A in a product A* X.
*
* This function returns just the request data; in order to get the size of the data
* prior to processing request, use eigcompgetrequestinfo().
*
* It should be used in conjunction with other iterative-related  functions
* of this subspackage in a loop like below:
*
*  eigcompstart( exp s)
*  while eigcompcontinue( exp s) do
*      eigcompgetrequestinfo( exp s,  imp  RequestType  M)
*      eigcompgetrequestdata( exp s,  imp  X)
*      [calculate  Y=A* X, with X=R^NxM]
*      eigcompsendresult( exp s Y)
*  eigcompstop( exp s W Z Report)
*
* INPUT PARAMETERS:
*     State           -   solver running in  iterative mode
*     X               -   possibly  preallocated   storage;  reallocated  if
*                         needed, left unchanged, if large enough  to  store
*                         request data.
*
*  OUTPUT PARAMETERS:
*     X               -   array[N,RequestSize] or larger, leading  rectangle
*                        is filled with dense matrix X.

  endmethod.


  method getrequest_info.
* This function is used to retrieve information  about  iterative  request
* sent by solver to user code: request type (current version  of  the solver
* sends only requests for matrix-matrix products) and request size (size  of
* the matrices being multiplied).
*
* This function returns just request metrics; in order  to  get contents  of
* the matrices being multiplied, use eigcompoocgetrequestdata().
*
* It should be used in conjunction with other iterative-related  functions
* of this subspackage in a loop like below:
*
*   eigcompoocstart( exp state)
*   while eigcompoontinue( exp state) do
*       eigcompoocgetrequestinfo( exp state, imp RequestType M)
*       eigcompoocgetrequestdata( exp state, imp X)
*       [calculate  Y=A* X, with X=R^NxM]
*       eigcompoocsendresult( exp state, inp Y)
*   eigcompoocstop( exp state, imp W Z Report)
*
* INPUT PARAMETERS:
*     State           -   solver running in iterative mode
*
* OUTPUT PARAMETERS:
*     RequestType     -   type of the request to process:
*                         *  0 - for matrix-matrix product A* X, with A  being
*                           NxN matrix whose eigenvalues/vectors are needed,
*                           and X being NxREQUESTSIZE one which is  returned
*                           by the eigcompoocgetrequestdata().
*     RequestSize     -   size of the X matrix (number of columns),  usually
*                         it is several times larger than number of  vectors
*                         K requested by user.

  endmethod.


  method gram_schmidt_reduced.
    data:
      i type i,
      j type i,
      k type i,
      b type ref to zcl_matrix,
      u type ref to zcl_matrix,
      q type ref to zcl_matrix,
      r type ref to zcl_matrix,
      x type ref to zcl_vector.
    field-symbols:
      <fs_a>   type standard table,
      <fs_b>   type standard table,
      <fs_u>   type standard table,
      <fs_q>   type standard table,
      <fs_r>   type standard table,
      <fs_v>   type standard table,
      <fs_x>   type standard table,
      <fs_bii> type any.

    dim = a->dimension( ).
    deref a <fs_a>.
    preparem b <fs_b> a.
    <fs_b>[] = <fs_a>[].
    preparem u <fs_u> a.
    u->identity( ).
    for i iterations.
      qr_decomposition( exporting a = b importing q = q r = r ).
      b ?= zcl_matrix=>products( a = r b = q ).
      u ?= zcl_matrix=>products( a = u b = q ).
    endfor i.
    preparev eigenvalues <fs_x> b.
    deref b <fs_b>.
    for i dim-row.
      m_i_j i <fs_b> i <fs_bii>.
      <fs_x>[ i ] = <fs_bii>.
    endfor i.
    preparem eigenvectors <fs_v> b.
    deref u <fs_u>.
    <fs_v>[] = <fs_u>[].
  endmethod.


  method MATEQ.
    data:
      i__   type i,
      j__   type i,
      k__   type i,
      n__   type i,
      lhs__ type decfloat34,
      rhs__ type decfloat34.
    field-symbols:
     <fs_x__> type standard table.

    n__ = a->dimension( )-row.
    preparem b <fs_x__> a.
    forx i__ 1 n__.
      forx j__ 1 n__.
        b->set_element( row = i__ col = j__ value = a->get_element( row = i__ col = j__ ) ).
      endfor j__.
    endfor i__.
  endmethod.


  method matmul.
    data:
      i__   type i,
      j__   type i,
      k__   type i,
      n__   type i,
      lhs__ type decfloat34,
      rhs__ type decfloat34.
    field-symbols:
     <fs_x__> type standard table.

    n__ = a->dimension( )-row.
    preparem t <fs_x__> a.
    forx i__ 1 n__.
      forx j__ 1 n__.
        forx k__ 1 n__.
          lhs__ = a->get_element( row = i__ col = k__ ).
          rhs__ = u->get_element( row = k__ col = j__ ).
          t->add_to_element( row = i__ col = j__ value = lhs__ * rhs__ ).
        endfor k__.
      endfor j__.
    endfor i__.
endmethod.


  method MATSUB.
    data:
      i__   type i,
      j__   type i,
      k__   type i,
      n__   type i,
      lhs__ type decfloat34,
      rhs__ type decfloat34.
    field-symbols:
     <fs_x__> type standard table.

    preparem c <fs_x__> a.
    n__ = a->dimension( )-row.
    forx i__ 1 n__.
      forx j__ 1 n__.
        lhs__ = a->get_element( row = i__ col = j__ ).
        rhs__ = b->get_element( row = i__ col = j__ ).
        c->set_element( row = i__ col = j__ value = lhs__ - rhs__  ).
      endfor j__.
    endfor i__.
  endmethod.


  method matvec.
    data:
      i__   type i,
      j__   type i,
      n__   type i,
      lhs__ type decfloat34,
      rhs__ type decfloat34.
    field-symbols:
     <fs_x__> type standard table.

    n__ = a->dimension( )-row.
    preparev z <fs_x__> a.
    forx i__ 1 n__.
      forx j__ 1 n__.
        lhs__ = a->get_element( row = i__ col = j__ ).
        rhs__ = x->get_element( i = j__ ).
        z->add_to_element( i = i__ value = lhs__ * rhs__ ).
      endfor j__.
    endfor i__.
endmethod.


  method POWER_METHOD.
* Code ported from IBM 370 Assembler original date 1978
    data:
      b      type ref to zcl_matrix,
      c      type ref to zcl_matrix,
      d      type ref to zcl_matrix,
      id     type ref to zcl_matrix,
      u      type ref to zcl_matrix,
      v      type ref to zcl_vector,
      v0     type ref to zcl_vector,
      y      type ref to zcl_vector,
      lambda type ref to zcl_vector,
      lhs    type decfloat34,
      rhs    type decfloat34,
      i      type i,
      j      type i,
      l      type decfloat34,
      l0     type decfloat34,
      k      type i,
      n      type i,
      m      type i,
      converged   type boolean,
      dim    type zcl_utilities=>dimension.
    field-symbols:
      <fs_a>   type standard table,
      <fs_b>   type standard table,
      <fs_c>   type standard table,
      <fs_d>   type standard table,
      <fs_id>  type standard table,
      <fs_y>   type standard table,
      <fs_u>   type standard table,
      <fs_v>   type standard table,
      <fs_v0>  type standard table,
      <fs_lb>  type standard table,
      <fs_egl> type standard table,
      <fs_egv> type standard table.

    deref a <fs_a>.
    preparem b <fs_b> a.
    preparem c <fs_c> a.
    preparem d <fs_d> a.
    preparem id <fs_id> a.
    preparem u <fs_u> a.
    preparev v <fs_v> a.
    preparerv v0 <fs_v0> a.
    preparev lambda <fs_lb> a.
    preparem eigenvectors <fs_egv> a.
    preparev eigenvalues <fs_egl> a.
* Make B and ID as identity
    dim = a->dimension( ).
    n = dim-row.
    b->identity( ).
    id->identity( ).

* B hosts the repeated product matrix B = (A-lambdaID)
    forx i 1 n.
      v0->all_one( ).
* Modify starting vector v0 so that it is orthogonal to all previously computed eigenvectors
      v ?= matvec( a  = b x = v0 ).
      l0 = veclen( v ).
* perform successive power method iterations ...
      forx m 1 max_iteration.
* periodically re-orthogonize v
        lhs = ( m / frequency ).
        if ( lhs * frequency eq m ).
          y ?= matvec( a  = b x = v ).
          l = veclen( y ).
          if l > 0.
            v = scavec( s = one / l x = y ).
          endif.
        endif.
* compute new vector v
        y ?= matvec( a  = a x = v ).
        l = veclen( y ).
        if l <> 0.
           v ?= scavec( s = one / l x = y ).
        else.
          sy-subrc = 24.
          return.
        endif.
* check for convergency - if no convergency do not attempt to calculate
        if l0 <> 0 and l0 <> l and abs( ( l - l0 ) / l0 ) lt epsilon.
          converged = abap_true.
          exit.
        endif.
        l0 = l.
      endfor m.
      sy-subrc = 8.
      if converged = abap_true.
          sy-subrc = 0.
* calculate the sign of the eigenvalue
          y ?= matvec( a = a x = v ).
          forx k 1 n.
            if abs( v->get_element( k ) ) >= + '1.0E-3'.
              lhs = v->get_element( k ).
              rhs = y->get_element( k ).
              if lhs * rhs < zero.
                l = - l.
              endif.
              exit.
            endif.
          endfor k.
          lambda->set_element( i = i value = l ).
          forx k 1 n.
            u->set_element( row = k col = i value = v->get_element( k ) ).
          endfor k.
          if i lt n.
            c ?= scamat( a = id s = l ).
            d ?= matsub( a = a b = c ).
            c ?= matmul( a = d u = b ).
            b ?= mateq( a = c ).
          endif.
      else.
        return.
      endif.
    endfor i.
* Move the calculated values to the exporting parameters
* Eigenvalues -> diagonal of transformed matrix B.
    forx i 1 n.
      lhs = lambda->get_element( i ).
      eigenvalues->set_element( i = i value = lhs ).
    endfor i.
* Eigenvectors are columns of U
    <fs_egv>[] = <fs_u>[].
    if column_view = abap_false.
      eigenvectors->transpose( ).
    endif.
endmethod.


  method POWER_METHOD_MACRO.
    include zic_matrix_macros.
* Code ported from IBM 370 Assembler original date 1978
    data:
      b         type ref to zcl_matrix,
      c         type ref to zcl_matrix,
      d         type ref to zcl_matrix,
      id        type ref to zcl_matrix,
      u         type ref to zcl_matrix,
      v         type ref to zcl_vector,
      v0        type ref to zcl_vector,
      y         type ref to zcl_vector,
      lambda    type ref to zcl_vector,
      lhs       type decfloat34,
      rhs       type decfloat34,
      i         type i,
      j         type i,
      l         type decfloat34,
      l0        type decfloat34,
      k         type i,
      n         type i,
      m         type i,
      converged type boolean,
      dim       type zcl_utilities=>dimension.
    field-symbols:
      <fs_a>   type standard table,
      <fs_b>   type standard table,
      <fs_c>   type standard table,
      <fs_d>   type standard table,
      <fs_id>  type standard table,
      <fs_y>   type standard table,
      <fs_u>   type standard table,
      <fs_v>   type standard table,
      <fs_v0>  type standard table,
      <fs_lb>  type standard table,
      <fs_egl> type standard table,
      <fs_egv> type standard table.

    deref a <fs_a>.
    preparem b <fs_b> a.
    preparem c <fs_c> a.
    preparem d <fs_d> a.
    preparem id <fs_id> a.
    preparem u <fs_u> a.
    preparev v <fs_v> a.
    preparerv v0 <fs_v0> a.
    preparev lambda <fs_lb> a.
    preparem eigenvectors <fs_egv> a.
    preparev eigenvalues <fs_egl> a.
* Make B and ID as identity
    dim = a->dimension( ).
    n = dim-row.
    b->identity( ).
    id->identity( ).

* B hosts the repeated product matrix B = (A-lambdaID)
    forx i 1 n.
      v0->all_one( ).
* Modify starting vector v0 so that it is orthogonal to all previously computed eigenvectors
      matvec v b v0.
      veclen l0 v.
* perform successive power method iterations ...
      forx m 1 max_iteration.
* periodically re-orthogonize v
          lhs = ( m / frequency ).
          if ( lhs * frequency eq m ).
            matvec y b v.
            veclen l y.
            if l > 0.
              v = scavec( s = one / l x = y ).
            endif.
          endif.
* compute new vector v
          matvec y a v.
          veclen l y.
          if l <> 0.
            v ?= scavec( s = one / l x = y ).
          else.
            sy-subrc = 24.
            return.
          endif.
* check for convergency - if no convergency do not attempt to calculate
          if l0 <> 0 and l0 <> l and abs( ( l - l0 ) / l0 ) lt epsilon.
            converged = abap_true.
            exit.
          endif.
          l0 = l.
      endfor m.
      sy-subrc = 8.
      if converged = abap_true.
        sy-subrc = 0.
* calculate the sign of the eigenvalue
        matvec y a v.
        forx k 1 n.
          if abs( v->get_element( k ) ) >= + '1.0E-3'.
            lhs = v->get_element( k ).
            rhs = y->get_element( k ).
            if lhs * rhs < zero.
              l = - l.
            endif.
            exit.
          endif.
        endfor k.
        lambda->set_element( i = i value = l ).
        forx k 1 n.
          u->set_element( row = k col = i value = v->get_element( k ) ).
        endfor k.
        if i lt n.
          scamat c id l.
          matsub d a c.
          matmul c d b.
          mateq b c.
        endif.
      else.
        return.
      endif.
    endfor i.
* Move the calculated values to the exporting parameters
* Eigenvalues -> diagonal of transformed matrix B.
    forx i 1 n.
      lhs = lambda->get_element( i ).
      eigenvalues->set_element( i = i value = lhs ).
    endfor i.
* Eigenvectors are columns of U
    <fs_egv>[] = <fs_u>[].
    if column_view = abap_false.
      eigenvectors->transpose( ).
    endif.
endmethod.


  method qr_decomposition.
    data:
      i   type i,
      j   type i,
      k   type i,
      l   type i,
      mag type decfloat34,
      b   type ref to zcl_matrix,
      u   type ref to zcl_vector,
      v   type ref to zcl_vector,
      uk  type ref to zcl_vector.
    field-symbols:
      <fs_a>   type standard table,
      <fs_b>   type standard table,
      <fs_u>   type standard table,
      <fs_q>   type standard table,
      <fs_r>   type standard table,
      <fs_v>   type standard table,
      <fs_w>   type standard table,
      <fs_x>   type standard table,
      <fs_bij> type any,
      <fs_bii> type any.

    fsymbols.
    dim = a->dimension( ).
    deref a <fs_a>.
    preparem b <fs_b> a.
    <fs_b>[] = <fs_a>[].
    preparev u <fs_u> a.
    preparev v <fs_v> a.
    for_n j 2 dim-row.
    u ?= b->col( j ).
    v ?= b->col( j ).
    l = j - 1.
    for_l k l 1.
    uk ?= b->col( k ).
    u ?= zcl_vector=>subtractions( v1 = u v2 = zcl_vector=>projects( v1 = uk v2 = v ) ).
    endfor_l k.
    deref u <fs_u>.
    deref v <fs_v>.
    for i dim-col.
      m_i_j j <fs_b> i <fs_bij>.
      <fs_bij> = <fs_v>[ i ].
    endfor i.
  endfor j.
  for j dim-col.
    u ?= b->col( j ).
    deref u <fs_u>.
    mag = u->magnitude( ).
    if mag <> 0.
      for i dim-row.
        m_i_j j <fs_b> i <fs_bij>.
        <fs_bij> = <fs_u>[ i ] / mag.
      endfor i.
    endif.
  endfor j.
  q ?= b.
  b->transpose( ).
  r ?= zcl_matrix=>products( a = b b = a ).
endmethod.


method rutishauser_lr_transformation.
* Converted from IBM Assembler 370 code written in 1978
  data:
    b         type ref to zcl_matrix,
    u         type ref to zcl_matrix,
    x         type ref to zcl_matrix,
    v         type ref to zcl_vector,
    i         type i,
    it        type i,
    j         type i,
    n         type i,
    o         type i,
    p         type i,
    sum       type decfloat34,
    sbsum     type decfloat34,
    norm      type decfloat34,
    val1      type decfloat34,
    val2      type decfloat34,
    lhs       type decfloat34,
    rhs       type decfloat34,
    iter      type i,
    l         type i,
    k         type i,
    leave     type boolean,
    skip      type boolean,
    too_close type boolean,
    dim       type zcl_utilities=>dimension.
  field-symbols:
    <fs_b>        type standard table,
    <fs_x>        type standard table,
    <fs_a>        type standard table,
    <fs_u>        type standard table,
    <fs_a1>       type standard table,
    <fs_egl>      type standard table,
    <fs_egv>      type standard table,
    <fs_v>        type standard table,
    <fs_k>        type any,
    <fs_i>        type any,
    <fs_j>        type any,
    <fs_x_i>      type any,
    <fs_x_k>      type any,
    <fs_b_k>      type any,
    <fs_b_i>      type any,
    <fs_bi>       type any,
    <fs_bj>       type any,
    <fs_bik>      type any,
    <fs_bjk>      type any,
    <fs_bii>      type any,
    <fs_ii_less1> type any,
    <fs_bij>      type any,
    <fs_bkj>      type any,
    <fs_bjj>      type any,
    <fs_ii>       type any,
    <fs_ij>       type any,
    <fs_vk>       type any,
    <fs_vi>       type any,
    <fs_jj>       type any,
    <fs_xij>      type any,
    <fs_xii>      type any,
    <fs_xkj>      type any,
    <fs_xik>      type any.




* Initialize with zeros is the defaut
  preparem b <fs_b> a.
  preparem x <fs_x> a.
  preparem u <fs_u> a.
  deref a <fs_a>.
  preparem eigenvectors <fs_egv> a.
  n = a->dimension( )-row.
  dim = a->dimension( ).
  preparev eigenvalues <fs_egl> a.
  preparev v <fs_v> a.
  <fs_b>[] = <fs_a>[].
* start left transformation iterating until tolerance or max iterations
  do max_iterations times.
* decompose b into lower and upper triangular matrices
* sum += B[i,k]*B[k,j]
    do n times.
      i = sy-index - 1.
      read table <fs_b> assigning <fs_bi> index i + 1.
      if sy-subrc = 0.
        do n times.
          j = sy-index - 1.
          do n times.
            k = sy-index - 1.
            assign component k + 1 of structure <fs_bi> to <fs_bik>.
            read table <fs_b> assigning <fs_k> index k + 1.
            if sy-subrc = 0.
              assign component j + 1 of structure <fs_k> to <fs_bkj>.
              if <fs_bik> is assigned and <fs_bkj> is assigned.
                sum = sum + <fs_bik> * <fs_bkj>.
              endif.
            endif.
          enddo.
        enddo.
      endif.
    enddo.
* B[i,j] -= sum.
    do n times.
      i = sy-index - 1.
      read table <fs_b> assigning <fs_i> index i + 1.
      if sy-subrc = 0.
        do n times.
          j = sy-index - 1.
          assign component j + 1 of structure <fs_i> to <fs_bij>.
          if <fs_bij> is assigned.
            <fs_bij> = <fs_bij> - sum.
          endif.
        enddo.
      endif.
    enddo.
* sum += B[i,k]*B[k,j]
    sum = zero.
    do n times.
      i = sy-index - 1.
      read table <fs_b> assigning <fs_i> index i + 1.
      if sy-subrc = 0.
        do n times.
          j = sy-index - 1.
          do n times.
            k = sy-index - 1.
            assign component k + 1 of structure <fs_i> to <fs_bik>.
            read table <fs_b> assigning <fs_k> index k + 1.
            if sy-subrc = 0.
              assign component j + 1 of structure <fs_k> to <fs_bkj>.
              if <fs_bik> is assigned and <fs_bkj> is assigned.
                sum = sum + <fs_bik> * <fs_bkj>.
              endif.
            endif.
          enddo.
        enddo.
      endif.
    enddo.
* B[i,j] -= sum / B[j,j]
    do n times.
      i = sy-index - 1.
      read table <fs_b> assigning <fs_i> index i + 1.
      if sy-subrc = 0.
        do n times.
          j = sy-index - 1.
          assign component j + 1 of structure <fs_i> to <fs_bij>.
          read table <fs_b> assigning <fs_j> index j + 1.
          if sy-subrc = 0.
            assign component j + 1 of structure <fs_j> to <fs_bjj>.
            if <fs_bij> is assigned and <fs_bjj> is assigned and <fs_bjj> <> 0.
              <fs_bij> = <fs_bij> - ( sum / <fs_bjj> ).
            endif.
          endif.
        enddo.
      endif.
    enddo.
* we now have the accumulated product of successive lower triangular matrix
* x[i,j] += b[i,j]
    do n times.
      i = sy-index - 1.
      read table <fs_x> assigning <fs_x_i> index i + 1.
      if sy-subrc = 0.
        read table <fs_b> assigning <fs_b_i> index i + 1.
        if sy-subrc = 0.
          do n times.
            j = sy-index - 1.
            assign component j + 1 of structure <fs_x_i> to <fs_xij>.
            assign component j + 1 of structure <fs_b> to <fs_bij>.
            if <fs_xij> is assigned and <fs_bij> is assigned.
              <fs_xij> = <fs_xij> + <fs_bij>.
            endif.
          enddo.
        endif.
      endif.
    enddo.
* x[i,j] += x[i,k]*B[k,j]
    do n times.
      i = sy-index - 1.
      read table <fs_x> assigning <fs_x_i> index i + 1.
      if sy-subrc = 0.
        do n times.
          j = sy-index - 1.
          assign component j + 1 of structure <fs_x_i> to <fs_xij>.
          do n times.
            k = sy-index - 1.
            assign component k + 1 of structure <fs_x_i> to <fs_xik>.
            read table <fs_b> assigning <fs_b_i> index k + 1.
            if sy-subrc = 0.
              assign component j + 1 of structure <fs_b_i> to <fs_bkj>.
              if <fs_xik> is assigned and <fs_bkj> is assigned.
                <fs_xij> = <fs_xij> + <fs_xik> * <fs_bkj>.
              endif.
            endif.
          enddo.
        enddo.
      endif.
    enddo.
* combine the factors in reverse order
*  B[i,j] *= B[i,i]
    do n times.
      i = sy-index - 1.
      read table <fs_b> assigning <fs_i> index i + 1.
      if sy-subrc = 0.
        assign component i + 1 of structure <fs_i> to <fs_bii>.
        do n times.
          j = sy-index - 1.
          assign component j + 1 of structure <fs_i> to <fs_bij>.
          if <fs_bij> is assigned and <fs_bii> is assigned.
            <fs_bij> = <fs_bij> * <fs_bii>.
          endif.
        enddo.
      endif.
    enddo.
* next B[i,j] += B[i,k]*B[k,j]
    do n times.
      i = sy-index - 1.
      read table <fs_b> assigning <fs_i> index i + 1.
      if sy-subrc = 0.
        do n times.
          j = sy-index - 1.
          assign component j + 1 of structure <fs_i> to <fs_bij>.
          do n times.
            k = sy-index - 1.
            assign component k + 1 of structure <fs_i> to <fs_bik>.
            read table <fs_b> assigning <fs_k> index k + 1.
            if sy-subrc = 0.
              assign component j + 1 of structure <fs_k> to <fs_bkj>.
              if <fs_bik> is assigned and <fs_bkj> is assigned.
                <fs_bij> = <fs_bij> + <fs_bik> * <fs_bkj>.
              endif.
            endif.
          enddo.
        enddo.
      endif.
    enddo.
* ABS(B[i,j]) < eps1 ? B[i,j] = zero
    do n times.
      i = sy-index - 1.
      read table <fs_b> assigning <fs_i> index i + 1.
      if sy-subrc = 0.
        do n times.
          j = sy-index - 1.
          assign component j + 1 of structure <fs_i> to <fs_bij>.
          if <fs_bij> is assigned and abs( <fs_bij> ) < epsilon_1.
            <fs_bij> = zero.
          endif.
        enddo.
      endif.
    enddo.
* subsum += abs( b[i,i-1] )
    do n times.
      i = sy-index - 1.
      if i = 0.
        continue.
      endif.
      read table <fs_b> assigning <fs_i> index i + 1.
      if sy-subrc = 0.
        assign component i of structure <fs_i> to <fs_ii_less1>.
        if <fs_ii_less1> is assigned.
          sbsum = sbsum + abs( <fs_ii_less1> ).
        endif.
      endif.
    enddo.
* determine the column vector for sweeping procedure
* if diagonal elements are too close we cannot proceed ..
*  abs(b[j,j]-b[i,i]) < epsilon2
    do n times.
      i = sy-index - 1.
      read table <fs_b> assigning <fs_i> index i + 1.
      if sy-subrc = 0.
        assign component i + 1 of structure <fs_i> to <fs_bii>.
        if <fs_bii> is assigned.
          do n times.
            j = sy-index - 1.
            read table <fs_b> assigning <fs_j> index j + 1.
            if sy-subrc = 0.
              assign component j + 1 of structure <fs_j> to <fs_bjj>.
              if <fs_bjj> is assigned and abs( <fs_bjj> - <fs_bii> ) < epsilon_2.
                return.
              endif.
            endif.
          enddo.
        endif.
      endif.
    enddo.
* the sum of the abs of the subdiagonal is now computed
* subsum += abs( b[i,i-1] )
    do n times.
      i = sy-index - 1.
      if i = 0.
        continue.
      endif.
      read table <fs_b> assigning <fs_i> index i + 1.
      if sy-subrc = 0.
        assign component i of structure <fs_i> to <fs_ii_less1>.
        if <fs_ii_less1> is assigned.
          sbsum = sbsum + abs( <fs_ii_less1> ).
        endif.
      endif.
    enddo.
* determine the column vector for sweeping procedure
* recheck if diagonal elements are too close we cannot proceed ..?
* abs(b[j,j]-b[i,i]) < epsilon2 : return
    do n times.
      i = sy-index - 1.
      read table <fs_b> assigning <fs_i> index i + 1.
      if sy-subrc = 0.
        assign component i + 1 of structure <fs_i> to <fs_bii>.
        if <fs_bii> is assigned.
          do n times.
            j = sy-index - 1.
            read table <fs_b> assigning <fs_j> index j + 1.
            if sy-subrc = 0.
              assign component j + 1 of structure <fs_j> to <fs_bjj>.
              if <fs_bjj> is assigned and abs( <fs_bjj> - <fs_bii> ) < epsilon_2.
                return.
              endif.
            endif.
          enddo.
        endif.
      endif.
    enddo.
* v[i] = b[i,j]
    do n times.
      i = sy-index - 1.
      read table <fs_b> assigning <fs_i> index i + 1.
      if sy-subrc = 0.
        do n times.
          j = sy-index - 1.
          assign component j + 1 of structure <fs_i> to <fs_bij>.
          if <fs_bij> is assigned.
            read table <fs_v> assigning <fs_vi> index i + 1.
            <fs_vi> = <fs_bij>.
            <fs_v>[ i + 1 ] = <fs_vi>.
          endif.
        enddo.
      endif.
    enddo.
    do n times.
      i = sy-index - 1.
      read table <fs_b> assigning <fs_i> index i + 1.
      if sy-subrc = 0.
        read table <fs_v> assigning <fs_vi> index i + 1.
        if sy-subrc = 0.
          val1 = <fs_vi>.
          do n times.
            k = sy-index - 1.
            assign component k + 1 of structure <fs_i> to <fs_bik>.
            read table <fs_v> assigning <fs_vk> index k + 1.
            if <fs_bik> is assigned and <fs_vk> is assigned.
              val1 = val1 + <fs_bik> * <fs_vk>.
            endif.
          enddo.
          <fs_vi> = val1.
        endif.
      endif.
    enddo.
* v[i] = v[i]/b[i,j] - b[i,i].
    do n times.
      i = sy-index - 1.
      read table <fs_b> assigning <fs_i> index i + 1.
      if sy-subrc = 0.
        read table <fs_v> assigning <fs_vi> index i + 1.
        if sy-subrc = 0.
          do n times.
            j = sy-index - 1.
            assign component j + 1 of structure <fs_i> to <fs_bij>.
            if <fs_bij> is assigned and <fs_bij> <> 0.
              assign component i + 1 of structure <fs_i> to <fs_bii>.
              if <fs_bii> is assigned.
                <fs_vi> = <fs_vi> / <fs_bij> - <fs_bii>.
              endif.
              exit.
            endif.
          enddo.
        endif.
      endif.
    enddo.
* modify lower triangular product matrix
* x[i,j] += v[k]
    do n times.
      i = sy-index - 1.
      read table <fs_x> assigning <fs_x> index i + 1.
      if sy-subrc = 0.
        do n times.
          j = sy-index - 1.
          assign component j + 1 of structure <fs_x> to <fs_xij>.
          do n times.
            k = sy-index - 1.
            read table <fs_v> assigning <fs_vk> index k + 1.
            if <fs_xij> is assigned and <fs_vk> is assigned.
              <fs_xij> = <fs_xij> + <fs_vk>.
            endif.
          enddo.
        enddo.
      endif.
    enddo.
* x[i,j] += x[i,k]*v[k]
    do n times.
      i = sy-index - 1.
      read table <fs_x> assigning <fs_x> index i + 1.
      if sy-subrc = 0.
        do n times.
          j = sy-index - 1.
          assign component j + 1 of structure <fs_x> to <fs_xij>.
          val1 = <fs_xij>.
          do n times.
            k = sy-index - 1.
            assign component k + 1 of structure <fs_x> to <fs_xik>.
            read table <fs_v> assigning <fs_vk> index k + 1.
            if <fs_xik> is assigned and <fs_vk> is assigned.
              val1 = val1 + <fs_xik> * <fs_vk>.
            endif.
          enddo.
          <fs_xij> = val1.
        enddo.
      endif.
    enddo.
* b[i,j] += b[i,k]*v[k]
    do n times.
      i = sy-index - 1.
      read table <fs_b> assigning <fs_b> index i + 1.
      if sy-subrc = 0.
        do n times.
          j = sy-index - 1.
          assign component j + 1 of structure <fs_b> to <fs_bij>.
          val1 = <fs_bij>.
          do n times.
            k = sy-index - 1.
            assign component k + 1 of structure <fs_b> to <fs_bik>.
            read table <fs_v> assigning <fs_vk> index k + 1.
            if <fs_bik> is assigned and <fs_vk> is assigned.
              val1 = val1 + <fs_bik> * <fs_vk>.
            endif.
          enddo.
          <fs_bij> = val1.
        enddo.
      endif.
    enddo.
* premultiply b with inverse of sweeping matrix
* next b[i,k] -= v[i] * b[j,k]
    do n times.
      i = sy-index - 1.
      read table <fs_b> assigning <fs_bi> index i + 1.
      if sy-subrc = 0.
        read table <fs_v> assigning <fs_vi> index i + 1.
        if sy-subrc = 0.
          do n times.
            k = sy-index - 1.
            assign component k + 1 of structure <fs_bi> to <fs_bik>.
            do n times.
              j = sy-index - 1.
              read table <fs_b> assigning <fs_bj> index j + 1.
              if sy-subrc = 0.
                assign component k + 1 of structure <fs_bj> to <fs_bjk>.
                if <fs_bik> is assigned and <fs_bjk> is assigned and <fs_vi> is assigned.
                  <fs_bik> = <fs_bik> - <fs_vi> * <fs_bjk>.
                endif.
              endif.
            enddo.
          enddo.
        endif.
      endif.
    enddo.
    if sbsum lt epsilon_1.
      exit.
    endif.
  enddo.
* All kosher .. compute eigenvectors and eigenvalues of transformed matrix
* next x[i,i] = 1
  do n times.
    i = sy-index - 1.
    read table <fs_x> assigning <fs_x> index i + 1.
    if sy-subrc = 0.
      assign component i + 1 of structure <fs_x> to <fs_xii>.
      if <fs_xii> is assigned.
        <fs_xii> = 1.
      endif.
    endif.
  enddo.
* sum = b[i,j]
  do n times.
    i = sy-index - 1.
    read table <fs_b> assigning <fs_b> index i + 1.
    if sy-subrc = 0.
      do n times.
        j = sy-index - 1.
        assign component j + 1 of structure <fs_b> to <fs_bij>.
        if <fs_bij> is assigned.
          sum = <fs_bij>.
        endif.
      enddo.
    endif.
  enddo.
* sum += b[i,k] * x[k,j]
  do n times.
    i = sy-index - 1.
    read table <fs_b> assigning <fs_b> index i + 1.
    if sy-subrc = 0.
      do n times.
        j = sy-index - 1.
        do n times.
          k = sy-index - 1.
          assign component k + 1 of structure <fs_b> to <fs_bik>.
          read table <fs_x> assigning <fs_x> index k + 1.
          if sy-subrc = 0.
            assign component j + 1 of structure <fs_x> to <fs_xkj>.
            if <fs_bik> is assigned and <fs_xkj> is assigned.
              sum = sum + <fs_bik> * <fs_xkj>.
            endif.
          endif.
        enddo.
      enddo.
    endif.
  enddo.
* x[i,j] = sum / b[j,j] - b[i,i]
  do n times.
    i = sy-index - 1.
    read table <fs_b> assigning <fs_bi> index i + 1.
    if sy-subrc = 0.
      do n times.
        j = sy-index - 1.
        read table <fs_b> assigning <fs_bj> index j + 1.
        if sy-subrc = 0.
          assign component j + 1 of structure <fs_bj> to <fs_bjj>.
          assign component i + 1 of structure <fs_bi> to <fs_bii>.
          read table <fs_x> assigning <fs_x> index i + 1.
          if sy-subrc = 0.
            assign component j + 1 of structure <fs_x> to <fs_bij>.
            if <fs_bij> is assigned and <fs_bjj> is assigned and <fs_bii> is assigned and <fs_bjj> <> 0.
              <fs_bij> = sum / <fs_bjj> - <fs_bii>.
            endif.
          endif.
        endif.
      enddo.
    endif.
  enddo.
* Normalize the eigenvectors
  j = 1.
  while j <= n.
    sum = zero.
    i = 1.
    while i <= n.
      sum = sum + u->get_element( row = i col = j ) ** 2.
      add 1 to i.
    endwhile.
    norm = sqrt( sum ).
    i = 1.
    while i <= n.
      lhs = u->get_element( row = i col = j ).
      u->set_element( row = i col = j value = ( lhs / norm ) ).
      add 1 to i.
    endwhile.
* Move the calculated values to the exporting parameters
* Eigenvalues -> diagonal of transformed matrix B.
    i = 1.
    while i <= n.
      lhs = b->get_element( row = i col = i ).
      eigenvalues->set_element( i = i value = lhs ).
      add 1 to i.
    endwhile.
    add 1 to j.
  endwhile.
* Eigenvectors are columns of U
  <fs_egv>[] = <fs_u>[].
  if column_view = abap_false.
    eigenvectors->transpose( ).
  endif.
  free: x, v, u, b.
endmethod.


method RUTISHAUSER_LR_TRANSFORMATION1.
* Converted from IBM Assembler 370 code written in 1978
  data:
    b     type ref to zcl_matrix,
    u     type ref to zcl_matrix,
    x     type ref to zcl_matrix,
    v     type ref to zcl_vector,
    i     type i,
    it    type i,
    im1   type i,
    ip1   type i,
    i_low type i,
    i_hi  type i,
    j     type i,
    jp1   type i,
    jp2   type i,
    jm1   type i,
    j_low type i,
    j_hi  type i,
    k_low type i,
    k_hi  type i,
    n     TYPE i,
    o     TYPE i,
    p     type i,
    sum   type decfloat34,
    sbsum type decfloat34,
    norm  type decfloat34,
    val1  type decfloat34,
    val2  type decfloat34,
    lhs   type decfloat34,
    rhs   type decfloat34,
    iter  type i,
    l     type i,
    k     type i,
    nm1   type i,
    leave type boolean,
    skip  type boolean,
    too_close type boolean,
    dim   type zcl_utilities=>dimension.
  field-symbols:
    <fs_b>   type standard table,
    <fs_x>   type standard table,
    <fs_a>   type standard table,
    <fs_u>   type standard table,
    <fs_a1>  type standard table,
    <fs_egl> type standard table,
    <fs_egv> type standard table,
    <fs_v>   type standard table.


* Initialize with zeros is the defaut
  preparem b <fs_b> a.
  preparem x <fs_x> a.
  preparem u <fs_u> a.
  deref a <fs_a>.
  preparem eigenvectors <fs_egv> a.
  n = a->dimension( )-row.
  nm1 = n - 1.
  dim = a->dimension( ).
  preparev eigenvalues <fs_egl> a.
  preparev v <fs_v> a.
  <fs_b>[] = <fs_a>[].
* start left transformation iterating until tolerance or max iterations
  forx iter 1 max_iterations.
* decompose b into lower and upper triangular matrices
    forx j 1 n.
      forx i 1 j.
        sum = zero.
        im1 = i - 1.
        forx k 1 im1.
* sum += B[i,k]*B[k,j]
          lhs = b->get_element( row = i col = k ).
          rhs = b->get_element( row = k col = j ).
          sum = sum + ( lhs * rhs ).
        endfor k.
* B[i,j] -= sum.
        b->sub_from_element( row = i col = j value = sum ).
      endfor i.
      jp1 = j + 1. "15.
      if jp1 <= n.
         forx i 1 i_hi.
          sum = zero.
          jm1 = j - 1.
* sum += B[i,k]*B[k,j]
          forx k 1 jm1.
             lhs = b->get_element( row = i col = k ).
             rhs = b->get_element( row = k col = j ).
             sum = sum + ( lhs * rhs ).
          endfor k.
* B[i,j] = (B[i,j] - sum) / B[j,j]
          lhs = b->get_element( row = i col = j ).
          lhs = lhs - sum.
          rhs = b->get_element( row = j col = j ).
          b->set_element( row = i col = j value = lhs / rhs ).
         endfor i.
      endif.
    endfor j. "10
* we now have the accumulated product of successive lower triangular matrix
    forx i 2 n.
      im1 = i - 1.
* x[i,j] += b[i,j]
      forx j 1 im1.
        lhs = b->get_element( row = i col = j ) .
        x->add_to_element( row = i col = j value = lhs ).
        k_low = j + 1.
* x[i,j] += x[i,k]*B[k,j]
        forx k k_low im1.
          lhs = x->get_element( row = i col = k ).
          rhs = b->get_element( row = k col = j ).
          x->add_to_element( row = i col = j value = lhs * rhs ).
        endfor k.
      endfor j.
    endfor i. "17
* combine the factors in reverse order
    forx i 1 n.
      im1 = i - 1.
      if im1 < 1.
* B[i,j] *= B[i,i]
          forx j 1 im1.
            lhs = b->get_element( row = i col = j ).
            rhs = b->get_element( row = i col = i ).
            b->set_element( row = i col = j value = lhs * rhs ).
            ip1 = i + 1.
* B[i,j] += B[i,k]*B[k,j]
            forx k ip1 n.
              lhs = b->get_element( row = i col = k ).
              rhs = b->get_element( row = k col = j ).
              b->add_to_element( row = i col = j value = lhs * rhs ).
            endfor k.
          endfor j.
      endif.
      forx j i n.
         jp1 = j + 1.
* B[i,j] += B[i,k] * B[k,j]
         forx k jp1 n.
            lhs =  b->get_element( row = i col = k ).
            rhs = b->get_element( row = k col = j ).
            b->add_to_element( row = i col = j value = lhs * rhs ).
         endfor k.
      endfor j.
    endfor i."24
    forx i 1 n.
* ABS(B[i,j]) < eps1 ? B[i,j] = zero
* zero element if lower than e
      forx j 1 4.
        lhs = b->get_element( row = i col = j ).
        if abs( lhs ) lt e.
          b->set_element( row = i col = j value = zero ).
        endif.
      endfor j.
    endfor i."25
    l = l + 1.
* the sum of the abs of the subdiagonal is now computed
    sbsum = zero.
* subsum += abs( b[i,i-1] )
    forx i 2 n.
      lhs = b->get_element( row = i col = i - 1 ).
      sbsum = sbsum + abs( lhs ).
    endfor i.
* determine the column vector for sweeping procedure
    if sbsum lt epsilon_4 or l eq frequency.
* if diagonal elements are too close we cannot proceed .. abs(b[j,j]-b[i,i]) < epsilon2 ...
      forx j 1 nm1.
        too_close = abap_false.
        forx i 1 n.
          lhs = b->get_element( row = j col = j ).
          rhs = b->get_element( row = i col = i ).
          val1 = abs( lhs  - rhs ).
          if j <> 1 and val1 <> 0 and val1 lt epsilon_2 .
            too_close = abap_true.
          endif.
        endfor i.
        if too_close = abap_false.
          jp1 = j + 1.
* v[i] = b[i,j]
          forx it jp1 n.
            i = n + jp1 - it.
            lhs = b->get_element( row = i col = j ).
            v->set_element( i = i value = lhs ).
            ip1 = i + 1.
* v[i] += b[i,k] * v[k]
            if i <> n.
              forx k ip1 n.
                lhs = b->get_element( row = i col = k ).
                rhs = v->get_element( k ).
                v->add_to_element( i = i value = lhs * rhs ).
              endfor k.
* v[i] = v[i]/b[i,j] - b[i,i].
              lhs = <fs_v>[ i ].
              lhs = lhs / b->get_element( row = i col = j ).
              rhs = b->get_element( row = i col = i ).
              v->set_element( i = i value = lhs - rhs ).
            endif.
          endfor it.
* modify lower triangular product matrix
* x[i,j] += v[k]
          forx it jp1 n.
            i = n + jp1 - it.
            lhs = v->get_element( i ).
            x->add_to_element( row = i col = j value = lhs ).
            im1 = i - 1.
* x[i,j] += x[i,k]*v[k]
            forx k jp1 im1.
              lhs = x->get_element( row = i col = k ).
              rhs = v->get_element( k ).
              x->add_to_element( row = i col = j value = lhs * rhs ).
            endfor k.
          endfor it.
* postmultiply b with sweeping matrix
* b[i,j] += b[i,k]*v[k]
          forx i 1 n.
            forx k jp1 n.
              lhs = b->get_element( row = i col = k ).
              rhs = v->get_element( k ).
              b->add_to_element( row = i col = j value = lhs * rhs ).
            endfor k.
          endfor i.
* premultiply b with inverse of sweeping matrix
* b[i,k] -= v[i] * b[j,k]
          forx i jp1 n.
            forx k 1 n.
              lhs = v->get_element( i ).
              rhs = b->get_element( row = j col = k ).
              b->sub_from_element( row = i col = k value = lhs * rhs ).
            endfor k.
          endfor i.
        endif.
      endfor j."37
    endif. "42
* Check for convergence
    if too_close = abap_true.
      return.
    endif.
    if l eq frequency or iter eq max_iteration or sbsum le epsilon_1.
      l = 0.
    endif.
  endfor iter."51
  forx i 1 n.
    x->set_element( row = i col = i value = zero ).
  endfor i.
* check if two eingenvalues are closer together than epsilon 2
  if sbsum lt epsilon_3.
    return.
  endif.
  forx i 1 nm1.
    ip1 = i + 1.
    forx j ip1 n.
      lhs = b->get_element( row = i col = i ).
      rhs = b->get_element( row = j col = j ).
      if abs( lhs - rhs ) < epsilon_2.
        return.
      endif.
    endfor j.
  endfor i.
* All kosher .. compute eigenvectors and eigenvalues of transformed matrix
  forx j 1 n.
    x->set_element( row = j col = j value = one ).
    if j <> 1.
      jm1 = j - 1.
      forx it 1 jm1.
        i = j - it.
* sum = b[i,j]
        sum = b->get_element( row = i col = j ).
        ip1 = i + 1.
* sum += b[i,k] * x[k,j]
        forx k ip1 jm1.
          lhs = b->get_element( row = i col = k ).
          rhs = x->get_element( row = k col = j ).
          sum = sum + lhs * rhs.
        endfor k.
* x[i,j] = sum / b[j,j] - b[i,i]
        lhs = sum / b->get_element( row = j col = j ).
        rhs = b->get_element( row = i col = i ).
        x->set_element( row = i col = j value = lhs - rhs ).
      endfor it.
    endif.
  endfor j.
* Alles gut .. computer eigenvectors and eigenvalues of original matrix
  forx i 1 n.
    im1 = i - 1.
    if i <> 1.
      forx j 1 im1.
        lhs = x->get_element( row = i col = j ).
        u->set_element( row = i col = j value = lhs ).
        jm1 = j - 1.
* u[i,j] += x[i,k] * x[k,j]
        if j <> 1.
          forx k 1 jm1.
            lhs = x->get_element( row = i col = k ).
            rhs = x->get_element( row = k col = j ).
            u->add_to_element( row = i col = j value = lhs * rhs ).
          endfor k.
        endif.
      endfor j.
    endif.
  endfor i.
* Normalize the eigenvectors
  forx j 1 n.
    sum = zero.
    forx i 1 n.
      sum = sum + u->get_element( row = i col = j ) ** 2.
    endfor i.
    norm = sqrt( sum ).
    forx i 1 n.
      lhs = u->get_element( row = i col = j ).
      u->set_element( row = i col = j value = ( lhs / norm ) ).
    endfor i.
  endfor j.
* Move the calculated values to the exporting parameters
* Eigenvalues -> diagonal of transformed matrix B.
  forx i 1 n.
    lhs = b->get_element( row = i col = i ).
    eigenvalues->set_element( i = i value = lhs ).
  endfor i.
* Eigenvectors are columns of U
  <fs_egv>[] = <fs_u>[].
  if column_view = abap_false.
    eigenvectors->transpose( ).
  endif.
  free: x, v, u, b.
endmethod.


  method SCAMAT.
    data:
      i__   type i,
      j__   type i,
      n__   type i,
      lhs__ type decfloat34,
      rhs__ type decfloat34.
    field-symbols:
     <fs_x__> type standard table.

    preparem b <fs_x__> a.
    n__ = a->dimension( )-row.
    forx i__ 1 n__.
      forx j__ 1 n__.
        lhs__ = a->get_element( row = i__ col = j__ ).
        b->set_element( row = i__ col = j__ value = s * lhs__ ).
      endfor j__.
    endfor i__.
  endmethod.


  method SCAVEC.
    data:
      i__   type i,
      j__   type i,
      n__   type i,
      lhs__ type decfloat34,
      rhs__ type decfloat34.
    field-symbols:
     <fs_x__> type standard table.

    n__ = zcl_vector=>ranks( x ).
    dpreparev y <fs_x__> x.
    forx i__ 1 n__.
      lhs__ = x->get_element( i = i__ ).
      y->set_element( i = i__ value = s * lhs__ ).
    endfor i__.
  endmethod.


method sendresult.
* This function is used to send user reply to iterative  request  sent  by
* solver. Usually it is product A* X for returned by solver matrix X.
*
* It should be used in conjunction with other iterative-related  functions
* of this subspackage in a loop like below:
*
*  eigcompstart( exp state)
*  while eigcompoontinue( exp state) do
*      eigcompgetrequestinfo( exp state, imp RequestType, imp M)
*      eigcompgetrequestdata( exp state, imp X)
*      [calculate  Y=A* X, with X=R^NxM]
*      eigcompsendresult( exp state, in Y)
*  eigcompstop( exp state, imp W, imp Z, imp Report)
*
* INPUT PARAMETERS:
*     State           -   solver running in iterative mode
*     AX              -   array[N,RequestSize] or larger, leading  rectangle
*                         is filled with product A* X.

endmethod.


method set_cond.
* This function sets stopping critera for the solver:
*  error in eigenvector/value allowed by solver
*  maximum number of iterations to perform
*
* INPUT PARAMETERS:
*     State       -   solver structure
*     Eps         -   eps>=0,  with non-zero value used to tell solver  that
*                     it can  stop  after  all  eigenvalues  converged  with
*                     error  roughly  proportional  to  eps* MAX(LAMBDA_MAX),
*                     where LAMBDA_MAX is a maximum eigenvalue.
*                     Zero  value  means  that  no  check  for  precision is
*                     performed.
*     MaxIts      -   maxits>=0,  with non-zero value used  to  tell  solver
*                     that it can stop after maxits  steps  (no  matter  how
*                     precise current estimate is)
*
* NOTE: passing  eps=0  and  maxits=0  results  in  automatic  selection  of
*       moderate eps as stopping criteria (1.0E-6 in current implementation,
*       but it may change without notice).
*
* NOTE: very small values of eps are possible (say, 1.0E-12),  although  the
*       larger problem you solve (N and/or K), the  harder  it  is  to  find
*       precise eigenvectors because rounding errors tend to accumulate.
*
* NOTE: passing non-zero eps results in  some performance  penalty,  roughly
*       equal to 2N* (2K)^2 FLOPs per iteration. These additional computations
*       are required in order to estimate current error in  eigenvalues  via
*       Rayleigh-Ritz process.
*       Most of this additional time is  spent  in  construction  of  ~2Kx2K
*       symmetric  subproblem  whose  eigenvalues  are  checked  with  exact
*       eigensolver.
*       This additional time is negligible if you search for eigenvalues  of
*       the large dense matrix, but may become noticeable on  highly  sparse
*       EVD problems, where cost of matrix-matrix product is low.
*       If you set eps to exactly zero,  Rayleigh-Ritz  phase  is completely
*       turned off.

endmethod.


method set_warm_start.
* This function sets warm-start mode of the solver: next call to the  solver
* will reuse previous subspace as warm-start  point.  It  can  significantly
* speed-up convergence when you solve many similar eigenproblems.
*
* INPUT PARAMETERS:
*     State       -   solver structure
*     UseWarmStart-   either True or False

endmethod.


method solve_denses.
* This  function runs subspace eigensolver for dense NxN symmetric matrix A,
* given by its upper or lower triangle.
*
* This function cannot process nonsymmetric matrices.
*
* INPUT PARAMETERS:
*     State       -   solver state
*     A           -   array[N,N], symmetric NxN matrix given by one  of  its
*                     triangles
*     IsUpper     -   whether upper or lower triangle of  A  is  given  (the
*                     other one is not referenced at all).
*
* OUTPUT PARAMETERS:
*     W           -   array[K], top  K  eigenvalues ordered  by   descending
*                     of their absolute values
*     Z           -   array[N,K], matrix of eigenvectors found
*     Rep         -   report with additional parameters
*
* NOTE: internally this function allocates a copy of NxN dense A. You should
*       take it into account when working with very large matrices occupying
*       almost all RAM.

endmethod.


method solve_homogeneous_system.
" This method should implement back substitution to find null space vectors
" For each column, if the diagonal element is zero, it suggests a potential free variable
" Back substitution algorithm must account for these free variables

data:
i      type i,
j      type i,
rows   type i,
cols   type i,
factor type decfloat34,
vector type ref to zcl_vector.

field-symbols:
<fs_a>    type standard table,
<fs_egvt> type standard table,
<fs_aii>  type any,
<fs_ajj>  type any.


deref a <fs_a>.
preparev vector <fs_egvt> a.
* Implement back substitution here
i = a->dimension( )-row.
while i > 0.
m_i_j i <fs_a> i <fs_aii>.
if <fs_aii> = zero.
" If this is a free variable, set it to 1 and solve for others
<fs_egvt>[ i ] = 1.
" Back solve for other variables
j = i - 1.
while j > 0.
factor = <fs_aii>.
m_i_j j <fs_a> j <fs_ajj>.
<fs_egvt>[ j ] = -1 * factor / <fs_ajj>.
j = j - 1.
endwhile.
endif.
i = i - 1.
endwhile.
" Store the vector as a potential eigenvector
append vector to eigenvectors.
endmethod.


method solve_sparses.
* This  function runs eigensolver for dense NxN symmetric matrix A, given by
* upper or lower triangle.
*
* This function can not process nonsymmetric matrices.
*
* INPUT PARAMETERS:
*     State       -   solver state
*     A           -   NxN symmetric matrix given by one of its triangles
*     IsUpper     -   whether upper or lower triangle of  A  is  given  (the
*                     other one is not referenced at all).
*
* OUTPUT PARAMETERS:
*     W           -   array[K], top  K  eigenvalues ordered  by   descending
*                     of their absolute values
*     Z           -   array[N,K], matrix of eigenvectors found
*     Rep         -   report with additional parameters
endmethod.


method start.
*This  function  initiates  iterative  mode  of  subspace eigensolver. It
*should be used in conjunction with other iterative-related functions  of
*this subspackage in a loop like below:
*
* eigcompstart( exp state)
* while eigcompcontinue( exp state) do
*     eigcompgetrequestinfo( exp state, imp RequestType, imp M)
*     eigcompgetrequestdata( exp state, imp X)
*     [calculate  Y=A*X, with X=R^NxM]
*     eigcompsendresult( exp state, in Y)
* eigcompstop( exp state, imp W, imp Z, imp Report)
*
*INPUT PARAMETERS:
*    State       -   solver object
*    MType       -   matrix type and solver mode:
*
*                    * 0 =   real symmetric matrix A, products  of the form
*                            A*X are computed. At every step  the  basis of
*                            the  invariant  subspace  is  reorthogonalized
*                            with LQ decomposition  which  makes  the  algo
*                            more robust.
*
*                            The first mode introduced in ALGLIB, the  most
*                            precise and robust. However, it is  suboptimal
*                            for easy problems which can be solved  in  3-5
*                            iterations without LQ step.
*
*                    * 1 =   real symmetric matrix A, products  of the form
*                            A*X are computed. The  invariant  subspace  is
*                            NOT reorthogonalized,  no  error  checks.  The
*                            solver  stops  after   specified   number   of
*                            iterations which should be small, 5 at most.
*
*                            This mode is intended for easy  problems  with
*                            extremely fast convergence.
*
*                    Future versions of ALGLIB may  introduce  support  for
*                    other  matrix   types;   for   now,   only   symmetric
*                    eigenproblems are supported.

endmethod.


method stop.
*This  function  finalizes iterative  mode  of  subspace eigensolver.  It
*should be used in conjunction with other iterative-related functions  of
*this subspackage in a loop like below:
*
*> eigcompstart( exp state)
*> while eigcompcontinue( exp state) do
*>     eigcompgetrequestinfo( exp state, imp RequestType, imp M)
*>     eigcompgetrequestdata( exp state, imp X)
*>     [calculate  Y=A*X, with X=R^NxM]
*>     eigcompsendresult( exp state, in Y)
*> eigcompstop( exp state, imp W, imp Z, imp Report)
*
*INPUT PARAMETERS:
*    State       -   solver state
*
*OUTPUT PARAMETERS:
*    W           -   array[K], depending on solver settings:
*                    * top  K  eigenvalues ordered  by  descending   -   if
*                      eigenvectors are returned in Z
*                    * zeros - if invariant subspace is returned in Z
*    Z           -   array[N,K], depending on solver settings either:
*                    * matrix of eigenvectors found
*                    * orthogonal basis of K-dimensional invariant subspace
*    Rep         -   report with additional parameters

endmethod.


  method VECLEN.
    data:
      i__   type i,
      j__   type i,
      n__   type i,
      lhs__ type decfloat34,
      rhs__ type decfloat34.
    field-symbols:
     <fs_x__> type standard table.

    n__ = zcl_vector=>ranks( x ).
    forx i__ 1 n__.
      rhs__ = x->get_element( i = i__ ) ** 2.
      lhs__ = lhs__ + rhs__.
    endfor i__.
    s = sqrt( lhs__ ).
  endmethod.
ENDCLASS.
