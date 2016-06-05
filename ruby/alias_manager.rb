# First ask user for name, validate that there are spaces
# Split the name up by spaces
# Advance each name to the left by 1 and wrap around
# Split names up into arrays with each letter as 1 element
# Define a method that compares each letter to different alphabets then returns what alphabet it applies to, 
# the index in that alphabet of the letter and whether the alphabet is upper or lowercase
# Compare each letter to the returned array if the index is not nil
# Change the letter to the next letter, if the letter is z or Z change it to a or A
# after looping combine the array
# Store both in an array


complete= false
name_hash= {}
count=0

until complete

	# Ask for name and gather input
	puts "Please enter Full Name"
	full_name= gets.chomp
	name_array= full_name.split(' ')
	number= name_array.length

	# Method to advance each name 1 index to the left and wrap around
	for i in 0..number-1
		if i < number-1
			temp= name_array[i]
			name_array[i]=name_array[i+1]
			name_array[i+1]= temp
		end
	end

	upper_vowel= "AEIOU"
	lower_vowel= "aeiou"
	upper_consonant="BCDFGHJKLMNPQRSTVWXYZ"
	lower_consonant="bcdfghjklmnpqrstvwxyz" 

	# A method that takes a letter and compares it with 4 different alphabets
	# It will return a hash with 3 elements:
	# 1. Which case the letter is, none if there is none
	# 2. Which alphabet to iterate through
	# 3. What index the letter occured at in the alphabet

	def theCase(letter,up_consonants,up_vowels,low_consonants,low_vowels)
		# initial hash to return
		return_hash= {which_case: "none", alphabet: "none", index: nil}
		
		# Change if letter is upper vowel
		index_letter= up_vowels.index(letter)
		if index_letter != nil
			return_hash[:which_case]= "upper"
			return_hash[:alphabet]= up_vowels

		else
			# Change if letter is upper consonant
			index_letter= up_consonants.index(letter)
			if index_letter != nil
				return_hash[:which_case]= "upper"
				return_hash[:alphabet]= up_consonants
			else
				# Change if letter is lower vowel
				index_letter= low_vowels.index(letter)
				if index_letter != nil
					return_hash[:which_case]= "lower"
					return_hash[:alphabet]= low_vowels
				else
					
					# Change if letter is lower consonant
					index_letter= low_consonants.index(letter)
					if index_letter != nil
						return_hash[:which_case]= "lower"
						return_hash[:alphabet]= low_consonants
					end
				end
			end
		end
		# Sets the index number, nil if none
		return_hash[:index]= index_letter
		return return_hash
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
			hash_used= theCase(letter,upper_consonant,upper_vowel,lower_consonant,lower_vowel)
			
			# If the chracter is a letter
			if hash_used[:index] != nil
				# If character is lowercase
				if hash_used[:which_case]== "lower"
					# condition to change z
					if letter == 'z'
						current_name[i]= 'b'
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

	name_hash.merge!({"Real Name #{count}" => full_name, "Alias #{count}" => the_alias})
	count+= 1

	valid = false
	puts "Do you want to quit or continue putting in names? (quit/continue)"
	until valid
		answer= gets.chomp
		if answer == 'quit'
			complete= true
			valid= true
		elsif answer == 'continue'
			valid= true
		else
			puts "This is an invalid response"
		end

	end
end
p name_hash