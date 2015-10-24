get '/decks' do
  @decks = Deck.all
  erb :index
end
