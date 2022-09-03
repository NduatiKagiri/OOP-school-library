require_relative './book'
require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './rental'

class App
  attr_accessor :people_list, :books_list, :rentals_list

  def initialize
    @books_list = []
    @people_list = []
    @rentals_list = []
  end

  def create_book()
    print '   Enter Book Title: '
    title = gets.chomp
    print '   Enter Book author: '
    author = gets.chomp
    new_book = Book.new(title.capitalize, author.capitalize)

    @books_list.push(new_book)
    puts '   Book Created Successifully..........'
  end

  def list_books
    @books_list.each do |book|
      puts "Book: #{book.title}, Author: #{book.author}"
    end
  end

  def create_person
    print '   Enter [1] for Student, or [2] for a teacher: '
    option = gets.chomp.to_i
    case option
    when 1
      create_student
    when 2
      create_teacher
    else
      print '   Invalid input!'
      create_person
    end
  end

  def create_student
    print '   Enter a name: '
    name = gets.chomp
    print '   Enter a age: '
    age = gets.chomp.to_i
    print '   Has parent persmision [Y/N]: '
    permission = gets.chomp.downcase
    parent_permission = permission == 'y'
    person = Student.new(age, nil, name: name.capitalize, parent_permission: parent_permission)
    @people_list.push(person)
    puts '   Student Created Successifully..............'
  end

  def create_teacher
    print '   Enter a name: '
    name = gets.chomp.capitalize
    print '   Enter a age: '
    age = gets.chomp.to_i
    print '   Enter specialization: '
    specialization = gets.chomp.capitalize
    teacher = Teacher.new(age, specialization, name: name)
    @people_list.push(teacher)
    puts '   Techer Created Successifully..............'
  end

  def list_people
    @people_list.each do |person|
      puts "Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
  end

  def create_rental
    puts '   Select a book with its number'
    @books_list.each_with_index do |book, index|
      puts "[#{index}] '#{book.title}' by #{book.author}"
    end
    book = gets.chomp.to_i

    puts '   Select a person with their number'
    @people_list.each_with_index do |person, index|
      puts "[#{index}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person = gets.chomp.to_i
    print '   Enter Rental Date: '

    date = gets.chomp

    rental = Rental.new(date, @books_list[book], @people_list[person])
    @rentals_list.push(rental)
    puts '   Rental Created Successifully............'
  end

  def list_rentals
    print '   Enter Person ID:'
    id = gets.chomp.to_i
    @rentals_list.each do |rental|
      puts "Date: #{rental.date}, '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
  end
end
