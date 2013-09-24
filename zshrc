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
