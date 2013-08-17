get '/' do
  if authenticated?
    @key = current_user.api_key
  end
  erb :index
end

