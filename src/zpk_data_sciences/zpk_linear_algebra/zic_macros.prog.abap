 define deref.
   ref ?= &1->get_container( ).
   assign ref->* to &2.
 end-of-definition.
 define m_i_j.
   assign component &1 of structure &2[ &3 ] to &4.
 end-of-definition.
 define for_n.
   &1 = &2.
   while &1 <= &3.
 end-of-definition.
 define for_l.
   &1 = &2.
   while &1 >= &3.
 end-of-definition.
 define for.
   for_n &1 1 &2.
 end-of-definition.
 define forx.
   for_n &1 &2 &3.
 end-of-definition.
 define for_i.
   for_n i &1 &2.
 end-of-definition.
 define for_j.
   for_n j &1 &2.
 end-of-definition.
 define for_k.
   for_n k &1 &2.
 end-of-definition.
 define endfor.
   endfor_n &1 +.
 end-of-definition.
 define endfor_l.
   endfor_n &1 -.
 end-of-definition.
 define endfor_n.
   &1 = &1 &2 1.
  endwhile.
 end-of-definition.
 define next.
   add 1 to &1.
   continue.
 end-of-definition.
 define real.
   assign component 1 of structure &1 to <fs_re>.
 end-of-definition.
 define imaginary.
   assign component 2 of structure &1 to <fs_re>.
 end-of-definition.
 define get_row_cell.
   assign &1[ &2 ] to <fs_row>.
 end-of-definition.
 define get_col_cell.
   assign <fs_row>[ &1 ] to <fs_cell>.
 end-of-definition.
 define get_row_col.
   get_row_cell &1 &2.
   get_col_cell &3.
 end-of-definition.
 define fsymbols.
   field-symbols:
     <fs_row>  type standard table,
     <fs_cell> type any.
 end-of-definition.
