; 1: Remap caps
;   Run capslock_to_f13.reg
; 2: Autostart
;   Compile this script into an exe
;   Create a shortcut to the exe
;   Move the shortcut here:
;       %AppData%\Microsoft\Windows\Start Menu\Programs\Startup

; F13 + H -> Left Arrow
F13 & h::Send {Left}

; F13 + J -> Down Arrow
F13 & j::Send {Down}

; F13 + K -> Up Arrow
F13 & k::Send {Up}

; F13 + L -> Right Arrow
F13 & l::Send {Right}

; Remap "F13 + Space" to "Enter"
F13 & Space::Send {Enter}

; Remap the backslash key (\) to act like Backspace + bar
SC02B::Backspace
Shift & SC02B::Send |

; Remap the Backspace key to send backslash and bar
SC00E::Send \
Shift & SC00E::Send |

; Media
F13 & z::Send {Media_Prev}
F13 & x::Send {Media_Play_Pause}
F13 & c::Send {Media_Next}
F13 & ,::Send {Volume_Down}
F13 & .::Send {Volume_Up}
F13 & m::Send {Volume_Mute}

; Prevent F13 from doing anything on its own
F13::Return