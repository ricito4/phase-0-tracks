var color_array = ["blue", "red", "green", "yellow"]; 

var name_array = ["Ted", "Bob", "Joe", "Lucy"]

color_array.push ("teal"); 

name_array.push ("Jenny"); 

console.log(color_array);

console.log(name_array);


var horse_color_object = { }; 

for (var i=0; i < color_array.length; i++) {
  horse_color_object[name_array[i]]= color_array[i];

} 

console.log(horse_color_object); 



function Car(make, model, color, year,isSafeDrive) {
  this.make = make;
  this.model = model;
  this.color = color;
  this.year = year;
  this.isSafeDrive = isSafeDrive;

  this.beep = function() { console.log("Beep!");};

}

var newCar = new Car("Honda", "Civic", "silver", "2003", true); 
newCar.beep(); 

console.log(newCar);

var oldCar = new Car("Volkwagon", "Bug", "white", "2000", false);
oldCar.beep();

console.log(oldCar); 