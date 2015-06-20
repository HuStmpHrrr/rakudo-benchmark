#!/bin/bash

for d in *; do
	if [ ! -d $d ]; then
		continue
	fi
	if [ -f "$d/run.sh" ]; then
		$d/run.sh
	else
		for f in $d/*; do
			if [ ! -x $f ]; then
				continue
			fi
			./$f
		done | sort
	fi | sed "s|^|$d: |"
done
