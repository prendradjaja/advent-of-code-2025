#!/usr/bin/env python3

import sys

def main():
    dial = 50
    zeroes = 0
    for line in open(sys.argv[1]).read().splitlines():
        sign, n = parse(line)  # How much to turn the dial by
        for _ in range(n):
            dial = (dial + sign) % 100
            if dial == 0:
                zeroes += 1
    print(zeroes)

def parse(line):
    direction = line[0]
    n = int(line[1:])
    sign = 1 if direction == 'R' else -1
    return sign, n

main()
