get '/' do
  if authenticated?
    p current_user
    @key = current_user.api_key
  end
  erb :index
end

