[[GLS_COLUMNS.<CUSTOM>]]
find_code:
	list_size=codeList!.size()
	list_row=-1
	if list_size<>0
		for wk=0 to list_size-1
			if pos(cd_tp$=codeList!.getItem(wk))<>0 list_row=wk
		next wk
		if list_row=-1 list_row=0
	endif
return


#include std_missing_params.src
[[GLS_COLUMNS.BSHO]]
num_files=2
dim open_tables$[1:num_files],open_opts$[1:num_files],open_chans$[1:num_files],open_tpls$[1:num_files]
open_tables$[1]="GLS_PARAMS",open_opts$[1]="OTA"
open_tables$[2]="GLM_RECORDTYPES",open_opts$[2]="OTA"
gosub open_tables

gls01_dev=num(open_chans$[1])
glm18_dev=num(open_chans$[2])

dim gls01a$:open_tpls$[1]
dim glm18a$:open_tpls$[2]

readrecord(gls01_dev,key=firm_id$+"GL00",dom=std_missing_params)gls01a$

rem create list for column zero of grid -- column type drop-down
more=1
codeList!=SysGUI!.makeVector()
codes!=SysGUI!.makeVector()
read(glm18_dev,key="",dom=*next)
while more
	readrecord(glm18_dev,end=*break)glm18a$
	codeList!.addItem(glm18a.rev_title$+"("+glm18a.record_id$+glm18a.amt_or_units$+")")
	codes!.addItem(glm18a.record_id$+glm18a.amt_or_units$)
wend

codeList!.insertItem(0,"(none)")

for x=1 to 4
	wk_id$=callpoint!.getTableColumnAttribute("<<DISPLAY>>.RECORD_CD_"+str(x),"CTLI")
	wk_ctl!=Form!.getControl(num(wk_id$))
	wk_ctl!.insertItems(0,codeList!)
next x

for x=1 to 4
	wk_id$=callpoint!.getTableColumnAttribute("<<DISPLAY>>.BUD_CD_"+str(x),"CTLI")
	wk_ctl!=Form!.getControl(num(wk_id$))
	wk_ctl!.insertItems(0,codeList!)
next x

rem store desired data in user_tpl
tpl_str$="codes_ofst:c(5),codeList_ofst:c(5)"

dim user_tpl$:tpl_str$

user_tpl.codes_ofst$="0"
user_tpl.codeList_ofst$="1"

rem store desired vectors/objects in UserObj!
UserObj!=SysGUI!.makeVector()

UserObj!.addItem(codes!)
UserObj!.addItem(codeList!)
[[GLS_COLUMNS.ADIS]]
rem look at cols and tps in param rec; translate those to matching entry in the <<DISPLAY>> lists and set selected index

codeList!=UserObj!.getItem(num(user_tpl.codeList_ofst$))

for x=1 to 4
	cd$=callpoint!.getColumnData("GLS_COLUMNS.ACCT_MN_COLS_"+str(x:"00"))
	tp$=callpoint!.getColumnData("GLS_COLUMNS.ACCT_MN_TYPE_"+str(x:"00"))
	cd_tp$="("+cd$+tp$+")"
	wk_id$=callpoint!.getTableColumnAttribute("<<DISPLAY>>.RECORD_CD_"+str(x),"CTLI")
	wk_ctl!=Form!.getControl(num(wk_id$))
	gosub find_code
rem why won't this work? doesn't display, even w/ REFRESH	if list_row>=0 callpoint!.setColumnData("<<DISPLAY>>.RECORD_CD_"+str(x),codeList!.getItem(list_row))
	if list_row>=0 wk_ctl!.selectIndex(list_row)
next x

for x=1 to 4
	cd$=callpoint!.getColumnData("GLS_COLUMNS.BUD_MN_COLS_"+str(x:"00"))
	tp$=callpoint!.getColumnData("GLS_COLUMNS.BUD_MN_TYPE_"+str(x:"00"))
	cd_tp$="("+cd$+tp$+")"
	wk_id$=callpoint!.getTableColumnAttribute("<<DISPLAY>>.BUD_CD_"+str(x),"CTLI")
	wk_ctl!=Form!.getControl(num(wk_id$))
	gosub find_code
rem	why won't this work? doesn't display, even w/ REFRESH    if list_row>=0 callpoint!.setColumnData("<<DISPLAY>>.BUD_CD_"+str(x),codeList!.getItem(list_row))
	if list_row>=0 wk_ctl!.selectIndex(list_row)
next x
[[GLS_COLUMNS.BWAR]]
rem "set column and type in gl param rec based on items selected from pulldowns

for x=1 to 4
	wk_id$=callpoint!.getTableColumnAttribute("<<DISPLAY>>.RECORD_CD_"+str(x),"CTLI")
	wk_ctl!=Form!.getControl(num(wk_id$))
	wk_row=wk_ctl!.getSelectedIndex()
	if wk_row>0
		wk_row$=wk_ctl!.getItemAt(wk_row)
		cd_tp$=wk_row$(len(wk_row$)-2,2)
	else
		cd_tp$="  "
	endif
		callpoint!.setColumnData("GLS_COLUMNS.ACCT_MN_COLS_"+str(x:"00"),cd_tp$(1,1))
		callpoint!.setColumnData("GLS_COLUMNS.ACCT_MN_TYPE_"+str(x:"00"),cd_tp$(2,1))
next x

for x=1 to 4
	wk_id$=callpoint!.getTableColumnAttribute("<<DISPLAY>>.BUD_CD_"+str(x),"CTLI")
	wk_ctl!=Form!.getControl(num(wk_id$))
	wk_row=wk_ctl!.getSelectedIndex()
	if wk_row>0
		wk_row$=wk_ctl!.getItemAt(wk_row)
		cd_tp$=wk_row$(len(wk_row$)-2,2)
	else
		cd_tp$="  "
	endif
		callpoint!.setColumnData("GLS_COLUMNS.BUD_MN_COLS_"+str(x:"00"),cd_tp$(1,1))
		callpoint!.setColumnData("GLS_COLUMNS.BUD_MN_TYPE_"+str(x:"00"),cd_tp$(2,1))
next x
