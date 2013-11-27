# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fdelacruz"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx gitfast)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export PATH=/Library/Frameworks/Python.framework/Versions/2.7/bin:/Users/fdelacruz/bin:/usr/local/bin:/usr/local/git/bin:$PATH

alias rubyrename='ruby -e "a = ARGV.shift; b = ARGV.shift; ARGV.each{ |f| File.rename(f, f.gsub(a, b)) }"'

alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

alias lockDock='defaults write com.apple.dock contents-immutable -bool true && killall Dock'

alias unlockDock='defaults write com.apple.dock contents-immutable -bool false && killall Dock'

alias killDock='killall Dock'

# PostgreSQL 

alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'

alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

alias pg-status='pg_ctl -D /usr/local/var/postgres status'

# IRC 
# IRCNICK=slocate
IRCNICK=fdelacruz
IRC_SERVERS_FILE=~/ircII.servers
export IRCNICK IRC_SERVERS_FILE

# ri decorated section headings
export RI="--format ansi --width 70"

# rspec in color with [d]ocumentation (group and example names) formatting
rspec_color() { rspec "$*" --color -f d; }

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#Rails development environment
export RAILS_ENV=development
