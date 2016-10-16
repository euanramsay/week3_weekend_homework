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
    sql = "SELECT cutomers.* FROM cutomers INNER JOIN tickets ON tickets.cutomer_id = cutomers.id WHERE tickets.film_id = #{@id};"
    customers = SqlRunner.run(sql)
    result = customers.map { |customer| Customer.new(customer) }
    return result
  end

end