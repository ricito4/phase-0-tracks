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