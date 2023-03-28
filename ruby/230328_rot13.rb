# Rot13
# https://www.codewars.com/kata/530e15517bc88ac656000716/train/ruby

# ROT13 is a simple letter substitution cipher that replaces a letter with the letter 13 letters after it in the alphabet.
# ROT13 is an example of the Caesar cipher.

# Create a function that takes a string and returns the string ciphered with Rot13.
# If there are numbers or special characters included in the string, they should be returned as they are.
# Only letters from the latin/english alphabet should be shifted, like in the original Rot13 "implementation".

def rot13(string)
  alphabet = ('a'..'z').to_a
  letters = string.chars.map do |l|
    if alphabet.include?(l.downcase)
      new_l = alphabet.rotate(13)[alphabet.index(l.downcase)]
      l.upcase == l ? new_l.upcase : new_l
    else
      l
    end
  end
  letters.join
end

# Alternatives

def rot13_alt(string)
  string.tr('A-Za-z', 'N-ZA-Mn-za-m')
end

def rot13_alt2(string)
  origin = ('a'..'z').to_a.join + ('A'..'Z').to_a.join
  cipher = ('a'..'z').to_a.rotate(13).join + ('A'..'Z').to_a.rotate(13).join
  string.tr(origin, cipher)
end
