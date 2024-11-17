if [ -x "$(command -v ruby)" ]; then
    export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
    export GEM_BIN="$GEM_HOME/bin:"
fi
# If you come from bash you might have to change your $PATH.
export PATH=/opt/rocm/hip/bin:$HOME/bin:$HOME/.cargo/bin:/usr/local/bin:$HOME/gocode/bin:$HOME/.local/bin:$GEM_BIN:/opt/rocm/bin/:$PATH

# Unbork HIP
export HSA_OVERRIDE_GFX_VERSION=10.3.0

# nicer drwxrwxrwx LS_COLOR
export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:ow=30;42"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Path to your oh-my-zsh installation.
  export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="jakobbbb"

# Override theme on linux (e.g. Ctrl+Alt+F2) term
if [[ "$TERM" == linux ]]; then
    ZSH_THEME="apowerster"
fi

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

if [ -x "$(command -v nvim)" ]; then
    export EDITOR='nvim'
else
    export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias pipi="python -m pip install --user"
alias vim="nvim"
MUTT=$(which mutt)
mutt() { $MUTT -F ~/mail/$1/muttrc || $MUTT "$@" }
alias ms="~/.mutt/scripts/ms"
alias re="rem -cu+3b1mw\$COLUMNS"
alias cal="calendar"
alias xssh="TERM=xterm-256color ssh"
pc () {
  fzf_query=""
  if [ ! -z "$1" ]; then fzf_query="--query"; fi
  pass -c $(find $HOME/.password-store -type f | sed -e "s/^.*\.password-store\/\(.*\)\.gpg/\1/g" | fzf -1 $fzf_query $1)
}
pp () {
  fzf_query=""
  if [ ! -z "$1" ]; then fzf_query="--query"; fi
  pass $(find $HOME/.password-store -type f | sed -e "s/^.*\.password-store\/\(.*\)\.gpg/\1/g" | fzf -1 $fzf_query $1)
}
tablet() {
    if [ "$1" = "on" ]; then
        ~/.config/i3/custom.avail/000-xrandr-$(hostname).sh tablet $2
    elif [ "$1" = "off" ]; then
        ~/.config/i3/custom.avail/000-xrandr-$(hostname).sh notablet
    elif [ "$1" = "mirror" ]; then
        ~/.config/i3/custom.avail/000-xrandr-$(hostname).sh tabletmirror $2
    fi
    ~/.config/i3/custom.avail/010-redshift.sh
}
wy () {
    export WY_OPT=$1
    source ~/bin/yk.source
}
vpn () {
    sudo systemctl $2 openvpn-client@$1.service
    if [ "$2" = "start" ]; then
        pass -c vpn/$1
        sudo systemd-tty-ask-password-agent --query
        xclip -sel clip <<< ""
    fi
}

#setopt autolist
#unsetopt menucomplete
setopt noautomenu

export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1  # unity hates me

export GOPATH="$HOME/gocode"
export GO=$(which go)

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git -i'

export RIPGREP_CONFIG_PATH="$HOME/.config/ripgreprc"

export GNUMAKEFLAGS=-j$(getconf _NPROCESSORS_ONLN)
export MAKEFLAGS=-j$(getconf _NPROCESSORS_ONLN)

if [ -f "$XDG_CONFIG_HOME/thm/gtk_theme" ]; then
  export GTK_THEME=$(cat "$XDG_CONFIG_HOME/thm/gtk_theme")
fi

HISTSIZE=400000
SAVEHIST=$HISTSIZE

# `Mode_switch + Shift + H` is xmodmapped to `Left`, so when pressing
# `Ctrl+Left` I'm also holding `Shift`, which for very historical reasons (ANSI
# Escape Codes, CSI sequences), outputs a `D`.  Here, I'm remapping the CSI
# sequence.  Note: The codes can be found using `cat`
bindkey "^[[1;2C" forward-word
bindkey "^[[1;2D" backward-word

# Auto-Start X
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    startx
fi
