export EDITOR=vim
export GOROOT="/usr/local/Cellar/go/1.4/libexec"
export GOPATH="/Users/jesse/my/go"
export PATH="/usr/local/opt/ruby/bin:/Users/jesse/houzz/arcanist/bin:/usr/local/bin:$PATH"
alias ll="ls -Gl"
alias lc="ls -G"
alias gil="git pull"
alias gip="git push"
alias gis="git status"
alias gic="git commit"
alias gia="git add"
alias gif="git difftool"
# alias for quick DNS cache flushing
alias fc='sudo dscacheutil -flushcache'
alias tn='autossh -M 2270:7000 -f jesse@stg.houzz.net -L 21000:hdws01:21000 -L 1234:hdws02:8580 -L 8676:hdws01:3128 -L 21050:hdws01:21050 -qnN'

bindkey -v
bindkey '^R' history-incremental-search-backward

if [ -f ~/.config/zshrc ]; then 
    source ~/.config/zshrc 
fi

# if the current symlink still works then dont update it
if [ -S "$SSH_AUTH_SOCK" -a ! -S ~/.ssh/ssh_auth_sock ]; then
   ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
fi
