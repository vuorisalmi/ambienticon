import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    allowedOrientations: Orientation.Portrait + Orientation.Landscape + Orientation.LandscapeInverted

    SilicaFlickable {
        id: flickable
        anchors.fill: parent
        contentHeight: column.height

        VerticalScrollDecorator { flickable: flickable }

        Column {
            id: column

            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - (2 * Theme.paddingLarge)
            spacing: Theme.paddingMedium

            PageHeader {
                title: "RGB icon overlay"
            }

            // Highlight icon coloring test
            SectionHeader { text: "Highlighted icon" }

            Row {
                width: parent.width
                spacing: Theme.paddingLarge
                Item {
                    width: 86; height: 86
                    Rectangle {
                        color: Theme.highlightColor
                        width: 80; height: 80
                        anchors.centerIn: parent
                    }
                }
                HighlightIcon {
                    source: "../icons/ambient_testicon_?_86.png"
                }
            } // Row

            // RGB icon coloring test
            SectionHeader { text: "RGB icon" }

            Row {
                spacing: Theme.paddingLarge
                Item {
                    width: 86; height: 86
                    Rectangle {
                        color: Qt.rgba(redSlider.value, greenSlider.value, blueSlider.value, 1.0)
                        width: 80; height: 80
                        anchors.centerIn: parent
                    }
                }
                RGBIcon {
                    id: rgbIcon
                    color: Qt.rgba(redSlider.value, greenSlider.value, blueSlider.value, 1.0)
                    source: "../icons/ambient_testicon_?_86.png"
                }
                Column {
                    Label { text: "R " + rgbIcon.filterOpacity(rgbIcon.color.r, rgbIcon.color).toFixed(2);
                            font.pixelSize: 20
                            color: (rgbIcon._redFilterVisible) ? "white" : Theme.secondaryColor }
                    Label { text: "G " + rgbIcon.filterOpacity(rgbIcon.color.g, rgbIcon.color).toFixed(2);
                            font.pixelSize: 20
                            color: (rgbIcon._greenFilterVisible) ? "white" : Theme.secondaryColor }
                    Label { text: "B " + rgbIcon.filterOpacity(rgbIcon.color.b, rgbIcon.color).toFixed(2);
                            font.pixelSize: 20
                            color: (rgbIcon._blueFilterVisible) ? "white" : Theme.secondaryColor }
                }
                Column {
                    Label { text: "RG " + rgbIcon.filter2ColorOpacity(rgbIcon.color.r, rgbIcon.color.g, rgbIcon.color.b).toFixed(2);
                            font.pixelSize: 20
                            color: (rgbIcon._rgFilterVisible) ? "white" : Theme.secondaryColor }
                    Label { text: "RB " + rgbIcon.filter2ColorOpacity(rgbIcon.color.r, rgbIcon.color.b, rgbIcon.color.g).toFixed(2);
                            font.pixelSize: 20
                            color: (rgbIcon._rbFilterVisible) ? "white" : Theme.secondaryColor }
                    Label { text: "GB " + rgbIcon.filter2ColorOpacity(rgbIcon.color.g, rgbIcon.color.b, rgbIcon.color.r).toFixed(2);
                            font.pixelSize: 20
                            color: (rgbIcon._gbFilterVisible) ? "white" : Theme.secondaryColor }
                }
//                Column {
//                    Label { text: (rgbIcon._redFilterVisible) ? "R" : " "; font.pixelSize: 20 }
//                    Label { text: (rgbIcon._greenFilterVisible) ? "G" : " "; font.pixelSize: 20 }
//                    Label { text: (rgbIcon._blueFilterVisible) ? "B" : " "; font.pixelSize: 20 }
//                }
                Column {
                    Label { text: "Base: " + rgbIcon.__baseColor; font.pixelSize: 20 }
                    Label { text: rgbIcon.__iconName[rgbIcon.__baseColor]; font.pixelSize: 20 }
                    Label { text: "Opac " + rgbIcon.baseOpacity(rgbIcon.color).toFixed(2); font.pixelSize: 20 }
                }
            }

            // RGB sliders
            Slider {
                id: redSlider
                value: 1.00
                minimumValue: 0.00
                maximumValue: 1.00
                stepSize: 0.01
                width: parent.width
                valueText: value.toFixed(2)
                label: "Red"
            }
            Slider {
                id: greenSlider
                value: 0.00
                minimumValue: 0.00
                maximumValue: 1.00
                stepSize: 0.01
                width: parent.width
                valueText: value.toFixed(2)
                label: "Green"
            }
            Slider {
                id: blueSlider
                value: 0.00
                minimumValue: 0.00
                maximumValue: 1.00
                stepSize: 0.01
                width: parent.width
                valueText: value.toFixed(2)
                label: "Blue"
            }

            // Misc color test squares
            SectionHeader { text: "Overlapping icon test" }

            Rectangle {
                width: parent.width; height: 86
                color: "black"

                Image {
                    x: 0; y: 0
                    width: 86; height: 86
                    source: "../icons/ambient_testicon_red_86.png"
                    opacity: 0.75
                }
                Image {
                    x: 30; y: 0
                    width: 86; height: 86
                    source: "../icons/ambient_testicon_red_86.png"
                    opacity: 0.75
                }
                Image {
                    x: 120; y: 0
                    width: 86; height: 86
                    source: "../icons/ambient_testicon_red_86.png"
                    opacity: 0.5
                }
                Image {
                    x: 120+30; y: 0
                    width: 86; height: 86
                    source: "../icons/ambient_testicon_red_86.png"
                    opacity: 0.5
                }
                Image {
                    x: 240; y: 0
                    width: 86; height: 86
                    source: "../icons/ambient_testicon_red_86.png"
                    opacity: 0.25
                }
                Image {
                    x: 240+30; y: 0
                    width: 86; height: 86
                    source: "../icons/ambient_testicon_red_86.png"
                    opacity: 0.25
                }
            }

            Row {
                spacing: Theme.paddingLarge
                Item {
                    width: 10; height: 86
                    Image {
                        width: 86; height: 86
                        source: "../icons/ambient_testicon_red_86.png"
                        opacity: 0.75
                    }
                }
                Item {
                    width: 86; height: 86
                    Image {
                        width: 86; height: 86
                        source: "../icons/ambient_testicon_red_86.png"
                        opacity: 0.75
                    }
                }

                Item {
                    width: 10; height: 86
                    Image {
                        width: 86; height: 86
                        source: "../icons/ambient_testicon_red_86.png"
                        opacity: 0.5
                    }
                }
                Item {
                    width: 86; height: 86
                    Image {
                        width: 86; height: 86
                        source: "../icons/ambient_testicon_red_86.png"
                        opacity: 0.5
                    }
                }

                Item {
                    width: 10; height: 86
                    Image {
                        width: 86; height: 86
                        source: "../icons/ambient_testicon_red_86.png"
                        opacity: 0.25
                    }
                }
                Item {
                    width: 86; height: 86
                    Image {
                        width: 86; height: 86
                        source: "../icons/ambient_testicon_red_86.png"
                        opacity: 0.25
                    }
                }
            }


            // Misc color test squares
            SectionHeader { text: "Misc coloring tests" }

            // Testing RED
            Row {
                Rectangle {
                    width: 80; height: 80
                    color: Qt.rgba(1.0, 0.0, 0.0, 1.0)
                }
                Rectangle {
                    width: 80; height: 80
                    color: Qt.rgba(0.75, 0.0, 0.0, 1.0)
                }
                Rectangle {
                    width: 80; height: 80
                    color: Qt.rgba(0.5, 0.0, 0.0, 1.0)
                }
                Rectangle {
                    width: 80; height: 80
                    color: Qt.rgba(0.25, 0.0, 0.0, 1.0)
                }
            }
            Row {
                Rectangle {
                    width: 80; height: 80
                    color: "#000000"
                    Rectangle {
                        anchors.fill: parent
                        color: Qt.rgba(1.0, 0.0, 0.0, 1.0)
                    }
                }
                Rectangle {
                    width: 80; height: 80
                    color: "#000000"
                    Rectangle {
                        anchors.fill: parent
                        color: Qt.rgba(1.0, 0.0, 0.0, 0.75)
                    }
                }
                Rectangle {
                    width: 80; height: 80
                    color: "#000000"
                    Rectangle {
                        anchors.fill: parent
                        color: Qt.rgba(1.0, 0.0, 0.0, 0.5)
                    }
                }
                Rectangle {
                    width: 80; height: 80
                    color: "#000000"
                    Rectangle {
                        anchors.fill: parent
                        color: Qt.rgba(1.0, 0.0, 0.0, 0.25)
                    }
                }
            }

            // Testing RED + GREEN
            Row {
                Rectangle {
                    width: 80; height: 80
                    color: Qt.rgba(1.0, 1.0, 0.0, 1.0)
                }
                Rectangle {
                    width: 80; height: 80
                    color: Qt.rgba(0.75, 0.75, 0.0, 1.0)
                }
                Rectangle {
                    width: 80; height: 80
                    color: Qt.rgba(0.5, 0.5, 0.0, 1.0)
                }
                Rectangle {
                    width: 80; height: 80
                    color: Qt.rgba(0.25, 0.25, 0.0, 1.0)
                }
            }
            Row {
                Rectangle {
                    width: 80; height: 80
                    color: "#ffffff"
                    Rectangle {
                        anchors.fill: parent
                        color: Qt.rgba(1.0, 1.0, 0.0, 1.0)
                    }
                    Rectangle {
                        anchors.fill: parent
                        color: Qt.rgba(0.0, 0.0, 0.0, 0.00)
                    }
                }
                Rectangle {
                    width: 80; height: 80
                    color: "#000000"
                    Rectangle {
                        anchors.fill: parent
                        color: Qt.rgba(1.0, 0.0, 0.0, 0.75)
                    }
                    Rectangle {
                        anchors.fill: parent
                        color: Qt.rgba(0.0, 1.0, 0.0, 0.375)
                    }
                }
                Rectangle {
                    width: 80; height: 80
                    color: "#000000"
                    Rectangle {
                        anchors.fill: parent
                        color: Qt.rgba(1.0, 0.0, 0.0, 1.0)
                    }
                    Rectangle {
                        anchors.fill: parent
                        color: Qt.rgba(0.0, 1.0, 0.0, 0.5)
                    }
                }
                Rectangle {
                    width: 80; height: 80
                    color: "#000000"
                    Rectangle {
                        anchors.fill: parent
                        color: Qt.rgba(1.0, 0.0, 0.0, 0.5)
                    }
                    Rectangle {
                        anchors.fill: parent
                        color: Qt.rgba(0.0, 1.0, 0.0, 0.25)
                    }
                }
            }

        } // Column
    }

    property color hColor: Theme.highlightColor
    Component.onCompleted: { console.log("Highlight color: ", hColor.r, hColor.g, hColor.b, hColor.a) }
}
