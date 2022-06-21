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
config.set("content.notifications.enabled", False)

config.set("content.autoplay", False)

config.set("url.searchengines", {"DEFAULT": "https://google.com/search?q={}"})

# Open new tabs (middleclick/ctrl+click) in the background.
c.tabs.background = True

# Stack related tabs on top of each other when opened consecutively.
c.tabs.new_position.stacking = True

# Tab bar.
c.tabs.position = "left"
c.tabs.width = "10%"
c.colors.tabs.bar.bg = "#160f1f"
c.colors.tabs.odd.bg = "#393344"
c.colors.tabs.even.bg = "#524c5e"
c.colors.tabs.selected.odd.bg = "#544079"
c.colors.tabs.selected.even.bg = "#594079"

config.set("tabs.padding", {"bottom": 1, "left": 5, "right": 5, "top": 1})

# Bindings for normal mode
config.bind(",M", "hint links spawn mpv {hint-url}")
config.bind(",Z", "hint links spawn zathura {hint-url}")
config.bind(",N", "hint links spawn umpv {hint-url}")
config.bind(",P", "hint links run open -p {hint-url}")
config.bind(",m", "spawn mpv {url}")
config.bind(",n", "spawn umpv {url}")
config.bind(",p", "open -p")

config.bind(",o", "edit-text")
config.bind("\\f", "set-cmd-text -s :tab-select")
c.editor.command = ["termite", "-e" "nvim {file}"]

rubout = 'rl-rubout "/ .,#"'
config.bind("<Ctrl-w>", rubout, mode="prompt")
config.bind("<Ctrl-w>", rubout, mode="command")

c.colors.webpage.darkmode.enabled = True
# c.tabs.show = "multiple"
config.bind("xx", "config-cycle tabs.show switching multiple")
c.tabs.show_switching_delay = 500
