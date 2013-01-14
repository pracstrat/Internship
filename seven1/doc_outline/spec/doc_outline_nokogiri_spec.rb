require 'open-uri'
require 'doc_outline_nokogiri'

describe DocOutlineNokogiri do 
  describe ".output" do        
    let(:address) {'http://english.sina.com/'}
    let(:expected) { File.read("outputsina.txt")}
    it "should output outlines" do
      DocOutlineNokogiri.output(address).should == expected 
    end
  end
end 