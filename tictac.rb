require_relative 'board'


# Intro
puts "Welcome to Tic-Tac-Toe!"
puts
puts "This game is played on a board with nine squares:"
puts
puts " 1 | 2 | 3 "
puts "---+---+---"
puts " 4 | 5 | 6 "
puts "---+---+---"
puts " 7 | 8 | 9 "
puts
puts "You will be playing as X and I will be playing as O.  Try to get three of your symbol in a row."
puts

go_first = ""
while go_first != "y" and go_first != "n"
	print "Do you want to go first (y/n)? "
	go_first = gets.chomp
end

board = Board.new


# If computer moves first, choose a decent starting move.

if go_first == "n"
	puts "Okay, I'll start."
	a = board.computer_first_move
	board.make_computer_move(a)
end

# Main play loop

result = 0
while board.move_count < 9 && result == 0
	board.make_player_move(board.get_player_move)

	if board.player_won
		result = 2
		if rand(2) == 1
			puts "Darn you!  That's three in a row."
		else
			puts "Nice job, I didn't see that coming."
		end
	elsif board.move_count < 9
		computer_move = 0
		if board.check_win > 0
			computer_move = board.check_win
			if rand(2) == 1
				puts "Hah!  You fell into my trap!"
			else
				puts "That was a big mistake!"
			end
			result = 1
		elsif board.check_block > 0
			computer_move = board.check_block
			if rand(2) == 1
				puts "Nice try, but I see what you're doing!"
			else
				puts "You're not going to win that easily!"
			end
		else
			if rand(2) == 1
				puts "Okay, let's try this."
			else
				puts "Hmm... let me think."
			end
			computer_move = board.computer_random_move
		end
		board.make_computer_move(computer_move)

	end
end

puts
board.print_board
puts

case result
when 2
	puts "Congratulations, you won!"
when 1
	puts "I win!"
else
	puts "Cat's game!"
end

puts
puts "Thanks for playing!"

