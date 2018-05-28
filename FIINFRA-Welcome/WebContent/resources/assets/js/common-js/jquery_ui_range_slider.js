/* My Profile - Bank Details Starts */

$(document).ready(function () {
    $("#acct_type").each(function () {
        var radios = $(this).find(":radio").hide();
    });
});
$(function () {
    $("#acct_type").slider({
        min: 1,
        max: 2,
        step: 1,
        slide: function (event, ui) {
            $("#acct_type .ui-slider-handle").empty();
            if (ui.value == 1) {
                $("#acct_type .ui-slider-handle").css("margin-left", "2px");

                $("#acct_type .frist").click();
                var x = $(".frist").val();
                $("#acct_type .ui-slider-handle").append(x);
            } else if (ui.value == 2) {
                $("#acct_type .ui-slider-handle").css("margin-left", "-52px");
                $("#acct_type .second").click();
                var x = $("#acct_type .second").val();
                $("#acct_type .ui-slider-handle").append(x);
            }


        }

    });
    $("#acct_type .ui-slider-handle").css("margin-left", "2px");
    var x = $(".frist").val();
    $("#acct_type .ui-slider-handle").append(x);

});


 
/* My Profile - Bank Details Ends*/



/*** Query Message Page***/
/*Comment Type*/
/* Target type selector */
$(document).ready(function () {
    $("#comment_type").each(function () {
        var radios = $(this).find(":radio").hide();
    });
});
$(function () {
    $("#comment_type").slider({
        min: 1,
        max: 2,
        step: 1,
        slide: function (event, ui) {
            $("#comment_type .ui-slider-handle").empty();
            if (ui.value == 1) {
                $("#comment_type .ui-slider-handle").css("margin-left", "2px");

                $("#comment_type .frist").click();
                var x = $(".frist").val();
                $("#comment_type .ui-slider-handle").append(x);
            } else if (ui.value == 2) {
                $("#comment_type .ui-slider-handle").css("margin-left", "-46px");
                $("#comment_type .second").click();
                var x = $("#comment_type .second").val();
                $("#comment_type .ui-slider-handle").append(x);
            }


        }

    });
    $("#comment_type .ui-slider-handle").css("margin-left", "2px");
    var x = $(".frist").val();
    $("#comment_type .ui-slider-handle").append(x);

});


/* Target type selector ends */

/*Comment Type*/


/* Contact type selector */
$(document).ready(function () {
$(function () {
    $("#contact_type").slider({
        min: 1,
        max: 3,
        step: 1,
        slide: function (event, ui) {
            $("#contact_type .ui-slider-handle").empty();
            if (ui.value == 1) {
                $("#contact_type .ui-slider-handle").css("margin-left", "2px");
				$("#contact_type .ui-slider-handle").text("Opportunity");
            } else if (ui.value == 2) {
                $("#contact_type .ui-slider-handle").css("margin-left", "-25px");
               $("#contact_type .ui-slider-handle").text("Client");
            } else if (ui.value == 3) {
                $("#contact_type .ui-slider-handle").css("margin-left", "-95px");
                $("#contact_type .ui-slider-handle").text("Premium Client");
            }

        }

    });
    $("#contact_type .ui-slider-handle").css("margin-left", "2px");
    $("#contact_type .ui-slider-handle").text("Premium Client");

});
});

/* Contact type selector ends */




/* Add Task Page*/

/* Target type selector*/
/*$(document).ready(function () {
    $("#target_type").each(function () {
        var radios = $(this).find(":radio").hide();
    });
});
$(function () {
    $("#target_type").slider({
        min: 1,
        max: 3,
        step: 1,
        slide: function (event, ui) {
            $("#target_type .ui-slider-handle").empty();
            if (ui.value == 1) {
                $("#target_type .ui-slider-handle").css("margin-left", "2px");

                $("#target_type .frist").click();
                var x = $(".frist").val();
                $("#target_type .ui-slider-handle").append(x);
            } else if (ui.value == 2) {
                $("#target_type .ui-slider-handle").css("margin-left", "-25px");
                $("#target_type .second").click();
                var x = $("#target_type .second").val();
                $("#target_type .ui-slider-handle").append(x);
            } else if (ui.value == 3) {
                $("#target_type .ui-slider-handle").css("margin-left", "-95px");
                $("#target_type .third").click();
                var x = $("#target_type .third").val();
                $("#target_type .ui-slider-handle").append(x);
            }

        }

    });
    $("#target_type .ui-slider-handle").css("margin-left", "2px");
    var x = $(".frist").val();
    $("#target_type .ui-slider-handle").append(x);

});*/


/* Target type selector ends */




/* Target type selector Two */
$(document).ready(function () {
    $("#Contact_type").each(function () {
        var radios = $(this).find(":radio").hide();
    });
});
$(function () {
    $("#Contact_type").slider({
        min: 1,
        max: 2,
        step: 1,
        slide: function (event, ui) {
            $("#Contact_type .ui-slider-handle").empty();
            if (ui.value == 1) {
                $("#Contact_type .ui-slider-handle").css("margin-left", "2px");

                $("#Contact_type .frist").click();
                var x = $(".frist").val();
                $("#Contact_type .ui-slider-handle").append(x);
            } else if (ui.value == 2) {
                $("#Contact_type .ui-slider-handle").css("margin-left", "-25px");
                $("#Contact_type .second").click();
                var x = $("#Contact_type .second").val();
                $("#Contact_type .ui-slider-handle").append(x);
            }
        }

    });
    $("#Contact_type .ui-slider-handle").css("margin-left", "2px");
    var x = $(".frist").val();
    $("#Contact_type .ui-slider-handle").append(x);

});


/* Target type selector Two ends */
/*** Add New Query Page ***/
/* Target type selector Two */
$(document).ready(function () {
   

$(function () {
    $("#Query_for").slider({
        min: 1,
        max: 2,
        step: 1,
        slide: function (event, ui) {
            $("#Query_for .ui-slider-handle").empty();
            if (ui.value == 1) {
                $("#Query_for .ui-slider-handle").css("margin-left", "2px");
                $("#Query_for .ui-slider-handle").text("Self");
				 $("#query li.contact_type").fadeOut("slow");
            } else if (ui.value == 2) {
                $("#Query_for .ui-slider-handle").css("margin-left", "-74px");
               $("#Query_for .ui-slider-handle").text("My Contact");
			    $("#query li.contact_type").fadeIn("slow");
            }
        }

    });
    $("#Query_for .ui-slider-handle").css("margin-left", "2px");
    $("#Query_for .ui-slider-handle").text("Self");

});
});

/* Target type selector Two ends */
/*** Add New Query Page Ends ***/


/*** Common Function For Value Slider Starts ***/

function createSlider(ctrlName, minVal, maxVal, stepBy, ctrlTextBox) {

    $(ctrlName).slider({
        min: minVal,
        max: maxVal,
        step: stepBy,
        slide: function (event, ui) {
            $(ctrlTextBox).val(ui.value);
			
        }
    });
    $(ctrlTextBox).val($(ctrlName).slider("value"));

    $(ctrlTextBox).keyup(function () {
        $(ctrlTextBox).val();
        $(ctrlName).slider('value', $(ctrlTextBox).val());
    });
	
}

/*** Common Function For Value Slider Ends ***/


/*** Goals IFA Partner Dashboard Page Starts ***/
/* Target type selector Two */
$(document).ready(function () {
    $(".btn-toggle").slider({
        min: 1,
        max: 2,
        step: 1,
        slide: function(event, ui) {
            event.stopImmediatePropagation();

            $(this).children('.ui-slider-handle').empty().css({
                'margin-left' : (ui.value == 1 ? '2px' : '-' + ((50 * (ui.value-1)) + 2) + 'px'),
                'left' : '0 !important'
            }).text($(this).children('.lbl').eq(ui.value-1).html());

            $(this).siblings('.pnl-toggle').not(':eq(' + (ui.value -1) + ')').fadeOut("slow");
            $(this).siblings('.pnl-toggle').eq(ui.value-1).fadeIn("slow");
        }
    });
    $(".btn-toggle .ui-slider-handle").css("margin-left", "2px").text('Data');
    $('.goals_list_bx').children('.pnl-toggle').eq(1).hide();
    $('.goals_list_bx').children('.pnl-toggle').eq(3).hide();
    $('.goals_list_bx').children('.pnl-toggle').eq(5).hide();
    $('.goals_list_bx').children('.pnl-toggle').eq(7).hide();
});

/* Target type selector Two ends */
/*** Goals IFA Partner Dashboard Page Ends ***/
