#!/bin/bash

cd $(dirname `readlink -f $0`)
make

for f in *; do
	if [ ! -x $f ] || [[ "$f" == "`basename $0`" ]]; then
		continue
	fi
	./$f
done | sort
