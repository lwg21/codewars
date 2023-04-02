# Simplifying multilinear polynomials
# https://www.codewars.com/kata/55f89832ac9a66518f000118/train/ruby

# When we attended middle school were asked to simplify mathematical expressions like "3x-yx+2xy-x" (or usually bigger),
# and that was easy-peasy ("2x+xy"). But tell that to your pc and we'll see!

# Write a function: simplify, that takes a string in input, representing a multilinear non-constant polynomial
# in integers coefficients (like "3x-zx+2xy-x"), and returns another string as output where the same expression has been
# simplified in the following way ( -> means application of simplify):

# - All possible sums and subtraction of equivalent monomials ("xy==yx") has been done, e.g.: "cb+cba" -> "bc+abc", "2xy-yx" -> "xy", "-a+5ab+3a-c-2a" -> "-c+5ab"
# - All monomials appears in order of increasing number of variables, e.g.: "-abc+3a+2ac" -> "3a+2ac-abc", "xyz-xz" -> "-xz+xyz"
# - If two monomials have the same number of variables, they appears in lexicographic order, e.g.: "a+ca-ab" -> "a-ab+ac", "xzy+zby" ->"byz+xyz"
# - There is no leading + sign if the first coefficient is positive, e.g.: "-y+x" -> "x-y", but no restrictions for -:  "y-x" ->"-x+y"

# N.B. to keep it simplest, the string in input is restricted to represent only multilinear non-constant polynomials, so you won't find something like `-3+yx^2'. Multilinear means in this context: of degree 1 on each variable.
# Warning: the string in input can contain arbitrary variables represented by lowercase characters in the english alphabet.

def simplify(poly)
  # Scan polynome for monomes as [sign, factor, variable]
  # Clean up data
  # Sort by size of variable, then lexicographic
  # Chunk monomes by variable
  # Sum factors and concatenate to a string
  # Remove leading + if present
  solution = ''
  poly
    .scan(/([+-])?(\d+)?(\w+)/)
    .map { |m| [m[0] || '+', m[1] || '1', m[2].chars.sort.join] }
    .sort_by { |m| [m[2].size, m[2]] }
    .chunk { |m| m[2] }
    .each do |c|
      factor = c[1].map { |e| (e[0] + e[1]).to_i }.sum
      next if factor.zero?
      factor = "+#{factor}" if factor.positive?
      factor = '+' if factor == '+1'
      factor = '-' if factor == -1
      arr += "#{factor}#{c[0]}"
    end
  solution[0] == '+' ? solution[1..-1] : solution
end
