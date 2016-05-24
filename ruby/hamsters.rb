def hamstersss
	puts "What is the hamster's name?"
	name= gets.chomp
	
	volume = 11;
	while volume > 10 || volume < 1
		puts "On a scale of 1 to 10 how loud is the hamster with 1 being the quietest? Please pick a value in this range"
		volume= gets.to_i
	end
			
	puts "What color fur does the hamster have?"
	fur_color= gets.chomp
	

	placeholder= "not yes"
	while placeholder != "complete"
		puts "Is this hamster a good candidate for adoption? (yes or no)"
		placeholder= gets.chomp

		if placeholder == "yes"
			adoption= true
			placeholder= "complete"
		elsif placeholder == "no"
			adoption= false
			placeholder= "complete"
		end

	end
	
	
	place=0
	while place == 0 
	puts "What is the hamster's estimated age? If you don't know leave this part blank"
		age= gets.to_i
		
		if age == 0
			puts "Are you sure you want to leave this blank? (yes or no)"
			answer= gets.chomp
				if answer == "yes"
					age= nil;
					place =1;
				end
		else
			place=1
		end
	end

	puts "This hamster's name is #{name}"
	puts "#{name}'s noise level is #{volume}"
	puts "#{name}'s fur color is #{fur_color}"
	puts "Adoption status: #{adoption.to_s}"
	if age!= nil
		puts "#{name} is #{age} years old"
	end

end

hamstersss