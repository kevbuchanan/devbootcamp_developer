enable :sessions

use OmniAuth::Builder do
  provider :dbc, ENV['OAUTH_CLIENT_ID'], ENV['OAUTH_CLIENT_SECRET']
end

get '/sign_in' do
  redirect to ('/auth/dbc')
end

get '/auth/dbc/callback' do
  session[:user_attributes] = request.env['omniauth.auth'].info
  session[:oauth_token] = token_as_hash(request.env['omniauth.auth'].credentials)
  redirect to ('/documentation')
end

get '/sign_out' do
  session.clear
  redirect to ('/')
end
