#method one
describe Game do 
	it "test Game " do 
		person = Game.new
		p = person.paper
		Game.judge(p).should eq("you win")
	end
end



#method two
# describe Game do
# 	it "test Game" do
#      p = "paper"
# 		game = Game.new(p)
# 		game.judge.should eq("you win")
# 	end
# end