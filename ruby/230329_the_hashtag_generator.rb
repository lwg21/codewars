# The Hashtag Generator
# https://www.codewars.com/kata/52449b062fb80683ec000024/train/ruby

# The marketing team is spending way too much time typing in hashtags.Let's help them with our own Hashtag Generator!
# It must start with a hashtag (#).
# All words must have their first letter capitalized.
# If the final result is longer than 140 chars it must return false.
# If the input or the result is an empty string it must return false.

# Examples
# " Hello there thanks for trying my Kata"  =>  "#HelloThereThanksForTryingMyKata"
# "    Hello     World   "                  =>  "#HelloWorld"
# ""                                        =>  false

def generateHashtag(str)
  hashtag = str.scan(/\w+/).map(&:capitalize).join
  hashtag.empty? || hashtag.size >= 140 ? false : "##{hashtag}"
end
