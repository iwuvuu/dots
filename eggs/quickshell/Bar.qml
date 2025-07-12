import Quickshell // imports PanelWindow
import Quickshell.Io // imports Process
import QtQuick // imports Text

Scope {
	Variants {
		model: Quickshell.screens;
		// PanelWindow -> window type for bars, widgets, overlays
		// FloastingWindow -> standard desktop window
		PanelWindow {
			property var modelData
			screen: modelData
			anchors {
				top: true
				left: true
				right: true
			}
			implicitHeight: 30

			ClockWidget { // ClockWidget.qml file
				anchors.centerIn: parent
			}
		}
	}

}

