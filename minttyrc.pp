#lang pollen
BoldAsFont=no
Font=Source Code Pro
CursorType=block
FontHeight=16
FontSmoothing=full
Scrollbar=none
Term=xterm-256color
ConfirmExit=no

◊(require desolarized)
◊(define (str c) (format "~a,~a,~a" (RGB-r c) (RGB-g c) (RGB-b c)))

ForegroundColour=◊(str base0)
BackgroundColour=◊(str base03)
CursorColour=◊(str base01)

Black=◊(str base03)
BoldBlack=◊(str base02)

Red=◊(str dark-red)
BoldRed=◊(str red)

Green=◊(str dark-green)
BoldGreen=◊(str green)

Yellow=◊(str dark-yellow)
BoldYellow=◊(str yellow)

Blue=◊(str dark-blue)
BoldBlue=◊(str blue)

Magenta=◊(str dark-magenta)
BoldMagenta=◊(str magenta)

Cyan=◊(str dark-cyan)
BoldCyan=◊(str cyan)

White=◊(str base2)
BoldWhite=◊(str base3)
