; MIT License
;
; Copyright (c) 2023 AthanasiusOfAlex
;
; Permission is hereby granted, free of charge, to any person obtaining a copy
; of this software and associated documentation files (the "Software"), to deal
; in the Software without restriction, including without limitation the rights
; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
; copies of the Software, and to permit persons to whom the Software is
; furnished to do so, subject to the following conditions:
;
; The above copyright notice and this permission notice shall be included in all
; copies or substantial portions of the Software.
;
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
; SOFTWARE.
;
#Requires AutoHotkey v2.0
#SingleInstance Force

InstallKeybdHook

ParseDeadKeys(keyMap, diacriticMark)
; accepts an associative array and a diacritic mark as input.
{
	keysThatCancelDeadKey := "{delete}{backspace}{esc}{home}{end}"
	hook := InputHook("L1", keysThatCancelDeadKey)
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

!i::
{
	keyMap := Map("a", "â", "e", "ê", "i", "î", "o", "ô", "u", "û", "A", "Â", "E", "Ê", "I", "Î", "O", "Ô", "U", "Û")
	diacriticMark := "^"
	ParseDeadKeys(keyMap, diacriticMark)
}

+!i::SendInput "{Raw}^"

; Trema/umlaut/diaeresis

!u::
{
	keyMap := Map("a", "ä", "e", "ë", "i", "ï", "o", "ö", "u", "ü", "y", "ÿ", "A", "Ä", "E", "Ë", "I", "Ï", "O", "Ö", "U", "Ü", "Y", "Ÿ")
	diacriticMark := "¨"
	ParseDeadKeys(keyMap, diacriticMark)
}

+!u::SendInput "{Raw}¨"

; tilde

!n::
{
	keyMap := Map("e", "ẽ", "n", "ñ", "o", "õ", "u", "ũ", "E", "Ẽ", "N", "Ñ", "O", "Õ", "U", "Ũ") 
	diacriticMark := "~"
	ParseDeadKeys(keyMap, diacriticMark)
}

+!n::SendInput "{Raw}~"

; Regular ALT keys.

!o::SendInput "ø"
+!j::SendInput "Ô"
+!l::SendInput "Ò"
+!h::SendInput "Ó"
!0::SendInput "º"
+!b::SendInput "ı"
+!f::SendInput "Ï"
+!d::SendInput "Î"
+!s::SendInput "Í"
!f::SendInput "ƒ"
+!6::SendInput "ﬂ"
+!5::SendInput "ﬁ"
+!c::SendInput "Ç"
!c::SendInput "ç"
+!'::SendInput "Æ"
!'::SendInput "æ"
+!a::SendInput "Å"
!a::SendInput "å"
+!m::SendInput "Â"
+!y::SendInput "Á"
!9::SendInput "ª"
+!2::SendInput "€"
!y::SendInput "¥"
!3::SendInput "£"
!4::SendInput "¢"
+!v::SendInput "◊"
!.::SendInput "≥"
!,::SendInput "≤"
!x::SendInput "≈"
!b::SendInput "∫"
!5::SendInput "∞"
!v::SendInput "√"
+!1::SendInput "⁄"
!l::SendInput "¬"
!=::SendInput "≠"
!/::SendInput "÷"
+!=::SendInput "±"
!w::SendInput "∑"
+!p::SendInput "∏"
!j::SendInput "∆"
!d::SendInput "∂"
!r::SendInput "®"
!g::SendInput "©"
+!8::SendInput "°"
+!t::SendInput "ˇ"
+!x::SendInput "˛"
+!z::SendInput "¸"
+!g::SendInput "˝"
!k::SendInput "˚"
!h::SendInput "˙"
+!.::SendInput "˘"
+!,::SendInput "¯"
!8::SendInput "•"
+!7::SendInput "‡"
!t::SendInput "†"
+!r::SendInput "‰"
!7::SendInput "¶"
!6::SendInput "§"
+!\::SendInput "»"
+\::SendInput "«"
+!w::SendInput "„"
+![::SendInput "”"
![::SendInput "“"
+!4::SendInput "›"
+!3::SendInput "‹"
+!0::SendInput "‚"
+!]::SendInput "’"
!]::SendInput "‘"
+!9::SendInput "·"
!;::SendInput "…"
+!;::SendInput "…"
+!/::SendInput "¿"
!1::SendInput "¡"
+!-::SendInput "—"
!-::SendInput "–"
