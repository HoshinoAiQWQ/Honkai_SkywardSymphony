import QtQuick 6.2
import QtQuick.Controls 6.2
import Honkai_SkywardSymphony
import QtMultimedia

Rectangle {
    id: root
    width: Constants.width
    height: Constants.height
    color: Constants.backgroundColor
    visible:true

    property int mx: 0
    property int my: 0

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true

        Button{//back按钮
            id:back
            z:1
            width: 150
            height: 150
            visible:false
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 10
            anchors.bottomMargin: 10
            text: "Back"
            onClicked: {
                root.visible=false
                loa.source="MainUi.qml"
            }
            font.pixelSize: 20
            opacity: 0.7
            font.bold: true
        }


        Text{//名字
            z:1
            id:name
            text: "希儿·芙乐艾"
            font.pixelSize: 70
            font.family: "华文行楷"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 75
            anchors.topMargin: 125
            color: Qt.rgba(75/255,76/255,168/255,1)
            opacity:0
        }


        NumberAnimation {//名字文本的过渡
            id:names
            target: name
            property: "opacity"
            duration: 2000
            easing.type: Easing.InOutQuad
            from: 0
            to:1
        }
        NumberAnimation {//技能介绍面板的过渡
            id:skillrecAnimation
            target: skillrec
            property: "opacity"
            duration: 2000
            easing.type: Easing.InOutQuad
            from: 0
            to:0.55

        }

        Rectangle{//技能介绍面板
            id:skillrec
            z:1
            color: "#F0F0F0" // 浅灰色背景
            opacity: 0 // 透明
            radius: 10 // 圆角
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 75
            anchors.topMargin: 250
            width: 400
            height: 600
            smooth: true
            Text {
                id: skill1
                text: qsTr("技能：希儿向前扔出回旋的镰刀，来去过程伤害独立计算，伤害20；希儿收割灵魂，此技能击杀目标时，额外回复5点能量。CD:10s                            终结技：希儿展开死生领域，持续30秒，展开时消除所有地方弹幕，并且在领域内使自己的所有伤害暴击(伤害X2)。消耗能量：150")
                font.pixelSize: 35
                font.family: "楷书"
                anchors.fill: parent
                color: Qt.rgba(67/255,70/255,158/255,1)
                wrapMode: Text.WordWrap
                smooth: true // 让文本移动时更平滑
            }
       }



        AnimatedImage {//过场希儿
            id: inseele
            source: "Girls/inSeele.gif"
            anchors.fill: parent
            visible: true
            speed: 1.5
        }

        AnimatedImage{//ui希儿
            id:uiseele
            source:"Girls/uiSeele.gif"
            anchors.fill: parent
            visible:false
        }

        Rectangle{//黑屏
            id:blackscreen
            color: "black"
            anchors.fill: parent
            opacity: 0
        }

        Timer{//计时器，黑屏消失
            id:timer1
            interval: 6667
            running:true
            onTriggered: {
                inseele.visible=false
                uiseele.visible=true
                back.visible=true
                names.start()
                skillrecAnimation.start()
            }
        }

        Timer{ //计时器，变黑屏
            id:timer2
            interval: 5667
            running:true
            onTriggered: {
                blackscreenOpacityAnimation1.start()

            }

        }

        NumberAnimation {
                id: blackscreenOpacityAnimation1//黑屏动画过渡0 1
                target: blackscreen
                property: "opacity"
                duration: 1000 // 淡入淡出动画持续时间
                from: 0 // 开始时完全透明
                to: 1 // 结束时完全不透明
                easing.type: Easing.InOutQuad // 使用缓动函数使动画更自然
                onStopped: {
                    // 当动画停止时，根据黑屏是否可见决定是否继续播放下一阶段的动画
                    blackscreenOpacityAnimation2.start()
                }
            }

        NumberAnimation {
                id: blackscreenOpacityAnimation2//黑屏动画过渡1 0
                target: blackscreen
                property: "opacity"
                duration: 1000 // 淡入淡出动画持续时间
                from: 1 // 开始时完全透明
                to: 0 // 结束时完全不透明
                easing.type: Easing.InOutQuad // 使用缓动函数使动画更自然
            }

    }



}
