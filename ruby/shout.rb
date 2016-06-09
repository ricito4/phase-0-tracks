=begin
module Shout
	def self.yell_angrily(words)
    	words + "!!!" + " :("
  	end

  	def self.yelling_happily(words)
  		words + "!!!" + " :D"
  	end
end


p Shout.yell_angrily("OUCH")
p Shout.yelling_happily("FREE FOOD")
=end

module Shout
	def yell_angrily(words)
		words + "!!!" + " :("
	end
	
	def yelling_happily(words)
		words + "!!!" + " :D"
	end
end

class Speaker
	include Shout
end

class Old_Man
	include Shout
end

shia_labeouf= Speaker.new
p shia_labeouf.yelling_happily("JUST DO IT")
p shia_labeouf.yell_angrily("DON'T LET YOUR DREAMS BE DREAMS")

mr_johnson= Old_Man.new
p mr_johnson.yell_angrily("Get off my lawn")
p mr_johnson.yelling_happily("I LOVE FOOD")