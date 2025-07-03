import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable } from "astal"


function Time() {
let timetoggle = false;
let time;

	if (timetoggle == true) {
		time = Variable("").poll(1000, "date +%R");
	}
	else {
		time = Variable("").poll(1000, "date +%H");
	}
	return <button
	>
			<label label={time()}/>
		</button>
}

// custom widget using JSX.Element to use JSX syntax and to create React element on the screen
//
// NOTE that user made widgets must start with Uppercase letters (myWidgets) lower case is used
// by builtin widgets
function TestButton(){
	return <button onClicked="echo smelly">
		<label label="Poopie poo"/>
	</button>
}
function AnotherButton(): JSX.Element {
	const label = "Sepultura"
	return <button label={label} />
}



// export default function - defines files main functiont one file can contain only one default
// function
//
export default function Bar(gdkmonitor: Gdk.Monitor) {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

    return <window
        className="Bar"
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP | LEFT | RIGHT}
        application={App}>
        <centerbox>
            <button
                onClicked="echo hello"
                halign={Gtk.Align.CENTER}
            >
                Welcome to AGS!
            </button>
            <box>
							<TestButton/>
							<AnotherButton/>
						</box>
						<box>
							<Time/>
						</box>

        </centerbox>
    </window>
}
