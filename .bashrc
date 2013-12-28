export PS1='[\t] \u@\h:\W \$ '
export EDITOR=vim
export PATH=./bin:~/bin:/usr/local/bin:/usr/local/sbin:$PATH
export LESS_OPTS=-R
export GREP_COLOR='1;37;41'
export GREP_OPTIONS=--color=auto
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# better shell commands
alias ls='ls -F'
alias less='less -R'

# mongodb
ulimit -n 2048

# postgres
export PGDATA='/usr/local/var/postgres'
alias pgstart='pg_ctl start'
alias pgstop='pg_ctl stop'

# resume scp file transfers
alias scpresume='rsync --partial --progress --rsh=ssh'

# renew dhcp lease
alias renew='sudo ipconfig set en0 DHCP'

# ios simulator
alias ios='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'

# rebuilds finder's "open with" menu contents
alias rebuildopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

# chrome
alias chrome='open -a /Applications/Google\ Chrome.app --args --incognito'

# truecrypt
alias truecrypt='/Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt truecrypt'

# git
alias gs='git status -sb'
alias gp='git stash && git pull --rebase && git stash pop'
alias ga='git add'
alias gc='git commit -v'
alias gd='git diff -b'
alias gl='git log --stat'
alias gb='git branch'
alias gch='git checkout'
alias gf='git fetch'
alias gpall='for dir in `ls`; do pushd $dir; gp; popd; done'

# bundler + ruby
alias be='bundle exec'
alias bi='bundle install'
export BUNDLE_GEMFILE=Gemfile.local
eval "$(rbenv init -)"
