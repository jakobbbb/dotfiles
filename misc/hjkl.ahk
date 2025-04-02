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

; Remap "Shift + Space" to "Backspace"
+Space::Send {Backspace}

; Media
F13 & z::Send {Media_Prev}
F13 & x::Send {Media_Play_Pause}
F13 & c::Send {Media_Next}
F13 & ,::Send {Volume_Down}
F13 & .::Send {Volume_Up}
F13 & m::Send {Volume_Mute}

; Prevent F13 from doing anything on its own
F13::Return