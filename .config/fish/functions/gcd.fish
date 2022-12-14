function gcd --description "cd into the root of the git repository"
    set -l GITROOT $(git rev-parse --show-toplevel 2>/dev/null)
    if test -z "$GITROOT"
        set_color red
        echo "✗ Not in a git repository ✗"
    else
        set_color blue
        echo "✨ Moved into the git root ✨"
        cd -- "$GITROOT"
    end
end
