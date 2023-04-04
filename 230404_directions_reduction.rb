# Directions Reduction
# https://www.codewars.com/kata/550f22f4d758534c1100025a/train/ruby

# Going to one direction and coming back the opposite direction right away is a needless effort. Going "NORTH" and immediately "SOUTH" is not reasonable, better stay to the same place!

# Examples:
# In ["NORTH", "SOUTH", "EAST", "WEST"], the direction "NORTH" + "SOUTH" is going north and coming back right away.
# The path becomes ["EAST", "WEST"], now "EAST" and "WEST" annihilate each other, therefore, the final result is [].
# In ["NORTH", "EAST", "WEST", "SOUTH", "WEST", "WEST"], "NORTH" and "SOUTH" are not directly opposite but they become directly opposite after the reduction of "EAST" and "WEST" so the whole path is reducible to ["WEST", "WEST"].
# Not all paths can be made simpler.
# The path ["NORTH", "WEST", "SOUTH", "EAST"] is not reducible. "NORTH" and "WEST", "WEST" and "SOUTH", "SOUTH" and "EAST" are not directly opposite of each other and can't become such. Hence the result path is itself : ["NORTH", "WEST", "SOUTH", "EAST"].

# Task:
# Write a function dirReduc which will take an array of strings and returns an array of strings with the needless directions removed (W<->E or S<->N side by side).

require 'pry-byebug'

def dirReduc(arr)
  # ns = %w[NORTH SOUTH]
  # ew = %w[EAST WEST]
  opposite = {
    'NORTH' => 'SOUTH',
    'SOUTH' => 'NORTH',
    'EAST' => 'WEST',
    'WEST' => 'EAST'
  }
  reduc_arr = arr
  temp = []
  reduc_count = nil
  skip = false

  until reduc_count == 0
    reduc_count = 0
    temp = []
    reduc_arr.each_with_index do |e, i|
      if skip
        skip = false
      elsif reduc_arr[i + 1] == opposite[e]
        skip = true
        reduc_count += 1
      else
        temp << e
      end
    end
    reduc_arr = temp
  end
  reduc_arr
end

p dirReduc(["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"])
