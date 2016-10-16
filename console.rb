require_relative( 'models/film' )
require_relative( 'models/customer' )
require_relative( 'models/tickets' )
require( 'pry-byebug' )

# Ticket.delete_all()
# Customer.delete_all()
# Film.delete_all()

customer1 = Customer.new({ 'name' => 'Arnold', 'funds' => 300 })
customer1.save()
customer2 = Customer.new({ 'name' => 'Sylvester', 'funds' => 200 })
customer2.save()
customer3 = Customer.new({ 'name' => 'Bruce', 'funds' => 100 })
customer3.save()

film1 = Film.new({ 'title' => 'Commando', 'price' => 10 })
film1.save()
film2 = Film.new({ 'title' => 'Die Hard', 'price' => 10 })
film2.save()
film3 = Film.new({ 'title' => 'Rambo', 'price' => 10 })
film3.save()
film4 = Film.new({ 'title' => 'The Terminator', 'price' => 10 })
film4.save()
film5 = Film.new({ 'title' => 'Robocop', 'price' => 10 })
film5.save()


ticket1 = Ticket.new({ 'customer_id' => customer1.id , 'film_id' => film1.id })
ticket1.save
ticket2 = Ticket.new({ 'customer_id' => customer2.id , 'film_id' => film3.id })
ticket2.save
ticket3 = Ticket.new({ 'customer_id' => customer3.id , 'film_id' => film2.id })
ticket3.save
ticket4 = Ticket.new({ 'customer_id' => customer1.id , 'film_id' => film4.id })
ticket4.save
ticket5 = Ticket.new({ 'customer_id' => customer1.id , 'film_id' => film5.id })
ticket5.save
ticket6 = Ticket.new({ 'customer_id' => customer2.id , 'film_id' => film5.id })
ticket6.save
ticket7 = Ticket.new({ 'customer_id' => customer3.id , 'film_id' => film5.id })
ticket7.save


binding.pry
nil