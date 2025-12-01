#!/usr/bin/env ruby

path = ARGV[0]
lines = File.readlines path

dial = 50
zeroes = 0

lines.each do |line|
  line = line.rstrip
  sign = line[0] == 'L' ? -1 : 1
  n = Integer(line[1..])
  dial = (dial + sign * n) % 100
  zeroes += 1 if dial == 0
end

puts zeroes
