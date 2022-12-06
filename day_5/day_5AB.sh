#!/bin/bash
# Advent of Code day 5
# https://adventofcode.com/2022/day/5
# Author: Bolesław Walędziak

INPUT="./input.txt"

# How many stacks are there?
headline=$(head -1 "$INPUT")
STACKS=$(((${#headline}+1)/4))


echo -e "READING THE CRATES LAYOUT"
IFS=''
while read line; do
  echo -e "\nLine: $line"
  for (( i=1; i<=STACKS; i++ )) do
    pos=$((4*i-3))
    cargo=${line:$pos:1}
    if ! [[ "$cargo" == " " ]]; then
      stack[$i]+=$cargo
      echo "$cargo saved in stack[$i], stack[$i] now looks like this: ${stack[$i]}"
    fi
  done
done < <(grep "[[:upper:]]" "$INPUT")
echo -e "\nStacks now look like this:"
for (( i=1; i<=STACKS; i++ )) do
  echo "Stack[$i]: ${stack[$i]}"
done

echo -e "\nREVERSING THE STACKS ('cause we read them upside down)"
for (( i=1; i<=STACKS; i++ )) do
  stacksize=${#stack[$i]}
  sidestack=""
  for (( k=1; k<=stacksize; k++ )) do
    sidestack+=${stack[$i]:0-1}
    stack[$i]=${stack[$i]::-1}
  done
  stack[$i]=$sidestack
# Let's copy the reversed stack array also to the new stackB array 
# for the B part of the puzzle
  stackB[$i]=$sidestack 
done
echo -e "\nStacks after reversing look like this:"
for (( i=1; i<=STACKS; i++ )) do
  echo "Stack[$i]: ${stack[$i]}"
done

echo -e "\nREADING AND EXECUTING INSTRUCTIONS FOR THE CRANE"
instructioncounter=0
while read line; do
  instructioncounter=$((instructioncounter+1))
  echo -e "\nInstruction #$instructioncounter: $line"
  crates=$(echo "$line" | cut -d " " -f 2)
  source=$(echo "$line" | cut -d " " -f 4)
  dest=$(echo "$line" | cut -d " " -f 6)
  echo "CrateMover 9000 will move $crates crates (one by one) from stack[$source] to stack[$dest]"
  for (( i=1; i<=crates; i++ )) do
    currentcrate=${stack[$source]:0-1}
    echo "Moving [$currentcrate] from: ${stack[$source]} to: ${stack[$dest]}"
    stack[$dest]+=$currentcrate
    stack[$source]=${stack[$source]::-1}
  done
  echo "CrateMover 9001 will move a pack of $crates crates from stackB[$source] to stackB[$dest]"
  packofcrates=${stackB[$source]:0-$crates}
  echo "Moving [$packofcrates] from: ${stackB[$source]} to: ${stackB[$dest]}"
  stackB[$dest]+=$packofcrates
  stackB[$source]=${stackB[$source]::-$crates}
  echo "Instruction completed"
done < <(grep "move" "$INPUT")
echo -e "\n...and that was the last one."
echo "Stacks A now look like this:"
for (( i=1; i<=STACKS; i++ )) do
  echo "Stack[$i]: ${stack[$i]}"
done
echo "Stacks B now look like this:"
for (( i=1; i<=STACKS; i++ )) do
  echo "StackB[$i]: ${stackB[$i]}"
done

echo -e "\nREADING THE TOP CRATES ON EACH STACK AND GENERATING THE ANSWERS"
answerA=""
answerB=""
for (( i=1; i<=STACKS; i++ )) do
  answerA+=${stack[$i]:0-1}
  answerB+=${stackB[$i]:0-1}
done

echo -e "\nAnswer for part 1: $answerA"
echo "Answer for part 2: $answerB"
echo "PUZZLE SOLVED!"
