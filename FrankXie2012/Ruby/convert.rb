class Convert
  def initialize()
    @i1 = 0
    @i2 = 0
    @i3 = 0
    @title = ""
    @text = Array.new(0)
    @sentences1 = Array.new(0)
    @sentences2 = Array.new(0)
    @sentences3 = Hash.new
  end

  def input                                                                 #input the simple file
  	a = 0
  	b = 0
  	title = ""
  	path = Array.new(0)
    puts "Please input the path to the .simple file,end with 'quit'"
    while true
      path0 = gets.chomp
      path[b] = path0
      b += 1
      sentence = File.read(path[0])
      break if path0 == "quit"
    end
 	  sentence.split("\n").each do |s|
    	@text[a] = s
    	a += 1
    end
    title = path[0].split("/").last
    @title = title.split(".").first
  end

  def depart                                                     #depart the sentences into diffrent sorts
  	str1 = ""
  	str2 = ""
    @text.each do |sentence|
      if sentence.byteslice(0,2) != "  "
        @sentences1[@i1] = sentence
        @i1 += 1
      else
        @sentences2[@i2] = sentence
        @i2 += 1
      end
    end
		@sentences2.each do |b|
			if b.byteslice(2) != " "
				@sentences3.key(b)
				str1 = b
			else
				if @sentences3[str1] == nil
					str2 = ""
				end
				str2 = str2 + b
				@sentences3[str1] =  str2
			end
		end
		@sentences3.collect{ |key,value| value.split("    ")}
  end

	def packup
		sentence1 = Array.new(0)
		sentence2 = Array.new(0)
		str = ""
		File.new("#{@title}.xml","a+")                                    #create a new xml file
		File.open("#{@title}.xml", "w") do |line|                         #insert the sentences into xml file
			line << "<#{@sentences1[0].strip}>\n"
			@sentences3.collect{ |key,value| 
				line << "  <#{key.strip}>\n"
				value.split("    ").each do |sentence|
					sentence1 = sentence.split(" ")
					if sentence1.size == 2
					 	line << "    <#{sentence1[0]}>#{sentence1[1]}</#{sentence1[0]}>\n"
					elsif sentence1.size == 1
						line << "    <#{sentence1[0]} />\n"
					elsif sentence1.size > 2
						sentence1.each do |s|
							if s != sentence1.last && s != sentence1.first
								str = str + " " + s
							elsif s == sentence1.first
								str = s
							else
								sentence2[1] = s
							end							
						end
						sentence2[0] = str
						sentence2[2] = sentence1.first
						line << "    <#{sentence2[0]}>#{sentence2[1]}</#{sentence2[2]}>\n"
					end 
				end
				line << "  </#{key.split(" ").first}>\n"
			}
			line << "</#{@sentences1[0].strip}>\n"
		end
	end
end
convert = Convert.new
convert.input
convert.depart
convert.packup