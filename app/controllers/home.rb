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

get '/contact' do
  erb :contact
end

post '/contact' do
  puts params[:name]
  puts params[:email]
  puts params[:subject]
  puts params[:body]

  Pony.mail({
    from: params[:name] + " at " + params[:email],
    to: "bug@devbootcamp.com",
    subject: params[:subject],
    body: params[:body]
  })

  redirect to('/documentation')
end
