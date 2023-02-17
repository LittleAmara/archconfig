###############################################
### Commands to run in interactive sessions ###
###############################################

if status is-interactive
    ###########
    # Aliases #
    ###########
    abbr -ga ff fzf
    abbr -ga l 'ls -1'
    abbr -ga sshgit 'eval $(ssh-agent -c) && ssh-add'
    abbr -ga vim nvim
    abbr -ga nvimrc '$EDITOR ~/.config/nvim'
    abbr -ga gtree 'git ls-tree -r --name-only HEAD | tree --fromfile'
    abbr -ga us 'setxkbmap us'
    abbr -ga fr 'setxkbmap fr'
    abbr -ga nixconf 'sudo -e /etc/nixos/configuration.nix'
    abbr -ga mag 'bluetoothctl power'

    ##############################
    # Launch Starship and Zoxide #
    ##############################
    starship init fish | source
    zoxide init fish | source
end

###################################
### Environment variables setup ###
###################################

set -gx EDITOR nvim
set -gx BAT_THEME OneHalfDark
set -gx CLICOLOR 1 #enable color for tree
set -gx NIX_OPTIONS '-j auto -L --cores 0'
set -gx FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden \
    --exclude .git'
set -gx FZF_DEFAULT_OPTS "--layout=reverse --height=75% -m \
    --bind="space:toggle-preview" \
    --preview='bat --color=always {}' \
    --preview-window=:hidden"

set -gx LESS_TERMCAP_mb (printf "\033[01;34m")
set -gx LESS_TERMCAP_md (printf "\033[01;34m")
set -gx LESS_TERMCAP_me (printf "\033[0m")
set -gx LESS_TERMCAP_se (printf "\033[0m")
set -gx LESS_TERMCAP_so (printf "\033[01;33m")
set -gx LESS_TERMCAP_ue (printf "\033[0m")
set -gx LESS_TERMCAP_us (printf "\033[01;4;31m")

set -gx NODE_PATH ~/.npm-packages/lib/node_modules

fish_add_path ~/.local/bin
fish_add_path ~/.npm-packages/bin


############################
### Configuration of fzf ###
############################

fzf_configure_bindings --directory=\cf
