def test_method

	puts "This is the start of the test method"

	yield("Richie")


	puts "This is the end of the test method"

end

test_method { |name| puts "Your name is #{name}"}