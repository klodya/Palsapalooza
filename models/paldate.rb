require_relative('../db/sql_runner')

class PalDate

attr_reader :id, :palship_id, :event_id

  def initialize(options)
    @id = options['id'].to_i
    @palship_id = options['palship_id'].to_i
    @event_id = options['event_id'].to_i  
  end

  def save()
    sql = "INSERT INTO paldates (palship_id, event_id) VALUES (#{@palship_id}, #{@event_id}) RETURNING *"
    paldate = SqlRunner.run(sql).first
    @id = paldate['id']
  end

  def palship()
    sql = "SELECT * FROM palships WHERE id = #{@palship_id}"
    return Palship.map_item(sql)
  end

  def event()
    sql = "SELECT * FROM events WHERE id = #{@event_id}"
    return Event.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM paldates"
    return PalDate.map_items(sql)    
  end

  def self.find(id)
    sql = "SELECT * FROM paldates WHERE id = #{id}"
    return PalDate.map_item(sql)
  end

  def self.map_items(sql)
    paldates = SqlRunner.run(sql)
    result = paldates.map { |paldate| PalDate.new( paldate ) }
    return result
  end

  def self.map_item(sql)
    result = PalDate.map_items(sql)
    return result.first
  end

end
