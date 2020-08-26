class Instructor
    attr_accessor :name
    @@all=[]
    def initialize(name)
        @name=name
        @@all << self
    end

    def self.all
        @@all
    end

    def tests
        BoatingTest.all.select{|test| test.instructor==instructor}
    end

    def passed_students 
        self.tests.select{|test| test.test_status=="passed"}.map(&:student).uniq
    end

    def pass_student(student, test_name)
        test=self.tests.select{|test| test.student==student && test.test_name==test_name}
        if test 
            test.test_status='passed'
        else
            BoatingTest.new(student, test_name, 'passed', self)
        end
    end

    def fail_student(student, test_name)
        test=self.tests.select{|test| test.student==student && test.test_name==test_name}
        if test 
            test.test_status='failed'
        else
            BoatingTest.new(student, test_name,  'failed', self)
        end
    end

    def all_students 
        self.tests.map(&:student).uniq
    end
end
