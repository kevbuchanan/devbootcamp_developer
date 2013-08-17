enable :sessions

get '/sign_in' do
  redirect to dbc_auth
end

get '/auth' do
  token = get_oauth_token(params[:code])
  user_data = get_user(token)
  user_attributes = JSON.parse(user_data.body)
  session[:user_attributes] = user_attributes
  session[:oauth_token] = token_as_hash(token)
  redirect to ('/')
end

get '/sign_out' do
  session.clear
  redirect to ('/')
end