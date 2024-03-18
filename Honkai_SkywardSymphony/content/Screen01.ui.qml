/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick 6.2
import QtQuick.Controls 6.2
import Honkai_SkywardSymphony



Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

    property int currentState: 0

    AnimatedImage {
        id: uiSeele
        source: "Girls/uiSeele.gif"
        anchors.fill: parent
        fillMode: Image.Stretch
    }

    AnimatedImage{
        id:inSeele
        source: ""
        anchors.fill: parent
        fillMode: Image.Stretch
    }

    Rectangle{
        id:blackScreen
        color: "black"
        width: parent.width
        height:parent.height

    }


}

