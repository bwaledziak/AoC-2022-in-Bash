#!/bin/bash
# Advent of Code day 1 B
# https://adventofcode.com/2022/day/1#part2
# Author: Bolesław Walędziak

declare -i this=0
declare FILE=./list_of_calories.txt

test -f "$FILE" && rm "$FILE"

#Reading the input and creating the list of total calories in separated file
while read line; do
	if [[ "$line" == "" ]]; then
		echo "$this" >> "$FILE"
		this=0
		last_line="empty"
	else 
		this=$((this+line))
		last_line="not empty"
	fi
done < input.txt

if [[ "$last_line" == "not empty" ]]; then
	echo "$this" >> "$FILE"
fi

#Sorting and trimming the list
echo "$(sort -nr "$FILE" | head -n 3)" > "$FILE"

#Reading the list and counting the final answer
declare -i top_three_total=0
while read line; do
	top_three_total=$((top_three_total+line))
done < "$FILE"

#...and finally
echo "$top_three_total"

exit 0





