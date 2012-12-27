# encoding: utf-8
class Poker
  attr_accessor  :cards

  def initialize ()
    @cards = []
  end

  def generate_cards
    @cards = ["♠1","♠2","♠3","♠4","♠5","♠6","♠7","♠8","♠9","♠10","♠J,""♠Q","♠K","♥1","♥2","♥3","♥4","♥5","♥6","♥7","♥8","♥9","♥10","♥J" ,"♥Q","♥K","♣1","♣2","♣3","♣4" ,"♣5","♣6","♣7","♣8","♣9","♣10","♣J","♣Q","♣K","♦1","♦2","♦3","♦4","♦5","♦6","♦7","♦8","♦9","♦10","♦J","♦Q" ,"♦K"]
  end


end

describe Poker do 

	describe "#Generate the 52 cards" do
		poker=Poker.new
    poker.generate_cards

		poker.cards.should == ["♠1","♠2","♠3","♠4","♠5","♠6","♠7","♠8","♠9","♠10","♠J,""♠Q","♠K","♥1","♥2","♥3","♥4","♥5","♥6","♥7","♥8","♥9","♥10","♥J" ,"♥Q","♥K","♣1","♣2","♣3","♣4" ,"♣5","♣6","♣7","♣8","♣9","♣10","♣J","♣Q","♣K","♦1","♦2","♦3","♦4","♦5","♦6","♦7","♦8","♦9","♦10","♦J","♦Q" ,"♦K"]


	end


	describe "#shuffle_the_card" do

		it "should return the different first card" do
			before (:all)do
       	 		poker=Poker.new
            poker.generate_cards
       	 		poker.suffle_the_card
      		end

      		poker.shuffle_the_card.should_not == subject.cards


		end


	end

	describe "#deal_card" do
		before do

			let(:michael) {Person.new("michael")}
			let(:jordon) {Person.new("jordon")}
			let(:seven) {Person.new("seven")}
			let(:frank){Person.new("frank")}


			subject.generate_cards
       	 	
		end

		it "should return four different cards array" do
			subject.deal_card(michael, jordon, seven, frank)
			michael.cards.should == [♠1,♠2,♠3,♠4,♠5,♠6,♠7,♠8,♠9,♠10,♠J,♠Q,♠K]
			jordon.cards.should == [♥1,♥2,♥3,♥4,♥5,♥6,♥7,♥8,♥9,♥10,♥J ,♥Q,♥K]
			seven.cards.should == [♣1,♣2,♣3,♣4 ,♣5,♣6,♣7,♣8,♣9,♣10,♣J,♣Q,♣K]
			frank.cards.should == [♦1,♦2,♦3,♦4,♦5,♦6,♦7,♦8,♦9,♦10,♦J,♦Q ,♦K]

		end



	end

	
end



class Person
	attr_accessor  :cards, :name

	def initialize (name)
		@name = name
    @cards =[]
  end


end

describe Person do

	let(:michael) {Person.new("michael")}
	let(:jordan) {Person.new("jordon")}

	describe "initialize" do

		it "should return a empty cards" do
			michael.cards.should == []
			jordan.cards.should == []
		end
		
	end



end