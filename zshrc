# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

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
  zaw
  zsh-completions
  history-substring-search
  zsh-autosuggestions
)

fpath=(/usr/local/share/zsh-completions $fpath)

bindkey -v
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey '^ ' autosuggest-accept
bindkey '^_' autosuggest-clear

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias vi=/usr/local/bin/vim

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
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias lockDock='defaults write com.apple.dock contents-immutable -bool true && killall Dock'
alias unlockDock='defaults write com.apple.dock contents-immutable -bool false && killall Dock'

# improve the behavior of the cd command in git repos
_git_cd () {
  if [[ "$1" != "" ]]; then
    cd "$@"
  else
    local OUTPUT
    OUTPUT="$(git rev-parse --show-toplevel 2>/dev/null)"
    if [[ -e "$OUTPUT" ]]; then
      if [[ "$OUTPUT" != "$(pwd)" ]]; then
        cd "$OUTPUT"
      else
        cd
      fi
    else
      cd 
    fi
  fi
}

alias cd=_git_cd

# IRC
# IRCNICK=slocate
IRCNICK=fdelacruz
IRC_SERVERS_FILE=~/ircII.servers
export IRCNICK IRC_SERVERS_FILE

export PATH=/Users/fdelacruz/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH

# vi-mode
# kill the  delay
export KEYTIMEOUT=15

# set default editor
export EDITOR=lvim
export VISUAL=lvim

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

# incremental history search using zaw
bindkey '^R' zaw-history
bindkey -M filterselect '^R' down-line-or-history
bindkey -M filterselect '^S' up-line-or-history
bindkey -M filterselect '^E' accept-search

zstyle ':filter-select' max-lines 10
zstyle ':filter-select' case-insensitive yes
zstyle ':filter-select' extended-search yes

# load z
. `brew --prefix`/etc/profile.d/z.sh

# postgresql
alias pg-start='pg_ctl -D /usr/local/var/postgres start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop'
alias pg-restart='pg_ctl -D /usr/local/var/postgres restart'

# python3
alias py='/usr/local/bin/python3.11'
