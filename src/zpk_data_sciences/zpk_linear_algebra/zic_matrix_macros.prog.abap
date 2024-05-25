    data:
      i__   type i,
      j__   type i,
      k__   type i,
      n__   type i,
      lhs__ type decfloat34,
      rhs__ type decfloat34.
    field-symbols:
     <fs_x__> type standard table.

    define matvec.
      n__ = &2->dimension( )-row.
      preparev &1 <fs_x__> &2.
      forx i__ 1 n__.
        forx j__ 1 n__.
          lhs__ = &2->get_element( row = i__ col = j__ ).
          rhs__ = &3->get_element( i = j__ ).
          &1->add_to_element( i = i__ value = lhs__ * rhs__ ).
        endfor j__.
      endfor i__.
    end-of-definition.
    define veclen.
      n__ = zcl_vector=>ranks( &2 ).
      forx i__ 1 n__.
        rhs__ = &2->get_element( i = i__ ) ** 2.
        lhs__ = lhs__ + rhs__.
      endfor i__.
      &1 = sqrt( lhs__ ).
    end-of-definition.
    define scamat.
      preparem &1 <fs_x__> &2.
      n__ = &2->dimension( )-row.
      forx i__ 1 n__.
        forx j__ 1 n__.
          lhs__ = &2->get_element( row = i__ col = j__ ).
          &1->set_element( row = i__ col = j__ value = &3 * lhs__ ).
        endfor j__.
      endfor i__.
    end-of-definition.
    define matsub.
      preparem &1 <fs_x__> &2.
      n__ = &2->dimension( )-row.
      forx i__ 1 n__.
        forx j__ 1 n__.
          lhs__ = &2->get_element( row = i__ col = j__ ).
          rhs__ = &3->get_element( row = i__ col = j__ ).
          &1->set_element( row = i__ col = j__ value = lhs__ - rhs__  ).
        endfor j__.
      endfor i__.
    end-of-definition.
    define matmul.
      preparem &1 <fs_x__> &2.
      n__ = &2->dimension( )-row.
      forx i__ 1 n__.
        forx j__ 1 n__.
          forx k__ 1 n__.
            lhs__ = &2->get_element( row = i__ col = k__ ).
            rhs__ = &3->get_element( row = k__ col = j__ ).
            &1->add_to_element( row = i__ col = j__ value = lhs__ * rhs__ ).
          endfor k__.
        endfor j__.
      endfor i__.
    end-of-definition.
    define mateq.
      preparem &1 <fs_x__> &2.
      n__ = &2->dimension( )-row.
      forx i__ 1 n__.
        forx j__ 1 n__.
          &1->set_element( row = i__ col = j__ value = a->get_element( row = i__ col = j__ ) ).
        endfor j__.
      endfor i__.
    end-of-definition.
