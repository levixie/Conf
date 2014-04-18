export PATH="/usr/local/opt/ruby/bin:~/houzz/arcanist/bin:/usr/local/bin:$PATH"
alias ll="ls -Gl"
alias lc="ls -G"
alias go="pushd"
alias back="popd"
# alias for quick DNS cache flushing
alias fc='sudo dscacheutil -flushcache'
alias tn='sudo autossh -M 0 -f jesse@hbas.houzz.net -L 80:stweb02:80 -L 81:stweb02:81 -L 8080:stweb01:80 -N -i /Users/jesse/.ssh/hbas_rsa'

set -o vi

if [ -f ~/.config/bashrc ]; then 
    source ~/.config/bashrc 
fi
