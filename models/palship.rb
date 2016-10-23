require_relative('../db/sql_runner')

class Palship

attr_reader :id, :client_id, :pal_id

  def initialize(options)
    @id = options['id'].to_i
    @client_id = options['client_id'].to_i
    @pal_id = options['pal_id'].to_i
  end

  def save()
    sql = "INSERT INTO palships (client_id, pal_id) VALUES (#{@client_id}, #{@pal_id}) RETURNING *"
    palship = SqlRunner.run(sql).first
    @id = palship['id']
  end

  def client()
    sql = "SELECT * FROM clients WHERE id = #{@client_id}"
    return Client.map_item(sql)
  end

  def pal()
    sql = "SELECT * FROM pals WHERE id = #{@pal_id}"
    return Pal.map_item(sql)
    return result
  end

  def self.all()
    sql = "SELECT * FROM palships"
    return Palship.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM palships WHERE id = #{id}"
    return Palship.map_items(sql)
  end

  def self.map_items(sql)
    palships = SqlRunner.run(sql)
    result = palships.map { |palship| Palship.new( palship ) }
    return result
  end

  def self.map_item(sql)
    result = Palship.map_items(sql)
    return result.first
  end

end
