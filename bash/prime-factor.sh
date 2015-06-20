#!/bin/bash

function init_iter()
{
	CURRENT=2
	NEXT=3
}

function next()
{
	local ret=$CURRENT
	CURRENT=$NEXT
	((NEXT+=2))
	echo $ret
}

function lpf()
{
	local n=$1
	init_iter
	while true; do
		local i=`next`
		next >/dev/null
		while (($n % $i == 0)); do
			((n/=$i))
			if (($i > $n)); then
				echo $i
				return
			fi
		done
	done
	return
}

{ time lpf 600851475143; } 2>&1 | tr 'ms' '  ' | awk '/real/ { print "prime factor:", 60.0*$2+$3, "seconds / 1" }'
