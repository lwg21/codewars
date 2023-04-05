# Calculating with Functions
# https://www.codewars.com/kata/525f3eda17c7cd9f9e000b39/train/ruby

# This time we want to write calculations using functions and get the results. Let's have a look at some examples:

# seven(times(five())) # must return 35
# four(plus(nine())) # must return 13
# eight(minus(three())) # must return 5
# six(divided_by(two())) # must return 3

# Requirements:
# There must be a function for each number from 0 ("zero") to 9 ("nine")
# There must be a function for each of the following mathematical operations: plus, minus, times, divided_by
# Each calculation consist of exactly one operation and two numbers
# The most outer function represents the left operand, the most inner function represents the right operand
# Division should be integer division. For example, this should return 2, not 2.666666...:

def zero(oper = nil)
  oper ? eval("0 #{oper}") : 0
end

def one(oper = nil)
  oper ? eval("1 #{oper}") : 1
end

def two(oper = nil)
  oper ? eval("2 #{oper}") : 2
end

def three(oper = nil)
  oper ? eval("3 #{oper}") : 3
end

def four(oper = nil)
  oper ? eval("4 #{oper}") : 4
end

def five(oper = nil)
  oper ? eval("5 #{oper}") : 5
end

def six(oper = nil)
  oper ? eval("6 #{oper}") : 6
end

def seven(oper = nil)
  oper ? eval("7 #{oper}") : 7
end

def eight(oper = nil)
  oper ? eval("8 #{oper}") : 8
end

def nine(oper = nil)
  oper ? eval("9 #{oper}") : 9
end

def plus(num)
  "+ #{num}"
end

def minus(num)
  "- #{num}"
end

def times(num)
  "* #{num}"
end

def divided_by(num)
  "/ #{num}"
end
