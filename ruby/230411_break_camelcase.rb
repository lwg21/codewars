# Break camelCase
# https://www.codewars.com/kata/5208f99aee097e6552000148/train/ruby

# Complete the solution so that the function will break up camel casing, using a space between words.
# Example
# "camelCasing"  =>  "camel Casing"
# "identifier"   =>  "identifier"
# ""             =>  ""

def solution(string)
  string.scan(/^[a-z]+|[A-Z][a-z]*/).join(' ')
end

# Alternatives by other users

def solution2(string)
  string.gsub /([A-Z])/, ' \1'
end

def solution3(string)
  string.scan(/[A-Z]?[a-z]+/) * ' '
end
