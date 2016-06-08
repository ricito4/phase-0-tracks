# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # Use .split(" ") to separate list into individual items
  # Iterate using .each to store each element of the array in the hash
  # set default quantity of 1 for each value in the hash
  # print the list to the console [can you use one of your other methods here?]
# output: [what data type goes here, array or hash?]

def grocery_list(full_grocery_lsit)
	grocery_array= full_grocery_lsit.split(" ")
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

def add_item(new_item,groceries,quantity=1)
	groceries[new_item]= quantity
	groceries
end

p list= add_item("milk",list)


# Method to remove an item from the list
# input: the key of what we want to delete
# steps: use delete(key)
# output: return the updated hash

def remove_item(unwanted_item,groceries)
	groceries.delete(unwanted_item)
	groceries
end

p list = remove_item("bacon",list)

# Method to update the quantity of an item
# input: the key you want to update
# steps: use hash["existing key"] = # we want 
# output: full updated list

def add_quantity(item_of_interest,groceries,quantity)
	groceries[item_of_interest]= quantity
	groceries
end

p list = add_quantity("ham",list,2)

# Method to print a list and make it look pretty
# input: our list
# steps: iterate through list and print each line
# print h.each {key, value} puts {what we want to print}
# output: the result printed on screen

def print_list(groceries)
	groceries.each do |item, quantity|
	puts "#{item}: #{quantity}"
	end
end

print_list(list)

# Reflect Section
# I learned that pseudo code can be more specific to what methods you 
# would use and how you would implement them.

# While an array might be easier to iterate through with easier syntax
# the hash can reference specific items easier without looking for an 
# index number

# A method can return any value you want with a return statement. Without
# one it will return the last line that was executed in the method

# You can pass many different arguments as long as you reference them
# correctly in the method. For example use string methods for a string arguement.

# One way you could pass information is by storing it in a variable or data
# structure and then calling that variable or data structure in another method.
# Another way would be to call a method within a method.

# I got more comfortable using ruby style iteration with .each to iterate through
# hashes and arrays.

# I just need to familiarize myself with ruby sytnax more. Understanding what methods
# apply to what, and how to reference things in hashs.

# I worked with Jacob Golding for this GPS