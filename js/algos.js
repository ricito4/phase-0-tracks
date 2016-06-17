// first get length of the given array
// set up a for loop that will go to length - 1
// set up an initial variable for the index of the longest string as the 0th index
// iterate through the array comparing the current longest index and ith+1 element in the array to see which is longer using the .length method
// if the ith + 1 is bigger than the ith then set the index to the ith+1
// when finished return the string at the stored index

function longestString(given_array) {
	// get array length for looping and start with the returned index as the first element in the array
	var array_length=given_array.length;
	// if the array is empty return this string else continue
	if (array_length < 1) {
		return "This array is empty"
	}
	else {
		var index_of_longest= 0;
		// if the array is longer than 1 we have to compare
		if (array_length > 1) {
			// iterate till the length of the array - 1 since we are referencing the i+1th element
			for (var i= 0; i < array_length-1; i++) {
				// if the length of the string at the i+1 index is greater than the current longest index, replace it with the i+1 
				if (given_array[i+1].length > given_array[index_of_longest].length) {
					index_of_longest= i+1;
				}
			} 
		}
		// return the longest string in the array
		return given_array[index_of_longest];
	}
}

// a function that takes 2 objects
// sets an initial boolean value to false, we'll change this to true if the conditions are met
// Use a nested loop, the first loop iterates through the elments in the first object
// inside this the first loop is a 2nd loop that will iterate through elements in the 2nd object
// in the second loop compare each iterated item to the current iteration of the first object
// if there are any matches change a boolean value to true, else keep it false

function matchKeyValue(object1,object2) {
	// value to return that changes to true if conditions are met
	var valid = false;
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
// in this loop call random function to generate a string length from 1 to 10 inclusive
// create another for loop from 0 to stringlength-1 
// in this loop call random function to generate a number from 1 to 26
// use this number as an index for alphabet variable to get a random letter
// add it to a string, initially empty, that will be string length long 
// add the completed string to the current element of the array
// return an array of integer number strings

function createRandomExamples(integer) {
	// initialize a variable alphabet to be referenced and an array to be returned
	var alphabet= "abcdefghijklmnopqrstuvwxyz";
	var array_returned= [];
	// for each element the return array is supposed to have, total number = integer
	for(i=0; i < integer; i++) {
		// use random and ceil functions to select a string length between 1-10
		var string_length= Math.ceil((Math.random() * 10));
		// initialize a temporary string that we will add letter to and at the end be added to the return array
		var temporary_string= "";
		// create a random letter string_length number of times and add it to the temporary string
		for (j=0; j < string_length; j++) {
			// call random and ceil functions to select a random index to select a letter in the string alphabet
			letter_random= alphabet[Math.ceil((Math.random() * 26)-1)];
			// add the letter to the temporary string
			temporary_string= temporary_string + letter_random;
		}
		// add the temporary string to the array as the ith element
		array_returned[i]= temporary_string;

	}
	// after complete return the full array
	return array_returned;
	
}


//first method driver code
console.log("Testing First method!");
var array1= ["ab","a","abcd","abc"];
var long1= longestString(array1);
console.log(long1 + " is the longest word in " + array1); // expect "abcd"

var array2= ["Hello","I","Am"];
var long2= longestString(array2);
console.log(long2 + " is the longest word in " + array2); // expect "Hello"

var array3= [];
var long3= longestString(array3);
console.log(long3); // expect printed statement

//second method driver code
console.log("-----------");
console.log("Testing Second Method!");
var dog1 = {name:'Cliford', 'age': 28, isAwake: false}; 
var dog2 = {'name': 'Jake', aged: 28, additional_info: "huh?", isAwake: true}; 
var dog3 = {age: 28, name: 'Cake', isAwake: true};

console.log(matchKeyValue(dog1,dog2)); // expect false 
// while name and isAwake tags were the same, the values were different, while aged and age values are the same, the tags are not
console.log(matchKeyValue(dog1,dog3)); // expect true
// despite the order of the tags in dog1 and dog3 being different the age tag and value match up
console.log(matchKeyValue(dog2,dog3)); // expect true
// despite the order and number of tags being different in dog2 and dog3 the isAwake tag and value match up

//third method driver code
console.log("-----------");
console.log("Testing Third Method!");
//create 10 arrays using the createRandomExamples method and for each call the longestString method
for (k=1; k <= 10; k++) {
	// picks a random number between 1 to 5 to use for createRandomExamples method
	var random_integer= Math.ceil((Math.random() * 5));
	// Call createRandomExamples method to create and store an array
	var temporary_array= createRandomExamples(random_integer);
	// Call longestString method to select the longest string in the array we got from createRandomExamples
	var long_string= longestString(temporary_array);
	console.log(long_string + " is the longest word in array #" + k +": " + temporary_array);
}