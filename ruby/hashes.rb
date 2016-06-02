def design_things
	#initialize hash
	client= {}
	puts "What is your name?"
	client[:name]= gets.chomp
	puts "How old are you?"
	client[:age]= gets.to_i
	puts "Do you like cats? (y/n)"
	cat= gets.chomp
	# change the given values to true, false or nil
	if cat == 'y'
		client[:cats]= true
	elsif cat == 'n'
		client[:cats]= false
	else
		client[:cats]= nil
	end
	puts "How many children do you have?"
	client[:children]= gets.to_i
	puts "What is your favorite shade of blue?"
	client[:blue]= gets.chomp

	# Prints client's fields and asks if they want to make changes
	p client
	puts "If you want to make changes to an item enter the item's field (name, age, none)"
	# What they want to change, none if no changes
	variant= gets.chomp
	# Condition to catch everything besides none
	if variant != "none"
		# Changes it to a symbol and Asks what to change this to
		variant= variant.to_sym
		p variant
		puts "What would you like to change #{variant} to?"
		
		#Strings
		if variant == :name || variant == :blue
			client[variant]= gets.chomp
			p "Strings change"
		
		#Integers
		elsif variant == :age || variant == :children
			client[variant]= gets.to_i
			p "int change"
		
		#Booleans
		elsif variant== :cats
			change= gets.chomp
			p "Bool change"
			if change == "true"
				client[variant]= true
			elsif change == "false"
				client[variant]= false
			else
				p "Invalid response, no changes made."
			end
			
		
		#If they didn't put in a field type
		else
			p "Invalid field type."
		end
	end
	p client
end
design_things

# First initialize the hash for client
# For each item ask them for the item then change the variable type
# Store it in the hash with the corresponding key
# Print the has when finished
# Ask if they want to change something, none if they don't
# if they do ask them to input which key as a string
# Convert it to a symbol and 