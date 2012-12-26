class Lcd
	CHARS={
		a: "    ",
		b: " -- ",
		c: "|   ",
		d: "   |",
		e: "|  |"
	}

	NUMBER={
		'0' => [:b,:e,:a,:e,:b],
		'1' => [:a,:d,:a,:d,:a],
		'2' => [:b,:d,:b,:c,:b],
		'3' => [:b,:d,:b,:d,:b],
		'4' => [:a,:e,:b,:d,:a],
		'5' => [:b,:c,:b,:d,:b],
		'6' => [:b,:c,:b,:e,:b],
		'7' => [:b,:d,:a,:d,:a],
		'8' => [:b,:e,:b,:e,:b],
		'9' => [:b,:e,:b,:d,:b],
	}
	attr_accessor :numbers
	
	def initialize(numbers)
		@numbers = numbers
	end
	#vertocally diplaying the lcd digits
	def display_vertical
		@numbers.to_s.split('').collect{|number| NUMBER[number]}.each do |elems|
			elems.each{|elem| puts CHARS[elem]}
		end
	end

	#horizontally diplaying the lcd digits
	# def display_horizontal
	# 	@numbers.to_s.split('').collect{|number| NUMBER[number]}.transpose.each do |elems|
	# 		puts elems.collect{|elem| CHARS[elem]}.join(' ')
	# 	end		
	# end

	def display_horizontal
		@numbers.to_s.split('').collect{|number| NUMBER[number]}.each{
			|elems| elems.each{
				|elem|
				puts CHARS[elem]
			}
		} 
	end

end




describe "lcd TEST" do

	it "put the ARGV" do
		lcd = Lcd.new(123)
		lcd.numbers.to_s.should == "123"

	end

	it "put the ARGV" do

	end



end


