# Tribonacci Sequence
# https://www.codewars.com/kata/556deca17c58da83c00002db/train/ruby

# Well met with Fibonacci bigger brother, AKA Tribonacci.
# As the name may already reveal, it works basically like a Fibonacci, but summing the last 3 (instead of 2) numbers of the sequence to generate the next.
# So, if we are to start our Tribonacci sequence with [1, 1, 1] as a starting input (AKA signature), we have this sequence: [1, 1 ,1, 3, 5, 9, 17, 31, ...]

# You need to create a fibonacci function that given a signature array/list, returns the first n elements - signature included of the so seeded sequence.
# Signature will always contain 3 numbers; n will always be a non-negative number; if n == 0, then return an empty array (except in C return NULL) and be ready for anything else which is not clearly specified ;)
# If you enjoyed this kata more advanced and generalized version of it can be found in the Xbonacci kata
# [Personal thanks to Professor Jim Fowler on Coursera for his awesome classes that I really recommend to any math enthusiast and for showing me this mathematical curiosity too with his usual contagious passion :)]

def tribonacci(signature, n)
  (n - 3).times { signature << signature.last(3).sum }
  signature.first(n)
end
