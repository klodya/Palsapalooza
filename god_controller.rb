require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/clients_controller')
require_relative('controllers/pals_controller')


get '/' do
  erb:home
end
