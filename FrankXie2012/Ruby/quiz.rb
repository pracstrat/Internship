class Student
  attr_accessor :name, :scores
  def initialize(n)
    @name = n
    @scores = {} 
    $course_sum = {}
  end

  def attend(course)
    @scores[course]||= []
    $course_sum[course.name]||= []
  end

  def exam(course, score)
    @scores[course] << score
    $course_sum[course.name] << score
  end

  def avg(course)
    @scores[course].inject(:+)*1.0/@scores[course].size
  end

  def output
    line = "#{@name}\n"
    @scores.map { |course,scores| line += "    #{course.name} : #{@scores[course].inject(:+)*1.0/@scores[course].size}\n" }
    line
  end
end

class Course
  attr_accessor :name
  def initialize(n)
    @name = n
    @avg = 0
  end

  def avg
    @avg = $course_sum[@name].inject(:+)*1.0/$course_sum[@name].size
  end

  def output
    line = "#{name} average score : #{@avg}"
  end
end

describe "Student" do 
  it "count students' and course's average scores" do 
    jordan  = Student.new("jordan")
    michael = Student.new("michael")
    english = Course.new("english")
    chinese = Course.new("chinese")
    math    = Course.new("math")

    jordan.attend(math)
    jordan.attend(english)
    jordan.attend(chinese)
    michael.attend(math)
    michael.attend(chinese)
    jordan.scores.keys.size.should eq(3)

    jordan.exam(math, 90)
    jordan.exam(english, 90)
    jordan.exam(english, 94)
    jordan.exam(english, 92)
    jordan.exam(chinese, 99)
    michael.exam(math, 92)
    michael.exam(chinese,97)

    jordan.scores[math].should eq([90])
    jordan.scores[english].should eq([90, 94, 92])
    jordan.scores[math].should eq([90])
    jordan.avg(math).should eq(90)
    jordan.avg(english).should eq(92)

    math.avg.should eq(91)
    english.avg.should eq(92)
    chinese.avg.should eq(98)

    f = File.open("student.list", "w")
    f.puts jordan.output
    f.puts michael.output
    f.puts "\n\n"
    f.puts math.output
    f.puts chinese.output
    f.puts english.output
    f.close
  end
end