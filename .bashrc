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
## Setup the ssh-agent

export SSH_ENV_BASH="${HOME}/.ssh/environment_bash"

if [ \( -f "$SSH_ENV_BASH" \) -a \( -z "$SSH_AGENT_PID" \) ]
then
    source $SSH_ENV_BASH > /dev/null
else
    ssh-add -l > /dev/null 2>&1
    if [ \( \( -z "$SSH_AGENT_PID" \) -a \( -z "$SSH_CONNECTION" \) \) -o \( "$?" != "0" \) ]
    then
        ssh-agent | sed 's/^echo/#echo/' > $SSH_ENV_BASH
        chmod 600 $SSH_ENV_BASH
        source $SSH_ENV_BASH > /dev/null
    fi
fi


################################################################################
## Better bash history

shopt -s histappend # do not overwrite history, only append
shopt -s cmdhist # write multiline command in a single line
export HISTFILESIZE=10000
export HISTSIZE=100000
export HISTCONTROL=ignoreboth # ignore duplicate and line beginning with spaces
export HISTIGNORE='ls:bg:fg:history:cd:vim:nvim'


################################################################################
## Variables

export EDITOR="nvim"
export FZF_DEFAULT_COMMAND='fd --color=always --type f --strip-cwd-prefix --hidden \
    --exclude .git'
export FZF_DEFAULT_OPTS="--layout=reverse --height=75% -m \
    --ansi \
    --bind="ctrl-space:toggle-preview" \
    --preview='bat --color=always {}' \
    --preview-window=:hidden"
export MANROFFOPT='-c'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME="Catppuccin-frappe"
export CLICOLOR=1 #enable color for tree
export NIX_OPTIONS="-j auto -L --cores 0"
export PYTHONSTARTUP=~/.pyrc

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
## Path env

PATH=$PATH:~/.local/bin
PATH=$PATH:/usr/bin
PATH=~/.npm-packages/bin:$PATH
export NODE_PATH=~/.npm-packages/lib/node_modules


################################################################################
## Go in fish
# The reason this line is here is because we let bash taking care of the set
# of important env variables if we want to run fish.

#export SHELL=$(which fish) && exec fish

################################################################################
## Setup of the function that will be used for generating the PS1

source ~/.config/.git-prompt.sh

__prompt_command() {
    local EXIT="$?"
    PS1=""

    local Red='\[\e[0;31m\]'
    local Green='\[\e[1;32m\]'
    local BYel='\[\e[1;33m\]'
    local blue='\[\e[0;34m\]'
    local cyan='\[\e[0;36m\]'
    local BBlu='\[\e[1;34m\]'
    local Pink='\[\e[0;35m\]'
    local BPink='\[\e[1;35m\]'
    local Res='\[\e[0m\]'

    PS1=" ${blue}\w ""$BYel"'$(__git_ps1 "on  %s")'
    [[ -n "$VIRTUAL_ENV" ]] && PS1=${PS1}"${Res} via ${BYel}(venv)"
    [[ -n "$IN_NIX_SHELL" ]] && PS1+="${cyan} via ❄️ ($name)${Res}"
    PS1=${PS1}"\n"

    #local nixshell=$(echo $buildInputs | tr ' ' '\n' | sed 's#^/nix/store/[a-z0-9]\+-##' \
    #    | tr -d '0-9-.' | tr '\n' ' ' | awk '{$1=$1;print}')
    #[[ -n "$buildInputs" ]] && PS1="${Green}[$nixshell]${Res}"$PS1

    local nb_jobs=$(jobs | wc -l)
    [[ "$nb_jobs" != 0 ]] && PS1+=" ${BBlu}✦$([ "$nb_jobs" != 1 ] && echo $nb_jobs)"
    [[ $EXIT != 0 ]] && PS1+=" ${Red}\$ ${Res}" || PS1+=" ${blue}\$ ${Res}"
}

################################################################################
## fzf setup on nixos

if command -v fzf-share >/dev/null; then
  source "$(fzf-share)/key-bindings.bash"
  source "$(fzf-share)/completion.bash"
fi

################################################################################
## Some useful aliases

alias vim='nvim'
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
alias nvimrc='nvim ~/.config/nvim/'
alias bashrc='nvim ~/.bashrc'
alias i3config='nvim ~/.config/i3/config'
alias fcd='__cd_with_fzf'
alias v='__nvim_with_fzf'
# alias git
alias gsw='git switch'
alias gst='git status'
alias ga='git add'
alias gcm='git commit -m'
alias gpl='git pull'
alias gcd='__cd_to_git_root'

################################################################################
## Custom bindings

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
bind -x '"\C-o":__nvim_with_fzf'
#bind '"\C-f":"__cd_with_fzf"'
bind -x '"\C-f":__select_with_fzf'
bind '"\C-H":backward-kill-line'
# lolo=$(fzf); if [ -z $lolo ]; then echo 'no file has been picked'; else vim $lolo; fi

################################################################################
## Autocompletion
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# complete -cf sudo
# complete -cf man

################################################################################
## Functions

__select_with_fzf(){
    local selected="$(fzf | while read -r item; do printf '%q ' "$item"; done)";
    READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}$selected${READLINE_LINE:$READLINE_POINT}";
    READLINE_POINT=$(( READLINE_POINT + ${#selected} ))
}

__cd_with_fzf(){
    #local PATHNAME=$(cd && fd -t d --strip-cwd-prefix | \
    #    fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)

    local BBlu='\e[1;34m'
    local Res='\e[0m'
    local PATHNAME

    if [[ -z "$1" ]]
    then
        local dir=$(cd && fd -t d --strip-cwd-prefix | fzf)
        [[ -z "$dir" ]] && return
        [[ -d ~/"$dir" ]] || return
        PATHNAME="$dir"
    else
        PATHNAME=$(cd && fd -t d --strip-cwd-prefix | fzf -f "$1" | head -n1)
    fi

    [[ -z "$PATHNAME" ]] || echo -e " ✨ ${BBlu}~/${PATHNAME}${Res} ✨"
    [[ -z "$PATHNAME" ]] || cd ~/"$PATHNAME"
}

__cd_to_git_root(){
    local Red='\e[0;31m'
    local BBlu='\e[1;34m'
    local Res='\e[0m'

    local GITROOT=$(git rev-parse --show-toplevel 2>/dev/null)
    [[ -n "$GITROOT" ]] && builtin -- cd "$GITROOT" && echo -e " ✨ ${BBlu}Now at the git root${Res} ✨" || echo -e ${Red}"✗ Not in a git repository ✗ ${Res}"
}


################################################################################
## Launch zoxide and prompt

eval "$(zoxide init bash)"
#eval "$(starship init bash)"

PROMPT_COMMAND=__prompt_command    # Function to generate PS1 after CMDs
