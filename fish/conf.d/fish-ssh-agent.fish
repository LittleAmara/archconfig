if test -z "$SSH_ENV_FISH"
    set -xg SSH_ENV_FISH $HOME/.ssh/environment_fish
end

if not __ssh_agent_is_started
    __ssh_agent_start
end
