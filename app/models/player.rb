class Player

  def initialize(board)
    @board = board
  end

  def get_player_move
    puts
    @board.print_board
    player_move = 0
    until @board.inbounds?(player_move)
      puts
      print "Enter your move (1-9): "
      player_move = gets.chomp.to_i
      if !@board.inbounds?(player_move)
        puts "That's not a legal move!"
      elsif @board.occupied?(player_move)
        puts "That space is already taken."
        player_move = 0
      end
    end
    player_move
  end

  def make_player_move(player_move)
    @board.make_move(player_move, 2)
  end

end
