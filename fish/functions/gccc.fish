function gccc --wraps=gcc --description 'alias gccc=gcc -std=c99 -pedantic -Werror -Wall -Wextra -Wvla -DDEBUG'
    gcc -std=c99 -pedantic -Werror -Wall -Wextra -Wvla -DDEBUG $argv
end
