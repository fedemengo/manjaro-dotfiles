#############################################################################
############################# OTHER CONFIGURATION ###########################
#############################################################################

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

plugins=(
  web-search
  encode64
  zsh-autosuggestions
  catimg
)

source $ZSH/oh-my-zsh.sh

function tab_list {
    if [[ $#BUFFER == 0 ]]; then
        BUFFER="ls "
        CURSOR=3
        zle list-choices
        zle backward-kill-word
    else
        zle expand-or-complete
    fi
}

function forward-kill-word {
    zle forward-word
    zle backward-kill-word
}

function pacman-util {
	com="sudo pacman -S"
	BUFFER="${com}${BUFFER}"
	CURSOR=${#BUFFER}
}

function yay-util {
	com="yay -S"
	BUFFER="${com}${BUFFER}"
	CURSOR=${#BUFFER}
}

function sudo-util {
	com="sudo "
	BUFFER="${com}${BUFFER}"
	CURSOR=${#BUFFER}
}

function redo-sudo {
    #cmd=$(history | tail -1 | cut -d' ' -f4-)
	cmd=$(cat ~/.zsh_history | tail -1 | cut -d';' -f2)
	BUFFER="sudo ${cmd}"
	CURSOR=${#BUFFER}
	#sudo $cmd
}

function home {
	data="${HOME:=/home/fedemengo}"
	BUFFER="${BUFFER}${data}/"
	CURSOR=${#BUFFER}
}

zle -N tab_list
zle -N forward-kill-word
zle -N pacman-util
zle -N yay-util
zle -N sudo-util
zle -N redo-sudo
zle -N home
# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt append_history           # Dont overwrite history
setopt extended_history         # Also record time and duration of commands.
setopt share_history            # Share history between multiple shells
setopt hist_expire_dups_first   # Clear duplicates when trimming internal hist.
setopt hist_find_no_dups        # Dont display duplicates during searches.
setopt hist_ignore_dups         # Ignore consecutive duplicates.
setopt hist_ignore_all_dups     # Remember only one unique copy of the command.
setopt hist_reduce_blanks       # Remove superfluous blanks.
setopt hist_save_no_dups        # Omit older commands in favor of newer ones.

# Changing directories
setopt pushd_ignore_dups        # Dont push copies of the same dir on stack.
setopt pushd_minus              # Reference stack entries with "-".

bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^f" forward-word
bindkey "^b" backward-word
bindkey "^k" kill-line
bindkey "^y" accept-and-hold
bindkey "^ " forward-char
bindkey "^d" forward-kill-word
bindkey "^w" backward-kill-word
bindkey "^u" backward-kill-line
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^[k" up-history
bindkey "^[j" down-history
bindkey "^i" expand-or-complete-prefix
bindkey "^I" tab_list
bindkey "^[[Z" reverse-menu-complete

bindkey "^p" pacman-util
bindkey "^y" yay-util
bindkey "^s" sudo-util
bindkey "^w" redo-sudo
bindkey "^h" home

zstyle ':completion:*' menu select
zstyle ':completion:*' insert-tab false
zstyle ':completion:*' rehash true
# case-insensitive (all), partial-word and then substring completion
zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"
zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}

#############################################################################
############################## ALIASES ######################################
#############################################################################

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias md='mkdir -p'
#alias l="ls -ls --block-size=M"
alias l="ls -oh --sort=extension"
alias ll='ls -oah --sort=extension'
alias pi='ssh pi@192.168.178.100 2>/dev/null'
alias pi3='ssh pi@192.168.178.101 2>/dev/null'
alias ubu='ssh fedemengo@192.168.178.121'
alias pifs='sshfs -o allow_other pi@192.168.178.100:/mnt/hdd/ /mnt/hdd'
alias pifs3='rclone mount --daemon pi3::STORAGE/ /mnt/hdd'
#alias pifs3='sshfs -o allow_other pi@192.168.178.101:/mnt/hdd/ /mnt/hdd'
alias upifs='fusermount -u /mnt/hdd'
alias todo='todo.sh'
alias rs='repos-stat --no-clean --no-broken'
alias df='df -h'                          # human-readable sizes
alias du='du -h --max-depth=1'
alias free='free -m'                      # show sizes in MB
alias diff='colordiff'

alias ...='../..'
alias ....='../../..'
alias .....='../../../..'
alias ......='../../../../..'

alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

#alias chromium='chromium --force-device-scale-factor=1.5'

alias gst='git status'
alias p3='python3'

alias gut='git'
alias got='git'
alias gi='git'
alias g='git'

alias rename='perl-rename'
alias mplayer='mplayer -osdlevel 3 -osd-fractions 1'
