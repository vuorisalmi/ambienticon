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

            Row {
                width: parent.width
                spacing: Theme.paddingMedium

                Item {
                    id: highlightIconW
                    property bool highlighted: true
                    width: whiteIcon.height
                    height: whiteIcon.height
                    Image {
                        id: whiteIcon
                        anchors.top: parent.top
                        //anchors.left: parent.left
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "../icons/ambient_testicon_white_96.png"
                        width: 96
                        height: 96
                    }
                    Image {
                        id: redIconW
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "../icons/ambient_testicon_red_96.png"
                        width: 96
                        height: 96
                        opacity: Theme.highlightColor.r / (Theme.highlightColor.r + Theme.highlightColor.g + Theme.highlightColor.b)
                    }
                    Image {
                        id: greenIconW
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "../icons/ambient_testicon_green_96.png"
                        width: 96
                        height: 96
                        opacity: (Theme.highlightColor.g / (Theme.highlightColor.r + Theme.highlightColor.g + Theme.highlightColor.b)) * 0.67
                    }
                    Image {
                        id: blueIconW
                        anchors.top: parent.top
                        //anchors.left: parent.left
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "../icons/ambient_testicon_blue_96.png"
                        width: 96
                        height: 96
                        opacity: (Theme.highlightColor.b / (Theme.highlightColor.r + Theme.highlightColor.g + Theme.highlightColor.b)) * 0.33
                    }
                    Component.onCompleted: { console.log("Opacity: ", redIconW.opacity, greenIconW.opacity, blueIconW.opacity) }
                }

                Item {
                    id: highlightIcon
                    property bool highlighted: true
                    width: redIcon.height
                    height: redIcon.height
                    Image {
                        id: redIcon
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "../icons/ambient_testicon_red_96.png"
                        width: 96
                        height: 96
                        opacity: 0.5
                    }
                    Image {
                        id: greenIcon
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "../icons/ambient_testicon_green_96.png"
                        width: 96
                        height: 96
                        opacity: 0.3
                    }
                    Image {
                        id: blueIcon
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "../icons/ambient_testicon_blue_96.png"
                        width: 96
                        height: 96
                        opacity: 0.1
                    }
                }
            } // Row

            // RGB icon coloring test
            SectionHeader { text: "RGB icon" }

            Row {
                Rectangle {
                    color: Qt.rgba(redSlider.value, greenSlider.value, blueSlider.value, 1.0)
                    width: 80; height: 80
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