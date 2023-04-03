# RGB To Hex Conversion
# https://www.codewars.com/kata/513e08acc600c94f01000001/train/ruby

# The rgb function is incomplete. Complete it so that passing in RGB decimal values will result in a hexadecimal representation being returned. Valid decimal values for RGB are 0 - 255. Any values that fall out of that range must be rounded to the closest valid value.
# Note: Your answer should always be 6 characters long, the shorthand with 3 will not work here.
# The following are examples of  expected output values:

# rgb(255, 255, 255) # returns FFFFFF
# rgb(255, 255, 300) # returns FFFFFF
# rgb(0,0,0) # returns 000000
# rgb(148, 0, 211) # returns 9400D3

def rgb(r, g, b)
  [r, g, b]
    .map { |n| [0, [n, 255].min].max }
    .map { |n| n.to_s(16).size == 1 ? "0#{n.to_s(16).upcase}" : n.to_s(16).upcase }
    .join
end

# Alternatives by other users

def rgb2(r, g, b)
  '%02X' * 3 % [r, g, b].map{ |x| x.clamp(0, 255) }
end
