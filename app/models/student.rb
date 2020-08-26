class Student
    attr_accessor :first_name
    @@all=[]
    def initialize(first_name)
        @first_name=first_name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    def all_instructors 
        BoatingTest.all.select{|test| test.student==self}.map(&:instructor).uniq
    end

    def self.find_student(first_name)
        @@all.find{|stu| stu.first_name==first_name}
    end

    def grade_percentage 
        total=BoatingTest.all.select{|test| test.student==self}
        total.length/ total.select{|test| test.test_status=="passed"}.to_f.round(2)
    end

end