[[ADM_RPTRCP_VEND.BSHO]]
rem  Initializations
	use ::ado_util.src::util

rem --- open files

	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="ADM_EMAIL_ACCT",open_opts$[1]="OTA"
	gosub open_tables

[[ADM_RPTRCP_VEND.DD_TABLE_ALIAS.AVAL]]
rem --- make sure selected alias is a "V" recipient type

	adm_rptctl_dev=fnget_dev("ADM_RPTCTL")
	dim adm_rptctl$:fnget_tpl$("ADM_RPTCTL")

	findrecord(adm_rptctl_dev,key=firm_id$+callpoint!.getUserInput(),dom=*next)adm_rptctl$
	if adm_rptctl.recipient_tp$<>"V" then callpoint!.setStatus("ABORT")

[[ADM_RPTRCP_VEND.DD_TABLE_ALIAS.BINQ]]
rem --- limit query rows to those for "V" recipient types

	dim filter_defs$[1,2]
	filter_defs$[1,0]="ADM_RPTCTL.RECIPIENT_TP"
	filter_defs$[1,1]="='V'"
	filter_defs$[1,2]="LOCK"

	dim search_defs$[3]

	call stbl("+DIR_SYP")+"bax_query.bbj",
:		gui_dev,
:		Form!,
:		"ADM_RPTCTL",
:		"BUILD",
:		table_chans$[all],
:		selected_key$,
:		filter_defs$[all],
:		search_defs$[all],
:		"",
:		""

	if selected_key$<>""
		call stbl("+DIR_SYP")+"bac_key_template.bbj",
:			"ADM_RPTCTL",
:			"PRIMARY",
:			admRptCtl_key$,
:			table_chans$[all],
:			status$
		dim admRptCtl_key$:admRptCtl_key$
		admRptCtl_key$=selected_key$
		callpoint!.setColumnData("ADM_RPTRCP_VEND.DD_TABLE_ALIAS",admRptCtl_key.dd_table_alias$,1)
	endif	

	callpoint!.setStatus("ACTIVATE-ABORT")

[[ADM_RPTRCP_VEND.EMAIL_BCC.AVAL]]
rem --- Validate email address
	email$=callpoint!.getUserInput()
	if !util.validEmailAddress(email) then
		callpoint!.setStatus("ABORT")
		break
	endif

[[ADM_RPTRCP_VEND.EMAIL_CC.AVAL]]
rem --- Validate email address
	email$=callpoint!.getUserInput()
	if !util.validEmailAddress(email) then
		callpoint!.setStatus("ABORT")
		break
	endif

[[ADM_RPTRCP_VEND.EMAIL_FROM.AVAL]]
rem --- Validate email address
	email$=callpoint!.getUserInput()
	if !util.validEmailAddress(email) then
		callpoint!.setStatus("ABORT")
		break
	endif

[[ADM_RPTRCP_VEND.EMAIL_REPLYTO.AVAL]]
rem --- Validate email address
	email$=callpoint!.getUserInput()
	if !util.validEmailAddress(email) then
		callpoint!.setStatus("ABORT")
		break
	endif

[[ADM_RPTRCP_VEND.EMAIL_TO.AVAL]]
rem --- Validate email address
	email$=callpoint!.getUserInput()
	if !util.validEmailAddress(email) then
		callpoint!.setStatus("ABORT")
		break
	endif

[[ADM_RPTRCP_VEND.EMAIL_YN.AVAL]]
rem --- if changing email checkbox to Y, get 'from' defaults from email account and 'to' defaults from vendor

	if callpoint!.getUserInput()="Y" and callpoint!.getColumnData("ADM_RPTRCP_VEND.EMAIL_YN")<>"Y"
		gosub set_defaults
	endif
 

[[ADM_RPTRCP_VEND.FAX_YN.AVAL]]
rem --- if changing fax checkbox to Y, set 'to' defaults from vendor

	if callpoint!.getUserInput()="Y" and callpoint!.getColumnData("ADM_RPTRCP_VEND.FAX_YN")<>"Y"
		gosub set_defaults
	endif

[[ADM_RPTRCP_VEND.<CUSTOM>]]
rem ==================================================
set_defaults:
rem ==================================================

	adm_email_acct=fnget_dev("ADM_EMAIL_ACCT")
	dim adm_email_acct$:fnget_tpl$("ADM_EMAIL_ACCT")

	adm_rptctl=fnget_dev("ADM_RPTCTL")
	dim adm_rptctl$:fnget_tpl$("ADM_RPTCTL")

	apm_emailfax=fnget_dev("APM_EMAILFAX")
	dim apm_emailfax$:fnget_tpl$("APM_EMAILFAX")

rem --- get ADM_RPTCTL record and Email Account record

	readrecord (adm_rptctl,key=firm_id$+callpoint!.getColumnData("ADM_RPTRCP_VEND.DD_TABLE_ALIAS"))adm_rptctl$

	readrecord(adm_email_acct,key=firm_id$+adm_rptctl.email_account$,dom=*next)adm_email_acct$


rem --- get default to, cc, bcc from cust email/fax tables

	vendor_id$=callpoint!.getColumnData("ADM_RPTRCP_VEND.VENDOR_ID")

	if cvs(vendor_id$,3)<>""
		readrecord (apm_emailfax,key=firm_id$+vendor_id$,dom=*next)apm_emailfax$
	endif
	rem --- set email or fax defaults depending on which box was checked

	if pos("EMAIL_YN"=callpoint!.getCallpointEvent())

		callpoint!.setColumnData("ADM_RPTRCP_VEND.EMAIL_SUBJECT",adm_rptctl.dflt_subject$,1)
		callpoint!.setColumnData("ADM_RPTRCP_VEND.EMAIL_MESSAGE",adm_rptctl.dflt_message$,1)

		if cvs(adm_rptctl.email_account$,3)<>""
			callpoint!.setColumnData("ADM_RPTRCP_VEND.EMAIL_FROM",adm_email_acct.email_from$,1)
			callpoint!.setColumnData("ADM_RPTRCP_VEND.EMAIL_REPLYTO",adm_email_acct.email_replyto$,1)
		endif

		if cvs(vendor_id$,3)<>""
			callpoint!.setColumnData("ADM_RPTRCP_VEND.EMAIL_TO",apm_emailfax.email_to$,1)
			callpoint!.setColumnData("ADM_RPTRCP_VEND.EMAIL_CC",apm_emailfax.email_cc$,1)
			callpoint!.setColumnData("ADM_RPTRCP_VEND.EMAIL_BCC",apm_emailfax.email_bcc$,1)
		endif

	endif

	if pos("FAX_YN"=callpoint!.getCallpointEvent())

		callpoint!.setColumnData("ADM_RPTRCP_VEND.FAX_SUBJECT",adm_rptctl.dflt_subject$,1)
		callpoint!.setColumnData("ADM_RPTRCP_VEND.FAX_MESSAGE",adm_rptctl.dflt_message$,1)

		if cvs(vendor_id$,3)<>""
			callpoint!.setColumnData("ADM_RPTRCP_VEND.FAX_TO",apm_emailfax.fax_to$,1)
			callpoint!.setColumnData("ADM_RPTRCP_VEND.FAX_NOS",apm_emailfax.fax_nos$,1)

		endif
	
	endif

	return



