require_relative("../db/sql_runner")

  class Ticket

    attr_reader( :id, :customer_id, :film_id )

    def initialize( options )
      @id = options['id'].to_i
      @customer_id = options['customer_id'].to_i
      @film_id = options['film_id'].to_i
    end

    def save()
      sql = "INSERT INTO tickets ( customer_id, film_id) VALUES (#{ @customer_id }, #{ @film_id }) RETURNING *"
      ticket = SqlRunner.run(sql).first
      @id = ticket['id'].to_i
    end

    def customer()
      sql = "SELECT * FROM cutomers WHERE id = #{@customer_id}"
      tickets = SqlRunner.run(sql)
      result = tickets.map { |ticket| Customer.new(ticket) }
      return result
    end

    def film()
      sql = "SELECT * FROM films WHERE id = #{@film_id}"
      tickets = SqlRunner.run(sql)
      result = tickets.map { |ticket| Film.new(ticket) }
      return result
    end

    def self.delete_all()
      sql = "DELETE FROM tickets"
      SqlRunner.run(sql)
    end

  end