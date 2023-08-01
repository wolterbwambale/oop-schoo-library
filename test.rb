# test.rb
require_relative 'person'
require_relative 'student'
require_relative 'teacher'

# Test Person class
person1 = Person.new(1, 20, "Jennipher")
puts "Person 1:"
puts "ID: #{person1.id}"
puts "Name: #{person1.name}"
puts "Age: #{person1.age}"
puts "Can use services? #{person1.can_use_services?}"

person2 = Person.new(2, 16, "Alice", false)
puts "\nPerson 2:"
puts "ID: #{person2.id}"
puts "Name: #{person2.name}"
puts "Age: #{person2.age}"
puts "Can use services? #{person2.can_use_services?}"

# Test Student class
student1 = Student.new(3, 16, "Class A", "Kambale")
puts "\nStudent 1:"
puts "ID: #{student1.id}"
puts "Name: #{student1.name}"
puts "Age: #{student1.age}"
puts "Classroom: #{student1.classroom}"
puts "Can use services? #{student1.can_use_services?}"
puts "Playing hooky: #{student1.play_hooky}"

# Test Teacher class
teacher1 = Teacher.new(4, 30,  "Ms. Joan", "Mathematics")
puts "\nTeacher 1:"
puts "ID: #{teacher1.id}"
puts "Name: #{teacher1.name}"
puts "Age: #{teacher1.age}"
puts "Specialization: #{teacher1.specialization}"
puts "Can use services? #{teacher1.can_use_services?}"
