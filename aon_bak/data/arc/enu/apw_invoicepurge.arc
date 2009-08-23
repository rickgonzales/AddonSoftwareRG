//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APW_INVOICEPURGE - Invoice Purge Work File
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0102
BEGIN
    NAME "win_apw_invoicepurge"
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
    
    STATICTEXT 02002, "AP Invoice Number:", 13, 34, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ap_inv_no"
    END
    
    INPUTE 03002, "", 130, 31, 130, 19
    BEGIN
        NAME "ine_ap_inv_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    STATICTEXT 02003, "Check Number:", 37, 55, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_check_no"
    END
    
    INPUTE 03003, "", 130, 52, 91, 19
    BEGIN
        NAME "ine_check_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
END

