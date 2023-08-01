# teacher.rb
require_relative 'person'

class Teacher < Person
  def initialize(specialization, parent_permission: true, name: 'Unknown', age: 0)
    super(parent_permission: parent_permission, name: name, age: age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  # Add a getter for specialization
  attr_reader :specialization
end
