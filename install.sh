#!/bin/bash

for item in $(find dot); do
  target=~/`echo $item | sed -e 's@dot/*@.@'`

  if [ -d $item ]; then
    test -d $target || mkdir -p $target
  elif [ -f $item ]; then
    echo "Copying ${item} to ${target}" 
    cp $item $target
  fi
done