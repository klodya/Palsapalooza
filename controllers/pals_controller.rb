require 'pry-byebug'
require_relative('../models/pal')

#index
get '/pals' do
  @pals = Pal.all
  erb(:'pals/index')
end

#new
get '/pals/new' do
  @pals = Pal.all()
  erb(:'pals/new')
end

#create
post '/pals' do
  @pal = Pal.new(params)
  @pal.save
  erb(:'pals/create')
end

#show
get '/pals/:id' do
  @pal = Pal.find(params['id'])
  erb(:'pals/show')
end

#edit
get '/pals/:id/edit' do
  @pal = Pal.find(params['id'])
  erb(:'pals/edit' ) 
end

#update
put '/pals/:id' do
  @pal = Pal.update(params)
  redirect to("/pals/#{params['id']}")
end

#delete
delete '/pals/:id' do
  Pal.destroy(params['id'])
  redirect to('/pals')
end
