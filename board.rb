# Class tic-tac-toe board

class Board
  attr_reader :board, :move_count

  # Array to translate to magic square
  BOARD_TRANS = [0, 6, 1, 8, 7, 5, 3, 2, 9, 4]
  BOARD_REV_TRANS = [0, 2, 7, 6, 9, 5, 1, 4, 3, 8]
  MARKERS = ["   ", " O ", " X "]


  # Create new empty tic-tac-toe board
  def initialize
    # Array to store board position
    # 0 = blank, 1 = computer, 2 = player
    @board = [3, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @move_count = 0
  end

  # Print a square on the board (1-9)
  def print_square(num)
    square_code = @board[self.class::BOARD_TRANS[num]]
    print self.class::MARKERS[square_code]
  end

  # Print the entire board
  def print_board
    print_square(1)
    print "|"
    print_square(2)
    print "|"
    print_square(3)
    puts
    puts "---+---+---"
    print_square(4)
    print "|"
    print_square(5)
    print "|"
    print_square(6)
    puts
    puts "---+---+---"
    print_square(7)
    print "|"
    print_square(8)
    print "|"
    print_square(9)
    puts
    puts
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
    elsif @board[a] == va && @board[b] == vb && @board[c] == vc
      return true
    else
      return false
    end
  end
  # Check whether the player has won
  # Return true if player won
  def player_won
    pwon = false
    (1..9).each do |a|
      (1..9).each do |b|
        if check_row(a, b, 2, 2, 2)
          pwon = true
        end
      end
    end
    pwon
  end
  # Check whether the computer can win
# Returns winning move, or 0 if no win
  def check_win
    winning_move = 0
    (1..9).each do |a|
      (1..9).each do |b|
        if check_row(a, b, 1, 1, 0)
          winning_move = 15 - a - b
        end
      end
    end
    winning_move
  end
  # Check whether the player has a threat that must be blocked
  # Returns blocking move, or 0 if none
  def check_block
    winning_move = 0
    (1..9).each do |a|
      (1..9).each do |b|
        if check_row(a, b, 2, 2, 0)
          winning_move = 15 - a - b
        end
      end
    end
    winning_move
  end

  # Choose a decent first move
  # Either center or a random corner
  def computer_first_move
    return 5 if rand(2) == 1
    2 * rand(4) + 2
  end

  # Make a random move, preferring the center
  def computer_random_move
    move = 0
    if @move_count >= 9
      puts "The board is full and I can't move!"
      return nil
    elsif @board[5] == 0
      move = 5
    else
      move = rand(9) + 1
      while @board[move] > 0
        move = rand(9) + 1
      end
    end
    return move
  end

  def report_move(a)
    return self.class::BOARD_REV_TRANS[a]
  end

  def make_computer_move(a)
    puts "I move #{report_move(a)}."
    @board[a] = 1
    @move_count += 1
  end

  def make_player_move(a)
    @board[a] = 2
    @move_count += 1
  end

  def get_player_move
    puts
    print_board
    player_move = 0
    while !(1..9).include?(player_move)
      puts
      print "Enter your move (1-9): "
      player_move = gets.chomp.to_i
      if !(1..9).include?(player_move)
        puts "That's not a legal move!"
      elsif @board[self.class::BOARD_TRANS[player_move]] > 0
        puts "That space is already taken."
        player_move = 0
      end
    end
    return self.class::BOARD_TRANS[player_move]
  end

end
