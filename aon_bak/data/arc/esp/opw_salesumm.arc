//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPW_SALESUMM - Salesperson Summary
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0452 0100
BEGIN
    NAME "win_opw_salesumm"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Código de vendedor:", 30, 13, 123, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_slspsn_code"
    END
    
    INPUTE 03001, "", 156, 10, 39, 19
    BEGIN
        NAME "ine_slspsn_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04001, "", 221, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_slspsn_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 195, 10, 20, 19
    BEGIN
        NAME "tbnf_slspsn_code"
    END
    
    STATICTEXT 02002, "Monto de la factura:", 37, 34, 116, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_invoice_amt"
    END
    INPUTN 03002, "", 156, 31, 64, 19
    BEGIN
        NAME "inn_invoice_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

