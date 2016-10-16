require_relative("../db/sql_runner")

class Customer

  attr_reader( :id )
  attr_accessor( :name, :funds )

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
    sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE tickets.customer_id = #{@id};"
    films = SqlRunner.run(sql)
    result = films.map { |film| Film.new(film) }
    return result
  end

  # def update()
  #   sql = "UPDATE customers SET name = '#{@name}', 
  #   funds = #{@funds}"
  #   update_customer = SqlRunner.run( sql ).first
  #   result = Customer.new(update_customer)
  #   return result
  # end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run( sql )
    result = customers.map { |customer| Customer.new( customer ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

end