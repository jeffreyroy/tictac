class Ai
  PLAYER_WON_MESSAGES = [
    "Darn you!  That's three in a row.",
    "Nice job, I didn't see that coming."
  ]
  BLOCK_MESSAGES = [
    "Nice try, but I see what you're doing!",
    "You're not going to win that easily!"
  ]
  MOVE_MESSAGES = [
    "Okay, let's try this.",
    "Hmm... let me think."
  ]
  def initialize(board)
    @board = board
  end

  def computer_move
    computer_move = 0
    if check_win > 0
      computer_move = check_win
      @board.result = 1
    elsif check_block > 0
      computer_move = check_block
      block_message
    else
      move_message
      computer_move = computer_random_move
    end
    computer_move
  end

  # Check whether the player has won
  # Return true if player won
  def player_won
    pwon = false
    (1..9).each do |a|
      (1..9).each do |b|
        if @board.check_row(a, b, 2, 2, 2)
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
        if @board.check_row(a, b, 1, 1, 0)
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
        if @board.check_row(a, b, 2, 2, 0)
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
    if @board.move_count >= 9
      puts "The board is full and I can't move!"
      return nil
    elsif @board.board_array[5] == 0
      move = 5
    else
      move = rand(9) + 1
      while @board.board_array[move] > 0
        move = rand(9) + 1
      end
    end
    return move
  end

  def make_computer_move(a)
    puts "I move #{@board.report_move(a)}."
    @board.board_array[a] = 1
    @board.move_count += 1
  end

  # Messages

  def player_won_message
    puts PLAYER_WON_MESSAGES[rand(2)]
  end

  def block_message
    puts BLOCK_MESSAGES[rand(2)]
  end

  def move_message
    puts MOVE_MESSAGES[rand(2)]
  end

end
