 define dpreparem.
   if &1 is initial.
     &1 ?= zcl_matrix=>create_instance( dim = dim kind = cl_abap_datadescr=>typekind_decfloat34 ).
   endif.
   ref ?= &1->Get_Container( ).
   assign ref->* to &2.
 end-of-definition.
 define dpreparev.
   if &1 is initial.
     &1 ?= zcl_vector=>create_instance( lenght = &3->Rank( ) kind = cl_abap_datadescr=>typekind_decfloat34 ).
   endif.
   ref ?= &1->Get_Container( ).
   assign ref->* to &2.
 end-of-definition.
