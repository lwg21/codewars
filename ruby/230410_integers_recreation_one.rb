# Integers: Recreation One
# https://www.codewars.com/kata/55aa075506463dac6600010d/train/ruby

# 1, 246, 2, 123, 3, 82, 6, 41 are the divisors of number 246. Squaring these divisors we get: 1, 60516, 4, 15129, 9, 6724, 36, 1681. The sum of these squares is 84100 which is 290 * 290.
# Task
# Find all integers between m and n (m and n integers with 1 <= m <= n) such that the sum of their squared divisors is itself a square.
# We will return an array of subarrays or of tuples (in C an array of Pair) or a string.
# The subarrays (or tuples or Pairs) will have two elements: first the number the squared divisors of which is a square and then the sum of the squared divisors.

# Example:
# list_squared(1, 250) --> [[1, 1], [42, 2500], [246, 84100]]
# list_squared(42, 250) --> [[42, 2500], [246, 84100]]

# Unoptimised solution

def list_squared(m, n)
  list = []
  (m..n).each do |num|
    sum_sq = (1..num).select { |s| (num % s).zero? }.map { |s| s * s }.sum
    list << [num, sum_sq] if (Math.sqrt(sum_sq) % 1).zero?
  end
  list
end

# More efficient solution

def list_squared(m, n)
  list = []
  (m..n).each do |num|
    divisors = []
    (1..Math.sqrt(num).round).each { |s| (num % s).zero? ? divisors.push(s, num / s) : nil }
    (Math.sqrt(num) % 1).zero? ? divisors.pop : nil
    sum_sq = divisors.map { |s| s * s }.sum
    list << [num, sum_sq] if (Math.sqrt(sum_sq) % 1).zero?
  end
  list
end
