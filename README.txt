Copyright (c) 2014, Jussi Vuorisalmi <jussi.vuorisalmi@iki.fi>
All rights reserved.

Ambient Icon for Sailfish OS (Jolla).

Ambient Icon provides RGBIcon.qml which allows you to color your icons
using any RGB color, e.g. to make the application graphics adapt to the
current ambience of the Sailfish OS. RGBIcon.qml is implemented by
overlaying pure-color icons (white, red, green etc.) and playing with their
transparencies.

Ambient Icon is a demo application that shows how RGBIcon.qml works and
how to use it.

RGBIcon.qml was created as a workaround to Jolla harbour/store restrictions,
e.g. QtGraphicalEffects module with ColorOverlay component would be a perfect
solution to colorize graphics but that is currently not accepted by Jolla
(see ColorOverlayPage.qml for an example of using that option).

How to use it?
--------------

1) Create eight (8) different color variants of your icon/bitmap file, each
providing one pure color variant (000000, ff0000, 00ff00, 0000ff, ffff00, ff00ff,
00ffff, ffffff as RGB), e.g.:

    myicon_black.png
    myicon_red.png
    myicon_green.png
    myicon_blue.png
    myicon_red+green.png
    myicon_red+blue.png
    myicon_green+blue.png
    myicon_white.png

2) Use it in your code, e.g.:

    RGBIcon {
        color: Theme.highlightColor
        source: "myicon_?.png"
        width: 64; height: 64
    }

See the source code (especially IconOverlayPage.qml) for an example.

Source code available in
https://github.com/vuorisalmi/ambienticon
under the terms of BSD license. See LICENSE.txt for more information.
