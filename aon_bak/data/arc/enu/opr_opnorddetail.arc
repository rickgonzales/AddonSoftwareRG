//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// OPR_OPNORDDETAIL - Open Order Detail Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0317
BEGIN
    NAME "win_opr_opnorddetail"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Beginning Customer ID:", 0, 13, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03001, "", 130, 10, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04001, "", 216, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 190, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02002, "Ending Customer ID:", 6, 34, 121, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03002, "", 130, 31, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04002, "", 216, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 190, 31, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02003, "Beginning Order Date:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_date"
    END
    
    INPUTD 03003, "", 130, 52, 85, 19
    BEGIN
        NAME "ind_order_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21003, "", 215, 52, 20, 19
    BEGIN
        NAME "tbnc_order_date"
    END
    
    STATICTEXT 02004, "Ending Order Date:", 15, 76, 112, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_date"
    END
    
    INPUTD 03004, "", 130, 73, 85, 19
    BEGIN
        NAME "ind_order_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21004, "", 215, 73, 20, 19
    BEGIN
        NAME "tbnc_order_date"
    END
    
    STATICTEXT 02005, "Order Taken By:", 34, 97, 93, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ord_taken_by"
    END
    
    INPUTE 03005, "", 130, 94, 160, 19
    BEGIN
        NAME "ine_ord_taken_by"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    STATICTEXT 02006, "Salesperson:", 53, 118, 74, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_salesperson"
    END
    
    INPUTE 03006, "", 130, 115, 39, 19
    BEGIN
        NAME "ine_salesperson"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUU"
    END
    
    STATICTEXT 04006, "", 195, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_salesperson"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 169, 115, 20, 19
    BEGIN
        NAME "tbnf_salesperson"
    END
    
    STATICTEXT 02007, "Print Status:", 57, 139, 70, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_print_uprint_all"
    END
    
    LISTBUTTON 03007, "", 130, 136, 89, 300
    BEGIN
        NAME "lbx_print_uprint_all"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03008, "Open?", 128, 157, 67, 19
    BEGIN
        NAME "cbx_open"
        NOT OPAQUE
    END
    
    CHECKBOX 03009, "Quoted?", 128, 178, 79, 19
    BEGIN
        NAME "cbx_quoted"
        NOT OPAQUE
    END
    
    CHECKBOX 03010, "Backorders?", 128, 199, 101, 19
    BEGIN
        NAME "cbx_backorders"
        NOT OPAQUE
    END
    
    CHECKBOX 03011, "Credit?", 128, 220, 71, 19
    BEGIN
        NAME "cbx_credit"
        NOT OPAQUE
    END
    
    CHECKBOX 03012, "Non Stock?", 128, 241, 94, 19
    BEGIN
        NAME "cbx_non_stock"
        NOT OPAQUE
    END
    
    STATICTEXT 02013, "Non stock Option:", 21, 265, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_non_stock_option"
    END
    
    LISTBUTTON 03013, "", 130, 262, 163, 300
    BEGIN
        NAME "lbx_non_stock_option"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
END

