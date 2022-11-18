#!/usr/bin/bash

for dir in $(ls); do
  if [ -d $dir ]; then
    $dir/install.sh
  fi
done
