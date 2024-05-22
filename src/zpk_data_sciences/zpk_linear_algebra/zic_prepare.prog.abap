  define preparem.
   if &1 is initial.
     &1 ?= zcl_matrix=>create_instance( dim = &3->dimension( ) kind = zcl_matrix=>Kinds( &3 ) ).
   endif.
   ref ?= &1->Get_Container( ).
   assign ref->* to &2.
 end-of-definition.
 define prepare1.
   if &1 is initial.
     &1 ?= zcl_matrix=>create_instance( dim = 1 kind = zcl_matrix=>Kinds( &3 ) ).
   endif.
   ref ?= &1->Get_Container( ).
   assign ref->* to &2.
 end-of-definition.
 define preparev.
   if &1 is initial.
     &1 ?= zcl_vector=>create_instance( lenght = &3->dimension( )-row kind = zcl_matrix=>Kinds( &3 ) ).
   endif.
   ref ?= &1->Get_Container( ).
   assign ref->* to &2.
 end-of-definition.
 define preparerv.
   if &1 is initial.
     &1 ?= zcl_vector=>create_instance( lenght = &3->dimension( )-row rand = abap_true kind = zcl_matrix=>Kinds( &3 ) ).
   endif.
   ref ?= &1->Get_Container( ).
   assign ref->* to &2.
 end-of-definition.
