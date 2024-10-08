[[ARE_FINCHG.AENA]]
rem --- disable invoice type (should only be F for Finance Charge)
	wctl$=str(num(callpoint!.getTableColumnAttribute("ARE_FINCHG.INVOICE_TYPE","CTLI")):"00000")
	wmap$=callpoint!.getAbleMap()
	wpos=pos(wctl$=wmap$,8)
	wmap$(wpos+6,1)="I"
	callpoint!.setAbleMap(wmap$)
	callpoint!.setStatus("ABLEMAP")

[[ARE_FINCHG.ARNF]]
if num(stbl("+BATCH_NO"),err=*next)<>0
	rem --- Check if this record exists in a different batch
	tableAlias$=callpoint!.getAlias()
	primaryKey$=callpoint!.getColumnData("ARE_FINCHG.FIRM_ID")+
:		callpoint!.getColumnData("ARE_FINCHG.AR_TYPE")+
:		callpoint!.getColumnData("ARE_FINCHG.CUSTOMER_ID")+
:		callpoint!.getColumnData("ARE_FINCHG.AR_INV_NO")
	call stbl("+DIR_PGM")+"adc_findbatch.aon",tableAlias$,primaryKey$,Translate!,table_chans$[all],existingBatchNo$,status
	if status or existingBatchNo$<>"" then callpoint!.setStatus("NEWREC")
endif

[[ARE_FINCHG.AR_DIST_CODE.AVAL]]
rem --- Don't allow inactive code
	arcDistCode_dev=fnget_dev("ARC_DISTCODE")
	dim arcDistCode$:fnget_tpl$("ARC_DISTCODE")
	ar_dist_code$=callpoint!.getUserInput()
	read record(arcDistCode_dev,key=firm_id$+"D"+ar_dist_code$,dom=*next)arcDistCode$
	if arcDistCode.code_inactive$ = "Y"
		msg_id$="AD_CODE_INACTIVE"
		dim msg_tokens$[2]
		msg_tokens$[1]=cvs(arcDistCode.ar_dist_code$,3)
		msg_tokens$[2]=cvs(arcDistCode.code_desc$,3)
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif

[[ARE_FINCHG.AR_INV_NO.AVAL]]
rem --- Initialize new ar_inv_no
	ar_inv_no$=callpoint!.getUserInput()
	if cvs(ar_inv_no$,2)="" then
		if user_tpl.op_installed$="Y" then
			call stbl("+DIR_SYP")+"bas_sequences.bbj", "INVOICE_NO", invoice_no$, table_chans$[all]
		else
			call stbl("+DIR_SYP")+"bas_sequences.bbj", "AR_INV_NO", invoice_no$, table_chans$[all]
		endif
		callpoint!.setUserInput(invoice_no$)
		callpoint!.setColumnData("ARE_FINCHG.AR_INV_NO",invoice_no$,1)
	endif

rem --- check art-01 and be sure invoice# they've entered isn't in use for this cust.
rem --- otherwise, display the selected invoice...
rem --- note: this means it's possible to have same inv# assigned to diff customers
art_invhdr_dev=fnget_dev("ART_INVHDR")
dim art01a$:fnget_tpl$("ART_INVHDR")
invhdr_key$=firm_id$+"  "+callpoint!.getColumnData("ARE_FINCHG.CUSTOMER_ID")+callpoint!.getUserInput()
read(art_invhdr_dev,key=invhdr_key$,dom=*next)
readrecord(art_invhdr_dev,end=*next)art01a$
if art01a.firm_id$=firm_id$ and art01a.customer_id$=callpoint!.getColumnData("ARE_FINCHG.CUSTOMER_ID") and
:                     art01a.ar_inv_no$=callpoint!.getUserInput()
	msg_id$="AR_INV_USED"
	dim msg_tokens$[1]
	gosub disp_message
	callpoint!.setUserInput("")                            
	callpoint!.setStatus("ABORT")
	break
endif

[[ARE_FINCHG.AR_TERMS_CODE.AVAL]]
rem --- Don't allow inactive code
	arc_termcode_dev=fnget_dev("ARC_TERMCODE")
	dim arm10a$:fnget_tpl$("ARC_TERMCODE")
	ar_terms_code$=callpoint!.getUserInput()
	read record(arc_termcode_dev,key=firm_id$+"A"+ar_terms_code$,dom=*next)arm10a$
	if arm10a.code_inactive$ = "Y"
		msg_id$="AD_CODE_INACTIVE"
		dim msg_tokens$[2]
		msg_tokens$[1]=cvs(arm10a.ar_terms_code$,3)
		msg_tokens$[2]=cvs(arm10a.code_desc$,3)
		gosub disp_message
		callpoint!.setStatus("ABORT")
		break
	endif

user_tpl.disc_pct$=str(arm10a.disc_percent$)
user_tpl.inv_days_due$=str(arm10a.inv_days_due$)
user_tpl.disc_days$=str(arm10a.disc_days$)
user_tpl.prox_days$=arm10a.prox_or_days$
if num(callpoint!.getColumnData("ARE_FINCHG.INVOICE_AMT"))<>0
	wk_amt=round(num(callpoint!.getColumnData("ARE_FINCHG.INVOICE_AMT"))*num(user_tpl.disc_pct$)/100,2)
	callpoint!.setColumnData("ARE_FINCHG.DISCOUNT_AMT",str(wk_amt))
	callpoint!.setColumnUndoData("ARE_FINCHG.DISCOUNT_AMT",str(wk_amt))
	callpoint!.setStatus("REFRESH")
endif
if cvs(callpoint!.getColumnData("ARE_FINCHG.INVOICE_DATE"),2)<>""
	call stbl("+DIR_PGM")+"adc_duedate.aon",user_tpl.prox_days$,callpoint!.getColumnData("ARE_FINCHG.INVOICE_DATE"),
:                              num(user_tpl.inv_days_due$),wk_date_out$,status
	if status then callpoint!.setStatus("ABORT")
	callpoint!.setColumnData("ARE_FINCHG.INV_DUE_DATE",wk_date_out$)
	callpoint!.setColumnUndoData("ARE_FINCHG.INV_DUE_DATE",wk_date_out$)
	call stbl("+DIR_PGM")+"adc_duedate.aon",user_tpl.prox_days$,callpoint!.getColumnData("ARE_FINCHG.INVOICE_DATE"),
:                               num(user_tpl.disc_days$),wk_date_out$,status
	if status then callpoint!.setStatus("ABORT")
	callpoint!.setColumnData("ARE_FINCHG.DISC_DATE",wk_date_out$)
	callpoint!.setColumnUndoData("ARE_FINCHG.DISC_DATE",wk_date_out$)
	callpoint!.setStatus("REFRESH")

[[ARE_FINCHG.BEND]]
rem --- remove software lock on batch, if batching

	batch$=stbl("+BATCH_NO",err=*next)
	if num(batch$)<>0
		lock_table$="ADM_PROCBATCHES"
		lock_record$=firm_id$+stbl("+PROCESS_ID")+batch$
		lock_type$="X"
		lock_status$=""
		lock_disp$=""
		call stbl("+DIR_SYP")+"bac_lock_record.bbj",lock_table$,lock_record$,lock_type$,lock_disp$,rd_table_chan,table_chans$[all],lock_status$
	endif

[[ARE_FINCHG.BSHO]]
rem --- Open/Lock files
	files=8,begfile=1,endfile=files
	dim files$[files],options$[files],chans$[files],templates$[files]
	files$[1]="ARS_PARAMS";rem --- "ARS_PARAMS"..."ads-01"
	files$[2]="ARM_CUSTMAST";rem --- "arm-01"
	files$[3]="ARM_CUSTDET";rem --- "arm-02"
	files$[4]="ARC_TERMCODE";rem --- "arm-10" (A)
	files$[5]="ARC_DISTCODE";rem --- "arm-10 (D)
	files$[6]="ART_INVHDR";rem --- "art-01"
	files$[7]="GLS_PARAMS"
	files$[8]="GLS_CALENDAR"
	for wkx=begfile to endfile
		options$[wkx]="OTA"
	next wkx
	call stbl("+DIR_SYP")+"bac_open_tables.bbj",begfile,endfile,files$[all],options$[all],
:                                   chans$[all],templates$[all],table_chans$[all],batch,status$
	if status$<>"" then
		remove_process_bar:
		bbjAPI!=bbjAPI()
		rdFuncSpace!=bbjAPI!.getGroupNamespace()
		rdFuncSpace!.setValue("+build_task","OFF")
		release
	endif
	ars01_dev=num(chans$[1])
	gls01_dev=num(chans$[7])
	gls_calendar_dev=num(chans$[8])
	dim ars01a$:templates$[1],gls01a$:templates$[7],gls_calendar$:templates$[8]
rem --- Dimension miscellaneous string templates
	dim user_tpl$:"firm_id:c(2),op_installed:C(1),glyr:C(4),glper:C(2),no_glpers:C(2),"+
:	    "disc_pct:C(7),inv_days_due:C(7),disc_days:C(7),prox_days:C(1)"
	user_tpl.firm_id$=firm_id$
rem --- Retrieve parameter data/see if OP is installed
	call stbl("+DIR_PGM")+"adc_application.aon","OP",info$[all]
	op$=info$[20]
	user_tpl.op_installed$=op$
	ars01a_key$=firm_id$+"AR00"
	find record (ars01_dev,key=ars01a_key$,err=std_missing_params) ars01a$
	gls01a_key$=firm_id$+"GL00"
	find record (gls01_dev,key=gls01a_key$,err=std_missing_params) gls01a$ 
	find record (gls_calendar_dev,key=firm_id$+gls01a.current_year$,err=*next) gls_calendar$ 
	if cvs(gls_calendar.firm_id$,2)="" then
		msg_id$="AD_NO_FISCAL_CAL"
		dim msg_tokens$[1]
		msg_tokens$[1]=gls01a.current_year$
		gosub disp_message
		callpoint!.setStatus("EXIT")
		break
	endif
	user_tpl.glyr$=gls01a.current_year$
	user_tpl.glper$=gls01a.current_per$
	user_tpl.no_glpers$=gls_calendar.total_pers$

[[ARE_FINCHG.BTBL]]
rem --- Get Batch information

call stbl("+DIR_PGM")+"adc_getbatch.aon",callpoint!.getAlias(),"",table_chans$[all]
callpoint!.setTableColumnAttribute("ARE_FINCHG.BATCH_NO","PVAL",$22$+stbl("+BATCH_NO")+$22$)

[[ARE_FINCHG.CUSTOMER_ID.AVAL]]
rem "Customer Inactive Feature"
customer_id$=callpoint!.getUserInput()
arm01_dev=fnget_dev("ARM_CUSTMAST")
arm01_tpl$=fnget_tpl$("ARM_CUSTMAST")
dim arm01a$:arm01_tpl$
arm01a_key$=firm_id$+customer_id$
find record (arm01_dev,key=arm01a_key$,err=*break) arm01a$
if arm01a.cust_inactive$="Y" then
   call stbl("+DIR_PGM")+"adc_getmask.aon","CUSTOMER_ID","","","",m0$,0,customer_size
   msg_id$="AR_CUST_INACTIVE"
   dim msg_tokens$[2]
   msg_tokens$[1]=fnmask$(arm01a.customer_id$(1,customer_size),m0$)
   msg_tokens$[2]=cvs(arm01a.customer_name$,2)
   gosub disp_message
   callpoint!.setStatus("ACTIVATE")
endif

rem --- if on new rec, check are-02 and set default inv# to first one for this customer, if there is one.
if cvs(callpoint!.getColumnData("ARE_FINCHG.AR_INV_NO"),2)=""
	arm_custdet_dev=fnget_dev("ARM_CUSTDET")
	dim arm02a$:fnget_tpl$("ARM_CUSTDET")
	readrecord(arm_custdet_dev,key=firm_id$+callpoint!.getUserInput()+"  ",dom=*next)arm02a$
	if arm02a.firm_id$=firm_id$ and arm02a.customer_id$=callpoint!.getUserInput()
		callpoint!.setColumnData("ARE_FINCHG.AR_DIST_CODE",arm02a.ar_dist_code$)
		callpoint!.setColumnUndoData("ARE_FINCHG.AR_DIST_CODE",arm02a.ar_dist_code$)
		callpoint!.setColumnData("ARE_FINCHG.AR_TERMS_CODE",arm02a.ar_terms_code$)
		callpoint!.setColumnUndoData("ARE_FINCHG.AR_TERMS_CODE",arm02a.ar_terms_code$)
		callpoint!.setStatus("REFRESH")
	endif
endif

[[ARE_FINCHG.CUSTOMER_ID.BINQ]]
dim filter_defs$[0,1]
filter_defs$[0,0]="INVOICE_TYPE"
filter_defs$[0,1]="='F'"

[[ARE_FINCHG.INVOICE_AMT.AVAL]]
wk_amt=round(num(callpoint!.getUserInput())*num(user_tpl.disc_pct$)/100,2)
callpoint!.setColumnData("ARE_FINCHG.DISCOUNT_AMT",str(wk_amt))
callpoint!.setColumnUndoData("ARE_FINCHG.DISCOUNT_AMT",str(wk_amt))
callpoint!.setStatus("REFRESH")

[[ARE_FINCHG.INVOICE_DATE.AVAL]]
call stbl("+DIR_PGM")+"adc_duedate.aon",user_tpl.prox_days$,callpoint!.getUserInput(),num(user_tpl.inv_days_due$),
:                           wk_date_out$,status
if status then callpoint!.setStatus("ABORT")
callpoint!.setColumnData("ARE_FINCHG.INV_DUE_DATE",wk_date_out$)
callpoint!.setColumnUndoData("ARE_FINCHG.INV_DUE_DATE",wk_date_out$)
call stbl("+DIR_PGM")+"adc_duedate.aon",user_tpl.prox_days$,callpoint!.getUserInput(),num(user_tpl.disc_days$),
:                           wk_date_out$,status
if status then callpoint!.setStatus("ABORT")
callpoint!.setColumnData("ARE_FINCHG.DISC_DATE",wk_date_out$)
callpoint!.setColumnUndoData("ARE_FINCHG.DISC_DATE",wk_date_out$)
callpoint!.setStatus("REFRESH"  )

[[ARE_FINCHG.<CUSTOM>]]
#include [+ADDON_LIB]std_missing_params.aon
#include [+ADDON_LIB]std_functions.aon



