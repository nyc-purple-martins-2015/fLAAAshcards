
get '/rounds/new/:deck_id' do
  @round = Round.create(user_id: session[:user_id], deck_id: params[:deck_id])
  erb :'rounds/new'
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
  redirect to("/rounds/#{@round.id}")
end


