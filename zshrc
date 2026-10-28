# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="fdelacruz"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change the frequency the auto-updater is run (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line to set how old an update must be before it's applied, manually or via the auto-updater (in days).
# zstyle ':omz:update' cooldown 10

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Prevent broken prompt in alpha theme by disabling async Git status.
zstyle ':omz:alpha:lib:git' async-prompt no

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  vi-mode
  history-substring-search
  zsh-autosuggestions
  fzf
  zsh-syntax-highlighting
)

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'
export VISUAL='nvim'

# Add color to the prompt
autoload -U colors && colors
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color [nyae] "

# FZF (optimized)
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

# VI MODE & KEYBINDINGS
bindkey -v
export KEYTIMEOUT=15

# History substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Autosuggestions
bindkey '^ ' autosuggest-accept
bindkey '^_' autosuggest-clear


# TMUX ALIASES
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

# HISTORY
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS

# FAST DIRECTORY JUMP (z)
. /usr/local/bin/z/z.sh

# FNM - Fast and simple Node.js version manager, built in Rust
eval "$(fnm env --use-on-cd --shell zsh)"

# FLY.IO CLI
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# Watch a Python script and rerun it on changes
pywatch() {
    local file="$1"

    if [[ -z "$file" ]]; then
        echo "Usage: pywatch <filename.py>"
        return 1
    fi

    ls "$file" | entr -r sh -c 'clear && python "$1"' _ "$file"
}

# Display Fastfetch once per interactive shell
if [[ -o interactive ]] && [[ -z "$FASTFETCH_SHOWN" ]]; then
    export FASTFETCH_SHOWN=1
    fastfetch
fi
