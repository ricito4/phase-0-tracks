classroom = {
	desk_1: {
		name: "Alph",
		content: {
			pens: 4,
			pencils: 2,
			erasers: 2,
			paper_clips: 5			
		},
		clean: true

	},
	desk_2: {
		name: "Betty",
		content: {
			pencils: 3,
			rulers: 1,
			marbles: 0,
			compass: 1
		},
		clean: true
	},
	desk_3: {
		name: "Gammy",
		content: {
			gum: ["Big Red", "Juicy Fruit", "5 Gum", "Bubble Tape"
				],
			jawbreakers: 12,
			chocolate_bars: 3.5,
			spoons: 2
		},
		clean: false
	},

	desk_4: {
		name: "Delan",
		content: {
		},
		clean: false
	}

}

# Print Owner of desk 2
p classroom[:desk_2][:name]
# Print the 4th type of gum in lower case in desk 3
p classroom[:desk_3][:content][:gum][3].downcase
# if desk 4 is empty change clean to true
if classroom[:desk_4][:content].empty?
	p classroom[:desk_4][:clean] = true
end

# Take 1 of each object from desk 1
p "Let's take 1 of each object from #{classroom[:desk_1][:name]}'s desk"
classroom[:desk_1][:content].each do |object, number|
	p "#{object} left: #{number -1}"
end