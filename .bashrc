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
    [[ -n "$NIX_SHELL_BASH_NAME" ]] && PS1="${Green}[$NIX_SHELL_BASH_NAME]${Res}"$PS1

    PS1+=" ${BYel}> ${Res}"

}


################################################################################
## Some useful aliases

alias todo='vim ~/.todo.md'
alias fgcc='gcc -Wall -Wextra -Werror -pedantic -std=c99 -fsanitize=address -g'
alias 'g+++'='g++ -Wall -Wextra -Werror -pedantic -std=c++20 -o out'
alias 'fg+++'='g++ -Wall -Wextra -Werror -pedantic -std=c++20 -g -fsanitize=address -o out'
alias sshgit='ssh-agent > .tmp_ssh_agent && . ./.tmp_ssh_agent && rm .tmp_ssh_agent && ssh-add'
alias ls='ls --color=auto'
alias tree='tree -C'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
alias editconf='sudo -e /etc/nixos/configuration.nix'
alias ff='fzf'
alias fr='setxkbmap fr'
alias us='setxkbmap us'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias i3config='vim ~/.config/i3/config'

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
complete -cf sudo
complete -cf man

################################################################################
## Variables

export EDITOR="vim"
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

cd_with_fzf(){
    cd $(fd -t d --strip-cwd-prefix| fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" \
        --preview-window=:hidden) && echo $PWD
}

# $1 the tag
function PUSH {
    2>/dev/null make clean || rm -f *.o *.a a.out
    /home/amara/workspace_epita/piscine-2025-assistants/clang-format.sh
    tag_msg=$1
    commit_msg=${tag_msg:10}
    git add .                                                               &&\
    git commit -S -m "$commit_msg"                                          &&\
    git tag -m "$commit_msg" "$tag_msg"                                     &&\
    git push --follow-tags
}

################################################################################
## Path env

PATH=$PATH:~/.local/bin
