# Sudoku Solver
# https://www.codewars.com/kata/5296bc77afba8baa690002d7/train/ruby

# Write a function that will solve a 9x9 Sudoku puzzle. The function will take one argument consisting of the 2D puzzle array, with the value 0 representing an unknown square.
# The Sudokus tested against your function will be "easy" (i.e. determinable; there will be no need to assume and test possibilities on unknowns) and can be solved with a brute-force approach.
# For Sudoku rules, see the Wikipedia article.

# puzzle = [[5,3,0,0,7,0,0,0,0],
#           [6,0,0,1,9,5,0,0,0],
#           [0,9,8,0,0,0,0,6,0],
#           [8,0,0,0,6,0,0,0,3],
#           [4,0,0,8,0,3,0,0,1],
#           [7,0,0,0,2,0,0,0,6],
#           [0,6,0,0,0,0,2,8,0],
#           [0,0,0,4,1,9,0,0,5],
#           [0,0,0,0,8,0,0,7,9]]

# sudoku(puzzle)

# # Should return
#  [[5,3,4,6,7,8,9,1,2],
#   [6,7,2,1,9,5,3,4,8],
#   [1,9,8,3,4,2,5,6,7],
#   [8,5,9,7,6,1,4,2,3],
#   [4,2,6,8,5,3,7,9,1],
#   [7,1,3,9,2,4,8,5,6],
#   [9,6,1,5,3,7,2,8,4],
#   [2,8,7,4,1,9,6,3,5],
#   [3,4,5,2,8,6,1,7,9]]

def sudoku2(puzzle)
  solution = puzzle
  (0..8).each do |i|
    (0..8).each do |j|
      if solution[i][j].zero?
        row = solution[i]
        column = (0..8).map { |num| solution[num][j] }
        box = (0..8)
              .select { |num| num / 3 == i / 3 }
              .map { |num| solution[num].select.with_index { |_, index| index / 3 == j / 3 } }
              .flatten
        temp = 1
        temp += 1 until [row, column, box].none? { |arr| arr.include?(temp) }
        temp <= 9 ? solution[i][j] = temp : nil
      end
    end
  end
  solution
end

def sudoku(puzzle)
  # Generate queue
  queue = puzzle.flatten.select(&:zero?)

  # Create sudoku based on current queue
  temp = queue
  solution = []
  puzzle
    .flatten
    .map { |x| x.zero? ? temp.shift : x }
    .each_slice(9)
    .each { |a| solution << a }
  p puzzle == solution
end

puzzle = [[5,3,0,0,7,0,0,0,0],
          [6,0,0,1,9,5,0,0,0],
          [0,9,8,0,0,0,0,6,0],
          [8,0,0,0,6,0,0,0,3],
          [4,0,0,8,0,3,0,0,1],
          [7,0,0,0,2,0,0,0,6],
          [0,6,0,0,0,0,2,8,0],
          [0,0,0,4,1,9,0,0,5],
          [0,0,0,0,8,0,0,7,9]]

sudoku(puzzle)
