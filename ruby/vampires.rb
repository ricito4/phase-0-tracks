def questioning
	# number of times to take survey
	puts "How many times should the survey be taken? (1, 2... etc)"
	times= gets.to_i
	# loop for give amount of times
	for i in 1..times
		# valid response checkers
		valid_name= false
		valid_age= false
		valid_year= false
		valid_bread= false
		valid_insure= false
		finish_allergy= false
		
		# Asks for name
		puts "What is your name?"
		until valid_name
			name= gets.chomp
			if name == ""
				puts "Please enter your name"
			else
				name= name.capitalize
				valid_name= true
			end
		end

		# Asks for age
		puts "How old are you?"
		until valid_age
			age= gets.chomp
			if age == ""
				puts "Please enter your age"
			else
				age= age.to_i
				valid_age= true
			end
		end

		# Asks for year of birth
		puts "What year were you born?"
		until valid_year
			year= gets.chomp
			if year== ""
				puts "Please enter your year of birth"
			else
				year= year.to_i
				valid_year= true
			end
		end

		# Asks if they want garlic bread
		puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"		
		until valid_bread
			bread= gets.chomp
			if bread == 'y' || bread == 'n'
				valid_bread= true
			else
				puts "This is not a valid response"
			end
		end
		
		# Asks if they want health insurance
		puts "Would you like to enroll in the company’s health insurance? (y/n)"	
		until valid_insure
			insure= gets.chomp
			if insure == 'y' || insure == 'n'
				valid_insure= true
			else
				puts "This is not a valid response"
			end
		end

		# Checks allergies for sunshine
		sign= "no"
		puts "Do you have any allergies? (y/n)"
		until finish_allergy
			allergy_question=gets.chomp
			if allergy_question == 'n'
				finish_allergy = true
			elsif allergy_question == 'y'
				puts "Please list what allergy you have"
				allergy=gets.chomp
				allergy=allergy.downcase
				if allergy == "sunshine"
					sign= "yes"
				end
				puts "Do you have any other allergies? (y/n)"
			else 
				puts "This is not a valid response"
			end
		end

		
		# variables used for conditions
		response= "Results inconclusive"
		calculated_age= 2016-year
		
		# condition if they responded with an allergy to sunshine
		if sign == "yes"
			response = "Probably a vampire"
		else
			# 2 conditions for age since maybe their birthday has not occured this year
			# Condition 1
			if (age == calculated_age || age == calculated_age-1) && (bread== "y" || insure== "y")
				response = "Probably not a vampire."
	
			# Condition 2
			elsif (age > calculated_age || age < calculated_age-1) && (bread== "n" || insure== "n")
				response = "Probably a vampire."
	
			# Condition 3
			elsif (age > calculated_age || age < calculated_age-1) && (bread== "n" && insure== "n")
				response = "Almost certainly a vampire."

			# Condition 4
			elsif name.downcase == "drake cula" || name.downcase== "tu fang"
				response = "Definitely a vampire."
			end
		end
		# Outputs results of our conditions
		puts name + ": " + response
	end
# Outputs apology
puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
end

questioning