#!/usr/bin/env ruby

path = ARGV[0]
lines = File.readlines path

dial = 50
zeroes = 0

lines.each do |line|
  line = line.rstrip
  sign = line.start_with?('L') ? -1 : 1
  n = Integer(line[1..])
  n.times do
    dial = (dial + sign) % 100
    zeroes += 1 if dial.zero?
  end
end

puts zeroes
