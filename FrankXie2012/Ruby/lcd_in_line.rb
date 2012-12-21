class Lcd
  attr_accessor :numbers
  def initialize(numbers)
    @numbers = numbers
  end

  CHARS={
    a: "    ",
    b: " -- ",
    c: "|   ",
    d: "   |",
    e: "|  |"
  }

  NUMBER={
    '0' => [:b,:e,:a,:e,:b],
    '1' => [:a,:d,:a,:d,:a],
    '2' => [:b,:d,:b,:c,:b],
    '3' => [:b,:d,:b,:d,:b],
    '4' => [:a,:e,:b,:d,:a],
    '5' => [:b,:c,:b,:d,:b],
    '6' => [:b,:c,:b,:e,:b],
    '7' => [:b,:d,:a,:d,:a],
    '8' => [:b,:e,:b,:e,:b],
    '9' => [:b,:e,:b,:d,:b],
  }

  def display
    single = []
    i = 0
    a = 0
    b = 0
    numbers.each_char do |number|
      NUMBER[number].each do |x|
        single[i] = CHARS[x]
        i += 1
      end
    end
    while a < 5
      while b < numbers.length
        print single[b*5+a]
        b += 1
      end
      puts ""
      b = 0
      a += 1
    end
  end
end
lcd = Lcd.new(ARGV[0])
lcd.display
