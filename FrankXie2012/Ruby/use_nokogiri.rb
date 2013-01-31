require 'open-uri'
require 'nokogiri'
class UseNokogiri
  def initialize
    @content = {}
  end

  def read_page
    f = File.open('sos.html')
    @doc = Nokogiri::HTML(f).css('div#content p')
    f.close
    @doc
  end

  def change_span_tags
    @span = @doc.css "span"
    @span.each { |each_span|
      each_span.name = 'title'
      if each_span.children.size != 1
        each_span.children = each_span.children.last
      end
      each_span.children = each_span.children.to_s.strip
      each_span.remove_attribute('class')
    }
    @span
  end

  def change_a_tags
    @a = @doc.css "a"
    @a.each do |each_a|
      each_a.name = 'link'
      each_a.attributes["href"].name = "url"
    end
    @a
  end

  def search_next_element(span,element)
    @content[span]||=[]
    neighbor = element.next_element
    if neighbor == nil
      return @content
    elsif @a.include?(neighbor)
      @content[span] << neighbor
      search_next_element(span,neighbor)
    elsif @span.include?(neighbor)
      return @content
    else
      search_next_element(span,neighbor)
    end
  end

  def select_a
    @doc.each do |paragraph|
      paragraph.css('title').each{ |span| search_next_element(span,span)}
    end
  end

  def output
    puts "<xml>"
    @content.each do |key,value|
      puts "  <rule>"
      puts "    #{key}"
      puts "    <links>"
      value.map { |link| puts "      #{link.to_xml}" }
      puts "    </links>"
      puts "  </rule>"
    end
    puts "</xml>"
  end
end

u = UseNokogiri.new
u.read_page
u.change_span_tags
u.change_a_tags
u.select_a
# u.output