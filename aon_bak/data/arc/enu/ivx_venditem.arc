//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVX_VENDITEM - Vendor/Item
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0440 0100
BEGIN
    NAME "win_ivx_venditem"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Vendor ID:", 66, 13, 61, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_vendor_id"
    END
    
    INPUTE 03001, "", 130, 10, 78, 19
    BEGIN
        NAME "ine_vendor_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUU"
    END
    
    STATICTEXT 04001, "", 234, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_vendor_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 208, 10, 20, 19
    BEGIN
        NAME "tbnf_vendor_id"
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
END

