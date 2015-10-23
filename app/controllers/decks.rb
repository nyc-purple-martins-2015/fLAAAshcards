get '/decks' do
  @decks = Deck.all
  erb :'/decks/index'
end

get '/decks/:name' do
  @deck.cards.all.each |card|
  if card.correct
  @deck = Deck.find_by name: params[:name]
    if @deck.cards.all.empty?
    # redirect to('/endgame')
    else
    @next_card = @deck.next_card(@temp_array)
  erb :'/decks/show'
    end
  end
end


put '/decks/:name' do
  if correct
  @temp_array.delete!(correct_answer)
  redirect to("/decks/#{@deck.cards}")
  elsif incorrect
    redirect to("/decks/#{@deck.cards}")
  end
end
