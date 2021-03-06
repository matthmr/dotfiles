setopt autocd autopushd
set -k

PROMPT='%F{red}┌[%F{reset}%B%n%b%F{red}@%F{reset}%B%m%b%F{red}] %F{red}[%F{reset}%B%l%b%F{red}] %F{red}[%F{reset}%B%t%b%F{red}] %(?..[%F{reset}%B%?%b%F{red}])
└[%F{reset}%B%2~%b%F{red}]>%F{reset} '
PS2=' %F{red}|>%F{reset} '

autoload -U compinit
compinit
_comp_options+=(globdots)

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select

HISTFILE=~/.zsh_history
HISTSIZE=500
SAVEHIST=500
bindkey -v

zmodload zsh/complist

bindkey ^U backward-kill-line
bindkey ^K kill-line

# vi mode ricing {{{
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line
# }}}

# Load plugins
source /home/mh/Git/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /home/mh/Git/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# Found command color fix to blue
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue

bindkey -M vicmd '?' history-incremental-search-forward
bindkey -M vicmd '/' history-incremental-search-backward
bindkey "^P" history-incremental-pattern-search-backward
bindkey "^N" history-incremental-pattern-search-forward

# Fzf's config
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
FPATH=$FPATH:/home/mh/.local/share/zsh/site_functions

bindkey '^F' fzf-history-widget

# Source local shell-like scripts
source /home/mh/Scripts/sh/alias
source /home/mh/Scripts/sh/functions

export SHELL=/bin/zsh

### MH'S CONFIG END ###

# Color script
colorscript.sh random
