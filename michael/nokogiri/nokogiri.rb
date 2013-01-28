require 'open-uri'
require 'nokogiri'



@original_doc = Nokogiri::HTML(File.open("index.html"))
titles = @original_doc.css("span.attention_bold")


output = Nokogiri::XML "<xml></xml>"

titles.each do |title|
  rule = Nokogiri::XML::Node.new('rule',output)
  output_title = Nokogiri::XML::Node.new('title',output)
  output_title.content = title.content
  rule.add_child(output_title)
  output_links = Nokogiri::XML::Node.new('links',output)
  
  
  while title.next !=nil and title.next.name != "span" 
    if title.next.name == "a"
      link =title.next
      output_link = Nokogiri::XML::Node.new('link',output)
      output_link['url']=link.attributes["href"].value
      output_link.content= link.content
      output_links.add_child(output_link)

    end
    title = title.next
    
  end
  rule.add_child(output_links)
  output.child.add_child(rule)
end
puts output.to_xml
