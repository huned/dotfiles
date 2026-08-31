#
# ALIASES
#

# common system commands
alias less="less -FIRX"

# git
alias ga="git add"
alias gd="git diff"
alias gp="git pull"
alias gs="git status --short"
alias gl="git log --stat"
alias gc="git commit -v"
alias gist="gist-paste"

# apt
alias aupg="sudo apt update --fix-missing && apt list --upgradable -a && sudo apt upgrade -y && sudo apt autoremove --purge -y"

# serve local directory via http
alias caddyserve="caddy file-server --browse --listen :8001"
alias httpserve=caddyserve

# color scheme
alias color-scheme="gsettings get org.gnome.desktop.interface color-scheme"

# window focus mode
alias sloppyfocus="gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'"
alias clickfocus="gsettings set org.gnome.desktop.wm.preferences focus-mode 'click'"

#
# INTEGRATIONS
#

# editor
export EDITOR=$(which nvim || which vim || which vi)
alias vi="$EDITOR"

# batcat
alias bat=$(which batcat)
export BAT_THEME="Catppuccin Mocha"

# deno
[ -f $HOME/.deno/env ] && source "$HOME/.deno/env"

# go
[ -x /usr/local/go ] && export PATH="$HOME/go/bin:/usr/local/go/bin:$PATH"

# quick security probe check
alias check_probes='sudo ss -tulnp && sudo journalctl -u ufw -n 50 | grep REJECT && sudo fail2ban-client status'

# omniroute
alias omniroute="nice -n 19 ionice -c 3 omniroute --no-open"

# shellfish
[ -f $HOME/.shellfishrc ] && source "$HOME/.shellfishrc"

# Backups
#alias backup='cat /proc/mounts | grep sdb1 && rsync -avz ${HOME} $(cat /proc/mounts | grep sdb1 | cut -d" " -f2)/$(date +%Y-%m-%d-%H%M)'
[ -f "$HOME/.bash_backup_funcs" ] && source "$HOME/.bash_backup_funcs"
