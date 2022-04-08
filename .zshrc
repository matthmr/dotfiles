PROMPT='%F{red}┌[%F{reset}%B%n%b%F{red}@%F{reset}%B%m%b%F{red}] %F{red}[%F{reset}%B%l%b%F{red}] %F{red}[%F{reset}%B%t%b%F{red}] %(?..[%F{reset}%B%?%b%F{red}])
└[%F{reset}%B%2~%b%F{red}]>%F{reset} '
PS2=' %F{red}|>%F{reset} '

set -k

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
source  '/home/mh/.alias'

# vi mode ricing {{{
export KEYTIMEOUT=1
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
source /home/mh/Source/sh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/mh/Source/sh/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /home/mh/Source/sh/z

# Found command color fix to blue
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue

# export environment variables
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

bindkey -M vicmd '?' history-incremental-search-forward
bindkey -M vicmd '/' history-incremental-search-backward
bindkey "^P" history-incremental-pattern-search-backward
bindkey "^N" history-incremental-pattern-search-forward

# Fzf's config
export FZF_DEFAULT_OPTS='--no-height --no-reverse'
export FZF_TMUX=1
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
FPATH=$FPATH:/mnt/ssd/root/usr/share/zsh/site-functions/

bindkey '^F' fzf-history-widget

# Less fix
export LESS='--RAW-CONTROL-CHARS --mouse'
# limit coredumpsize 50m

# Init script
colorscript.sh random

### MH'S CONFIG END ###
