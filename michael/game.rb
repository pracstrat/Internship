class Game 

  def compare(input1, input2)
    case 
    when input1 == "Rocks"

      case 
      when input2 == "Rocks"
        return "No winner"
      when input2 == "Paper"
        return "#{input1} lose the #{input2} win"
      when input2 == "Scissor"
        return "#{input1} wins the #{input2} lose"
      end


    when input1 == "Paper"
      case 
      when input2 == "Rocks"
        return "#{input1} wins the #{input2} lose"
      when input2 == "Paper"
        return "No winner"
      when input2 == "Scissor"
        return "#{input1} lose the #{input2} win"
      end

    when input1 == "Scissor"
      case 
      when input2 == "Rocks"
        return "#{input1} lose the #{input2} win"
      when input2 == "Paper"
        return "#{input1} wins the #{input2} lose"
      when input2 == "Scissor"
        return "No winner"
      end
    end


  end


end

describe Game do
  # let(:game ) { Game.new }

  context "rock vs rock" do
    it "should return win" do
      subject.compare("Rocks", "Rocks").should == "No winner"
    end
  end
  
  it "show the result of game between rocks and rocks" do
  
    input1 = "Rocks"
    input2 = "Rocks"
    game.compare(input1, input2).should == "No winner"

  end

  it "show the result of game between rocks and paper" do
  
    input1 = "Rocks"
    input2 = "Paper"
    game.compare(input1, input2).should == "#{input1} lose the #{input2} win"
  end

  it "show the result of game between rocks and scissor" do

    input1 = "Rocks"
    input2 = "Scissor"
    game.compare(input1, input2).should == "#{input1} wins the #{input2} lose"
  end


  it "show the result of game between paper and rocks" do
  
    input1 = "Paper"
    input2 = "Rocks"
    game.compare(input1, input2).should == "#{input1} wins the #{input2} lose"

  end

  it "show the result of game between paper and paper" do
  
    input1 = "Paper"
    input2 = "Paper"
    game.compare(input1, input2).should == "No winner"
  end

  it "show the result of game between paper and scissor" do

    input1 = "Paper"
    input2 = "Scissor"
    game.compare(input1, input2).should == "#{input1} lose the #{input2} win"
  end

  it "show the result of game between scissor and rocks" do
  
    input1 = "Scissor"
    input2 = "Rocks"
    game.compare(input1, input2).should == "#{input1} lose the #{input2} win"

  end

  it "show the result of game between scissor and paper" do
  
    input1 = "Scissor"
    input2 = "Paper"
    game.compare(input1, input2).should == "#{input1} wins the #{input2} lose"
  end

  it "show the result of game between scissor and scissor" do

    input1 = "Scissor"
    input2 = "Scissor"
    game.compare(input1, input2).should == "No winner"
  end

end


# class person 

#   attr_accessor :choice

# end

   


# end

# describe Person do

#   let(:person) {person = Person.new}

#   it "get the input" do

#     person.should_receive(:choice){ "J" }
#   end

# end

class Computer 
  
  attr_accessor :choice
  
  def get_random_choice
    @choice = [ "Rocks", "Scissor" ,"Paper" ].shuffle.first
    
  end

end

describe Computer do
  describe "#get_random_choice" do
    context "rand returns 0" do
      before do
        computer.rng = mock("rand", :rand => 0)
      end

      its(:get_random_choice) { should == "Rocks"}
    end

    context "rand returns 1" do
      before do
        computer.rng = mock("rand", :rand => 1)
      end

      its(:get_random_choice) { should == "Scissor"}
    end

    context "rand returns 2" do
      before do
        computer.rng = mock("rand", :rand => 2)
      end

      its(:get_random_choice) { should == "Paper"}
    end
  end
end





class Computer
  attr_accessor :rng
  CHOICES = [ "Rocks", "Scissor" ,"Paper" ]

  def initialize
    @rng = Random.new
  end

  def get_random_choice
    CHOICES[@rng.rand(3)]
  end
end
