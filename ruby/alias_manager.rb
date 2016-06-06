# First ask user for name, validate that there are spaces
# Split the name up by spaces
# Advance each name to the left by 1 and wrap around
# Split names up into arrays with each letter as 1 element
# Define a method that compares each letter and returns if it is a letter via it's index and what case is used 
# Compare each letter to the returned array if the index is not nil
# Change the letter to the next letter, if the letter is z, Z, u or U change it correctly
# After looping combine the array
# Store both this array and the original name in a hash as an array
# Ask if they want to continue inputting names, (make this method recursive)
# Iterate through the hash to print who is what alias

# A method that splits up a full name into separate strings and switches them around
# Returns a name array with names switched
	
def name_changer(name)
	name_array= name.split(' ')
	number= name_array.length

	# Method to advance each name 1 index to the left and wrap around
	name_array.each_with_index do |letter,index|
		if index < number-1
			temp= name_array[index]
			name_array[index]=name_array[index+1]
			name_array[index+1]= temp
		end
	end
	return name_array
end

# A method that takes a single character string checks if it's upper or lower case 
# and advances it by an appropriate character and returns it
# Vowels are advanced as vowels: A-> E -> I ... etc
# Consonants are advanced as consonants C -> D -> F ... etc
# U and Z loop back to A and B

def letter_advancer(letter)

	alphabet="abcdefghijklmnopqrstuvwxyz" 

	# initial hash to return
	case_string= "not upper"
	
	# Check to see if the letter is upper case, if it is lower or a symbol continue normally
	index_letter= alphabet.index(letter)
	if index_letter == nil
		index_letter= alphabet.swapcase.index(letter)
		if index_letter != nil
			case_string= "upper"
		end
	end

	# Convert the letter to downcase to improve efficiency
	letter.downcase!
	
	# Conditions for vowels or end of alphabet
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
	elsif letter == 'z'
		letter = 'b'
	# If the next letter would be a vowel
	elsif letter== 'd' || letter == 'h' || letter == 'n' || letter == 't'
		letter.next!.next!
	# All other letters that are not symbols
	else
		letter.next!
	end
	# if the letter was upper case change it back
	if case_string == "upper"
		letter.upcase!
	end
	
	return letter
end


# Driver Program to loop through asking for names to change until finished
# Initialize variable for looping
complete= false
name_hash= {}
count=1

until complete

	# Ask for name and gather input
	puts "Please enter Full Name"
	full_name= gets.chomp

	# Call method name_changer to split the name up and switch it around
	name_array= name_changer(full_name)

	# iterate through each name in name_array
	name_array.map! do |eachname|
		# Split each string up into an array of single characters and find the length for iteration
		current_name=eachname.split('')
		index_length= current_name.length

		# iterate through each letter in the current array
		current_name.each_with_index do |letter,index|
			if index < index_length
				letter= current_name[index]
			
				# Call method to advance each letter			
				current_name[index]= letter_advancer(letter)
			end

		end
		# Join the current array of characters together
		eachname= current_name.join('')
	end

	# Join together the arrays into 1 string and print it
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