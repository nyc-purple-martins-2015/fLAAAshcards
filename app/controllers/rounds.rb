
get '/rounds/new/:deck_id' do
  if logged_in?
    @round = Round.create(user_id: session[:user_id], deck_id: params[:deck_id])
    erb :'rounds/new'
  else
    @error = "Please login or register to play."
    @decks = Deck.all
    erb :index
  end
end

post '/rounds/:id' do |id|
  @round = Round.find(id)
  redirect to("/rounds/#{@round.id}")
end

get '/rounds/:id' do |id|
  @round = Round.find(id)
  @current_card = @round.next_card
  erb :'rounds/show'
end

put '/rounds/:id' do |id|
  @round = Round.find(id)
  @user_answer = params[:user][:answer]
  @card = Card.find(params[:card][:id].to_i)
  @guess = Guess.create(round_id: id, card_id: @card.id)

  if @user_answer == @card.answer
    @correct = "You got the last question right!"
    @guess.update_attributes(correct: 1)
    @current_card = @round.next_card
    if @current_card
      erb :'rounds/show'
    else
      erb :'rounds/complete'
    end
  else
    @incorrect = "That was wrong, here is the right answer: #{@card.answer}"
    @current_card = @round.next_card
    erb :'rounds/show'
  end

end


