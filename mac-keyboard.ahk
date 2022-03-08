#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

ParseDeadKeys(deadKeys) ; accepts a dictionary as input, e.g., deadKeys := {a: "á", e: "é", i: "í", o: "ó", u: "ú", y: "ý"}
{
	Input, key, L1, {delete}{esc}{home}{end} ; ... etc

	if GetKeyState("Shift")
		Send % Format("{:U}", deadKeys[key])
	else
		Send % deadKeys[key]
}

; Disable the ALT menu accelerator.
; See https://github.com/TaranVH/2nd-keyboard/blob/master/Taran's_Windows_Mods/Alt_menu_acceleration_DISABLER.ahk
~LAlt::
Sendinput {Blind}{sc0E9}
KeyWait, LAlt ; this wasit for the key to be RELEASED. So that it doesn't keep spamming SC0E9 (as seen from an AHK window Key history and script info... window.)
Sendinput {Blind}{sc0EA}
return

~RAlt::
Sendinput {Blind}{sc0E9}
KeyWait, RAlt ; so that it doesn't keep spamming SC0E9
Sendinput {Blind}{sc0EA}
return

; Regular ALT keys.

![::
Send, “
return

!+[::
Send, ”
return

!]::
Send, ‘
return

!+]::
Send, ’
return

!+2::
Send, €
return

; Dead keys (accents)

; Acute accent
!e::
deadkeys := {a: "á", e: "é", i: "í", o: "ó", u: "ú", y: "ý"}
Input, key, L1, {delete}{esc}{home}{end} ; ... etc

if GetKeyState("Shift")
    Send % Format("{:U}", deadkeys[key])
else
    Send % deadkeys[key]
	
return

; Grave accent
!`::
deadkeys := {a: "à", e: "è", i: "ì", o: "ò", u: "ù"}
Input, key, L1, {delete}{esc}{home}{end} ; ... etc
Send % deadkeys[key]
return

; Circumflex accent
!o::
deadkeys := {a: "â", e: "ê", i: "î", o: "ô", u: "û"}
Input, key, L1, {delete}{esc}{home}{end} ; ... etc
Send % deadkeys[key]
return

; Trema/umlaut/diaeresis
!i::
deadkeys := {a: "ä", e: "ë", i: "ï", o: "ö", u: "ü", y: "ÿ"}
Input, key, L1, {delete}{esc}{home}{end} ; ... etc
Send % deadkeys[key]
return