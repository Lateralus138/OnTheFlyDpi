## Coming Soon

I will have 2 new versions of this coming soon. The first will be a complete rewrite (V2) in *AutoHotkey V2* syntax without performance fixes and the 2nd (V3) will be a *C++* version.

## Current Release
[On The Fly DPI](https://github.com/Lateralus138/OnTheFlyDpi/raw/master/OnTheFlyDPI.exe)

## On The Fly DPI

### What This Is

On The Fly DPI allows you change the mouse sensitivity on the fly (very quickly) by using modifier keys (hotkeys) and the mouse. ONFDPI is stand-alone application that can be used for anything that would call for changing the sensitivity quickly such as gaming (far to near sniping anyone?) or graphic design or whatever else you might think of.

### What This Is Not

This is not a driver for individual mice. This is from Microsofts WIN32 API that allows external and secondary control of DPI settings and can be used in conjunction with the separate mice settings for more precision control.

### Motivation

I always need to change the mouse sensitivity quickly and I have used scripts for a while, but I wanted something small and portable.

## Usage

ONFDPI runs in the system tray where there's a help selection with the listed hotkeys and other info and selections to restart and exit the program. 

## Hotkeys (not perfected yet, but I think they're suitable for now)
```
Raise Sensitivity: Mouse Wheel Up Or XButton2
[Control]+[Alt]+	+1 Sensitivity
[Control]+[Shift]+	+2 Sensitivity
[Shift]+[Alt]+		Max Sensitivity

Lower Sensitivity: Mouse Wheel Down Or XButton1
[Control]+[Alt]+	-1 Sensitivity
[Control]+[Shift]+	-2 Sensitivity
[Shift]+[Alt]+		Min Sensitivity

Default: Click Mouse Button
[Control]+[Alt]+	Reset to default
```

<!-- ## Example Code - Function I wrote to get and set the mouse dpi (1-20, 10 being default)

```
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
```
# Setting DPI - Increase current dpi + 1
```
MouseDpi(MouseDpi()+1)
```  -->

## Installation

Portable program (Plans for installer and portable option).

## Contributors

Ian Pride @ faithnomoread@yahoo.com - [Lateralus138] @ New Pride Services

## Project Information

This project is written in `AutoHotkey`.

[![C++](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/Lateralus138/endpoints/refs/heads/master/docs/json/autohotkey.json&logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAIGNIUk0AAHomAACAhAAA%2BgAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAAD2UExURUWNOkSOOkWMOkSOOkSOOkSOOkSOOUSMOUSOOkSOOkSOOkSOOkSOOkSOOkKPOkOOOkSOOkSOOkONOUSNOkWQO1uuUmW9XkyZQ02bRGW8XUSPOlKiSYbpgIvxhliqUEOMOW7JZ471infVcUaQPFmrUIvwhovwhXjWcUKMOEWPO4rwhVuuU0qWQFCfR1aoTmC0WIDie471iYzxh4DheoXpgInuhIzyh430iI30iY70iY3ziIjsgorvhXrZdGzFZGS6XFyvU1WmTHvadVmsUUOMOIzxhobqgVOiSo%2F2im%2FJaESNOU2aQ2e%2FYFyvVEWQPGe%2BX06cRf%2F%2F%2F8nWeuIAAAARdFJOUwAABV7R%2FUQFdvHQXdJ1BUYF5ht83wAAAAFiS0dEUZRpfCoAAAAHdElNRQfpCBUQDhVFUGaTAAAAu0lEQVQY003PWRuBUBAG4INCss1JlqioZF8S2fd99%2F9%2FjVMoczPPvBcz8yHkD1A0%2FIoKolCYwdgZOLtHUIBJ8ekMR%2BZsjhcAEIXzBVGSAYRiSVEJ0LJW1jUCauUDIGu6LlWxXFNcqOuNZqvd6Rou9EyzP7CsoQvWaDwRp7M%2FmC%2BWq%2FXG8JZud%2FZSD8rOWaVUUYG2YX84YvuP01kgr8Plers%2FSBTh%2FnxxDIuiAN9wGHNMLI4SlJudjrBJ3xuTvx12nO%2FZawAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAyNS0wOC0yMVQxNjowNDoxOSswMDowMFnTVn0AAAAldEVYdGRhdGU6bW9kaWZ5ADIwMjUtMDgtMjFUMTY6MDQ6MDArMDA6MDBxvKuMAAAAKHRFWHRkYXRlOnRpbWVzdGFtcAAyMDI1LTA4LTIxVDE2OjE0OjIxKzAwOjAwA3VZWgAAAABJRU5ErkJggg%3D%3D)](https://www.autohotkey.com)

### Other Miscellaneous File Information

|Description|Status|
|:---:|:---:|
|Project Release Date|![GitHub Release Date](https://img.shields.io/github/release-date/Lateralus138/OnTheFlyDPI?style=for-the-badge&labelColor=1D1D1D&color=99CCFF)|
|Total downloads for this project|![GitHub all releases](https://img.shields.io/github/downloads/Lateralus138/OnTheFlyDPI/total?style=for-the-badge&labelColor=1D1D1D&color=99CCFF)|
|Complete repository size|![This Repo Size](https://img.shields.io/github/repo-size/Lateralus138/OnTheFlyDPI?style=for-the-badge&labelColor=1D1D1D&color=99CCFF)|
|Commits in last month|![GitHub commit activity](https://img.shields.io/github/commit-activity/m/Lateralus138/OnTheFlyDPI?style=for-the-badge&labelColor=1D1D1D&color=99CCFF)|
|Commits in last year|![GitHub commit activity](https://img.shields.io/github/commit-activity/y/Lateralus138/OnTheFlyDPI?style=for-the-badge&labelColor=1D1D1D&color=99CCFF)|

## [LICENSE](./LICENSE)

![License Info](https://img.shields.io/github/license/Lateralus138/rgbdiff?style=for-the-badge&labelColor=1D1D1D&color=99CCFF)

<details>
	<summary>License Excerpt</summary>
	<br>
	<blockquote>
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
	</blockquote>
	<br>
	<blockquote>
 This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
	</blockquote>
</details>