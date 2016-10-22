require_relative('../db/sql_runner')

class Pal

attr_reader :id, :name, :type

def initialize(options)
  @id = options['id']
  @name = options['name']
  @type = options['type']
end



end
