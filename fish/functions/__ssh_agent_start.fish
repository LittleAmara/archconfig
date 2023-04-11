function __ssh_agent_start -d "start a new ssh agent"
    ssh-agent -c | sed 's/^echo/#echo/' >$SSH_ENV_FISH
    chmod 600 $SSH_ENV_FISH
    source $SSH_ENV_FISH >/dev/null
end
