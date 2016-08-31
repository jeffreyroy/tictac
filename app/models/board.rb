# Class tic-tac-toe board

class Board
  attr_accessor :board_array, :move_count, :result

  # Array to translate to magic square
  BOARD_TRANS = [0, 6, 1, 8, 7, 5, 3, 2, 9, 4]
  BOARD_REV_TRANS = [0, 2, 7, 6, 9, 5, 1, 4, 3, 8]
  MARKERS = ["   ", " O ", " X "]


  # Create new empty tic-tac-toe board
  def initialize
    # Array to store board position
    # 0 = blank, 1 = computer, 2 = player
    @board_array = [-1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @move_count = 0
    @result = 0
  end

  # Get marker on square on the board (1-9)
  def marker(num)
    square_code = @board_array[self.class::BOARD_TRANS[num]]
    self.class::MARKERS[square_code]
  end

  def print_line(line)
    start = line * 3 - 2
    markers = [0, 1, 2].map { |i| marker(start + i) }
    puts markers.join("|")
  end

  # Print the entire board
  def print_board
    print_line(1)
    puts "---+---+---"
    print_line(2)
    puts "---+---+---"
    print_line(3)
    puts
  end

  def make_move(square, player_number)
    array_square = self.class::BOARD_TRANS[square]
    @board_array[array_square] = player_number
    @move_count += 1
  end


  def report_move(square)
    return self.class::BOARD_REV_TRANS[square]
  end

  def inbounds?(square)
    (1..9).include?(square)
  end

  def occupied?(square)
    board_array[self.class::BOARD_TRANS[square]] > 0
  end

  # Check to see whether a row contains specific values
  # Row indicated by two squares, a and b
  # Values to check for are in va, vb, vc
  # 0 = blank, 1 = computer, 2 = player
  def check_row(a, b, va, vb, vc)
    c = 15 - a - b
    # Squares are out of bounds (should not ever happen)
    if a < 1 || a > 9  || b < 1 || b > 9
      puts "Out of bounds error while checking row #{a} #{b}!"
      return false
    # Third space is not legal
    elsif c < 1 || c > 9 || c == a || c == b || a == b
      return false
    # Check whether third space has the value we're looking
    elsif @board_array[a] == va && @board_array[b] == vb && @board_array[c] == vc
      return true
    else
      return false
    end
  end


end
