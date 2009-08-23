//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ARX_CHANGESAFLAG - Change Sales Analysis Flag
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0126
BEGIN
    NAME "win_arx_changesaflag"
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
    
    INPUTE 03001, "", 130, 10, 48, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04001, "", 204, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 178, 10, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02002, "Ending Customer ID:", 6, 34, 121, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03002, "", 130, 31, 48, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04002, "", 204, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 178, 31, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02003, "New Sales Analysis Flag:", 0, 55, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pick_listbutton"
    END
    
    LISTBUTTON 03003, "", 130, 52, 113, 300
    BEGIN
        NAME "lbx_pick_listbutton"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    CHECKBOX 03004, "Overwrite old flag?", 128, 73, 140, 19
    BEGIN
        NAME "cbx_pick_check"
        NOT OPAQUE
    END
END

