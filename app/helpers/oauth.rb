helpers do
  def oauth_client
    uid = 'b99d1e8b95eb08e985715a66d7e2b9a6daedb0fbb604f3af867bbae0bd861a51'
    secret = '525b5b47b0bece41d8e5b42d842a9106cbb19e889a8532b8d370beb6c1c2aaba'
    OAuth2::Client.new(uid, secret, :site => 'http://localhost:5000/oauth/authorize')
  end

  def dbc_auth
    oauth_client.auth_code.authorize_url(redirect_uri: 'http://localhost:9393/auth')
  end

  def get_oauth_token(code)
    oauth_client.auth_code.get_token(code, redirect_uri: 'http://localhost:9393/auth')
  end

  def get_user(token)
    token.get('/me')
  end

  def token_as_hash(token)
  { token: token.token,
    refresh_token: token.refresh_token,
    expires_at: token.expires_at }
  end
end