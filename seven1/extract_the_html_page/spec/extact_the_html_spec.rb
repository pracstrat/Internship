# coding: utf-8
require 'open-uri'
require_relative "../lib/extract_the_html"
 

describe ExtractTheHtml do
    
  it "get example1 output" do 
     example1 = ExtractTheHtml.new
     one_html = '<a href="/eishay">eishay</a>' 
     example1.convert(one_html).should == '/eishay:eishay'
  end
  
  it "open address show title"  do 
    example3 = ExtractTheHtml.new
    address = 'https://github.com/explore'
    example3.open_address_and_title(address).should == 'Explore · GitHub'
  end 
  

end  
