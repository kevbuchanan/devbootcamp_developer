# Dev Bootcamp Dev Tools
This app provides API tokens to current Socrates users, and documentation about the [API](https://github.com/socrates-api/api).
## Basic Usage
The following environment variable need to be configured when using this app:
```ruby
ENV['OAUTH_CLIENT_ID'] = # dbc client id
ENV['OAUTH_CLIENT_SECRET'] = # dbc client secret
ENV['OAUTH_SITE'] = 'https://auth.devbootcamp.com' # or local host if running locally
ENV['REDIRECT_URI'] = # your redirect uri
ENV['DBC_TOKEN'] = 'DBC-TOKEN' + # the dbc shared token for api key requests
```

