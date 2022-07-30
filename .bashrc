#
# ~/.bashrc
#

################################################################################
## Useful colors

white="\[\e[0m\]"
b_white="\[\e[1;37m\]"
black="\[\e[1;30m\]"
pink="\[\e[1;35m\]"
green="\[\e[1;32m\]"
blue="\[\e[1;34m\]"
cyan="\[\e[1;36m\]"
red="\[\e[1;36m\]"
red2="\[\e[1;31m\]"
yellow="\[\e[1;33m\]"
bold="\[\e[1m\]"
underligne="\[\e[4m\]"
reset="\[\e[0m\]"


################################################################################
## If not running interactively, don't do anything
## Also limits recursive funnctions, see 'man bash'

[[ $- != *i* ]] && return
[[ "$(whoami)" = "root" ]] && return
[[ -z "$FUNCNEST" ]] && export FUNCNEST=100

################################################################################
## Cosmetics

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen
source ~/.config/.git-prompt.sh
PS1="$blue"'$(__git_ps1 " (%s)")'"$pink$bold \W > $reset"

################################################################################
## Some useful aliases

alias todo='vim ~/.todo.md'
alias 'g+++'='g++ -Wall -Wextra -Werror -pedantic -std=c++20 -o out'
alias 'fg+++'='g++ -Wall -Wextra -Werror -pedantic -std=c++20 -g -fsanitize=address -o out'
alias sshgit='ssh-agent > tmp && . ./tmp && rm tmp && ssh-add'
alias ls='ls --color=auto'
alias tree='tree -C'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep percentage'
alias editconf='sudo -e /etc/nixos/configuration.nix'

################################################################################
## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

################################################################################
## LESS configuration to get color in manuals

export LESS="--RAW-CONTROL-CHARS"
export LESS_TERMCAP_mb=$'\e[1;34m'
export LESS_TERMCAP_md=$'\e[1;34m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

################################################################################
## Autocompletion
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
complete -cf sudo
complete -cf man

################################################################################
## Other

export EDITOR="vim"
export PGDATA="$HOME/postgres_data"
export PGHOST="/tmp"

PATH=$PATH:~/.local/bin
