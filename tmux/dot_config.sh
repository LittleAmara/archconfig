#!/usr/bin/env bash

app_name='tmux'
config_path="${HOME}/.config/tmux"
check_command='tmux --version'

additional_setup() {
    set -e

    log_warning "Removing any plugins that was previously installed"
    rm "${config_path}/plugins" -rf
    log_info "Now installing plugins for tmux"

    git clone 'https://github.com/tmux-plugins/tpm' "${config_path}/plugins/tpm"
    "${config_path}/plugins/tpm/bin/install_plugins"

    set +e
}
