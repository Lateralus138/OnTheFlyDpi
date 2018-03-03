MouseDpi(mode_speed:=0){ 
	DllCall("SystemParametersInfo","UInt",0x70,"UInt",0,"UIntP",_current_,"UInt",0)
	If mode_speed Is Not Number
		{
			If (InStr(mode_speed,"reset") And (_current_!=10)){
				DllCall("SystemParametersInfo","UInt",0x71,"UInt",0,"UInt",10,"UInt",0)
				DllCall("SystemParametersInfo","UInt",0x70,"UInt",0,"UIntP",_current_,"UInt",0)
			}
			Return _current_
		}
	mode_speed	:=(mode_speed!=0 And mode_speed>20)?20
				:(mode_speed!=0 And mode_speed<0)?1
				:mode_speed
	If (mode_speed!=0 And (_current_!=mode_speed))
		DllCall("SystemParametersInfo","UInt",0x71,"UInt",0,"UInt",mode_speed,"UInt",0)
	Return !mode_speed?_current_:mode_speed
}
Debug(title:="Debug Pause",msg:=0,type:=64,exit:=0){
	type:=(Mod(type,16)=0)?type:64
	If (type = 64)
		MsgBox,64,%title%,%msg%
	If (type = 48)
		MsgBox,48,%title%,%msg%
	If (type = 32)
		MsgBox,32,%title%,%msg%
	If (type = 16)
		MsgBox,16,%title%,%msg%
	If exit
		ExitApp
}
CloseButton(x,y,lcolor,dcolor,subWin:="",small:=False){
	small:=small?3:4
	big:=small*3
	Gui, %subWin%Add, Progress, Background0x%lcolor% c0x%dcolor% x%x% y%y% w%small% h%small%, 100
	Gui, %subWin%Add, Progress, Background0x%lcolor% c0x%dcolor% y+0 x+0 w%small% h%small%, 100
	Gui, %subWin%Add, Progress, Background0x%lcolor% c0x%dcolor% y+0 x+0 w%small% h%small%, 100
	Gui, %subWin%Add, Progress, Background0x%lcolor% c0x%dcolor% y+0 xp-%small% w%small% h%small%, 100
	Gui, %subWin%Add, Progress, Background0x%lcolor% c0x%dcolor% y+0 xp-%small% w%small% h%small%, 100
	Gui, %subWin%Add, Progress, Background0x%lcolor% c0x%dcolor% yp-%big% xp+%big% w%small% h%small%, 100
	Gui, %subWin%Add, Progress, Background0x%lcolor% c0x%dcolor% yp-%small% x+0 w%small% h%small%, 100
	Gui, %subWin%Add, Progress, Background0x%lcolor% c0x%dcolor% yp+%big% xp-%small% w%small% h%small%, 100
	Gui, %subWin%Add, Progress, Background0x%lcolor% c0x%dcolor% y+0 x+0 w%small% h%small%, 100
}
MouseOver(x1,y1,x2,y2){
	MouseGetPos,_x,_y
	Return (_x>=x1 AND _x<=x2 AND _y>=y1 AND _y<=y2)
}
GetControls(title,control:=0,posvar:=0){
	If (control && posvar)
		{
			namenum:=EnumVarName(control)
			ControlGetPos,x,y,w,h,%control%,%title%
			pos:=(posvar == "X")?x
			:(posvar == "Y")?y
			:(posvar == "W")?w
			:(posvar == "H")?h
			:(posvar == "X2")?x+w
			:(posvar == "Y2")?Y+H
			:0
			Globals.SetGlobal(namenum posvar,pos)
			Return pos
		}
	Else If !(control && posvar)
		{
			WinGet,a,ControlList,%title%
			Loop,Parse,a,`n
				{
					namenum:=EnumVarName(A_LoopField)
					If namenum
						{
							ControlGetPos,x,y,w,h,%A_LoopField%,%title%
							Globals.SetGlobal(namenum "X",x)
							Globals.SetGlobal(namenum "Y",y)
							Globals.SetGlobal(namenum "W",w)
							Globals.SetGlobal(namenum "H",h)
							Globals.SetGlobal(namenum "X2",x+w)
							Globals.SetGlobal(namenum "Y2",y+h)				
						}
				}
			Return a
		}
}
EnumVarName(control){
	name:=InStr(control,"msctls_p")?"MP"
	:InStr(control,"Static")?"S"
	:InStr(control,"Button")?"B"
	:InStr(control,"Edit")?"E"
	:InStr(control,"ListBox")?"LB"
	:InStr(control,"msctls_u")?"UD"
	:InStr(control,"ComboBox")?"CB"
	:InStr(control,"ListView")?"LV"
	:InStr(control,"SysTreeView")?"TV"
	:InStr(control,"SysLink")?"L"
	:InStr(control,"msctls_h")?"H"
	:InStr(control,"SysDate")?"TD"
	:InStr(control,"SysMonthCal")?"MC"
	:InStr(control,"msctls_t")?"SL"
	:InStr(control,"msctls_s")?"SB"
	:InStr(control,"327701")?"AX"
	:InStr(control,"SysTabC")?"T"
	:0
	num:=(name == "MP")?SubStr(control,18)
	:(name == "S")?SubStr(control,7)
	:(name == "B")?SubStr(control,7)
	:(name == "E")?SubStr(control,5)
	:(name == "LB")?SubStr(control,8)
	:(name == "UD")?SubStr(control,15)
	:(name == "CB")?SubStr(control,9)
	:(name == "LV")?SubStr(control,14)
	:(name == "TV")?SubStr(control,14)
	:(name == "L")?SubStr(control,8)
	:(name == "H")?SubStr(control,16)
	:(name == "TD")?SubStr(control,18)
	:(name == "MC")?SubStr(control,14)
	:(name == "SL")?SubStr(control,18)
	:(name == "SB")?SubStr(control,19)
	:(name == "AX")?SubStr(control,5)
	:(name == "T")?SubStr(control,16)
	:0
	Return name num
}

; Classes
Class Globals { ; my favorite way to set and retrive global tions. Good for
	SetGlobal(name,value=""){ ; setting globals from other functions
		Global
		%name%:=value
		Return
	}
	GetGlobal(name){	
		Global
		Local var:=%name%
		Return var
	}
}
WM_MOUSEHOVER(){
	Global
	If MouseOver(S1X,S1Y,S1X2,S1Y2)
		PostMessage, 0xA1, 2,,,ahk_id %gui_id%
}
WM_LBUTTONDOWN(){
	Global
	If MouseOver(MP2X,MP2Y,MP10X2,MP10Y2)
		Gosub,GuiClose
}