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

array1= ["ab","a","abcd","abc"];
long1= longestString(array1);
console.log(long1);

array2= ["Hello","I","Am"];
long2= longestString(array2);
console.log(long2);

array3= [];
long3= longestString(array3);
console.log(long3);