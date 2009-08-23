//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SFR_WOVARIANCE - Closed WO Variance Report by Period
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0456 0270
BEGIN
    NAME "win_sfr_wovariance"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Report Sequence:", 55, 13, 102, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_report_seq"
    END
    
    LISTBUTTON 03001, "", 160, 10, 143, 300
    BEGIN
        NAME "lbx_report_seq"
        SELECTIONHEIGHT 19
        CLIENTEDGE
    END
    
    STATICTEXT 02002, "Warehouse ID:", 74, 34, 83, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_warehouse_id"
    END
    
    INPUTE 03002, "", 160, 31, 35, 19
    BEGIN
        NAME "ine_warehouse_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 04002, "", 221, 35, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_warehouse_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20002, "", 195, 31, 20, 19
    BEGIN
        NAME "tbnf_warehouse_id"
    END
    
    STATICTEXT 02003, "Beginning Work Order Type:", 0, 55, 157, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_type"
    END
    
    INPUTE 03003, "", 160, 52, 35, 19
    BEGIN
        NAME "ine_wo_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02004, "Ending Work Order Type:", 10, 76, 147, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_type"
    END
    
    INPUTE 03004, "", 160, 73, 35, 19
    BEGIN
        NAME "ine_wo_type"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 2
    END
    
    STATICTEXT 02005, "Beginning Work Order Number:", 0, 97, 157, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_no"
    END
    
    INPUTE 03005, "", 160, 94, 70, 19
    BEGIN
        NAME "ine_wo_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02006, "Ending Work Order Number:", 0, 118, 157, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_wo_no"
    END
    
    INPUTE 03006, "", 160, 115, 70, 19
    BEGIN
        NAME "ine_wo_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000000"
    END
    
    STATICTEXT 02007, "Beginning Customer ID:", 19, 139, 138, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03007, "", 160, 136, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04007, "", 246, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20007, "", 220, 136, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02008, "Ending Customer ID:", 36, 160, 121, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_customer_id"
    END
    
    INPUTE 03008, "", 160, 157, 60, 19
    BEGIN
        NAME "ine_customer_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 6
    END
    
    STATICTEXT 04008, "", 246, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_customer_id"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20008, "", 220, 157, 20, 19
    BEGIN
        NAME "tbnf_customer_id"
    END
    
    STATICTEXT 02009, "Beginning Bill Number:", 25, 181, 132, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_bill_no"
    END
    
    INPUTE 03009, "", 160, 178, 160, 19
    BEGIN
        NAME "ine_bill_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 04009, "", 346, 182, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_bill_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20009, "", 320, 178, 20, 19
    BEGIN
        NAME "tbnf_bill_no"
    END
    
    STATICTEXT 02010, "Ending Bill Number:", 43, 202, 114, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_bill_no"
    END
    
    INPUTE 03010, "", 160, 199, 160, 19
    BEGIN
        NAME "ine_bill_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
    
    STATICTEXT 04010, "", 346, 203, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_bill_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20010, "", 320, 199, 20, 19
    BEGIN
        NAME "tbnf_bill_no"
    END
    
    STATICTEXT 02011, "Period:", 117, 223, 40, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_period"
    END
    
    INPUTE 03011, "", 160, 220, 35, 19
    BEGIN
        NAME "ine_period"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
END

