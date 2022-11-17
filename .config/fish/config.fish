if status is-interactive
    # Commands to run in interactive sessions can go here

    # Launch Starship
    starship init fish | source
end

fzf_configure_bindings --directory=\cf
