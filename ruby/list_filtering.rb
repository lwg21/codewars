# https://www.codewars.com/kata/53dbd5315a3c69eed20002dd/train/ruby

# In this kata you will create a function that takes a list of non-negative integers and strings
# and returns a new list with the strings filtered out.

# Example
# filter_list([1,2,'a','b']) == [1,2]
# filter_list([1,'a','b',0,15]) == [1,0,15]
# filter_list([1,2,'aasf','1','123',123]) == [1,2,123]

def filter_list(l)
  l.select { |i| i.class == Integer }
end

# Alternatives

def filter_list2(l)
  l.select{ |i| i.is_a?(Integer) }
end

def filter_list3(l)
  l.grep(Numeric)
end
