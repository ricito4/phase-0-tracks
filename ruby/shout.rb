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
	def shouter(words)
    	puts "#{words}!!!"
	end
end

class Speaker
	include Shout
end

class Old_Man
	include Shout
end

shia_labeouf= Speaker.new
shia_labeouf.shouter("JUST DO IT")

mr_johnson= Old_Man.new
mr_johnson.shouter("Get off my lawn")