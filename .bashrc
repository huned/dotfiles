export PS1='[\t] \u@\h:\W \$ '
export EDITOR=vim
export PATH=./bin:./node_modules/.bin:~/bin:/usr/local/bin:/usr/local/sbin:$PATH
export LESS_OPTS=-R
export GREP_COLOR='1;37;41'
export GREP_OPTIONS=--color=auto
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# define useful colors from clrs.cc
#export COLOR_NAVY='#001f3f'
#export COLOR_BLUE='#0074d9'
#export COLOR_AQUA='#7fdbff'
#export COLOR_TEAL='#39cccc'
#export COLOR_OLIVE='#3d9970'
#export COLOR_GREEN='#2ecc40'
#export COLOR_LIME='#01ff70'
#export COLOR_YELLOW='#ffdc00'
#export COLOR_ORANGE='#ff851b'
#export COLOR_RED='#ff4136'
#export COLOR_MAROON='#85144b'
#export COLOR_FUCHSIA='#f012be'
#export COLOR_PURPLE='#b10dc9'
#export COLOR_WHITE='#ffffff'
#export COLOR_SILVER='#dddddd'
#export COLOR_GRAY='#aaaaaa'
#export COLOR_BLACK='#111111'

# screen session logging
alias screen='screen -L'

# better shell commands
alias ls='ls -F'
alias less='less -R'

# mongodb
#alias mongod='mongod --dbpath /usr/local/var/mongodb/ --profile 1 --setParameter failIndexKeyTooLong=false'
ulimit -n 2048

# postgres
export PGDATA='/usr/local/var/postgres'

# resume scp file transfers
alias scp='scp -C'
alias scpresume='rsync --partial --progress --rsh=ssh'

# renew dhcp lease
alias renew='sudo ipconfig set en0 DHCP'

# ios simulator
alias ios='xcrun instruments -w "iPhone 6 (8.3 Simulator)"'

# rebuilds finder's "open with" menu contents
alias rebuildopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias dontnotify='launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist && killall NotificationCenter'

# remove metadata from jpgs
alias scrubjpg='exiftool -P -all= '

# truecrypt
#alias truecrypt='/Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt -t'
#alias tcmount='truecrypt -k ""'
#alias tcunmount='truecrypt -d'

# concatenate pdfs
alias concatpdf='/usr/local/bin/gs -q -sPAPERSIZE=a4 -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=out.pdf'

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
alias gpall='for dir in `ls`; do pushd $dir; gf && gp && git gc; popd; done'

# log management via nathan
alias check_logs="find -x . -iname '*.log' -exec du -sk {} \; | sort -nr | head -n 10"
alias cleanup_logs="find . -iname '*.log' -exec sh -c \"echo '' > {}\" \;"
alias offenders="du -sk * | sort -nr | head -n 10"

# bundler + ruby
alias be='bundle exec'
alias bb='bundle exec'
alias bi='bundle install'
#export BUNDLE_GEMFILE=Gemfile.local
#alias nolocalgemfile='unset BUNDLE_GEMFILE'
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# sequoia
#export SEQUOIA_DEPLOY_USER=hbotee
export GMAIL_DOMAINS='sequoiacap.com,734m.com' # for who2
export SEQUOIA_DEPLOY_USER=app

# qstk
#export QSTK_DIR=~/play/coursera/2014/gatech/computational-investing-1/qstk

# x11
export DISPLAY=:0.0

# bel -- e.g., `long_running_command && bel` will alert a defocused terminal
alias bel='for n in $(seq 10); do tput bel; sleep 0.5 ; done'
