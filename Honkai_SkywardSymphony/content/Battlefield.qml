import QtQuick 6.2
import QtQuick.Controls 6.2
import Honkai_SkywardSymphony
import QtMultimedia

Rectangle{
        id:battle
        width: 1923
        height: 1200

        Rectangle{
            id:enemy
            width: 150
            height:150
            x:Math.random()*1750
            y:Math.random()*1050
            Image {
                id: bhs1
                source: "battle/enemy1.png"
                anchors.fill: parent
                visible: true
            }
            Image {
                id: bhs2
                source: "battle/enemy2.png"
                anchors.fill: parent
                visible: false
            }
            Image {
                id: bhs3
                source: "battle/enermy3.png"
                anchors.fill: parent
                visible: false
            }
        }
        Rectangle{
            id: player
            width: 200
            height: 200
            radius: 15
            x:10
            y:500
            color:Qt.rgba(0,0,0,0)
            visible: true

            Image {
                id: seele1
                source: "battle/player1.png"
                anchors.fill: parent
                visible: false
            }
            Image {
                id:seele2
                source: "battle/player4.png"
                anchors.fill: parent
                visible: true
            }
            Image {
                id:seele3
                source: "battle/player3.png"
                anchors.fill: parent
                visible: false
            }
            Image {
                id:seele4
                source: "battle/player2.png"
                anchors.fill: parent
                visible: false
            }
            Image {
                id: seele5
                source: "battle/player5.png"
                anchors.fill: parent
                visible: false
            }

            Component.onCompleted: {
                forceActiveFocus();
            }

            property bool zuo: false
            property bool you: false
            property bool shang: false
            property bool xia: false



            Keys.onPressed: {
                if (event.key === Qt.Key_Up) {
                    shang = true;

                }
                if (event.key === Qt.Key_Down) {
                    xia = true;
                }
                if (event.key === Qt.Key_Left) {
                    zuo = true;
                }
                if (event.key === Qt.Key_Right) {
                    you = true;
                }
            }

            Keys.onReleased: {
                if (event.key === Qt.Key_Up) {
                    shang = false;

                }
                if (event.key === Qt.Key_Down) {
                    xia = false;
                }
                if (event.key === Qt.Key_Left) {
                    zuo = false;
                }
                if (event.key === Qt.Key_Right) {
                    you = false;
                }
            }
        }




    Timer{//移动计时器
        interval: 50
        running: true
        repeat: true
        onTriggered:{
            if (player.shang) {
                player.y-=15
            }
            if (player.xia) {
               player.y+=15
            }
            if (player.zuo) {
                player.x-=15
            }
            if (player.you) {
                player.x+=15
            }
        }
    }

    Timer{//敌人移动计时器
        interval:7
        running: true
        repeat:true
        onTriggered: {
            if(player.x>enemy.x){
                enemy.x+=1
            }
            else enemy.x-=1

            if(player.y>enemy.y){
                enemy.y+=1
            }
            else enemy.y-=1
        }
    }

    Timer{
        //敌人动态
        interval: 200
        running:true
        repeat:true
        onTriggered: {
          if(bhs1.visible){
              bhs1.visible=false
              bhs2.visible=true
          }
          else if(bhs2.visible){
              bhs2.visible=false
              bhs3.visible=true
          }

          else if(bhs3.visible){
              bhs3.visible=false
              bhs1.visible=true
          }
        }
    }

    Timer{
        //角色动态
        interval: 180
        running:true
        repeat:true
        onTriggered: {
            if(seele5.visible){
                seele5.visible=false
                seele1.visible=true
            }
            else if(seele1.visible){
                seele1.visible=false
                seele2.visible=true
            }
            else if(seele2.visible){
                seele2.visible=false
                seele3.visible=true
            }
            else if(seele3.visible){
                seele3.visible=false
                seele4.visible=true
            }
            else if(seele4.visible){
                seele4.visible=false
                seele5.visible=true
            }

        }
    }
}
