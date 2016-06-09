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

	def learn_new_move(new_move)
		if @moveset.length < 4
			puts "#{@pokemon_name} learned #{new_move}!"
			p @moveset.push(new_move)
			
		else
			valid_response= false
			puts "-----------"
			puts "#{@pokemon_name} wants to learn #{new_move} but #{@pokemon_name} already knows 4 moves!"
			puts "Should a move be forgotten to make space for #{new_move}?"

			until valid_response
				answer= gets.chomp
				if answer.downcase == 'yes'
					
					puts "Which move should be forgotten?"
					puts @moveset
					
					valid_move= false
					until valid_move
						move_to_replace= gets.chomp
						index= @moveset.index(move_to_replace)
						if index != nil
							@moveset[index]= new_move
							puts "1, 2 and... Poof! #{@pokemon_name} forgot #{move_to_replace} and... #{@pokemon_name} learned #{new_move}!"
							valid_move= true
							valid_response= true
							p @moveset
						else
							puts "Invalid move, please type in a move"
						end
					end

				elsif answer.downcase == 'no'
					valid_response= true
					puts "#{@pokemon_name} did not learn #{new_move}"
				else
					puts "This is not a valid response"
				end
			end
		end

	end
end

# test cases
# blastoise= Pokemon.new("Blastoise","Blasty",36,["Hydro Pump", "Ice Beam","Rapid Spin", "Strength"])
# blastoise.i_choose_you
# blastoise.level_up
# blastoise.learn_new_move("Hyper Beam")

# mewtwo= Pokemon.new("Mewtwo","Mewtwo",100,["Ice Beam"])
# mewtwo.i_choose_you
# mewtwo.level_up
# mewtwo.learn_new_move("Psychic")