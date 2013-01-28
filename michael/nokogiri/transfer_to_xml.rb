require 'nokogiri'

class Transfer_to_xml 
  def initialize(url)
    @original_doc = Nokogiri::HTML(File.open(url))
    @output = Nokogiri::XML "<xml></xml>"
    @output_file = File.open('output.xml')
  end

  def find_title
    titles = @original_doc.css("span.attention_bold")

      
    rule = Nokogiri::XML::Node.new('rule',@output)
    output_title = Nokogiri::XML::Node.new('title',@output)
    output_title.content = title.content
    rule.add_child(output_title)
    output_links = Nokogiri::XML::Node.new('links',@output)
    
    
    while title.next !=nil and title.next.name != "span" 
      if title.next.name == "a"
        link =title.next
        output_link = Nokogiri::XML::Node.new('link',@output)
        output_link['url']=link.attributes["href"].value
        output_link.content= link.content
        output_links.add_child(output_link)

      end
      title = title.next
      
    end
    rule.add_child(output_links)
    @output.child.add_child(rule)
  end
end

a = Transfer_to_xml.new("index.html")
a.find_title

