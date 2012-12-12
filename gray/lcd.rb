#HASH 
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
def display(numbers)
	numbers.each_char do |number|#bianli numbers
		NUMBERS[number].each do |x|#bianli NUMBER
			puts CHARS[x]
		end

	end

end
display(ARGV[0]) #canshu to ARGB and diaoyong display 