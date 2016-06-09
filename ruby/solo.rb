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

def pokemon_creator

	# ask for which pokemon they want
	valid_pokemon= false
	puts "Which Pokemon would you like?"
	until valid_pokemon
		chosen_pokemon= gets.chomp
		if chosen_pokemon.empty?
			puts "Invalid response, Please enter a Pokemon"
		else
			valid_pokemon= true
		end
	end

	# ask if they want a nickname for it
	valid_want_nickname= false
	puts "Would you like to choose a nickname? (yes/no)"
	until valid_want_nickname
		want_nickname= gets.chomp
		
		if want_nickname.downcase== "yes"
			valid_want_nickname= true
			puts "Please type in what nickname you would like to give"
			valid_nickname= false
			until valid_nickname
				chosen_nickname= gets.chomp
				if chosen_nickname.empty?
					puts "Invalid response"
				else
					valid_nickname= true
				end
			end

		elsif want_nickname.downcase== "no"
			valid_want_nickname= true
			chosen_nickname= chosen_pokemon
		else
			puts "Invalid response"
		end
	end

	# ask for what level they want their pokemon to be
	valid_level= false
	puts "What level do you want your pokemon at? (1-100)"
	until valid_level
		chosen_level= gets.to_i
		if chosen_pokemon.empty?
			puts "Invalid response, Please select a level"
		elsif chosen_level < 1
			puts "Invalid response, This pokemon must be at least level 1"
		elsif chosen_level > 100
			puts "Invalid response, This pokemon's level cannot exceed 100"
		else	
			valid_level= true
		end
	end

	# ask for this pokemon's moveset
	chosen_moveset=[]
	moveset_finish= false
	
	until moveset_finish
		valid_move= false
		puts "Please add a move you want this pokemon to know"
		until valid_move
			chosen_move= gets.chomp
			if chosen_move.empty?
				puts "Invalid response, Please enter a move"
			else
				valid_move= true
				chosen_moveset.push(chosen_move)
			end
		end
		
		puts "#{chosen_pokemon}'s current movset is #{chosen_moveset}"
		if chosen_moveset.length < 4
			puts "Would you like to add another move? (yes/no)"
			valid_yes_no= false
			until valid_yes_no
				more_moves= gets.chomp
				if more_moves.downcase == "no"
					valid_yes_no= true
					moveset_finish= true
				elsif more_moves.downcase == "yes"
					valid_yes_no= true
				else
					puts "Invalid response"
				end
			end
				

		else
			puts "#{chosen_pokemon} cannot learn any more moves"
			moveset_finish= true
		end
	end

	instance_pokemon= Pokemon.new(chosen_pokemon,chosen_nickname,chosen_level,chosen_nickname)

end

pokemon_creator