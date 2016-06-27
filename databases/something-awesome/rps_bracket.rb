# require gems
require 'sqlite3'
# create new database called rps
data = SQLite3::Database.new( "rps.db" ) 

#clear tables
data.execute("DROP TABLE players")
data.execute("DROP TABLE games")
# Game table
# uses int primary key for unique game number
# the name of the player, the number of games he won
# the name of the other player, the number of games he won
create_game_table_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS games(
		id INTEGER PRIMARY KEY,
		name_1 VARCHAR(255),
		games_won_1 INT,
		name_2 VARCHAR(255),
		games_won_2 INT
	)
SQL

# players table
# uses primary key for unique entrants
# the name of the player and what place he finished in ie "Finished in x place"
create_players_table_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS players(
		id INTEGER PRIMARY KEY,
		name VARCHAR(255),
		placing VARCHAR(255)
	)
SQL

# create tables games and players
data.execute(create_game_table_cmd)
data.execute(create_players_table_cmd)


def player_creator(data_var,name)
	data_var.execute("INSERT INTO players (name,placing) VALUES (?,?)",[name,"no place"])
end

def evaluate_match(data_var,given_name_1,given_name_2,loser_placing)
	valid_match= false
	until valid_match
		puts "How many games did #{given_name_1} win"
		games_1=gets.to_i
		puts "How many games did #{given_name_2} win"
		games_2=gets.to_i
		if games_1== games_2
			puts "One player has to have won more games than the other"
		else
			valid_match= true
		end
	end
	
	# create a row in game table with the information
	data_var.execute("INSERT INTO games (name_1, games_won_1, name_2, games_won_2) VALUES (?,?,?,?)",[given_name_1,games_1,given_name_2,games_2])
	
	# update player who lost's placing
	if games_1 > games_2
		data_var.execute("UPDATE players SET placing = ? WHERE name= ?",[loser_placing,given_name_2])
		return given_name_2
	else
		data_var.execute("UPDATE players SET placing = ? WHERE name= ?",[loser_placing,given_name_1])
		return given_name_1
	end
	
end

puts "Welcome to my rock-paper-scissor tournament"
puts "Select how many players will participate!"
number_players= gets.to_i

puts "Input each unique player's name one line at a time"
name_array= []

number_players.times do |variable|
	
	valid_name= false
	until valid_name
		name= gets.chomp
		if name == "" || name == "placeholder" || name_array.index("#{name}") != nil
			puts "This is an invalid name"
		else
			valid_name= true
		end
	end
	
	name_array << name
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


count=0
while count < name_array.length
	player_creator(data,name_array[count])
	count +=1
end

p loser=evaluate_match(data,"RAY","Jen",7)

# for each round
number_of_rounds.times do
	i = 0 
	while i < name_array.length/2
		i+=1
	end
end
