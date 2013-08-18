helpers do
  def get_user(token)
    # this endpoint should be moved to api
    # eg. DbcApi.new(:api_key => API_KEY).me(:access_token => token.token)
    token.get('/me')
  end

  def token_as_hash(token)
  { token: token['token'],
    refresh_token: token['refresh_token'],
    expires_at: token['expires_at'] }
  end
end