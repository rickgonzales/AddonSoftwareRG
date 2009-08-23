//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPR_ODERSTATITEM - Order Status Report By Item
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0123
BEGIN
    NAME "win_opr_oderstatitem"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Product Type:", 46, 13, 81, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_product_type"
    END
    
    INPUTE 03001, "", 130, 10, 39, 19
    BEGIN
        NAME "ine_product_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04001, "", 195, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_product_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 169, 10, 20, 19
    BEGIN
        NAME "tbnf_product_type"
    END
    
    STATICTEXT 02002, "Options:", 77, 34, 50, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_options"
    END
    
    LISTBUTTON 03002, "", 130, 31, 136, 300
    BEGIN
        NAME "lbx_options"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02003, "Summary or Detail:", 16, 55, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_summary_detail"
    END
    
    LISTBUTTON 03003, "", 130, 52, 85, 300
    BEGIN
        NAME "lbx_summary_detail"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02004, "Warehouse:", 59, 76, 68, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03004, "", 130, 73, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04004, "", 191, 77, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 165, 73, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
END

