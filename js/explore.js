// A function that reverses a string
// use the .split method to convert the string into an array
// loop through the string until 1/2 its length
// store the first letter in a variable
// reassign the first letter as the last letter in the string
// assign the last letter in the string as the variable
// as the function continues iterating, reference the 2nd letter and
// 2nd to last letter, 3rd letter and 3rd to last letter and so on 
// For strings with odd numbered lengths, the middle letter will be replaced
// with itself because we set the loop to increment in integers
// rejoin the array into a single string and return it 


function reverse(string) {
	// create an array str that will contain the letters of string
	str= string.split('');
	// loop through the array str
	for (var i = 0; i < str.length/2; i++) {
		tempVar= str[i];
		str[i]= str[str.length-i-1];
		str[str.length-i-1]= tempVar;
	}
	// rejoin the array str into a string that will be returned
	return str.join('');

}

string1 = reverse("hello");
string2 = reverse("Hi I'm Me!")
if (1 == 1) {
	console.log(string1);
	console.log(string2);
}