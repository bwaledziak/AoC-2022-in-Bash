#!/bin/bash
# Advent of Code day 4
# https://adventofcode.com/2022/day/4
# Author: Bolesław Walędziak

part1=0
part2=0

while read line; do
  contain="NO" #for test
  overlap="NO" #for test
  rangeA=$(echo "$line" | cut -d "," -f 1)
  rangeB=$(echo "$line" | cut -d "," -f 2)
  minA=$(echo "$rangeA" | cut -d "-" -f 1)
  maxA=$(echo "$rangeA" | cut -d "-" -f 2)
  minB=$(echo "$rangeB" | cut -d "-" -f 1)
  maxB=$(echo "$rangeB" | cut -d "-" -f 2)

  if [[ (minA -le minB && maxA -ge maxB) || (minB -le minA && maxB -ge maxA) ]]; then
    contain="YES" #for test
    part1=$((part1+1))
  fi

  if [[ (minA -le minB && maxA -ge minB) || (minB -le minA && maxB -ge minA) ]]; then
    overlap="YES" #for test
    part2=$((part2+1))
  fi
  #below line is unnessesary for solution, it's for test purpose only
  echo "A: $rangeA min: $minA, max: $maxA, B: $rangeB, min: $minB, max: $maxB, fully contain: $contain, total: $part1,  overlap: $overlap, total: $part2"
done < input.txt

echo "Answer for part 1: $part1"
echo "Answer for part 2: $part2"

