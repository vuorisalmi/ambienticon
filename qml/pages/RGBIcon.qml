import QtQuick 2.0
//import Sailfish.Silica 1.0

Item {
    id: rgbIcon
    width: 86      // Replace with your favorite default value
    height: width

    // Main interface:
    property color color //: "#ffffff"  // default to white
    property string source   // filename should contain one "?"

    // Debug properties
    property bool _redFilterVisible: iconR.visible
    property bool _greenFilterVisible: iconG.visible
    property bool _blueFilterVisible: iconB.visible

    // IDs ("enums") of the base colors
    property int __baseColorBlack: 0
    property int __baseColorR:     1
    property int __baseColorG:     2
    property int __baseColorB:     4
    property int __baseColorRG:    3
    property int __baseColorRB:    5
    property int __baseColorGB:    6
    property int __baseColorRGB:   7
    property int __baseColorWhite: __baseColorRGB
    property int __baseColorCurrent: ((color.r > 0) * __baseColorR) + ((color.g > 0) * __baseColorG) + ((color.b > 0) * __baseColorB)

    property variant __iconName: ["black", "red", "green", "red+green", "blue", "red+blue", "green+blue", "white"]

    // File names of the icon color variants
    property string __sourceBlack
    property string __sourceWhite
    property string __sourceR
    property string __sourceG
    property string __sourceB
    property string __sourceRG
    property string __sourceRB
    property string __sourceGB

    //property real __sourceBase: __sourceWhite  // base color for further filtering

    onSourceChanged: {
        __sourceBlack = source.replace("?", "black")
        __sourceWhite = source.replace("?", "white")
        __sourceR = source.replace("?", "red")
        __sourceG = source.replace("?", "green")
        __sourceB = source.replace("?", "blue")
        __sourceRG = source.replace("?", "red+green")
        __sourceRB = source.replace("?", "red+blue")
        __sourceGB = source.replace("?", "green+blue")
    }

//    onColorChanged: {
//        if (color.g === 0 && color.b === 0) {
//            __sourceBase = __sourceR;
//            iconBase.opacity = color.r;
//        } else if (color.r === 0 && color.b === 0) {
//            __sourceBase = __sourceG;
//            iconBase.opacity = color.g;
//        } else if (color.r === 0 && color.g === 0) {
//            __sourceBase = __sourceB;
//            iconBase.opacity = color.b;
//        } else if (color.b === 0) {
//            __sourceBase = __sourceRG;
//        } else if (color.g === 0) {
//            __sourceBase = __sourceRB;
//        } else if (color.r === 0) {
//            __sourceBase = __sourceGB;
//        } else {
//            __sourceBase = __sourceWhite;
//        }
//        console.log("Color changed: ", color)
//    }

    function baseIconSource (color) {
        if (color.g === 0 && color.b === 0) {
            return __sourceR;
        } else if (color.r === 0 && color.b === 0) {
            return __sourceG;
        } else if (color.r === 0 && color.g === 0) {
            return __sourceB;
        } else if (color.b === 0) {
            return __sourceRG;
        } else if (color.g === 0) {
            return __sourceRB;
        } else if (color.r === 0) {
            return __sourceGB;
        } else {
            return __sourceWhite;
        }
    }
    function baseOpacity (color) {
        if (__baseColorCurrent === __baseColorR || __baseColorCurrent === __baseColorG || __baseColorCurrent === __baseColorB ) {
            return Math.max(color.r, color.g, color.b);
        } else if (__baseColorCurrent === __baseColorRG) {
            //return Math.min(color.r, color.g);
            return (color.r + color.g) / 2;     // !!!!!!!!!!!!!!!!
        } else if (__baseColorCurrent === __baseColorRB) {
            //return Math.min(color.r, color.b);
            return (color.r + color.b) / 2;     // !!!!!!!!!!!!!!!!
        } else if (__baseColorCurrent === __baseColorGB) {
            //return Math.min(color.g, color.b);
            return (color.g + color.b) / 2;     // !!!!!!!!!!!!!!!!
        } else {
            return Math.min(color.r, color.g, color.b);
        }

//        if (color.g === 0 && color.b === 0) {
//            return color.r;
//        } else if (color.r === 0 && color.b === 0) {
//            return color.g;
//        } else if (color.r === 0 && color.g === 0) {
//            return color.b;
//        } else {
//            // TODO: a lot to do in here: overall luminance --> opacity
//            return 1;
//        }
    }

    function isRedSmallest(color) {
        return (color.r < color.g && color.r < color.b);
    }
    function isGreenSmallest(color) {
        return (color.g < color.r && color.g < color.b);
    }
    function isBlueSmallest(color) {
        return (color.b < color.r && color.b < color.g);
    }

    // TODO: currently assumes red component is 1.0, overall luminance (->opacity) not taken into account
    function redFilterOpacity (color) {
        var baseOpa = baseOpacity(color);
        if (isBlueSmallest(color)) {
            // No blue color component, is there more red than green?
            //return (color.r > color.g) ? ((color.r - color.g) * color.r) : 0.0;
            return (color.r > color.g) ? (color.r - color.g) : 0.0;
            //return (color.r > color.g) ? ((color.r - baseOpa) / (1 - baseOpa)) : 0.0;   // !!!!!!!!!!

        } else if (isGreenSmallest(color)) {
            // No green color component, is there more red than blue?
            return (color.r > color.b) ? (color.r - color.b) : 0.0;
        } else {
            // TODO: all three color components present
            return 0.0
        }
    }
    function greenFilterOpacity (color) {
        if (color.b === 0.0) {
            // No blue color component, is there more green than red?
            return (color.g > color.r) ? (color.g - color.r) : 0.0;
        } else if (color.r === 0.0) {
            // No red color component, is there more green than blue?
            return (color.g > color.b) ? (color.g - color.b) : 0.0;
        } else {
            // TODO: all three color components present
            return 0.0
        }
    }
    function blueFilterOpacity (color) {
        if (color.g === 0.0) {
            // No green color component, is there more blue than red?
            return (color.b > color.r) ? (color.b - color.r) : 0.0;
        } else if (color.r === 0.0) {
            // No red color component, is there more blue than green?
            return (color.b > color.g) ? (color.b - color.g) : 0.0;
        } else {
            // TODO: all three color components present
            return 0.0
        }
    }

    Image {
        // Black image is always shown, fully opaque, in order not to add extra
        // transparency even if the shades were very dark
        source: __sourceBlack
        anchors.fill: parent
    }
    Image {
        id: iconBase
        source: baseIconSource(color) //__sourceR // __sourceBase
        anchors.fill: parent
        opacity: baseOpacity(color)
    }
    Image {
        id: iconR
        source: __sourceR
        anchors.fill: parent
        // Only needed to be visible when there is more red color than some other and when it is not pure red
        visible: ((rgbIcon.color.r > rgbIcon.color.g || rgbIcon.color.r > rgbIcon.color.b) && (rgbIcon.color.g > 0 || rgbIcon.color.b > 0))
        opacity: redFilterOpacity(color)
    }
    Image {
        id: iconG
        source: __sourceG
        anchors.fill: parent
        visible: ((rgbIcon.color.g > rgbIcon.color.r || rgbIcon.color.g > rgbIcon.color.b) && (rgbIcon.color.r > 0 || rgbIcon.color.b > 0))
        opacity: greenFilterOpacity(color)
    }
    Image {
        id: iconB
        source: __sourceB
        anchors.fill: parent
        visible: ((rgbIcon.color.b > rgbIcon.color.r || rgbIcon.color.b > rgbIcon.color.g) && (rgbIcon.color.r > 0 || rgbIcon.color.g > 0))
        opacity: blueFilterOpacity(color)
    }

}
