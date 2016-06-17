// first get length of the given array
// set up a for loop that will go to length - 1
// set up an initial variable for the index of the longest string as the 0th index
// iterate through the array comparing the current longest index and ith+1 element in the array to see which is longer using the .length method
// if the ith + 1 is bigger than the ith then set the index to the ith+1
// when finished return the string at the stored index

function longestString(given_array) {
	// get array length for looping and start with the returned index as the first element in the array
	array_length=given_array.length;
	index_of_longest= 0;
	// iterate till the length of the array - 1 since we are referencing the i+1th element
	for (var i= 0; i < array_length-1; i++) {
		// if the length of the string at the i+1 index is greater than the current longest index, replace it with the i+1 
		if (given_array[i+1].length > given_array[index_of_longest].length) {
			index_of_longest= i+1;
		}
	} 
// return the longest string in the array
return given_array[index_of_longest];
}

// a function that takes 2 objects
// sets an initial boolean value to false, we'll change this to true if the conditions are met
// Use a nested loop, the first loop iterates through the elments in the first object
// inside this the first loop is a 2nd loop that will iterate through elements in the 2nd object
// in the second loop compare each iterated item to the current iteration of the first object
// if there are any matches change a boolean value to true, else keep it false

function matchKeyValue(object1,object2) {
	// value to return that changes to true if conditions are met
	valid = false;
	// iterate through each key value pair in object 1
	for(var key1 in object1) {
		// nested iterate through each key value pair in object 2
		for (var key2 in object2) {
			// if the keys are equal
			if (key1== key2) {
				// if the values at the current keys are equal change valid to true
				if (object1[key1] == object2[key2]) {
					valid=true;
				}
			}
		}
		
	}
	//return if any key value pairs matched
	return valid;
}

// function takes an integer i for length, creates an array of i strings, each string is 1-10 letters long, 
// create an alphabet variable "abcde...yz"
// set a for loop from 0 to i-1
// in this loop call rand function to generate a string length from 1 to 10 inclusive
// create another for loop from 0 to stringlength-1 
// in this loop call rand function to generate a number from 1 to 26
// use this number as an index for alphabet variable to get a random letter
// add it to a string, initially empty, that will be string length long 

//--------------------------------
//first method driver code
console.log("Testing First method!");
var array1= ["ab","a","abcd","abc"];
var long1= longestString(array1);
console.log(long1); // expect "abcd"

var array2= ["Hello","I","Am"];
var long2= longestString(array2);
console.log(long2); // expect "Hello"

var array3= [];
var long3= longestString(array3);
console.log(long3); // expect nothing

//second method driver code
console.log("Testing Second Method!");
var dog1 = {name:'Cliford', 'age': 28, isAwake: false}; 
var dog2 = {'name': 'Jake', aged: 28, isAwake: true}; 
var dog3 = {age: 28, name: 'Cake', isAwake: true};

console.log(matchKeyValue(dog1,dog2)); // expect false
console.log(matchKeyValue(dog1,dog3)); // expect true
console.log(matchKeyValue(dog2,dog3)); // expect true