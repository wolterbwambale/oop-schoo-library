require_relative 'person'

class Student < Person
  def initialize(classroom, age, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end

  attr_reader :classroom
end
