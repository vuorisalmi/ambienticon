/*
  Copyright (c) 2014, Jussi Vuorisalmi <jussi.vuorisalmi@iki.fi>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
      * Redistributions of source code must retain the above copyright
        notice, this list of conditions and the following disclaimer.
      * Redistributions in binary form must reproduce the above copyright
        notice, this list of conditions and the following disclaimer in the
        documentation and/or other materials provided with the distribution.
      * Neither the name of the <organization> nor the
        names of its contributors may be used to endorse or promote products
        derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDER BE LIABLE FOR ANY
  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

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


        } // Column
    }

    property color hColor: Theme.highlightColor
    Component.onCompleted: { console.log("Highlight color: ", hColor.r, hColor.g, hColor.b, hColor.a) }
}
