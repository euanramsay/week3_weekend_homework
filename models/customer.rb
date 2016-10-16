require_relative("../db/sql_runner")

class Customer

  attr_reader( :id, :name )
  attr_accessor( :funds )

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', #{@funds}) RETURNING *"
    customer = SqlRunner.run( sql ).first
    @id = customer['id'].to_i
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = cutomers.id WHERE tickets.cutomer_id = #{@id};"
    films = SqlRunner.run(sql)
    result = films.map { |film| Film.new(film) }
    return result
  end

end