# First ask user for name, validate that there are spaces
# Swap first and last names
# Split both first and last names up into arrays with each letter as 1 element
# Take each element and convert it to lower case, if the change is made then store a temp variable
# Compare each letter in the array to either a consonant array or vowel array
# Change the letter to the next letter, wraps around if it is the last letter
# If the temp variable is changed change character to upper
# after looping combine the array
# return array

puts "Please enter Full Name"
full_name= gets.chomp
p name_array= full_name.split(' ')
number= name_array.length

for i in 0..number-1
	if i < number-1
		temp= name_array[i]
		name_array[i]=name_array[i+1]
		name_array[i+1]= temp
	end
end

name_array.map! do |eachname|
	p current_name=eachname.split('')
end