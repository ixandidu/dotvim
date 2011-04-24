#! /bin/bash
checkout_folder=$(cd `dirname $0` && pwd && cd - > /dev/null)
vimrc='vimrc'
gvimrc=g$vimrc

function link_file() {
  ln -nsv "$checkout_folder/$1" ~/.$1
}

echo " *** Updating bundle in $checkout_folder/"
cd "$checkout_folder" && git submodule update --init &&
cd - > /dev/null || exit

if test "$1" = "-f" || test "$1" = "--force"
then
  force=true
else
  force=false
  message=" *** use -f or --force to overwrite"
fi

if [ -e "$HOME/.$vimrc" ] && $force
then
  echo " **** Over writing ~/.$vimrc"
  rm ~/.$vimrc && link_file $vimrc && error=false
else
  link_file $vimrc || error=true
fi

test -e "$HOME/.$gvimrc" && $force && {
  echo " **** Over writing ~/.$gvimrc"
  rm ~/.$gvimrc && link_file $gvimrc && error=false
} || {
  link_file $gvimrc || error=true
}

$error && echo "$message"
