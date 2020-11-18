# Base configuration and color scheme.
# Add the following line to the main `config.py`"
#   config.source('jakob.py')

# Disable JS
c.content.javascript.enabled = False
# Exceptions
for url in [
    "chrome-devtools://*",
    "devtools://*",
    "chrome://*/*",
    "qute://*/*",
]:
    config.set("content.javascript.enabled", True, url)

# No notifications at all
config.set("content.notifications", False)

config.set("content.autoplay", False)

config.set("url.searchengines", {"DEFAULT": "https://google.com/search?q={}"})

# Open new tabs (middleclick/ctrl+click) in the background.
c.tabs.background = True

# Stack related tabs on top of each other when opened consecutively.
c.tabs.new_position.stacking = True

# Tab bar.
c.tabs.position = "left"
c.tabs.width = "13%"
c.colors.tabs.bar.bg = "#0f131f"
c.colors.tabs.odd.bg = "#333744"
c.colors.tabs.even.bg = "#4c505e"
c.colors.tabs.selected.odd.bg = "#405779"
c.colors.tabs.selected.even.bg = "#405779"
config.set("tabs.padding", {"bottom": 1, "left": 5, "right": 5, "top": 1})

# Bindings for normal mode
config.bind(",M", "hint links spawn mpv {hint-url}")
config.bind(",Z", "hint links spawn zathura {hint-url}")
config.bind(",N", "hint links spawn umpv {hint-url}")
config.bind(",P", "hint links run open -p {hint-url}")
config.bind(",m", "spawn mpv {url}")
config.bind(",n", "spawn umpv {url}")
config.bind(",p", "open -p")

config.bind(",o", "open-editor")
config.bind("\\f", "set-cmd-text -s :buffer")
c.editor.command = ["termite", "-e" "nvim {file}"]
