name = ""
volume= ""
fur_color= ""
adoption= ""
age = nil

def hamster_adoption
	
	name_verify= false
	until name_verify
		puts "What is the hamster's name?"
		name= gets.chomp
		if name == ""
			puts "Please give this hamster's name"
		else
			name = name.capitalize
			name_verify= true
		end
	end

	
	vol_verify = false
	until vol_verify
		puts "How loud is the hamster? (1-10)"
		volume= gets.to_f
		if volume <= 10 && volume >= 1
			vol_verify= true
		else
			puts "That is not a valid response"
		end

	end
	
	fur_verify = false
	until fur_verify
		puts "What color fur is the fur?"
		fur_color= gets.chomp
		if fur_color == ""
			puts "Please specify this hamster's fur color"
		else
			fur_verify= true
		end
	end
	

	adopt_verify = false
	until adopt_verify
		puts "Is this hamster a good candidate for adoption? (y/n)"
		adoption= gets.chomp

		if adoption == "y" || adoption == "n"
			adopt_verify= true
		else
			puts "That is not a valid response"
		end
	end
	
	
	age_verify=0
	while age_verify == 0 
		puts "What is the hamster's estimated age?" 
		response= gets.chomp
		
		if response == ""
			puts "Are you sure you want to leave this blank? (y/n)"
			response_two= gets.chomp
				if response_two == "y"
					age= nil;
					age_verify =1;
				end
		else 
			age= response.to_i
			age_verify=1
		end
	end

	puts "This hamster's name is #{name}."
	puts "#{name}'s volume level is #{volume}."
	puts "#{name} has #{fur_color} fur."
	puts "Adoption status: #{adoption}."

	if age == nil
		puts "Age was not specified!"
	else
		puts "#{name} is #{age} years old"
	end
end

hamster_adoption
puts "Thank You For Stopping By!"