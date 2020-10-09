#!/usr/bin/env python

import i3ipc
import subprocess
from sys import argv


def get_name(window):
    return "%s - %s" % (window.window_class, window.window_title)


def dmenu_choose(items):
    """
    Get a choice using dmenu.
    """
    items = "\n".join(sorted(items))
    cmd = ["dmenu", "-l", "10", "-i"]
    p = subprocess.Popen(
        cmd,
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )
    out = p.communicate(input=items.encode())[0]
    return out.decode().strip()


def choose_window(windows):
    """
    Let the user choose a window via dmenu.
    """
    entries = {}  # unique name -> window
    fmt = "%s #%s"
    for w in windows:
        if get_name(w) in entries.keys():
            # Update the other entry
            entries[
                fmt % (get_name(w), entries.pop(get_name(w)).id)
            ] = entries[get_name(w)]
            name = fmt % (get_name(w), w.id)
        else:
            name = get_name(w)
        entries[name] = w
    choice = dmenu_choose(entries.keys())
    return entries[choice]


def get_windows(ws):
    """
    Get a list of all windows in a workspace.
    """
    windows = []
    for w in ws.descendants():
        if w.window and w.window_class != "i3bar":
            windows.append(w)
    return windows


def main():
    i3 = i3ipc.Connection()

    if len(argv) >= 2 and argv[1] == "-g":
        wins = get_windows(i3.get_tree())
    else:
        ws = i3.get_tree().find_focused().workspace()
        wins = get_windows(ws)

    if len(wins) == 0:
        return

    focus = choose_window(wins)
    focus.command("focus")


if __name__ == "__main__":
    main()
