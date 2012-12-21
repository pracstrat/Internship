class Lcd
	attr_accessor :numbers
	def initialize (numbers)
		@numbers = numbers
	end

	CHARS = {
		a:  "    ",
		b:  " -- ",
		c:  "|   ",
		d:  "   |",
		e:  "|  |"
	}

	NUMBERS = {
		"0" => [:b,:e,:a,:e,:b],
		"1" => [:a,:d,:a,:d,:a],
		"2" => [:b,:d,:b,:c,:b],
		"3" => [:b,:d,:b,:d,:b],
		"4" => [:a,:e,:b,:d,:a],
		"5" => [:b,:c,:a,:d,:b],
		"6" => [:b,:c,:b,:e,:b],
		"7" => [:b,:d,:a,:d,:a],
		"8" => [:b,:e,:b,:e,:b],
		"9" => [:b,:e,:b,:d,:b]
	}

	def display_vertically
		numbers.to_s.split("").collect{|number| NUMBERS[number] }.each do |elements|
			elements.collect{|element|puts CHARS[element]}
		end
	end

	def display_horizontally
		a = 0
		while a < 5
			puts numbers.to_s.split("").collect{|number| NUMBERS[number] }.collect{ |i| CHARS[i.shift] }.join
			a += 1
		end
	end
end
lcd = Lcd.new(ARGV[0])
lcd.display_horizontally