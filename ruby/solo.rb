# Make a class Pokemon
# Have the class with attributes: 
# Which pokemon it is,
# A nickname for the pokemon, if no input, default = the pokemon name
# What level the pokemon is from 1-100
# A array of up to 4 strings that represent pokemon moves, driver code will 
# convert user input to 1 string

# A method that chooses the pokemon by calling its nickname
# A method that levels up the pokemon, if it is max level return that it is at max level
# A method to learn a new move, if the moveset is full ask if they want to 
# replace one of the moves in the moveset for the new move.

class Pokemon
	attr_reader :pokemon
	attr_accessor :nickname, :level, :moveset

	def initialize(given_pokemon_name,given_nickname,given_level,given_moveset)
		@pokemon_name= given_pokemon_name
		@nickname= given_nickname
		@level= given_level
		@moveset= given_moveset
	end

	def i_choose_you
		temp_name= @pokemon_name
		puts "#{@nickname}, I choose you!"
	end

	def level_up
		if @level == 100
			puts "#{@nickname} is at max level"
		else
			@level+= 1
			puts "#{@nickname} grew to level #{@level}!"
		end
	end

end


p blastoise= Pokemon.new("Blastoise","Blasty",36,["Hydro Pump", "Ice Beam","Rapid Spin", "Strength"])
blastoise.i_choose_you
blastoise.level_up
