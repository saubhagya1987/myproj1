$(document).ready(function () {
    $(".common_header .top_header .setting").click(function () {
        $(".logout_pop_up").fadeToggle("slow");
        $(".overlay").fadeToggle("slow");
       if ($('#password_change').is(':visible')) {

           // $(".common_header #password_change").hide("slow");
            $(".common_header #password_change").fadeTo("slow", 0);
            $(".common_header #password_change .pass").val("");
        }
		if ($('.common_header .submenu').is(':visible')) {

           // $(".common_header #password_change").hide("slow");
            $(".common_header .submenu").fadeOut("slow", 0);
           
        }




    });
});


$(document).ready(function () {
    $(".logout_pop_up .myaccount_btn").click(function () {
        //$(".common_header .detail .down_arrow").toggleClass("up_arrow");
        $(".submenu").fadeToggle("slow");
        // $(".overlay").fadeToggle("slow");
         if ($('#password_change').is(':visible')) {

                $(".common_header #password_change").hide();
               $(".common_header #password_change").fadeTo("0");
               $(".common_header #password_change .pass").val("");
            }
    });
});



$(document).ready(function () {
    $(".common_header .submenu .chang_pass a").click(function () {
        open_pass_change();
		
		  
    });

    function open_pass_change() {

        $("#dashboard #password_change").fadeToggle("1000");
        $(".common_header #password_change").fadeTo("1000", 1);
        $(".common_header #exist_pass").focus();


    }

});


$(document).ready(function () {
    $(".common_header #cancel,.common_header .submenu .chng_prof,.common_header .submenu .adv_assum,.common_header .submenu .adv_recomm").click(function () {

        close_pass_change();
    });

    function close_pass_change() {

        $(".common_header #password_change").fadeTo("1000", 0);
        $(".common_header #password_change").hide("1000");
    }

});


$(document).ready(function (e) {

    $(document).click(function () {

               $(".common_header .logout_pop_up").hide("1000");
     

        if ($('.common_header .logout_pop_up').css('display') == 'block') {
            $(".overlay").css("display", "none");
        }
        if ($('.common_header .logout_pop_up').css('display') == 'block') {
            $(".common_header .logout_pop_up").css("display", "none");

        }

	   
	   
	   
	   
	    $(".common_header .submenu").hide("1000");
     /*   $(".common_header .logout_pop_up").hide("1000");*/
        //   $(".common_header #password_change").fadeTo("1000", 0);
        //   $(".common_header #password_change").hide("1000");


        if ($('.common_header .submenu').css('display') == 'block') {
            $(".overlay").css("display", "none");
        }
        if ($('.common_header .submenu').css('display') == 'block') {
            $(".common_header .submenu").css("display", "none");

        }

        /* if ($('.common_header .logout_pop_up').css('display') == 'block') {
            $(".overlay").css("display","none");
		    }
			if ($('.common_header .logout_pop_up').css('display') == 'block') {
				alert("closing");
            $(".common_header .logout_pop_up").css("display","none");
				
            }*/

    });

    $(".common_header .top_header .setting,.common_header .logout_pop_up,.common_header .submenu,.common_header #password_change").click(function (e) {
        e.stopPropagation();

    });

});


$(document).ready(function(){

$(".common_header.inner_header .drop_menu").click(function(){
    $(".page_submenu").fadeToggle("slow");
});
$(".common_header .top_header .setting").click(function(){
    $(".page_submenu").fadeOut("slow");
});

}) 

$(document).ready(function (e) {

    $(document).click(function () {
		
  if($(".page_submenu").css("display") == "block") {
          $(".page_submenu").fadeOut("slow");
		 
        }
    
     });
    $(".page_submenu,.common_header.inner_header .drop_menu").click(function (e) {
        e.stopPropagation();
});

});



function validateForm() {
    var x = document.forms["change_password"]["new_pass"].value;
    var y = document.forms["change_password"]["re_pass"].value;
    if (x !== y) {
        //  alert("rong");
        document.forms["change_password"]["re_pass"].value = "";
        $(".re_enter_error").show();
        return false;

    }
}


$(document).ready(function () {
    $(".common_header #password_change .re_pass").focus(function () {

        if ($('.re_enter_error').is(':visible')) {

            $(".re_enter_error").hide();
        }
    });
});

/***Partner Dashboard Submenu Starts***/
 $(document).ready(function(){

$(".common_header.inner_header .drop_menu").click(function(){
    $(".partner_dashboard_submenu").fadeToggle("slow");
});
$(".common_header .top_header .setting").click(function(){
    $(".partner_dashboard_submenu").fadeOut("slow");
});

}) 

$(document).ready(function (e) {

    $(document).click(function () {
		
  if($(".partner_dashboard_submenu").css("display") == "block") {
          $(".partner_dashboard_submenu").fadeOut("slow");
		 
        }
    
     });
    $(".partner_dashboard_submenu,.common_header.inner_header .drop_menu").click(function (e) {
        e.stopPropagation();
});

});
/***Partner Dashboard Submenu Ends***/
/***Combined Submenu Starts***/
 $(document).ready(function(){

$(".common_header.inner_header .drop_menu").click(function(){
    $(".combined_submenu").fadeToggle("slow");
});
$(".common_header .top_header .setting").click(function(){
    $(".combined_submenu").fadeOut("slow");
	$(".Advice_Assump_Menu").fadeOut("slow");
});

}) 

$(document).ready(function (e) {

    $(document).click(function () {
		
  if($(".combined_submenu").css("display") == "block") {
          $(".combined_submenu").fadeOut("slow");
		 
        }
    
     });
    $(".combined_submenu,.common_header.inner_header .drop_menu").click(function (e) {
        e.stopPropagation();
});

});

/***Combined Submenu Ends***/
/***Advice Assumptions Submenu Ends***/
 $(document).ready(function(){

$(".common_ad_ass_selector").click(function(){
    $(".Advice_Assump_Menu").fadeToggle("slow");
});
$(".Advice_Assump_Menu .cancel,.Advice_Assump_Menu .save").click(function(){
    $(".Advice_Assump_Menu").fadeOut("slow");
});
}) 

$(document).ready(function (e) {

    $(document).click(function () {
		
  if($(".Advice_Assump_Menu").css("display") == "block") {
          $(".Advice_Assump_Menu").fadeOut("slow");
		 
        }
    
     });
    $(".Advice_Assump_Menu,.common_ad_ass_selector").click(function (e) {
        e.stopPropagation();
});

});
/***Advice Assumptions Submenu Ends***/


/***Advice Assumptions Submenu Ends***/
 $(document).ready(function(){

$(".allocation").click(function(){
    $(".Goal_Plan_Asset_Menu").fadeToggle("slow");
});
$(".Goal_Plan_Asset_Menu .cancel").click(function(){
    $(".Goal_Plan_Asset_Menu").fadeOut("slow");
});
}) 

$(document).ready(function (e) {

    $(document).click(function () {
		
  if($(".Goal_Plan_Asset_Menu").css("display") == "block") {
          $(".Goal_Plan_Asset_Menu").fadeOut("slow");
		 
        }
    
     });
    $(".Goal_Plan_Asset_Menu,.allocation").click(function (e) {
        e.stopPropagation();
});

});
/***Advice Assumptions Submenu Ends***/