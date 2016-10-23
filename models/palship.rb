require_relative('../db/sql_runner')

class Palship

attr_reader :id, :client_id, :pal_id

def initialize(options)
  @id = options['id'].to_i
  @client_id = options['client_id'].to_i
  @pal_id = options['pal_id'].to_i
end





end
