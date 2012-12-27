require 'open-uri'
require 'hpricot'  

class Extract
  attr_accessor :input


  def initialize(website)
    @input = open(website)
    
  end

  def show_content
    contents = @input.read
    contents.each_line.with_index{
      |line, index| 
      if line.include?("<a")
        puts index, line
      end
    }
  end


  def get_attributes_by_plugin
    count = 1
    doc =  Hpricot(@input)
    doc.search("a").each{
      |item|

      puts "#{count} : #{item.attributes['href']} : #{item.inner_html.strip}"
      count+=1
      
    }

  end

  
end

e = Extract.new('https://github.com/explore')
e.get_attributes_by_plugin
