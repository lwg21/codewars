# Split Strings
# https://www.codewars.com/kata/515de9ae9dcfc28eb6000001/train/ruby

# Complete the solution so that it splits the string into pairs of two characters.
# If the string contains an odd number of characters then it should replace
# the missing second character of the final pair with an underscore ('_').

# Examples:
# * 'abc' =>  ['ab', 'c_']
# * 'abcdef' => ['ab', 'cd', 'ef']

def solution(str)
  pairs = str.scan(/\w{2}/)
  str.size.odd? ? pairs << "#{str[-1]}_" : pairs
end
