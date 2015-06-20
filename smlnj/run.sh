#!/bin/bash

cd $(dirname `readlink -f $0`)

for f in *.sml; do
	sml < $f | grep -P '.*:.*seconds / \d+.'
done | sort
