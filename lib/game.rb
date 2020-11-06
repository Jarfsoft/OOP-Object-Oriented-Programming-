# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity

class Game
  def initialize
    @grid = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  end

  def print_grid
    " #{grid[0][0]} | #{grid[0][1]} | #{grid[0][2]}\n---+---+---\n #{grid[1][0]} | #{grid[1][1]} | #{grid[1][2]}
    \n---+---+---\n #{grid[2][0]} | #{grid[2][1]} | #{grid[2][2]}\n\n\n"
  end

  def validate_move(row, col, symbol)
    unless row.positive? && row < 4 && col.positive? && col < 4
      return "\n\n===============================\n------- Invalid entry ---------\n==============================="
    end

    row -= 1
    col -= 1
    if grid[row][col] != ' '
      "\n\n===============================\n-------- Space taken ----------\n==============================="
    else
      grid[row][col] = symbol
      ''
    end
  end

  def finish_draw
    return true unless grid[0].any?(' ') || grid[1].any?(' ') || grid[2].any?(' ')
  end

  def finish_win(symbol)
    (0..2).each do |i|
      a = 0
      b = 0
      (0..2).each do |j|
        a += 1 if grid[i][j] == symbol
        b += 1 if grid[j][i] == symbol
      end
      return true if a == 3 || b == 3
    end
    return true if grid[0][0] == symbol && grid[1][1] == symbol && grid[2][2] == symbol
    return true if grid[2][0] == symbol && grid[1][2] == symbol && grid[0][2] == symbol

    false
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
