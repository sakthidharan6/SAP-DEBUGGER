CLASS zcl_01_debugger DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_01_debugger IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    CONSTANTS: loan_total      TYPE p DECIMALS 2 VALUE '5000.00',
               spec_repay_mode TYPE c LENGTH 1 VALUE 'Q',

               repayment_month TYPE p DECIMALS 2 VALUE '500.00'.

    DATA: loan_remaining TYPE p DECIMALS 2,
          repayment_plan TYPE TABLE OF string.

    loan_remaining = loan_total.

    CASE spec_repay_mode.
      WHEN 'Q'.
        DO.
          loan_remaining = loan_remaining - repayment_month.
          APPEND |Paid. Remaining balance is now: { loan_remaining } EUR| TO repayment_plan.
          IF loan_remaining <= 0.
            EXIT.
          ENDIF.
        ENDDO.
      WHEN OTHERS.
        out->write('Unknown repayment mode.').
    ENDCASE.

    out->write( '--- Final Repayment Plan ---' ).
    out->write( data = repayment_plan ).
  ENDMETHOD.
ENDCLASS.
