get '/' do
  erb :index
end

get '/account' do
  redirect to('/') unless authenticated?
  erb :user
end

get '/documentation'  do
  erb :documentation
end

