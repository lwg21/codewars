# Strip Comments
# https://www.codewars.com/kata/51c8e37cee245da6b40000bd/train/ruby

# Complete the solution so that it strips all text that follows any of a set of comment markers passed in.
# Any whitespace at the end of the line should also be stripped out.
# Example:
# Given an input string of:
# apples, pears # and bananas
# grapes
# bananas !apples

# The output expected would be:
# apples, pears
# grapes
# bananas

# The code would be called like so:
# result = solution("apples, pears # and bananas\ngrapes\nbananas !apples", ["#", "!"])
# => result should == "apples, pears\ngrapes\nbananas"

def solution(input, markers)
  lines = input.split("\n").map do |line|
    cut = markers.map { |m| line.include?(m) ? line.index(m) : line.size }.min
    line.slice(0, cut).rstrip
  end
  lines.join("\n")
end

# Alternatives

def solution2(input, markers)
  input.gsub(/\s+[#{markers.join}].*/, '')
end
