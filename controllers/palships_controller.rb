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
  @palship.save
  erb(:'palships/create')
end
