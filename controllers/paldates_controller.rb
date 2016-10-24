require 'pry-byebug'
require_relative('../models/paldate.rb')
require_relative('../models/palship.rb')
require_relative('../models/event.rb')

#index
get '/paldates' do
  @paldates = PalDate.all()
  erb(:'paldates/index')
end

#new
get '/paldates/new' do
  @palships = Palship.all()
  @events = Event.all()
erb(:'paldates/new')
end

#show
  get '/paldates/:id' do
    @paldate = PalDate.find(params['id'])
    erb(:'paldates/show')
  end

#create
post '/paldates' do
  @paldate = PalDate.new(params)
  @paldate.save
  erb(:'paldates/create')
end
