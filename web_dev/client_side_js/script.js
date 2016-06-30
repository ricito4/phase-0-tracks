console.log("please print :)");

var cat_photo= document.getElementById("photo");
var paragraph_text= document.getElementById("paragraph");

function changeBorder() {
	cat_photo.style.border="2px solid pink";
}

function changeText() {
	paragraph_text.style.color= "green";
}

cat_photo.addEventListener("click", changeBorder);
paragraph_text.addEventListener("mousemove", changeText);