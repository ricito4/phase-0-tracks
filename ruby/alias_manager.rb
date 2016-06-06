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
# 2. Which alphabet to iterate through
# 3. What index the letter occured at in the alphabet

def the_case(letter)
	upper_vowel= "AEIOU"
	lower_vowel= "aeiou"
	upper_consonant="BCDFGHJKLMNPQRSTVWXYZ"
	lower_consonant="bcdfghjklmnpqrstvwxyz" 

	# initial hash to return
	return_hash= {which_case: "none", alphabet: "none", index: nil}
	
	# Change if letter is upper vowel
	index_letter= upper_vowel.index(letter)
	if index_letter != nil
		return_hash[:which_case]= "upper"
		return_hash[:alphabet]= upper_vowel

	else
		# Change if letter is upper consonant
		index_letter= upper_consonant.index(letter)
		if index_letter != nil
			return_hash[:which_case]= "upper"
			return_hash[:alphabet]= upper_consonant
		else
			# Change if letter is lower vowel
			index_letter= lower_vowel.index(letter)
			if index_letter != nil
				return_hash[:which_case]= "lower"
				return_hash[:alphabet]= lower_vowel
			else
				
				# Change if letter is lower consonant
				index_letter= lower_consonant.index(letter)
				if index_letter != nil
					return_hash[:which_case]= "lower"
					return_hash[:alphabet]= lower_consonant
				end
			end
		end
	end
	# Sets the index number, nil if none
	return_hash[:index]= index_letter
	return return_hash
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
			
			# If the chracter is a letter
			if hash_used[:index] != nil
				# If character is lowercase
				if hash_used[:which_case]== "lower"
					# condition to change z
					if letter == 'z'
						current_name[i]= 'b'
					# condition to change u
					elsif letter == 'u'
						current_name[i]= 'a'
					else
						# condition to change a-y
						current_name[i]= hash_used[:alphabet][hash_used[:index]+1]
					end
				# If character is uppercase
				elsif hash_used[:which_case]== "upper"
					# condition to change Z
					if letter == 'Z'
						current_name[i]= 'B'
					# condition to change U
					elsif letter == 'U'
						current_name[i]= 'A'
					else
						# condition to change A-Y
						current_name[i]= hash_used[:alphabet][hash_used[:index]+1]
					end
				end

			end

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