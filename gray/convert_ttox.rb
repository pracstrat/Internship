class Convert
  attr_accessor :name, :children, :attr, :attr_name, :spaces

  def initialize(data, spaces=0)
    @data = data
    @children = []
    @spaces = spaces
    extract
  end 

  def output
    if @name == 'name' || @name == 'age' || @name == 'number' || @name == 'other'
      out = "#{build_spaces}<#{@name}#{@attr_name}>"
    else
      out = "#{build_spaces}<#{@name}#{@attr_name}>\n"
    end
    
    @children.each do |child|
    out += child.output
    end
    if @name == 'name' || @name == 'age' || @name == 'number' || @name == 'other'
      out += "#{@attr}"
      out += "</#{@name}>\n"
    else
      out += "#{@attr}"
      out += "#{build_spaces}</#{@name}>\n"
    end
  end

  def build_spaces
    "  "*spaces
  end

  private

  def extract
    blockpre ||= []#nil or not nil
    start = false#?????????????????????
    @data.each_line do |line|
      case line
      when /^(\w+)/
        if line =~/^\w\w\w$/
          @name = line.scan(/^\w\w\w$/).join

        elsif line =~/(\s\w+\W+\d\W)$/
           @name = line.scan(/^(\w+)/).join
           @attr_name = line.scan(/(\s\w+\W+\d\W)$/).join
           
        else#/\w$/
          if line.include?("other")
            @name = line.scan(/^(\w+)/).join
            @attr = line.scan(/(\w+)$/).join
            @attr_name = line.scan(/(\s\w+\W+\w+\W\s\w+)$/).join.sub(/\s\w+$/,'')
          else
            @name = line.scan(/^(\w+)/).join
            @attr = line.scan(/(\w+)$/).join
           end
        end

      when /^\s{2}\w+/
        unless blockpre.empty?
          @children << Convert.new(blockpre.join(""), spaces + 1)
          blockpre.clear 
        end
        blockpre << line.gsub(/^(\s{2})/, '')

      when /^\s{4}\w+/
        blockpre << line.gsub(/^(\s{2})/, '')
      
       end
    end

    unless blockpre.empty?#??????
      @children << Convert.new(blockpre.join(""), spaces + 1)
      blockpre.clear
    end
    
  end
end





describe Convert do 
  it "test Convert" do 
    data = IO.read(File.expand_path(File.join(__FILE__, "../xml.txt")))
    con = Convert.new(data)
    con.name.should eq('xml')
    con.children.size.should eq(4)
    puts con.output
  end
end 