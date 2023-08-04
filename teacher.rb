# teacher.rb
require_relative 'person'

class Teacher < Person
  def initialize(age, specialization, **defaults)
    @id = rand(1..1000)
    defaults[:name] ||= 'Unknown'
    defaults[:parent_permission] = true if defaults[:parent_permission].nil?

    super(age, **defaults)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  attr_accessor :specialization, :id
end
