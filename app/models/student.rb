class Student
  
  @@all = []
  
  def initialize(first_name)
    @first_name = first_name 
    @@all << self
  end 

end
