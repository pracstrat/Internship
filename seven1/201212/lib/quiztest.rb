class Student
  attr_accessor :name, :scores
  def initialize(name)
     @name = name
     @scores = {}
  end
  def attend(course)
    @scores[course]||= []
  end
  def exam(course,score) 
    @scores[course] << score
  end 
  def avg(course)
    @scores[course].inject(:+)*1.0/@scores[course].size 
  end      
  def avg2 
  @scores.values.flatten.inject(:+) *1.0/@scores.values.flatten.length 
  end
end
describe 'class' do
 it "grader report" do

  seven =Student.new("seven")
  six   =Student.new("six")
  math  =Student.new("math")
  English =Student.new("English")

  seven.attend(math)
  seven.attend(math)
  seven.attend(English)
  seven.scores.keys.size.should eq (2)
  six.attend(math)

  #student.name("seven").should eq("seven")
  seven.exam(math, 90)
  seven.exam(math, 90)
  seven.exam(English,90)
  seven.scores[math].should eq([90, 90])
  seven.avg(math).should eq(90)
  seven.attend(English)
  seven.scores.keys.size.should eq (2)
  seven.avg(English).should eq(90)
  six.exam(math,90)
  six.exam(math,80)
  six.avg(math).should eq(85)
  six.scores.keys.size.should eq(1)
  seven.avg2.should eq(90)
  
  math.attend(seven) 
  math.attend(six)
  math.scores.keys.size.should eq (2)
  math.exam(seven,60)
  math.exam(six,70)
  math.exam(six,70)
  math.exam(seven,60)
  math.avg(seven).should eq(60)
  math.avg(six).should eq(70)
  math.avg2.should eq(65)
 end
end  