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
alias aupg="sudo apt update --fix-missing && apt list --upgradable -a && sudo apt upgrade -y && sudo apt autoremove -y"

# serve local directory via http
alias caddyserve="caddy file-server --browse --listen :8001"
alias httpserve=caddyserve

# color scheme
alias color-scheme="gsettings get org.gnome.desktop.interface color-scheme"

#
# INTEGRATIONS
#

# editor
export EDITOR=$(which nvim || whihc vim || which vi)
alias vi="$EDITOR"

# deno
[ -f $HOME/.deno/env ] && source "$HOME/.deno/env"

# shellfish
[ -f $HOME/.shellfishrc ] && source "$HOME/.shellfishrc"

# Backups
#alias backup='cat /proc/mounts | grep sdb1 && rsync -avz ${HOME} $(cat /proc/mounts | grep sdb1 | cut -d" " -f2)/$(date +%Y-%m-%d-%H%M)'
backup() {
  BACKUP_DEVICE='/dev/sdb1'
  MOUNT_LINE=$(cat /proc/mounts | grep $BACKUP_DEVICE)
  if [ -n "$MOUNT_LINE" ]; then
    MOUNT_POINT=$(echo "$MOUNT_LINE" | awk '{print $2}')
    DEST="$MOUNT_POINT/backup/$HOME/$(date +%Y-%m-%d-%H%M)"
    echo "Backing up $HOME to $DEST"
    mkdir -p "$DEST"
    rsync -avz "$HOME/" "$DEST/"
  else
    echo "Error: ${BACKUP_DEVICE} is not mounted."
    return 1
  fi
}
