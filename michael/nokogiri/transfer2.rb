require 'nokogiri'
require 'open-uri'

class Transfer 
  def initialize(url)
    resource = File.open(url) rescue open(url)
    @doc = Nokogiri::HTML(resource)
    @xml = Nokogiri::XML "<xml></xml>"
  end

  def transfer
    @doc.css("span.attention_bold").each do |title| 
      rule = @xml.create_element "rule"
      xml_title = @xml.create_element "title"
      xml_title.content = title.content
      rule.add_child(xml_title)
      xml_links = @xml.create_element "links"
        
      while title.next !=nil and title.next.name != "span" 
        if title.next.name == "a"
          link =title.next
          xml_link =  @xml.create_element "link"
          xml_link['url']=link.attributes["href"].value
          xml_link.content= link.content
          xml_links.add_child(xml_link)
        end
        title = title.next        
      end
      rule.add_child(xml_links)
      @xml.child.add_child(rule)
    end
    @xml.to_xml
  end

  def store_in_file
    ouput_file = File.new("ouput.xml","w")
    ouput_file.puts transfer()
    ouput_file.close
  end
end

a = Transfer.new("index.html")
a.store_in_file

