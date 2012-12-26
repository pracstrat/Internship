class Students
	attr_accessor :name, :scores
	def initialize(name)
		@name = name
		@scores = {}
	end
	def attend(les)
		@scores[les] ||= []
	end
	def exam(les,sco)
    @scores[les] << sco
    #scores[les].to_i
	end
	def ave(les)
		@scores[les].inject(:+)*1.0 / @scores[les].size
	end
end

class Lessons
	attr_accessor :lecname, :lecscores
	def initialize(ln)
		@lecname = ln
		@lecscores = {}
	end
	def attend(pername)
		@lecscores[pername] ||= []
	end
	def exam(pername,score)
		@lecscores[pername] << score
	end
	def ave(pername)
		@lecscores[pername].inject(:+)*1.0 / @lecscores[pername].size
  end
end




describe Lessons do
	it "test Lessons" do
		english = Lessons.new("english")
		math = Lessons.new("math")
		chinese = Lessons.new("chinese")

		english.attend("one")
		english.attend('two')
		english.attend('three')
		math.attend("one")
		math.attend("two")
		math.attend("three")
		chinese.attend("one")
		chinese.attend("two")
		chinese.attend("three")
		english.lecscores.keys.size.should eq(3)

		english.exam('one',100)
		english.exam('one',90)
		english.lecscores["one"].should eq([100,90])

		math.exam('two',100)
		math.exam('two',90)
		math.lecscores["two"].should eq([100,90])

		chinese.exam('three',100)
		chinese.exam('three',90)
		chinese.lecscores["three"].should eq([100,90])

    english.ave("one").should eq(95.0)
    math.ave("two").should eq(95.0)
    chinese.ave("three").should eq(95.0)
	end
end







describe Students do
	it "test class" do
    one = Students.new("one")
    two = Students.new("two")
    three = Students.new("three")
    one.attend("math")
    one.attend("english")
    one.attend("chinese")
    one.scores.keys.size.should eq(3)

    one.exam("math", 100)
    one.exam("math", 90)
    one.exam("english", 90)
    one.exam("english",100)
    one.scores["math"].should eq([100, 90])

    one.attend("english")
    one.scores['english'].should eq([90,100])

    one.ave('math').should eq(95.0)
    one.ave("english").should eq(95.0)
#one to two error
    two.attend('math')
    two.scores.keys.size.should eq(1)
    two.exam('math',100)
    two.exam('math',90)
    two.scores['math'].should eq([100,90])
    two.ave("math").should eq(95.0)

	end
end