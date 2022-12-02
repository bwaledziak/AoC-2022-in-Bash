#!/bin/bash
# Advent of Code day 2 B
# https://adventofcode.com/2022/day/2
# Author: Bolesław Walędziak

points=0

while read line; do
        strategy=${line:2:1}
        oppo_move=${line:0:1}

        case "$strategy" in
        X)      #need to loose
                case "$oppo_move" in
                A)      points=$((points+3));; #oppo-rock, me-scissors: 3 for scissors + 0 for loosing = 3
                B)      points=$((points+1));; #oppo-paper, me-rock: 1 for rock + 0 for loosing = 1
                C)      points=$((points+2));; #oppo-scissors, me-paper: 2 for paper + 0 for loosing = 2
                esac
        ;;
        Y)      #need to end in a draw
                case "$oppo_move" in
                A)      points=$((points+4));; #oppo-rock, me-rock: 1 for rock + 3 for a draw = 4
                B)      points=$((points+5));; #oppo-paper, me-paper: 2 for paper + 3 for a draw = 5
                C)      points=$((points+6));; #oppo-scissors, me-scissors: 3 for scissors + 3 for a draw = 6
                esac
        ;;
        Z)      #need to win
                case "$oppo_move" in
                A)      points=$((points+8));; #oppo-rock, me-paper: 2 for paper + 6 for winning = 8
                B)      points=$((points+9));; #oppo-paper, me-scissors: 3 for scissors + 6 for winning = 9
                C)      points=$((points+7));; #oppo-scissors, me-rock: 1 for rock + 6 for winning = 7
                esac

        ;;
        esac

done < input.txt

echo "$points"

exit 0
