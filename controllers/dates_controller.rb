require 'pry-byebug'
require_relative('../models/palship.rb')
require_relative('../models/events.rb')

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

#create
post '/dates' do
  @dates = Date.new(params)
  @date.save
  erb(:'dates/create')
end
