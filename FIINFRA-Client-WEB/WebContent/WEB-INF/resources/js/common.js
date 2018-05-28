// JavaScript Document

/* Target type selector Two */   


/**** My Income *****/
$(function () {
    $(".data-graph-income").slider({
        min: 1,
        max: 2,
        step: 1,
        slide: function (event, ui) {
            $("#data-graph .ui-slider-handle").empty();
            if (ui.value == 1) {
                $("#data-graph .ui-slider-handle").css("margin-left", "2px");
                $("#data-graph .ui-slider-handle").text("Data");
			
            } else if (ui.value == 2) {
                $("#data-graph .ui-slider-handle").css("margin-left", "-42px");
               $("#data-graph .ui-slider-handle").text("Graph");
				window.location="\my-income-graph.html";
			
            }
        }

    });
    $("#data-graph .ui-slider-handle").css("margin-left", "2px");
    $("#data-graph .ui-slider-handle").text("Data");

});




$(function () {
    $(".data-graph-income-graph").slider({
        min: 1,
        max: 2,
        step: 1,
        slide: function (event, ui) {
            $("#data-graph .ui-slider-handle").empty();
            if (ui.value == 1) {
                $("#data-graph .ui-slider-handle").css("margin-left", "2px");
                $("#data-graph .ui-slider-handle").text("Data");
				window.location="\my-income.html";
			
            } else if (ui.value == 2) {
                $("#data-graph .ui-slider-handle").css("margin-left", "-42px");
               $("#data-graph .ui-slider-handle").text("Graph");
			    
			
            }
        }

    });
    $("#data-graph .ui-slider-handle").css("margin-left", "2px");
    $("#data-graph .ui-slider-handle").text("Data");
	

});



/***** My Asset *****/
$(function () {
    $(".data-graph-asset").slider({
        min: 1,
        max: 2,
        step: 1,
        slide: function (event, ui) {
            $("#data-graph .ui-slider-handle").empty();
            if (ui.value == 1) {
                $("#data-graph .ui-slider-handle").css("margin-left", "2px");
                $("#data-graph .ui-slider-handle").text("Data");
				
			
            } else if (ui.value == 2) {
                $("#data-graph .ui-slider-handle").css("margin-left", "-42px");
               $("#data-graph .ui-slider-handle").text("Graph");
			    window.location="\my-asset-graph.html";
			
            }
        }

    });
    $("#data-graph .ui-slider-handle").css("margin-left", "2px");
    $("#data-graph .ui-slider-handle").text("Data");

});




$(function () {
    $(".data-graph-asset-graph").slider({
        min: 1,
        max: 2,
        step: 1,
        slide: function (event, ui) {
            $("#data-graph .ui-slider-handle").empty();
            if (ui.value == 1) {
                $("#data-graph .ui-slider-handle").css("margin-left", "2px");
                $("#data-graph .ui-slider-handle").text("Data");
				window.location="\my-asset.html";
			
            } else if (ui.value == 2) {
                $("#data-graph .ui-slider-handle").css("margin-left", "-42px");
               $("#data-graph .ui-slider-handle").text("Graph");
			   
			    
			
            }
        }

    });
    $("#data-graph .ui-slider-handle").css("margin-left", "2px");
    $("#data-graph .ui-slider-handle").text("Data");

});


/***** My Portfolio *****/
$(function () {
    $(".data-graph-portfolio").slider({
        min: 1,
        max: 2,
        step: 1,
        slide: function (event, ui) {
            $("#data-graph .ui-slider-handle").empty();
            if (ui.value == 1) {
                $("#data-graph .ui-slider-handle").css("margin-left", "2px");
                $("#data-graph .ui-slider-handle").text("Data");
				
			
            } else if (ui.value == 2) {
                $("#data-graph .ui-slider-handle").css("margin-left", "-42px");
               $("#data-graph .ui-slider-handle").text("Graph");
			    window.location="\my-loans-graph.html";
			
            }
        }

    });
    $("#data-graph .ui-slider-handle").css("margin-left", "2px");
    $("#data-graph .ui-slider-handle").text("Data");

});




$(function () {
    $(".data-graph-portfolio-graph").slider({
        min: 1,
        max: 2,
        step: 1,
        slide: function (event, ui) {
            $("#data-graph .ui-slider-handle").empty();
            if (ui.value == 1) {
                $("#data-graph .ui-slider-handle").css("margin-left", "2px");
                $("#data-graph .ui-slider-handle").text("Data");
				window.location="\my-portfolio-my-loans.html";
			
            } else if (ui.value == 2) {
                $("#data-graph .ui-slider-handle").css("margin-left", "-42px");
               $("#data-graph .ui-slider-handle").text("Graph");
			   
			    
			
            }
        }

    });
    $("#data-graph .ui-slider-handle").css("margin-left", "2px");
    $("#data-graph .ui-slider-handle").text("Data");

});


/***** My Expenses *****/
$(function () {
    $(".data-graph-expenses").slider({
        min: 1,
        max: 2,
        step: 1,
        slide: function (event, ui) {
            $("#data-graph .ui-slider-handle").empty();
            if (ui.value == 1) {
                $("#data-graph .ui-slider-handle").css("margin-left", "2px");
                $("#data-graph .ui-slider-handle").text("Data");
				
			
            } else if (ui.value == 2) {
                $("#data-graph .ui-slider-handle").css("margin-left", "-42px");
               $("#data-graph .ui-slider-handle").text("Graph");
			   window.location="\my-expenses-graph.html";
			
            }
        }

    });
    $("#data-graph .ui-slider-handle").css("margin-left", "2px");
    $("#data-graph .ui-slider-handle").text("Data");

});




$(function () {
    $(".data-graph-expenses-graph").slider({
        min: 1,
        max: 2,
        step: 1,
        slide: function (event, ui) {
            $("#data-graph .ui-slider-handle").empty();
            if (ui.value == 1) {
                $("#data-graph .ui-slider-handle").css("margin-left", "2px");
                $("#data-graph .ui-slider-handle").text("Data");
				window.location="\my-expenses.html";
			
            } else if (ui.value == 2) {
                $("#data-graph .ui-slider-handle").css("margin-left", "-42px");
               $("#data-graph .ui-slider-handle").text("Graph");
			   
			    
			
            }
        }

    });
    $("#data-graph .ui-slider-handle").css("margin-left", "2px");
    $("#data-graph .ui-slider-handle").text("Data");

});



/* Target type selector Two ends */


