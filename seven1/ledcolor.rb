class String
  def colorize(color, options = {})
    background = options[:background] || options[:bg] || false
    style = options[:style]
    offsets = ["gray","red", "green", "yellow", "blue", "magenta", "cyan","white"]
    styles = ["normal","bold","dark","italic","underline","xx","xx","underline","xx","strikethrough"]
    start = background ? 40 : 30
    color_code = start + (offsets.index(color) || 8)
    style_code = styles.index(style) || 0
    "\e[#{style_code};#{color_code}m#{self}\e[0m"
  end
end

class Lcd
  attr_accessor :numbers
  def initialize(numbers)
    @numbers = numbers
  end
  CHARS= {
   a: "    ",
   b: " -- ",
   c: "|   ",
   d: "   |",
   e: "|  |",
 }

 NUMBERS= {
   "0" => [:b, :e, :a, :e, :b],
   "1" => [:a, :d, :a, :d, :a],
   "2" => [:b, :d, :b, :c, :b],
   "3" => [:b, :d, :b, :d, :b],
   "4" => [:a, :e, :b, :d, :a],
   "5" => [:b, :c, :b, :d, :b],
   "6" => [:b, :c, :b, :e, :b],
   "7" => [:b, :d, :a, :d, :a],
   "8" => [:b, :e, :b, :e, :b],
   "9" => [:b, :e, :b, :d, :b],
 }   
 def display (color)
    numbers.each_char do |number|
      NUMBERS[number].each do |x|
         case color
          when "red"
              
           # CHARS[x]#.colorize "red"
          puts CHARS[x].colorize "red"

          when 
              color = "white"
          puts CHARS[x].colorize "white"  
        end
      end
    end
 end

end
lcd  = Lcd.new("123")
lcd.display('white')
lcd.display('red')