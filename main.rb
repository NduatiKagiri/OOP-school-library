require_relative './app'

class Main
  def initialize
    @app = App.new
  end

  def run
    puts 'Select a number to choose an option'
    puts '1 - List all Books'
    puts '2 - List all People'
    puts '3 - Create a Book'
    puts '4 - Create a Person'
    puts '5 - Create a Rental'
    puts '6 - List all Rentals for a given person ID'
    puts '7 - Exit'

    option = gets.chomp.to_i

    if option == 7
      puts '   Exiting............'
    else
      options(option)
    end
  end

  def options(option)
    case option
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_book
    when 4
      @app.create_person
    when 5
      @app.create_rental
    when 6
      @app.list_rentals
    else
      print '   Invalid Input'
    end
    run
  end
end

Main.new.run
