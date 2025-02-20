if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# OH-MY-ZSH configuration
export ZSH="$HOME/.config/zsh/oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(gitfast zsh-autosuggestions)

export DISABLE_MAGIC_FUNCTIONS="true"
export MANROFFOPT="-c";
export MANPAGER="sh -c 'col -bx | bat -l man -p'";
export CLICOLOR=1;
export NODE_PATH="~/.npm-packages/lib/node_modules";
export EDITOR="nvim";
export GOPATH="$HOME/.go";
export PGDATA="$HOME/postgres_data";
export PGHOST="/tmp";
export FZF_DEFAULT_COMMAND='fd --color=always --type f --strip-cwd-prefix --hidden --exclude .git'
export FZF_DEFAULT_OPTS="--layout=reverse --height=75% -m \
    --ansi \
    --bind="ctrl-space:toggle-preview" \
    --preview='bat --color=always {}' \
    --preview-window=:hidden"
path+=("$GOPATH/bin")
path+=("$HOME/.config/composer/vendor/bin")

# Load OH-MY-ZSH
source $ZSH/oh-my-zsh.sh

# Aliases
alias vim='nvim'
alias bat='bat --plain'
alias blueon='bluetoothctl power on'
alias blueoff='bluetoothctl power off'
alias bluecon='bluetoothctl connect "$(bluetoothctl devices | cut -d " " -f2- | fzf | cut -d " " -f1)"'
alias pacsearch="pacman -Slq | fzf --preview 'pacman -Si {}' --layout=reverse"
alias k=kubectl
alias kns=kubens
alias kcx=kubectx

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init zsh)"
source <(fzf --zsh)
