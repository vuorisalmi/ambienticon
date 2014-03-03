import QtQuick 2.0
import Sailfish.Silica 1.0
import QtGraphicalEffects 1.0

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
                title: "QML ColorOverlay"
            }

            Item {
                id: highlightIcon
                property bool highlighted: true
                width: parent.width
                height: icon.height
                Image {
                    id: icon
                    anchors.top: parent.top
                    //anchors.left: parent.left
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "../icons/ambient_testicon_white_86.png"
                    width: 86
                    height: 86
                }
                ColorOverlay {
                    anchors.fill: icon
                    source: icon
                    color: (highlightIcon.highlighted) ? Theme.highlightColor : "transparent"
                }
            }
            Label {
                text: "Highlighted with a QML ColorOverlay."
                color: Theme.highlightColor
                width: parent.width
            }
            Button {
                text: "Toggle highlight"
                onClicked: { highlightIcon.highlighted = !highlightIcon.highlighted }
            }


//            TextSwitch {
//                text: "Highlighted"
//            }

//            Separator {
//                alignment: Qt.AlignHCenter

//            }


        }
    }
}
