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
p name_array= full_name.split(' ')
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

def Case(letter,up_consonants,up_vowels,low_consonants,low_vowels)
	return_hash= {which_case: "", alphabet: "", index: 0}
	index_letter= up_vowels.index(letter)
	if index_letter != nil
		
	else
		index_letter= consonants.index(letter)
		if index_letter != nil
			upper= true
		end


end

name_array.map! do |eachname|
	current_name=eachname.split('')
	index_name= current_name.length
	for i in 0..index_name
		letter= current_name[i]
		index_string= lower_vowel.index(letter)
		
		if index_string== nil
			index_string= lower_consonant.index(letter)
			
			if index_string== nil
			index_string= upper_vowel.index(letter)
				
				if index_string== nil
					index_string= upper_consonant.index(letter)
				end
			end
		end
		if index_string != nil

		end



end