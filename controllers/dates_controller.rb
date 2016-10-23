require 'pry-byebug'
require_relative('../models/date.rb')
require_relative('../models/palship.rb')
require_relative('../models/event.rb')

#index
get '/dates' do
  @dates = Date.all()
  erb(:'dates/index')
end

#new
get '/dates/new' do
@palships = Palship.all()
@events = Event.all()
erb(:'dates/new')
end

#show

#create
post '/dates' do
  @date = Date.new(params)
  @date.save
  erb(:'dates/create')
end
