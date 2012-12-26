
##problem 1
# class Myclass

# 	#static method only can be called by the class it self, not instance
# 	def method1(c) 
# 		c.method2
# 	end

# 	def y(a )
# 		yield a
# 	end
# 	#
# 	private 

# 	def method2
# 		puts "aa"
# 	end

# 	protected 

# 	def method3
		
# 	end


# end

# class Sonclass < Myclass

# 	def method4

# 		method3
# 	end

# 	def method5
# 		method2
# 	end
# end


# # A private type attribute or method can only be accessed within the class itself.
# # A protected type attribute or method can be accessed within the same file and subclasses.
# # A public type attribute or method can be accessed from anywhere.
# a = Myclass.new
# b = Myclass.new

# a.y("hello"){|item | puts item}



#problem2
# http://www.robertsosinski.com/2008/12/21/understanding-ruby-blocks-procs-and-lambdas/
# #very nice introducation about the blocks and procs
# def foo
#   a = 1


#   yield a if block_given?
#   puts a
# end

#problem 3

module Debug
  def who_am_i?
  "#{self.class.name} (id: #{self.object_id}): #{self.name}"
  end

  class A
    def method1
      p "a"
    end


  end
end

class B
  include Debug

  def method2
    A.new.method1
  end

end

B.new.method2

