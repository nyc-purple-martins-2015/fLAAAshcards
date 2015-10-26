get '/register' do
  erb :'/users/register'
end

post '/register' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect to("/users/#{@user.id}")
  else
    @errors= @user.errors.full_messages
    erb :'/users/register'
  end
end

get '/login' do
  erb :'/users/login'
end

post '/login' do
  @user = User.find_by(username: params[:user][:username])
  if @user
    session[:user_id] = @user.id
    redirect to("/users/#{@user.id}")
  else
    @errors= "Your username and/or password was incorrect."
    erb :'users/login'
  end
end

get '/logout' do
  session.clear
  redirect to('/')
end


get '/users/:id' do |id|
  @user = User.find(id)
  erb :'/users/show'
end

get '/users/:id/new_deck' do |id|
  @user = User.find(id)
  erb :'users/new_deck'
end

post '/users/:id/new_deck' do |id|
  @user= User.find(id)
  @deck = Deck.create(params[:deck])
  redirect to("/users/#{@user.id}/decks/#{@deck.id}/new_card")
end

get '/users/:id/decks/:deck_id/new_card' do
  @user = User.find(params[:id])
  @deck = Deck.find(params[:deck_id])
  erb :'users/new_question'
end

post '/users/:id/decks/:deck_id/next_card' do
    @user = User.find(params[:id])
    @deck = Deck.find(params[:deck_id])
    print "***************************************************"
    p @deck
    @card = Card.create(params[:card])
    redirect("/users/#{@user.id}/decks/#{@deck.id}/next_card")
end

get '/users/:id/decks/:deck_id/next_card' do
    @user = User.find(params[:id])
    @deck = Deck.find(params[:deck_id])
    erb :'users/next_card'
end
















