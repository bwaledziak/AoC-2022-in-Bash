#!/bin/bash
# Advent of Code day 1a
# https://adventofcode.com/2022/day/1 
# Author: Bolesław Walędziak

declare -i max=0
declare -i this=0

while read line; do
	if [[ "$line" == "" ]]; then
		if [[ this -gt max ]]; then
			max=this
		fi
		this=0
	else 
		this=$((this+line))
	fi
done < input.txt

if [[ this -gt max ]]; then
	max=this
fi

echo "$max"

exit 0





