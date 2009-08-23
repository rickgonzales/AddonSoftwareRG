//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPT_LSTPRICE - Last Price by Customer/Item
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0440 0123
BEGIN
    NAME "win_opt_lstprice"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Customer ID:", 50, 13, 77, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03001, "", 130, 10, 78, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04001, "", 234, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 208, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02002, "Inventory Item ID:", 24, 34, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03002, "", 130, 31, 260, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04002, "", 416, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 390, 31, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02003, "Unit Price:", 68, 55, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_price"
    END
    INPUTN 03003, "", 130, 52, 64, 19
    BEGIN
        NAME "inn_unit_price"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02004, "Unit Cost:", 69, 76, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_cost"
    END
    INPUTN 03004, "", 130, 73, 64, 19
    BEGIN
        NAME "inn_unit_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

