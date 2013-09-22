export PATH="/usr/local/opt/ruby/bin:~/houzz/arcanist/bin:/usr/local/bin:$PATH"
alias ll="ls -Gl"
alias lc="ls -G"
alias go="pushd"
alias back="popd"
# alias for quick DNS cache flushing
alias fc='sudo dscacheutil -flushcache'
set -o vi

if [[ -n "$TMUX" ]]; then
    BLACK=$(tput setaf 0)
    RED=$(tput setaf 1)
    GREEN=$(tput setaf 2)
    YELLOW=$(tput setaf 3)
    LIME_YELLOW=$(tput setaf 190)
    POWDER_BLUE=$(tput setaf 153)
    BLUE=$(tput setaf 4)
    MAGENTA=$(tput setaf 5)
    CYAN=$(tput setaf 6)
    WHITE=$(tput setaf 7)
    BRIGHT=$(tput bold)
    NORMAL=$(tput sgr0)
    BLINK=$(tput blink)
    REVERSE=$(tput smso)
    UNDERLINE=$(tput smul)

    __prompt() {
        export PS1="${LIME_YELLOW}[\\w]$ ${NORMAL}"
        tmux setenv -g TMUX_PWD_$(tmux display -p "#D" | tr -d %) "$PWD"
        tmux refresh -S
    }

    export PROMPT_COMMAND="__prompt"
else
    . ~/.config/powerline/bindings/bash/powerline.sh
fi

source ~/.config/tmuxinator/tmuxinator.bash
