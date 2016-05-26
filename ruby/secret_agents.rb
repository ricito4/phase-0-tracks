# Encrypt Method
def encrypt(string1)

# initalize variables for looping
counter= 0
final_word=""
# lowercase and uppercase alphabet for referencing letters before and after 
alphabet_lower="abcdefghijklmnopqrstuvwxyz"
alphabet_upper="ABCEDEFGHIJKLMNOPQRSTUVWXYZ"

# loop through until the end of the string
while counter < string1.length
	# search for index of the current letter in alphabet
	letter= string1[counter]
	index_alph=alphabet.index(letter)
		# condition for the letter z
		if index_alph == 25
			letter= "a"
		# condition to catch all other letters they return as nil otherwise
		elsif index_alph != nil
			letter= alphabet[index_alph+1]
		end
	# create our final word to be returned
	final_word= final_word+letter
	counter += 1
	
end
# print and return the final encrypted word
p final_word
end

# Decrypt Method
def decrypt(string1)

# initialize variables for looping
counter= 0
final_word=""
# lowercase and uppercase alphabet for referencing letters before and after 
alphabet= "abcdefghijklmnopqrstuvwxyz"
alphabet_upper="ABCEDEFGHIJKLMNOPQRSTUVWXYZ"

# loop through until the end of the string
while counter < string1.length
	# search for index of the current letter in alphabet
	letter= string1[counter]
	index_alph=alphabet.index(letter)
		# condition for the letter a
		if index_alph == 0
			letter= "z"
		# condition to catch all other letters, they return as nil otherwise
		elsif index_alph != nil
			letter= alphabet[index_alph-1]
		end
	# create our final word to be returned
	final_word= final_word+letter
	counter += 1
	
end
# print and return the final encrypted word
p final_word
end

# checks for valid responses
valid_response= false
puts "Would you like to decrept or encrypt a password? (encrypt/decrypt)"
until valid_response
	answer=gets.chomp
	# if it is a valid resonse prompt them to type their password
	if answer== "encrypt" || answer== "decrypt"
		valid_response=true
		puts "Type in a password"
		password= gets.chomp
		# call either encrypt or decrypt
		if answer=="encrypt"
			encrypt(password)
		elsif answer=="decrypt"
			decrypt(password)
		end
	else
		puts "This is not a valid response"
	end
end

#decrypt(encrypt(string1))
exit!