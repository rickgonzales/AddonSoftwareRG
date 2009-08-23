//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APT_CHECKHISTORY - Check History Detail
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0270
BEGIN
    NAME "win_apt_checkhistory"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "AP Type:", 77, 13, 50, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_type"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_ap_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04001, "", 191, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ap_type"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 165, 10, 20, 19
    BEGIN
        NAME "tbnf_ap_type"
    END
    
    STATICTEXT 02002, "Check Number:", 37, 34, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_check_no"
    END
    
    INPUTE 03002, "", 130, 31, 91, 19
    BEGIN
        NAME "ine_check_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02003, "Vendor ID:", 66, 55, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03003, "", 130, 52, 78, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04003, "", 234, 56, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 208, 52, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
    END
    
    STATICTEXT 02004, "AP Invoice Number:", 13, 76, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_inv_no"
    END
    
    INPUTE 03004, "", 130, 73, 130, 19
    BEGIN
        NAME "ine_ap_inv_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02005, "Transaction Type:", 22, 97, 105, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_trans_type"
    END
    
    LISTBUTTON 03005, "", 130, 94, 97, 300
    BEGIN
        NAME "lbx_trans_type"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02006, "Distribution Code:", 20, 118, 107, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_dist_code"
    END
    
    INPUTE 03006, "", 130, 115, 35, 19
    BEGIN
        NAME "ine_ap_dist_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04006, "", 191, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_ap_dist_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20006, "", 165, 115, 20, 19
    BEGIN
        NAME "tbnf_ap_dist_code"
    END
    
    STATICTEXT 02007, "Check Date:", 58, 139, 69, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_check_date"
    END
    
    INPUTD 03007, "", 130, 136, 85, 19
    BEGIN
        NAME "ind_check_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PLUSMINUS
    END
    TOOLBUTTON 21007, "", 215, 136, 20, 19
    BEGIN
        NAME "tbnc_check_date"
    END
    
    STATICTEXT 02008, "Vendor Name:", 45, 160, 82, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_name"
    END
    
    INPUTE 03008, "", 130, 157, 240, 19
    BEGIN
        NAME "ine_vendor_name"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02009, "Invoice Amount:", 32, 181, 95, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_invoice_amt"
    END
    INPUTN 03009, "", 130, 178, 64, 19
    BEGIN
        NAME "inn_invoice_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Discount Amount:", 21, 202, 106, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_discount_amt"
    END
    INPUTN 03010, "", 130, 199, 64, 19
    BEGIN
        NAME "inn_discount_amt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Retention Amount:", 17, 223, 110, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_retention"
    END
    INPUTN 03011, "", 130, 220, 64, 19
    BEGIN
        NAME "inn_retention"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
END

