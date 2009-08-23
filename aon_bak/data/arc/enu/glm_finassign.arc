//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// GLM_FINASSIGN - Financial Report Assignments
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0426 0207
BEGIN
    NAME "win_glm_finassign"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "GL Account:", 56, 13, 71, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_account"
    END
    
    INPUTE 03001, "", 130, 10, 100, 19
    BEGIN
        NAME "ine_gl_account"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UUUUUUUUUU"
    END
    
    STATICTEXT 04001, "", 256, 14, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_account"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20001, "", 230, 10, 20, 19
    BEGIN
        NAME "tbnf_gl_account"
    END
    
    STATICTEXT 02002, "AssignmentNo:", 37, 118, 90, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_assign_no"
    END
    
    INPUTE 03002, "", 130, 115, 35, 19
    BEGIN
        NAME "ine_assign_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02003, "Report No:", 65, 139, 62, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_no"
    END
    
    INPUTE 03003, "", 130, 136, 35, 19
    BEGIN
        NAME "ine_gl_rpt_no"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 04003, "", 191, 140, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_rpt_no"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20003, "", 165, 136, 20, 19
    BEGIN
        NAME "tbnf_gl_rpt_no"
    END
    
    STATICTEXT 02004, "Line No:", 80, 160, 47, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_gl_rpt_line"
    END
    
    INPUTE 03004, "", 130, 157, 35, 19
    BEGIN
        NAME "ine_gl_rpt_line"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 04004, "", 191, 161, 200, 15
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "dis_gl_rpt_line"
        FOREGROUNDCOLOR RGB(0,0,96)
    END
    TOOLBUTTON 20004, "", 165, 157, 20, 19
    BEGIN
        NAME "tbnf_gl_rpt_line"
    END
END

