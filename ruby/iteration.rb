def test_method

	puts "This is the start of the test method"

	yield("Richie")


	puts "This is the end of the test method"

end

test_method { |name| puts "Your name is #{name}"}


array_movies = ["Top Gun", "Transformers", "Lego Movie", "Mean Girls"]

hash_actors= {"Tom Cruise" => "Maverick", "Shia LeBuff" => "Transformers Dude", "Morgan Freeman" =>"Oracle", "Lindsey Lohan" => "Nice Girl"}

array_movies.each do |movie|
	puts movie
end

hash_actors.each do |actors,role|
	puts "#{actors}'s best role was #{role}"
end

array_movies.map! do |movie|
	movie+" 2"
end
puts array_movies
puts hash_actors

delete_if { |item| block } → ary
keep_if { |item| block } → ary
select { |item| block } → new_ary

delete_if {| key, value | block } → hsh
keep_if {| key, value | block } → hsh
select {|key, value| block} → a_hash
