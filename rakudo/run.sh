#!/bin/bash

cd $(dirname `readlink -f $0`)

for f in *; do
	if [ ! -x $f ] || [[ "$f" == run* ]]; then
		continue
	fi
	./$f | sed -n -r 's/: (.*) wall.*n=([0-9]+).*/: \1 seconds \/ \2./p' | xargs
done | sort
