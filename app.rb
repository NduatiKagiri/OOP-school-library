require_relative './book'
require_relative './person'
require_relative './student'
require_relative './teacher'

class App
  attr_accessor :people_list, :books_list, :rentals_list

  def initialize
    @books_list = []
    @people_list = []
    @rentals_list = []
  end

  def create_book
    print '   Enter Book Title: '
    title = gets.chomp
    print '   Enter Book author: '
    author = gets.chomp

    new_book = Book.new(title.capitalize, author.capitalize)

    @books_list.push(new_book)
  end

  def list_books
    @books_list.each do |book|
      puts "Book: #{book.title}            Author: #{book.author}"
    end
  end

  def create_person
    print '   Enter [1] for Student, or [2] for a teacher: '
    option = gets.chomp.to_i
    case option
    when 1
      print '   Enter a name: '
      name = gets.chomp
      print '   Enter a age: '
      age = gets.chomp.to_i
      print '   Has parent persmision [Y/N]: '
      permission = gets.chomp.downcase
      parent_permission = (permission == 'y') ? true : false
      person = Student.new(age, nil, name: name.capitalize, parent_permission: parent_permission)
      @people_list.push(person)
    when 2
      print '   Enter a name: '
      name = gets.chomp.capitalize
      print '   Enter a age: '
      age = gets.chomp.to_i
      print '   Enter specialization: '
      specialization = gets.chomp.capitalize
      teacher = Teacher.new(age, specialization, name: name)
      @people_list.push(teacher)
    else
      print '   Invalid input!'
    end
  end

  def list_people
    @people_list.each do |person|
      puts "Name: #{person.name}            age: #{person.age}"
    end
  end
end

testing = App.new
testing.create_person
testing.list_people
