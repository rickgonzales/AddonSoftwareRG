//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// ADE_EXECCTOT - Cost Totals Record
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 1383
BEGIN
    NAME "win_ade_execctot"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Four Digit Year [YYYY]:", 0, 13, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_full_year"
    END
    
    INPUTE 03001, "", 130, 10, 52, 19
    BEGIN
        NAME "ine_full_year"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "0000"
    END
    
    STATICTEXT 02002, "Month:", 87, 34, 40, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_month"
    END
    
    INPUTE 03002, "", 130, 31, 35, 19
    BEGIN
        NAME "ine_month"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "00"
    END
    
    STATICTEXT 02003, "Cost By Invoice Date:", 5, 55, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03003, "", 130, 52, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02004, "Cost By Invoice Date:", 5, 76, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03004, "", 130, 73, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02005, "Cost By Invoice Date:", 5, 97, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03005, "", 130, 94, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02006, "Cost By Invoice Date:", 5, 118, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03006, "", 130, 115, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02007, "Cost By Invoice Date:", 5, 139, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03007, "", 130, 136, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02008, "Cost By Invoice Date:", 5, 160, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03008, "", 130, 157, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02009, "Cost By Invoice Date:", 5, 181, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03009, "", 130, 178, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02010, "Cost By Invoice Date:", 5, 202, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03010, "", 130, 199, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02011, "Cost By Invoice Date:", 5, 223, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03011, "", 130, 220, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02012, "Cost By Invoice Date:", 5, 244, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03012, "", 130, 241, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02013, "Cost By Invoice Date:", 5, 265, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03013, "", 130, 262, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02014, "Cost By Invoice Date:", 5, 286, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03014, "", 130, 283, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02015, "Cost By Invoice Date:", 5, 307, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03015, "", 130, 304, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02016, "Cost By Invoice Date:", 5, 328, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03016, "", 130, 325, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02017, "Cost By Invoice Date:", 5, 349, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03017, "", 130, 346, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02018, "Cost By Invoice Date:", 5, 370, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03018, "", 130, 367, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02019, "Cost By Invoice Date:", 5, 391, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03019, "", 130, 388, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02020, "Cost By Invoice Date:", 5, 412, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03020, "", 130, 409, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02021, "Cost By Invoice Date:", 5, 433, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03021, "", 130, 430, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02022, "Cost By Invoice Date:", 5, 454, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03022, "", 130, 451, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02023, "Cost By Invoice Date:", 5, 475, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03023, "", 130, 472, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02024, "Cost By Invoice Date:", 5, 496, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03024, "", 130, 493, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02025, "Cost By Invoice Date:", 5, 517, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03025, "", 130, 514, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02026, "Cost By Invoice Date:", 5, 538, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03026, "", 130, 535, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02027, "Cost By Invoice Date:", 5, 559, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03027, "", 130, 556, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02028, "Cost By Invoice Date:", 5, 580, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03028, "", 130, 577, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02029, "Cost By Invoice Date:", 5, 601, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03029, "", 130, 598, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02030, "Cost By Invoice Date:", 5, 622, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03030, "", 130, 619, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02031, "Cost By Invoice Date:", 5, 643, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03031, "", 130, 640, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02032, "Cost By Invoice Date:", 5, 664, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03032, "", 130, 661, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02033, "Cost By Invoice Date:", 5, 685, 122, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_cost_inv_dte"
    END
    INPUTN 03033, "", 130, 682, 64, 19
    BEGIN
        NAME "inn_cost_inv_dte"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "######0-"
    END
    
    STATICTEXT 02034, "Number of Invoices by Inv Date:", 0, 706, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03034, "", 130, 703, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02035, "Number of Invoices by Inv Date:", 0, 727, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03035, "", 130, 724, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02036, "Number of Invoices by Inv Date:", 0, 748, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03036, "", 130, 745, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02037, "Number of Invoices by Inv Date:", 0, 769, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03037, "", 130, 766, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02038, "Number of Invoices by Inv Date:", 0, 790, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03038, "", 130, 787, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02039, "Number of Invoices by Inv Date:", 0, 811, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03039, "", 130, 808, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02040, "Number of Invoices by Inv Date:", 0, 832, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03040, "", 130, 829, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02041, "Number of Invoices by Inv Date:", 0, 853, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03041, "", 130, 850, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02042, "Number of Invoices by Inv Date:", 0, 874, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03042, "", 130, 871, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02043, "Number of Invoices by Inv Date:", 0, 895, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03043, "", 130, 892, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02044, "Number of Invoices by Inv Date:", 0, 916, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03044, "", 130, 913, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02045, "Number of Invoices by Inv Date:", 0, 937, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03045, "", 130, 934, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02046, "Number of Invoices by Inv Date:", 0, 958, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03046, "", 130, 955, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02047, "Number of Invoices by Inv Date:", 0, 979, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03047, "", 130, 976, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02048, "Number of Invoices by Inv Date:", 0, 1000, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03048, "", 130, 997, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02049, "Number of Invoices by Inv Date:", 0, 1021, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03049, "", 130, 1018, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02050, "Number of Invoices by Inv Date:", 0, 1042, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03050, "", 130, 1039, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02051, "Number of Invoices by Inv Date:", 0, 1063, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03051, "", 130, 1060, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02052, "Number of Invoices by Inv Date:", 0, 1084, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03052, "", 130, 1081, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02053, "Number of Invoices by Inv Date:", 0, 1105, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03053, "", 130, 1102, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02054, "Number of Invoices by Inv Date:", 0, 1126, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03054, "", 130, 1123, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02055, "Number of Invoices by Inv Date:", 0, 1147, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03055, "", 130, 1144, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02056, "Number of Invoices by Inv Date:", 0, 1168, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03056, "", 130, 1165, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02057, "Number of Invoices by Inv Date:", 0, 1189, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03057, "", 130, 1186, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02058, "Number of Invoices by Inv Date:", 0, 1210, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03058, "", 130, 1207, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02059, "Number of Invoices by Inv Date:", 0, 1231, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03059, "", 130, 1228, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02060, "Number of Invoices by Inv Date:", 0, 1252, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03060, "", 130, 1249, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02061, "Number of Invoices by Inv Date:", 0, 1273, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03061, "", 130, 1270, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02062, "Number of Invoices by Inv Date:", 0, 1294, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03062, "", 130, 1291, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02063, "Number of Invoices by Inv Date:", 0, 1315, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03063, "", 130, 1312, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
    
    STATICTEXT 02064, "Number of Invoices by Inv Date:", 0, 1336, 127, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_no_inv_bydt"
    END
    INPUTN 03064, "", 130, 1333, 40, 19
    BEGIN
        NAME "inn_no_inv_bydt"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        MASK "###0-"
    END
END

