class Rental
  attr_accessor :date, :book

  def initialize(date)
    @date = date
    @book = book
    @rentals = []
    belongs_to
  end

  def belongs_to
    @rentals.push(self)
    book.rentals.push(self) unless book.rentals.include?(self)
  end
end
