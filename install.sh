#! /bin/bash
#
# TODO: Use my `link-it` method!
#

CHECKOUT_FOLDER=$(cd `dirname $0` && pwd && cd - > /dev/null)


function link_file() {
  ln -nsv "$CHECKOUT_FOLDER/$1" ~/.$1
}


echo " *** Updating bundle in $CHECKOUT_FOLDER/"
cd "$CHECKOUT_FOLDER" && git submodule update --init &&
cd - > /dev/null || exit


if test "$1" = "-f" || test "$1" = "--force"; then
  force=true
else
  force=false
  message=" *** use -f or --force to overwrite"
fi


if [ -e "$HOME/.vimrc" ] && $force; then
  echo " **** Over writing ~/.vimrc"
  rm '~/.vimrc' && link_file 'vimrc' && error=false
else
  link_file 'vimrc' || error=true
fi


test -e "$HOME/.gvimrc" && $force && {
  echo ' **** Over writing ~/.gvimrc'
  rm '~/.gvimrc' && link_file 'gvimrc' && error=false
} || {
  link_file 'gvimrc' || error=true
}


unset CHECKOUT_FOLDER


$error && echo $message
