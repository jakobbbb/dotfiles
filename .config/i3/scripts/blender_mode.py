#!/usr/bin/env python3

from i3ipc import Connection, Event

i3: Connection = Connection()


def check_for_blender(i3: Connection, _):
    focused = i3.get_tree().find_focused()
    if focused and focused.window_class == "Blender":
        i3.command("mode blender")
    else:
        i3.command("mode default")


i3.on(Event.WINDOW_FOCUS, check_for_blender)
i3.on(Event.WORKSPACE_FOCUS, check_for_blender)
i3.main()
