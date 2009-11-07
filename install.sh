#!/bin/bash

for dotfile in $(find home -type f); do
	target=`echo ${dotfile} | sed -e 's@home/@@' | sed -e 's@dot/@.@'`
	cp $dotfile ~/$target
done
