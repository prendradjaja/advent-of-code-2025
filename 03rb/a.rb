#!/usr/bin/env ruby

def solve
  path = ARGV.fetch 0
  lines = File.readlines(path).map(&:rstrip)
  lines.map{|line| get_joltage line}.sum
end

def get_joltage line
  combinations(line).map(&:join).map(&:to_i).max
end

def combinations line
  result = []
  line[...-1].each_char.each_with_index do |c1, i|
    line[i+1...].each_char.each do |c2|
      result.push [c1, c2]
    end
  end
  result
end

puts solve
