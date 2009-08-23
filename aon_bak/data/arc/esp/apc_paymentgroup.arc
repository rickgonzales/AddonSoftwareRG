//#charset: UTF-8

// Barista Application Framework - ASCII Resource File
// APC_PAYMENTGROUP - Payment Group
// Proprietary Information. BASIS International Ltd. All rights reserved.

VERSION "4.0"

WINDOW 1000 "Temporary Title" 10 40 0346 0100
BEGIN
    NAME "win_apc_paymentgroup"
    MANAGESYSCOLOR
    KEYBOARDNAVIGATION
    DIALOGBEHAVIOR
    EVENTMASK 1136656524
    INVISIBLE
    ENTERASTAB
    
    STATICTEXT 02001, "Grupo de pago:", 62, 13, 91, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_payment_grp"
    END
    
    INPUTE 03001, "", 156, 10, 35, 19
    BEGIN
        NAME "ine_payment_grp"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MASK "UU"
    END
    
    STATICTEXT 02002, "Descripción:", 80, 34, 73, 16
    BEGIN
        NOT OPAQUE
        JUSTIFICATION 32768
        NAME "txt_code_desc"
    END
    
    INPUTE 03002, "", 156, 31, 160, 19
    BEGIN
        NAME "ine_code_desc"
        CLIENTEDGE
        PASSENTER
        HIGHLIGHT
        PADCHARACTER 0
        MAXLENGTH 20
    END
END

