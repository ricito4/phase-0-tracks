# Release 0
def test_method

	puts "This is the start of the test method"
	yield("Richie")
	puts "This is the end of the test method"

end

test_method { |name| puts "Your name is #{name}"}

# Release 1
array_movies = ["Top Gun", "Transformers", "Lego Movie", "Mean Girls"]
hash_actors= {"Tom Cruise" => "Maverick", "Shia LaBeouf" => "Transformers Dude", "Morgan Freeman" =>"Oracle", "Lindsay Lohan" => "Nice Girl"}

# .each for array
puts "This is the array before: #{array_movies}"
array_movies.each do |movie|
	puts movie
end
puts "This is the array after: #{array_movies}"

# .each for hash
puts "This is the hash before: #{hash_actors}"
hash_actors.each do |actors,role|
	puts "#{actors}'s best role was #{role}"
end
puts "This is the hash after: #{hash_actors}"

# .map! for array
puts "This is the array before: #{array_movies}"
array_movies.map! do |movie|
	movie+" 2"
end
puts array_movies
puts "This is the array after: #{array_movies}"


# Release 2
array_nonmeaningful= [0, 12, 4, 8, 6, 2, 0]
# Select or Reject values 
p array_nonmeaningful.reject {|value| value < 7}
p array_nonmeaningful.select {|value| value < 7}
# Same as select and reject but destructive
p array_nonmeaningful.keep_if {|value| value < 11}
p array_nonmeaningful.delete_if {|value| value < 1}
# Drop elements in an array until value > 3
p array_nonmeaningful.drop_while {|value| value > 3}

hash_nonmeaningful= {:first => 0, :second => 12, :third => 4, :fourth => 8, :fifth => 6, :sixth => 2, :seventh => 16}
# Select or Reject values 
p hash_nonmeaningful.reject {|key, value| value < 7}
p hash_nonmeaningful.select {|key, value| value < 7}
# Same as select but destructive
p hash_nonmeaningful.keep_if {|key, value| value < 11}
p hash_nonmeaningful.delete_if {|key, value| value < 1}
# Drop elements in an array until value > 3
p hash_nonmeaningful.drop_while {|key, value| value > 3}
