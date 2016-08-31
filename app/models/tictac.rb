require_relative 'board'
require_relative 'game'
require_relative 'player'


# Intro
file = File.open("intro.txt", "r")
contents = file.read
puts contents

go_first = ""
while go_first != "y" and go_first != "n"
	print "Do you want to go first (y/n)? "
	go_first = gets.chomp
end

board = Board.new
ai = Ai.new(board)
player = Player.new(board)


# If computer moves first, choose a decent starting move.

if go_first == "n"
	puts "Okay, I'll start."
	a = ai.computer_first_move
	ai.make_computer_move(a)
end

# Main play loop

while board.move_count < 9 && board.result == 0
	player.make_player_move(player.get_player_move)

	if ai.player_won
		board.result = 2
		ai.player_won_message

	elsif board.move_count < 9

		ai.make_computer_move(ai.computer_move)

	end
end

puts
board.print_board
puts

case board.result
when 2
	puts "Congratulations, you won!"
when 1
	puts "I win!"
else
	puts "Cat's game!"
end

puts
puts "Thanks for playing!"

