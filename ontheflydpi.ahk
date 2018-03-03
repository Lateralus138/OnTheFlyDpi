; On The Fly DPI - Change mouse dpi quickly
; Init - optimization
SetBatchLines,-1
SetKeyDelay,-1
SetWinDelay,0

; Init - directives
#SingleInstance, Force
#Persistent

; Init Vars
_title_:="On The Fly DPI"
_help_title_=%_title_% by Ian Pride - New Pride Services - 2018
_help_msg_=
(

Change the mouse DPI (sensitivity) very quickly with
the mouse by using preset hotkeys listed below. Plans
to implement settings for the user to select their
hotkey modifiers.

The sensitivity settings are in the range 1-20 with
10 being the default setting.

Hotkeys:

Raise Sensitivity:
[Control]+[Alt]+Mouse Wheel Up%A_TAB%%A_TAB%%A_TAB%+1 Sensitivity
[Control]+[Shift]+Mouse Wheel Up%A_TAB%%A_TAB%%A_TAB%+2 Sensitivity
[Shift]+[Alt]+(Mouse Wheel Up Or XButton2)%A_TAB%%A_TAB%Max Sensitivity

Lower Sensitivity:
[Control]+[Alt]+Mouse Wheel Down%A_TAB%%A_TAB%%A_TAB%-1 Sensitivity
[Control]+[Shift]+Mouse Wheel Down%A_TAB%%A_TAB%%A_TAB%-2 Sensitivity
[Shift]+[Alt]+(Mouse Wheel Up Or XButton2)%A_TAB%%A_TAB%Min Sensitivity

Default:
[Control]+[Alt]+Click Mouse Button%A_TAB%%A_TAB%%A_TAB%Reset to default
)


; Menu
Menu,Tray,NoStandard
Menu,Tray,Add,&Restart %_title_%,Restart
Menu,Tray,Add,%_title_% Help,Help
Menu,Tray,Add
Menu,Tray,Add,E&xit,Leave

OnMessage(0x201,"WM_LBUTTONDOWN")
OnMessage(0x200,"WM_MOUSEHOVER")

; Hotkeys
^!WheelUp::
	ToolTip,% "Current mouse speed: " MouseDpi(MouseDpi()+1),,,20
	SetTimer,EndTooltip,-500
Return
^!WheelDown::
	ToolTip % "Current mouse speed: "  MouseDpi(MouseDpi()-1),,,20
	SetTimer,EndTooltip,-500
Return
^+WheelUp::
	ToolTip,% "Current mouse speed: " MouseDpi(MouseDpi()+2),,,20
	SetTimer,EndTooltip,-500
Return
^+WheelDown::
	ToolTip % "Current mouse speed: "  MouseDpi(MouseDpi()-2),,,20
	SetTimer,EndTooltip,-500
Return
^!MButton::
	ToolTip % "Current mouse speed: "  MouseDpi("reset"),,,20
	SetTimer,EndTooltip,-500
Return
+!WheelUp::
+!XButton2::
	ToolTip,% "Current mouse speed: " MouseDpi(20),,,20
	SetTimer,EndTooltip,-500
Return
+!WheelDown::
+!XButton1::
	ToolTip,% "Current mouse speed: " MouseDpi(1),,,20
	SetTimer,EndTooltip,-500
Return

; Functions
#Include, C:\Users\FluxApex\Documents\AutoHotkey\Projects\OnTheFlyDPI\ontheflydpi_funcs.ahk

; Subs
Help:
	Gui,Destroy
	gui_id:=""
	Gui,+ToolWindow -Caption +0x00800000
	Gui,Color,0xFFFFFF,0x000000
	Gui,Font,s14 c0xFFFFFF,Segoe UI
	Gui,Margin,0,0
	Gui,Add,Progress,x0 y0 w442 h28 Background0x29B6F6 c0x29B6F6,100
	Gui,Add,Text,xp yp w442 h28 +Center 0x200 +BackgroundTrans,%_title_%
	CloseButton(418,3,"FFFFFF","039BE5")
	
	Gui,Add,Progress,x0 y+5 w442 h1 Background0x039BE5 c0x039BE5,100
	
	Gui,Font,s12 c0x000000
	Gui,Add,Text,Section x8 y+8,%_help_title_%
	Gui,Font,s10
	Gui,Add,Text, xs y+0,%_help_msg_%
	Gui,Font,s8 c0xb71c1c,
	Gui,Add,Link,xs y+8,Find more of my AutoHotkey scripts @ <a href="https://lateralus138.github.io/">lateralus138.github.io</a>
	Gui,Add,Text,xs y+0 w1 h8
	Gui,Show,AutoSize,%_title_% %A_ThisLabel%
	GetControls(_title_ " " A_ThisLabel)
	Gui,+LastFound
	gui_id:=WinExist()
	WinSet,AlwaysOnTop,On,ahk_id %gui_id%
Return
GuiEscape:
GuiClose:
	Gui,Destroy
	gui_id:=""
Return
EndTooltip:
	ToolTip,,,,20
Return
Restart:
	Run,%A_ScriptFullPath%
Leave:
	ExitApp