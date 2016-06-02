#! /bin/bash

set -e

CLONED_PATH=$(cd `dirname $0` && pwd && cd - > /dev/null)

function link_file() {
  echo "> Linking '$CLONED_PATH/$1' -> ~/.${1/_/}"
  message="$(ln -ns "$CLONED_PATH/$1" ~/.${1/_/} 2>&1)"
}

if test "$1" = "-f" || test "$1" = "--force"; then
  if [[ -e "$HOME/.vimrc" ]]; then
    echo '> Backing up existing ~/.vimrc to ~/.vimrc.bak'
    mv "$HOME"/.vimrc{,.bak}
  fi

  link_file '_vimrc'
else
  link_file '_vimrc' || {
    message="> $message use -f or --force to overwrite"
  }
fi

[[ -n $message ]] && echo $message || {
  vim +qall && echo '> done'
}
