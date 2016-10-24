require 'pry-byebug'
require_relative('../models/palship.rb')
require_relative('../models/client.rb')
require_relative('../models/pal.rb')

#index
  get '/palships' do
    @palships = Palship.all()
    erb(:'palships/index')
  end

#new
  get '/palships/new' do
    @clients = Client.all()
    @pals = Pal.all()
    erb(:'palships/new')
  end

#show
  get '/palships/:id' do
    @palship = Palship.find(params['id'])
   erb(:'palships/show')
  end

#create
post '/palships' do
  @palship = Palship.new(params)
  if palship.exists?(params)
    return "something"
  else
  @palship.save
end
  erb(:'palships/create')
end

get '/palships/:id/paldates' do
  palship = Palship.find(params['id'])
  @paldates = palship.paldates
  erb(:'paldates/all')
end
