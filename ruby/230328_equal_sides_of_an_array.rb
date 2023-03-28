# Equal Sides Of An Array
# https://www.codewars.com/kata/5679aa472b8f57fb8c000047/train/ruby

# You are going to be given an array of integers. Your job is to take that array and find an index N
# where the sum of the integers to the left of N is equal to the sum of the integers to the right of N.
# If there is no index that would make this happen, return -1.

# Example:
# Let's say you are given the array [1,2,3,4,3,2,1]
# Your function will return the index 3, because at the 3rd position of the array, the sum of left side
# of the index ({1,2,3}) and the sum of the right side of the index ({3,2,1}) both equal 6.

def find_even_index(arr)
  arr.each_with_index { |n, i| return i if arr[0, i].sum == arr.drop(i + 1).sum }
  -1
end
