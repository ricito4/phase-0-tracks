def questioning
	puts "How many times should the survey be taken?"
	times= gets.to_i
		for i in 1..times
		puts "What is your name?"
		name= gets.chomp
		puts "How old are you?"
		age= gets.to_i
		puts "What year were you born?"
		year= gets.to_i
		puts "Our company cafeteria serves garlic bread. Should we order some for you?"
		bread= gets.chomp
		puts "Would you like to enroll in the company’s health insurance?"
		insure= gets.chomp

		response= "Results inconclusive"
		current_year= 2016
		
		# 2 conditions for age since maybe their birthday has not occured this year
		# Condition 1
		if (current_year-age = year || current_year-age = year+1) && (bread== "Yes" || insure== "Yes")
			response = "Probably not a vampire."
		end
		
		# Condition 2
		if (current_year-age != year || current_year-age != year+1) && (bread== "No" || insure== "No")
			response = "Probably a vampire."
		end

		# Condition 3
		if (current_year-age != year || current_year-age != year+1) && (bread== "No" && insure== "No")
			response = "Almost certainly a vampire."
		end

		# Condition 4
		if name == "Drake Cula" || name== "Tu Fang"
			response = "Definitely a vampire."
		end
		puts name + ": " + response
	end

end

questioning