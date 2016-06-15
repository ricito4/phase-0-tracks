// A function that reverses a string
// loop through the string until 1/2 it's length
// store the first letter in a variable
// reassign the first letter as the last letter in the string
// assign the last letter in the string as the variable


function reverse(string) {
	
	str= string.split('');
	for (var i = 0; i < str.length/2; i++) {
		tempVar= str[i];
		str[i]= str[str.length-i-1];
		str[str.length-i-1]= tempVar;
	}
	return str.join('');

}

string1 = reverse("abcdef");
console.log (string1)