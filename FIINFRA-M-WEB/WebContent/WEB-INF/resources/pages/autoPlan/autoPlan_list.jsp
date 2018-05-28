<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#page_loader{
	background: #fff url(${pageContext.request.contextPath}/resources/images/loader.gif) no-repeat center center;
}

</style>   
<!DOCTYPE html>
<html>
<head>
<%-- <% 
UserSession user = (UserSession) request.getSession().getAttribute("userSession");
   String theme = PartnerProfileController.getThemePath(user);
%>
<%if(theme != null){ %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
<%} %> --%>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<meta name="viewport" content="width=1024">
<title>List of Autoplan Clients</title>

<!-- Custom Selectbox starts -->
<script>
function showAutoPlan(url,stat) {
	var statusFlag = 1;
	if(stat.toLowerCase() == 'initiated')
		statusFlag = 0;	
	if(stat.toLowerCase() == 'generated') {
		$("#successDialog").html("Autoplan is alredy generated");
 		$( "#successDialog").dialog( "open" );
	}
	else {
		javascript:location.href=url+"?statusFlag="+statusFlag;
	}
}

function showAutoPlan1(partyId,name,stat) {
	var statusFlag = 1;
	if(stat.toLowerCase() == 'initiated')
		statusFlag = 0;	
	if(stat.toLowerCase() == 'generated') {
		$("#successDialog").html("Autoplan is alredy generated");
 		$( "#successDialog").dialog( "open" );
	}
	else {
		javascript:location.href='${pageContext.request.contextPath}/partner/autoPlan/'+partyId+'/'+name+'?statusFlag='+statusFlag;
	}
	
}
$(document).ready(function(){
	
	$(".genericSearch").keypress(function (e) {		
	    if (e.keyCode == '13') {
	        e.preventDefault();
	        return false;
	    }
	});
	
    $(".wrapper").addClass("new_contacts_wrapper");
    //$("select").selectBoxIt();
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

	  <c:if test="${not empty success}">
   	  $(".modal-body").html("<spring:message code="${success}" />");
	  $(".btn-success1").html("OK");
	  $(".btn-success1").on('click',function(){
	  	closeDialog();
	  });		
	  $(".btn-danger1").hide();
	  $('#confirmDialog').modal('show');
  </c:if>

  <c:if test="${not empty error}">

  	 $(".modal-body").html("<spring:message code="${error}" />");
    $(".btn-success1").html("OK");
    $(".btn-success1").on('click',function(){
    	closeDialog();
    });		
    $(".btn-danger1").hide();
    $('#confirmDialog').modal('show');
  </c:if>

  });

</script>
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
/* $(document).ready(function(){

	$(".grid_adjuster").slimScroll().bind('slimscroll', function(e, pos){
		if(pos =="bottom")
		{
			getMoreContacts();
		}
	}); */

	
	 <!--Add note main menu starts--> 
  $("body").on("click","#contact_list #contacts #add_note",function(e){
	//  alert("clicked");
 //  $("#contact_list #contacts #add_note").not(this).closest(".contact_parent").next("#add_note_actions").slideUp("slow");
  if((!$(this).closest(".contact_parent").next("#add_note_actions").is(':visible')))
   {
    
	var value =  $(this).attr('name');
	if(value==7003)
	{
	$("#contact_list #contacts #add_note").not(this).closest(".contact_parent").next("#add_note_actions").slideUp("fast");
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
      
	   $(this).closest(".contact_parent").next("#add_note_actions").slideUp("fast");
	  }
   /* $("#add_note_actions").click(function (e) {
        e.stopPropagation();
	});*/
  });
  <!--Add note main menu  ends -->
   
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
	
	url: "${pageContext.request.contextPath}/partner/autoPlanClients/search",
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
	
		innerHTMML=innerHTMML+'<div class="fourth progress fl field">';
        /* if(element.currentStageId == 7006){
			innerHTMML=innerHTMML+'<div class="circle empty"></div>';
        }else if(element.currentStageId==7001){
        	innerHTMML=innerHTMML+'<div class="circle one_fourth"></div>';
        }else if(element.currentStageId==7007){
        	innerHTMML=innerHTMML+'<div class="circle one_half"></div>';
        }else if(element.currentStageId==7002){
        	innerHTMML=innerHTMML+'<div class="circle three_fourth"></div>';
        }else if(element.currentStageId==7003){
        	innerHTMML=innerHTMML+'<div class="circle complete"></div>';
        } */
        innerHTMML=innerHTMML+ element.action;
        innerHTMML=innerHTMML+'</div>';
        
        //innerHTMML=innerHTMML+'<div class="fifth status fl field txt_data">'+element.status+'</div>';
        innerHTMML=innerHTMML+'<div class="sixth phone fl field txt_data">'+element.phoneNumber+'</div>';
        innerHTMML=innerHTMML+'<div class="seventh create_date fl field txt_data">'+creationDate+'</div>';
        innerHTMML=innerHTMML+'<div class="eight dc_storage fl field txt_data">'+element.dcStage+'</div>';
        innerHTMML=innerHTMML+'<div class="nine contact_email fl field txt_data">';
        innerHTMML=innerHTMML+'<div class="email_add">'+element.emailId+'</div>';
        innerHTMML=innerHTMML+'</div>';
        innerHTMML=innerHTMML+'<div class="ten action fl field">';
        innerHTMML=innerHTMML+'<div id="action_popup" class="clearfix"> <a href="#" onClick="showAutoPlan1('+element.partyId+',\'' +element.name+ '\',\'' +element.action+'\')" class="click_action';
       
        if(element.action=='Generated' || element.action=='New')
        {
        	 innerHTMML=innerHTMML+' inactiveLink';
        }
        var isautoplan = '${isAutoPlanEnable}';
        if(isautoplan=='0')
        {
        	 innerHTMML=innerHTMML+' inactiveLink';
        }	
        innerHTMML=innerHTMML+'"title="Autoplan Review" id="a_p_view">';
        innerHTMML=innerHTMML+'<span class="icon"></span></a> <a href="#"  onClick="DeleteConfirm('+ element.partyId +')" class="click_action" title="Delete Contact" id="a_p_delete"><span class="icon"></span></a>';
       // innerHTMML=innerHTMML+'<div class="click_action rel" id="add_note" name="'+element.currentStageId+'"><span class="icon"></span></div>';
        innerHTMML=innerHTMML+' </div>';
        innerHTMML=innerHTMML+'</div>';
        innerHTMML=innerHTMML+'</div>';
        /* innerHTMML=innerHTMML+'<div id="add_note_actions">';
        innerHTMML=innerHTMML+'<ul class="reset clearfix">';
        innerHTMML=innerHTMML+'<li id="analysis_report">';R
        innerHTMML=innerHTMML+'<div class="main_name">Analysis Report</div>';
        innerHTMML=innerHTMML+'<div class="note_actions clearfix">';
        innerHTMML=innerHTMML+'<div class="first_col phone_no">';
        innerHTMML=innerHTMML+'<div class="view" onclick="showReport(\'${pageContext.request.contextPath}/partner/report/checkReport/analysisC/'+element.partyId+'\','+element.partyId+');">View</div>';
        innerHTMML=innerHTMML+'<div class="email">Email</div>';
        innerHTMML=innerHTMML+'</div>';
        innerHTMML=innerHTMML+'</li>';
        innerHTMML=innerHTMML+'<li id="action_plan_cust">';
        innerHTMML=innerHTMML+'<div class="main_name">Action Plan (Contact)</div>';
        innerHTMML=innerHTMML+'<div class="note_actions clearfix">';
        innerHTMML=innerHTMML+'<div class="view" onclick="showReport(\'${pageContext.request.contextPath}/partner/report/checkReport/analysisClient/'+element.partyId+'\','+element.partyId+');">View</div>';
        innerHTMML=innerHTMML+'<div class="email">Email</div>';
        innerHTMML=innerHTMML+'</div>';
        innerHTMML=innerHTMML+'</li>';
        innerHTMML=innerHTMML+'<li id="action_plan_fa">';
        innerHTMML=innerHTMML+'<div class="main_name">Action Plan (FA)</div>';
        innerHTMML=innerHTMML+'<div class="note_actions clearfix">';
        innerHTMML=innerHTMML+'<div class="view"  onclick="showReport(\'${pageContext.request.contextPath}/partner/report/checkReport/analysisAdvisor/'+element.partyId+'\','+element.partyId+');">View</div>';
        innerHTMML=innerHTMML+'<div class="email">Email</div>';
        innerHTMML=innerHTMML+'</div>';
        innerHTMML=innerHTMML+'</li>';
        innerHTMML=innerHTMML+'</ul>';
     	innerHTMML=innerHTMML+'</div>'; */
     	
        innerHTMML=innerHTMML+'</li>';

                
        $("ul#contacts").append(innerHTMML);

       
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


 }

var checkedIds='';
/* function ConfirmDeletion(){
	checkedIds='';
	checkedIds =checkedIds+  $(":checkbox:checked").map(function() {
	       return this.id;
	    }).get();
		if(checkedIds !=null && checkedIds!= '' )
			{		
			
				$(".modal-body").html("Do you really want to delete this Query?");
				$(".btn-danger1").show();
				$(".btn-success1").html("Yes");
				$(".btn-success1").on('click',function(){deleteContact();});			
				$('#confirmDialog').modal('show');			    	
				
			}//END IF
			else {
				
					displayMsg("Please select Query to delete");
					return false;
				}
	} */
	
function DeleteConfirm(partyId){
	checkedIds='';
	checkedIds =checkedIds+ partyId;
		if(checkedIds !=null && checkedIds!= '' )
			{						

					$(".modal-body").html("Do you really want to delete this Contact?");
					 $(".btn-danger1").show();
					$(".btn-success1").html("Yes");
					$(".btn-success1").on('click',function(){deleteContact();});			
					$('#confirmDialog').modal('show');	
				
			}//END IF
			else {

					displayMsg("Please select Contact to delete");
					return false;
				}
	}

function deleteContact(){
	 $(".btn-success1").ajaxSubmit({
		 
	 	url:"${pageContext.request.contextPath}/partner/contact/delete",
		type: "POST",
		data: {'checkedIds':checkedIds},
		success: function(data){
			 $("#successDialog").html("Record deleted Sucessfully");
			 window.location.reload(true);
			}						
	});

		checkedIds='0,'
		 $("#confirmDialog").modal("hide");
}

function displayMsg(msg){
    $(".modal-body").html(msg);
	$(".btn-success1").html("Ok");
	$(".btn-success1").on('click',function(){closeDialog();});
	$(".btn-danger1").hide();
	$('#confirmDialog').modal('show');
}


function activateDCT(){
	var checkedIds='';
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

$( "body" ).on( "click", "#resetCriteria",function(){
	$('#genericSearch').val("");
	$('#genericSearch').placeholder();
	$("#opportunityStatusID").selectBoxIt('selectOption', 0);
	$("#recordTypeID").selectBoxIt('selectOption', 0);
	$("#contactSourceTypeID").selectBoxIt('selectOption', 0);
	searchContact();
});

$( "body" ).on( "click", "#searchContactBtn",function(){
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
	location.reload();
	$("#confirmDialog").modal('hide');
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

function showReport(url,partyId){
//	$('.grid_adjuster').slimScroll({destroy: true});
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
<!-- Wrapper starts-->
<div class="" id="contact_list_wrapper"> 
  <!-- Main starts-->
  
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
						
							<li class="first"><div class="col-md-3"><form:select path="opportunityStatusID"
									id="opportunityStatusID" class="chosen-select form-control" items="${opportunity}"
									itemValue="codeValueId" itemLabel="codeValue">
								</form:select></div></li>
								  
							<li class="second"><div class="col-md-3"><form:select path="contactSourceTypeID"
									id="contactSourceTypeID" class="chosen-select form-control" items="${source}"
									itemValue="codeValueId" itemLabel="codeValue">
								</form:select></div></li>
								  
							<li class="third"><div class="col-md-3"><form:select path="recordTypeID"
									id="recordTypeID" items="${type}" class="chosen-select form-control" itemValue="codeValueId"
									itemLabel="codeValue">
								</form:select></div></li>
								  
							<li class="fourth"><div class="col-md-3"><form:input path="genericSearch"
									class="common_input genericSearch"
									placeholder="Enter First, Last Name, Email or PAN..." /></div></li>

						</ul>
						<ul class="reset clearfix action">
							<li><input type="button" value="Reset" class="common_btn" id="resetCriteria"></li>
							<li><input type="button" value="Search" class="common_btn" id="searchContactBtn"></li>
						</ul>
						<div class="clr"></div>
					</div>
       </form:form>
     </div></div>
  <div class="div_dragger listOfContactsSearchLink"><span></span></div>
        <!-- Sort Starts-->
        <section id="result_sort" class="clearfix">
          <div class="sort" <c:if test='${totalContacts <= 0 }'>style="display: none"</c:if>>
          <span class="txt">Sort by:</span>
            <button class="sort_btn" id="sort_name">Name</button>
            <button class="sort_btn" id="sort_date">Date</button>
            </div>
          
        <!--   <div id="alphabetical_search">
            <ul class="reset clearfix">
              <li>A</li>
              <li>B</li>
              <li>C</li>
              <li>D</li>
              <li>E</li>
              <li>F</li>
              <li>G</li>
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
         <div id="page_loader"></div>
         <ul class="reset clearfix fl top_btn"><li class="fl"><a href="${pageContext.request.contextPath}/partner/contacts" class="contact_btn"><span class="icon"></span>All</a></li> <li class="fl westspace1"><a href="${pageContext.request.contextPath}/partner/autoPlanList" class="auto_plan_btn_act"><span class="icon"></span>Auto Plan</a></li> </ul>
         <c:choose>
			<c:when test="${totalContacts gt 0}">
				<div class="found" id = "found">
					<span class="count" id="totalContactsFound"><c:out value="${totalContacts}"></c:out></span>
					items found, displaying all items.
				</div>	
				<div class="found" id="notfound" style="display:none">
					No Record Found.
				</div>
				</c:when>
				<c:otherwise>
				<div class="found"  id="found"  style="display:none">
					<span class="count" id="ContactsFound"><c:out value="${totalContacts}"></c:out></span>
					items found, displaying all items.
				</div>
				<div class="found" id="notfound">
					No Record Found.
				</div> 	
				</c:otherwise>
			</c:choose>
          <div class="clr"></div>
          <div class="contact_par">          
        <section id="contacts">
       
          <ul class="reset clearfix header">
              <li class="first">&nbsp;</li>
              <li class="second">Name</li>
              <!-- <li class="third">Level</li> -->
              <li class="fourth">Status</li>
              <li class="sixth">Contact No.</li>
              <li class="seventh">Creation Date</li>
              <li class="eight">DC Stage</li>
              <li class="nine">Email</li>
              <li class="ten">Actions</li>
            </ul>
           <form class="form-horizontal" id="frmParterContacts"
						name="frmParterContacts"
						action="<c:url value="${pageContext.request.contextPath}/partner/contacts/sortDummy" />" method="POST">
				
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
                  </div>
                  <%-- <div class="third level fl field">
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
                  </div> --%>
                  <div class="fourth progress fl field">${party.action}
                  	<%-- <c:choose>
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
					</c:choose> --%>
                  </div>               
                  <div class="sixth phone fl field txt_data">${party.phoneNumber}</div>
                  <div class="seventh create_date fl field txt_data">${creationDate}</div>
                  <div class="eight dc_storage fl field txt_data">${party.dcStage}</div>
                  <div class="nine contact_email fl field txt_data">
                    <div class="email_add">${party.emailId}</div>
                  </div>                 
                  <div class="ten action fl field">
                    <div id="action_popup" class="clearfix"> <a href="#"  onClick="showAutoPlan('${pageContext.request.contextPath}/partner/autoPlan/${party.partyId}/${party.name}','${party.action}')" class="click_action <%-- <c:if test="${isAutoPlanEnable eq 0}">inactiveLink</c:if> --%><c:if test="${party.action eq 'Generated' || party.action eq 'New' || isAutoPlanEnable eq 0}">inactiveLink</c:if>" title="Autoplan Review"  id="a_p_view"> <span class="icon"></span></a>
                    <a href="#"  class="click_action" title="Delete Contact" onClick="DeleteConfirm('${party.partyId}')" id="a_p_delete"><span class="icon"></span></a>
                      <%-- <div class="click_action rel" id="add_note" name="${party.currentStageId}"><span class="icon"></span></div> --%>
                      <!--<a href="query.html" class="click_action" id="help"><span class="icon"></span></a>--> </div>
                  </div>
                </div>
                <%-- <div id="add_note_actions">
                  <ul class="reset clearfix">
                    <li id="analysis_report">
                      <div class="main_name">Analysis Report</div>
                      <div class="note_actions clearfix">
                        <div class="view" onclick="showReport('${pageContext.request.contextPath}/partner/report/checkReport/analysisC/${party.partyId}',${party.partyId});">View</div>
                        <div class="email">Email</div>
                      </div>
                    </li>
                    <li id="action_plan_cust">
                      <div class="main_name">Action Plan (Contact)</div>
                      <div class="note_actions clearfix">
                        <div class="view" onclick="showReport('${pageContext.request.contextPath}/partner/report/checkReport/analysisClient/${party.partyId}',${party.partyId});" >View</div>
                        <div class="email">Email</div>
                      </div>
                    </li>
                    <li id="action_plan_fa">
                      <div class="main_name">Action Plan (FA)</div>
                      <div class="note_actions clearfix">
                        <div class="view"  onclick="showReport('${pageContext.request.contextPath}/partner/report/checkReport/analysisAdvisor/${party.partyId}',${party.partyId});" >View</div>
                        <div class="email">Email</div>
                      </div>
                    </li>
                    </ul>
                </div> --%>
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
  <!-- Main ends--> 
   <div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
		<div id="video_first_dialog"
			class="common_custom_modal video_first_dialog">
			<h3 class="modal_heading"><span class="name"></span>
				<span class="close">X</span>
			</h3>
			<div class="viewReports">
				<iframe height="100%" width="100%" src="" allowfullscreen></iframe>
			</div>
		</div>
		<!-- Wrapper ends-->
<!-- <div id="confirmDialog" class="common_custom_modal_aa">
  <span class="close" onclick="closeDialog();">X</span>
  <div class="modal_content"> 
    <div class="aa_up">
        Do you really want to delete this contact?</div>
     
         <div class="aa_down" id="yes"> <a style="cursor:pointer;" onclick="deleteContact();" class="aa_yes">Yes </a> 
         <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>


  </div>
  
  
</div> -->


<div class="modal fade" id="confirmDialog" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    		<div class="modal-dialog">
       		<div class="modal-content">
            <div class="modal-body">
                
             </div>
            <div class="modal-footer">
             <button  class="btn btn-sm btn-success1 btn-primary"><i class="ace-icon fa fa-check bigger-110"></i>Yes</button>
  		       <button onclick="closeDialog();" class="btn btn-sm btn-danger1 btn-primary"><i class="ace-icon fa fa-close bigger-110 btn-primary"></i>No</button>
		             </div>
    </div>

  </div>
</div>

 <div class="overlay"></div>


</body>
</html>
