require_relative 'nameable'
require_relative 'book'
require_relative 'rentals'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'



class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :parent_permission

  def initialize(age, parent_permission: true, name: 'Unknown')
    super()
    @id = rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end
