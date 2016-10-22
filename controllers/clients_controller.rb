require 'pry-byebug'
require_relative('../models/client')

#index
get '/clients' do
  @clients = Client.all
  erb(:'clients/index')
end

