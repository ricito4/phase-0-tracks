class Santa
	# getter method for ethnicity
	attr_reader :ethnicity
	# getter and setter methods for age and gender
	attr_accessor :age, :gender
	
	# initialize class santa with gender, ethinicity, ranking and age
	def initialize(given_gender,given_ethnicity,given_reindeer,given_age=0)
		"Initializing Santa instance..."
		@gender= given_gender
		@ethnicity= given_ethnicity
		@reindeer_ranking= given_reindeer
		@age= given_age
	end
	
	# method of class santa to print the following line 
	def speak
		p "Ho, ho, ho! Haaaappy holidays!"
	end
	# method of class santa that takes an argument cookie to print the line
	def eat_milk_and_cookies(cookie)
		p "That was a good #{cookie}!"
	end

	# attribute changing methods
	# increase age by 1
	def celebrate_birthday
		@age+= 1
	end

	# puts argument reindeer as the last item in reindeer ranking
	def get_mad_at(reindeer)
		index_number= @reindeer_ranking.index(reindeer)
		@reindeer_ranking.delete_at(index_number)
		@reindeer_ranking.push(reindeer)
	end

end

#initial reindeer rankings
reindeers= ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]

# Initialize an santa 1 instance of Santa to test methods
santa_1 = Santa.new("robot","Plastic-Steel Composite",reindeers,21)
# Class some Santa class methods
santa_1.speak
santa_1.eat_milk_and_cookies("SameSite cookie")

# Call methods that apply to class santa on santa 1
p "This santa is now #{santa_1.celebrate_birthday} years old"
p santa_1.get_mad_at("Vixen")
santa_1.gender= "android"
p santa_1.gender
p santa_1.age
p santa_1.ethnicity

puts '---------'

some_genders = ["genderless candy", "female", "single cell bacteria","male","n/a"]
some_ethnicities = ["Blue sour-patch kid" "gingerbread person" "monochrome","mail","n/a"]

number= 10
number.times do 
	random_gender= some_genders.sample
	random_ethnicity= some_ethnicities.sample
	this_santa = Santa.new(random_gender,random_ethnicity,reindeers)
	this_santa.age= rand(0...141)
	p this_santa
end

