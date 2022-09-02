require_relative './book'

class App
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
end
