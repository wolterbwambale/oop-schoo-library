# person.rb
require_relative 'nameable'

class Person < Nameable
  attr_accessor :age, :name, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(name)
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
end
