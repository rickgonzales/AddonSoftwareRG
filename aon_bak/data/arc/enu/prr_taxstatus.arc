//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// PRR_TAXSTATUS - Tax Status Report
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0100
BEGIN
    NAME "win_prr_taxstatus"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Priority Code:", 47, 13, 80, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_quarter"
    END
    
    INPUTE 03001, "", 130, 10, 35, 19
    BEGIN
        NAME "ine_quarter"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 1
    END
    
    STATICTEXT 02002, "Tax Code:", 68, 34, 59, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_tax_code"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_tax_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04002, "", 191, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_tax_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 165, 31, 20, 19
    BEGIN
        NAME "tbnf_tax_code"
    END
END

