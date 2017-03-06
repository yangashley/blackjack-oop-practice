class Round
	def initialize(current_player, deck, dealer)
		@finished = false
		@pot = 0
		@winner = nil
		@current_player = current_player
		@dealer = dealer
		@deck = deck
		@hands = {dealer: [], player: []}
	end

	def deal_first_two_cards
		@hands[:dealer] = @deck.deal_cards(2)
		@hands[:player] = @deck.deal_cards(2)
	end

	def play
		puts "How much do you want to wager?"
		wager_amount = gets.chomp.to_i
		@pot = wager_amount * 2
		@current_player.balance -= wager_amount
		@dealer.balance -= wager_amount
		deal_first_two_cards
		show_game
		hit_or_stand
		until finished?
			show_game(true)		
			@hands[:dealer] << @deck.deal_cards(1)
		end
		if player_wins?
			puts "You win!"
			@current_player.balance += @pot
		else
			puts "The dealer won!"
			@dealer.balance += @pot
		end
	end

	def finished?
		player_bust? || dealer_score >= 17
	end

	def player_wins?
		!player_bust? && player_score > dealer_score
	end

	def player_score
		@hands[:player].inject(:+)
	end

	def dealer_score
		@hands[:dealer].inject(:+)
	end

	def show_game(show_all_dealer_cards: false)
		if show_all_dealer_cards
	  	puts "Dealer hand: #{@hands[:dealer].join(" ")}"
	  else
			puts "Dealer hand: #{@hands[:dealer].first} ?"
		end
		puts "Your hand: #{@hands[:player].join(" ")}"
	end

	def player_bust?
		player_score > 21
	end

	def hit_or_stand
		puts "Do you want to hit or stand?"
		answer = gets.chomp
		while answer == "hit" && !player_bust?
			@hands[:player] << @deck.deal_cards(1)[0]
			show_game
			puts "Do you want to hit or stand?"
			answer = gets.chomp
		end
	end
end

class Player
	attr_accessor :balance

	def initialize
		@balance = 100
	end
end

class Deck
	def shuffle
		@cards = (1..52).to_a.shuffle
	end

	def deal_cards(number_of_cards)
		number_of_cards.times.map { @cards.pop }
	end
end
