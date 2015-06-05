#!/bin/bash

function sum_fibs() {
	local arr=(1 1)
	local i=0
	while true; do
		local r=`expr ${arr[$i]} + ${arr[$((i+1))]}`
		if (( $r > 4000000 )); then
			break
		fi
		arr+=$r
		((i++))
	done
	local v
	local sum
	for v in "${arr[@]}"; do
		if (( $v % 2 == 0 )); then
			((sum+=$v))
		fi
	done
}
