#method one
class Game
	attr_accessor :input_c, :input_p#c is computer,p is person
#hash
	SIGN = {
		'0'=> "rock",
		'1'=>  "paper",
		'2'=>  "scissor",
	}

	def rock
		"rock"
	end

	def paper
		"paper"
	end

	def scissor
		"scissor"
	end

	def self.judge(input_p)
		num_c = rand(3).to_s
		input_c = SIGN[num_c]
    case input_c
		when 'rock'
			if input_p == 'paper'
				"you win"
			elsif input_p == "rock"
				"equal"
			elsif input_p == "scissor"
				"computer win"
			end
		when 'paper'
			if input_p == 'paper'
				"equal"
			elsif input_p == "rock"
				"computer win"
			elsif input_p == "scissor"
				"you win"
			end
		when 'scissor'
			if input_p == 'paper'
				"computer win"
			elsif input_p == "rock"
				"you win"
			elsif input == "scissor"
				"equal"
			end
		end
	end
end


# #method two
# class Game 
# 	attr_accessor :input_c, :input_p
# 	SIGN = {
# 		'0'=> "rock",
# 		'1'=>  "paper",
# 		'2'=>  "scissor",
# 	}
# 	def initialize(i_p)
# 		@input_p = i_p
# 	end

# 	def judge
# 		num_c = rand(3).to_s
# 		input_c = SIGN[num_c]
# 		case input_c
# 		when 'rock'
# 			if input_p == 'paper'
# 				"you win"
# 			elsif input_p == "rock"
# 				"equal"
# 			elsif input_p == "scissor"
# 				"computer win"
# 			end
# 		when 'paper'
# 			if input_p == 'paper'
# 				"equal"
# 			elsif input_p == "rock"
# 				"computer win"
# 			elsif input_p == "scissor"
# 				"you win"
# 			end
# 		when 'scissor'
# 			if input_p == 'paper'
# 				"computer win"
# 			elsif input_p == "rock"
# 				"you win"
# 			elsif input == "scissor"
# 				"equal"
# 			end
# 		end
# 	end
# end