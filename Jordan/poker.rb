# coding: utf-8
require 'rubygems'
require 'rspec'
class Card
	attr_accessor :suit, :face
	def initialize(s, f)
		@suit = s
		@face = f
	end

	def to_s
		@suit+@face
	end
end
class Poker

	SUITS = ["♠", "♥", "♣", "♦"]
	FACES = ('1'..'10').to_a << 'J' << 'Q' << 'K'

	attr_accessor :cards

	def initialize
		@cards = []
		build
	end

	def display(cards=nil)
		puts (cards||@cards).map{|card| card.to_s}.join(" ")
	end

	def shuffle
		@cards.sort_by!{rand}
	end

	def deal(members = 13)
		@cards.each_slice(members).to_a
	end

	private
	def build
		SUITS.each do |s|
			FACES.map{|f| [s, f]}.each{|args| @cards << Card.new(*args)}
		end
	end
end

poker = Poker.new
puts "Before shuffling cards ...."
poker.display
poker.shuffle
puts "After shuffling cards ...."
poker.display
puts "After dealing cards ...."
members = poker.deal
members.each{|cards| poker.display(cards)}


describe Poker do
	it "should check constant values" do
		Poker::SUITS.uniq.size.should == 4
		Poker::FACES.uniq.size.should == 13
		Poker::FACES.map(&:class).uniq.size.should == 1
	end

	it "should init poker" do
		poker = Poker.new
		poker.cards.size.should == Poker::FACES.uniq.size*Poker::SUITS.uniq.size
		Poker::SUITS.each_with_index do |suit, x|
			Poker::FACES.each_with_index do |face, y|
				index = Poker::FACES.size*x + y
				poker.cards[index].suit.should == suit
				poker.cards[index].face.should == face
			end
		end
	end

	it "should shuffle cards" do
		poker = Poker.new
		ordered = poker.cards.map(&:to_s).join('')
		poker.shuffle
		poker.cards.map(&:to_s).join('').should_not == ordered
		poker.cards.map(&:to_s).join('').should_not == ordered
	end

	it "should deal cards" do
		poker = Poker.new
		poker.deal.size.should == 4
		poker.deal.map(&:size).uniq.should == [13]
	end


end