def hamstersss
	puts "What is the hamster's name?"
	name= gets.chomp
	puts "On a scale of 1 to 10 how loud is the hamster with 1 being the quietest?"
	volume= gets.to_i
	puts "What color fur does the hamster have?"
	fur_color= gets.chomp
	puts "Is this hamster a good candidate for adoption? (yes or no)"
	adoption= gets.chomp
	puts "What is the hamster's estimated age? If you don't know leave this part blank"
	age= gets.to_i
		if age == 0
			age= nil;
		end
	puts name
	puts volume
	puts fur_color
	puts adoption
	puts age

end

hamstersss