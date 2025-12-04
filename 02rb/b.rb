#!/usr/bin/env ruby

def main
  path = ARGV.fetch(0)
  text = File.read(path).strip
  ranges = text.split ','
  answer = 0
  ranges.each do |range|
    start, stop = range.split('-').map(&:to_i)
    (start..stop).each do |n|
      answer += n if invalid n
    end
  end
  puts answer
end

def equal_chunks text, chunk_count
  raise "Not divisible" if text.length % chunk_count != 0
  chunk_size = text.length / chunk_count
  (0...chunk_count).map do |i|
    start = i * chunk_size
    stop = start + chunk_size
    text[start...stop]
  end
end

def invalid n
  s = n.to_s
  (2..s.length)
    .filter { |chunk_count| s.length % chunk_count == 0 }
    .any? { |chunk_count| invalid_n s, chunk_count }
end

def invalid_n s, n
  return false if s.length % n == 1
  equal_chunks(s, n).uniq.length == 1
end

main
