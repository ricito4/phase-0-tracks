# First ask user for name, validate that there are spaces
# Swap first and last names
# Split both first and last names up into arrays with each letter as 1 element
# Compare each letter in the array to a lower case consonant or vowel array
# if it returns nil then compare it to an upper case consonant or vowell array
# Change the letter to the next letter, wraps around if it is the last letter
# after looping combine the array
# return array

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
	return_hash= {which_case: "none", alphabet: "none", index: 0}
	
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
	return_hash[:index]= index_letter
	return return_hash
	

end

name_array.map! do |eachname|
	current_name=eachname.split('')
	index_name= current_name.length
	for i in 0..index_name-1
		letter= current_name[i]
		p hash_used= theCase(letter,upper_consonant,upper_vowel,lower_consonant,lower_vowel)
	end



end