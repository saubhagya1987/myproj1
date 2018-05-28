
$(document).ready(function(){
  $(".common_unit_selector li").click(function(){
	  $(".common_unit_selector li").removeClass("unit_selected");
      $(this).addClass("unit_selected");
	  select_unit();
	});
	
	function select_unit()
	{
	
	    if($(".k").hasClass("unit_selected"))
		{
	    	$(".dynamic").removeClass("cr_selected");
	    	$(".dynamic").text("");
		}
	    else if($(".lacs").hasClass("unit_selected"))
		{
	    	$(".dynamic").removeClass("cr_selected");
	    	$(".dynamic").text("lacs");	
		}
		else if($(".cr").hasClass("unit_selected"))
		{
			$(".dynamic").text("cr");	
			$(".dynamic").addClass("cr_selected");
		}
	}
});
