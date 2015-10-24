get '/rounds/:id/:deck_name' do
  @deck = Deck.find_by(name: params[:deck_name])
  if @go = true
  round = Round.find(id: params[:id])
  correct_guesses = round.guesses.where(correct: 1)
  correct_cards = correct_guesses.map { |guess| guess.card }
  current_deck = round.cards - correct_cards
end
end

get 'rounds/new' do
end

post '/rounds/new' do
  Round.create(session, deck)
  redirect to('/rounds/id/deck_name')
end

put '/decks/:name' do

end
