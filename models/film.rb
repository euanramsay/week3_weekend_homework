require_relative("../db/sql_runner")

class Film

  attr_reader( :id, :title, :price )

  def initialize( options )
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{@title}', #{@price} ) RETURNING *"
    film = SqlRunner.run( sql ).first
    @id = film['id'].to_i
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE tickets.film_id = #{@id};"
    customers = SqlRunner.run(sql)
    result = customers.map { |customer| Customer.new(customer) }
    return result
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run( sql )
    result = films.map { |film| Film.new( film ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

end