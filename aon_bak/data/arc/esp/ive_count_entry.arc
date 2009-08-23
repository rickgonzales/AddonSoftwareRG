//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// IVE_COUNT_ENTRY - Physical Count Entry
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0586 0249
BEGIN
    NAME "win_ive_count_entry"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Warehouse ID:", 70, 13, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04001, "", 217, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 191, 10, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02002, "Cycle Code:", 84, 34, 69, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_pi_cyclecode"
    END
    
    INPUTE 03002, "", 156, 31, 35, 19
    BEGIN
        NAME "ine_pi_cyclecode"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 04002, "", 217, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_pi_cyclecode"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 191, 31, 20, 19
    BEGIN
        NAME "tbnf_pi_cyclecode"
    END
    
    STATICTEXT 02003, "Physical Date:", 73, 55, 80, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cutoff_date"
    END
    
    INPUTD 03003, "", 156, 52, 85, 19
    BEGIN
        NAME "ind_cutoff_date"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        PLUSMINUS
    END
    
    STATICTEXT 02004, "Warehouse Location:", 31, 76, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_location"
    END
    
    INPUTE 03004, "", 156, 73, 100, 19
    BEGIN
        NAME "ine_location"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 10
    END
    
    GROUPBOX 19005, ". ", -4, 97, 2000, 1600
    BEGIN
        NOT OPAQUE
        NAME "ghl_item_id"
    END
    
    STATICTEXT 02005, "Inventory Item ID:", 50, 118, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_item_id"
    END
    
    INPUTE 03005, "", 156, 115, 260, 19
    BEGIN
        NAME "ine_item_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUUUUUUUUUUUU"
    END
    
    STATICTEXT 04005, "", 442, 119, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_item_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 416, 115, 20, 19
    BEGIN
        NAME "tbnf_item_id"
    END
    
    STATICTEXT 02006, "Lot/Serial Number:", 42, 139, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_lotser_no"
    END
    
    INPUTE 03006, "", 156, 136, 200, 19
    BEGIN
        NAME "ine_lotser_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 02007, "System Freeze Qty:", 42, 160, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_freeze_qty"
    END
    INPUTN 03007, "", 156, 157, 64, 19
    BEGIN
        NAME "inn_freeze_qty"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Count String:", 75, 181, 78, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_count_string"
    END
    
    INPUTE 03008, "", 156, 178, 400, 19
    BEGIN
        NAME "ine_count_string"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 50
    END
    
    STATICTEXT 02009, "Count Total:", 81, 202, 72, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_act_phys_cnt"
    END
    INPUTN 03009, "", 156, 199, 64, 19
    BEGIN
        NAME "inn_act_phys_cnt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
END

