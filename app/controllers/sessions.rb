enable :sessions

get '/sign_in' do
  redirect to oauth_client.auth_code.authorize_url(redirect_uri: 'http://localhost:9393/auth' )
end

get '/session/destroy' do
  session.clear
  redirect to('/')
end

get '/auth' do
  token = oauth_client.auth_code.get_token(params[:code], redirect_uri: 'http://localhost:9393/auth')
  user = token.get('/me')
  session[:user] = JSON.parse(user.body)
  session[:oauth_token] = token_as_hash(token)
  redirect to ('/')
end

get '/sign_out' do
  session.clear
  redirect to ('/')
end