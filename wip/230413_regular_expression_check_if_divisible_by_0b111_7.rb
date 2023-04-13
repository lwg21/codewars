# Regular Expression - Check if divisible by 0b111 (7)
# https://www.codewars.com/kata/56a73d2194505c29f600002d/train/ruby

# Create a regular expression capable of evaluating binary strings (which consist of only 1's and 0's) and determining whether the given string represents a number divisible by 7.
# Note:

# Empty strings should be rejected.
# Your solution should reject strings with any character other than 0 and 1.
# No leading 0's will be tested unless the string exactly denotes 0.

# Write a regular expression to detect whether a binary number is divisible by 7
# It won't be accepted if you code something else like Function


# solution = /^(0|1(01*0)*1)*$/
solution = /^0*(1(1(1|0)|0))*$/

# path = ^0*A(1B(1D|0C(1F|0E))*D1)*A$

path = "^0*A(1-B(1-D…D|0-…F…D)+D-1)*A$"
"^0*A(1-B(1-D…D|0-…F…D)+D-1*A$"
# ^0*A(1-B(1-D…D|0-C(1-F…|0-E)…F…D)+D-1)*A$


# (0|11(01*00)*1)|1(0|1(01*00)*01*011)((01|111)|00(0|1(01*00)*01*011))*10(01*00)*1|001(01*00)*1
# ^(0|11(01*00)*1|1(0|1(01*00)*01*011)((01|111)|00(0|1(01*00)*01*011))*10(01*00)*1|001(01*00)*1)*$

puts binary = path.chars.select { |c| c.match(/[^A-Z…\-]/) }.join

# Generating binary numbers

div = []
nondiv = []
(0..300).each do |num|
  (num % 7).zero? ? div << num : nondiv << num
end

puts "====== Divisible by 7"
div.each { |num| puts num.to_s(2) }

puts "====== NOT divisible by 7"
nondiv.sample(40).sort.each { |num| puts num.to_s(2) }
