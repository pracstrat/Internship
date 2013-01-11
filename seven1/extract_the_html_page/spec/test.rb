# p /[1cwwwsh1](..) [ddddcwwwsh1]\1 in/.match("The cat cat sat in the hat at")
# p 'hellllllllo'.match('(....)\1') 
class Transpose
#   attr_accessor :input, :output

#   def initialize(input_file,output_file)
#     @input = File.new(input_file, "r")
#     @output = File.new(output_file, "w+")

#   end

#   def transpose_file
    
#     @input.each_line.collect{ |line |
#       line.chomp.split('')
#           }.transpose.each{
#       |item | output.puts item.join
#      }
#   end


# end


# t = Transpose.new("input","output")
# t.transpose_file  
# f = File.open("input")

# @esmtp = true

# begin
#   #First try an extended login. If it fails, fall back a normal login
#   if @esmtp then @command.ehlo(helodom)
#             else @command.helo(helodom)
#   end

# rescue ProtocoLError
#   if @esmtp then
#     @esmtp = flase
#     retry
#   else
#     raise
#     end
# end       

# @esmtp = true
# begin
# # First try an extended login. If it fails, fall back to a normal login
#   if @esmtp then @command.ehlo(helodom)
#             else @command.helo(helodom)
#   end
# rescue ProtocolError
#   if @esmtp then
#     @esmtp = false
#     retry
#   else
#     raise
#   end
# end
raise
raise "Misssing name" if name.nil

if i >= names.size
  raise IndexError, "#{i} >= size (#{names.size})"
end

raise ArgumentError, "Name too big", caller  