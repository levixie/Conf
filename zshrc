# $1 = type; 0 - both, 1 - tab, 2 - title
# # rest = text
setTerminalText () {
    # echo works in bash & zsh
    local mode=$1 ; shift
    echo -ne "\033]$mode;$@\007"
}
stt_both  () { setTerminalText 0 $@; }
stt_tab   () { setTerminalText 1 $@; }
stt_title () { setTerminalText 2 $@; }

if [[ -n "$TMUX" ]]; then
    __prompt() {
        emulate -L zsh
        tmux setenv -g TMUX_PWD_$(tmux display -p "#D" | tr -d %) "$PWD"
        tmux refresh -S
    }


    chpwd_functions+=( __prompt )

    #autoload -U promptinit && prompinit
    autoload -U colors && colors
    PROMPT="%{$fg_no_bold[yellow]%}[%~]$%{$reset_color%} "
else
    . ~/.config/powerline/bindings/zsh/powerline.zsh
fi


source ~/.config/tmuxinator/tmuxinator.zsh

HISTSIZE=1000
if (( ! EUID )); then
    HISTFILE=~/.history_root
else
    HISTFILE=~/.history
fi
SAVEHIST=1000

