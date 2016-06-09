class Santa
	def initialize(given_gender,given_ethnicity,given_reindeer,given_age=0)
		"Initializing Santa instance..."
		@gender= given_gender
		@ethnicity= given_ethnicity
		@reindeer_ranking= given_reindeer
		@age= given_age
	end
	
	def speak
		p "Ho, ho, ho! Haaaappy holidays!"
	end
	def eat_milk_and_cookies(cookie)
		p "That was a good #{cookie}!"
	end

	# getter methods
	def getting_age
		@age
	end

	def getting_ethnicity
		@ethnicity
	end

	# setter methods
	def celebrate_birthday
		@age+= 1
	end

	def get_mad_at(reindeer)
		index_number= @reindeer_ranking.index(reindeer)
		@reindeer_ranking.delete_at(index_number)
		@reindeer_ranking.push(reindeer)
	end

	def change_gender(new_gender)
		@gender= new_gender
	end

end

reindeers= ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]

# Initialize an santa 1 instance of Santa to test methods
santa_1 = Santa.new("robot","Plastic-Steel Composite",reindeers)
santa_1.speak
santa_1.eat_milk_and_cookies("SameSite cookie")

p "This santa is now #{santa_1.celebrate_birthday} years old"
p santa_1.get_mad_at("Rudolph")

santas= []
some_genders = ["genderless candy", "female", "single cell bacteria","n/a"]
some_ethnicities = ["Blue sour-patch kid" "gingerbread person" "monochrome","n/a"]
some_ages= [0.25, 0.05,0.0001,nil]

some_genders.length.times do |index_number|
	santas << Santa.new(some_genders[index_number],some_ethnicities[index_number],reindeers,some_ages[index_number])
end
p santas