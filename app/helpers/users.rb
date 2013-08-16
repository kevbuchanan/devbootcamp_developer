helpers do
  def authenticated?
    !session[:oauth_token].nil?
  end

  def current_user
    @current_user
  end

  def current_user=(user)
    @current_user = user
  end
end