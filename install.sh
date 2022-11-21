#!/usr/bin/bash

source utils

if [ $0 -eq 0 ]; then
  for dir in $(ls); do
    if [ -d $dir ]; then
      $dir/install.sh
    fi
  done
else
  for dir in $@; do
    if [ -d $dir ]; then
      $dir/install.sh
    else
      error "$dir not found, skipping"
    fi
  done
fi
