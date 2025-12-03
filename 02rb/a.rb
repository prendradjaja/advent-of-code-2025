#!/usr/bin/env ruby

def main
  path = ARGV.fetch(0)
  text = (File.read path).strip
  chunks = text.split ','
  answer = 0
  chunks.each do |chunk|
    start, stop = parse chunk
    (start..stop).each do |n|
      answer += n if invalid n
    end
  end
  puts answer
end

def parse(chunk)
  start, stop = chunk.split '-'
  start = Integer(start)
  stop = Integer(stop)
  [start, stop]
end

def invalid(n)
  s = n.to_s
  length = s.length
  return false if length % 2 == 1

  half = length / 2
  first = s[...half]
  second = s[half..]
  first == second
end

main
