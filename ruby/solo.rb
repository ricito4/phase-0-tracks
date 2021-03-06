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
	# Getter and Setter methods
	attr_reader :pokemon_name
	attr_accessor :nickname, :level, :moveset
	# initialize class pokemon with given arguments
	def initialize(given_pokemon_name,given_nickname,given_level,given_moveset)
		@pokemon_name= given_pokemon_name
		@nickname= given_nickname
		@level= given_level
		@moveset= given_moveset
	end

	# Method that prints that we have chosen a pokemon
	def i_choose_you
		temp_name= @pokemon_name
		puts "#{@nickname}, I choose you!"
	end

	# Method that levels up a pokemon. If it is level 100 return that it is at max level
	def level_up
		if @level == 100
			puts "#{@nickname} is at max level"
		else
			@level+= 1
			puts "#{@nickname} grew to level #{@level}!"
		end
	end

	# Method that takes a string for a new move, and asks if you want this pokemon to learn it
	# If the moveset the pokemon knows has less than 4 elements in it it will add the move with a message
	# If the moveset the pokemon knows has 4 elements in it, it will prompt the user if they want to keep the move or not
	# Movesets are set to have 1-4 elements in them.
	
	def learn_new_move(new_move)
		# Condition if the pokemon knows less than 4 moves
		if @moveset.length < 4
			puts "#{@pokemon_name} learned #{new_move}!"
			p @moveset.push(new_move)
		# Condition if the pokemon knows 4 moves	
		else
			valid_response= false
			puts "-----------"
			puts "#{@pokemon_name} wants to learn #{new_move} but #{@pokemon_name} already knows 4 moves!"
			puts "Should a move be forgotten to make space for #{new_move} (yes/no)?"

			# Continue asking until user inputs either yes or no
			until valid_response
				answer= gets.chomp
				# Condition for yes: Asks which move they want to forget
				if answer.downcase == 'yes'
					
					puts "Which move should be forgotten?"
					puts @moveset
					
					valid_move= false
					# Until there is a valid response ask for which move they would like to replace with this new move
					until valid_move
						move_to_replace= gets.chomp
						index= @moveset.index(move_to_replace)
						# if the move they want to replace is in the moveset array replace it, print a message and exit the loop
						if index != nil
							@moveset[index]= new_move
							puts "1, 2 and... Poof! #{@pokemon_name} forgot #{move_to_replace} and... #{@pokemon_name} learned #{new_move}!"
							valid_move= true
							valid_response= true
							p @moveset
						# if the move they want to replace is not in the moveset array ask them for it again
						else
							puts "Invalid move, please type in a move"
						end
					end

				# Condition for no: no changes made and exits loop
				elsif answer.downcase == 'no'
					valid_response= true
					puts "#{@pokemon_name} did not learn #{new_move}"
				# Condiiton for invalid response
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
		
		# If they want a nickname ask them what they want the nickname to be
		if want_nickname.downcase== "yes"
			valid_want_nickname= true
			puts "Please type in what nickname you would like to give"
			valid_nickname= false
			# loop until a vaild nickname
			until valid_nickname
				chosen_nickname= gets.chomp
				if chosen_nickname.empty?
					puts "Invalid response"
				else
					valid_nickname= true
				end
			end
		# If they do not want a nickname, set the nickname to the pokemon chosen
		elsif want_nickname.downcase== "no"
			valid_want_nickname= true
			chosen_nickname= chosen_pokemon
		else
			puts "Invalid response"
		end
	end

	# ask for what level they want their pokemon to be only accepting 1-100
	valid_level= false
	puts "What level do you want your pokemon at? (1-100)"
	until valid_level
		chosen_level= gets.to_i
		# if the chosen pokemon level is below 1 ask for it again
		# this will catch if the user did not input an integer as well
		if chosen_level < 1
			puts "Invalid response, This pokemon must be at least level 1"
		# if the chosen pokemon level is above 100 ask again
		elsif chosen_level > 100
			puts "Invalid response, This pokemon's level cannot exceed 100"
		else	
			valid_level= true
		end
	end

	# ask for this pokemon's moveset
	chosen_moveset=[]
	moveset_finish= false
	
	# loop until the moveset is complete, needs at least 1 move and at max 4 moves
	until moveset_finish
		valid_move= false
		puts "Please add a move you want this pokemon to know"
		# input move
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
		# condition if the moveset is not full
		# asks if they would like to add more moves
		if chosen_moveset.length < 4
			puts "Would you like to add another move? (yes/no)"
			valid_yes_no= false
			until valid_yes_no
				more_moves= gets.chomp
				# if they do not want to add more moves exit loops
				if more_moves.downcase == "no"
					valid_yes_no= true
					moveset_finish= true
				# if they want to add more moves
				elsif more_moves.downcase == "yes"
					valid_yes_no= true
				# invalid responses
				else
					puts "Invalid response"
				end
			end
				
		# if the moveset is full
		else
			puts "#{chosen_pokemon} cannot learn any more moves"
			moveset_finish= true
		end
	end

	# Create an instance of Pokemon class with the fields inputed by the user
	instance_pokemon= Pokemon.new(chosen_pokemon,chosen_nickname,chosen_level,chosen_moveset)

end

finished= false
pokemon_array= []

# loop through allowing user to create as many pokemon as they want
until finished
	# call method pokemon creator and store the pokemon class in pokemon array while printing it
	p pokemon_array.push(pokemon_creator)

	# loop asking if they are finished 
	puts "Are you finished adding pokemon? (yes/no)"
	valid_responser= false

	until valid_responser
		answer=gets.chomp
		# finished adding
		if answer.downcase == 'yes'
			finished = true
			valid_responser= true
		# continue adding
		elsif answer.downcase == 'no'
			valid_responser= true
		# invalid response
		else
			puts "Invalid response"
		end
	end

end

# Iterate through the pokemon array calling methods and printing their attributes
pokemon_array.length.times do |i| 
	# call method i choose you
	puts pokemon_array[i].i_choose_you
	# call method level up
	pokemon_array[i].level_up
	# call method learn new move to learn Ice Beam 
	pokemon_array[i].learn_new_move("Ice Beam")
	# Prints the updated pokemon class of the current instance pokemon
	puts "#{pokemon_array[i].pokemon_name} has a nickname of #{pokemon_array[i].nickname}, is level #{pokemon_array[i].level}" 
	puts "and knows the following moves: #{pokemon_array[i].moveset}"
end