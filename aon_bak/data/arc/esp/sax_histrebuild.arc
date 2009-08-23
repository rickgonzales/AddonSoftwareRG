//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// SAX_HISTREBUILD - Rebuild S/A from History
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0330 0294
BEGIN
    NAME "win_sax_histrebuild"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Sales Analysis Options", 156, 13, 121, 16
    BEGIN
        NOT OPAQUE
        NOT WORDWRAP
        NAME "txt_saop"
    END
    
    CHECKBOX 03002, "By Customer", 154, 31, 104, 19
    BEGIN
        NAME "cbx_by_customer"
        NOT OPAQUE
    END
    
    CHECKBOX 03003, "By Territory", 154, 52, 99, 19
    BEGIN
        NAME "cbx_by_territory"
        NOT OPAQUE
    END
    
    CHECKBOX 03004, "By Salesperson", 154, 73, 118, 19
    BEGIN
        NAME "cbx_by_salespsn"
        NOT OPAQUE
    END
    
    CHECKBOX 03005, "By Cust Type", 154, 94, 105, 19
    BEGIN
        NAME "cbx_by_customer_type"
        NOT OPAQUE
    END
    
    CHECKBOX 03006, "By Ship-To", 154, 115, 93, 19
    BEGIN
        NAME "cbx_by_shipto"
        NOT OPAQUE
    END
    
    CHECKBOX 03007, "By SIC", 154, 136, 65, 19
    BEGIN
        NAME "cbx_by_sic_code"
        NOT OPAQUE
    END
    
    CHECKBOX 03008, "By Product", 154, 157, 92, 19
    BEGIN
        NAME "cbx_by_product"
        NOT OPAQUE
    END
    
    CHECKBOX 03009, "By Warehouse", 154, 178, 111, 19
    BEGIN
        NAME "cbx_by_whse"
        NOT OPAQUE
    END
    
    CHECKBOX 03010, "By Vendor", 154, 199, 89, 19
    BEGIN
        NAME "cbx_by_vendor"
        NOT OPAQUE
    END
    
    CHECKBOX 03011, "By Dist Code", 154, 220, 103, 19
    BEGIN
        NAME "cbx_by_dist_code"
        NOT OPAQUE
    END
    
    CHECKBOX 03012, "By Non-Stock", 154, 241, 109, 19
    BEGIN
        NAME "cbx_by_nonstock"
        NOT OPAQUE
    END
END

