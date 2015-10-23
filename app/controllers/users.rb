get '/' do
  erb :'users/register'
end
get '/register' do

  erb :'/users/register'
end

post '/register' do
  @user = User.new(params[:user])
  if @user.save
    redirect to("/users/#{@user.id}")
  else
    @errors= @user.errors.full_messages
    erb :'/users/register'
  end
end

get '/login' do
end

post '/login' do
  redirect to ('/')
end

get '/logout' do
end


get '/users/:id' do |id|
  @user = User.find(id)
  "Hello there #{@user.username}, you registered"
end
