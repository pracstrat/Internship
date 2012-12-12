#method 1
class Lcd
	attr_accessor :number

	def initialize(num)
		@number = num
	end
#hash
CHARS = {
	a: '    ',
	b: '|   ',
	c: '   |',
	d: '|  |',
	e: ' -- ',
}
#HASH
NUMBERS = {
	"0"=> [:e,:d,:a,:d,:e],
	"1"=> [:a,:c,:a,:c,:a],
	"2"=> [:e,:c,:e,:b,:e],
	"3"=> [:e,:c,:e,:c,:e],
	"4"=> [:a,:d,:e,:c,:a],
	"5"=> [:e,:b,:e,:c,:e],
	"6"=> [:e,:b,:e,:d,:e],
	"7"=> [:e,:c,:a,:c,:a],
	"8"=> [:e,:d,:e,:d,:e],
	"9"=> [:e,:d,:e,:c,:e],

}

	def display(numbers)#parrameter
		numbers.each_char do |number|#traversal numbers
			NUMBERS[number].each do |x|#traversal NUMBER
				puts CHARS[x]
			end
		end
	end
end

lcd = Lcd.new(0)
lcd.display(ARGV[0])#get number from console


=begin
#method 2
class Lcd
	attr_accessor :numbers

	def initialize(num)
		@numbers = num
	end
#hash
CHARS = {
	a: '    ',
	b: '|   ',
	c: '   |',
	d: '|  |',
	e: ' -- ',
}
#HASH
NUMBERS = {
	"0"=> [:e,:d,:a,:d,:e],
	"1"=> [:a,:c,:a,:c,:a],
	"2"=> [:e,:c,:e,:b,:e],
	"3"=> [:e,:c,:e,:c,:e],
	"4"=> [:a,:d,:e,:c,:a],
	"5"=> [:e,:b,:e,:c,:e],
	"6"=> [:e,:b,:e,:d,:e],
	"7"=> [:e,:c,:a,:c,:a],
	"8"=> [:e,:d,:e,:d,:e],
	"9"=> [:e,:d,:e,:c,:e],

}

	def display#no parameter
		numbers.each_char do |number|#traversal numbers
			NUMBERS[number].each do |x|#traversal NUMBER
				puts CHARS[x]
			end
		end
	end
end

lcd = Lcd.new(ARGV[0])
lcd.display
=end