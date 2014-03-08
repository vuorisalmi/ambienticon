import QtQuick 2.0

Item {
    id: rgbIcon
    width: 86      // Replace with your favorite default value
    height: width

    // Main interface:
    property color color: "#ffffff"  // default to white
    property string source   // filename should contain one "?"

    // Debug properties
    property bool _redFilterVisible: iconR.visible
    property bool _greenFilterVisible: iconG.visible
    property bool _blueFilterVisible: iconB.visible

    // IDs ("enums") of the pure color components
    property int __colorBlack: 0
    property int __colorR:     1
    property int __colorG:     2
    property int __colorB:     4
    property int __colorRG:    3
    property int __colorRB:    5
    property int __colorGB:    6
    property int __colorWhite: 7
    // Current base color
    property int __baseColor:  ((color.r > 0) * __colorR) + ((color.g > 0) * __colorG) + ((color.b > 0) * __colorB)
    property bool __base1Color: __baseColor === __colorR || __baseColor === __colorG || __baseColor === __colorB
    property bool __base2Color: __baseColor === __colorRG || __baseColor === __colorRB || __baseColor === __colorGB
    property bool __base3Color: __baseColor === __colorWhite

    // The "middle" color component, in intensity (not max, not min)
    property real __midColor: (color.r + color.g + color.b) - Math.max(color.r, color.g, color.b) - Math.min(color.r, color.g, color.b)

    property variant __iconName: ["black", "red", "green", "red+green", "blue", "red+blue", "green+blue", "white"]

    // TODO: refactor to an array
    // File names of the icon color variants
    property string __sourceBlack
    property string __sourceWhite
    property string __sourceR
    property string __sourceG
    property string __sourceB
    property string __sourceRG
    property string __sourceRB
    property string __sourceGB

    // TODO: refactor to an array lookup
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

    // TODO: refactor to an array lookup
    function baseIconSource (color) {
        if (color.r + color.g + color.b === 0) {
            return __sourceBlack;
        } else if (color.g === 0 && color.b === 0) {
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
        if (__base1Color) {
            return Math.max(color.r, color.g, color.b);
        } else if (__base2Color) {
            // Average of the two components (one is always zero)
            return (color.r + color.g + color.b) / 2;
        } else {
            // Three or zero (black) base color
            // TODO ???
            //return ((color.r + color.g + color.b) - Math.max(color.r, color.g, color.b)) / 2;
            return 1.0;
        }
    }

//    function isRedSmallest(color) {
//        return (color.r < color.g && color.r < color.b);
//    }
//    function isGreenSmallest(color) {
//        return (color.g < color.r && color.g < color.b);
//    }
//    function isBlueSmallest(color) {
//        return (color.b < color.r && color.b < color.g);
//    }

    // Returns the opacity of the colorComp filter. Generic function for any color filter.
    function filterOpacity (colorComp, color) {
        if (__base2Color) {
            // If colorComp is the bigger component of two non-zero ones...
            return (colorComp === Math.max(color.r, color.g, color.b)) ?
                        (colorComp - (color.r + color.g + color.b - colorComp)) : 0.0;
        } else if (__base3Color && colorComp === Math.max(color.r, color.g, color.b)) {
            // All three color components present, colorComp is the largers
            return colorComp - __midColor;
        } else if (__base3Color && colorComp === __midColor) {
            return colorComp - Math.min(color.r, color.g, color.b);
        } else {
            // No filter needed if color is pure black, there is only one color component
            // or if colorComp is the smallest of the three
            return 0.0;
        }
    }

    function stackingOrder (colorComp, color) {
        if (__base3Color && colorComp === Math.max(color.r, color.g, color.b)) {
            return 3;
        } else if (__base3Color && colorComp === __midColor) {
            return 2;
        } else {
            // Stacking only matters in case of all three color componets (RGB) visible
            return 1;
        }
    }

//    // TODO: currently assumes red component is 1.0, overall luminance (->opacity) not taken into account
//    function redFilterOpacity (color) {
//        if (__base1Color) {
//            // No need for any additional filtering (independent if red component is there or not)
//            return 0.0;
//        } else if (__base2Color) {
//            // If red is the bigger component of two non-zero ones...
//            return (color.r === Math.max(color.r, color.g, color.b)) ? (color.r - (color.g + color.b)) : 0.0;
//        } else {
//            // TODO: all three color components present
//            //return color.r - ((color.g + color.b) / 2);
//            return color.r - color.g;
//        }
//    }
//    function greenFilterOpacity (color) {
//        if (color.b === 0.0) {
//            // No blue color component, is there more green than red?
//            return (color.g > color.r) ? (color.g - color.r) : 0.0;
//        } else if (color.r === 0.0) {
//            // No red color component, is there more green than blue?
//            return (color.g > color.b) ? (color.g - color.b) : 0.0;
//        } else {
//            // TODO: all three color components present  !!!!!!!!!
//            return (color.g > color.b) ? (color.g - color.b) : 0.0;
//        }
//    }
//    function blueFilterOpacity (color) {
//        if (color.g === 0.0) {
//            // No green color component, is there more blue than red?
//            return (color.b > color.r) ? (color.b - color.r) : 0.0;
//        } else if (color.r === 0.0) {
//            // No red color component, is there more blue than green?
//            return (color.b > color.g) ? (color.b - color.g) : 0.0;
//        } else {
//            // TODO: all three color components present
//            return 0.0
//        }
//    }

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
        opacity: filterOpacity(color.r, color)
        z: stackingOrder(color.r, color)
    }
    Image {
        id: iconG
        source: __sourceG
        anchors.fill: parent
        visible: ((rgbIcon.color.g > rgbIcon.color.r || rgbIcon.color.g > rgbIcon.color.b) && (rgbIcon.color.r > 0 || rgbIcon.color.b > 0))
        opacity: filterOpacity(color.g, color)
        z: stackingOrder(color.g, color)
    }
    Image {
        id: iconB
        source: __sourceB
        anchors.fill: parent
        visible: ((rgbIcon.color.b > rgbIcon.color.r || rgbIcon.color.b > rgbIcon.color.g) && (rgbIcon.color.r > 0 || rgbIcon.color.g > 0))
        opacity: filterOpacity(color.b, color)
        z: stackingOrder(color.b, color)
    }

}
