# Back and Forth: How Many for Each Side?
# https://www.codewars.com/kata/63624a696137b6000ed726a6/train/ruby

# Back and Forth:
# You are carrying boxes between 2 locations, to be easy, we call them first and second.
# You will receive a list of numbers as input, called lst.
# You are moving back and forth between first and second, carrying that amount of boxes to the other side.
# You always start from first.
# See the following:
# You move from first to second.
#  v     v
# [1, 2, 3, 4]
#     ^     ^
# You move from second to first.


# How Many Boxes:
# Before you carry the boxes, you have to have boxes there to carry, and the boxes can be used more than once.
# In the above example, we have 2 boxes at first and 2 boxes at second, note as (2, 2), and here is how it goes:
# (2, 2), 1 box was moved to the second(right), get (1, 3)
# (1, 3), 2 boxes were moved to the first(left), get (3, 1)
# (3, 1), 3 boxes were moved to the second(right), get (0, 4)
# (0, 4), 4 boxes were moved to the first(left), get (4, 0)

# If you have less than 2 boxes at any side, you will run out of boxes while carrying.
# Your task is to find out the minimum amount of boxes you need to have at each side, so you won't run out of boxes while carrying the boxes.
# Return the minimum amount for each side in a tuple(or any similar data type in the language), first element is the amount for first, second element is the amount for second.

# Performance:

# 0 <= length of lst <= 100
# 0 <= element of lst <= 200, upper bound may be varied with different languages

# As the numbers in random tests will get up to certain size(see above), solution with naive brute force approach will time out.

# Examples:
# Input -> Output
# [] -> (0, 0)
# [0] -> (0, 0)
# [3] -> (3, 0)
# [0, 2] -> (0, 2)
# [1, 2, 3, 4] -> (2, 2)
# [4, 3, 2, 1] -> (4, 0)
# [3, 0, 3] -> (6, 0)
# [3, 1, 3] -> (5, 0)

def minimum_amount moves
  odds = moves.select.with_index { |v,i| i.odd? }
  evens = moves.select.with_index { |v,i| i.even? }

end
