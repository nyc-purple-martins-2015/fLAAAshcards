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
  session[:user_id] = @user.id
  redirect to("/users/#{@user.id}")
end

get '/logout' do
  session.clear
  redirect to('/')
end


get '/users/:id' do |id|
  @user = User.find(id)
  "Hello there #{@user.username}, you registered"
end
