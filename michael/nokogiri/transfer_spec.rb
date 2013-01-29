require_relative "transfer2"
require "awesome_print"
describe Transfer do 
  let!(:url) { "index.html" }
  let!(:transfer) { Transfer.new(url)}

  describe "#transfer" do
    it "shoud have right child tree" do
      document = transfer.transfer_to_xml
      xml = document.child
      rule = xml.child
      title = rule.children.first
      links = rule.children[1]
      link = links.child


      document.name.should == "document"
      xml.name.should == "xml"
      rule.name.should == "rule"
      title.name.should == "title"
      links.name.should == "links"
      link.name.should == "link"
    end

    it "should return the first rule" do
      document = transfer.transfer_to_xml
      xml = document.child
      rule = xml.child
      title = rule.children.first
      links = rule.children[1]
      link = links.child

      title.content.should eq "AGING, Texas Department on"
      link.attributes["url"].value.should eq "/texreg/transfers/aging091004.html"
      link.inner_html.should eq "Rule \n      Transfer effective September 1, 2004"
    end

    it "should return the numbers of rule " do
      document = transfer.transfer_to_xml
      xml = document.child
      rules = xml.children
      rules.count.should == 44
    end

  end



end