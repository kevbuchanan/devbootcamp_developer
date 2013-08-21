get '/' do
  erb :index
end

before '/account' do
  redirect to('/') unless authenticated?
end

get '/account' do
  erb :user
end

