$(function() {
    $( ".common_dialog" ).dialog({ 
	  modal: true, 
	  width:355,
      height:"auto",
	  autoOpen:false,
	  my: "center",
      at: "center",
      of: window,
	  dialogClass: 'common_dialog_box',
	  /*buttons: {
        Ok: function() {
          $( this ).dialog( "close" );
        },
		Cancel: function() {
          $( this ).dialog( "close" );
        }
      }*/
	   });
	  $('.common_dialog_box .common_dialog').perfectScrollbar(); 
	  $(".ui-dialog-titlebar").hide();
	  $(" <span class='close'>X</span>").insertBefore(".ui-dialog-titlebar");
	  $('.common_dialog_box  .ui-button').addClass("common_btn");
	  $("body").on('click', '.close', function() {
      $( ".common_dialog" ).dialog( "close" );
 });
 
     $(window).resize(function() {
    $(".common_dialog").dialog("option", "position", "center");
});
	
});
