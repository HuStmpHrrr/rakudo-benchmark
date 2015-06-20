#!/bin/bash

cd $(dirname `readlink -f $0`)

make

for f in *.java; do
	java `basename ${f%%.*}`
done | sort
