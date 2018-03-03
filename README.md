## On The Fly DPI

On The Fly DPI allows you change the mouse sensitivity on the fly (very quickly) by using modifier keys (hotkeys) and the mouse. ONFDPI is stand-alone application that can be used for anything that would call for changing the sensitivity quickly such as gaming (far to near sniping anyone?) or graphic design or whatever else you might think of. 

## Example Code - Function I wrote to get and set the mouse dpi (1-20, 10 being default)

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
``` 
## Motivation

I always need to change the mouse sensitivity quickly and I have used scripts for a while, but I wanted something small and portable.

## Installation

Portable program (Plans for installer and portable option).


## Test
I have tested on Windows 10 64 bit.

## Contributors

Ian Pride @ faithnomoread@yahoo.com - [Lateralus138] @ New Pride Services 

## License

	This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

	License provided in gpl.txt

## Current Release
[On The Fly DPI](https://github.com/Lateralus138/OnTheFlyDpi/raw/master/OnTheFlyDPI.exe)
