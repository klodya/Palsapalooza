require_relative('../db/sql_runner')

class Client

attr_accessor :id, :name, :pal_point

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @pal_point = options['pal_point'].to_i
  end

  def save()
    sql = "INSERT INTO clients (name, pal_point) VALUES ('#{@name}', #{@pal_point}) RETURNING *"
    client = SqlRunner.run(sql).first
    @id = client['id'].to_i
  end

  def pals()
    sql = "SELECT pals.* FROM pals INNER JOIN palships ON palships.pal_id = pals.id WHERE palships.client_id = #{@id}"
    return Pal.map_items(sql)
  end

  def self.all()
    sql = "SELECT * FROM clients"
    return Client.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM clients WHERE id = #{id}"
    return Client.map_item(sql)
  end

  def self.map_items(sql)
    clients = SqlRunner.run(sql)
    result = clients.map {|client| Client.new( client )}
    return result
  end

  def self.map_item(sql)
    result = Client.map_items(sql)
    return result.first
  end

  def self.update(options)
    sql = "UPDATE clients SET 
    name = '#{options['name']}',
    pal_point = #{options['pal_point']}      
    WHERE id = '#{options['id']}'"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM clients WHERE id = #{id}"
    SqlRunner.run(sql)
  end


end
