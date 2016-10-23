require_relative('../db/sql_runner')

class Date

attr_reader :id, :palship_id, :event_id

  def initialize(options)
    @id = options['id'].to_i
    @palship_id = options['palship_id'].to_i
    @event_id = options['event_id'].to_i  
  end

  def save()
    sql = "INSERT INTO dates (palship_id, event_id) VALUES (#{@palship_id}, #{@event_id}) RETURNING *"
    date = SqlRunner.run(sql).first
    @id = date['id']
  end

  def self.all()
    sql = "SELECT * FROM dates"
    return Date.map_items(sql)    
  end

  def self.map_items(sql)
    dates = SqlRunner.run(sql)
    result = dates.map { |date| Date.new( date ) }
    return result
  end

  def self.map_item(sql)
    result = Date.map_items(sql)
    return result.first
  end

end
