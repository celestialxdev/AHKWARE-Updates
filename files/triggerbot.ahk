﻿MsgBox TB loaded open roblox(if already opened ur good) get tappin
; Must be in 1920x1080 Res, Full Screen, Low GFX

; Initialize
#NoEnv
#Persistent
#MaxThreadsPerHotkey 2
#KeyHistory 0
ListLines Off
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
CoordMode, Pixel, Screen

; Configuration

key_hold_mode := "-" ; To toggle On / Off
key_exit := "End" ; Panic key
key_hold := "RButton" ; Button / Key to hold to use

pixel_box := 5 ; Fov (In Pixels)
pixel_sens := 55 ; Color Sensetivity (lower it to make it detect less shades of black, higher to do the opposite)
pixel_color := ["0x000000", "0xFFFFFF"] ; Black and White colors

click_delay := 15 ; Delay in MS


; ----------------------------------------------------------------------------------------------------------------------- ;
; |                                          DO NOT CHANGE ANYTHING BELOW HERE                                          | ;
; ----------------------------------------------------------------------------------------------------------------------- ;

; Screen Bounds
leftbound := A_ScreenWidth / 2 - pixel_box
rightbound := A_ScreenWidth / 2 + pixel_box
topbound := A_ScreenHeight / 2 - pixel_box
bottombound := A_ScreenHeight / 2 + pixel_box

; Setting Keys
hotkey, %key_hold_mode%, holdmode
hotkey, %key_exit%, terminate
return

start:
terminate:
Sleep 400
exitapp
return

holdmode:
global toggle
toggle := !toggle
if (toggle) {
    settimer, loop2, 1
} else {
    settimer, loop2, off
}
return

loop2:
While toggle and GetKeyState(key_hold, "P") {
    PixelSearch()
}
return

#if
PixelSearch() {
    global
    PixelSearch, FoundX, FoundY, leftbound, topbound, rightbound, bottombound, pixel_color, pixel_sens, Fast RGB
    If !(ErrorLevel)
        {
            If !GetKeyState("LButton")
                {
                    ClickPixel()
                    sleep, click_delay
                }
        }
        return
    }
ClickPixel() {
    SendInput, {Click}
}
