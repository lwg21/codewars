# Make a spiral
# https://www.codewars.com/kata/534e01fbbb17187c7e0000c6/train/ruby

# Your task, is to create a NxN spiral with a given size.
# For example, spiral with size 5 should look like this:
# 00000
# ....0
# 000.0
# 0...0
# 00000

# and with the size 10:
# 0000000000
# .........0
# 00000000.0
# 0......0.0
# 0.0000.0.0
# 0.0..0.0.0
# 0.0....0.0
# 0.000000.0
# 0........0
# 0000000000

# Return value should contain array of arrays, of 0 and 1, with the first row being composed of 1s.
# For example for given size 5 result should be:
# [[1,1,1,1,1],[0,0,0,0,1],[1,1,1,0,1],[1,0,0,0,1],[1,1,1,1,1]]

# Because of the edge-cases for tiny spirals, the size will be at least 5.
# General rule-of-a-thumb is, that the snake made with '1' cannot touch to itself.

def spiralize(size)
  spiral = []
  size.times { spiral.push(Array.new(size, 0)) }

  i = 0
  j = 0
  dir = %w[r d l u]
  stop = 0
  max = size - 1

  until stop == 2
    spiral[i][j] = 1
    case dir[0]
    when 'r'
      if spiral[i][[j + 2, max].min].zero? && spiral[i + 1][j + 1].zero?
        j = [j + 1, max].min
        stop = 0
      else
        dir.rotate!
        stop += 1
      end
    when 'd'
      if spiral[[i + 2, max].min][j].zero? && spiral[i + 1][j - 1].zero?
        i = [i + 1, max].min
        stop = 0
      else
        dir.rotate!
        stop += 1
      end
    when 'l'
      if spiral[i][[j - 2, 0].max].zero? && spiral[i - 1][j - 1].zero?
        j = [j - 1, 0].max
        stop = 0
      else
        dir.rotate!
        stop += 1
      end
    when 'u'
      if spiral[[i - 2, 0].max][j].zero? && spiral[i - 1][j + 1].zero?
        i = [i - 1, 0].max
        stop = 0
      else
        dir.rotate!
        stop += 1
      end
    end
  end
  spiral
end

spiralize(5).each do |row|
  p row
end

spiralize(8).each do |row|
  p row
end
