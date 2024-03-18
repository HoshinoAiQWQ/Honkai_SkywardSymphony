import QtQuick 6.2
import Honkai_SkywardSymphony
import QtQuick.Controls 6.2

Item {
    width: 1927
    height: 1120

    visible: true


    Button{
        id:btnSeele
        visible: true
        width: 300
        height: 300
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        indicator: Image{
            source: "Girls/Seelehead.png"
            anchors.fill:parent
        }
        onClicked:{
            loa.source="UiSeele.qml"
        }
    }

    Button{
        id:btnDurandal
        width:300
        height:300
        anchors.left:parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 350
        anchors.bottomMargin: 10
        indicator: Image{
            source: "Girls/Durandalhead.jpg"
            anchors.fill:parent
        }
        onClicked: {
          loa.source="UiDurandal.qml"
        }
    }

    Loader {
        id: loa
        anchors.fill: parent
    }

}
