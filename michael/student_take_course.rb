
class Student
  attr_accessor :name, :scores
  def initialize(n)
    @name = n
    @scores = {}
  end

  def attend(course)
    @scores[course]||= []
    course.student_attend(self)
  end

  def exam(course, score)
    @scores[course] << score
    course.record(self, score)
  end

  def avg(course)
    @scores[course].inject(:+)*1.0/@scores[course].size
  end
end

class Course
  attr_accessor :name, :studentScore

  def initialize(n)
    @name = n
    @studentScore={}
  end

  def student_attend(student)
    @studentScore[student] ||=[]
  end

  def record(student, score)
    @studentScore[student] <<score
  end

  def avg
    @studentScore.values.flatten.inject(:+) *1.0/ @studentScore.values.flatten.length
  end

end

describe "Class" do 
  it "kkk" do 
    #initialise
    jordan = Student.new("jordan")
    michael = Student.new("michael")
    english = Course.new("english")
    chinese = Course.new("chinese")
    math    = Course.new("math")

    #test the Student course name 
    jordan.name="jordan"
    english.name="english"

    #test the Student Course initialization score
    jordan.scores.should eq({})
    english.studentScore.should eq ({})

    #test the attend method
    jordan.attend(math)
    jordan.attend(math)
    jordan.attend(english)
    jordan.scores.keys.size.should eq(2)  


    #test the exam method
    jordan.exam(math, 90)
    jordan.exam(english, 90)
    jordan.exam(english, 95)
    jordan.scores[math].should eq([90])
    jordan.scores[english].should eq([90, 95])

    #test can't attend the same course
    jordan.attend(math)
    jordan.scores[math].should eq([90])
    jordan.avg(math).should eq(90)
    jordan.avg(english).should eq(92.5)



    #test the course 
    michael.attend(math)
    michael.exam(math,80)

    math.studentScore.keys.size.should eq(2)
    math.studentScore[jordan].should eq([90])
    english.studentScore[jordan].should eq([90,95])

    
    
    math.studentScore.values.size.should eq(2)
    #test math average 
    math.avg.should eq(85)


    michael.attend(english)
    michael.scores[english].should eq([])
    michael.exam(english,90)
    michael.scores[english].should eq([90])
    english.studentScore[michael].should eq([90])
    english.studentScore[jordan].should eq([90,95])
    english.avg.should eq((90+90+95)/3.0)

  end

  

end