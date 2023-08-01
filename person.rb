class Person
    attr_reader :id, :name, :age
  
    def initialize(id, age, name = "Unknown", parent_permission = true)
      @id = id
      @name = name
      @age = age
      @parent_permission = parent_permission
    end
  
    def name=(name)
      @name = name
    end
  
    def age=(age)
      @age = age
    end
  
    private
  
    def of_age?
      @age >= 18
    end
  
    public
  
    def can_use_services?
      of_age? || @parent_permission
    end
  end
  