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
    @events = Event.all
   erb(:'palships/show')
  end

#create
post '/palships' do
  @palship = Palship.new(params)
  # @palship.create_palship()
  if Palship.already_pals?(@palship)
    @message = "You are already pals!"
  elsif !@palship.can_afford_pal?
    @message = "You don't have enough pal points!"
  else
    @palship.take_points
    @palship.save
    @message = "You have become pals!"
  end
  erb(:'palships/create')
end

get '/palships/:id/paldates' do
  palship = Palship.find(params['id'])
  @paldates = palship.paldates
  erb(:'paldates/all')
end
