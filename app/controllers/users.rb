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
