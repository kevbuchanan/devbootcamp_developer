# Dev Bootcamp Developer
This app provides API tokens to current [Socrates](http://socrates.devbootcamp.com/login) users, and documentation about the [API](https://github.com/Devbootcamp/api).
## Basic Usage
The following environment variable need to be configured when using this app:
```ruby
ENV['OAUTH_CLIENT_ID'] = # dbc client id
ENV['OAUTH_CLIENT_SECRET'] = # dbc client secret
ENV['DBC_SHARED'] = # the dbc shared token for api key requests
```
DBC Developer uses OmniAuth and the [Devbootcamp OmniAuth strategy](https://github.com/Devbootcamp/omniauth-dbc).
To test this app locally, you'll need to have a auth.devbootcamp.com id and secret, or change your local omniauth-dbc gem to use your local DBC auth server.

