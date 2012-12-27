class Transpose
  attr_accessor :input, :output

  def initialize(input_file,output_file)
    @input = File.new(input_file, "r")
    @output = File.new(output_file, "w+")

  end

  def transpose_file
    
    @input.each_line.collect{ |line |
      line.split('')
          }.transpose.each{
      |item | output.puts item.join
     }
  end


end


t = Transpose.new("input","output")
t.transpose_file