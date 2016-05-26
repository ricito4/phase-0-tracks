def encrypt(string1)
counter= 0
final_word=""
alphabet= "abcdefghijklmnopqrstuvwxyz"
while counter < string1.length
	letter= string1[counter]
	index_alph=alphabet.index(letter)
		if index_alph == 25
			letter= "a"
		elsif index_alph != nil
			letter= alphabet[index_alph+1]
		end
	
	final_word= final_word+letter
	counter += 1
	
end
p final_word
end

def decrypt(string1)
counter= 0
final_word=""
alphabet= "abcdefghijklmnopqrstuvwxyz"
while counter < string1.length
	letter= string1[counter]
	index_alph=alphabet.index(letter)
		if index_alph == 0
			letter= "z"
		elsif index_alph != nil
			letter= alphabet[index_alph-1]
		end
	
	final_word= final_word+letter
	counter += 1
	
end
p final_word
end

valid_response= false
puts "Would you like to decrept or encrypt a password? (encrypt/decrypt)"
until valid_response
	answer=gets.chomp
	if answer== "encrypt" || answer== "decrypt"
		valid_response=true
		puts "Type in a password"
		password= gets.chomp
		
		if answer=="encrypt"
			encrypt(password)
		elsif answer== "decrypt"
			decrypt(password)
		end
	else
		puts "This is not a valid response"
	end
end

#decrypt(encrypt(string1))
exit!