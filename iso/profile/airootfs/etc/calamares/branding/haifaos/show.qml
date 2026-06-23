/* Haifa OS — Calamares slideshow */
import QtQuick 2.0
import calamares.slideshow 1.0

Presentation {
    id: presentation

    function nextSlide() {
        presentation.goToNextSlide()
    }

    Timer {
        id: advanceTimer
        interval: 5000
        running: presentation.activatedInCalamares
        repeat: true
        onTriggered: nextSlide()
    }

    Slide {
        Image {
            id: slide1bg
            source: "haifaos.svg"
            width: 200; height: 200
            anchors.centerIn: parent
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: slide1bg.bottom
            anchors.topMargin: 20
            text: "Welcome to Haifa OS"
            color: "white"
            font.pixelSize: 22
            font.bold: true
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            text: "Arch-based · Gaming-ready · Polished"
            color: "#aaaaaa"
            font.pixelSize: 14
        }
    }

    Slide {
        Text {
            anchors.centerIn: parent
            text: "Gaming out of the box\n\nSteam · Lutris · Gamemode · MangoHud\nlinux-cachyos kernel with BORE scheduler"
            color: "white"
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            lineHeight: 1.6
        }
    }

    Slide {
        Text {
            anchors.centerIn: parent
            text: "Choose your desktop\n\nKDE Plasma · GNOME · Hyprland\nAll available at install time"
            color: "white"
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            lineHeight: 1.6
        }
    }
}
