require 'nokogiri'
require 'open-uri'

class DocOutlineNokogiri
  def self.output(address)
    doc = Nokogiri::HTML(open(address))
    a = ""
    doc.xpath('//h1|//h2|//h3|//h4|//h5|//h6').each  do |link|  
    a +=  " "*4*link.name[/\d/].to_i + "[#{link.name}] " + link.text.rstrip + "\n" 
    end
    a.chomp 
      
  end
end      