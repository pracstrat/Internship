require 'nokogiri'
require 'open-uri'

class Transfer 
  def initialize(url)
    resource = File.open(url) rescue open(url)
    @doc = Nokogiri::HTML(resource)
    @xml = Nokogiri::XML "<xml></xml>"
  end

  def transfer_to_xml
    @doc.css("span.attention_bold").each do |title| 
      rule = @xml.create_element "rule"
      xml_title = @xml.create_element "title"
      xml_title.content = title.content
      rule.add_child(xml_title)
      xml_links = @xml.create_element "links"      
      next_node = title.next
      while next_node && next_node.name != "span" 
        if next_node.name == "a"
          xml_link = @xml.create_element "link"
          xml_link['url'] = next_node.attributes["href"].value
          xml_link.content= next_node.content
          xml_links.add_child(xml_link)
        end
        next_node = next_node.next
      end
      rule.add_child(xml_links)
      @xml.child.add_child(rule)
    end
    @xml
  end

  def store_in_file
    ouput_file = File.new("ouput.xml","w")
    ouput_file.puts transfer_to_xml.to_xml
    ouput_file.close
  end
end

a = Transfer.new("index.html")
a.store_in_file

