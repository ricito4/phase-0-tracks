def questioning
	# number of times to take survey
	puts "How many times should the survey be taken?"
	times= gets.to_i
	# loop for give amount of times
	for i in 1..times
		puts "What is your name?"
		name= gets.chomp
		puts "How old are you?"
		age= gets.to_i
		puts "What year were you born?"
		year= gets.to_i
		puts "Our company cafeteria serves garlic bread. Should we order some for you? (Yes or No)"
		bread= gets.chomp
		puts "Would you like to enroll in the company’s health insurance? (Yes or No)"
		insure= gets.chomp
		
		# initialize variables to use for loops
		finished= "no"
		sign= "no"
		# ask for allergies 1 at a time, Checks to see if sunshine is one
		while finished != "done"
			puts "Do you have any allergies? If so list 1 at a time in lowercase please!"
			allergy= gets.chomp
			
			if allergy == "sunshine"
				sign= "yes"
			end
			
			puts "Are you finished? (type 'done' if finished)"
			finished= gets.chomp

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
			if (age == calculated_age || age == calculated_age-1) && (bread== "Yes" || insure== "Yes")
				response = "Probably not a vampire."
			end
			
			# Condition 2
			if (age > calculated_age || age < calculated_age-1) && (bread== "No" || insure== "No")
				response = "Probably a vampire."
			end

			# Condition 3
			if (age > calculated_age || age < calculated_age-1) && (bread== "No" && insure== "No")
				response = "Almost certainly a vampire."
			end

			# Condition 4
			if name == "Drake Cula" || name== "Tu Fang"
				response = "Definitely a vampire."
			end
		end
			puts name + ": " + response
	end
puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
end

questioning