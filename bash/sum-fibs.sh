#!/bin/bash

function sum_fibs() {
	local arr=(1 1)
	local i=0
	while true; do
		local r=`expr ${arr[$i]} + ${arr[$((i+1))]}`
		if (( "$r" > "4000000" )); then
			break
		fi
		arr+=($r)
		((i++))
	done
	local v
	local sum=0
	for v in "${arr[@]}"; do
		if (( $v % 2 == 0 )); then
			((sum+=$v))
		fi
	done
}

{ time { for j in `seq 100`; do sum_fibs; done; }; } 2>&1 | tr 'ms' '  ' | awk '/real/ { print "sum fibs:", 60.0*$2+$3, "seconds / 100" }'
