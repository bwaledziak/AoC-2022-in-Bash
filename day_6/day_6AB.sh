#!/bin/bash
# Advent of Code day 5
# https://adventofcode.com/2022/day/5
# Author: Bolesław Walędziak

read line < $1
len=${#line}

find_unique () {
 for (( i=0; i<=$((len-$1)); i++ )) do
   sequence=${line:$i:$1}
   vertical=""
   for (( k=0; k<$1; k++)) do
    vertical+="${sequence:$k:1}"
    if [[ $((k+1)) -ne $1 ]]; then
     vertical+=$'\n'
    fi
   done
   uniquelines=$(echo "$vertical" | sort | uniq | wc -l)
   if [[ uniquelines -eq $1 ]]; then
    echo $((i+$1)) && return 0
   fi
 done
}

echo -n "Answer for part A...(in progress)..." && echo "$(find_unique 4)"
echo -n "Answer for part B...(in progress)..." && echo "$(find_unique 14)"

exit
