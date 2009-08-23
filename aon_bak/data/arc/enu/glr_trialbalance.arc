//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLR_TRIALBALANCE - General Ledger Trial Balance
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0100
BEGIN
    NAME "win_glr_trialbalance"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Period:", 87, 13, 40, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pick_gl_per"
    END
    INPUTN 03001, "", 130, 10, 30, 19
    BEGIN
        NAME "inn_pick_gl_per"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "00"
    END
    
    STATICTEXT 02002, "Year:", 98, 34, 29, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pick_year"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_pick_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 4
    END
END

