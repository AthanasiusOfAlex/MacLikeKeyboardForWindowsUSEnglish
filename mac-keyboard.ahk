#Requires AutoHotkey v2.0
#SingleInstance Force

InstallKeybdHook

ParseDeadKeys(keyMap, diacriticMark)
; accepts an associative array and a diacritic mark as input.
{
	hook := InputHook("L1", "{delete}{backspace}{esc}{home}{end}") ; add more keys to this list if you want them to cancel the dead key
    hook.Start()
	theEndKey := hook.Wait()

	typedKey := hook.Input

	try {
		valueSent := keyMap[typedKey]
		SendInput valueSent
	} catch Error as err {
		if (theEndKey != "EndKey") {
			SendInput Format("{Raw}{1}{2}", diacriticMark, typedKey)
		}
	}
}

; Disable the ALT menu accelerator.
; See https://github.com/TaranVH/2nd-keyboard/blob/master/Taran's_Windows_Mods/Alt_menu_acceleration_DISABLER.ahk
~LAlt::
{
	SendInput "{Blind}{SC0E9}" ; SC0E9 is an unused key.
	KeyWait "LAlt" ; this waits for the key to be RELEASED. So that it doesn't keep spamming SC0E9 (as seen from an AHK window Key history and script info... window.)
	SendInput "{Blind}{SC0EA}"
}

~RAlt::
{
	SendInput "{Blind}{SC0E9}"
	KeyWait "RAlt" ; so that it doesn't keep spamming SC0E9
	Sendinput "{Blind}{SC0EA}"
}

; Dead keys (accents)

; Acute accent

!e::
{
	keyMap := Map("a", "á", "e", "é", "i", "í", "o", "ó", "u", "ú", "y", "ý", "A", "Á", "E", "É", "I", "Í", "O", "Ó", "U", "Ú", "Y", "Ý")
	diacriticMark := "´"
	ParseDeadKeys(keyMap, diacriticMark)
}

+!e::SendInput "{Raw}´"

; Grave accent

!`::
{
	keyMap := Map("a", "à", "e", "è", "i", "ì", "o", "ò", "u", "ù", "A", "À", "E", "È", "I", "Ì", "O", "Ò", "U", "Ù")
	diacriticMark := "``"
	ParseDeadKeys(keyMap, diacriticMark)
}

+!`::SendInput "{Raw}``"

; Circumflex accent

!o::
{
	keyMap := Map("a", "â", "e", "ê", "i", "î", "o", "ô", "u", "û", "A", "Â", "E", "Ê", "I", "Î", "O", "Ô", "U", "Û")
	diacriticMark := "^"
	ParseDeadKeys(keyMap, diacriticMark)
}

+!o::SendInput "{Raw}^"

; Trema/umlaut/diaeresis

!i::
{
	keyMap := Map("a", "ä", "e", "ë", "i", "ï", "o", "ö", "u", "ü", "y", "ÿ", "A", "Ä", "E", "Ë", "I", "Ï", "O", "Ö", "U", "Ü", "Y", "Ÿ")
	diacriticMark := "¨"
	ParseDeadKeys(keyMap, diacriticMark)
}

+!i::SendInput "{Raw}¨"

; tilde

!n::
{
	keyMap := Map("e", "ẽ", "n", "ñ", "o", "õ", "u", "ũ", "E", "Ẽ", "N", "Ñ", "O", "Õ", "U", "Ũ") 
	diacriticMark := "~"
	ParseDeadKeys(keyMap, diacriticMark)
}

+!n::SendInput "{Raw}~"

; Regular ALT keys.

!c::SendInput "ç"
+!c::SendInput "Ç"
![::SendInput "“"
!+[::SendInput "”"
!]::SendInput "‘"
!+]::SendInput "’"
!+2::SendInput "€"
!;::SendInput "…"
!\::SendInput "«"
!+\::SendInput "»"
!+8::SendInput "°"
!+?::SendInput "¿"
!1::SendInput "¡"
