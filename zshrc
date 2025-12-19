# Path to your oh-my-zsh configuration.
ZSH=$HOME/.ohmyzsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fdelacruz"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY=true

# Uncomment the following line to enable to skip the verification of insecure directories.
ZSH_DISABLE_COMPFIX=true

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS=false

# Prevent broken prompt in alpha theme by disabling async Git status.
zstyle ':omz:alpha:lib:git' async-prompt no

# Add color to the prompt
autoload -U colors && colors
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color [nyae] "

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  git
  vi-mode
  history-substring-search
  zsh-autosuggestions
  fzf
  poetry
)

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# ========================================
# FZF (optimized)
# ========================================
export FZF_DEFAULT_COMMAND="fd --type f --color=never --hidden"
export FZF_DEFAULT_OPTS=" \
--layout=reverse \
--height=50% \
--info=inline \
--border \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :20 {}'"

export FZF_ALT_C_COMMAND="fd --type d . --color=never --hidden --follow \
  --exclude .git \
  --exclude node_modules \
  --exclude venv"
export FZF_ALT_C_OPTS="--preview 'ls -la {} | head -20'"

# ========================================
# VI MODE & KEYBINDINGS
# ========================================
bindkey -v
export KEYTIMEOUT=15

# Ctrl+Space completion (vi insert + normal)
bindkey -M viins '^@' complete-word
bindkey -M vicmd '^@' complete-word

# History substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Autosuggestions
bindkey '^ ' autosuggest-accept
bindkey '^_' autosuggest-clear

zstyle ':omz:alpha:lib:git' async-prompt no

# Customize to your needs...
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# set default editor
export EDITOR=nvim
export VISUAL=nvim

# ========================================
# TMUX ALIASES
# ========================================

alias t='tmux attach || tmux new-session'
alias ta='tmux attach'
alias tn='tmux new-session'
alias tl='tmux list-sessions'

unalias run-help 2> /dev/null
autoload run-help
HELPDIR=/usr/local/share/zsh/help

# IRC
# IRCNICK=slocate
IRCNICK=fdelacruz
IRC_SERVERS_FILE=~/ircII.servers
export IRCNICK IRC_SERVERS_FILE

export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin:$HOME/.fzf/bin:$PATH


# insert last word with "alt+."
bindkey '\e.' insert-last-word

# repeat the previous shell-word ($WORDCHARS) with "alt+="
bindkey '\e=' copy-prev-shell-word

# do history expansion on space
bindkey ' ' magic-space

# suspend AND resume job with single shortcut
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
    zle redisplay
  else
    zle push-input
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# python3
alias py='/usr/bin/python3'

########################################
# HISTORY
########################################
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# ========================================
# FAST DIRECTORY JUMP (z)
# ========================================
. /usr/local/bin/z/z.sh

# ========================================
# PYENV (lazy load)
# ========================================
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

pyenv() {
  unset -f pyenv
  eval "$("$PYENV_ROOT/bin/pyenv" init -)"
  eval "$("$PYENV_ROOT/bin/pyenv" virtualenv-init -)"
  pyenv "$@"
}

# ========================================
# NVM (lazy load)
# ========================================
nvm() {
  unset -f nvm node npm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  nvm "$@"
}

# ========================================
# FLY.IO CLI
# ========================================
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
