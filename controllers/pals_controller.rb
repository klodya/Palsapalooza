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
  @pals = @Pal.new(params)
  @pal.save
  redirect to ("pals")
end

#show
get '/pals/:id' do
  @pal = Pal.find(params['id'])
  erb(:'pals/show')
end

#edit

#update

#delete

