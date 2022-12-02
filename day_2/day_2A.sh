#!/bin/bash
# Advent of Code day 2 A
# https://adventofcode.com/2022/day/2
# Author: Bolesław Walędziak

points=0

while read line; do
	my_move=${line:2:1}
	oppo_move=${line:0:1}
	
	case "$my_move" in
	X)	points=$((points+1))
		case "$oppo_move" in
		A)	points=$((points+3));;
		B)	points=$((points+0));;
		C)	points=$((points+6));;
		esac
	;;
	Y)	points=$((points+2))
		case "$oppo_move" in
                A)      points=$((points+6));;
                B)      points=$((points+3));;
                C)      points=$((points+0));;
                esac
	;;
	Z)	points=$((points+3))
		case "$oppo_move" in
                A)      points=$((points+0));;
                B)      points=$((points+6));;
                C)      points=$((points+3));;
                esac

	;;
	esac

done < input.txt

echo "$points"

exit 0
