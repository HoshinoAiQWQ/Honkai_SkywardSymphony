import QtQuick 6.2
import QtQuick.Controls 6.2
import Honkai_SkywardSymphony

Rectangle {
    id: root
    width: Constants.width
    height: Constants.height
    color: Constants.backgroundColor
    visible:true

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
        text: "幽兰戴尔"
        font.pixelSize: 70
        font.family: "华文行楷"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 135
        anchors.topMargin: 125
        color: Qt.rgba(221/255,19/255,13/255,1)
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

        Text {
            id: skill1
            text: qsTr("技能：幽兰戴尔发射矩形霰弹，伤害30，每使用此技能击杀一个目标，回复5生命值并减少1sCD。CD:10s                            终结技：幽兰戴尔进入10s冲锋状态，移速翻倍，停止射击，使弹幕和碰撞伤害降低90%，并在碰撞时造成30伤害。消耗能量：100")
            font.pixelSize: 35
            font.family: "楷书"
            anchors.fill: parent
            color: Qt.rgba(65/255,32/255,37/255,1)
            wrapMode: Text.WordWrap
            smooth: true // 让文本移动时更平滑
        }

   }

    NumberAnimation {//技能介绍面板的过渡
        id:skillrecAnimation
        target: skillrec
        property: "opacity"
        duration: 2000
        easing.type: Easing.InOutQuad
        from: 0
        to:0.6
    }


    AnimatedImage { //过场幽兰戴尔
        id: indurandal
        source: "Girls/inDurandal.gif"
        anchors.fill: parent
        visible: true
        speed: 1.5
    }

    AnimatedImage{//看板幽兰戴尔
        id:uidurandal
        source:"Girls/uiDurandal.gif"
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
            indurandal.visible=false
            uidurandal.visible=true
            back.visible=true
            names.start()
            skillrecAnimation.start()
        }
    }

    Timer{//计时器，黑屏开始
        id:timer2
        interval: 5667
        running:true
        onTriggered: {
            blackscreenOpacityAnimation1.start()

        }
    }

    NumberAnimation {//黑屏淡入动画效果
            id: blackscreenOpacityAnimation1
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

    NumberAnimation {//黑屏淡出动画效果
            id: blackscreenOpacityAnimation2
            target: blackscreen
            property: "opacity"
            duration: 1000 // 淡入淡出动画持续时间
            from: 1 // 开始时完全透明
            to: 0 // 结束时完全不透明
            easing.type: Easing.InOutQuad // 使用缓动函数使动画更自然
        }

    Loader {
        id: loa
        anchors.fill: parent
    }


}
