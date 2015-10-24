get '/rounds/:id/:deck_name' do
  @round = Round.find(params[:id])
  @next = @round.next_card
end

get 'rounds/new' do
end

post '/rounds/new' do
  @round = Round.create(session, deck)
  redirect to("/rounds/#{@round.id}/#{@round.deck.name}")
end

put '/decks/:name' do

end




def correct_guesses
  self.guesses.where(correct: 1)
end

def correct_cards
  self.correct_guesses.map { |guess| guess.card }
end

def yet_to_guess_correctly
  current_round.cards - self.correct_cards
end

def next_card
  self.yet_to_guess_correctly.sample
end
