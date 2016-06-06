# First ask user for name, validate that there are spaces
# Split the name up by spaces
# Advance each name to the left by 1 and wrap around
# Split names up into arrays with each letter as 1 element
# Define a method that compares each letter to different alphabets then returns what alphabet it applies to, 
# the index in that alphabet of the letter and whether the alphabet is upper or lowercase
# Compare each letter to the returned array if the index is not nil
# Change the letter to the next letter, if the letter is z, Z, u or U change it correctly
# After looping combine the array
# Store both this array and the original name in a hash as an array
# Ask if they want to continue inputting names, (make this method recursive)
# Iterate through the hash to print who is what alias


# A method that takes a letter and compares it with 4 different alphabets
# It will return a hash with 3 elements:
# 1. Which case the letter is, nil if there is none
# 2. What index the letter occured at in the alphabet. Useful for catching other symbols

def the_case(letter)
	alphabet="abcdefghijklmnopqrstuvwxyz" 

	# initial hash to return
	return_hash= {which_case: "none", index: nil}
	
	# Change if letter is upper vowel
	index_letter= alphabet.index(letter)
	if index_letter != nil
		return_hash[:which_case]= "lower"
	else
		index_letter= alphabet.swapcase.index(letter)
		if index_letter != nil
			return_hash[:which_case]= "upper"
		end
	end
	# Sets the index number, nil if none
	return_hash[:index]= index_letter
	return return_hash
end

def case_changer(letter,what_case,index)
	letter.downcase!
	
	if letter == 'a'
		letter = 'e'
	elsif letter == 'e'
		letter= 'i'
	elsif letter == 'i'
		letter= 'o'
	elsif letter == 'o'
		letter= 'u'
	elsif letter == 'u'
		letter= 'a'
	elsif letter == 'y'
		letter = 'b'
	elsif letter== 'd' || letter == 'h' || letter == 'n' || letter == 't'
		letter.next!.next!
	elsif index != nil
		letter.next!
	end
	
	if what_case == "upper"
		letter.upcase!
	end
	
	return letter
end

		

# Initialize variable for looping
complete= false
name_hash= {}
count=1

until complete

	# Ask for name and gather input
	puts "Please enter Full Name"
	full_name= gets.chomp
	name_array= full_name.split(' ')
	number= name_array.length

	# Method to advance each name 1 index to the left and wrap around
	name_array.each_with_index do |letter,index|
		if index < number-1
			temp= name_array[index]
			name_array[index]=name_array[index+1]
			name_array[index+1]= temp
		end
	end


	# iterate through each string in this array
	name_array.map! do |eachname|
		# Split each string up into an array of single characters and find the length for iteration
		current_name=eachname.split('')
		index_length= current_name.length
		
		# loop through each character
		for i in 0..index_length-1
			letter= current_name[i]
			# Call method to return which alphabet, case and index to use
			hash_used= the_case(letter)
			
			current_name[i]= case_changer(letter,hash_used[:which_case],hash_used[:index])

		end
		# Join the current array of characters together
		eachname= current_name.join('')
	end
	# Join together the arrays into 1 string
	p the_alias =name_array.join(" ")

	# Store the name and alias in the hash and update the count
	name_hash.merge!({"#{count}" => [full_name, the_alias]})
	count+= 1

	# Reset valid response
	valid = false
	# Ask user if they want to continue or quit
	puts "Do you want to continue putting in names or quit? (yes/quit)"
	until valid
		answer= gets.chomp
		# Condition to stop asking and looping
		if answer == 'quit'
			complete= true
			valid= true
		# Condition to continue entering names
		elsif answer == 'yes'
			valid= true
		# Not a valid response
		else
			puts "This is an invalid response"
		end

	end
end

# Iterate through the created hash to print who is what alias
name_hash.each do |number, both_names|
	p "#{both_names[0]} is also known as #{both_names[1]}"
end