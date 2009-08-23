//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADM_PROCMASTER - Process Master File
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0400 0326
BEGIN
    NAME "win_adm_procmaster"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Process Identification:", 0, 13, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_process_id"
    END
    
    INPUTE 03001, "", 130, 10, 160, 19
    BEGIN
        NAME "ine_process_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 16
    END
    
    STATICTEXT 02002, "Description:", 56, 34, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_description"
    END
    
    INPUTE 03002, "", 130, 31, 240, 19
    BEGIN
        NAME "ine_description"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 30
    END
    
    STATICTEXT 02003, "Process Module ID:", 16, 55, 111, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_process_mod_id"
    END
    
    INPUTE 03003, "", 130, 52, 35, 19
    BEGIN
        NAME "ine_process_mod_id"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    CHECKBOX 03004, "Batched Process?", 128, 73, 131, 19
    BEGIN
        NAME "cbx_batch_entry"
        NOT OPAQUE
    END
    CHILD-WINDOW 1109 1109 5 0109
END
CHILD-WINDOW 1109 0390 0017
BEGIN
    BORDERLESS
    KEYBOARDNAVIGATION
    BACKGROUNDCOLOR RGB(248,248,248)
    EVENTMASK 62915588
    
    GRID 05900 "" 0 0 0388 100
    BEGIN
        NAME "grd_ADM_PROCDETAIL"
        CLIENTEDGE
        ROWHEAD 20, 05902
        ROWS 20
        COLUMNHEAD 18, 05901
        USERSIZE
        HORIZLINES
        HSCROLLBAR
        VERTLINES
        VSCROLLBAR
        GRIDROWDEFAULTHEIGHT 18
        COLUMNS 7
        GRIDCOLWIDTH 0,25
        GRIDCOLTITLE 0,""
        GRIDCOLWIDTH 1, 35
        GRIDCOLTITLE 1, "Firm ID"
        GRIDCOLWIDTH 2, 128
        GRIDCOLTITLE 2, "Table Alias"
        GRIDCOLWIDTH 3, 250
        GRIDCOLTITLE 3, "Description"
        GRIDCOLWIDTH 4, 192
        GRIDCOLTITLE 4, "Prog Name"
        GRIDCOLWIDTH 5, 240
        GRIDCOLTITLE 5, "Desc"
        GRIDCOLWIDTH 6, 35
        GRIDCOLTITLE 6, "Batch Creation?"
    END

END

