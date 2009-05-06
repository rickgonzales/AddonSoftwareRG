[[OPE_ORDDET.AGCL]]
print "Det:AGCL"; rem debug

rem --- Set detail defaults and disabled columns

	callpoint!.setTableColumnAttribute("OPE_ORDDET.LINE_CODE","DFLT", user_tpl$.line_code$)
	callpoint!.setTableColumnAttribute("OPE_ORDDET.WAREHOUSE_ID","DFLT", user_tpl.warehouse_id$)

	rem debug
	print "line default: ", callpoint!.getTableColumnAttribute("OPE_ORDDET.LINE_CODE", "DFLT")
	print "whse default: ", callpoint!.getTableColumnAttribute("OPE_ORDDET.WAREHOUSE_ID", "DFLT")

	if user_tpl.skip_ln_code$ = "Y" then
		callpoint!.setColumnEnabled(-1, "OPE_ORDDET.LINE_CODE", 0)
		line_code$ = user_tpl$.line_code$
		gosub disable_by_linetype
	endif

	if user_tpl.skip_whse$ = "Y" then
		callpoint!.setColumnEnabled(-1, "OPE_ORDDET.WAREHOUSE_ID", 0)
		item$ = callpoint!.getColumnData("OPE_ORDDET.ITEM_ID")
		wh$   = user_tpl.warehouse_id$
		gosub set_avail	
	endif
[[OPE_ORDDET.AOPT-LENT]]
rem --- Save current row/column so we'll know where to set focus when we return from lot lookup

	declare BBjStandardGrid grid!
	grid! = util.getGrid(Form!)
	return_to_row = grid!.getSelectedRow()
	return_to_col = grid!.getSelectedColumn()

rem --- Go get Lot Numbers

	ivm_itemmast_dev = fnget_dev("IVM_ITEMMAST")
	dim ivm_itemmast$:fnget_tpl$("IVM_ITEMMAST")

	item$ = callpoint!.getColumnData("OPE_ORDDET.ITEM_ID")
	read record (ivm_itemmast_dev, key=firm_id$+item$, dom=*next) ivm_itemmast$

rem --- Is this item lot/serial?

	if ivm_itemmast.lotser_item$ = "Y" and ivm_itemmast.inventoried$ = "Y"
		rem callpoint!.setOptionEnabled("LENT",0); rem why?
		callpoint!.setDevObject("int_seq", callpoint!.getColumnData("OPE_ORDDET.INTERNAL_SEQ_NO"))
		callpoint!.setDevObject("wh",      callpoint!.getColumnData("OPE_ORDDET.WAREHOUSE_ID"))
		callpoint!.setDevObject("item",    callpoint!.getColumnData("OPE_ORDDET.ITEM_ID"))
		callpoint!.setDevObject("ord_qty", callpoint!.getColumnData("OPE_ORDDET.QTY_ORDERED"))

		ar_type$ = "  "
		cust$    = callpoint!.getDevObject("cust")
		order$   = callpoint!.getDevObject("order")
		int_seq$ = callpoint!.getDevObject("int_seq")

		if cvs(cust$,2) <> ""
			grid!.focus()
			dim dflt_data$[3,1]
			dflt_data$[1,0] = "AR_TYPE"
			dflt_data$[1,1] = ar_type$
			dflt_data$[2,0] = "CUSTOMER_ID"
			dflt_data$[2,1] = cust$
			dflt_data$[3,0] = "ORDER_NO"
			dflt_data$[3,1] = order$
			lot_pfx$ = firm_id$+ar_type$+cust$+order$+int_seq$

			call stbl("+DIR_SYP") + "bam_run_prog.bbj", 
:				"OPE_ORDLSDET", 
:				stbl("+USER_ID"), 
:				"MNT", 
:				lot_pfx$, 
:				table_chans$[all], 
:				dflt_data$[all]

rem --- return focus to where we were (Detail line grid)

			util.forceEdit(Form!, return_to_row, return_to_col)
		endif
	endif
[[OPE_ORDDET.BUDE]]
rem --- add and recommit Lot/Serial records (if any) and detail lines if not

	if callpoint!.getColumnData("OPE_ORDDET.COMMIT_FLAG")="Y"
		action$="CO"
		gosub uncommit_iv
	endif
[[OPE_ORDDET.AREC]]
print "Det:AREC"; rem debug

rem --- Disable skipped columns

	line_code$ = callpoint!.getColumnData("OPE_ORDDET.LINE_CODE")
	gosub disable_by_linetype

	rem debug
	print "line default: ", callpoint!.getTableColumnAttribute("OPE_ORDDET.LINE_CODE", "DFLT")
	print "whse default: ", callpoint!.getTableColumnAttribute("OPE_ORDDET.WAREHOUSE_ID", "DFLT")
[[OPE_ORDDET.BDEL]]
rem --- remove and uncommit Lot/Serial records (if any) and detail lines if not

	if callpoint!.getColumnData("OPE_ORDDET.COMMIT_FLAG")="Y"
		action$="UC"
		gosub uncommit_iv
	endif
[[OPE_ORDDET.UNIT_PRICE.AVEC]]
rem --- update header

	gosub calc_grid_tots
	gosub disp_totals
[[OPE_ORDDET.AGRN]]
print "Det:AGRN"; rem debug

rem --- Set Lot/Serial button up properly

	if pos(callpoint!.getDevObject("lotser_flag") = "LS") and 
:		num(callpoint!.getColumnData("OPE_ORDDET.QTY_ORDERED")) <> 0 
:	then 
		gosub lot_ser_check

		if lotted$ = "Y" 
			callpoint!.setOptionEnabled("LENT",1)
		else
			callpoint!.setOptionEnabled("LENT",0)
		endif
	endif
[[OPE_ORDDET.AGRE]]
print "Det:AGRE"; rem debug

rem --- Commit inventory: Inits

	callpoint!.setOptionEnabled("LENT",0)

	callpoint!.setDevObject("int_seq", callpoint!.getColumnData("OPE_ORDDET.INTERNAL_SEQ_NO"))
	callpoint!.setDevObject("wh",      callpoint!.getColumnData("OPE_ORDDET.WAREHOUSE_ID"))
	callpoint!.setDevObject("item",    callpoint!.getColumnData("OPE_ORDDET.ITEM_ID"))
	callpoint!.setDevObject("ord_qty", callpoint!.getColumnData("OPE_ORDDET.QTY_ORDERED"))

rem --- Is this row deleted?

	this_row = callpoint!.getValidationRow()

	if callpoint!.getGridRowModifyStatus(this_row)<>"Y"
		goto agre_end
	endif

rem --- Get current and prior values

	curr_whse$ = callpoint!.getColumnData("OPE_ORDDET.WAREHOUSE_ID")
	curr_item$ = callpoint!.getColumnData("OPE_ORDDET.ITEM_ID")
	curr_qty   = num(callpoint!.getColumnData("OPE_ORDDET.QTY_ORDERED"))

	prior_whse$ = callpoint!.getColumnDiskData("OPE_ORDDET.WAREHOUSE_ID")
	prior_item$ = callpoint!.getColumnDiskData("OPE_ORDDET.ITEM_ID")
	prior_qty   = num(callpoint!.getColumnDiskData("OPE_ORDDET.QTY_ORDERED"))

rem --- Has there been any change?

	if	curr_whse$<>prior_whse$ or 
:		curr_item$<>prior_item$ or 
:		curr_qty<>prior_qty 
:	then

rem --- Initialize inventory item update

		status=999
		call user_tpl.pgmdir$+"ivc_itemupdt.aon::init",err=*next,chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
		if status then exitto std_exit

rem --- Items or warehouses are different: uncommit previous

		if (prior_whse$<>"" and prior_whse$<>curr_whse$) or 
:		   (prior_item$<>"" and prior_item$<>curr_item$)
:		then

rem --- Uncommit prior item and warehouse

			if prior_whse$<>"" and prior_item$<>"" then
				items$[1]=prior_whse$
				items$[2]=prior_item$
				refs[0]=prior_qty
				
				call user_tpl.pgmdir$+"ivc_itemupdt.aon","UC",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
				if status then exitto std_exit
			endif

rem --- Commit quantity for current item and warehouse

			items$[1]=curr_whse$
			items$[2]=curr_item$
			refs[0]=curr_qty 
			call user_tpl.pgmdir$+"ivc_itemupdt.aon","CO",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
			if status then exitto std_exit

		endif

rem --- New record or item and warehouse haven't changed: commit difference

		if	(prior_whse$="" or prior_whse$=curr_whse$) and 
:			(prior_item$="" or prior_item$=curr_item$)
:		then

rem --- Commit quantity for current item and warehouse

			items$[1]=curr_whse$
			items$[2]=curr_item$
			refs[0]=curr_qty - prior_qty
			call user_tpl.pgmdir$+"ivc_itemupdt.aon","CO",chan[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
			if status then exitto std_exit

		endif

	endif

agre_end:
[[OPE_ORDDET.UNIT_COST.AVAL]]
rem --- Disable Cost field if there is a value in it
rem g!=form!.getChildWindow(1109).getControl(5900)
rem enable_color!=g!.getCellBackColor(0,0)
rem disable_color!=g!.getLineColor()

rem r=g!.getSelectedRow()
rem if num(callpoint!.getUserInput())=0
rem 	g!.setCellEditable(r,5,1)
rem	g!.setCellBackColor(r,5,enable_color!)
rem else
rem 	g!.setCellEditable(r,5,0)
rem 	g!.setCellBackColor(r,5,disable_color!)
rem endif
[[OPE_ORDDET.EXT_PRICE.AVEC]]
rem --- update header

	gosub calc_grid_tots
	gosub disp_totals
[[OPE_ORDDET.UNIT_PRICE.AVAL]]
rem --- See if this should be repriced
rem 	if num(callpoint!.getUserInput())<0
rem 		dim op_chans[6]
rem 		op_chans[1]=fnget_dev("IVM_ITEMMAST")
rem 		op_chans[2]=fnget_dev("IVM_ITEMWHSE")
rem 		op_chans[4]=fnget_dev("IVM_ITEMPRIC")
rem 		op_chans[5]=fnget_dev("ARS_PARAMS")
rem 		op_chans[6]=fnget_dev("IVS_PARAMS")
rem 		whs$=callpoint!.getColumnData("OPE_ORDDET.WAREHOUSE_ID")
rem 		item$=callpoint!.getColumnData("OPE_ORDDET.ITEM_ID")
rem 		listcd$=""
rem 		cust$=callpoint!.getColumnData("OPE_ORDDET.CUSTOMER_ID")
rem 		date$=user_tpl.order_date$
rem 		priccd$=user_tpl.price_code$
rem 		ordqty=num(callpoint!.getColumnData("OPE_ORDDET.QTY_ORDERED"))
rem 		type_price$=""
rem 		call stbl("+DIR_PGM")+"opc_pc.aon",op_chans[all],firm_id$,whs$,item$,listcd$,cust$,date$,priccd$,ordqty,type_price$,price,disc,status
rem 		callpoint!.setUserInput(str(price))
rem 	endif

rem --- Calc Extension

	newqty=num(callpoint!.getColumnData("OPE_ORDDET.QTY_ORDERED"))
	unit_price=num(callpoint!.getUserInput())
	new_ext_price=newqty*unit_price
	callpoint!.setColumnData("OPE_ORDDET.EXT_PRICE",str(new_ext_price))
	callpoint!.setStatus("MODIFIED-REFRESH")

rem --- update header

	gosub calc_grid_tots
	gosub disp_totals
[[OPE_ORDDET.AUDE]]
rem --- redisplay totals

	gosub calc_grid_tots
	gosub disp_totals
[[OPE_ORDDET.ADEL]]
rem --- redisplay totals

	gosub calc_grid_tots
	gosub disp_totals
[[OPE_ORDDET.WAREHOUSE_ID.AVAL]]
rem --- Set Available

	item$=callpoint!.getColumnData("OPE_ORDDET.ITEM_ID")
	wh$=callpoint!.getUserInput()
	gosub set_avail
[[OPE_ORDDET.QTY_BACKORD.BINP]]
rem --- Check row

	item$=callpoint!.getColumnData("OPE_ORDDET.ITEM_ID")
	wh$=callpoint!.getColumnData("OPE_ORDDET.WAREHOUSE_ID")
	gosub check_new_row
[[OPE_ORDDET.LINE_CODE.BINP]]
rem --- Check row

	item$ = callpoint!.getColumnData("OPE_ORDDET.ITEM_ID")
	wh$   = callpoint!.getColumnData("OPE_ORDDET.WAREHOUSE_ID")
	gosub check_new_row

rem --- Set previous

	user_tpl.prev_line_code$ = callpoint!.getColumnData("OPE_ORDDET.LINE_CODE")
[[OPE_ORDDET.WAREHOUSE_ID.BINP]]
rem --- Check new row

	item$=callpoint!.getColumnData("OPE_ORDDET.ITEM_ID")
	wh$=callpoint!.getColumnData("OPE_ORDDET.WAREHOUSE_ID")
	gosub check_new_row
[[OPE_ORDDET.ORDER_MEMO.BINP]]
rem --- Check row

	item$=callpoint!.getColumnData("OPE_ORDDET.ITEM_ID")
	wh$=callpoint!.getColumnData("OPE_ORDDET.WAREHOUSE_ID")
	gosub check_new_row
[[OPE_ORDDET.UNIT_COST.BINP]]
rem --- Check new row

	item$=callpoint!.getColumnData("OPE_ORDDET.ITEM_ID")
	wh$=callpoint!.getColumnData("OPE_ORDDET.WAREHOUSE_ID")
	gosub check_new_row
[[OPE_ORDDET.UNIT_PRICE.BINP]]
rem --- Check new row

	item$=callpoint!.getColumnData("OPE_ORDDET.ITEM_ID")
	wh$=callpoint!.getColumnData("OPE_ORDDET.WAREHOUSE_ID")
	gosub check_new_row
[[OPE_ORDDET.QTY_ORDERED.BINP]]
rem --- Check new row

	item$=callpoint!.getColumnData("OPE_ORDDET.ITEM_ID")
	wh$=callpoint!.getColumnData("OPE_ORDDET.WAREHOUSE_ID")
	gosub check_new_row
[[OPE_ORDDET.QTY_SHIPPED.BINP]]
rem --- Check new row

	item$=callpoint!.getColumnData("OPE_ORDDET.ITEM_ID")
	wh$=callpoint!.getColumnData("OPE_ORDDET.WAREHOUSE_ID")
	gosub check_new_row
[[OPE_ORDDET.EXT_PRICE.BINP]]
rem --- Check new row

	item$=callpoint!.getColumnData("OPE_ORDDET.ITEM_ID")
	wh$=callpoint!.getColumnData("OPE_ORDDET.WAREHOUSE_ID")
	gosub check_new_row
[[OPE_ORDDET.ITEM_ID.BINP]]
rem --- Check new row

	item$ = callpoint!.getColumnData("OPE_ORDDET.ITEM_ID")
	wh$   = callpoint!.getColumnData("OPE_ORDDET.WAREHOUSE_ID")
	gosub check_new_row

[[OPE_ORDDET.ITEM_ID.AVAL]]
rem --- Set available

	item$=callpoint!.getUserInput()
	wh$=callpoint!.getColumnData("OPE_ORDDET.WAREHOUSE_ID")
	gosub set_avail

rem --- Get unit cost

	ivm02_dev=fnget_dev("IVM_ITEMWHSE")
	dim ivm02a$:fnget_tpl$("IVM_ITEMWHSE")

	while 1
		readrecord(ivm02_dev,key=firm_id$+wh$+item$,dom=*break)ivm02a$
		callpoint!.setColumnData("OPE_ORDDET.UNIT_COST",str(ivm02a.unit_cost))
		break
	wend

	callpoint!.setStatus("REFRESH")

rem --- Set Lot/Serial button up properly

	gosub lot_ser_check

	if pos(callpoint!.getDevObject("lotser_flag") = "LS") and num(callpoint!.getColumnData("OPE_ORDDET.QTY_ORDERED")) <> 0
		if lotted$ = "Y"
			callpoint!.setOptionEnabled("LENT",1)
		else
			callpoint!.setOptionEnabled("LENT",0)
		endif
	endif

[[OPE_ORDDET.QTY_ORDERED.AVEC]]
rem --- Go get Lot/Serial Numbers if needed

	gosub calc_grid_tots
	gosub disp_totals

rem --- Set Lot/Serial button up properly

	gosub retrieve_row_data
	gosub lot_ser_check

	if pos(callpoint!.getDevObject("lotser_flag") = "LS") and cur_rec.qty_ordered <> 0 and lotted$ = "Y"
		callpoint!.setOptionEnabled("LENT",1)
	else
		callpoint!.setOptionEnabled("LENT",0)
	endif

[[OPE_ORDDET.ADIS]]
rem ---display extended price
	ordqty=num(rec_data.qty_ordered)
	unit_price=num(rec_data.unit_price)
	new_ext_price=ordqty*unit_price
	callpoint!.setColumnData("OPE_ORDDET.EXT_PRICE",str(new_ext_price))
	callpoint!.setStatus("MODIFIED-REFRESH")
[[OPE_ORDDET.AGDR]]
print "Det:AGDR"; rem debug

rem --- Disable skipped columns

	line_code$ = callpoint!.getColumnData("OPE_ORDDET.LINE_CODE")
	gosub disable_by_linetype

	print "Cost in array: ", callpoint!.getColumnData("OPE_ORDDET.UNIT_COST"); rem debug
	print "Cost on disk : ", callpoint!.getColumnDiskData("OPE_ORDDET.UNIT_COST"); rem debug
[[OPE_ORDDET.QTY_SHIPPED.AVAL]]
rem --- recalc quantities and extended price

	shipqty=num(callpoint!.getUserInput())
	ordqty=num(callpoint!.getColumnData("OPE_ORDDET.QTY_ORDERED"))

	if shipqty>ordqty
		callpoint!.setUserInput(str(user_tpl.line_shipqty))
		msg_id$="SHIP_EXCEEDS_ORD"
		gosub disp_message
		callpoint!.setStatus("ABORT-REFRESH")
	else
		callpoint!.setColumnData("OPE_ORDDET.QTY_BACKORD",str(ordqty-shipqty))
		unit_price=num(callpoint!.getColumnData("OPE_ORDDET.UNIT_PRICE"))
		new_ext_price=ordqty*unit_price
		callpoint!.setColumnData("OPE_ORDDET.EXT_PRICE",str(new_ext_price))
		callpoint!.setStatus("MODIFIED-REFRESH")
	endif

	user_tpl.line_shipqty=num(callpoint!.getUserInput())

rem --- update header

	gosub calc_grid_tots
	gosub disp_totals
[[OPE_ORDDET.QTY_ORDERED.AVAL]]
rem ---recalc quantities and extended price

	newqty=num(callpoint!.getUserInput())

	if num(callpoint!.getColumnData("OPE_ORDDET.UNIT_PRICE")) = 0
		qty_ord=num(callpoint!.getUserInput())
		gosub pricing
	endif

	callpoint!.setColumnData("OPE_ORDDET.QTY_BACKORD","0")
	callpoint!.setColumnData("OPE_ORDDET.QTY_SHIPPED",str(newqty))
	unit_price=num(callpoint!.getColumnData("OPE_ORDDET.UNIT_PRICE"))
	new_ext_price=newqty*unit_price
	callpoint!.setColumnData("OPE_ORDDET.EXT_PRICE",str(new_ext_price))
	callpoint!.setStatus("MODIFIED-REFRESH")

rem --- remove lot records if qty goes to 0

	gosub lot_ser_check

	if lotted$="Y" then
		rem do lotted logic
	endif

rem --- update header

	gosub calc_grid_tots
	gosub disp_totals
[[OPE_ORDDET.QTY_BACKORD.AVAL]]
rem ---recalc quantities and extended price

	boqty=num(callpoint!.getUserInput())
	ordqty=num(callpoint!.getColumnData("OPE_ORDDET.QTY_ORDERED"))

	if boqty>ordqty
		callpoint!.setUserInput(str(user_tpl.line_boqty))
		msg_id$="BO_EXCEEDS_ORD"
		gosub disp_message
		callpoint!.setStatus("ABORT-REFRESH")
	else
		shipqty=ordqty-boqty
		callpoint!.setColumnData("OPE_ORDDET.QTY_SHIPPED",str(shipqty))
		unit_price=num(callpoint!.getColumnData("OPE_ORDDET.UNIT_PRICE"))
		new_ext_price=ordqty*unit_price
		callpoint!.setColumnData("OPE_ORDDET.EXT_PRICE",str(new_ext_price))
		callpoint!.setStatus("MODIFIED-REFRESH")
	endif

	user_tpl.line_boqty=num(callpoint!.getUserInput())

rem --- update header

	gosub calc_grid_tots
	gosub disp_totals
[[OPE_ORDDET.<CUSTOM>]]
rem ==========================================================================
calc_grid_tots:
rem ==========================================================================

	recVect!=GridVect!.getItem(0)
	dim gridrec$:dtlg_param$[1,3]
	numrecs=recVect!.size()
	tamt=0

	if numrecs>0 then 

		for reccnt=0 to numrecs-1
			gridrec$=recVect!.getItem(reccnt)

			if cvs(gridrec$,3)<>"" then 
				if callpoint!.getGridRowDeleteStatus(reccnt)<>"Y" then 
					opc_linecode_dev=fnget_dev("OPC_LINECODE")
					dim opc_linecode$:fnget_tpl$("OPC_LINECODE")
					read record (opc_linecode_dev, key=firm_id$+gridrec.line_code$, dom=*next) opc_linecode$

					if pos(opc_linecode.line_code$="SPN")
						tamt=tamt+(gridrec.unit_price*gridrec.qty_ordered)
					else
						tamt=tamt+gridrec.ext_price
					endif
				endif
			endif
		next reccnt

		user_tpl.ord_tot=tamt
	endif

return

rem ==========================================================================
disp_totals: rem --- get context and ID of total amount display control, and redisplay w/ amts from calc_tots
rem ==========================================================================

	tamt!=UserObj!.getItem(num(user_tpl.ord_tot_1$))
	tamt!.setValue(user_tpl.ord_tot)

return

rem ==========================================================================
pricing: rem --- Call Pricing routine
rem ==========================================================================

	ivm02_dev=fnget_dev("IVM_ITEMWHSE")
	dim ivm02a$:fnget_tpl$("IVM_ITEMWHSE")

	ivs01_dev=fnget_dev("IVS_PARAMS")
	dim ivs01a$:fnget_tpl$("IVS_PARAMS")

	ordqty   = qty_ord
	wh$      = callpoint!.getColumnData("OPE_ORDDET.WAREHOUSE_ID")
	item$    = callpoint!.getColumnData("OPE_ORDDET.ITEM_ID")
	ar_type$ = callpoint!.getColumnData("OPE_ORDDET.AR_TYPE")
	cust$    = callpoint!.getColumnData("OPE_ORDDET.CUSTOMER_ID")
	ord$     = callpoint!.getColumnData("OPE_ORDDET.ORDER_NO")

	dim pc_files[6]
	pc_files[1]=fnget_dev("IVM_ITEMMAST")
	pc_files[2]=fnget_dev("IVM_ITEMWHSE")
	pc_files[3]=fnget_dev("IVM_ITEMPRIC")
	pc_files[4]=fnget_dev("IVC_PRICCODE")
	pc_files[5]=fnget_dev("ARS_PARAMS")
	pc_files[6]=ivs01_dev

	call stbl("+DIR_PGM")+"opc_pc.aon",pc_files[all],firm_id$,wh$,item$,user_tpl.price_code$,cust$,
:		user_tpl.order_date$,user_tpl.pricing_code$,ordqty,typeflag$,price,disc,status

	if price=0
		msg_id$="ENTER_PRICE"
		gosub disp_message
	else
		callpoint!.setColumnData("OPE_ORDDET.UNIT_PRICE",str(price))
		callpoint!.setColumnData("OPE_ORDDET.DISC_PERCENT",str(disc))
	endif

	if disc=100
		read record (ivm02_dev, key=firm_id$+wh$+item$) ivm02a$
		callpoint!.setColumnData("OPE_ORDDET.STD_LIST_PRC",str(ivm02a.cur_price))
	else
		read record (ivs01_dev, key=firm_id$+"IV00") ivs01a$
		precision  num(ivs01a.precision$)+3
		factor=100/(100-disc)
		precision num(ivs01a.precision$)
		callpoint!.setColumnData("OPE_ORDDET.STD_LIST_PRC",str(price*factor))
	endif

return

rem ==========================================================================
set_avail: rem --- set data in Availability window
rem ==========================================================================

	dim avail$[6]

	ivm01_dev=fnget_dev("IVM_ITEMMAST")
	dim ivm01a$:fnget_tpl$("IVM_ITEMMAST")

	ivm02_dev=fnget_dev("IVM_ITEMWHSE")
	dim ivm02a$:fnget_tpl$("IVM_ITEMWHSE")

	ivc_whcode_dev=fnget_dev("IVC_WHSECODE")
	dim ivm10c$:fnget_tpl$("IVC_WHSECODE")

	good_item$="N"
	start_block = 1

	if start_block then
		read record (ivm01_dev, key=firm_id$+item$, dom=*endif) ivm01a$
		read record (ivm02_dev, key=firm_id$+wh$+item$, dom=*endif) ivm02a$
		read record (ivc_whcode_dev, key=firm_id$+"C"+wh$, dom=*endif) ivm10c$
		good_item$="Y"
	endif

	if good_item$="Y"
		avail$[1]=str(ivm02a.qty_on_hand)
		avail$[2]=str(ivm02a.qty_commit)
		avail$[3]=str(ivm02a.qty_on_hand-ivm02a.qty_commit)
		avail$[4]=str(ivm02a.qty_on_order)
		avail$[5]=ivm10c.short_name$
		avail$[6]=ivm01a.item_type$

		userObj!.getItem(num(user_tpl.avail_oh$)).setText(avail$[1])
		userObj!.getItem(num(user_tpl.avail_comm$)).setText(avail$[2])
		userObj!.getItem(num(user_tpl.avail_avail$)).setText(avail$[3])
		userObj!.getItem(num(user_tpl.avail_oo$)).setText(avail$[4])
		userObj!.getItem(num(user_tpl.avail_wh$)).setText(avail$[5])
		userObj!.getItem(num(user_tpl.avail_type$)).setText(avail$[6])

		opc_linecode_dev=fnget_dev("OPC_LINECODE")
		dim opc_linecode$:fnget_tpl$("OPC_LINECODE")

		if start_block then
			dropship_idx = num(user_tpl.dropship_flag$)
			userObj!.getItem(dropship_idx).setText("")

			line_code$ = callpoint!.getColumnData("OPE_ORDDET.LINE_CODE")
			read record (opc_linecode_dev, key=firm_id$+line_code$, dom=*endif) opc_linecode$

			if opc_linecode.dropship$="Y"
				userObj!.getItem(dropship_idx).setText("**Drop Ship**")
			endif
		endif

	endif

return

rem ==========================================================================
clear_avail: rem --- Clear Availability Window
rem ==========================================================================

	userObj!.getItem(num(user_tpl.avail_oh$)).setText("")
	userObj!.getItem(num(user_tpl.avail_comm$)).setText("")
	userObj!.getItem(num(user_tpl.avail_avail$)).setText("")
	userObj!.getItem(num(user_tpl.avail_oo$)).setText("")
	userObj!.getItem(num(user_tpl.avail_wh$)).setText("")
	userObj!.getItem(num(user_tpl.avail_type$)).setText("")
	userObj!.getItem(num(user_tpl.dropship_flag$)).setText("")

return

rem ==========================================================================
check_new_row: rem --- Check to see if we're on a new row
rem ==========================================================================

	myGrid! = userObj!.getItem(0)
	currRow = myGrid!.getSelectedRow()

	if currRow <> user_tpl.cur_row
		gosub clear_avail
		user_tpl.cur_row = currRow
		gosub set_avail
	endif

return

rem ==========================================================================
lot_ser_check: rem --- Check for lotted item
               rem     OUT: lotted$ - Y/N
               rem          setDevObject - int_seq, wh, item
rem ==========================================================================

	lotted$="N"
	ivm01_dev=fnget_dev("IVM_ITEMMAST")
	dim ivm01a$:fnget_tpl$("IVM_ITEMMAST")

	currow   = callpoint!.getValidationRow()
	new_rec$ = callpoint!.getGridRowNewStatus(currow)
	curVect! = gridVect!.getItem(0)
	dim cur_rec$:dtlg_param$[1,3]
	cur_rec$ = curVect!.getItem(currow)

	if pos(callpoint!.getDevObject("lotser_flag") = "LS") then 
		if new_rec$<>"Y"
			item_id$ = cur_rec.item_id$
		else
			item_id$ = callpoint!.getUserInput()
		endif

		start_block = 1

		if start_block then
			read record (ivm01_dev, key=firm_id$+item_id$, dom=*endif) ivm01a$

			if ivm01a.lotser_item$="Y" and ivm01a.inventoried$="Y" then
				lotted$="Y"
				callpoint!.setDevObject("int_seq",callpoint!.getColumnData("OPE_ORDDET.INTERNAL_SEQ_NO"))
				callpoint!.setDevObject("wh",cur_rec.warehouse_id$)
				callpoint!.setDevObject("item",item_id$)
			endif
		endif
	endif

return

rem ==========================================================================
retrieve_row_data:
rem ==========================================================================

	currow=callpoint!.getValidationRow()

	mod_stat$=callpoint!.getGridRowModifyStatus(currow)
	new_stat$=callpoint!.getGridRowNewStatus(currow)

	curVect!=gridVect!.getItem(0)
	dim cur_rec$:dtlg_param$[1,3]
	cur_rec$=curVect!.getItem(currow)

	undoVect!=gridVect!.getItem(1)
	dim undo_rec$:dtlg_param$[1,3]
	undo_rec$=curVect!.getItem(currow)

	diskVect!=gridVect!.getItem(2)
	dim disk_rec$:dtlg_param$[1,3]
	disk_rec$=curVect!.getItem(currow)

return

rem ==========================================================================
uncommit_iv: rem --- Uncommit Inventory
rem              --- Make sure action$ is set before entry
rem ==========================================================================

	ivm_itemmast_dev=fnget_dev("IVM_ITEMMAST")
	dim ivm_itemmast$:fnget_tpl$("IVM_ITEMMAST")

	ope_ordlsdet_dev=fnget_dev("OPE_ORDLSDET")
	dim ope_ordlsdet$:fnget_tpl$("OPE_ORDLSDET")

	cust$    = callpoint!.getDevObject("cust")
	ar_type$ = callpoint!.getDevObject("ar_type")
	order$   = callpoint!.getDevObject("order")

	seq$    = callpoint!.getColumnData("OPE_ORDDET.INTERNAL_SEQ_NO")
	wh$     = callpoint!.getColumnData("OPE_ORDDET.WAREHOUSE_ID")
	item$   = callpoint!.getColumnData("OPE_ORDDET.ITEM_ID")
	ord_qty = num(callpoint!.getColumnData("OPE_ORDDET.QTY_ORDERED"))

	call stbl("+DIR_PGM")+"ivc_itemupdt.aon::init",channels[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
	read record (ivm_itemmast_dev, key=firm_id$+item$, dom=*next) ivm_itemmast$

	items$[1]=wh$
	items$[2]=item$
	refs[0]=ord_qty

	if ivm_itemmast.lotser_item$<>"Y" or ivm_itemmast.inventoried$<>"Y" then
		call stbl("+DIR_PGM")+"ivc_itemupdt.aon",action$,channels[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
	else
		found_lot=0
		read (ope_ordlsdet_dev, key=firm_id$+ar_type$+cust$+order$+seq$, dom=*next)

		while 1
			read record (ope_ordlsdet_dev, end=*break) ope_ordlsdet$
			if pos(firm_id$+ar_type$+cust$+order$+seq$=ope_ordlsdet$)<>1 then break
			items$[3] = ope_ordlsdet.lotser_no$
			refs[0]   = ope_ordlsdet.qty_ordered
			call "ivc_itemupdt.aon",action$,channels[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
			remove (ope_ordlsdet_dev, key=firm_id$+ar_type$+cust$+order$+seq$+ope_ordlsdet.sequence_no$)
			found_lot=1
		wend

		if found_lot=0
			call stbl("+DIR_PGM")+"ivc_itemupdt.aon",action$,channels[all],ivs01a$,items$[all],refs$[all],refs[all],table_chans$[all],status
		endif
	endif

return

rem ==========================================================================
disable_linecode_whse: rem --- Disable line code and warehouse columns
                       rem --- These come from parameters and POS records
rem *** DEPRECATED ***
rem ==========================================================================

	if user_tpl.skip_ln_code$ = "Y" then
		print "Disable line code..."; rem debug
		callpoint!.setColumnEnabled("OPE_ORDDET.LINE_CODE", 0)
	endif

	if user_tpl.skip_whse$ = "Y" then
		print "Disable warehouse..."; rem debug
		callpoint!.setColumnEnabled("OPE_ORDDET.WAREHOUSE_ID", 0)
	endif

return

rem ==========================================================================
disable_by_linetype: rem --- Set enable/disable based on line type
                     rem --- These work from the CALLPOINT enable in the form
                     rem      IN: line_code$
rem ==========================================================================

	start_block = 1

	if cvs(line_code$,2) <> "" then
		file$ = "OPC_LINECODE"
		dim opc_linecode$:fnget_tpl$(file$)

		if start_block then
			read record (fnget_dev(file$), key=firm_id$+line_code$, dom=*endif) opc_linecode$
			callpoint!.setStatus("ENABLE:"+opc_linecode.line_type$)
		endif
	endif

return

rem ==========================================================================
#include std_missing_params.src
rem ==========================================================================

rem ==========================================================================
rem 	Use util object
rem ==========================================================================

	use ::ado_util.src::util
[[OPE_ORDDET.LINE_CODE.AVAL]]
rem --- Set enable/disable based on line type

	line_code$ = callpoint!.getUserInput()
	gosub disable_by_linetype

rem --- Has line code changed?

	if line_code$ <> user_tpl.prev_line_code$ then
		callpoint!.setColumnData("OPE_ORDDET.MAN_PRICE", "")
		callpoint!.setColumnData("OPE_ORDDET.PRODUCT_TYPE", "")
		callpoint!.setColumnData("OPE_ORDDET.ORDER_MEMO", "")
		callpoint!.setColumnData("OPE_ORDDET.COMMIT_FLAG", "Y"); rem why?
		callpoint!.setColumnData("OPE_ORDDET.VENDOR_ID", "")
		callpoint!.setColumnData("OPE_ORDDET.DROPSHIP", "")
		callpoint!.setColumnData("OPE_ORDDET.UNIT_COST", "0")
		callpoint!.setColumnData("OPE_ORDDET.UNIT_PRICE", "0")
		callpoint!.setColumnData("OPE_ORDDET.QTY_ORDERED", "0")
		callpoint!.setColumnData("OPE_ORDDET.QTY_BACKORD", "0")
		callpoint!.setColumnData("OPE_ORDDET.QTY_SHIPPED", "0")
		callpoint!.setColumnData("OPE_ORDDET.STD_LIST_PRC", "0")
		callpoint!.setColumnData("OPE_ORDDET.EXT_PRICE", "0")
		callpoint!.setColumnData("OPE_ORDDET.TAXABLE_AMT", "0")
		callpoint!.setColumnData("OPE_ORDDET.DISC_PERCENT", "0")
		callpoint!.setColumnData("OPE_ORDDET.COMM_PERCENT", "0")
		callpoint!.setColumnData("OPE_ORDDET.COMM_AMT", "0")
	endif
