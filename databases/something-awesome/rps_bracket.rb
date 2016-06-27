# require gems
require 'sqlite3'
require 'faker'
# create new database called rps
data = SQLite3::Database.new( "rps.db" ) 

# Game table
# uses int primary key for unique game number
# the name of the player, the number of games he won
# the name of the other player, the number of games he won
create_game_table_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS games(
		id INTEGER PRIMARY KEY,
		name_1 INT,
		games_won_1 INT,
		name_2 INT,
		games_won_2 INT,
	)
SQL

# players table
# uses primary key for unique entrants
# the name of the player and what place he finished in ie "Finished in x place"
create_players_table_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS players(
		id INTEGER PRIMARY KEY,
		name INT,
		placing VARCHAR(255),
	)
SQL

puts "Welcome to my rock-paper-scissor tournament"
puts "Select how many players will participate!"
number_players= gets.to_i

puts "Input player names one line at a time"
name_array= []
number_players.times do |variable|
	name_array << gets.chomp
end

# find how many rounds it will take
finished_rounds= false
i= 0
until finished_rounds
	if 2 ** i >= number_players
		finished_rounds= true
		number_of_rounds=i
	end
	i+= 1
end

# adds placeholders to make the number of players equal to 2^n with n+=1
# this way the bracket will evaluate evenly ie, 2, 4, 8, 16 ... etc man tournaments
# if a player meets a placeholder in bracket they automatically advance
if 2 ** number_of_rounds != number_players
	placeholders_added= (2** number_of_rounds)- number_players
	placeholders_added.times do
		name_array << "placeholder"
	end
end

name_array.shuffle!
p name_array

# for each round
number_of_rounds.times do

end

#db.execute(create_game_table_cmd)