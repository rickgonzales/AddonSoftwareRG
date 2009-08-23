//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// POE_INVDET - PO Invoice Detail
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0506 0228
BEGIN
    NAME "win_poe_invdet"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Número de pedido de compra:", 0, 13, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_no"
    END
    
    INPUTE 03001, "", 156, 10, 70, 19
    BEGIN
        NAME "ine_po_no"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02002, "Sequence Ref Number:", 21, 34, 132, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_int_seq_ref"
    END
    
    INPUTE 03002, "", 156, 31, 120, 19
    BEGIN
        NAME "ine_po_int_seq_ref"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 12
    END
    
    STATICTEXT 02003, "Purchase Order Line Number:", 0, 55, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_line_no"
    END
    
    INPUTE 03003, "", 156, 52, 35, 19
    BEGIN
        NAME "ine_po_line_no"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "000"
    END
    
    STATICTEXT 02004, "Receiver Number:", 50, 76, 103, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_receiver_no"
    END
    
    INPUTE 03004, "", 156, 73, 70, 19
    BEGIN
        NAME "ine_receiver_no"
        CLIENTEDGE
        READONLY
        NOT TABTRAVERSABLE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02005, "Purchase Order Line Code:", 0, 97, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_po_line_code"
    END
    
    INPUTE 03005, "", 156, 94, 35, 19
    BEGIN
        NAME "ine_po_line_code"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04005, "", 217, 98, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_po_line_code"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20005, "", 191, 94, 20, 19
    BEGIN
        NAME "tbnf_po_line_code"
    END
    
    STATICTEXT 02006, "Memo / Non-Stock Description:", 0, 118, 153, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_order_memo"
    END
    
    INPUTE 03006, "", 156, 115, 320, 19
    BEGIN
        NAME "ine_order_memo"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 40
    END
    
    STATICTEXT 02007, "Quantity Received:", 45, 139, 108, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_qty_received"
    END
    INPUTN 03007, "", 156, 136, 64, 19
    BEGIN
        NAME "inn_qty_received"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Unit Cost:", 95, 160, 58, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_unit_cost"
    END
    INPUTN 03008, "", 156, 157, 64, 19
    BEGIN
        NAME "inn_unit_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Extended Cost:", 64, 181, 89, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_ext_cost"
    END
    INPUTN 03009, "", 156, 178, 128, 19
    BEGIN
        NAME "inn_ext_cost"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        READONLY
        NOT TABTRAVERSABLE
        MASK "##############0-"
    END
END

