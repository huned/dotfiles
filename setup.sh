#!/usr/bin/env sh

TRASH_DIR=~/.Trash
SCRIPT_DIR=`dirname $0`

mkdir -p $TRASH_DIR

for src in `ls -Ad $SCRIPT_DIR/.*`; do
  file=`basename $src`

  # skip . and ..
  if [[ $file == '.' || $file == '..' ]]; then
    continue
  fi

  src=$SCRIPT_DIR/$file
  dst=~/$file

  # mv existing files to $TRASH_DIR
  if [[ -L $dst || -e $dst || -d $dst ]]; then
    mv $dst $TRASH_DIR
  fi

  # create the symlink
  ln -s $src $dst
done
