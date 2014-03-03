# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = ambienticon

CONFIG += sailfishapp

SOURCES += src/ambienticon.cpp

OTHER_FILES += qml/ambienticon.qml \
    qml/cover/CoverPage.qml \
    qml/pages/SecondPage.qml \
    rpm/ambienticon.spec \
    rpm/ambienticon.yaml \
    ambienticon.desktop \
    qml/pages/MainPage.qml \
    qml/pages/ColorOverlayPage.qml \
    qml/icons/ambient_testicon_white_96.png \
    graphics/ambient_testicon.svg \
    qml/pages/IconOverlayPage.qml \
    qml/icons/ambient_testicon_red_96.png \
    qml/icons/ambient_testicon_green_96.png \
    qml/icons/ambient_testicon_blue_96.png \
    qml/pages/RGBIcon.qml

