# Blackjack

## Object of Game
* Each participant attempts to beat the dealer by getting a count as close to 21 as possible, without going over 21.

## Scoring
* Ace is worth 1 or 11, individual player decides. Face cards are 10 and any other card is its own value.

## Betting
* Before the cards are dealt, each player places a bet.
* Minimum bet is $2 and maximum bet is $500  

## Rules
* After cards are dealt, player must decide whether to "stand" (not ask for another card) or "hit" (ask for another card to get closer to a count of 21).
* Player may stand on the two cards originally dealt, or ask the dealer for additional cards, one at a time, until he/she decides to stand on the total (if it's 21 or under) of goes bust (if it is over 21).
	* If a player goes bust, the dealer collects the bet wagered

## Dealers Play
* When the dealer has served every player, his face-down card is turned up. 
* If the total is 17 or more, he must stand. If the total is 16 or under, he must take a card. 
* He must continue to take cards until the total is 17 or more, at which point the dealer must stand. 
* If the dealer has an ace, and counting it as 11 would bring his total to 17 or more (but not over 21), he must count the ace as 11 and stand. 
	* The dealer's decisions, then, are automatic on all plays, whereas the player always has the option of taking one or more cards. 

### Models
* Player
* Round (account, pot of money wagered)
* Deck

### Control Loop 
1. Main menu -- how much money in account, reset game history, see game history, play game (resume/quit current game or start new game), see rules
2. Retrieve money from accounts (account for both new players and players with an account already)
3. Shuffle deck

	-Game Loop Beginning-
4. Ask for a wager amount
5. Subtract wager amount from player and computer accounts
6. Put wager amounts in the pot
7. Deal 2 cards to the player
8. Show faceup computer card
9. Prompt player to enter 'stand' or 'hit' in a loop until stand is entered or player busts

	* If hit: give player new card

	* If stand: computer shows second card
		* While dealer's cards are less than 17, the computer gets new card and shows it 
		* Player and computer compare hands 
			* hand with higher number wins
			* if tie then dealer wins
	-Game Loop End-

10. Show winner
11. Update winner account
13. Ask if they want to play again
	* If yes, go to step 4
	* If no, exit and send to main menu


