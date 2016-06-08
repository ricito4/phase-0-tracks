# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # Use .split(" ") to separate list into individual items
  # Iterate using .each to store each element of the array in the hash
  # set default quantity of 1 for each value in the hash
  
  # print the list to the console [can you use one of your other methods here?]
# output: [what data type goes here, array or hash?]

def grocery_list(string_1)
	grocery_array= string_1.split(" ")
	default_value= 1
	grocery_hash= {}

	grocery_array.each do |item|
		grocery_hash[item]= default_value
	end
	p grocery_hash

end

list=grocery_list("eggs bacon ham bread")

# Method to add an item to a list
# input: item name and optional quantity
# steps: use hash["key"] = # we want
# output: the full updated list

def add_item(string,input_hash,quantity=1)
	input_hash[string]= quantity
	input_hash
end

p list= add_item("milk",list)


# Method to remove an item from the list
# input: the key of what we want to delete
# steps: use delete(key)
# output: return the updated hash

def remove_item(string,input_hash)
	input_hash.delete(string)
	input_hash
end

p list = remove_item("bacon",list)

# Method to update the quantity of an item
# input: the key you want to update
# steps: use hash["existing key"] = # we want 
# output: full updated list

def add_quantity(string,input_hash,quantity)
	input_hash[string]= quantity
	input_hash
end

p list = add_quantity("ham",list,2)

# Method to print a list and make it look pretty
# input: our list
# steps: iterate through list and print each line
# print h.each {key, value} puts {what we want to print}
# output: the result printed on screen

def print_list(input_hash)
	input_hash.each do |item, quantity|
	puts "#{item}: #{quantity}"
	end
end

print_list(list)