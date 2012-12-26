require 'machine'

describe Machine do
  it "input" do

    machine = Machine.new
    machine.input("rock").should eq "rock"
    machine.compare("rock","paper").should eq "paper win the game"
    
  end

end
