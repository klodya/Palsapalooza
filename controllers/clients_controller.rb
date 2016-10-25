require 'pry-byebug'
require_relative('../models/client')

#index
get '/clients' do
  @clients = Client.all
  erb(:'clients/index')
end

#new
get '/clients/new' do
  erb(:'clients/new')
end

#create
post '/clients' do
  @client = Client.new(params)
  @client.save
  erb(:'clients/create')
end

#show
get '/clients/:id' do
  @client = Client.find(params['id'])
  erb(:'clients/show')
end

#edit
get '/clients/:id/edit' do
  @client = Client.find(params['id'])
  erb(:'clients/edit' ) 
end

#update
put '/clients/:id' do
  @client = Client.update(params)
  redirect to("/clients/#{params['id']}")
end

#delete
delete '/clients/:id' do
  Client.destroy(params['id'])
  redirect to('/clients')
end

