#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    ExitApp
}

msgbox, ctr + f to begin AFK, ctr + d to close program, ctr + s to toggle pause.
msgbox, please stay crouched, it ensures the afk can continue.

^f::	; press ctr&f to begin
#Persistent
SetTimer, Start
return

Start: 
send {e Down}
sleep 500
send {e Up}
sleep 1200
send {e Down}
sleep 500
send {e Up}
sleep 1200
send {e Down}
sleep 500
send {e Up}
sleep 1200
send {e Down}
sleep 500
send {e Up}
sleep 1150
send {s down}
sleep 50
send {s up}
return

^d:: ExitApp	; press ctr&d to close ahk

^s::
Pause
return
