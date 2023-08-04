require_relative 'student'
require_relative 'rentals'
require_relative 'book'
require_relative 'teacher'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    return puts 'No books found in library' if @books.empty?

    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_all_people
    return puts 'No people found.' if @people.empty?

    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, Id: #{person.id}, Age: #{person.age}" }
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    input = gets.chomp

    case input
    when '1'
      create_student
    when '2'
      create_teacher
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [YES/NO]: '
    permission = gets.chomp.upcase

    case permission
    when 'NO'
      student = Student.new(age, 'classroom', name: name, parent_permission: false)
      @people << student
    when 'YES'
      student = Student.new(age, 'classroom', name: name, parent_permission: true)
      @people << student
    end
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Enter name of teacher: '
    name = gets.chomp
    print 'Enter age of teacher: '
    age = gets.chomp.to_i
    print 'Enter Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name: name)
    @people << teacher
    puts 'Teacher created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Enter the Author name: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_id = gets.chomp.to_i

    puts 'Select a person from the following list by number'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] [#{person.class}] Name: #{person.name}, Id: #{person.id}, Age: #{person.age}"
    end
    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @books[book_id], @people[person_id])
    @rentals << rental
    puts 'Rental created successfully.'
  end

  def list_all_rentals
    return puts 'No rentals found in library' if @rentals.empty?

    puts 'Rentals: '
    @rentals.each do |rental|
      person_info = "[#{rental.person.class}] Name: #{rental.person.name},
      Id: #{rental.person.id}, Age: #{rental.person.age}"
      puts "Date: #{rental.date}, Book: '#{rental.book.title}'
      by #{rental.book.author}, Person: #{person_info}"
    end
  end

  def list_rentals_by_book
    return puts 'No rentals found in library' if @rentals.empty?

    puts 'Select a book from the following list by number: '
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_id = gets.chomp.to_i

    selected_book = @books[book_id]
    puts "Rentals for book '#{selected_book.title}' by #{selected_book.author}:"
    @rentals.each do |rental|
      next unless rental.book == selected_book

      person_info = "[#{rental.person.class}] Name: #{rental.person.name},
       Id: #{rental.person.id}, Age: #{rental.person.age}"
      puts "Date: #{rental.date},
      Person: #{person_info}"
    end
  end

  def list_all_teachers
    teachers = @people.select { |person| person.is_a?(Teacher) }

    return puts 'No teachers found in library' if teachers.empty?

    puts 'Listing all teachers:'
    teachers.each do |teacher|
      puts "Name: #{teacher.name}, Age: #{teacher.age}, Specialization: #{teacher.specialization}"
    end
  end
end
