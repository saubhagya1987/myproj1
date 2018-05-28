<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
#page_loader { background: #fff url(${pageContext.request.contextPath}/resources/images/loader.gif) no-repeat center center; }
.page-content{width:100%}
.chosen-container { width:100% !important }
</style>
<!DOCTYPE html>
<html>
<head>
<% 
UserSession user = (UserSession) request.getSession().getAttribute("userSession");
   String theme = PartnerProfileController.getThemePath(user);
%>
<%if(theme != null){ %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
<%} %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<meta name="viewport" content="width=1024">
<title>List of Contacts</title>

<!-- Custom Selectbox starts -->
<script>
$(window).load(function(){
	  $('#page_loader').fadeOut("5000");
	  
	  $(function() {

			$(document).ajaxStop(function() {
				 $('#page_loader').fadeOut();
			});

			$(document).ajaxStart(function() {
				 $('#page_loader').fadeIn();
			});

		});			
});
$(document).ready(function(){
	
	//code to show x-ray activation message
	var isactivated = '${isActivated}';
	var activatedFor = '${activateFor}';
	if(isactivated > 0){
		$("#successDialog").html("");
 		$("#successDialog").html("X-Ray is activated for selected contacts");
 		$( "#successDialog").dialog( "open" );
	}
	else if(activatedFor==1) {
		$("#successDialog").html("");
 		$("#successDialog").html("X-Ray is already activated for some of the contacts. Please de-select and try again! ");
 		$( "#successDialog").dialog( "open" );
	}
	
    $(".wrapper").addClass("new_contacts_wrapper");
    /*$("select").selectBoxIt();*/
	 // Calls the selectBoxIt method on your HTML select box
	$('#genericSearch').placeholder();
    var buttons = $( "#dialog1" ).dialog( "option", "buttons" );
	$("#dialog1").dialog("option", "buttons", [{
   	text: "Ok",
    click: function () {
	   $(this).dialog('close');
   }
      
}]);
	$(document).on("dialogopen", "#dialog1", function(event, ui) {
	setTimeout("$('#dialog1').dialog('close')",3000);
});

    
	$("body").on("click",".legend_btn",function(){
		$(".contact_li").toggleClass("for_tootip_focus");
		if($(".contact_li").hasClass("for_tootip_focus"))
		{
		//$(".legend_btn").text("Hide Legends");
		
       //$(".grid_adjuster").slimScroll({destroy: true});

	
		}
		else
		{
	//	$(".legend_btn").text("Show Legends");	
		//$('.grid_adjuster').slimScroll();
		}
	/* $(".overlay").css("opacity","0.31").fadeIn("fast");
	 $("#legend_dialog").css({"z-index":"2000","height":"36%","width":"60%"}).fadeIn("slow");
	 $("#legend_dialog").animate("slow").css("visibility","visible");*/ var $title1 = $(".goal_base_active_legend");
    if (!$title1.length) {
	$(".indicator_header").append('<span class="custom_title goal_base_active_legend">' + 'Goal Base ' + '</span>');
	//var dis1= $(".contact_li").width() - ($('.goal_base.active').offset().left + $('.goal_base.active').width());
	//alert($('.goal_base.active').offset().left);
	 // $('.goal_base_active_legend').css("left",dis1);
	// var dis1=$('.goal_base.active').offset().left;
	  $(".goal_base_active_legend").offset({left:($('.indicator_header').offset().left)-95});
    } else {
        $title1.remove();
    }
	/*var $title2 = $(".dc_status_inactive_legend");
    if (!$title2.length) {
        $(".dc_status.inactive:eq(1)").closest(".contact_li").append('<span class="custom_title dc_status_inactive_legend">' + $(".dc_status.inactive").attr("title") + '</span>');
	 $(".dc_status_inactive_legend").offset({left:($('.dc_status.inactive').offset().left)-48});	
    } else {
        $title2.remove();
    }
	*/
     var $title3 = $(".dc_status_active_legend");
    if (!$title3.length) {
        $(".indicator_header").append('<span class="custom_title dc_status_active_legend">' + 'Client Portal Status Active' + '</span>');
		 $(".dc_status_active_legend").offset({left:($('.indicator_header').offset().left)-94});	
    } else {
        $title3.remove();
    }
	 var $title4 = $(".autoplan_status_active_legend");
    if (!$title4.length) {
        $(".indicator_header").append('<span class="custom_title autoplan_status_active_legend">' + 'Autoplan' + '</span>');
		 $(".autoplan_status_active_legend").offset({left:($('.indicator_header').offset().left)-94});
    } else {
        $title4.remove();
    }
    
 	
   var $title8 = $(".email_legend");
    if (!$title8.length) {
        $(".header .nine").append('<span class="custom_title email_legend">' + 'Selected Tool' + '</span>');
		 $(".email_legend").offset({left:($('.indicator_header').offset().left)-94});	
    } else {
        $title8.remove();
    }   
    

	 var $title5 = $(".edit_legend");
	
    if (!$title5.length) {
		$(".ten").append('<span class="custom_title edit_legend">' + 'Edit Contact' + '</span>');
		
	$(".edit_legend").offset({left:($('#edit').offset().left)-84});	
    } else {
		 
      $title5.remove();
    }
	 var $title6 = $(".data_collect_legend");
    if (!$title6.length) {
	 $(".ten").append('<span class="custom_title data_collect_legend">' + 'Financial Plan' + '</span>');
    $(".data_collect_legend").offset({left:($('.ten').offset().left)-61});			
    } else {
	
        $title6.remove();
    }
	var $title7 = $(".add_note_legend");
    if (!$title7.length) {
	 $(".ten").append('<span class="custom_title add_note_legend">' + 'View Report' + '</span>');
		 $(".add_note_legend").offset({left:($('.ten').offset().left)-60});	
    } else {
		$title7.remove();
    }
	});
     
	
	 
	 });
	 
    
</script>
<!-- Custom Selectbox Ends -->
<!-- Filter section toggle starts -->
<script>
$(document).ready(function(){
  $("#contact_list .div_dragger").click(function(){
   $("#query_filter").slideToggle("slow");
     $(":selectBox-selectBoxIt").each(function(){
    $(this).data('selectBox-selectBoxIt').refresh();
     });
       
	$(".div_dragger span").animate("slow").toggleClass("div_dragger_up","slow");
	if($(".div_dragger span").hasClass("div_dragger_up"))
	{
	 $("#query_filter #statusSelectBoxIt .selectboxit-text").text("Status");
	 $("#query_filter #typeSelectBoxIt .selectboxit-text").text("Type");
	 $("#query_filter #sourceSelectBoxIt .selectboxit-text").text("Source");
	
	}
  });
});
</script>
<!-- Filter section toggle ends -->
<!-- custom scroll to "common_in_content" -->
<script>
$(document).ready(function(){

	$(".common_custom_modal .close").click(function(){
		//$('.grid_adjuster').slimScroll();
		$(".overlay").fadeOut("slow");
		$ (".common_custom_modal iframe").animate("slow").css("display","none");
		$(".common_custom_modal").animate("slow").css("visibility","hidden");
		});
	
	//for pop up
	var buttons = $( "#dialog1" ).dialog( "option", "buttons" );
	$("#dialog1").dialog("option", "buttons", [{
   	text: "Ok",
    click: function () {
	   $(this).dialog('close');
   }
      
}]);
	$(document).on("dialogopen", "#dialog1", function(event, ui) {
	setTimeout("$('#dialog1').dialog('close')",3000);
});


	  
    //$('.common_in_content').slimScroll();
	//$('.grid_adjuster').slimScroll();
	 $('#contact_list #contacts .name .txt').perfectScrollbar();
	 $('.new_contacts_wrapper #contact_list #contacts .txt').perfectScrollbar();
	  $('#contact_list #contacts .contact_email .email_add').perfectScrollbar();
  });

</script>
<!-- custom scroll to "common_in_content" -->
<!-- Filter section toggle ends -->
<!--White Custom checkbox -->
<script>
$(document).ready(function(){
  $("#contacts").on("click",".white_checkbox",function() {
    $(this).toggleClass("white_checkbox_checkbox_checked");
	
	 if ($(this).next( ".default_checkbox" ).is(":checked")) {
		
       $(this).next( ".default_checkbox" ).prop("checked", false);
    } else {
       $(this).next( ".default_checkbox" ).prop("checked", true);
	
    }
	
  });

  //$('.common_in_content').slimScroll({alwaysVisible: true});
  //$('#frmParterContacts').slimScroll({alwaysVisible: true});
  $('#contact_list #contacts .name .txt').perfectScrollbar();
  $('#contact_list .container .value').perfectScrollbar();
 
});
</script>
<!--White Custom checkbox ends-->

<script>
$(document).ready(function(){
  $("body").on("click","#contact_list #contacts .click_action",function(){
  $("#contact_list #contacts .click_action").not(this).removeClass("action_clicked");
  $(this).toggleClass("action_clicked");
 
  });

});
</script>
<script>
var checkedIds='';
$(document).ready(function(){

	/*$(".grid_adjuster").slimScroll().bind('slimscroll', function(e, pos){
		if(pos =="bottom")
		{
			getMoreContacts();
		}
	});*/

	$(".genericSearch").keypress(function (e) {
	    if (e.keyCode == '13') {
	        e.preventDefault();
	        return false;
	    }
	});

	
	 <!--Add note main menu starts--> 
  $("body").on("click","#contact_list #contacts #add_note",function(e){
	  
	  $("#contact_list #contacts #dc_type_action").slideUp("fast");
	//  alert("clicked");
 //  $("#contact_list #contacts #add_note").not(this).closest(".contact_parent").next("#add_note_actions").slideUp("slow");
  if((!$(this).closest(".contact_parent").next("#add_note_actions").is(':visible')))
   {
   
	var value =  $(this).attr('name');
	if(value==1)
	{
	$("#contact_list #contacts #add_note").not(this).closest(".contact_parent").next("#add_note_actions").slideUp("fast");
	   
		$(this).closest(".contact_parent").next("#add_note_actions").slideDown("slow");  
			
	}
	else
	{  
		$("#contact_list #contacts #add_note_actions").slideUp("fast");
		$("#successDialog").html("");
 		$("#successDialog").html("<spring:message code='error.view.report' />");
 		$( "#successDialog").dialog( "open" );
		return;
	}
	 
   }
   else
   {    
       
	   $(this).closest(".contact_parent").next("#add_note_actions").slideUp("fast");
	  }
   /* $("#add_note_actions").click(function (e) {
        e.stopPropagation();
	});*/
  });
  <!--Dc sub-type Starts -->
   $("html").on("click","#contact_list #contacts #data_collect",function(e){
	  
	 $("#contact_list #contacts #add_note_actions").slideUp("fast");
  if((!$(this).closest(".contact_parent").siblings("#dc_type_action").is(':visible')))
   {
   
$("#contact_list #contacts #data_collect").not(this).closest(".contact_parent").siblings("#dc_type_action").slideUp("fast");
		
		$(this).closest(".contact_parent").siblings("#dc_type_action").slideDown("slow");  
			
	}
	
	  else
   {    
      
	   $(this).closest(".contact_parent").siblings("#dc_type_action").slideUp("fast");
	   
	  }
  
  });
  <!-- Dc sub-type Ends -->
   
    <!--Add note submenu starts--> 
  $("html").on("click","#contact_list #contacts #add_note_actions .main_name",function(){
	
  $("#contact_list #contacts #add_note_actions .main_name").not(this).removeClass("menu_clicked");
   $(this).addClass("menu_clicked");
   $("#contact_list #contacts #add_note_actions .main_name").not(this).next(".note_actions").slideUp("slow");
  // $(this).next(".note_actions").slideDown("slow");
  if(!($(this).next(".note_actions").is(':visible')))
   {
	 $(this).next(".note_actions").slideDown("slow");  
   }
      
  });
  <!--Add note submenu ends --> 
  });
</script>
<script>

var isAscNameSort = true;
var isAscDateeSort = true;
$( "body" ).on( "click","#sort_name",function(){
	//isAscNameSort = !isAscNameSort;
	if(isAscNameSort){
		url = "${pageContext.request.contextPath}/partner/contacts/sort?sortOrder=true&dateSort=false";
		isAscNameSort = !isAscNameSort;
	}else{
		url = "${pageContext.request.contextPath}/partner/contacts/sort?sortOrder=false&dateSort=false";
		isAscNameSort = !isAscNameSort;
	}
	$("#frmParterContacts").ajaxSubmit({		
		url: url,
		type : "POST",
		success : function(data)
		{
			$("ul#contacts").html("");
			sort(data);
		}
	});
});

$( "body" ).on( "click","#sort_date",function(){
	
	isAscNameSort = !isAscNameSort;
	if(isAscNameSort){
		url = "${pageContext.request.contextPath}/partner/contacts/sort?sortOrder=true&dateSort=true";
	}else{
		url = "${pageContext.request.contextPath}/partner/contacts/sort?sortOrder=false&dateSort=true";
	}
	$("#frmParterContacts").ajaxSubmit({		
		url: url,
		type : "POST",
		success : function(data)
		{
			$("ul#contacts").html("");
			sort(data);
		}
	});
});

function getMoreContacts(){
	
	$("#frmParterContacts").ajaxSubmit({
	url: "${pageContext.request.contextPath}/partner/contacts/bringNewRows",
			type : "GET",
	success: function(data){
			sort(data);
	},
			error : function(xhr, status, error) {
		 	}, 
	});
}

function searchContact(){
	$("#searchcontactId").ajaxSubmit({
	
	url: "${pageContext.request.contextPath}/partner/contacts/search",
		type : "GET",
		dataType : "json",
			success: function(data){
				//$('#searchcontactId').attr('action', '${pageContext.request.contextPath}/partner/contacts/search');
				$("ul#contacts").html("");
				if(data == ""){
					$('#totalContactsFound').html("0 ");
					$('#found').css("display","none");
					$('#notfound').css("display","block");
					$("#successDialog").html("");
			 		$("#successDialog").html("<spring:message code='error.contact.noRecordFound'/>");
			 		$( "#successDialog").dialog( "open" );
				}else{
					$('#totalContactsFound').html(data.length);
					$('#found').css("display","block");
					$('#notfound').css("display","none");
					sort(data);
				}
				
			 },
			 error : function(xhr, status, error) {
					 	
			 } 
		});

	}

function sort(data){
	
	 $(data).each(function(index,element){
		var creationDate = convertToDate(element.creationDate);
		var innerHTMML="";
		innerHTMML='<li class="contact_li">';
		innerHTMML=innerHTMML+'<div class="clearfix contact_parent">';
		innerHTMML=innerHTMML+'<div class="first select fl field">';
		innerHTMML=innerHTMML+'<div class="chekbox_parent"> <span class="white_checkbox"></span>';
		innerHTMML=innerHTMML+'<input type="checkbox" value="" id="'+element.partyId+'" name="contact_person" class="default_checkbox">';
		innerHTMML=innerHTMML+'</div>';
		innerHTMML=innerHTMML+'</div>';
		innerHTMML=innerHTMML+'<div class="second name fl field">';
		innerHTMML=innerHTMML+'<div class="txt">'+element.name+'</div>';
		innerHTMML=innerHTMML+'</div>';
		
		innerHTMML=innerHTMML+'<div class="third level fl field">';
		if(element.recordTypeID == 14006){
			innerHTMML=innerHTMML+'<div class="client standard_client"></div>';
        }else if(element.recordTypeID==14005){
        	innerHTMML=innerHTMML+'<div class="client opportunity"></div>';
        }else if(element.recordTypeID==14007){
        	innerHTMML=innerHTMML+'<div class="client pc_client"></div>';
        }			            
		innerHTMML=innerHTMML+'</div>';
		
        innerHTMML=innerHTMML+'<div class="fourth progress fl field">';
        if(element.currentStageId == 7006){
			innerHTMML=innerHTMML+'<div class="circle empty"></div>';
        }else if(element.currentStageId==7001){
        	innerHTMML=innerHTMML+'<div class="circle one_fourth"></div>';
        }else if(element.currentStageId==7007){
        	innerHTMML=innerHTMML+'<div class="circle one_half"></div>';
        }else if(element.currentStageId==7002 || element.currentStageId==7003){
        	innerHTMML=innerHTMML+'<div class="circle three_fourth"></div>';
        }else if(element.currentStageId==7004 || element.currentStageId==7005){
        	innerHTMML=innerHTMML+'<div class="circle complete"></div>';
        }
        innerHTMML=innerHTMML+'</div>';
        
        //innerHTMML=innerHTMML+'<div class="fifth status fl field txt_data">'+element.status+'</div>';
        innerHTMML=innerHTMML+'<div class="sixth phone fl field txt_data">'+element.phoneNumber+'</div>';
       // innerHTMML=innerHTMML+'<div class="seventh create_date fl field txt_data">'+creationDate+'</div>';
        innerHTMML=innerHTMML+'<div class="eight dc_storage fl field txt_data">'+element.dcStage+'</div>';
        innerHTMML=innerHTMML+'<div class="eight_one icon_indicator fl field">';
        if(element.currentStageId==7003) {
        	innerHTMML=innerHTMML+'<div class="goal_base active fl"></div>';
        } else {
        	innerHTMML=innerHTMML+'<div class="goal_base fl"></div>';
        }
		if(element.dcActivation == 1) {        	
        	innerHTMML=innerHTMML+'<div class="dc_status active fl"></div>';
		}
		else {
			innerHTMML=innerHTMML+'<div class="dc_status fl"></div>';
		}   
        if(element.action == 1) {
        	innerHTMML=innerHTMML+'<div class="autoplan_status fl"></div>';
        }else {
        	innerHTMML=innerHTMML+'<div class="autoplan_status active fl"></div>';
        }  
        
        if(element.fpplanTypeId == 522002)
        {
        	innerHTMML=innerHTMML+'<div class="dc_status1 fl tool" title = "Detailed Version"></div>';	
        }
        else if(element.fpplanTypeId == 522001)
        {
        	innerHTMML=innerHTMML+'<div class="dc_status1 fl tool" title = "Basic Version"></div>';
        }
        else
        {
        	innerHTMML=innerHTMML+'<div class="dc_status1 fl tool" title = "Not Selected"></div>';
        }
        
        innerHTMML=innerHTMML+'<div class="clr"></div>';
        innerHTMML=innerHTMML+'</div>';
        innerHTMML=innerHTMML+'<div class="nine contact_email fl field txt_data">';
        innerHTMML=innerHTMML+'<div class="email_add">'+element.emailId+'</div>';
        innerHTMML=innerHTMML+'</div>';
        innerHTMML=innerHTMML+'<div class="ten action fl field">';
        //innerHTMML=innerHTMML+'<div id="action_popup" class="clearfix"> ';
        innerHTMML=innerHTMML+'<div id="action_popup" class="clearfix"> <a href="${pageContext.request.contextPath}/xray/showQuestions?partyID='+element.partyId+'"  class="click_action" id="xray"> <a href="${pageContext.request.contextPath}/partner/edit/'+element.partyId+'/'+element.name+'"  class="click_action" id="edit">';
        if(element.currentStageId==7004 || element.currentStageId==7005) {
        	if(element.fpplanTypeId==522002)
			{ 
				innerHTMML=innerHTMML+'<span class="icon"></span></a> <a href="#"  onClick="showDirectDetailDCTool(' + element.partyId + ',' + element.recordTypeID + ',\'' + element.name + '\','+ element.action +',' + element.autoPlanStatus + ')" class="click_action  listOfContactsDataCollectionLink inactiveLink" id="data_collect"><span class="icon"></span></a>';        		
			}
			else
       		{
        		 innerHTMML=innerHTMML+'<span class="icon"></span></a> <a href="#"  onClick="showToolSelection(' + element.partyId + ',' + element.recordTypeID + ',\'' + element.name + '\','+ element.action +',' + element.autoPlanStatus + ')" class="click_action  listOfContactsDataCollectionLink inactiveLink" id="data_collect"><span class="icon"></span></a>';
       		}
        }else {
        		if(element.fpplanTypeId==522002)
        		{
	        		innerHTMML=innerHTMML+'<span class="icon"></span></a> <a href="#"  onClick="showDirectDetailDCTool(' + element.partyId + ',' + element.recordTypeID + ',\'' + element.name + '\','+ element.action +',' + element.autoPlanStatus + ')" class="click_action  listOfContactsDataCollectionLink" id="data_collect"><span class="icon"></span></a>';        		
        		} 
        	else
        		{
	        		innerHTMML=innerHTMML+'<span class="icon"></span></a> <a href="#"  onClick="showToolSelection(' + element.partyId + ',' + element.recordTypeID + ',\'' + element.name + '\','+ element.action +',' + element.autoPlanStatus + ')" class="click_action  listOfContactsDataCollectionLink" id="data_collect"><span class="icon"></span></a>';		
      			}
        }                   
        innerHTMML=innerHTMML+'<div class="click_action rel" id="add_note" name="'+element.ownerPartyId+'"><span class="icon"></span></div>';
        innerHTMML=innerHTMML+' </div>';
        innerHTMML=innerHTMML+'</div>';
        innerHTMML=innerHTMML+'</div>';
        innerHTMML=innerHTMML+'<div id="add_note_actions">';
        innerHTMML=innerHTMML+'<ul class="reset clearfix">';
        innerHTMML=innerHTMML+'<li id="analysis_report">';
        innerHTMML=innerHTMML+'<div class="main_name">Analysis Report</div>';
        innerHTMML=innerHTMML+'<div class="note_actions clearfix">';
        innerHTMML=innerHTMML+'<div class="first_col phone_no">';
        if( "${isMobile}" == "true" && "${isIpad}" == "true" ){
        	innerHTMML=innerHTMML+'<div class="view" onclick="checkFilePresense(\'analysisC\','+element.partyId+',1,event);generateReports(\'analysisC\','+element.partyId+',1);">View</div>';
        }
        else if( "${isMobile}" == "true" ){
        	innerHTMML=innerHTMML+'<div class="view" onclick="checkFilePresense(\'analysisC\','+element.partyId+',1,event);generateReports(\'analysisC\','+element.partyId+',1);">Download</div>';
        }else{
        	innerHTMML=innerHTMML+'<div class="view" onclick="checkFilePresense(\'analysisC\','+element.partyId+',0,event);generateReports(\'analysisC\','+element.partyId+',0);">View</div>';
        }      
        innerHTMML=innerHTMML+'<div class="email inactiveLink hide">Email</div>';
        innerHTMML=innerHTMML+'</div>';
        innerHTMML=innerHTMML+'</li>';
        innerHTMML=innerHTMML+'<li id="action_plan_cust">';
        innerHTMML=innerHTMML+'<div class="main_name">Action Plan (Contact)</div>';
        innerHTMML=innerHTMML+'<div class="note_actions clearfix">';
        if( "${isMobile}" == "true" && "${isIpad}" == "true" ){
        	innerHTMML=innerHTMML+'<div class="view" onclick="checkFilePresense(\'analysisClient\','+element.partyId+',1,event);generateReports(\'analysisClient\','+element.partyId+',1);">View</div>';
        }
        else if( "${isMobile}" == "true" ){
        	innerHTMML=innerHTMML+'<div class="view" onclick="checkFilePresense(\'analysisClient\','+element.partyId+',1,event);generateReports(\'analysisClient\','+element.partyId+',1);">Download</div>';
        }else{
        	innerHTMML=innerHTMML+'<div class="view" onclick="checkFilePresense(\'analysisClient\','+element.partyId+',0,event);generateReports(\'analysisClient\','+element.partyId+',0);">View</div>';
        }
        innerHTMML=innerHTMML+'<div class="email inactiveLink hide">Email</div>';
        innerHTMML=innerHTMML+'</div>';
        innerHTMML=innerHTMML+'</li>';
        innerHTMML=innerHTMML+'<li id="action_plan_fa">';
        innerHTMML=innerHTMML+'<div class="main_name">Action Plan (FA)</div>';
        innerHTMML=innerHTMML+'<div class="note_actions clearfix">';
        if( "${isMobile}" == "true" && "${isIpad}" == "true" ){
        	innerHTMML=innerHTMML+'<div class="view" onclick="checkFilePresense(\'analysisAdvisor\','+element.partyId+',1,event);generateReports(\'analysisAdvisor\','+element.partyId+',1);">View</div>';
	 	}else if( "${isMobile}" == "true" ){
        	innerHTMML=innerHTMML+'<div class="view" onclick="checkFilePresense(\'analysisAdvisor\','+element.partyId+',1,event);generateReports(\'analysisAdvisor\','+element.partyId+',1);">Download</div>';
        }else{
        	innerHTMML=innerHTMML+'<div class="view" onclick="checkFilePresense(\'analysisAdvisor\','+element.partyId+',0,event);generateReports(\'analysisAdvisor\','+element.partyId+',0);">View</div>';
        }
        innerHTMML=innerHTMML+'<div class="email inactiveLink hide">Email</div>';
        innerHTMML=innerHTMML+'</div>';
        innerHTMML=innerHTMML+'</li>';
        innerHTMML=innerHTMML+'</ul>';
     	innerHTMML=innerHTMML+'</div>';
     	
        innerHTMML=innerHTMML+'</li>';

                
        $("ul#contacts").append(innerHTMML);

        var roleBaseLinks = "${roleBaseLinks}";
    	var links = roleBaseLinks.split(",");
        if(links != ""){
    		for(var i=0;i<links.length;i++){
    			$("."+links[i]).attr("href","#");
    			$("."+links[i]).addClass("inactiveLink");
    			if(links[i].indexOf("save")>-1)
    			{
    				if(document.forms[0] != undefined){
    				document.forms[0].action = "";
    				}
    			}
    		}
    	}
       
	});
	 $('#contact_list #contacts .name .txt').perfectScrollbar();
     $('#contact_list .container .value').perfectScrollbar();

	//close Ifreame
	$(".common_custom_modal .close").click(function(){
		$(".overlay").fadeOut("slow");
		$ (".common_custom_modal iframe").animate("slow").css("display","none");
		$(".common_custom_modal").animate("slow").css("visibility","hidden");
		});
     
 	<!--Add note main menu starts--> 
 	 /* $("#contact_list #contacts #add_note").click(function(e){
 	  $("#contact_list #contacts #add_note").not(this).closest(".contact_parent").next("#add_note_actions").slideUp("slow");
 	  if((!$(this).closest(".contact_parent").next("#add_note_actions").is(':visible')))
 	   {
 	 	   
 		 var value =  $(this).attr('name');
 		if(value==7003)
 		{
 			$(this).closest(".contact_parent").next("#add_note_actions").slideDown("slow");  
 				
 		}
 		else
 		{
 			$("#successDialog").html("");
 	 		$("#successDialog").html("<spring:message code='error.view.report' />");
 	 		$( "#successDialog").dialog( "open" );
 			return;
 		}  
 	   }
 	   else
 	   {
 		   $(this).closest(".contact_parent").next("#add_note_actions").slideUp("slow");
 		  }
 	    $("#add_note_actions").click(function(e) {
 	        e.stopPropagation();
 		});
 	  });*/
 	  <!--Add note main menu  ends -->
 	  
 	 <!--Add note submenu starts--> 
 	  /*$(".main_name").click(function(){
 	   $(".main_name").removeClass("menu_clicked");
 	   $(this).addClass("menu_clicked");
 	   
 	   $(".main_name").next(".note_actions").slideUp("slow");
 	   if((!$(this).next(".note_actions").is(':visible')))
 	   {
 		 $(this).next(".note_actions").slideDown("slow");  
 	   }
 	      
 	  });*/
 	  <!--Add note submenu ends -->

 	//$('.common_in_content').slimScroll();
 	//$('.grid_adjuster').slimScroll();
 	$('#contact_list #contacts .name .txt').perfectScrollbar();
 	$('#contact_list #contacts .contact_email .email_add').perfectScrollbar();	 
 }

//var checkedIds='';
function ConfirmDeletion(){
	$(".custom_title").remove();
	checkedIds='';
	checkedIds =checkedIds+  $(":checkbox:checked").map(function() {
	       return this.id;
	    }).get();
		if(checkedIds !=null && checkedIds!= '' )
			{						
			        $(".overlay").fadeIn("slow");
			    	$("#confirmDialog").fadeIn("slow");				    	
				
			}//END IF
			else {
				$("#dialog1").html("");
		 		$("#dialog1").html("<spring:message code='error.contact.selectContact' />");
		 		$( "#dialog1").dialog( "open" );
				}
	}

function deleteContact(){
	$("#yes").ajaxSubmit({
		url:"${pageContext.request.contextPath}/partner/contact/delete",
		type: "POST",
		data: {'checkedIds':checkedIds},
		success: function(data){
			searchContact();
			}						
	});
	$("#confirmDialog").fadeOut("slow");
	$(".overlay").fadeOut("slow");
	checkedIds='0,'
	$("#successDialog").html("<spring:message code='success.contact.delete' />");
		$( "#successDialog").dialog( "open" );
}

function activateDCT(){
	//var checkedIds='';
	checkedIds =checkedIds+  $(":checkbox:checked").map(function() {
	       return this.id;
	    }).get();
		if(checkedIds !=null && checkedIds!= "" )
			{
				window.location.replace('${pageContext.request.contextPath}/partner/activateDCT?partyId='+checkedIds);
			}//END IF
		else {
			$("#successDialog").html("");
	 		$("#successDialog").html("<spring:message code='error.activateDC.selectContact' />");
	 		$( "#successDialog").dialog( "open" );
		}
			
		
	}
	
function XrayActivation(){
	//var checkedIds='';
	checkedIds =checkedIds+  $(":checkbox:checked").map(function() {
	       return this.id;
	    }).get();
	 if(checkedIds !=null && checkedIds!= "" )
			{
		 		window.location.replace('${pageContext.request.contextPath}/partner/XRayActivation?partyIDs='+checkedIds);
			}
		else {
			$("#successDialog").html("");
	 		$("#successDialog").html("<spring:message code='error.activateXRay.selectContact' />");
	 		$( "#successDialog").dialog( "open" ); 
		}
}	

$( "body" ).on( "click", "#resetCriteria",function(){
	$('#genericSearch').val("");
	$('#genericSearch').placeholder();
	$("#opportunityStatusID").selectBoxIt('selectOption', 0);
	$("#recordTypeID").selectBoxIt('selectOption', 0);
	$("#contactSourceTypeID").selectBoxIt('selectOption', 0);
	searchContact();
});

$( "body" ).on( "click", "#searchContactBtn",function(){
	$(".custom_title").remove();
	if($("#opportunityStatusID").val() == 0 && $("#recordTypeID").val() == 0 && $("#contactSourceTypeID").val() == 0 && $('#genericSearch').val().trim() == '') {
		$("#successDialog").html("Please set atleast one criteria for search");
 		$( "#successDialog").dialog( "open" );
	}
	else {
		searchContact();          
	}
});

function closePopupWebApp(id) {

	$('#common_popup_div').hide();
	$('#' + id).hide();
	$('#shadow_div_web_app').hide();
}

function closeDialog(){
	$(".default_checkbox").attr("checked", false);
	checkedIds = '';
	$(".white_checkbox").removeClass("white_checkbox_checkbox_checked");
	$(".overlay").fadeOut("slow");
	$("#confirmDialog").fadeOut("slow");
}

function closeMoveContactDialog(){
	$(".default_checkbox").attr("checked", false);
	checkedIds = '';
	$(".white_checkbox").removeClass("white_checkbox_checkbox_checked");
	$(".overlay").fadeOut("slow");
	$("#moveContactsDialog").fadeOut("slow");
	$("#life_insurance_methods").fadeOut("slow");
	//$("#life_insurance_methods").animate("slow").css("visibility","visible");
	
}

function convertToDate(timestamp){
	var date = new Date(timestamp);
	var hour = date.getHours();
	var minutes = date.getMinutes();
	var seconds = date.getSeconds();
	var year = date.getFullYear();
	var month = date.getMonth();
	//var day = date.getDay();
	var day = date.getUTCDate()+1;
	/* if(day<10){
		day="0"+day
	} */
	month=getFullMonth(month);
	
	var dateFormat = day+"-"+month+"-"+year; 
	//+"	"+hour+":"+minutes+":"+seconds ;//date+ " " +hour+":"+minutes+":"+seconds;
	
	return dateFormat;
}

function getFullMonth(month){
	if(month==0){
		month="Jan";
	}else if(month==1){
		month="Feb";
	}else if(month==2){
		month="Mar";
	}else if(month==3){
		month="Apr";
	}else if(month==4){
		month="May";
	}else if(month==5){
		month="Jun";
	}else if(month==6){
		month="Jul";
	}else if(month==7){
		month="Aug";
	}else if(month==8){
		month="Sep";
	}else if(month==9){
		month="Oct";
	}else if(month==10){
		month="Nov";
	}else if(month==11){
		month="Dec";
	}
	return month;
}

function showToolSelection(partyId, recordTypeId, name, action, status) {
	var statusFlag = 1;
	if(action == "0") {	
		if(status == '511001')
			statusFlag = 0;	
		
		if(status == '511003') {
			javascript:location.href='${pageContext.request.contextPath}/partner/toolSelection?partyId='+partyId+'&name='+name+'&recordType='+recordTypeId;
		}else {
			javascript:location.href='${pageContext.request.contextPath}/partner/autoPlan/'+partyId+'/'+name+'?statusFlag='+statusFlag;
		}
	}
	else {
		javascript:location.href='${pageContext.request.contextPath}/partner/toolSelection?partyId='+partyId+'&name='+name+'&recordType='+recordTypeId;
	}
} 
function showDirectDetailDCTool(partyId, recordTypeId, name, action, status) 
{

	javascript:location.href='${pageContext.request.contextPath}/partner/datacollection'+"/"+partyId+"/"+name+"/"+recordTypeId;

}
function checkFilePresense(reportFor,partyId,flag,e){
	
	 $("#currentReportName").html("");
		$.ajax({
	        type : "GET",
	        url : "${pageContext.request.contextPath}/partner/report/checkReport/"+reportFor+"/"+partyId,     
	        success : function(result) {
		        if(result == 'file found'){ 
		        	$("#partyId").val(partyId);
		        	$("#reportFor").val(reportFor);			        	
	        	 }else{
	    			displayMsg('Report not generated');
	    			e.preventDefault();
	    		} 
	         },
			error : function(err){
				displayMsg('Report not generated');
				e.preventDefault();
			}
	    });	

	}

	function generateReports(reportFor,partyId,flag){
		
		/* $("#currentReportName").html("");
		$.ajax({
	        type : "GET",
	        url : "${pageContext.request.contextPath}/partner/report/checkReport/"+reportFor+"/"+partyId,     
	        success : function(result) {
		        if(result == 'file found'){ */
		        	$("#partyId").val(partyId);
		        	$("#reportFor").val(reportFor);
		        	if(flag==0){//view report on laptop
		        		$("#downloadAttachmentForm").attr("method","post");
		        		$("#downloadAttachmentForm").attr("action","${pageContext.request.contextPath}/partner/report/generatePDFReport");	
		        	}else{
		        		$("#downloadAttachmentForm").attr("method","post");
		        		$("#downloadAttachmentForm").attr("action","${pageContext.request.contextPath}/partner/report/generatePDFReport1");
		        	}
		        	
		        	$('#downloadAttachmentForm').submit();	
	        	/* }else{
	    			displayMsg('Report not generated');
	    		} */
	        /* },
			error : function(err){
				displayMsg('Report not generated');
			} */
	    //});	

	}
	
	
function moveContacts(){
	checkedIds =checkedIds+  $(":checkbox:checked").map(function() {
	       return this.id;
	    }).get();
	if(checkedIds == ''){
		$("#dialog1").html("");
 		$("#dialog1").html("Please select contacts to moves");
 		$( "#dialog1").dialog( "open" );
	}
	else{
		//$('#jstree').html($('#jstree1').html())
		createGraph();
		 $(".overlay").fadeIn("fast");
		$("#life_insurance_methods").fadeIn("slow");
		$("#life_insurance_methods").animate("slow").css("visibility","visible");
	}
	
}
function displayMsg(msg){
	$("#successDialog").html(msg);
	 $( "#successDialog").dialog( "open" );
}

function showReport(url,partyId){
	//$('.grid_adjuster').slimScroll({destroy: true});
	$.ajax({
        type : "GET",
        url : url,	        
        success : function(result) {
	        	if(result == 'file found'){
	        		if(url.indexOf("analysisAdvisor") >= 0){
	        			$("#video_first_dialog iframe").attr("src","${pageContext.request.contextPath}/partner/report/generatePDFReport/analysisAdvisor/"+partyId);
	        			$('.modal_heading .name').text("Action Plan");
	        			 $(".overlay").fadeIn();
		        		 $("#video_first_dialog").animate("slow").css("visibility","visible");
		        		 $("#video_first_dialog").animate("slow").css("display","block");
		        		 $("#video_first_dialog iframe").animate("slow").css("display","block");
	        		}else if(url.indexOf("analysisClient") >= 0){
	        			 $("#video_first_dialog iframe").attr("src","${pageContext.request.contextPath}/partner/report/generatePDFReport/analysisClient/"+partyId);
	        			 $('.modal_heading .name').text("Action Plan");
	        			 $(".overlay").fadeIn();
		        		 $("#video_first_dialog").animate("slow").css("visibility","visible");
		        		 $("#video_first_dialog").animate("slow").css("display","block");
		        		 $("#video_first_dialog iframe").animate("slow").css("display","block");
	        		}else if(url.indexOf("analysisC") >= 0){
	        			 $("#video_first_dialog iframe").attr("src","${pageContext.request.contextPath}/partner/report/generatePDFReport/analysisC/"+partyId);
	        			 $('.modal_heading .name').text("Analysis Report - Detailed");
	        			 $(".overlay").fadeIn();
		        		 $("#video_first_dialog").animate("slow").css("visibility","visible");
		        		 $("#video_first_dialog").animate("slow").css("display","block");
		        		 $("#video_first_dialog iframe").animate("slow").css("display","block");
	        		}else{
	        		displayMsg('Report not generated');
	        	}
        }
        }    	,
		error : function(err){
//				alert(err);
		}
    });
}

</script>
</head>

<body>

<div id="page_loader"></div>
<!-- Wrapper starts-->
<div class="" id="contact_list_wrapper"> 
  <!-- Main starts-->
  <div class="">
  <section class="main">
  <!-- Header Starts--> 
  
  <!-- Header Ends--> 
  
  <!-- Common_content Starts-->
  <section class="content common_content">
  <%-- <jsp:include page="../layout/submenu_small.jsp"></jsp:include> --%>
  <!-- Common_in_contnet starts-->


	  <section id="contact_list" class="in_content common_in_content clearfix">


<div class="row">
	<div class="col-md-12">
 		 <form:form id="searchcontactId" commandName="searchCriteria">
     <div id="query_filter">
      <ul class="reset clearfix parameters">
      
        <li class="col-md-3">	
		  <div >
          <form:select path="opportunityStatusID" class="chosen-select form-control" id="opportunityStatusID" items="${opportunity}" itemValue="codeValueId" itemLabel="codeValue"> </form:select>
        </div>
        </li>
        
        <li class="col-md-3">
         <div >
          <form:select path="contactSourceTypeID" class="chosen-select form-control" id="contactSourceTypeID" items="${source}"
									itemValue="codeValueId" itemLabel="codeValue"> </form:select>
			</div>
        </li>
        
        <li class="col-md-3">
         <div >        	
          <form:select path="recordTypeID" class="chosen-select form-control" id="recordTypeID" items="${type}" itemValue="codeValueId"
									itemLabel="codeValue"> </form:select>
		 </div>
        </li>
        
        <li class="col-md-3">
         <div >
          <form:input path="genericSearch" class="common_input genericSearch"
									placeholder="Enter First, Last Name, Email or PAN..." />
		 </div>							
        </li>
      </ul>
   <!--    <ul class="reset clearfix action">
        <li>
          <input type="button" value="Reset" class="btn btn-sm btn-pink common_btn" id="resetCriteria">
        </li>
        <li>
          <input type="button" value="Search" class="btn btn-sm btn-pink common_btn" id="searchContactBtn">
        </li>
      </ul> -->
      <div class="space"></div>
      <ul class="col-lg-3 col-lg-offset-9">
             <li class="btn-group">
				<input type="button" value="Search" class="btn btn-pink" id="searchContactBtn">
              </li>
                <li class="btn-group"> 
              <input type="button" value="Reset" class="btn btn-pink" id="resetCriteria"> 
                  </li>                     
      </ul>
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </form:form>
	</div>
</div>


  <div class="div_dragger listOfContactsSearchLink"><span></span></div>
  
  <!-- Sort Starts-->
  <section id="result_sort" class="clearfix">
  <div class="sort" 
  <c:if test='${totalContacts <= 0 }'>style="display: none"</c:if>
  > <span class="txt">Sort by:</span>
 <button class="sort_btn listOfContactsNameSortLink" id="sort_name">Name</button>
  <button class="sort_btn listOfContactsDateSortLink" id="sort_date">Date</button>
  <c:if test="${userSession.headOfNode}">
  	<button class="move_btn listOfMoveContactsLink" id="move_Contacts" onclick="moveContacts()"><i class="ace-icon fa fa-pencil"></i> Move Contacts</button>
  </c:if>
</div>
<!--   <div id="alphabetical_search">
            <ul class="reset clearfix">
              <li>A</li>
              <li>B</li>
              <li>C</li>
              <li>D</li>
              <li>E</li>
              <li>F</li>
              <li>G</li>s
              <li>H</li>
              <li>I</li>
              <li>J</li>
              <li>K</li>
              <li>L</li>
              <li>M</li>
              <li>N</li>
              <li>O</li>
              <li>P</li>
              <li>Q</li>
              <li>R</li>
              <li>S</li>
              <li>T</li>
              <li>U</li>
              <li>V</li>
              <li>W</li>
              <li>X</li>
              <li>Y</li>
              <li>Z</li>
            </ul>
          </div> -->
</section>
<!-- Sort Ends--> 
<!-- Contcts Starts-->

<ul class="reset clearfix fl top_btn">

  <li class="fl"><a href="${pageContext.request.contextPath}/partner/contacts" class="contact_btn_act"><span class="icon"></span>All</a></li>
  
  <li class="fl westspace1 listOfContactsAutoPlanLink"><a href="${pageContext.request.contextPath}/partner/autoPlanList" class="auto_plan_btn"><span class="icon"></span>Auto Plan</a></li>
</ul>
<div class="fr legend_btn header_btn btn btn-sm btn-inverse"><i class="ace-icon fa fa-pencil"></i> Show Legends</div>

<c:choose>
    <c:when test="${totalContacts gt 0}">
      <div class="found" id = "found"> <span class="count" id="totalContactsFound">
        <c:out value="${totalContacts}"></c:out>
        </span> items found, displaying all items. </div>
      <div class="found" id="notfound" style="display:none"> No Record Found. </div>
    </c:when>
    <c:otherwise>
      <div class="found"  id="found"  style="display:none"> <span class="count" id="ContactsFound">
        <c:out value="${totalContacts}"></c:out>
        </span> items found, displaying all items. </div>
      <div class="found" id="notfound"> No Record Found. </div>
    </c:otherwise>
  </c:choose>

<div class="clr"></div>

   <div class="contact_par">                                      
		<section id="contacts">
  <ul class="reset clearfix header">
    <li class="first">&nbsp;</li>
    <li class="second">Name</li>
    <li class="third">Level</li>
    <li class="fourth">Progress</li>
    <li class="sixth">Contact No.</li>
    <!-- <li class="seventh">Creation Date</li> -->
    <li class="eight">FIN Plan Stage</li>
    <li class="eight_one indicator_header">
      <div class="goal_base active fl" title="Goal Base"></div>
      <div class="dc_status active fl" title="Client Portal Status Active"></div>
      <div class="autoplan_status active fl" title="Autoplan"></div>
    </li>
    <li class="nine"> <div class="email_icon active fl" title="Selected Tool"></div> Email</li>
    <li class="ten">Actions</li>
  </ul>
  <form class="form-horizontal" id="frmParterContacts"
						name="frmParterContacts"
						action="<c:url value="${pageContext.request.contextPath}/partner/contacts/sortDummy" />
  " method="POST">
  <input name="partyId" type="hidden" value="${partyId}" />
  <input name="buId" type="hidden" value="${buId}" />
  <input name="sortOrder" id="sortOrder" type="hidden" value="true" />
  <div class="grid_adjuster">
    <ul class="reset clearfix contact_ul" id="contacts" >
      <c:forEach items="${subList}" var="party"
					varStatus="loopCounter">
        <li class="contact_li">
          <div class="clearfix contact_parent">
            <div class="first select fl field">
              <fmt:formatDate pattern="dd-MMM-yyyy" value="${party.creationDate}" var="creationDate"></fmt:formatDate>
              <div class="chekbox_parent"> <span class="white_checkbox"></span>
                <input type="checkbox" value="" id="${party.partyId}" name="contact_person" class="default_checkbox">
              </div>
            </div>
            <div class="second name fl field">
              <div class="txt">${party.name}</div>
              <div class="clr"></div>
            </div>
            <div class="third level fl field">
              <c:choose>
                <c:when test="${party.recordTypeID eq 14006}"><!-- for client -->
                  <div class="client standard_client"></div>
                </c:when>
                <c:when test="${party.recordTypeID eq 14005}"><!-- for opportunity -->
                  <div class="client opportunity"></div>
                </c:when>
                <c:when test="${party.recordTypeID eq 14007}"><!-- for PC -->
                  <div class="client pc_client"></div>
                </c:when>
              </c:choose>
            </div>
            <div class="fourth progress fl field">
              <c:choose>
                <c:when test="${party.currentStageId eq 7006}">
                  <div class="circle empty"></div>
                </c:when>
                <c:when test="${party.currentStageId eq 7001}">
                  <div class="circle one_fourth"></div>
                </c:when>
                <c:when test="${party.currentStageId eq 7007}">
                  <div class="circle one_half"></div>
                </c:when>
                <c:when test="${party.currentStageId eq 7002}">
                  <div class="circle three_fourth"></div>
                </c:when>
                <c:when test="${party.currentStageId eq 7003}">
                  <div class="circle complete"></div>
                </c:when>
              </c:choose>
            </div>
            <div class="sixth phone fl field txt_data">${party.phoneNumber}</div>
            <%-- <div class="seventh create_date fl field txt_data">${creationDate}</div> --%>
            <div class="eight dc_storage fl field txt_data">${party.dcStage}</div>
            <div class="eight_one icon_indicator fl field">
              <c:choose>
                <c:when test="${party.currentStageId==7003}">
                  <div class="goal_base active fl"></div>
                </c:when>
                <c:otherwise>
                  <div class="goal_base fl"></div>
                </c:otherwise>
              </c:choose>
              <c:choose>
                <c:when test="${party.dcActivation == 1}">
                  <div class="dc_status active fl"></div>
                </c:when>
                <c:otherwise>
                  <div class="dc_status fl"></div>
                </c:otherwise>
              </c:choose>
              <c:choose>
                <c:when test="${party.action eq 1}">
                  <div class="autoplan_status fl"></div>
                </c:when>
                <c:otherwise>
                  <div class="autoplan_status active fl"></div>
                </c:otherwise>
              </c:choose>
				<c:choose>
                <c:when test="${party.fpplanTypeId eq 522002}">
                  <div class="dc_status1 fl tool" title = "Detailed Version"></div>
                </c:when>
                 <c:when test="${party.fpplanTypeId eq 522001}">
                  <div class="dc_status1 fl tool" title = "Basic Version"></div>
                </c:when> 
                <c:otherwise>
                  <div class="dc_status1 fl tool" title = "Not Selected"></div>
                </c:otherwise>
              </c:choose>
              <div class="clr"></div>
            </div>
            <div class="nine contact_email fl field txt_data">
              <div class="email_add">${party.emailId}</div>
            </div>
            <div class="ten action fl field">
              <div id="action_popup" class="clearfix"> <a href="${pageContext.request.contextPath}/xray/showQuestions?partyID=${party.partyId}"  class="click_action listOfContactsXray" id="xray" title="X-Ray questions"> <span class="icon"></span></a> <a href="${pageContext.request.contextPath}/partner/edit/${party.partyId}/${party.name}"  class="click_action listOfContactsEditContactLink" id="edit" title="Edit Contact"> <span class="icon"></span></a>
               <c:choose>
              	<c:when test="${party.currentStageId eq 7004 || party.currentStageId eq 7005}">
              	</c:when>
              	<c:otherwise>
              		<c:choose>
	              			<c:when test="${party.autoPlanStatus eq '511003' or party.autoPlanStatus eq '0'}">
									<c:choose>
										<c:when test="${party.fpplanTypeId eq 522002}">
											<a href="${pageContext.request.contextPath}/partner/datacollection/${party.partyId}/${party.name}/${party.recordTypeID}" class="click_action listOfContactsDataCollectionLink" id="data_collect" title="Financial Plan"><span class="icon"></span></a>              		
										</c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath}/partner/toolSelection?partyId=${party.partyId}&name=${party.name}&recordType=${party.recordTypeID}" class="click_action listOfContactsDataCollectionLink" id="data_collect" title="Financial Plan"><span class="icon"></span></a>              		
										</c:otherwise>
									</c:choose>
	              				</c:when>
	              				<c:otherwise>
	              				<c:choose>
										<c:when test="${party.autoPlanStatus eq '511001'}">
											<a href="${pageContext.request.contextPath}/partner/autoPlan/${party.partyId}/${party.name}?statusFlag=0" class="click_action listOfContactsDataCollectionLink" id="data_collect" title="Financial Plan"><span class="icon"></span></a>              		
										</c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath}/partner/autoPlan/${party.partyId}/${party.name}?statusFlag=1" class="click_action listOfContactsDataCollectionLink" id="data_collect" title="Financial Plan"><span class="icon"></span></a>              		
										</c:otherwise>
									</c:choose>	              						              					              			    
	              		    	</c:otherwise>
	              	    </c:choose>		
              		
              	</c:otherwise>
              </c:choose> 
                <div class="click_action rel" id="add_note" name="${party.ownerPartyId}" title="View Report"><span class="icon"></span></div>
                <!--<a href="query.html" class="click_action" id="help"><span class="icon"></span></a>--> </div>
            </div>
          </div>
          <div id="add_note_actions">
            <ul class="reset clearfix">
              <li id="analysis_report">
                <div class="main_name">Analysis Report</div>
                <div class="note_actions clearfix">
                <c:choose>
                	<c:when test="${(isMobile eq 'true') and (isIpad eq 'true')}">
                 		<div class="view" onclick="checkFilePresense('analysisD','${party.partyId}',1,event);generateReports('analysisD','${party.partyId}',1);">View</div>
                 	</c:when>
                  	<c:when test="${isMobile eq 'true'}">
                  <div class="view" onclick="checkFilePresense('analysisD','${party.partyId}',1,event);generateReports('analysisD','${party.partyId}',1);">Download</div>
                  </c:when>
                  <c:otherwise>
                  	<div class="view" onclick="checkFilePresense('analysisD','${party.partyId}',0,event);generateReports('analysisD','${party.partyId}',0);">View</div>
                  </c:otherwise>
                  </c:choose>
                  <div class="email inactiveLink hide">Email</div>
                </div>
              </li>
              <li id="action_plan_cust">
                <div class="main_name">Action Plan (Contact)</div>
                <div class="note_actions clearfix">
                  <c:choose>
                  	<c:when test="${(isMobile eq 'true') and (isIpad eq 'true')}">
                  		<div class="view" onclick="checkFilePresense('analysisClient','${party.partyId}',1,event);generateReports('analysisClient','${party.partyId}',1);" >View</div>
                  	</c:when>
                  	<c:when test="${isMobile eq 'true'}">
                  <div class="view" onclick="checkFilePresense('analysisClient','${party.partyId}',1,event);generateReports('analysisClient','${party.partyId}',1);">Download</div>
                  </c:when>
                  <c:otherwise>
                  	<div class="view" onclick="checkFilePresense('analysisClient','${party.partyId}',0,event);generateReports('analysisClient','${party.partyId}',0);">View</div>
                  </c:otherwise>
                  </c:choose>
                  <div class="email inactiveLink hide">Email</div>
                </div>
              </li>
              <li id="action_plan_fa">
                <div class="main_name">Action Plan (FA)</div>
                <div class="note_actions clearfix">
                <c:choose>
                	<c:when test="${(isMobile eq 'true') and (isIpad eq 'true')}">
                		<div class="view"  onclick="checkFilePresense('analysisAdvisor','${party.partyId}',1,event);generateReports('analysisAdvisor','${party.partyId}',1);">View</div>
                	</c:when>
                  	<c:when test="${isMobile eq 'true'}">
                  <div class="view"  onclick="checkFilePresense('analysisAdvisor','${party.partyId}',1,event);generateReports('analysisAdvisor','${party.partyId}',1);">Download</div>
                  </c:when>
                  <c:otherwise>
                  	<div class="view"  onclick="checkFilePresense('analysisAdvisor','${party.partyId}',0,event);generateReports('analysisAdvisor','${party.partyId}',0);">View</div>
                  </c:otherwise>
                  </c:choose>
                  <div class="email inactiveLink hide">Email</div>
                </div>
              </li>
            </ul>
          </div>
          <!-- <div id="dc_type_action">
            <ul class="reset clearfix">
              <li id="dc_type_basic">
                <a href="#" class="main_name">Basic</a>
                
              </li>
              <li id="dc_type_advanced">
                <a href="#" class="main_name">Advanced</a>
                
              </li>
              <li id="dc_type_golden">
                <a href="#" class="main_name">Golden</a>
                
              </li>
            </ul>
          </div> -->
        </li>
        <%-- <c:if test="${party.currentStageId eq 7003}">
               <div id="video_first_dialogC" class="common_custom_modal video_first_dialog">
				<h3 class="modal_heading">Analysis Report - Detailed<span class="close">X</span></h3>
				      <div class="viewReports">
				<iframe height="100%" width="100%"  src="${pageContext.request.contextPath}/partner/report/generatePDFReport/analysisC/${party.partyId}" allowfullscreen></iframe>
				</div>
				 </div>
				 <div id="video_first_dialog4" class="common_custom_modal video_first_dialog">
				<h3 class="modal_heading">Action Plan<span class="close">X</span></h3>
				      <div class="viewReports">
				<iframe height="100%" width="100%"  src="${pageContext.request.contextPath}/partner/report/generatePDFReport/analysisClient/${party.partyId}" allowfullscreen></iframe>
				</div>
				 </div>
				 <div id="video_first_dialog5" class="common_custom_modal video_first_dialog">
				<h3 class="modal_heading">Action Plan<span class="close">X</span></h3>
				      <div class="viewReports">
				<iframe height="100%" width="100%"  src="${pageContext.request.contextPath}/partner/report/generatePDFReport/analysisAdvisor/${party.partyId}" allowfullscreen></iframe>
				</div>
				 </div>
				 </c:if> --%>
      </c:forEach>
    </ul>
  </div>
  
  <!--    <p class="found"><span class="count">5</span> items found, displaying all items.</p> --> 
  <!--    <div class="down_more" onclick="getMoreContacts();">Load More</div> -->
  </form>
	</section>
	</div>

<!-- Contacts Ends-->

</section>

	
<!-- Common_in_contnet ends--> 
<!-- Common footer starts --> 
<!-- <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
         <ul class="reset clearfix fr btn_grup3">
            </li>
            <li class="fl list"><a href="#" class="anch save"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="#" class="anch cancel"><span class="txt">Cancel</span></a></li>
            <li class="fl list"><a href="#" class="anch skip"><span class="txt">Skip</span></a></li>
          </ul>
         <ul class="reset clearfix fr btn_grup2">
            </li>
            <li class="fl list"><a href="#" class="anch add_note"><span class="txt">Add Notes</span></a></li>
            <li class="fl list"><a href="#" class="anch add_doc"><span class="txt">Add Doc</span></a></li>
          </ul>
          <ul class="reset clearfix fr btn_grup2">
            </li>
            <li class="fl list"><a href="#" class="anch new_query"><span class="txt">New Query</span></a></li>
            <li class="fl list"><a href="#" class="anch delete_query"><span class="txt">Delete Query</span></a></li>
          </ul>
         <ul class="reset clearfix fl btn_grup1">
            </li>
            <li class="fl list"><a href="#" class="anch analysis"><span class="txt">Analysis</span></a></li>
            <li class="fl list"><a href="#" class="anch suggeset"><span class="txt">Suggestion</span></a></li>
            <li class="fl list"><a href="#" class="anch action_plan"><span class="txt">Action Plan</span></a></li>
          </ul>
        </div>
        <a href="#" class="back navgation"><span class="txt">Back</span></a> <a href="#" class="next navgation"><span class="txt">Next</span></a> </section>--> 

<!-- Common footer ends -->

</section>
<!-- Common_content Ends-->

</section>
	</div>

</div>
<!-- Main ends-->
<div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
<div id="video_first_dialog"
			class="common_custom_modal video_first_dialog">
  <h3 class="modal_heading"><span class="name"></span> <span class="close">X</span> </h3>
  <div class="viewReports">
    <iframe height="100%" width="100%" src="" allowfullscreen></iframe>
  </div>
</div>
<!--<div id="legend_dialog" class="common_custom_modal">
			<h3 class="modal_heading">Legends<span class="name"></span>
				<span class="close">X</span>
			</h3>
			<div class="content">
            <ul class="reset clearfix">
            <li class="fl actions_legend edit_legend"><div class="iocn"></div><span class="label">Edit Contact</span><div class="clr"></div></li>
            <li class="fl icon_indicator_legend dc_status_legend_inactive"><div class="iocn"></div><span class="label">DC Inactive</span><div class="clr"></div></li>
             <li class="fl icon_indicator_legend goal_base_legend"><div class="iocn"></div><span class="label">Goal Base</span><div class="clr"></div></li>
            <li class="fl actions_legend data_collect_legend"><div class="iocn"></div><span class="label">Data Collection</span><div class="clr"></div></li>
            <li class="fl icon_indicator_legend dc_status_legend_active"><div class="iocn"></div><span class="label">DC Active</span><div class="clr"></div></li>
         
<li class="fl icon_indicator_legend autoplan_status_legend"><div class="iocn"></div><span class="label">Autoplan</span><div class="clr"></div></li>
            <li class="fl actions_legend add_note_legend"><div class="iocn"></div><span class="label">View Report</span><div class="clr"></div></li>
         
           
            </ul>
            </div>
			</div>-->
</div>
<!-- Wrapper ends-->
<div id="confirmDialog" class="common_custom_modal_aa"> <span class="close" onclick="closeDialog();">X</span>
  <div class="modal_content">
    <div class="aa_up"> Do you really want to delete this data?</div>
    <div class="aa_down" id="yes"> <a style="cursor:pointer;" onclick="deleteContact();" class="aa_yes">Yes </a> <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
  </div>
</div>

<div id="moveContactsDialog" class="common_custom_modal" style="width: 70%; bottom: 33%; top: 37%; z-index: 2000"> <span class="close" onclick="closeMoveContactDialog();">X</span>
 	
  <div class="modal_content">
    <div class="aa_up"> Do you really want to move selected contacts?</div>
    <div class="aa_down"> <a style="cursor:pointer;"  id="moveContactID" class="aa_yes">Yes </a> <a style="cursor:pointer;" onclick="closeMoveContactDialog();" class="aa_no">No</a> </div>
  </div>
</div>
<div class="overlay"></div>
<form id="downloadAttachmentForm" target="_blank">
  <input type="hidden" name="partyId" id="partyId">
  <input type="hidden" name="reportFor" id="reportFor">
 </form>
 <!-- Hierarchy  -->
 <div id="life_insurance_methods" class="common_custom_modal" style="width: 70%;bottom: 32%;top: 7%;z-index: 2000 !important">
  <h3 class="modal_heading clearfix">Move Clients <span class="close">X</span></h3>
  <div class="modal_content"> 
  	<!-- main code  -->
			<div class="list-group-item" id="biz-panels">
					<div id="jstree2" class="jstree jstree-1 jstree-default" role="tree"></div>
			</div>
		</div>
  </div>
  <div class="overlay"></div>
</body>

<script>
function createGraph(){
	
	var nodeList='${sessionScope.lstLocationData}';
	var userList='${sessionScope.lstPartnerHeirarchyData}';
	try{
	nodeList=JSON.parse(nodeList);
	userList=JSON.parse(userList);
	}catch(e){
		return;
	}
	
	childrenArray= new Array();
	myObj = new Object();
	var cntr=0;
	$(nodeList).each(function(i,obj) {
		//alert(obj.locationId);
		var locationId=obj.locationId;
		var locationName=obj.locationName;
		var locationDescription=obj.locationDescription;
		var parentNodeId=obj.parentNodeId;
		var level=obj.level;
		var displaySeqNo=obj.displaySeqNo;
		var typeName='area';
		if(cntr==0){
			typeName='root';
			if('${sessionScope.nodeId}'==locationId)
				myObj.text='<b>'+locationName+'</b>';
			else
				myObj.text='<b class="normal-fonts-location">'+locationName+'</b>';
			myObj.state='{opened": "true","selected":"true"}';
			myObj.type=typeName;
			myObj.nodeId=locationId;
			myObj.level=level;
			myObj.children=childrenArray;
			currentArryToIterate=childrenArray;
			createChildNodes(locationId,level,nodeList);
			createChildUsers(locationId,level,userList);
			cntr+=1;
		}else{
			createChildNodes(locationId,level,nodeList);
			createChildUsers(locationId,level,userList);
		}
	});
<%-- 	$.getScript('<%=request.getContextPath()%>/js/jstree/jstree.min.js', function () { --%>
        // When it's done loading, create your jsTree stuff.
//         $('#jstree1').jstree();
    try{
	
	$('#jstree2').jstree({
//         "contextmenu": {
//             "select_node": true,
//             "show_at_node": false
//             //"items": customMenu1
//         },
        "types": {
            "#": {"max_children": 1, "max_depth": 4, "valid_children": ["root"]},
            "root": {"icon": "", "valid_children": ["area"]},
            "default": {"valid_children": ["default", "file"]},
            "user": {"icon": "icn user", "valid_children": []},
            "area": {"icon": "icn area", "valid_children": []}
        },
         "plugins": ["contextmenu", "types"],
        'core': {
            'data': [
				myObj
            ]
        }

    });
    }catch(e){
        
    	try{
    		$('#jstree2').jstree({
    	        "types": {
    	            "#": {"max_children": 1, "max_depth": 4, "valid_children": ["root"]},
    	            "root": {"icon": "", "valid_children": ["area"]},
    	            "default": {"valid_children": ["default", "file"]},
    	            "user": {"icon": "icn user", "valid_children": []},
    	            "area": {"icon": "icn area", "valid_children": []}
    	        },
    	        'core': {
    	            'data': [
    					myObj
    	            ]
    	        }

    	    });
    	}catch(e){
    		$jq_1_9_2('#jstree2').jstree({
    	        "types": {
    	            "#": {"max_children": 1, "max_depth": 4, "valid_children": ["root"]},
    	            "root": {"icon": "", "valid_children": ["area"]},
    	            "default": {"valid_children": ["default", "file"]},
    	            "user": {"icon": "icn user", "valid_children": []},
    	            "area": {"icon": "icn area", "valid_children": []}
    	        },
    	        'core': {
    	            'data': [
    					myObj
    	            ]
    	        }

    	    });
    	}
    }
    $("#jstree2").on('open_node.jstree', function(e, data) {
        $('li.jstree-open > ul li.jstree-open > ul').css({
            'width': ($(this).width() + 0) + 'px'
        });
    });
    
	//});s
}

function createChildNodes(nodeId,nodeLevel,nodeList){
	$(nodeList).each(function(i,obj) {
		var locationId=obj.locationId;
		var locationName=obj.locationName;
		var locationDescription=obj.locationDescription;
		var parentNodeId=obj.parentNodeId;
		var level=obj.level;
		var displaySeqNo=obj.displaySeqNo;
		var typeName='area';
		var childArray=new Array();
		getChildArray3(nodeId,nodeLevel);
		childArray=currentArryToIterate;
		currentArryToIterate==new Array();
		if(childArray==undefined)
			childArray=myObj['children'];
		if(parentNodeId==nodeId){
			var obj=new Object();
			if('${sessionScope.nodeId}'==locationId)
				obj.text='<b>'+locationName+'</b>';
			else
				obj.text='<b class="normal-fonts-location">'+locationName+'</b>';
			obj.state='{opened": "true","selected":"true"}';
			obj.type=typeName;
			obj.nodeId=locationId;
			obj.level=level;
			obj.children=new Array();
			childArray.push(obj);
		}
		//myObj.children=childArray;
// 		setChildArray1(nodeId,nodeLevel,childArray);
		setTimeout(function() {
			setChildArray1(nodeId,nodeLevel,childArray)
		}, 10000);
	});
}
function createChildUsers(nodeId,nodeLevel,userList){
	$(userList).each(function(i,obj) {
		var locationId=obj.locationId;
		var locationName=obj.locationName;
		var locationDescription=obj.locationDescription;
// 		var parentNodeId=obj.parentNodeId;
		var parentNodeId=locationId;
		var level=obj.level;
		var displaySeqNo=obj.displaySeqNo;
		var name=obj.userName;
		var partyId=obj.partyId;
		var headOfNode=obj.headOfNode;
		var typeName='user';
		var childArray=new Array();
		getChildArray3(nodeId,nodeLevel);
		childArray=currentArryToIterate;
		currentArryToIterate==new Array();
		if(childArray==undefined)
			childArray=myObj['children'];
		if(parentNodeId==nodeId){
			var obj=new Object();
			if('${sessionScope.HPartyId}'==partyId && headOfNode==true)
				obj.text='<span class="icn star"></span><b  onmousedown="userClick(\''+locationId+'\',\''+partyId+'\')">'+name+'</b>';
			else if('${sessionScope.HPartyId}'==partyId && headOfNode==false)
				obj.text='<b  onmousedown="userClick(\''+locationId+'\',\''+partyId+'\')">'+name+'</b>';
			else if(headOfNode==true)
				obj.text='<span class="icn star"></span><b class="normal-fonts-location" onmousedown="userClick(\''+locationId+'\',\''+partyId+'\')">'+name+'</b>';
			else
				obj.text='<b class="normal-fonts-location" onmousedown="userClick(\''+locationId+'\',\''+partyId+'\')">'+name+'</b>';
// 			obj.state='{opened": "true","selected":"true"}';
			obj.type=typeName;
			obj.nodeId=locationId;
			obj.level=level;
			obj.children=new Array();
			childArray.push(obj);
		}
		//myObj.children=childArray;
// 		setChildArray1(nodeId,nodeLevel,childArray);
		setTimeout(function() {
			setChildArray1(nodeId,nodeLevel,childArray)
		}, 10000);
	});
}

function  userClick(nodeId,partyId){
	if(checkedIds !=null && checkedIds!= '' ){						
	        $(".overlay").fadeIn("fast");
	       $("#life_insurance_methods").fadeOut("fast");
	    	$("#moveContactsDialog").fadeIn("slow");				    	
	}
	$("#moveContactID").click(function(){
		window.location.replace('${pageContext.request.contextPath}/partner/contact/moveContacts?checkedIds='+checkedIds+'&partnerPartyId='+partyId+'&nodeId='+nodeId);
	});//end of click function
}


</script>




</html>