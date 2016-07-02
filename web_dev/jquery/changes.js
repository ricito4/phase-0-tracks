$(document).ready(function(){

    $("#div1").mouseenter(function(){
    	alert("It's in the header");
    });

	$("#text").dblclick(function(){
        $("#div1").fadeIn();
    });

});

$(document).ready(function(){
    
    $("button").click(function(){
    	alert("Clue 1: double click the paragraph below");
    });

 
});