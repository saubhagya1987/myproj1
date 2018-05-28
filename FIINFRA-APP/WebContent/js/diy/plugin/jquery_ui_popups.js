
$(window).load(function(){
 
/* News dialog box starts*/
 $('#news_dialog').dialog({dialogClass:'common_dialog news_dialog'});
 /* Common dialog box start*/
  $( ".common_dialog .ui-button-text").empty();
  $( ".common_dialog .ui-button-text").append( document.createTextNode( "X" ));
  $(".ui-dialog-titlebar-close ").click(function(){
    $(".overlay").css("display","none");
  });
   /* Common dialog box ends*/
 $( "#news_dialog" ).dialog({ autoOpen: true });
 $("#news_dialog").dialog( "option", "width", 661 );
 $("#news_dialog").dialog({position: { my: 'top', at: 'top+114' }});
  $("#news_dialog li:odd" ).addClass("odd");
  $( "#news_dialog li:nth-child(1),#news_dialog li:nth-child(2)" ).css({'border-top':'none','padding-top':'0'});
  $("#login #media .news").click(function() {
	 $(".slick-slider .slick-next").click();
     $(".overlay").css("display","block");
	  $('.news_dialog').css({'visibility':'visible'}).fadeIn('slow');
	});
	$(".news_dialog .ui-dialog-titlebar-close").click(function() {
     $(".news_dialog" ).fadeOut("slow");
	 }); 
/* News dialog box ends*/
/* Forgot dialog box ends*/
$( "#forget-dialog" ).dialog();
 //	$("#forget-dialog").dialog({position: { my: 'top', at: 'top+114' }});
  $( "#forget-dialog" ).dialog({ autoOpen: true });
 $("#forget-dialog").dialog( "option", "width",700);
  $("#forget-dialog").dialog( "option", "height",386);
//$("#forget-dialog").closest(".ui-dialog ").addClass("forget-dialog");
$('#forget-dialog').dialog({dialogClass:'common_dialog forget-dialog'});
$( ".common_dialog .ui-button-text").empty();
  $( ".common_dialog .ui-button-text").append( document.createTextNode( "X" ));
 
 $(".ui-dialog-titlebar-close ").click(function(){
    $(".overlay").css("display","none");
  });
   $("#login #login_form .forgot").click(function() {
      $(".overlay").css("display","block");
	  $("#forget-dialog #accordion" ).accordion();
	//  $("#accordion" ).accordion(); 
	   $("#forget-dialog #accordion").css({'visibility':'visible','display':'block'});
	   $('.forget-dialog').css({'visibility':'visible','display':'block'}).fadeIn('slow');
	});
	$(".forget-dialog .ui-dialog-titlebar-close").click(function() {
     $(".forget-dialog" ).fadeOut("slow");
	  $("#forget-dialog #accordion").css("display","none");
	 }); 
});
/*-Forgot dialog box ends */

/*-News dialog box starts */
$(document).ready(function() {
 $('#video_dialog').dialog({dialogClass:'common_dialog video_dialog'});
 $("#video_dialog").dialog( "option", "width", 661 );
 $("#video_dialog").dialog({position: { my: 'top', at: 'top+114' }});
 $( ".common_dialog .ui-button-text").empty();
  $( ".common_dialog .ui-button-text").append( document.createTextNode( "X" ));
  $(".ui-dialog-titlebar-close ").click(function(){
    $(".overlay").css("display","none");
  });
 $("#login #media .video").click(function() {
     $(".overlay").css("display","block");
	 $(".video_dialog" ).fadeIn("slow");
	});
	$(".video_dialog .ui-dialog-titlebar-close").click(function() {
    $(".video_dialog" ).fadeOut("slow");
	 }); 
});

/*News dialog box ends */

