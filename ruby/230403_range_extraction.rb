# Range Extraction
# https://www.codewars.com/kata/51ba717bb08c1cd60f00002f/train/ruby

# A format for expressing an ordered list of integers is to use a comma separated list of either

# individual integers
# or a range of integers denoted by the starting integer separated from the end integer in the range by a dash, '-'.
# The range includes all integers in the interval including both endpoints.
# It is not considered a range unless it spans at least 3 numbers. For example "12,13,15-17"

# Complete the solution  so that it takes a list of integers in increasing order and returns a correctly formatted
# string in the range format.

# Example:
# solution([-10, -9, -8, -6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20])
# # returns "-10--8,-6,-3-1,3-5,7-11,14,15,17-20"

def solution(list)
  regex = /(?<l1>-?\w+),(?<l2>-?\w+)$|(?<r1>-?\w+)-(?<r2>-?\w+)$/
  string = list[0..1].join(',')
  list[2..-1].each do |e|
    match = string.match(regex)
    if e == match[:l2].to_i + 1 && match[:l2].to_i == match[:l1].to_i + 1
      string.gsub!(regex, "#{match[:l1]}-#{e}")
    elsif e == match[:r2].to_i + 1
      string.gsub!(regex, "#{match[:r1]}-#{e}")
    else
      string += ",#{e}"
    end
  end
  string
end

# Alternatives by other users

def solution2(list)
  list
    .chunk_while { |n1, n2| n2 - n1 == 1 }
    .map { |set| set.size > 2 ? "#{set.first}-#{set.last}" : set }
    .join(',')
end
