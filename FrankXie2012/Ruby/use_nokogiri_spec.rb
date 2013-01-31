require './use_nokogiri.rb'

describe UseNokogiri do

  let(:u) { UseNokogiri.new }

  describe "#read_page" do
    context "read the sos.html page" do
      it "the @doc should not be nil" do
        u.read_page.should_not be_nil
      end
    end
  end

  describe "#change_span_tags" do
    let(:span) { u.change_span_tags }

    before(:each) do
      u.read_page
    end

    it "span should not be nil" do
      span.should_not be_nil
    end

    it "span name should be 'title'" do
      span.map(&:name).uniq.should eq(['title'])
    end

    it "the chidren size of span should be 1" do
      span.map{|s| s.children.size }.uniq.should eq([1])
    end
  end

  describe "#change_a_tags" do
    let(:a) { u.change_a_tags }

    before(:each) do
      u.read_page
    end

    it "a name should be 'link'" do
      a.map(&:name).uniq.should eq(['link'])
    end

    it "attributes' name should be 'url'" do
      name = a.map { |e| e.attributes.map { |key,value| value.name}.uniq}.flatten.uniq
      name.should eq(['url'])
    end
  end

end