# For my project I wanted to store the results of a single elimination
# tournament in a database, using a player table and a games table

# When the program is run it will ask the user to input how many people 
# will participate and each of their names.
# Each time the program is run I am removing the past data tables to clear
# past results and creating them again since each time the program is
# run it could have a different number of entrants

# Be warned that you will be asked to input a lot more data if there are
# a lot of people, so i'd recomend testing it with 8 people at first.

# If the number of people is not 2^i number with i being an integer
# (so, 2, 4, 8, 16... and the tournament must have at least 2 people)
# the program will put in computers that will function the same as players
# After inputting all the names and computers the program will randomize
# the names and run through the bracket.

# For each match input the number of games both players have won
# So if Joe won 4 games input 4, and his opponent Jim won 3 games
# It will update the players and games tables with the set count
# and winner, and allow the winner to advance to face the other winners

# Once the last match has concluded, it prints the winner and the placings
# of each participant. Since there are no tie breakers many entrants will
# receieve the highest possible placing they could have received.

# require gems
require 'sqlite3'
# create new database called rps
data = SQLite3::Database.new( "rps.db" ) 

#clear previous tables for a new bracket
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

# Method to add the current player name to the player database 
# Takes data table and current player name as input
def player_creator(data_var,name)
	data_var.execute("INSERT INTO players (name,placing) VALUES (?,?)",[name,"no place"])
end

# Method to evalute the results of the match
# Takes the database, the names of the 2 players facing off
# and the place one of the players will get if they lose

# Updates the players and games tables with the the apropriate information
# Returns the name of the loser

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
	
	# update player who lost's placing and print statments
	# return the name of the loser
	if games_1 > games_2
		puts "#{given_name_1} beats #{given_name_2}, #{games_1} to #{games_2}"
		puts "----------"
		data_var.execute("UPDATE players SET placing = ? WHERE name= ?",["#{loser_placing} place",given_name_2])
		return given_name_2
	else
		puts "#{given_name_2} beats #{given_name_1}, #{games_2} to #{games_1}"
		puts "----------"
		data_var.execute("UPDATE players SET placing = ? WHERE name= ?",["#{loser_placing} place",given_name_1])
		return given_name_1
	end
	
end

# Driver code
puts "Welcome to my tournament results recorder"
# Ask for number of players
puts "Select how many players will participate!"
number_players= gets.to_i

# There must be at least 2 players
if number_players > 1

puts "Input each unique player's name one line at a time. Do not use the name computer."
name_array= []
# Ask user for a unique player name, check to see if it is valid and unique
number_players.times do |variable|
	valid_name= false
	until valid_name
		name= gets.chomp
		if name == "" || name_array.index("#{name}") != nil
			puts "This is an invalid name"
		else
			valid_name= true
		end
	end
	# store it in a name array
	name_array << name
end

# find how many rounds it will take
# For example a bracket of 8 players would need 3 rounds to complete
finished_rounds= false
i= 0
until finished_rounds
	if 2 ** i >= number_players
		finished_rounds= true
		number_of_rounds=i
	end
	i+= 1
end

# adds computers to make the number of players equal to 2^n with n+=1
# this way the bracket will evaluate evenly ie, 2, 4, 8, 16 ... etc man tournaments
# computers can win games and sets over players 
if 2 ** number_of_rounds != number_players
	computers_added= (2** number_of_rounds)- number_players
	computers_added.times do |x|
		name_array << "computer #{x}"
	end
end

# change the order of elements in the name array for random seeding
name_array.shuffle!

# Calls the create player method for each name in the name array
# I called it here since I needed to randomize the positions of the 
# placeholders as well as the names
count=0
while count < name_array.length
	player_creator(data,name_array[count])
	count +=1
end


# for each round
# display the round number
number_of_rounds.times do |x|
	puts "----------"
	puts "Round #{x+1}"

	original_array_length= name_array.length 
	# calcluate the place the losers of this round will get
	placing= (original_array_length/2) +1
	
	# loops 2 players at a time to face each other
	i = 0 
	while i < original_array_length/2
		player_1= name_array[i]
		player_2= name_array[i+1]
		puts "#{player_1} vs #{player_2}"
		# Call the evaluate match method to determine a winner and loser
		# Returns the loser of the match
		loser=evaluate_match(data,player_1,player_2,placing)
		# Delete the instance of loser from the name_array
		# Since all the names are unique we do not have to worry about duplicates
		name_array.delete(loser)
		i+=1
	end
	if x+1 == number_of_rounds
		data.execute("UPDATE players SET placing = ? WHERE name= ?",["#{1} place",name_array[0]])
	end	
end

# prints the winner
puts "#{name_array[0]} is the winner!"
player_data= data.execute("SELECT * FROM players")
player_data.length.times do |x|
	puts "#{player_data[x][1]} came in #{player_data[x][2]}"
end

end