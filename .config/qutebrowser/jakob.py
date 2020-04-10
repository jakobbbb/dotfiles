# My base configuration.
# Add the following line to the main `config.py`"
#   config.source('jakob.py')

# Enable JavaScript.
# Type: Bool
c.content.javascript.enabled = False

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.notifications', False)

# Open new tabs (middleclick/ctrl+click) in the background.
# Type: Bool
c.tabs.background = True

# Stack related tabs on top of each other when opened consecutively.
# Only applies for `next` and `prev` values of
# `tabs.new_position.related` and `tabs.new_position.unrelated`.
# Type: Bool
c.tabs.new_position.stacking = True

# Position of the tab bar.
# Type: Position
# Valid values:
#   - top
#   - bottom
#   - left
#   - right
c.tabs.position = 'left'

# Width (in pixels or as percentage of the window) of the tab bar if
# it's vertical.
# Type: PercOrInt
c.tabs.width = '13%'

# Background color of the tab bar.
# Type: QssColor
c.colors.tabs.bar.bg = '#0f131f'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = '#333744'

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = '#4c505e'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = '#405779'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = '#405779'

# Bindings for normal mode
# Bindings for normal mode
config.bind(',M', 'hint links spawn mpv {hint-url}')
config.bind(',P', 'hint links run open -p {hint-url}')
config.bind(',m', 'spawn mpv {url}')
config.bind(',p', 'open -p')
