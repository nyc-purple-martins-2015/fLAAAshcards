# Deck Name = User.round.deck.name

# Number of cards guessed correctly on first attempt=

# Total Cards = User.round.cards.count
# Total Guesses= User.round.guesses.count



# res=Hash[a.group_by {|x| x}.map {|k,v| [k,v.count]}]
# guesses = round.guesses
# guessed_correctly_on_first_try= Hash[guesses.group_by { |guess| guess.card_id }.map {|id, occurence| [id, occurence.count]}]
