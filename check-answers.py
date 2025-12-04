#!/usr/bin/env python3
import sys
import subprocess

assert len(sys.argv) == 3

_, flag, command = sys.argv

assert flag in ['-p1', '-p2'] or flag.startswith('-a')
if flag.startswith('-a'):
    expected_answer = flag[2:]
else:
    part_number = int(flag[-1])
    answers = open('answers.txt').read().splitlines()
    expected_answer = answers[part_number - 1]

output_lines = (
    subprocess.check_output(command, shell=True)
    .decode('utf-8')
    .splitlines()
)
actual_answer = (
    ([None] + output_lines)[-1]
)

if actual_answer != expected_answer:
    print(f'Failed: {command}')
    print(f'  - Last line of output: {actual_answer}')
    print(f'  - Expected:            {expected_answer}')
