#
# ~/.bashrc
#

################################################################################
## If not running interactively, don't do anything
## Also limits recursive funnctions, see 'man bash'

[[ $- != *i* ]] && return
[[ "$(whoami)" = "root" ]] && return
[[ -z "$FUNCNEST" ]] && export FUNCNEST=100

################################################################################
## Welcome screen and PS1

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen
source ~/.config/.git-prompt.sh

# PS1="$blue"'$(__git_ps1 " (%s)")'"$pink$bold \W > ${reset}"
#STATUS="$?"
#echo "STATUS $STATUS"
# [ $STATUS = 0 ] && PS1=${PS1}lolo || PS1=${PS1}"popo"

PROMPT_COMMAND=__prompt_command    # Function to generate PS1 after CMDs

__prompt_command() {
    local EXIT="$?"
    PS1=""

    local Red='\[\e[0;31m\]'
    local Green='\[\e[1;32m\]'
    local BYel='\[\e[1;33m\]'
    local blue='\[\e[1;34m\]'
    local BBlu='\[\e[1;34m\]'
    local Pink='\[\e[0;35m\]'
    local BPink='\[\e[1;35m\]'
    local Res='\[\e[0m\]'

    PS1="$blue"'$(__git_ps1 " (%s)")'" ${BPink}\W"

    [[ $EXIT != 0 ]] && PS1+=" ${Red}${EXIT}"
    [[ -n "$VIRTUAL_ENV" ]] && PS1='(venv)'$PS1
    #[[ -n "$NIX_SHELL_BASH_NAME" ]] && PS1="${Green}[$NIX_SHELL_BASH_NAME]${Res}"$PS1
    [[ -n "$name" ]] && PS1="${Green}[$name]${Res}"$PS1

    PS1+=" ${BYel}> ${Res}"

}


################################################################################
## Some useful aliases

alias vim='nvim'
alias todo='vim ~/.todo.md'
alias fgcc='gcc -Wall -Wextra -Werror -pedantic -std=c99 -fsanitize=address -g'
alias 'g+++'='g++ -Wall -Wextra -Werror -pedantic -std=c++20 -o out'
alias 'fg+++'='g++ -Wall -Wextra -Werror -pedantic -std=c++20 -g -fsanitize=address -o out'
alias sshgit='eval $(ssh-agent) && ssh-add'
alias ls='ls --color=auto'
alias tree='tree -C'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
alias editconf='sudo -e /etc/nixos/configuration.nix'
alias ff='fzf'
alias fr='setxkbmap fr'
alias us='setxkbmap us'
alias vimrc='nvim ~/.vimrc'
alias bashrc='nvim ~/.bashrc'
alias i3config='nvim ~/.config/i3/config'
alias ffcd='__cd_with_fzf'

# alias git
alias gsw='git switch'
alias gst='git status'
alias ga='git add'
alias gcm='git commit -m'
alias gpl='git pull'

################################################################################
## Custom bindings

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
bind -x '"\C-o":"vim $(fzf)"'
bind -x '"\C-f":"cd_with_fzf"'
bind '"\C-H":backward-kill-line'
# lolo=$(fzf); if [ -z $lolo ]; then echo 'no file has been picked'; else vim $lolo; fi

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
# complete -cf sudo
# complete -cf man

################################################################################
## Variables

export EDITOR="nvim"
export PGDATA="$HOME/postgres_data"
export PGHOST="/tmp"



export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden \
    --exclude .git'
export FZF_DEFAULT_OPTS="--layout=reverse --height=75% -m \
    --bind="space:toggle-preview" \
    --preview='bat --color=always {}' \
    --preview-window=:hidden"

################################################################################
## Functions

__cd_with_fzf(){
    #local PATHNAME=$(cd && fd -t d --strip-cwd-prefix | \
    #    fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)
    local PATHNAME=$(cd && fd -t d --strip-cwd-prefix | fzf -f "$1" | head -n1)

    [[ -z "$PATHNAME" ]] || cd ~/"$PATHNAME"
}

################################################################################
## Path env

PATH=$PATH:~/.local/bin
