<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<% 
UserSession user = (UserSession) request.getSession().getAttribute("userSession");
   String theme = PartnerProfileController.getThemePath(user);
%>
<%if(theme != null){ %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
<%} %>
<title>List of Contacts</title>



<!-- Custom Selectbox starts -->
<script>
$(document).ready(function(){
	
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
	


	
	$('.wrapper').attr('id', 'contact_list_wrapper');
	$("select").selectBoxIt();
	// Calls the selectBoxIt method on your HTML select box
  
  /* 	$(".selectboxit-container").click(function(){
		$(".selectboxit-option-first").remove();  
	});	
 */
	$("#contact_list .div_dragger").click(function(){
    	$("#query_filter").slideToggle("slow");
		$(".div_dragger span").animate("slow").toggleClass("div_dragger_up","slow");
  	});
  
  $('.common_in_content').slimScroll({alwaysVisible: true});
   $('#frmParterContacts').slimScroll({alwaysVisible: true});
	$('#contact_list #contacts .name').perfectScrollbar();
	$('#contact_list .container .value').perfectScrollbar();

	/* $("#contacts .white_checkbox").click(function(){
    	$(this).toggleClass("white_checkbox_checkbox_checked");	
	 	
    	if ($(this).next( ".default_checkbox" ).is(":checked")) {		
       		$(this).next( ".default_checkbox" ).prop("checked", false);
    	} else {
       		$(this).next( ".default_checkbox" ).prop("checked", true);
    	}
  	}); */

	$("#contact_list #contacts .action").click(function(){
   		 $(this).toggleClass("action_clicked");
		$("#contact_list #contacts .action").not(this).removeClass("action_clicked");
   		
  	});
  	
	$("#contact_list #contacts .click_action").click(function(){
   		$(this).toggleClass("click_action_clicked");
		$("#contact_list #contacts .click_action").not(this).removeClass("click_action_clicked");
   	});
    
  	$("#contact_list #contacts #add_note").click(function(){
   		$(this).parent().siblings("#add_note_actions").slideUp("slow");
   		if((!$(this).parent().siblings("#add_note_actions").is(':visible')))
   		{
			$(this).parent().siblings("#add_note_actions").slideDown("slow");  
   		}
	});
   
  	$("#contact_list #contacts #add_note_actions .main_name").click(function(){
   		$("#contact_list #contacts #add_note_actions .main_name").removeClass("menu_clicked");
   		$(this).addClass("menu_clicked");   
   		$("#contact_list #contacts #add_note_actions .main_name").next(".note_actions").slideUp("slow");
   		if((!$(this).next(".note_actions").is(':visible')))
   		{
	 		$(this).next(".note_actions").slideDown("slow");  
   		}      
  	});
	/* Selected  contact Starts*/
  $("#contact_list #contacts .person .white_checkbox").click(function(e){
	$("#contact_list #contacts .person").not().closest(this).removeClass("active");
	if($(this).closest(".person").hasClass("active"))
	{
	 $(this).closest(".person").removeClass("active");  		
	}
	else
	{
	$(this).closest(".person").addClass("active");  
	}
	
	});
	
	/* Selected  contact Ends*/	
    
    if(${totalContacts}<=0)
    {
    	$("#dialog1").html("You have no contacts");
    	$( "#dialog1").dialog( "open" );
    	
    }
	
	
    
   
});

function addContact(){
	window.location.href = "${pageContext.request.contextPath}/partner/contact/add";
}
	
	
</script>
</head>
<!-- Wrapper starts-->
<div class="">
	<!-- Main starts-->

	<section class="main">
		<!-- Common_content Starts-->
		<section class="content common_content">			
			<jsp:include page="../layout/submenu_small.jsp"></jsp:include>
			
			<!-- Common_in_contnet starts-->
			<section id="contact_list"
				class="in_content common_in_content clearfix">
				<form:form id="searchcontactId" commandName="searchCriteria">
					<div id="query_filter">
						<ul class="reset clearfix parameters">
							<li class="first"><form:select path="opportunityStatusID"
									id="opportunityStatusID" items="${opportunity}"
									itemValue="codeValueId" itemLabel="codeValue">
								</form:select></li>
							<li class="second"><form:select path="contactSourceTypeID"
									id="contactSourceTypeID" items="${source}"
									itemValue="codeValueId" itemLabel="codeValue">
								</form:select></li>
							<li class="third"><form:select path="recordTypeID"
									id="recordTypeID" items="${type}" itemValue="codeValueId"
									itemLabel="codeValue">
								</form:select></li>
							<li class="fourth"><form:input path="genericSearch"
									class="common_input"
									placeholder="Enter First, Last Name, Email or PAN..." /></li>

						</ul>
						<ul class="reset clearfix action">
							<li><input type="button" value="Reset" class="common_btn" id="resetCriteria"></li>
							<li><input type="button" value="Search" class="common_btn" onclick="searchContact();"></li>
						</ul>
						<div class="clr"></div>
					</div>
					</form:form>
					<div class="div_dragger">
						<span></span>
					</div>
					<!-- Sort Starts-->
					<section id="result_sort" class="clearfix">
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
						
						
						<div class="sort" <c:if test='${totalContacts <= 0 }'>style="display: none"</c:if>>
							<span class="txt">Sort by:</span>
							<button class="sort_btn" id="sort_name">Name</button>
							<button class="sort_btn" id="sort_date">Date</button>
						</div>
						
					</section>
					<!-- Sort Ends-->
					<form class="form-horizontal" id="frmParterContacts"
						name="frmParterContacts"
						action="<c:url value="${pageContext.request.contextPath}/partner/contacts/sortDummy" />"
						method="POST">
						<!-- Contcts Starts-->
						<section id="contacts">
						
								<div class="grid_adjuster"><ul class="reset clearfix contact_ul" id="contacts">
									<!--  <ul id="contacts"> -->
									<c:forEach items="${subList}" var="party"
										varStatus="loopCounter">										
										<li class="contact_li">
											<div class="person clearfix">
												<div class="chekbox_parent">
													<span class="white_checkbox"></span> <input type="checkbox" value="" id="${party.partyId}" 
														name="contact_person" class="default_checkbox" />														
														<fmt:formatDate pattern="dd-MMM-yyyy" value="${party.creationDate}" var="creationDate"></fmt:formatDate>
												</div>
												 <c:choose>
													<c:when test="${party.recordTypeID==14006}"><!-- for client -->
													<div class="personal_details clearfix">
														<span class="name" id="name_${loopCounter.count}"><c:out
																value="${party.name}"></c:out></span>
														<div class="iocn client"></div>
													</div>
													</c:when>
													<c:when test="${party.recordTypeID==14005}"><!-- for opportunity -->
													<div class="personal_details clearfix">
														<span class="name" id="name_${loopCounter.count}"><c:out
																value="${party.name}"></c:out></span>
														<div class="iocn opportunity"></div>
													</div>
													</c:when>
													<c:when test="${party.recordTypeID==14007}"><!-- for PC -->
													<div class="personal_details clearfix">
														<span class="name" id="name_${loopCounter.count}"><c:out
																value="${party.name}"></c:out></span>
														<div class="iocn pclient"></div>
													</div>
													</c:when>
												</c:choose> 
												<button class="action"></button>
											</div>
											<div class="progress">
											<c:choose>
												<c:when test="${party.currentStageId eq 7006}">
													<div class="complete" style="width:0%;"></div>
												</c:when>
												<c:when test="${party.currentStageId eq 7001}">
													<div class="complete" style="width:25%;"></div>
												</c:when>
												<c:when test="${party.currentStageId eq 7007}">
													<div class="complete" style="width:50%;"></div>
												</c:when>
												<c:when test="${party.currentStageId eq 7002}">
													<div class="complete" style="width:75%;"></div>
												</c:when>
												<c:when test="${party.currentStageId eq 7003}">
													<div class="complete" style="width:100%;"></div>
												</c:when>
											</c:choose>												
											</div>
											<ul class="clearfix reset person_details">
												<li class="clearfix">
													<div class="first_col city">
														<label>City :</label> <span class="value"><c:out
																value="${party.city}"></c:out></span>
													</div>
													<div class="second_col creation_date">
														<label>Creation Date :</label> <span class="value">														
														${creationDate}
														</span>
													</div>
												</li>
												<li class="clearfix">
													<div class="first_col status">
														<label>Status :</label> <span class="value"><c:out
																value="${party.status}"></c:out></span>
													</div>
													<div class="second_col dc_stage">
														<label>DC Stage :</label><span class="value"><c:out
																value="${party.dcStage}"></c:out></span>
													</div>
												</li>
												<li class="clearfix">
													<div class="first_col phone_no">
														<label>Mobile :</label><span class="value"><c:out
																value="${party.phoneNumber}"></c:out></span>
													</div>
													<div class="second_col email_id clearfix">
														<label class="fl">Email id :</label><div class="container fr"> <span class="value"><c:out
																value="${party.emailId}" /></span></div>
													</div>
												</li>
											</ul>
											<div id="action_popup" class="clearfix">
												<a
													href="${pageContext.request.contextPath}/partner/edit/${party.partyId}/${party.name}">
													<div class="click_action" id="edit">
														<span class="icon"></span>
													</div>
												</a> <a
													href="${pageContext.request.contextPath}/partner/datacollection/${party.partyId}/${party.name}/${party.recordTypeID}">
													<div class="click_action" id="data_collect">
														<span class="icon"></span>
													</div>
												</a>
												<div class="click_action" id="add_note">
													<span class="icon"></span>
												</div>
												<!-- <div class="click_action" id="help">
													<span class="icon"></span>
												</div> -->
											</div>
											<div id="add_note_actions">
												<ul class="reset clearfix">
													<li id="analysis_report">
														<div class="main_name">Analysis Report</div>
														<div class="note_actions clearfix">
															<div class="view">View</div>
															<div class="email">Email</div>
														</div>
													</li>
													<li id="action_plan_cust">
														<div class="main_name">Action Plan (Customer)</div>
														<div class="note_actions clearfix">
															<div class="view">View</div>
															<div class="email">Email</div>
														</div>
													</li>
													<li id="action_plan_fa">
														<div class="main_name">Action Plan (FA)</div>
														<div class="note_actions clearfix">
															<div class="view">View</div>
															<div class="email">Email</div>
														</div>
													</li>
												</ul>
											</div>
										</li>
									</c:forEach>
									<!-- </ul> -->
									<div id="action_popup" class="clearfix">
										<div class="click_action" id="edit">
											<span class="icon"></span>
										</div>
										<div class="click_action" id="data_collect">
											<span class="icon"></span>
										</div>
										<div class="click_action" id="add_note">
											<span class="icon"></span>
										</div>
										<!-- <div class="click_action" id="help">
											<span class="icon"></span>
										</div> -->
									</div>
									<div id="add_note_actions">
										<ul class="reset clearfix">
											<li id="analysis_report">
												<div class="main_name">Analysis Report</div>
												<div class="note_actions clearfix">
													<div class="view">View</div>
													<div class="email">Email</div>
												</div>
											</li>
											<li id="action_plan_cust">
												<div class="main_name">Action Plan (Customer)</div>
												<div class="note_actions clearfix">
													<div class="view">View</div>
													<div class="email">Email</div>
												</div>
											</li>
											<li id="action_plan_fa">
												<div class="main_name">Action Plan (FA)</div>
												<div class="note_actions clearfix">
													<div class="view">View</div>
													<div class="email">Email</div>
												</div>
											</li>
										</ul>
									</div>
									<!--</li>-->
								</ul></div>
								
							
						</section>
						<!-- Contacts Ends-->
						<input name="partyId" type="hidden" value="${partyId}" /> <input
							name="buId" type="hidden" value="${buId}" /> <input
							name="sortOrder" id="sortOrder" type="hidden" value="true" />
							
					</form>
					<form class="form-horizontal" id="frmParterContactsAjax"
						name="frmParterContactsAjax"
						action="<c:url value="${pageContext.request.contextPath}/partner/contacts/sort" />"
						method="POST"></form>
			</section>

			<div class="overlay"></div>
		</section>
		<!-- Common_content Ends-->

	</section>
	<!-- Main ends-->
</div>
<!-- Wrapper ends-->
<div id="confirmDialog" class="common_custom_modal_aa">
  <span class="close" onclick="closeDialog();">X</span>
  <div class="modal_content"> 
    <div class="aa_up">
        Do you really want to delete this data?</div>
     
         <div class="aa_down" id="yes"> <a style="cursor:pointer;" onclick="deleteContact();" class="aa_yes">Yes </a> 
         <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>


  </div>
</div>

</html>

<script type="text/javascript">
$(document).ready(function(){
	var mousewheelevt = (/Firefox/i.test(navigator.userAgent)) ? "DOMMouseScroll" : "mousewheel";
	$('.common_in_content').bind(mousewheelevt, function(e){
       $("#frmParterContactsAjax").ajaxSubmit({
	        url: "${pageContext.request.contextPath}/partner/contacts/bringNewRows",
			type : "GET",
	        success: function(data)
	        {
	            if(null!=data)
		            {
					$(data).each(function(index,element){
						var creationDate = convertToDate(element.creationDate);
						
						var recordType =null; 
					 	if(element.recordTypeID==14005)
						{
							$('.iocn').addClass('opportunity'); 
						}
						else if(element.recordTypeID==14007)
						{
							$('.iocn').addClass('pclient'); 
							
						}
						else if(element.recordTypeID==14006)
						{
							 $('.iocn').addClass('client'); 
						}
						
						var innerHTMML="";
							
						innerHTMML='<li class="contact_li">';
						innerHTMML=innerHTMML+'<div class="person clearfix">';
						innerHTMML=innerHTMML+'<div class="chekbox_parent"> <span class="white_checkbox"></span>';
						innerHTMML=innerHTMML+'<input type="checkbox" value="" id="'+element.partyId+'" name="contact_person" class="default_checkbox" onclick="click();"/>';
						innerHTMML=innerHTMML+'</div>';
						innerHTMML=innerHTMML+'<div class="personal_details clearfix"> <span class="name">'+element.name+'</span>';
						innerHTMML=innerHTMML+'<div class="iocn"></div>';
						innerHTMML=innerHTMML+'</div>';
						innerHTMML=innerHTMML+'<button class="action"></button>';
						innerHTMML=innerHTMML+'</div>';
						innerHTMML=innerHTMML+'<div class="progress">';
						
						if(element.currentStageId==7006){
							innerHTMML=innerHTMML+'<div class="complete" style="width:0%;"></div>';
			            }else if(element.currentStageId==7001){
			            	innerHTMML=innerHTMML+'<div class="complete" style="width:25%;"></div>';
			            }else if(element.currentStageId==7007){
			            	innerHTMML=innerHTMML+'<div class="complete" style="width:50%;"></div>';
			            }else if(element.currentStageId==7002){
			            	innerHTMML=innerHTMML+'<div class="complete" style="width:75%;"></div>';
			            }else if(element.currentStageId==7003){
			            	innerHTMML=innerHTMML+'<div class="complete" style="width:100%;"></div>';
			            }			            
			            
			            innerHTMML=innerHTMML+'</div>';
			            innerHTMML=innerHTMML+'<ul class="clearfix reset person_details">';
			            innerHTMML=innerHTMML+'<li class="clearfix">';
			            innerHTMML=innerHTMML+'<div class="first_col city">';
			            innerHTMML=innerHTMML+'<label>City :</label>';
			            innerHTMML=innerHTMML+'<span class="value">'+element.city+'</span></div>';
			            innerHTMML=innerHTMML+'<div class="second_col creation_date">';
			            innerHTMML=innerHTMML+'<label>Creation Date :</label>';
			            innerHTMML=innerHTMML+'<span class="value">'+creationDate+'</span></div>';
			            innerHTMML=innerHTMML+'</li>';
			            innerHTMML=innerHTMML+'<li class="clearfix">';
			            innerHTMML=innerHTMML+'<div class="first_col status">';
			            innerHTMML=innerHTMML+'<label>Status :</label>';
			            innerHTMML=innerHTMML+'<span class="value">'+element.status+'</span></div>';
			            innerHTMML=innerHTMML+'<div class="second_col dc_stage">';
			            innerHTMML=innerHTMML+'<label>DC Stage :</label>';
			            innerHTMML=innerHTMML+'<span class="value">'+element.dcStage+'</span></div>';
			            innerHTMML=innerHTMML+'</li>';
			            innerHTMML=innerHTMML+'<li class="clearfix">';
			            innerHTMML=innerHTMML+'<div class="first_col phone_no">';
			            innerHTMML=innerHTMML+'<label>Ph. No :</label>';
			            innerHTMML=innerHTMML+'<span class="value">'+element.phoneNumber+'</span></div>';
			            innerHTMML=innerHTMML+'<div class="second_col email_id clearfix">';
			            innerHTMML=innerHTMML+'<label class="fl">Email id :</label>';
			            innerHTMML=innerHTMML+'<div class="container fr">';
			            innerHTMML=innerHTMML+'<span class="value">'+element.emailId+'</span></div></div>';
			            innerHTMML=innerHTMML+'</li>';
			            innerHTMML=innerHTMML+'</ul>';
			            innerHTMML=innerHTMML+'<div id="action_popup" class="clearfix">';
			            innerHTMML=innerHTMML+'<a href="${pageContext.request.contextPath}/partner/edit/'+element.partyId+'/'+element.name+'"><div class="click_action" id="edit"><span class="icon"></span></div></a>';
			            innerHTMML=innerHTMML+'<a href="${pageContext.request.contextPath}/partner/datacollection/'+element.partyId+'/'+element.name+'/'+element.recordTypeID+'"><div class="click_action" id="data_collect"><span class="icon"></span></div></a>';
			            innerHTMML=innerHTMML+'<div class="click_action" id="add_note"><span class="icon"></span></div>';
			            //innerHTMML=innerHTMML+'<div class="click_action" id="help"><span class="icon"></span></div>';
			            innerHTMML=innerHTMML+'</div>';
			            innerHTMML=innerHTMML+'<div id="add_note_actions">';
			            innerHTMML=innerHTMML+'<ul class="reset clearfix">';
			            innerHTMML=innerHTMML+'<li id="analysis_report">';
			            innerHTMML=innerHTMML+'<div class="main_name">Analysis Report</div>';
			            innerHTMML=innerHTMML+'<div class="note_actions clearfix">';
			            innerHTMML=innerHTMML+'<div class="view">View</div>';
			            innerHTMML=innerHTMML+'<div class="email">Email</div>';
			            innerHTMML=innerHTMML+'</div>';
			            innerHTMML=innerHTMML+'</li>';
			            innerHTMML=innerHTMML+'<li id="action_plan_cust">';
			            innerHTMML=innerHTMML+'<div class="main_name">Action Plan (Customer)</div>';
			            innerHTMML=innerHTMML+'<div class="note_actions clearfix">';
			            innerHTMML=innerHTMML+'<div class="view">View</div>';
			            innerHTMML=innerHTMML+'<div class="email">Email</div>';
			            innerHTMML=innerHTMML+'</div>';
			            innerHTMML=innerHTMML+'</li>';
			            innerHTMML=innerHTMML+'<li id="action_plan_fa">';
			            innerHTMML=innerHTMML+'<div class="main_name">Action Plan (FA)</div>';
			            innerHTMML=innerHTMML+'<div class="note_actions clearfix">';
			            innerHTMML=innerHTMML+'<div class="view">View</div>';
			            innerHTMML=innerHTMML+'<div class="email">Email</div>';
			            innerHTMML=innerHTMML+'</div>';
			            innerHTMML=innerHTMML+'</li>';
			            innerHTMML=innerHTMML+'</ul>';
			            innerHTMML=innerHTMML+'</div>';
			            innerHTMML=innerHTMML+'</li>';
						$("ul#contacts").append(innerHTMML);      
           		});
				} else {
	                $('div#loadmoreajaxloader').html('<center>No more posts to show.</center>');
	            }
        	}
        });
    });
});


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


	function sort(data){
			$(data).each(function(index,element){
				var creationDate = convertToDate(element.creationDate);
				 
			 	if(element.recordTypeID==14005)
				{
					$('.iocn').addClass('opportunity'); 
				}
				else if(element.recordTypeID==14007)
				{
					$('.iocn').addClass('pclient'); 
					
				}
				else if(element.recordTypeID==14006)
				{
					 $('.iocn').addClass('client'); 
				}
				
			 	var innerHTMML="";
				
				innerHTMML='<li class="contact_li">';
				innerHTMML=innerHTMML+'<div class="person clearfix">';
				innerHTMML=innerHTMML+'<div class="chekbox_parent"> <span class="white_checkbox"></span>';
				innerHTMML=innerHTMML+'<input type="checkbox" value="" id="'+element.partyId+'" name="contact_person" class="default_checkbox" onclick="click();"/>';
				innerHTMML=innerHTMML+'</div>';
				innerHTMML=innerHTMML+'<div class="personal_details clearfix"> <span class="name">'+element.name+'</span>';
				innerHTMML=innerHTMML+'<div class="iocn"></div>';
				innerHTMML=innerHTMML+'</div>';
				innerHTMML=innerHTMML+'<button class="action"></button>';
				innerHTMML=innerHTMML+'</div>';
				innerHTMML=innerHTMML+'<div class="progress">';
				
				if(element.currentStageId==7006){
					innerHTMML=innerHTMML+'<div class="complete" style="width:0%;"></div>';
	            }else if(element.currentStageId==7001){
	            	innerHTMML=innerHTMML+'<div class="complete" style="width:25%;"></div>';
	            }else if(element.currentStageId==7007){
	            	innerHTMML=innerHTMML+'<div class="complete" style="width:50%;"></div>';
	            }else if(element.currentStageId==7002){
	            	innerHTMML=innerHTMML+'<div class="complete" style="width:75%;"></div>';
	            }else if(element.currentStageId==7003){
	            	innerHTMML=innerHTMML+'<div class="complete" style="width:100%;"></div>';
	            }			            
	            
	            innerHTMML=innerHTMML+'</div>';
	            innerHTMML=innerHTMML+'<ul class="clearfix reset person_details">';
	            innerHTMML=innerHTMML+'<li class="clearfix">';
	            innerHTMML=innerHTMML+'<div class="first_col city">';
	            innerHTMML=innerHTMML+'<label>City :</label>';
	            innerHTMML=innerHTMML+'<span class="value">'+element.city+'</span></div>';
	            innerHTMML=innerHTMML+'<div class="second_col creation_date">';
	            innerHTMML=innerHTMML+'<label>Creation Date :</label>';
	            innerHTMML=innerHTMML+'<span class="value">'+creationDate+'</span></div>';
	            innerHTMML=innerHTMML+'</li>';
	            innerHTMML=innerHTMML+'<li class="clearfix">';
	            innerHTMML=innerHTMML+'<div class="first_col status">';
	            innerHTMML=innerHTMML+'<label>Status :</label>';
	            innerHTMML=innerHTMML+'<span class="value">'+element.status+'</span></div>';
	            innerHTMML=innerHTMML+'<div class="second_col dc_stage">';
	            innerHTMML=innerHTMML+'<label>DC Stage :</label>';
	            innerHTMML=innerHTMML+'<span class="value">'+element.dcStage+'</span></div>';
	            innerHTMML=innerHTMML+'</li>';
	            innerHTMML=innerHTMML+'<li class="clearfix">';
	            innerHTMML=innerHTMML+'<div class="first_col phone_no">';
	            innerHTMML=innerHTMML+'<label>Ph. No :</label>';
	            innerHTMML=innerHTMML+'<span class="value">'+element.phoneNumber+'</span></div>';
	            innerHTMML=innerHTMML+'<div class="second_col email_id clearfix">';
	            innerHTMML=innerHTMML+'<label class="fl">Email id :</label>';
	            innerHTMML=innerHTMML+'<div class="container fr">';
	            innerHTMML=innerHTMML+'<span class="value">'+element.emailId+'</span></div></div>';
	            innerHTMML=innerHTMML+'</li>';
	            innerHTMML=innerHTMML+'</ul>';
	            innerHTMML=innerHTMML+'<div id="action_popup" class="clearfix">';
	            innerHTMML=innerHTMML+'<a href="${pageContext.request.contextPath}/partner/edit/'+element.partyId+'/'+element.name+'"><div class="click_action" id="edit"><span class="icon"></span></div></a>';
	            innerHTMML=innerHTMML+'<a href="${pageContext.request.contextPath}/partner/datacollection/'+element.partyId+'/'+element.name+'/'+element.recordTypeID+'"><div class="click_action" id="data_collect"><span class="icon"></span></div></a>';
	            innerHTMML=innerHTMML+'<div class="click_action" id="add_note"><span class="icon"></span></div>';
	            //innerHTMML=innerHTMML+'<div class="click_action" id="help"><span class="icon"></span></div>';
	            innerHTMML=innerHTMML+'</div>';
	            innerHTMML=innerHTMML+'<div id="add_note_actions">';
	            innerHTMML=innerHTMML+'<ul class="reset clearfix">';
	            innerHTMML=innerHTMML+'<li id="analysis_report">';
	            innerHTMML=innerHTMML+'<div class="main_name">Analysis Report</div>';
	            innerHTMML=innerHTMML+'<div class="note_actions clearfix">';
	            innerHTMML=innerHTMML+'<div class="view">View</div>';
	            innerHTMML=innerHTMML+'<div class="email">Email</div>';
	            innerHTMML=innerHTMML+'</div>';
	            innerHTMML=innerHTMML+'</li>';
	            innerHTMML=innerHTMML+'<li id="action_plan_cust">';
	            innerHTMML=innerHTMML+'<div class="main_name">Action Plan (Customer)</div>';
	            innerHTMML=innerHTMML+'<div class="note_actions clearfix">';
	            innerHTMML=innerHTMML+'<div class="view">View</div>';
	            innerHTMML=innerHTMML+'<div class="email">Email</div>';
	            innerHTMML=innerHTMML+'</div>';
	            innerHTMML=innerHTMML+'</li>';
	            innerHTMML=innerHTMML+'<li id="action_plan_fa">';
	            innerHTMML=innerHTMML+'<div class="main_name">Action Plan (FA)</div>';
	            innerHTMML=innerHTMML+'<div class="note_actions clearfix">';
	            innerHTMML=innerHTMML+'<div class="view">View</div>';
	            innerHTMML=innerHTMML+'<div class="email">Email</div>';
	            innerHTMML=innerHTMML+'</div>';
	            innerHTMML=innerHTMML+'</li>';
	            innerHTMML=innerHTMML+'</ul>';
	            innerHTMML=innerHTMML+'</div>';
	            innerHTMML=innerHTMML+'</li>';
				$("ul#contacts").append(innerHTMML);
			});
			 $('#contact_list #contacts .name').perfectScrollbar();
	         $('#contact_list .container .value').perfectScrollbar();
		}
$( "body" ).on( "click", "span.white_checkbox", function() {
   	$(this).toggleClass("white_checkbox_checkbox_checked");	
   	if ($(this).next( ".default_checkbox" ).is(":checked")) {
    	$(this).next( ".default_checkbox" ).prop("checked", false);
   	} else {
      	$(this).next( ".default_checkbox" ).prop("checked", true);
   	}
});
$( "body" ).on( "click","#contact_list #contacts .personal_details",function(){
   	$("#contact_list #contacts .personal_details").parent().siblings(".person_details").slideUp("slow");
   	$("#contact_list #contacts .action").parent().siblings("#action_popup").slideUp("slow");
   	$("#contact_list #contacts .action").parent().siblings("#add_note_actions").slideUp("slow");
   	if((!$(this).parent().siblings(".person_details").is(':visible')))
   	{
	 	$(this).parent().siblings(".person_details").slideDown("slow"); 
		$('#contact_list .container .value').perfectScrollbar('update');		
   	}   
});
		
$( "body" ).on( "click","#contact_list #contacts .action",function(){
	$("#contact_list #contacts .action").parent().siblings("#action_popup").slideUp("slow");
	$("#contact_list #contacts .action").parent().siblings("#add_note_actions").slideUp("slow");
	if((!$(this).parent().siblings("#action_popup").is(':visible')))
	{
		$(this).parent().siblings("#action_popup").slideDown("slow");  
	}
	return false;
});
		
/* $("#contact_list #contacts .personal_details").click(function(){
   	$("#contact_list #contacts .personal_details").parent().siblings(".person_details").slideUp("slow");
   	$("#contact_list #contacts .action").parent().siblings("#action_popup").slideUp("slow");
   	$("#contact_list #contacts .action").parent().siblings("#add_note_actions").slideUp("slow");
   	if((!$(this).parent().siblings(".person_details").is(':visible')))
   	{
	 	$(this).parent().siblings(".person_details").slideDown("slow");  
   	}   
	}); */

	function searchContact(){
		$("#searchcontactId").ajaxSubmit({
		
		url: "${pageContext.request.contextPath}/partner/contacts/search",
			type : "GET",
			dataType : "json",
				success: function(data){
					//$('#searchcontactId').attr('action', '${pageContext.request.contextPath}/partner/contacts/search');
					if(data == ""){
						$('#totalContactsFound').html("0 ");
						$('#found').css("display","none");
						$('#notfound').css("display","block");
					}else{
						$('#totalContactsFound').html(data.length);
						$('#found').css("display","block");
						$('#notfound').css("display","none");
					}
					$("ul#contacts").html("");
					$(data).each(function(index,element){
						var creationDate = convertToDate(element.creationDate);

						var recordType =null; 
					 	if(element.recordTypeID==14005)
						{
							$('.iocn').addClass('opportunity'); 
						}
						else if(element.recordTypeID==14007)
						{
							$('.iocn').addClass('pclient'); 
							
						}
						else if(element.recordTypeID==14006)
						{
							 $('.iocn').addClass('client'); 
						}
						
					 	var innerHTMML="";
						
						innerHTMML='<li class="contact_li">';
						innerHTMML=innerHTMML+'<div class="person clearfix">';
						innerHTMML=innerHTMML+'<div class="chekbox_parent"> <span class="white_checkbox"></span>';
						innerHTMML=innerHTMML+'<input type="checkbox" value="" id="'+element.partyId+'" name="contact_person" class="default_checkbox" onclick="click();"/>';
						innerHTMML=innerHTMML+'</div>';
						innerHTMML=innerHTMML+'<div class="personal_details clearfix"> <span class="name">'+element.name+'</span>';
						innerHTMML=innerHTMML+'<div class="iocn"></div>';
						innerHTMML=innerHTMML+'</div>';
						innerHTMML=innerHTMML+'<button class="action"></button>';
						innerHTMML=innerHTMML+'</div>';
						innerHTMML=innerHTMML+'<div class="progress">';
						
						if(element.currentStageId==7006){
							innerHTMML=innerHTMML+'<div class="complete" style="width:0%;"></div>';
			            }else if(element.currentStageId==7001){
			            	innerHTMML=innerHTMML+'<div class="complete" style="width:25%;"></div>';
			            }else if(element.currentStageId==7007){
			            	innerHTMML=innerHTMML+'<div class="complete" style="width:50%;"></div>';
			            }else if(element.currentStageId==7002){
			            	innerHTMML=innerHTMML+'<div class="complete" style="width:75%;"></div>';
			            }else if(element.currentStageId==7003){
			            	innerHTMML=innerHTMML+'<div class="complete" style="width:100%;"></div>';
			            }			            
			            
			            innerHTMML=innerHTMML+'</div>';
			            innerHTMML=innerHTMML+'<ul class="clearfix reset person_details">';
			            innerHTMML=innerHTMML+'<li class="clearfix">';
			            innerHTMML=innerHTMML+'<div class="first_col city">';
			            innerHTMML=innerHTMML+'<label>City :</label>';
			            innerHTMML=innerHTMML+'<span class="value">'+element.city+'</span></div>';
			            innerHTMML=innerHTMML+'<div class="second_col creation_date">';
			            innerHTMML=innerHTMML+'<label>Creation Date :</label>';
			            innerHTMML=innerHTMML+'<span class="value">'+creationDate+'</span></div>';
			            innerHTMML=innerHTMML+'</li>';
			            innerHTMML=innerHTMML+'<li class="clearfix">';
			            innerHTMML=innerHTMML+'<div class="first_col status">';
			            innerHTMML=innerHTMML+'<label>Status :</label>';
			            innerHTMML=innerHTMML+'<span class="value">'+element.status+'</span></div>';
			            innerHTMML=innerHTMML+'<div class="second_col dc_stage">';
			            innerHTMML=innerHTMML+'<label>DC Stage :</label>';
			            innerHTMML=innerHTMML+'<span class="value">'+element.dcStage+'</span></div>';
			            innerHTMML=innerHTMML+'</li>';
			            innerHTMML=innerHTMML+'<li class="clearfix">';
			            innerHTMML=innerHTMML+'<div class="first_col phone_no">';
			            innerHTMML=innerHTMML+'<label>Ph. No :</label>';
			            innerHTMML=innerHTMML+'<span class="value">'+element.phoneNumber+'</span></div>';
			            innerHTMML=innerHTMML+'<div class="second_col email_id clearfix">';
			            innerHTMML=innerHTMML+'<label class="fl">Email id :</label>';
			            innerHTMML=innerHTMML+'<div class="container fr">';
			            innerHTMML=innerHTMML+'<span class="value">'+element.emailId+'</span></div></div>';
			            innerHTMML=innerHTMML+'</li>';
			            innerHTMML=innerHTMML+'</ul>';
			            innerHTMML=innerHTMML+'<div id="action_popup" class="clearfix">';
			            innerHTMML=innerHTMML+'<a href="${pageContext.request.contextPath}/partner/edit/'+element.partyId+'/'+element.name+'"><div class="click_action" id="edit"><span class="icon"></span></div></a>';
			            innerHTMML=innerHTMML+'<a href="${pageContext.request.contextPath}/partner/datacollection/'+element.partyId+'/'+element.name+'/'+element.recordTypeID+'"><div class="click_action" id="data_collect"><span class="icon"></span></div></a>';
			            innerHTMML=innerHTMML+'<div class="click_action" id="add_note"><span class="icon"></span></div>';
			            //innerHTMML=innerHTMML+'<div class="click_action" id="help"><span class="icon"></span></div>';
			            innerHTMML=innerHTMML+'</div>';
			            innerHTMML=innerHTMML+'<div id="add_note_actions">';
			            innerHTMML=innerHTMML+'<ul class="reset clearfix">';
			            innerHTMML=innerHTMML+'<li id="analysis_report">';
			            innerHTMML=innerHTMML+'<div class="main_name">Analysis Report</div>';
			            innerHTMML=innerHTMML+'<div class="note_actions clearfix">';
			            innerHTMML=innerHTMML+'<div class="view">View</div>';
			            innerHTMML=innerHTMML+'<div class="email">Email</div>';
			            innerHTMML=innerHTMML+'</div>';
			            innerHTMML=innerHTMML+'</li>';
			            innerHTMML=innerHTMML+'<li id="action_plan_cust">';
			            innerHTMML=innerHTMML+'<div class="main_name">Action Plan (Customer)</div>';
			            innerHTMML=innerHTMML+'<div class="note_actions clearfix">';
			            innerHTMML=innerHTMML+'<div class="view">View</div>';
			            innerHTMML=innerHTMML+'<div class="email">Email</div>';
			            innerHTMML=innerHTMML+'</div>';
			            innerHTMML=innerHTMML+'</li>';
			            innerHTMML=innerHTMML+'<li id="action_plan_fa">';
			            innerHTMML=innerHTMML+'<div class="main_name">Action Plan (FA)</div>';
			            innerHTMML=innerHTMML+'<div class="note_actions clearfix">';
			            innerHTMML=innerHTMML+'<div class="view">View</div>';
			            innerHTMML=innerHTMML+'<div class="email">Email</div>';
			            innerHTMML=innerHTMML+'</div>';
			            innerHTMML=innerHTMML+'</li>';
			            innerHTMML=innerHTMML+'</ul>';
			            innerHTMML=innerHTMML+'</div>';
			            innerHTMML=innerHTMML+'</li>';
						$("ul#contacts").append(innerHTMML);
					});
			        $('#contact_list #contacts .name').perfectScrollbar();
	                $('#contact_list .container .value').perfectScrollbar();
                  

					
				 },
				 error : function(xhr, status, error) {
						 	
				 } 
			});
	
		};

		var checkedIds='';
		
		
	function ConfirmDeletion(){
		checkedIds='0,'
		checkedIds =checkedIds+  $(":checkbox:checked").map(function() {
		       return this.id;
		    }).get();
			if(checkedIds !=null && checkedIds!= "0," )
				{						
				        $(".overlay").fadeIn("slow");
				    	$("#confirmDialog").fadeIn("slow");				    	
					
				}//END IF
				else {
					$("#successDialog").html("");
			 		$("#successDialog").html("Please select contact to delete.");
			 		$( "#successDialog").dialog( "open" );
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
		$("#successDialog").html("Contacts deleted successfully.");
 		$( "#successDialog").dialog( "open" );
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
		 		$("#successDialog").html("Please select contact to activate DCT.");
		 		$( "#successDialog").dialog( "open" );
			}
				
			
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
	
	$( "body" ).on( "click", "#resetCriteria",function(){
		$('#genericSearch').val("");
		$("#opportunityStatusID").selectBoxIt('selectOption', 0);
		$("#recordTypeID").selectBoxIt('selectOption', 0);
		$("#contactSourceTypeID").selectBoxIt('selectOption', 0);
		searchContact();
	});

	function closeDialog(){
		location.reload();
		$(".overlay").fadeOut("slow");
    	$("#confirmDialog").fadeOut("slow");
    	location.reload();
    	
	}
</script>