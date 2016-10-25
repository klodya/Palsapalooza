require_relative('../db/sql_runner')

class Pal

attr_reader :id, :name, :type

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
  end

  def save()
    sql ="INSERT INTO pals (name, type) VALUES ('#{@name}', '#{@type}') RETURNING *"
    pal = SqlRunner.run(sql).first
    @id = pal['id'].to_i
  end

  def clients()
    sql = "SELECT clients.* FROM clients INNER JOIN palships ON palships.client_id = clients.id WHERE palships.pal_id = #{@id}"
    return Client.map_items(sql)
  end


  def self.all()
    sql = "SELECT * FROM pals"
    return Pal.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM pals WHERE id = #{id}"
    return Pal.map_item(sql)
  end

  def self.map_items(sql)
    pals = SqlRunner.run(sql)
    result = pals.map {|pal| Pal.new(pal)}
    return result
  end

  def self.map_item(sql)
    result = Pal.map_items(sql)
    return result.first
  end

  def self.update(options)
    sql = "UPDATE pals SET 
    name = '#{options['name']}',
    type = '#{options['type']}'  
    WHERE id = '#{options['id']}'"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM pals WHERE id = #{id}"
    SqlRunner.run(sql)
  end

end
