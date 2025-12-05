#!/usr/bin/env ruby

def solve
  path = ARGV.fetch 0
  text = File.read path

  # Parse
  ranges_text, ingredients_text = text.split "\n\n"
  ranges = ranges_text.lines(chomp: true).map { |text| parse_range(text) }
  ingredients = ingredients_text.lines(chomp: true).map(&:to_i)

  # Solve
  ingredients
    .filter { |ingredient| is_fresh = ranges.any? { |r| r.contains ingredient } }
    .count
end

def parse_range text
  start, stop = text.split('-').map(&:to_i)
  MyRange.new start, stop
end

class MyRange
  def initialize start, stop
    @start = start
    @stop = stop
  end

  def contains n
    @start <= n and n <= @stop
  end
end

puts solve
