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
# Add color to the prompt
autoload -U colors && colors
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color [nyae] "

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  git
  vi-mode
  zsh-completions
  history-substring-search
  zsh-autosuggestions
  zsh-syntax-highlighting
  command-not-found
  fzf
  poetry
)

# fzf
export FZF_DEFAULT_COMMAND="fd --type f --color=never --hidden"
export FZF_DEFAULT_OPTS="--layout=reverse --height=50% --info=inline --border"

# export FZF_CTRL_T__COMMAND="$FZF_DEFAULT_COMMAND" # set by ohmyzsh
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"

export FZF_ALT_C_COMMAND="fd --type d . --color=never --hidden --follow \
  --exclude .git \
  --exclude node_modules \
  --exclude venv"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

fpath=(/usr/local/share/zsh-completions $fpath)

bindkey -v
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey '^ ' autosuggest-accept
bindkey '^_' autosuggest-clear

zstyle ':omz:alpha:lib:git' async-prompt no

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Some tmux-related shell aliases

# Attaches tmux to the last session; creates a new session if none exists.
alias t='tmux attach || tmux new-session'

# Attaches tmux to a session (example: ta portal)
alias ta='tmux attach'

# Creates a new session
alias tn='tmux new-session'

# Lists all ongoing sessions
alias tl='tmux list-sessions'

unalias run-help 2> /dev/null
autoload run-help
HELPDIR=/usr/local/share/zsh/help

alias rubyrename='ruby -e "a = ARGV.shift; b = ARGV.shift; ARGV.each{ |f| File.rename(f, f.gsub(a, b)) }"'
alias lockDock='defaults write com.apple.dock contents-immutable -bool true && killall Dock'
alias unlockDock='defaults write com.apple.dock contents-immutable -bool false && killall Dock'

# IRC
# IRCNICK=slocate
IRCNICK=fdelacruz
IRC_SERVERS_FILE=~/ircII.servers
export IRCNICK IRC_SERVERS_FILE

export PATH=/home/fdelacruz/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/home/fdelacruz/.local/bin:$PATH

# vi-mode
# kill the  delay
export KEYTIMEOUT=15

# set default editor
export EDITOR=nvim
export VISUAL=nvim

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

# more shell history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# load z
. /usr/local/bin/z/z.sh

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# fly.io
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

