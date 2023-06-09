# Connect Four
# https://www.codewars.com/kata/56882731514ec3ec3d000009/train/ruby

# The grid is 6 row by 7 columns, those being named from A to G.
# You will receive a list of strings showing the order of the pieces which dropped in columns:

# pieces_position_list = ["A_Red",
#   "B_Yellow",
#   "A_Red",
#   "B_Yellow",
#   "A_Red",
#   "B_Yellow",
#   "G_Red",
#   "B_Yellow"]

# The list may contain up to 42 moves and shows the order the players are playing.
# The first player who connects four items of the same color is the winner.
# You should return "Yellow", "Red" or "Draw" accordingly.

def who_is_winner(pieces_position_list)
  moves = ('A'..'G').to_a
  grid = []
  7.times { grid << [] }
  winner = nil

  # Iterate over list of moves (piece positions)
  pieces_position_list.each do |move|

    # Place piece in the grid
    col_index = moves.index(move[0])
    row_index = grid[col_index].size
    grid[col_index] << move[2..-1]

    # Populate the 4 arrays to check for victory (column, row, diagonals)
    col = grid[col_index]
    row = grid.map { |a| a[row_index]}
    up_diag = []
    down_diag = []
    (-3..3).each do |i|
      if (0..7).include?(col_index + i) && grid[col_index + i]
        up_diag << grid[col_index + i][row_index + i] if (0..6).include?(row_index + i)
        down_diag << grid[col_index + i][row_index - i] if (0..6).include?(row_index - i)
      end
    end

    # Victory if 4 consecutive non-nil identical piece in any of the 4 arrays
    won = [col, row, up_diag, down_diag].any? do |a|
      a.each_cons(4).any? { |g| g.size == 4 && g.uniq.size == 1 && !g.uniq.first.nil? }
    end

    if won
      winner = grid[col_index][row_index]
      break
    end
  end
  winner || 'Draw'
end
