def logged_in?
  session[:user_id]
end

def  current_user
  if logged_in?
    @user = User.find(session[:user_id])
  else
    nil
  end
end

# def current_username
#   User.find(session[:user_id]).username
# end

# def current_user_id
#   User.find(session[:user_id]).id
# end
