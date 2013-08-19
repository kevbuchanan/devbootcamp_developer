# Dev Bootcamp Dev Tools
This app provides API tokens to current Socrates users, and documentation about the [API](https://github.com/socrates-api/api).
## Basic Usage
The following environment variable need to be configured when using this app:
```ruby
ENV['OAUTH_CLIENT_ID'] = # dbc client id
ENV['OAUTH_CLIENT_SECRET'] = # dbc client secret
ENV['DBC_TOKEN'] = 'DBC-TOKEN' + # the dbc shared token for api key requests
```
This app uses omniauth and the [Devbootcamp omniauth strategy](https://github.com/socrates-api/omniauth-dbc).
To test this app locally, you'll need to change your local omniauth-dbc gem to use your local dbc auth server.

