#! /bin/bash

checkout_folder=`dirname $0`
vimrc='vimrc'
gvimrc=g$vimrc

function link_file() {
  ln -nsv "$checkout_folder/$1" ~/.$1
}


echo " *** Updating bundle in $checkout_folder/"
cd "$checkout_folder" && git submodule init && git submodule update && 
cd - > /dev/null || exit

if test "$1" = '-f' || test "$1" = '--force'
then
  force=true
else
  force=false
  message="use -f or --force to overwrite vim config files"
fi

if test -f ~/.vimrc && $force
then
  echo " **** Over writing ~/.$vimrc"
  rm ~/.$vimrc && link_file $vimrc
else
  link_file $vimrc
fi

if test -f ~/.vimrc && $force
then
  echo " **** Over writing ~/.$gvimrc"
  rm ~/.$gvimrc && link_file $gvimrc
else
  link_file $gvimrc
fi
