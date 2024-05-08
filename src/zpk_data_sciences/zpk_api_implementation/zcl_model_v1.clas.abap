class zcl_model_v1 definition
  public
  inheriting from zcl_pysap
  final
  create public .

  public section.

    interfaces zif_model .

    methods vectors .
    methods matrices .
  protected section.
  private section.
ENDCLASS.



CLASS ZCL_MODEL_V1 IMPLEMENTATION.


  method matrices.
  endmethod.


  method vectors.
  endmethod.


  method zif_model~execute.
    define check_vector.
      if parms is supplied and parms is not initial.
         split parms at equal into dummy rank_n.
         rank = rank_n.
       elseif body is supplied and body is not initial.

       else.
         bad_request.
         return.
       endif.
    end-of-definition.
    define check_matrix.
      if parms is supplied and parms is not initial.
         split parms at equal into dummy row_.
         row = row_.
       elseif body is supplied and body is not initial.

       else.
         bad_request.
         return.
       endif.
    end-of-definition.
    constants:
      equal   type char1 value '='.
    types:
      vs_     type standard table of ref to object.
    data:
      timer   type ref to if_abap_runtime,
      vs      type vs_,
      v       type ref to zcl_vector,
      w       type ref to zcl_vector,
      u       type ref to zcl_vector,
      a       type ref to zcl_matrix,
      b       type ref to zcl_matrix,
      c       type ref to zcl_matrix,
      x       type float,
      y       type float,
      z       type float,
      ref     type ref to data,
      dim     type zcl_utilities=>dimension,
      rank_n  type n,
      rank    type i,
      row_    type n,
      row     type i,
      dummy   type string,
      start   type int8,
      end     type int8,
      runtime type int8,
      cdata   type string.
    field-symbols:
      <fs_table> type standard table,
      <fs_zeile> type any.

    if route is supplied.
      case route.
        when 'Vectors'.
          check_vector.
          timestamp timer.
          start = timer->get_runtime( ).
          v ?= zcl_vector=>create_instance( kind = cl_abap_datadescr=>typekind_float rand = abap_true rank = rank ).
          end = timer->get_runtime( ).
          runtime = end - start.
          move runtime to cdata.
          response->set_cdata( data = cdata ).
        when 'VectorAddition'.
          check_vector.
          timestamp timer.
          start = timer->get_runtime( ).
          v ?= zcl_vector=>create_instance( kind = cl_abap_datadescr=>typekind_float rand = abap_true rank = rank ).
          w ?= zcl_vector=>create_instance( kind = cl_abap_datadescr=>typekind_float rand = abap_true rank = rank ).
          u ?= zcl_vector=>additions( v1 = v v2 = w ).
          end = timer->get_runtime( ).
          runtime = end - start.
          move runtime to cdata.
          response->set_cdata( data = cdata ).
        when 'VectorDotProduct'.
          check_vector.
          timestamp timer.
          start = timer->get_runtime( ).
          v ?= zcl_vector=>create_instance( kind = cl_abap_datadescr=>typekind_float rand = abap_true rank = rank ).
          w ?= zcl_vector=>create_instance( kind = cl_abap_datadescr=>typekind_float rand = abap_true rank = rank ).
          ref ?= zcl_vector=>dot_products( v1 = v v2 = w ).
          assign ref->* to <fs_zeile>.
          x = <fs_zeile>.
          end = timer->get_runtime( ).
          runtime = end - start.
          move runtime to cdata.
          response->set_cdata( data = cdata ).
        when 'VectorCrossProduct'.
          check_vector.
          timestamp timer.
          start = timer->get_runtime( ).
          v ?= zcl_vector=>create_instance( kind = cl_abap_datadescr=>typekind_float rand = abap_true rank = rank ).
          w ?= zcl_vector=>create_instance( kind = cl_abap_datadescr=>typekind_float rand = abap_true rank = rank ).
          insert v into table vs.
          insert w into table vs.
          u ?= zcl_vector=>cross_products( vs = vs ).
          end = timer->get_runtime( ).
          runtime = end - start.
          move runtime to cdata.
          response->set_cdata( data = cdata ).
        when 'Matrices'.
          check_matrix.
          timestamp timer.
          start = timer->get_runtime( ).
          dim-row = row.
          dim-col = row.
          a ?= zcl_matrix=>create_instance( kind = cl_abap_datadescr=>typekind_float rand = abap_true dim  = dim ).
          end = timer->get_runtime( ).
          runtime = end - start.
          move runtime to cdata.
          response->set_cdata( data = cdata ).
        when 'MatrixAddition'.
          check_matrix.
          timestamp timer.
          start = timer->get_runtime( ).
          dim-row = row.
          dim-col = row.
          a ?= zcl_matrix=>create_instance( kind = cl_abap_datadescr=>typekind_float rand = abap_true dim  = dim ).
          b ?= zcl_matrix=>create_instance( kind = cl_abap_datadescr=>typekind_float rand = abap_true dim  = dim ).
          c ?= zcl_matrix=>additions( a = a b = b ).
          end = timer->get_runtime( ).
          runtime = end - start.
          move runtime to cdata.
          response->set_cdata( data = cdata ).
        when 'MatrixMultiplication'.
          check_matrix.
          timestamp timer.
          start = timer->get_runtime( ).
          dim-row = row.
          dim-col = row.
          a ?= zcl_matrix=>create_instance( kind = cl_abap_datadescr=>typekind_float rand = abap_true dim  = dim ).
          b ?= zcl_matrix=>create_instance( kind = cl_abap_datadescr=>typekind_float rand = abap_true dim  = dim ).
          c ?= zcl_matrix=>multiplications( a = a b = b ).
          end = timer->get_runtime( ).
          runtime = end - start.
          move runtime to cdata.
          response->set_cdata( data = cdata ).
        when 'MatrixInversion'.
          check_matrix.
          timestamp timer.
          start = timer->get_runtime( ).
          dim-row = row.
          dim-col = row.
          a ?= zcl_matrix=>create_instance( kind = cl_abap_datadescr=>typekind_float rand = abap_true dim  = dim ).
          b ?= zcl_matrix=>inverts( a ).
          end = timer->get_runtime( ).
          runtime = end - start.
          move runtime to cdata.
          response->set_cdata( data = cdata ).
        when 'MatrixDeterminant'.
          check_matrix.
          timestamp timer.
          start = timer->get_runtime( ).
          dim-row = row.
          dim-col = row.
          a ?= zcl_matrix=>create_instance( kind = cl_abap_datadescr=>typekind_float rand = abap_true dim  = dim ).
          x = zcl_matrix=>determinants( a ).
          end = timer->get_runtime( ).
          runtime = end - start.
          move runtime to cdata.
          response->set_cdata( data = cdata ).
        when others.
          bad_request.
      endcase.
    else.
      bad_request.
    endif.
  endmethod.
ENDCLASS.
