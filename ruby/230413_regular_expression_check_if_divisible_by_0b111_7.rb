# Regular Expression - Check if divisible by 0b111 (7)
# https://www.codewars.com/kata/56a73d2194505c29f600002d/train/ruby

# Create a regular expression capable of evaluating binary strings (which consist of only 1's and 0's) and determining
# whether the given string represents a number divisible by 7.

# Note:
# Empty strings should be rejected.
# Your solution should reject strings with any character other than 0 and 1.
# No leading 0's will be tested unless the string exactly denotes 0.

solution = /^(0|1(0(01)*00|(101*0|0(01)*1)(001*0|11(01)*1)*(10|11(01)*00))*(11|(101*0|0(01)*1)(001*0|11(01)*1)*01))+$/

# Solution obtained using state elimination method
