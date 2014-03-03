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
                    color: Qt.rgba(redSlider.value, greenSlider.value, blueSlider.value, 1.0)
                    source: "../icons/ambient_testicon_?_86.png"
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
