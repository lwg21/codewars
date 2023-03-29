# Can you get the loop ?
# https://www.codewars.com/kata/52a89c2ea8ddc5547a000863/train/ruby

# You are given a node that is the beginning of a linked list.
# This list contains a dangling piece and a loop.
# Your objective is to determine the length of the loop.

# Use the 'next' method to get the following node: node.next
# Do NOT mutate the nodes!
# In some cases there may be only a loop, with no dangling piece

def loop_size(node)
  map = []
  map << node
  step = node
  until map.include?(step.next)
    map << step.next
    step = step.next
  end
  map.length - map.index(step.next)
end
