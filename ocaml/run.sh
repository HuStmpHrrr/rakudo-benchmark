#!/bin/bash

cd $(dirname `readlink -f $0`)
make &>/dev/null

for f in *; do
	if [ ! -x $f ] || [[ "$f" == "`basename $0`" ]]; then
		continue
	fi
	./$f
done | sort
