# The builder of things
# https://www.codewars.com/kata/5571d9fc11526780a000011a/train/ruby

# For this kata you will be using some meta-programming magic to create a new Thing object.
# This object will allow you to define things in a descriptive sentence like format.
# This challenge attempts to build on itself in an increasingly complex manner.

# # Examples of what can be done with "Thing":
# jane = Thing.new('Jane')
# jane.name # => 'Jane'

# # can define boolean methods on an instance
# jane.is_a.person
# jane.is_a.woman
# jane.is_not_a.man

# jane.person? # => true
# jane.man? # => false

# # can define properties on a per instance level
# jane.is_the.parent_of.joe
# jane.parent_of # => 'joe'

# # can define number of child things
# # when more than 1, an array is created
# jane.has(2).legs
# jane.legs.size # => 2
# jane.legs.first.is_a?(Thing) # => true

# # can define single items
# jane.has(1).head

# jane.head.is_a?(Thing) # => true

# # can define number of things in a chainable and natural format
# jane.has(2).arms.each { having(1).hand.having(5).fingers }

# jane.arms.first.hand.fingers.size # => 5

# # can define properties on nested items
# jane.has(1).head.having(2).eyes.each { being_the.color.blue.and_the.shape.round }

# # can define methods
# jane.can.speak('spoke') do |phrase|
#   "#{name} says: #{phrase}"
# end

# jane.speak("hello") # => "Jane says: hello"

# # if past tense was provided then method calls are tracked
# jane.spoke # => ["Jane says: hello"]

# imported to handle any plural/singular conversions
require 'pry-byebug'
require 'active_support/core_ext/string'

class Thing
  attr_reader :name
  attr_writer :temp

  def initialize(name)
    @name = name
  end

  def is_a
    instance_variable_set(:@temp, true)
    self
  end

  def is_not_a
    instance_variable_set(:@temp, false)
    self
  end

  def is_the
    # instance_variable_set(:@rel, nil)
    # instance_variable_set(:@block, {})
    self
  end

  private

  def method_missing(method)
    if (regex = method.match(/(?<name>[\w_]+)\?/))
      instance_variable_get("@#{regex[:name]}")

    elsif (regex = method.match(/(?<name>[\w_]+)_of/))
      singleton_class.send :attr_accessor, method
      instance_variable_get("@#{method}") || instance_variable_set("@#{method}", nil)
      # TODO
    else
      instance_variable_set("@#{method}", @temp)
      remove_instance_variable(:@temp)
      p self # Debug
      instance_variable_get("@#{method}")
    end
  end
end


# # Examples of what can be done with "Thing":
p jane = Thing.new('Jane')
p jane.name # => 'Jane'

# # can define boolean methods on an instance
p jane.is_a.person
p jane.is_a.woman
p jane.is_not_a.man
p jane.person? # => true
p jane.man? # => false

# My tests
p jane.is_the
p jane.is_the.parent_of
p jane
p jane.parent_of

# # can define properties on a per instance level
# jane.is_the.parent_of.joe
# jane.parent_of # => 'joe'

# # can define number of child things
# # when more than 1, an array is created
# jane.has(2).legs
# jane.legs.size # => 2
# jane.legs.first.is_a?(Thing) # => true

# # can define single items
# jane.has(1).head

# jane.head.is_a?(Thing) # => true

# # can define number of things in a chainable and natural format
# jane.has(2).arms.each { having(1).hand.having(5).fingers }

# jane.arms.first.hand.fingers.size # => 5

# # can define properties on nested items
# jane.has(1).head.having(2).eyes.each { being_the.color.blue.and_the.shape.round }

# # can define methods
# jane.can.speak('spoke') do |phrase|
#   "#{name} says: #{phrase}"
# end

# jane.speak("hello") # => "Jane says: hello"

# # if past tense was provided then method calls are tracked
# jane.spoke # => ["Jane says: hello"]
