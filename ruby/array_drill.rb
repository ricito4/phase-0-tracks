def build_array(arg1, arg2, arg3)
  print_array = [arg1, arg2, arg3]
end

def add_to_array(arr, item)
  print_arr += [item]
end

test_array = []

p test_array

test_array += ["a", "b", "c", "d", "e"]

p test_array

test_array.delete_at(2)

p test_array

test_array.insert(2, "f")

p test_array

test_array = test_array.drop(1)

p test_array

if test_array.include?("a")
  p "The array does include 'a'"
else
  p "The array does not include 'a'"
end

second_array = [5, 6, 7, 8]

combined_array = test_array + second_array

p combined_array

p build_array("a",1,true)

p add_to_array(["a", "b", "c", 1, 2], 3)

p add_to_array([], "a")

p add_to_array([nil, true, "a", 1], "blue")