alias c='clear'

alias flaresolverr="docker run -it --rm -p 8191:8191 ghcr.io/flaresolverr/flaresolverr:latest"

alias w++17='g++ -std=c++17 -Wall -Wextra -pedantic -g'
alias e++17='g++ -std=c++17 -Wall -Wextra -pedantic -Werror -g'

alias rosetta2_mode='arch -x86_64 /bin/zsh -c "export PATH=/usr/local/bin:/usr/local/sbin:$PATH; eval \$(/usr/local/bin/brew shellenv); exec /bin/zsh"'
alias rosetta2_exit='exit; export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH; eval "$(/opt/homebrew/bin/brew shellenv)"'
