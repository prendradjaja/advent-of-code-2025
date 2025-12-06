#!/usr/bin/env ruby

def solve
  path = ARGV.fetch 0
  lines = File.readlines(path).map(&:rstrip)
  g = Grid.new lines

  removed = 0
  while true
    removable = find_removable g
    break if removable.length == 0
    removed += removable.length
    removable.each { |pos| g.set pos, '.' }
  end
  removed
end

def find_removable g
  g.all_positions
    .filter { |pos| g.get(pos) == '@' }
    .filter { |pos|
      count = g.neighbors(pos)
        .map { |neighbor| g.get neighbor }
        .filter { |c| c == '@' }
        .count
      count < 4
    }
end

class Grid
  def initialize lines
    @lines = lines
    @size = lines.length  # height = width = size
  end

  def get pos
    @lines[pos.r][pos.c]
  end

  def set pos, value
    @lines[pos.r][pos.c] = value
  end

  def neighbors pos
    offsets = [
      [-1, -1], [-1, 0], [-1, 1],
      [ 0, -1],          [ 0, 1],
      [ 1, -1], [ 1, 0], [ 1, 1]
    ]
    offsets
      .map { |(dr, dc)| Vector.new(dr, dc) + pos }
      .filter { |v| in_bounds(v) }
  end

  def all_positions
    (0...@size).flat_map do |r|
      (0...@size).map do |c|
        Vector.new(r, c)
      end
    end
  end

  def in_bounds pos
    0 <= pos.r and pos.r < @size and
    0 <= pos.c and pos.c < @size
  end
end

class Vector
  attr_reader :r
  attr_reader :c

  def initialize r, c
    @r = r
    @c = c
  end

  def + other
    Vector.new(@r + other.r, @c + other.c)
  end
end

puts solve
