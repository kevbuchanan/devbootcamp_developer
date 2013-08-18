helpers do
  def oauth_client
    OAuth2::Client.new(OAUTH_CLIENT_ID, OAUTH_CLIENT_SECRET, :site => 'http://localhost:5000/oauth/authorize')
  end

  def dbc_auth
    oauth_client.auth_code.authorize_url(redirect_uri: 'http://localhost:9393/auth')
  end

  def get_oauth_token(code)
    oauth_client.auth_code.get_token(code, redirect_uri: 'http://localhost:9393/auth')
  end

  def get_user(token)
    # this endpoint should be moved to api
    # eg. DbcApi.new(:api_key => API_KEY).me(:access_token => token.token)
    token.get('/me')
  end

  def token_as_hash(token)
  { token: token.token,
    refresh_token: token.refresh_token,
    expires_at: token.expires_at }
  end
end