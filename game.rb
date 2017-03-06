require_relative 'models'

def get_user_action
	puts "Main Menu:"
	puts "(S)tart new game"
	puts "(V)iew balance"
	puts "(E)xit"
	gets.chomp
end

player = Player.new
dealer = Player.new

action = get_user_action
while action != "E"	
	if action == "S"
		deck = Deck.new
		deck.shuffle

		game = Round.new(player, deck, dealer)
		game.play
	elsif action == "V"
		puts "$#{player.balance}"
	end
	action = get_user_action
end
