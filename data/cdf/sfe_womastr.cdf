[[SFE_WOMASTR.<CUSTOM>]]
disable_ctls:rem --- disable selected control
	for dctl=1 to looper
		dctl$=dctl$[dctl]
		if dctl$<>""
			wctl$=str(num(callpoint!.getTableColumnAttribute(dctl$,"CTLI")):"00000")
			wmap$=callpoint!.getAbleMap()
			wpos=pos(wctl$=wmap$,8)
			wmap$(wpos+6,1)=dmap$[dctl]
			callpoint!.setAbleMap(wmap$)
			callpoint!.setStatus("ABLEMAP")
		endif
	next dctl

	return

#include std_missing_params.src
[[SFE_WOMASTR.ARAR]]
rem --- Set new record flag

	callpoint!.setDevObject("new_rec","N")

rem --- Disable fields not allowed to be changed

	dim dctl$[21],dmap$[21]
	dctl$[1]="SFE_WOMASTR.ITEM_ID"
	dctl$[2]="SFE_WOMASTR.BILL_REV"
	dctl$[3]="SFE_WOMASTR.CUSTOMER_ID"
	dctl$[4]="SFE_WOMASTR.DESCRIPTION_01"
	dctl$[5]="SFE_WOMASTR.DESCRIPTION_02"
	dctl$[6]="SFE_WOMASTR.DRAWING_NO"
	dctl$[7]="SFE_WOMASTR.DRAWING_REV"
	dctl$[8]="SFE_WOMASTR.ESTCMP_DATE"
	dctl$[9]="SFE_WOMASTR.ESTSTT_DATE"
	dctl$[10]="SFE_WOMASTR.EST_YIELD"
	dctl$[11]="SFE_WOMASTR.FORECAST"
	dctl$[12]="SFE_WOMASTR.LINE_NO"
	dctl$[13]="SFE_WOMASTR.ORDER_NO"
	dctl$[14]="SFE_WOMASTR.PRIORITY"
	dctl$[15]="SFE_WOMASTR.SCH_PROD_QTY"
	dctl$[16]="SFE_WOMASTR.UNIT_MEASURE"
	dctl$[17]="SFE_WOMASTR.WAREHOUSE_ID"
	dctl$[18]="SFE_WOMASTR.WO_CATEGORY"
	dctl$[19]="SFE_WOMASTR.WO_NO"
	dctl$[20]="SFE_WOMASTR.WO_STATUS"
	dctl$[21]="SFE_WOMASTR.WO_TYPE"
	looper=21
	for x=1 to looper
		if callpoint!.getColumnData("SFE_WOMASTR.WO_STATUS")="C"
			dmap$[x]="I"
		else
			dmap$[x]=""
		endif
	next x
	gosub disable_ctls
[[SFE_WOMASTR.AREC]]
rem --- Set new record flag

	callpoint!.setDevObject("new_rec","Y")

rem --- set defaults

	ivs01_dev=fnget_dev("IVS_PARAMS")
	dim ivs01$:fnget_tpl$("IVS_PARAMS")
	read record (ivs01_dev,key=firm_id$+"IV00",dom=std_missing_params) ivs01$
	callpoint!.setColumnData("SFE_WOMASTR.WAREHOUSE_ID",ivs01.warehouse_id$)
	callpoint!.setColumnData("SFE_WOMASTR.OPENED_DATE",stbl("+SYSTEM_DATE"))
	callpoint!.setColumnData("SFE_WOMASTR.ESTSTT_DATE",stbl("+SYSTEM_DATE"))

rem --- enable all enterable fields

	dim dctl$[21],dmap$[21]
	dctl$[1]="SFE_WOMASTR.ITEM_ID"
	dctl$[2]="SFE_WOMASTR.BILL_REV"
	dctl$[3]="SFE_WOMASTR.CUSTOMER_ID"
	dctl$[4]="SFE_WOMASTR.DESCRIPTION_01"
	dctl$[5]="SFE_WOMASTR.DESCRIPTION_02"
	dctl$[6]="SFE_WOMASTR.DRAWING_NO"
	dctl$[7]="SFE_WOMASTR.DRAWING_REV"
	dctl$[8]="SFE_WOMASTR.ESTCMP_DATE"
	dctl$[9]="SFE_WOMASTR.ESTSTT_DATE"
	dctl$[10]="SFE_WOMASTR.EST_YIELD"
	dctl$[11]="SFE_WOMASTR.FORECAST"
	dctl$[12]="SFE_WOMASTR.LINE_NO"
	dctl$[13]="SFE_WOMASTR.ORDER_NO"
	dctl$[14]="SFE_WOMASTR.PRIORITY"
	dctl$[15]="SFE_WOMASTR.SCH_PROD_QTY"
	dctl$[16]="SFE_WOMASTR.UNIT_MEASURE"
	dctl$[17]="SFE_WOMASTR.WAREHOUSE_ID"
	dctl$[18]="SFE_WOMASTR.WO_CATEGORY"
	dctl$[19]="SFE_WOMASTR.WO_NO"
	dctl$[20]="SFE_WOMASTR.WO_STATUS"
	dctl$[21]="SFE_WOMASTR.WO_TYPE"
	looper=21
	gosub disable_ctls
[[SFE_WOMASTR.BSHO]]
rem --- Set new record flag

	callpoint!.setDevObject("new_rec","Y")

rem --- Open tables

	num_files=1
	dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
	open_tables$[1]="IVS_PARAMS",open_opts$[1]="OTA"
	gosub open_tables

[[SFE_WOMASTR.ITEM_ID.AINV]]
rem --- Item synonym processing

	call stbl("+DIR_PGM")+"ivc_itemsyn.aon::option_entry"
