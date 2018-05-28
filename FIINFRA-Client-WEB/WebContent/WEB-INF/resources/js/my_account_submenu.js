/***Partner Dashboard Submenu Starts***/
 $(document).ready(function(){

$("#header-strip .short-menu").click(function(){
    $(".partner_dashboard_submenu").fadeToggle("slow");
});

$("#ifa-image").click(function(){
    $(".advisor_submenu").fadeToggle("slow");
});
}) 
$(document).ready(function(e) {
    $(document).click(function() {

        if ($(".partner_dashboard_submenu").css("display") == "block") {
            $(".partner_dashboard_submenu").fadeOut("slow");
        }
    });
    $("#header-strip .short-menu").click(function(e) {
        e.stopPropagation();
    });
    $(document).click(function() {
    if ($(".advisor_submenu").css("display") == "block") {
        $(".advisor_submenu").fadeOut("slow");
    }
});
$("#ifa-image").click(function(e) {
    e.stopPropagation();

});
});
/***Partner Dashboard Submenu Ends***/