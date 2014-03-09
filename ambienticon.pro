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
    rpm/ambienticon.spec \
    rpm/ambienticon.yaml \
    ambienticon.desktop \
    qml/pages/MainPage.qml \
    qml/pages/ColorOverlayPage.qml \
    graphics/ambient_testicon.svg \
    qml/pages/IconOverlayPage.qml \
    qml/pages/RGBIcon.qml \
    qml/icons/ambient_testicon_blue_86.png \
    qml/icons/ambient_testicon_black_86.png \
    qml/icons/ambient_testicon_green_86.png \
    qml/icons/ambient_testicon_red_86.png \
    qml/icons/ambient_testicon_green+blue_86.png \
    qml/icons/ambient_testicon_white_86.png \
    qml/icons/ambient_testicon_red+green_86.png \
    qml/icons/ambient_testicon_red+blue_86.png \
    qml/pages/HighlightIcon.qml \
    TODO.txt

