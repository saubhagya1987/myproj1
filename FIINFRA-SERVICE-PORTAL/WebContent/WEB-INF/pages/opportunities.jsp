<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Opportunities</title>
<script type="text/javascript">
//select all checkbox

	var hidePopupTimeoutId;

	function myFunction() {
		alert("Thank you for writing to us. We will take prompt action on this ticket and revert to you shortly.");
	}

	function oppsearch()
	{
		var id=0;
		var sPageURL = window.location.search.substring(1);
		var sURLVariables = sPageURL.split('&');
		for (var i = 0; i < sURLVariables.length; i++)
		{
			var sParameterName = sURLVariables[i].split('=');
			if (sParameterName[0] == 'partyId')
			{
				id= sParameterName[1];
		 	}
		}
		var value = $('#search').val();   
		window.location.href = $('#contextPath').val()+"/partnersp/getOpportunitiesList.htm?partyId="+id+"&value="+value;
	}
	
	function addNote(){

		$("#deletenote, #editnote").hide();	
		$('#addnote').modal('show'); 
		
		/* $("#popUpAlertaddnote").css ('height','260px');
		$("#popUpAlertaddnote").css ('width','500px');
		$("#popUpAlertaddnote").css ('left','425px');
		$("#popUpAlertaddnote").css ('top','125px'); */
		}
	function deleteNote(){
		//alert("hieee");
		$(" #editnote,#addnote").hide();	
		$('#deletenote').modal('show'); 	
	}

	
	function selectForMove()
	{ 
		$("#addquickSearch").val('');
		$("#partyId").val(0);
		var selectedlvals = [];
	  	$('input:checkbox[id=chkdeleteselect]:checked').each(function() {
			selectedlvals.push($(this).val());
	  	});
	
		if(selectedlvals == ""){
			bootbox.dialog({
				message: "<span class='bigger-110'>Please select at least one opportunity.</span>",
				buttons: 			
				{
					"click" :
					{
						"label" : "OK!",
						"className" : "btn-sm btn-primary",
						"callback": function() {
							 location.reload();
							 document.getElementById("addForm").reset();	
						}
					}
				}
			});
			
			
			/* alert('Please select at least one opportunity');
		 	return; */
	  	}else{
	  		document.getElementById("selectedPartyIds").value = selectedlvals;
	  		addNote();
	  		/* popup('popUpAlertaddnote'); */
	  		//getPartnerList();
		}
	    
	  }
	
	
	
	function getPartnerList(){
		
		var searchString = $('#addquickSearch').val();
		
		if(searchString!=""){
			
		
		var event = window.event ? window.event : e;
		
		if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
			return;
		if(event.keyCode==13){
			search();
			return;
		}
		 $('.ui-autocomplete').css('z-index','9999999999999999');
		$.ajax
		({
	    	type: "GET",
	      	//url:$('#contextPath').val()+'/partnersp/getPartnerListForChange.htm?id='+id+'&searchString='+searchString,
	      	url:$('#contextPath').val()+'/partnersp/getPartnerListForChange.htm?addquickSearch='+searchString,
	      	dataType: 'json',
	      	contentType: 'application/json',
	        success:function(result)
	      	{ 		   
	        	var userLabelValueList = new Array();
	        	$(result).each(function(i, obj) {
		     		//var recordType = obj.recordType;
		      		//var partyId = obj.partyId;
	        		var object = {};
					object.value = obj.partyID;

					object.label = obj.partnerName;
					userLabelValueList.push(object);
		     	});
	        	
	        	
	        	
	        	 $("#addquickSearch")
				    // don't navigate away from the field on tab when selecting an item
				    .bind( "keydown", function( event ) {
				      if ( event.keyCode === $.ui.keyCode.TAB &&
				    		 
				    	$( this ).data( "ui-autocomplete" ).menu.active ) { 
				        event.preventDefault();
				      }
				    })
				   
				    
				    .autocomplete({
				      minLength: 0,
				      source: function( request, response ) {
				       last=extractLast(request.term);
				       if(last==null || last=='' || last==' ')
						{
							return false;
						}
				       response( $.ui.autocomplete.filter(userLabelValueList, request.term) );
				      },
				      focus: function() {
				        // prevent value inserted on focus
				        return false;
				      },
				     
				      select: function( event, ui ) {
				    	  var terms = split( this.value );
					        
					        console.log('terms='+terms);
					        
					        // remove the current input
					        terms.pop();
					        // add the selected item 
					        terms.push(ui.item.label);
//					        	partyId=ui.item.value;
					        	$('#partyId').val(ui.item.value)
						
					        terms.push( "" );
					        this.value = terms.join( ";" );
					        
					        var labelArr = $(this).data('label') || new Array();
					        labelArr.push(ui.item);
					        $(this).data('label',labelArr);
					        console.log($(this).data());
					        
					        return false;
				      }
				    });
	        	
	        	
	        	
	        	
	        	
	      	}
	   });
		}
	}
	function split( val ) {
	    return val.split( /;\s*/ );
	} 
	function extractLast( term ) {
	    return split( term ).pop();
	}
	
	
	
	function autovalid(){
		$('#addquickSearch').val('');
		$('#addquickSearch').focus();
		$('#partyId').val(0);
		bootbox.dialog({
			message: "<span class='bigger-110'>Please select valid Partner.</span>",
			buttons: 			
			{
				"click" :
				{
					"label" : "OK!",
					"className" : "btn-sm btn-primary",
					"callback": function() {
						
					}
				}
			}
		});
		//alert('Please select valid Partner.');
		
	}
	
	function SwitchPartner(){
		var selectedOpp= document.getElementById("selectedPartyIds").value;
		var PartyId = $('#partyId').val();
		//alert(selectedOpp +":" + PartyId);
		if(PartyId!=0){
		
		$.ajax({
			type: "POST",
	 		url: $('#contextPath').val()+'/partnersp/changePartnerForOPPOrClient.htm?selectedOpp='+selectedOpp+"&PartyId="+PartyId,
	 		dataType: 'json',
			contentType: 'application/json',
			success:function(result)
			{
				bootbox.dialog({
					message: "<span class='bigger-110'>Partner changed successfully</span>",
					buttons: 			
					{
						"click" :
						{
							"label" : "OK!",
							"className" : "btn-sm btn-primary",
							"callback": function() {
								 location.reload();
								// document.getElementById("addForm").reset();	
							}
						}
					}
				});
				/* alert('Partner changed successfully');
			  window.location.reload(); */
			}
		});
		} else {
			$('#addquickSearch').focus();
			
			bootbox.dialog({
				message: "<span class='bigger-110'>Please select Partner</span>",
				buttons: 			
				{
					"click" :
					{
						"label" : "OK!",
						"className" : "btn-sm btn-primary",
						"callback": function() {
							 location.reload();
							// document.getElementById("addForm").reset();	
						}
					}
				}
			});
			/* alert('Please select Partner'); */
		}
	}
</script>

<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico"
	rel="shortcut icon">



</head>
<body>
	<jsp:include page="../common/header.jsp" />

<form id="addForm" name="addForm">
	<%-- <div style="display: none; width: 500px; height: 300px; top:105px; overflow: auto; left:485px !important;"
		id="popUpAlertaddnote" class="alert">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpAlertaddnote')" href="#"><img alt=""
				src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
		</div> --%>
		
		<!-- --------------------Add form start----------------------------- -->
		
		<input type="hidden" name="sourceIdList" id="sourceIdList"> <input
				type="hidden" name="confirmdelete" id="confirmdelete" value="">
		<input type="hidden" name="selectedPartyIds" id="selectedPartyIds">
		<!-- <div id="addnote"> -->
		<div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
   			 <div class="modal-content">
      		<div class="modal-header">
       			 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Change Partner</h4> </div>
     						 
      <div class="modal-body">  
		
		
			<!-- <div id="popupwrapper_contactform">
				<div class="heading_contactform">
					<h3>Change Partner</h3>
				</div> -->
				<div id="poptable_contactform" style="padding: 10px; height: 140px;">
					<span class="searchpadding padding_top"
						style="float: left; width: 150px;">Select Partner <span
						class="red">*</span>
					</span> 
					<span class="searchpadding padding_top"	style="float: left; width: 178px;">
						<input type="text" id="addquickSearch" name="addquickSearch" class="form-control" onKeyUp="getPartnerList();">
						
					</span> 
					<span class="searchpadding padding_top"	style="float: left; margin-top: 7px;">
						<!-- <i class="searchiconblue"></i> --> 
						<input  type="hidden" id="partyId" name="partyId">
					</span>
					

				</div>
				<div class="topbuttonholder">
				 <button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="SPAddNewBroadCastLink" onclick="SwitchPartner();"> Save</button>
				<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button>
				
				
					<!-- <input class="dbtn" value="Save" id="Save" type="button" onclick="SwitchPartner();"> 
					<input class="dbtn" value="Cancel" id="Cancel" type="button" onClick="popup('popUpAlertaddnote')"> -->
				</div>
				<div class="clearfix"></div>
			</div>
		</div></div></div>
		</form>
	
	
	<!-- Delete popup Start -->
	
	
	<div class="modal fade" id="deletenote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
   			 <div class="modal-content">
      		<div class="modal-header">
       			 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Message</h4> 
		<!-- <div id="deletenote"> -->
			Do you want to delete this opportunities ? Please confirm.
			</div>
					<div class="modal-footer">
						<form>
							<!-- <input class="dbtn" value="Yes" id="Yes" type="button"
								onclick="confirmDelete();popup('popUpAlertaddnote');" />  -->
								<!-- <input
								class="dbtn" value="No" id="No" type="button"
								onclick="popup('popUpAlertaddnote');"/> -->
								<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="deleteOpportunityTrue();"> Yes</button>
								<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> No</button>
								
						</form>
					</div>
					<div class="clearfix"></div>
				
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	<!-- Center part start -->
	<section>
		
		
		
		<div>
			<div class="container-head">
				<div class="col-md-12" style="text-align: right;">
					<!-- accordion start-->

					<div class="accordion pull-left col-md-12" id="accordFundSel">
						<div class="accordion-group">
						  <div class="page-header clearfix">
						            <h1 class="pull-left">Opportunities</h1>
						            <div class="nav-search pull-right" id="">
						             <%--  <form class="form-search">
						                 <span class="input-icon">
						                <input type="text" placeholder="Search ..." class="nav-search-input" id="search"  autocomplete="off" value="${value}">
						                <i class="ace-icon fa fa-search nav-search-icon"></i></span>
						              </form> --%>
						            </div>
						          </div>
							<!-- <div class="col-md-11"style="width:99%;">
								<span style="float: left;">Opportunities</span>
								<span  class="col-md-10" style="float:right; margin-top:-6px;"> 
                  			<input name="text"  type="text" id="search"  style="width:100px;"  placeholder="Quick Search">
                  			&nbsp;<input type="button" class="dbtn" value="search" onclick="oppsearch()">
                  		</span>	
							</div>
							 -->
<!-- 							<div class="accordion-heading" style="float: right;"> -->
<!-- 							<span  class="col-md-10" style="float:right; margin-top:-3px;">  -->
<!--                   			<input name="text"  type="text" id="search"  style="width:100px;"  placeholder="Quick Search"> -->
<!--                   			&nbsp;<input type="button" class="dbtn" value="search" onclick="oppsearch()"> -->
<!--                   		</span> -->
<!-- <!-- 								<a class="accordion-toggle " data-toggle="collapse" -->
<!-- <!-- 									data-parent="#accordFundSel" href="#collapseFundSel"> <span --> 
<!-- <!-- 									style="margin-top: 0px;" class="searchicon" alt="Search" --> 
<!-- <!-- 									title="Search"></span> -->
<!-- <!-- 								</a> --> 
<!-- 							</div> -->
							<div style="height: auto;" id="collapseFundSel"
								class="accordion-body pull-left serchboxnew collapse">
								<div class="accordion-inner">

									<!--1 search start -->
									
									
									<div class="col-md-3 searchpadding">
										<div class="head">Status</div>
										<div class="drop_box_body">
											<ul class="nav  nav-stacked">
												<li><input id="15Large" value="15Large" type="checkbox">
													New</li>
												<li><input id="15Large" value="15Large" type="checkbox">
													Open</li>
												<li><input id="15Large" value="15Large" type="checkbox">
													Cancelled</li>
												<li><input id="15Large" value="15Large" type="checkbox">
													Converted</li>


											</ul>
										</div>
									</div>
								</div>


			

								<div class="box_button pull-left">
									<button type="button" id="updatefilterlist" class="btn">Show</button>
								</div>

							</div>
							<!-- accordion-body END -->
						</div>
						<!-- accordion-group END -->
					</div>
					<!-- accordion  END -->


					<!-- accordion End -->
				</div>
			</div>
			<div class="container-body">
			<ul class="pagination pagination-sm">
            </ul>	
<!-- 				<div class="topmenu"> -->
<!-- 					<div class="dropdown pull-left"> -->
<!-- 						<a class="dropdown-toggle" href="#" data-toggle="dropdown"><input -->
<!-- 							data-params="{}" type="button" class="dbtn createNewBtn" -->
<!-- 							value="  More Action" title="More Action" alt="More Action"></a> -->
<!-- 						<ul class="dropdown-menu" -->
<!-- 							style="min-width: 100px; padding: 0 20px 0 0; margin-left: 0px;"> -->
<!-- 							<li><a href="send_mass_email.html"><i class="emailicon"></i><span -->
<!-- 									class="user">Mass Email</span></a></li> -->
<!-- 							<li><a href="send_mass_sms.html"><i class="callicon"></i><span -->
<!-- 									class="user">Mass SMS</span></a></li> -->
<!-- 							<li><a href="#"><i class="callicon"></i><span -->
<!-- 									class="user">Bulk - DC Reminder</span></a></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</div> -->
 		<div class="topmenu">
 			
 			<div class="pull-right">
 			<a href="#">
 				<input id="SPMoveOpportunity" data-params="{}" type="button" class="btn btn-sm btn-primary " value="  Change Partner"
						onClick="selectForMove();" title="Change Partner" alt="Change Partner">
			</a>
			<%-- <a href="<%=request.getContextPath()%>/addOpportunity.htm?partyId="+partyId id="SPnewOpportunityLink"> --%>
			<input data-params="{}" type="button" class="btn btn-sm btn-primary " value="  New Opportunitity" title="New Opportunitity" alt="New Opportunitity" onclick="add();"></a>
			<a href="<%=request.getContextPath()%>/bulkUploadOpportunity.htm" id="SPimportOpportunityLink">
			<input type="button" class="btn btn-sm btn-success " value="  Import Opportunities" title="Import Opportunities"></a>
			<input data-params="{}" type="button" class="btn btn-sm btn-danger" id="SPdeleteOpportunityLink" value=" Delete Opportunities"  title="Delete Opportunities" onclick="deleteOpportunities();">
				
				</div>	<br /><br />
					<div class="clearfix"></div>
		</div> 

<br/>
				<div class="table-responsive" id="display_table_lead"
					style="border: none;">
					<div id="toreload">
					 	 <table id="grid-table"> </table>
                		 <div id="grid-pager"></div>
	
	<%-- 
				 <display:table name="opportunityDatas" uid="objPortalUser" class="table table-hover table-bordered table-striped" requestURI="#" sort="list" pagesize="${pagesize}" id="data" export="false"> 
					
					<display:column  style=""  sortable="true">
						<a href="<%=request.getContextPath()%>/addOpportunity.htm?partyId=${data.partyId}" id="editOpportunityLink"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit Opportunity"></a>
					</display:column>
					
					<display:column  style=""  sortable="true">
					
						<a href="<%=request.getContextPath()%>/addOpportunity.htm?partyId=${data.partyId}"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit Opportunity"></a>
						
						<a onclick="viewOpportunityDetails(${data.partyId})"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="View Opportunity"></a>
					</display:column>
					
					<display:column	title="<input type='checkbox' id='selecctall' name='selecctall'/>">
						<span class="thead"> 
							<input type="checkbox"	id="chkdeleteselect" class="checkbox1" name="chkdeleteselect[]"
										value="${data.partyId}">
						</span>
					</display:column>
					
					<display:column class="" style="" title="Name" sortable="true">	
						<i class="opportunityicon"></i><span style="color: #777;font-size: 11px;font-weight: bold;">${data.name}</span>
					</display:column>
					
					<display:column property="city" class="" style="" title="City" sortable="true">				
					</display:column>
					
					<display:column property="createdDate" class="" style="" title="Created Date" sortable="true">				
					</display:column> --%>
					
<%-- 					<display:column  class="" style="" title="Status" sortable="true">					 --%>
<%-- 						<c:choose> --%>
<%-- 						    <c:when test="${data.status=='New'}"> --%>
<%-- 			 			   		<span class="label label-info">${data.status}</span> --%>
<%-- 			   				</c:when> --%>
<%-- 			    			<c:when test="${data.status=='Open'}"> --%>
<%-- 			    				<span class="label label-warning">${data.status}</span> --%>
<%-- 			    			</c:when>			    			 --%>
<%-- 			    			<c:when test="${data.status=='Close'}"> --%>
<%-- 			    				<span class="label label-danger">${data.status}</span> --%>
<%-- 			    			</c:when> --%>
<%-- 			   				<c:when test="${data.status=='Cancelled'}"> --%>
<%-- 			   					<span class="label label-danger">${data.status}</span> --%>
<%-- 			    			</c:when> --%>
<%-- 	   					</c:choose> --%>
<%-- 					</display:column> --%>
					
				<%-- 	<display:column property="email" class="" style="" title="Email Id" sortable="true">				
					</display:column>
					
					<display:column property="mobile" class="" style="" title="Contact Number" sortable="true">				
					</display:column>
					
					<display:column style="" title="DC Activated?" sortable="true">
					<c:choose>
					 	<c:when test="${data.dcActivation != '0'}">
					 		<div title="Yes" style="cursor: pointer;">					 	
					    		<div style="align : center;">Yes</div>
					    	</div>
					    </c:when>
					    <c:otherwise>
					    	<div title="No" style="cursor: pointer;">					 	
					    		<div style="align : center;">No</div>
					    	</div>
					    </c:otherwise>
	   				</c:choose>							
					</display:column> --%>
					<%-- <display:column  style="" title="Stage" sortable="true">										
						<c:choose >						
						    <c:when test="${data.stage=='Open'}">
						    <div class="progress progress-success progress-striped" title="0%" onclick="$('#popupstage${data.partyId}').show()" style="cursor: pointer;">
						    	<div class="bar" style="width: 0%">${data.stage}</div>
						
			 			   	</div>
			   				</c:when>
			    			<c:when test="${data.stage=='DCT Activated'}">
			    			<div class="progress progress-success progress-striped" title="25%" onclick="$('#popupstage${data.partyId}').show()" style="cursor: pointer;">
			    				<div class="bar" style="width: 25%"></div>
			    		
			    				
			    			</div>
			    			</c:when>			    			
			    			<c:when test="${data.stage=='DCT Partially Filled'}">
			    			<div class="progress progress-success progress-striped" title="50%" onclick="$('#popupstage${data.partyId}').show()" style="cursor: pointer;">
			    				<div class="bar" style="width: 50%"></div>
			    				</div>
			    			</c:when>
			   				<c:when test="${data.stage=='DCT Completed' || data.stage=='DCT Submitted'}">
			   				<div class="progress progress-success progress-striped" title="75%" onclick="$('#popupstage${data.partyId}').show()" style="cursor: pointer;">
			   					<div class="bar" style="width: 75%" ></div>
			   				</div>
			    			</c:when>
			    			<c:when test="${data.stage=='Execution Open'}" >
			    			<div class="progress progress-success progress-striped" title="90%" onclick="$('#popupstage${data.partyId}').show()" style="cursor: pointer;">
			   					<div class="bar" style="width: 90%"></div>
			   				</div>
			    			</c:when>
			    			<c:when test="${data.stage=='Execution Complete'}">
			    			<div class="progress progress-success progress-striped" title="100%" onclick="$('#popupstage${data.partyId}').show()" style="cursor: pointer;">
			   					<div class="bar" style="width: 100%"></div>
			   				</div>
			    			</c:when>
	   					
	   					</c:choose> --%>
	   					
	   	<%-- <div class="popupnew" id="popupstage${data.partyId}">
		<div class="arrow"></div>
        <div class="close" ><a onClick="$('#popupstage${data.partyId}').hide()" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>
        
        <table class="table table-bordered table-striped" id="stage${data.partyId}">
        	<tr>
            	<th>Stage</th>
                <th>Status</th>
                <th>Start Date</th>
                <th>End Date</th>
            </tr>
            
            
        </table>
   		</div> --%>
	   					
					<%-- </display:column> --%>
					
<%-- 					<display:column  style="" title="Action"  sortable="true"> --%>
						
						
					
<%-- 					<a class="choose2" href="#" onclick="getPopUpAction('popup${data.partyId}');" style="color: #428bca;">Action </a> --%>
<%-- 					<div class="popupnew2" id="popup${data.partyId}" >					 --%>
<%--         				<div class="close" ><a onClick="$('.popupnew2').hide()" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div> --%>
<%--        					<table id="TaskList${data.partyId}" class="table table-bordered table-striped tasklist" width="100%" cellpadding="0" cellspacing="0"> --%>
<%-- 				        	<tr id="TaskListtr1${data.partyId}"> --%>
<!-- 				            	<th class="thead">Action List</th> -->
<!-- 				                <th class="thead">Document List</th> -->
<!-- 				                <th class="thead">Task List</th> -->
<!-- 				            </tr> -->
<%-- 				            <tr id="TaskListtr2${data.partyId}"> --%>
				             
<%-- 				            	<td><i class="activatgrey_icon"></i><a href="#" onclick="$('.popupnew2').hide();redirectDcActivation(${data.partyId})" style="color:#333;"><span class="user">DC Activation</span></a></td> --%>
<%-- 				                <td onclick="$('.popupnew2').hide();downloadAttachment(${data.analysisReportDocumentID})"><i class="outputreport_icon"></i><a href="#"  style="color:#333;"><span class="user">Analysis Report</span></a></td> --%>
<!-- <!-- 				                <td><a href="#"  style="font-size:11px;">Meeting on 14th Feb</a></td> --> 
<!-- 				            </tr> -->
<%-- 				             <tr id="TaskListtr3${data.partyId}"> --%>
<!-- 				            	<td> -->
<%-- 				            	<c:choose >						 --%>
<%-- 						    <c:when test="${data.executionStatusStr=='not have'}"> --%>
<%-- 						    	<i class="datacollectionicon" > </i><a href="#" onclick="$('.popupnew2').hide();redirectDcInput(${data.partyId},${data.buId},'${data.name}')" style="color:#333;"><span class="user">DC Input </span></a> --%>
<%-- 						    </c:when> --%>
<%-- 						    <c:otherwise> --%>
<%-- 						    <i class="datacollectionicon" > </i><a href="#" onclick="$('.popupnew2').hide();redirectDcInput(${data.partyId},${data.buId},'${data.name}')" style="color:#333;pointer-events: none;cursor: default;"><span class="user">DC Input </span></a> --%>
<%-- 						    </c:otherwise> --%>
<%-- 						    </c:choose> --%>
				            	
<!-- 				            	</td> -->
<%-- 				                <td onclick="$('.popupnew2').hide();downloadAttachment(${data.clientActionPlanDocumentID})"><i class="outputreport_icon"></i><a href="#"  style="color:#333;"><span class="user">Client Action Plan</span></a></td> --%>
<!-- <!-- 				                <td><a href="#" style="font-size:11px;">Follow up call on 16th Feb</a> </td> --> 
<!-- 				            </tr> -->
<%-- 				            <tr id="TaskListtr4${data.partyId}"> --%>
<%--                					<td><i class="remindericon"> </i><a onclick="$('.popupnew2').hide();sendDCReminder(${data.partyId})" style="color:#333;" ><span class="user">DC Reminder </span></a> </td> --%>
<%-- 					            <td onclick="$('.popupnew2').hide();downloadAttachment(${data.advisorActionPlanDocumentID})"><i class="outputreport_icon"></i><a href="#"  style="color:#333;"><span class="user">Partner Action Plan</span></a></td> --%>
<!-- <!-- 					            <td>&nbsp;</td> --> 
<!-- 					        </tr> -->
<%-- 				            <tr id="TaskListtr5${data.partyId}"> --%>
<!-- 				               <td><i class="backofficeicon"></i><a href="#" style="color:#333;"  onClick="popup('popUpAlert')" class="user" title="Transferring to DIY [Do It Yourself] Interactive Planning Tool" alt="Transferring to DIY [Do It Yourself] Interactive Planning Tool">Interactive  Planning Tool</a></td>				                -->
<!-- 				               <td>&nbsp;</td> -->
<!-- 				            </tr> -->
<%-- 				            <tr id="TaskListtr6${data.partyId}"> --%>
<%-- 				            	<td><i class="queryicon"></i><a onclick="viewQuery(${data.partyId})" style="color:#333;"><span class="user" >View Query</span></a></td> --%>
<!-- 				                <td>&nbsp;</td> -->
<!-- 				            </tr> -->
<%-- 				            <tr id="TaskListtr7${data.partyId}"> --%>
<%-- 				            	<td><i class="changeicon"></i><a onclick="$('.popupnew2').hide();openConvertClientPopup('Opportunity',${data.partyId});" class="choose1opp" style="color:#333;"><span class="user" >Convert</span></a></td> --%>
<!-- 				                <td></td> -->
<!-- 				            </tr> -->
<%-- 				            <tr id="TaskListtr8${data.partyId}"> --%>
<!-- 				            	<td><i class="pingcon"></i><a href="#" class="choose1opp" style="color:#333;"><span class="user" >Send Potential Ping</span></a></td> -->
<!-- 				                <td></td> -->
<!-- 				            </tr> -->
<%-- 				            <tr id="TaskListtr9${data.partyId}"> --%>
<%-- 				            	<td><i class="emailicon"></i><a  onclick="sendEmail(${data.partyId},'${data.name}','${data.email}')" style="color:#333;"><span class="user" >Send Email</span></a></td> --%>
<!-- 				                <td></td> -->
<!-- 				            </tr> -->
<%-- 				            <tr id="TaskListtr10${data.partyId}"> --%>
<%-- 				            	<td><i class="callicon"></i><a onclick="sendSMS(${data.partyId},'${data.name}','${data.mobile}')" style="color:#333;"><span class="user">Send SMS</span></a></td> --%>
<!-- 				                <td></td> -->
<!-- 				            </tr> -->
<!--           		 	 	</table> -->
<!--             		</div> -->
<%-- 				</display:column> --%>
					
<%-- 			<display:column property="actionComments" class="" style="" title="Action Comments" sortable="true">				 --%>
<%-- 			</display:column> --%>
			
		 <%--   <display:setProperty name="export.pdf" value="false" />
		  <display:setProperty name="export.xml" value="false" />
          <display:setProperty name="export.xls" value="true" />
          <display:setProperty name="export.csv" value="true" />
          <display:setProperty name="export.excel.filename"
           value="Opportunities.xls" />
          <display:setProperty name="export.csv.filename"
           value="Opportunities.csv" />
					
		</display:table>
					 --%>
					
												
						
						<!-- Center-->
					</div>
				</div>


<!-- <div class="topmenuleft" > -->
<!--   <ul> -->
<!--   	<li> Export options: </li> -->
<!--     <li> <a href="#" title="Export in CSV" alt="Export in CSV"><i class="cvsicon"></i></a></li> -->
<!--     <li><a href="#" title="Export in Excel" alt="Export in Excel"> <i class="excelicon"></i></a></li> -->
<!--     <li> <a href="#"  title="Export in XML" alt="Export in XML"><i class="xmlcon"></i></a></li> -->
<!--   </ul> -->
<!--  </div> -->
				
			</div>

		</div>



	</section>
	<!-- Center part End -->

<jsp:include page="../common/footer.jsp" />

<script type="text/javascript">
var list = new Array();
var partyId=0;
var statusList;
var stageList;
var currentRecordTypeId=15002;


function oppReady(){
	var partyId=$('#partyIdToView').val();
	if(partyId!=0){
// 		showAlertMessage1("Message",
// 				"<br/>Success",
// 				"information", showOpportunityDetails);
	}
	 showSelectedTab('opportunityLink');	
	
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=6,7,15',
		success : function(result) {
			statusList=result;
			$('#convertToContactType').append('<option value="0">--Select--</option>');
			$(result).each(function(i,obj) {
				var codeTypeId=obj.codeTypeId;
				var codeValue=obj.codeValue;
				var codevalueId=obj.codeValueId;
				if(codeTypeId==15 && codevalueId>currentRecordTypeId){
					$('#convertToContactType').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				}
			});
			$.ajax({
				type : "POST",
				url : $('#contextPath').val()+'/opportunity/getOpportunityStageList.htm',
				success : function(result) {
// 					alert(result)
					$(result).each(function(i,obj) {
// 						alert(obj.partyId)
						if(obj.fpStageEndDate==''){
							$('#stage'+obj.partyId).append('<tr><td>'+obj.stage+'</td><td><span class="deactivaticon"></span></td><td></td><td></td></tr>');
						}else{
							$('#stage'+obj.partyId).append('<tr><td>'+obj.stage+'</td><td><span class="activaticon"></span></td><td>'+obj.fpStageEndDate+'</td><td>'+obj.fpStageEndDateTime+'</td></tr>');
							$('#stage'+obj.partyId).parent().parent().attr('title',obj.stage);
						}
					});
					
					$.ajax({
						type : "POST",
						url : $('#contextPath').val()+'/opportunity/getOpportunitiesTaskList.htm?value=Opportunity',
						success : function(result) {
							var cntr=1;
							var lastPartyId=0;
// 							alert(result)
// 							$( "ul li:nth-child(2)" )
		 					$(result).each(function(i,obj){
		 						var partyId=obj.oppID;
		 						var taskName=obj.taskName;
		 						var taskNewName = taskName.substring(0, 15)+'....';
		 						var Taskid=obj.taskId;
		 						
		 						if(lastPartyId==0){
		 							lastPartyId=partyId;
		 						}else if(lastPartyId!=partyId){
		 							cntr=1;
		 						}
//  		 						alert(partyId+'----------'+cntr)
		 						$('#TaskList'+partyId+' tr:nth-child('+(cntr+1)+')').append('<td> <a title="'+taskName+'" href="${pageContext.request.contextPath}/addtask.htm?taskId='+Taskid+'">'+taskNewName+'</a></td>');
								cntr+=1;
									
							})
							$(".tasklist tr").each(function(i){
								var id=$(this).attr('id');
								if(($('#'+id+' td:nth-child(3)').html()==undefined || $('#'+id+' td:nth-child(3)').html()=='') && $('#'+id+' th:nth-child(3)').html()==undefined){
									$(this).append('<td></td>');
								}
							});
							
						}
					});
					
					
				}
			});
		}
	});
}


function add(){
	var partyId= <%=request.getParameter("partyId")%>
	//alert(partyId);
	window.location.href= $('#contextPath').val()+'/addOpportunity.htm?partyId2=' + partyId;
}

function showOpportunityDetails(){
	var partyId=$('#partyIdToView').val();
	if(partyId!=0){
		viewOpportunityDetails(partyId);
		
		
	}
}

function pagesizeurl(){
	var pageSize=$('#page').val();	
// 	window.location.href= $('#contextPath').val()+'/opportunity/getOpportunitiesList.htm?pageSize='+pageSize;
	setResult('');	
}
/**
 * deletes multiple users after taking confirmation.
 */
function deleteOpportunities() {
	var selectedlvals = [];
	$('input:checkbox[id=chkdeleteselect]:checked').each(function() {
		selectedlvals.push($(this).val());
	});
/* 	 var slvals = []
 	  $('input:checkbox[name=chkdeleteselect]:checked').each(function() {
 	  slvals.push($(this).val());
 	  }) */
	
 //alert('Selected Checkbox values are: ' + selectedlvals);
	if (selectedlvals == "") {
		bootbox.dialog({
			message: "<span class='bigger-110'>Please select at least one item to delete.</span>",
			buttons: 			
			{
				"click" :
				{
					"label" : "OK!",
					"className" : "btn-sm btn-primary",
					"callback": function() {
						
					}
				}
			}
		});
		//alert('Please select at least one item to delete');
		return;
	}
	else{
		
		deleteNote();
	}
	document.getElementById("confirmdelete").value = selectedlvals;
	/* popup('popUpAlertaddnote'); */
};

function setResult(filterRuleCriteria){
	var id=0;
	var sPageURL = window.location.search.substring(1);
	var sURLVariables = sPageURL.split('&');
	for (var i = 0; i < sURLVariables.length; i++)
	{
	var sParameterName = sURLVariables[i].split('=');
	if (sParameterName[0] == 'partyId')
	{
		id= sParameterName[1];
	 }
	}
	//alert(id);
	  openPopupWebApp('centerLoadingImage', 25, 35);
	  var pageval =  $('#page').val();
	  $("#toreload").load('${pageContext.request.contextPath}/partnersp/getOpportunitiesList.htm #toreload', {
	   object: '${object}',
	   pageSize: $('#page').val(),
	   partyId:id,
	   filterRule: filterRuleCriteria
	     }, function( response, status, xhr ) {
	      try{
	        	//oppReady()
	        //addPageSize(filterRuleCriteria,pageval);
	        //$('#hfilterRule').val(filterRuleCriteria);
	        closePopupWebApp('');
	      }catch(e){
	         closePopupWebApp('');       
	      }
	     });
	 }


function deleteOpportunityTrue() {
	//alert("hiee");
	
	var selectedlvals = document.getElementById("confirmdelete").value;
	//alert(selectedlvals);
	$.ajax({
		type : 'POST',
		url : $('#contextPath').val()
				+ "/partnersp1/deleteOpportunities.htm?partyIds="
				+ selectedlvals,
		success : function(result) {
			bootbox.dialog({
				message: "<span class='bigger-110'>Opportunity deleted successfully.</span>",
				buttons: 			
				{
					"click" :
					{
						"label" : "OK!",
						"className" : "btn-sm btn-primary",
						"callback": function() {
							location.reload();

							
						}
					}
				}
			});

		}
	});
	
	
	
	
	 /* var list = [];
	  $('#chkdeleteselect:checked').each(function() 
			  {
		  list.push($(this).val());
		  //alert("jhghjg"+$(this).val());
	  });
	
	var message = "";
	if (list.length == 1) {
		message = "Opportunity successfully deleted.";
	} else {
		message = "Opportunities successfully deleted.";
	}
	setTimeout(function() {
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/partnersp1/deleteOpportunities.htm?partyIds=" + list,
			success : function(result) {
				if(result=='success'){
					localStorage.setItem('actionName',
							window.location.pathname);
					showAlertMessage1("Success",
							'<br/>' + message,
							"confirmation", redirectFunction1);
					
				}else{
					showAlertMessage1("Error",
							"The connection to the server has been lost. Please try again later.",
							"error", doNothing);
				}
				
			}
		});
	}, 500); */
}


function viewQuery(partyId){
// 	 var value = $('#tags').val();
// alert($('#contextPath').val());
	window.location.href = $('#contextPath').val()+"/query/getQueryList.htm?QueryID="+QueryID;
}


function viewOpportunityDetails(partyId){
	$.ajax({
		type : 'POST',
		//url : $('#contextPath').val()+"/opportunity/getOpportunitiesList.htm?partyId=" + partyId,
		url : $('#contextPath').val()+"/opportunityprofile.htm?partyId=" + partyId,				
		
		success : function(result) {
			var opportunityData=result;
			var name=opportunityData.name;
			var city=opportunityData.city;
			var createdDate=opportunityData.createdDate;
			var status=opportunityData.status;
			var contactEmail=opportunityData.contactEmail;
			var contactMobile=opportunityData.contactMobile;
			var stage=opportunityData.stage;
			var action="Action";
			var actionComments=opportunityData.actionComments;
			
			$(statusList).each(function(i,obj) {
				var codeTypeId=obj.codeTypeId;
				var codeValue=obj.codeValue;
				var codevalueId=obj.codeValueId;
				$('#opportunityStatus').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				if(status==codevalueId){
					$('#opportunityStatusLabel').html(codeValue);
				    if(codeValue=='New'){
				    	$('#opportunityStatusLabel').addClass('label-info');
				    }else if(codeValue=='Open'){
				    	$('#opportunityStatusLabel').addClass('label-success');
				    }else if(codeValue=='Closed'){
				    	$('#opportunityStatusLabel').addClass('label-danger');
				    }else if(codeValue=='Cancelled'){
				    	$('#opportunityStatusLabel').addClass('label-danger');
				    }
					
				}
			});

		}	
	});

}
function getPopUpAction(id)
{
// 	alert('in getPopUpAction='+id);
	$("#"+id).show();		
}



function redirectDcInput(partyId,buId,pname)
{
		window.location.href= $('#contextPath').val()+'/opportunity/redirectDcInput.htm?partyId='+partyId+'&buId='+buId+'&pname='+pname;				
	
}



function redirectDcActivation(partyId)
{
		//window.location.href= $('#contextPath').val()+'/opportunity/redirectDcActivation.htm?partyId='+partyId+'&buId='+buId;
		$('#partyIds').val(partyId);
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/opportunity/redirectDcActivation.htm",
			data : $('#bulkActivateForm').serialize(),
			success : function(result) {
				//alert(result);
				var recordCount=result[0];
				var isExistAnyUser=result[1];
				var isAlreadyActivated=result[2];
				if(recordCount>0){
// 					localStorage.setItem('actionName',
// 							window.location.pathname);
					showAlertMessage1("Success",
							"<br/>"+" DC activated. ",
							"confirmation", reloadPage);
					
				}else if(isAlreadyActivated==1){
					showAlertMessage1("Error",
							"<br/>"+" DC already activated. ",
							"error", doNothing);
				}else if(isExistAnyUser>0){
				
					showAlertMessage1("Error",
							"<br/>"+" Username already exist. Please change EmailId and then try again.",
							"error", doNothing);
					
				
				}
				
			}
		});
		
		
}

function bulkActivation() {
	list = new Array();
	$('#data :checked').each(function(i, obj) {
		list[i] = $(this).attr('id');
	});
	if (list.length == 0) {
		bootbox.dialog({
			message: "<span class='bigger-110'>Please select at least one Opportunity.</span>",
			buttons: 			
			{
				"click" :
				{
					"label" : "OK!",
					"className" : "btn-sm btn-primary",
					"callback": function() {
						 location.reload();
						 document.getElementById("addForm").reset();	
					}
				}
			}
		});
		
		
		
		/* showAlertMessage1("Message",
				"Please select at least one Opportunity.",
				"information", doNothing); */
	} else{
		var message = "";
		if (list.length == 1) {
			message = "Do you want to activate these Opportunity?";
		} else {
			message = "Do you want to activate these Opportunities?";
		}
		showAlertMessage1("Message", "<br/>" + message, "question",
				doNothing1);
		$('.ZebraDialog_Button1').attr('href','javascript:activateOpportunityTrue()');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
// 		$('.ZebraDialog_Question').css('background-size', '149px');
// 		$('.ZebraDialog_Question').css('background-position-x', '5px');
// 		$('.ZebraDialog_Question').css('background-position-y', '2px');
// 		$('.ZebraDialog_Question').css('background-position', '5px 2px');
	}
}

function activateOpportunityTrue() {
	list = new Array();
	$('#data :checked').each(function(i, obj) {
		list[i] = $(this).attr('id');
	});
	var message = "";
	if (list.length == 1) {
		message = "Opportunity successfully activated.";
	} else {
		message = list.length + "Opportunities successfully activated.";
	}
	setTimeout(function() {
		$('#partyIds').val(list);
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/opportunity/redirectDcActivation.htm",
			data : $('#bulkActivateForm').serialize(),
			success : function(result) {
				//alert(result);
				var recordCount=result[0];
				var isExistAnyUser=result[1];
				var isAlreadyActivated=result[2];
				if(recordCount>0){
// 					localStorage.setItem('actionName',
// 							window.location.pathname);
					showAlertMessage1("Success",
							"<br/>"+" DC activated. ",
							"confirmation", reloadPage);
					
				}else if(isAlreadyActivated==1){
					showAlertMessage1("Error",
							"<br/>"+" DC already activated for one or more opportunity from the list. ",
							"error", doNothing);
				}else if(isExistAnyUser==1){
					//alert('Test 2');
					showAlertMessage1("Error",
							"<br/>"+" Username already exist for one or more opportunity from the list. Please change EmailId and then try again.",
							"error", doNothing);
				}
				
			}
		});
		
	}, 500);
	
}



function reloadPage(){
	location.reload();
}

function viewOpportunityProfileDetails(partyId){
	//alert(partyId);
	window.location.href= $('#contextPath').val()+'/opportunityprofile.htm?partyId='+partyId;
}

function sendEmail(partyId,name,email){
	$('#partyIdForNotification').val(partyId);
	$('#nameForNotification').val(name);
	$('#notifyToForNotification').val(email)
	$('#notifyType').val('email');
	$('#sendNotificationForm').attr('action','${pageContext.request.contextPath}/sendnotification.htm');
	$('#sendNotificationForm').submit();
}

function sendSMS(partyId,name,phone){
	$('#partyIdForNotification').val(partyId);
	$('#nameForNotification').val(name);
	$('#notifyToForNotification').val(phone);
	$('#notifyType').val('sms');
	$('#sendNotificationForm').attr('action','${pageContext.request.contextPath}/sendnotification.htm');
	$('#sendNotificationForm').submit();
}
</script>

	<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />
	<form method="post" id="opportunitycountForm"
		action="<%=request.getContextPath()%>/opportunity/getOpportunitiesList.htm">

	</form>
	
	<form id="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocument.htm">
		<input type="hidden" name="docId" id="documentIdToDownload">
	</form>
	
	<form id="bulkActivateForm"> 
		<input type="hidden" id="partyIds" name="partyIds">
		<input type="hidden" id="roleId" name="roleId" value="6">
	</form>
	
	<form id="getApDataForm" name="getApDataForm"> 
		<input type="hidden" id="partyId" name="partyId">		
	</form>
	
	<form id="sendNotificationForm" name="sendNotificationForm" method="post"> 
		<input type="hidden" id="partyIdForNotification" name="partyId">	
		<input type="hidden" id="nameForNotification" name="name">		
		<input type="hidden" id="notifyTargetForNotification" name="notifyTarget" value="Opportunity">	
		<input type="hidden" id="notifyToForNotification" name="notifyTo">
		<input type="hidden" id="notifyType" name="notifyType">		
			
			
	</form>
	
		<div style="display: none;" id="blanket"></div>
		<div style="display: none; width:644px; height:370px; overflow:auto;" id="popUpConvertClient" class="popUpQuery" >
		<div class="close" style="margin-right:10px; margin-bottom:30px;"><a onClick="cloeseConvertClientPopup()" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>
		<!-- -->
		<div class="row"><br><br>
		 <div class="list-group" id="changePasswordDetailsDiv" >
		 <a class="list-group-item active">Convert Opportunity</a>
		 <form id="convertClientForm">
					 <table class="table table-striped" cellpadding="5" cellspacing="5"  style="width: 98%;margin-left: 10px;margin-top: 10px;">
		                	<tr>
		                    	<td width="32%" style="border-top: none !important;">Current Contact Type </td>
		               	      <td width="68%" style="border-top: none !important;"><span id="currentContactType"></span></td>
		                </tr>
		                <tr>
		                    	<td width="32%" style="border-top: none !important;">Convert to Contact Type <span class="red">*</span></td>
		               	  		<td width="68%" style="border-top: none !important;"><select  id="convertToContactType" name="convertToContactType" class="form-control" validate="select" emsg="Convert to Contact Type"/></td>
		                </tr>
		                <tr>
		                    	<td width="32%" style="border-top: none !important;">Convert Note <span class="red">*</span></td>
		               	  		<td width="68%" style="border-top: none !important;"><textarea style="height: 100px;" class="form-control"  id="convertNote" validate="1" emsg="Convert Note" name="convertNote"></textarea></td>
		                </tr>
		                 <tr>
		                      <td colspan="2" align="right" style="border-top: none !important;"> <input id="cancel" class="btn dbtn" type="button" value="Update" name="change_password_div" onclick="convertContact('convertClientForm','Opportunity')">  <input id="save" class="btn dbtn" type="button" value="Cancel" name="change_password_div" onClick="cloeseConvertClientPopup()" ></td>
		                    </tr>
		              </table>
		              <input type="hidden" id="contactPartyId" name="partyId">
		              
		              <input type="hidden" id="sectionName" name="sectionName" value="Opportunity">
		              
		   </form>
			</div>
		       </div>
		</div>
		
		
	<script type="text/javascript">
	//var grid_data=${downloadList};
	var grid_data=${opportunityDatas};
	//alert( grid_data);
	//alert(grid_data);
	index=grid_data;
	/*var index=new Array();
	$(grid_data).each(function(i,obj) {
		var object = {};
		object.name = obj.name;
		object.pingOwner=obj.pingOwner;
		object.notifyTemplateID=obj.notifyTemplateID;
		index.push(object);
		
	});*/
	
	
	var subgrid_data = 
	[
	 {id:"1", name:"sub grid item 1", qty: 11},
	 {id:"2", name:"sub grid item 2", qty: 3},
	 {id:"3", name:"sub grid item 3", qty: 12},
	 {id:"4", name:"sub grid item 4", qty: 5},
	 {id:"5", name:"sub grid item 5", qty: 2},
	 {id:"6", name:"sub grid item 6", qty: 9},
	 {id:"7", name:"sub grid item 7", qty: 3},
	 {id:"8", name:"sub grid item 8", qty: 8}
	];
	
	jQuery(function($) {
		var grid_selector = "#grid-table";
		var pager_selector = "#grid-pager";
		
		//resize to fit page size
		$(window).on('resize.jqGrid', function () {
			$(grid_selector).jqGrid( 'setGridWidth', $(".page-content").width() );
	    })
		//resize on sidebar collapse/expand
		var parent_column = $(grid_selector).closest('[class*="col-"]');
		$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
			if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
				//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
				setTimeout(function() {
					$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
				}, 0);
			}
	    })
		
		//if your grid is inside another element, for example a tab pane, you should use its parent's width:
		/**
		$(window).on('resize.jqGrid', function () {
			var parent_width = $(grid_selector).closest('.tab-pane').width();
			$(grid_selector).jqGrid( 'setGridWidth', parent_width );
		})
		//and also set width when tab pane becomes visible
		$('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		  if($(e.target).attr('href') == '#mygrid') {
			var parent_width = $(grid_selector).closest('.tab-pane').width();
			$(grid_selector).jqGrid( 'setGridWidth', parent_width );
		  }
		})
		*/
		
		
	
	
	
		jQuery(grid_selector).jqGrid({
			//direction: "rtl",
	
			//subgrid options
			subGrid : false,
			//subGridModel: [{ name : ['No','Item Name','Qty'], width : [55,200,80] }],
			//datatype: "xml",
			subGridOptions : {
				//plusicon : "ace-icon fa fa-plus center bigger-110 blue",
				minusicon  : "ace-icon fa fa-minus center bigger-110 blue",
				openicon : "ace-icon fa fa-chevron-right center orange"
			},
			//for this example we are using local data
			subGridRowExpanded: function (subgridDivId, rowId) {
				var subgridTableId = subgridDivId + "_t";
				$("#" + subgridDivId).html("<table id='" + subgridTableId + "'></table>");
				$("#" + subgridTableId).jqGrid({
					datatype: 'local',
					data: subgrid_data,
					colNames: ['No','Item Name','Qty'],
					colModel: [
						{ name: 'id', width: 50 },
						{ name: 'name', width: 150 },
						{ name: 'qty', width: 50 }
					]
				});
			},
			
	
	
			data: index,
			datatype: "local",
			height: 250,
			colNames:[' ',' ', 'Name','City', 'Created Date', 'Email Id','Contact Number','Stage'],
			colModel:[
				/*{name:'myac',index:'', width:40, fixed:true, sortable:false, resize:false,
					formatter:'actions', 
					formatoptions:{ 
						keys:true,
						delbutton: false,//disable delete button
						
						delOptions:{recreateForm: true, beforeShowForm:beforeDeleteCallback},
						//editformbutton:true, editOptions:{recreateForm: true, beforeShowForm:beforeEditCallback}
					}
				},*/
				{name:'checkbox',width:40,sortable:false,formatter:function(cellvalue, options,rowObject) {
				    return '<input role="checkbox" type="checkbox"  class="cbox" value="'+rowObject.partyId+'" id="chkdeleteselect" name="chkdeleteselect[]">';
				}},
				{name:'partyId', width:25,formatter:imageFormat,formatoptions:{baseLinkUrl:'${pageContext.request.contextPath}/addOpportunity.htm?partyId='}},
				{name:'name', width:120,formatter:viewProfile},
				//{name:'rmHead',index:'rm',width:120,},
				{name:'city',width:120,},
				{name:'createdDate',sortable:false, width:100,},
				{name:'email', width:120,},
				{name:'contact',width:120,},
				//{name:'dcActivation',index:'dc_status', width:88,formatter:yesNoFormat}, 
				{name:'stage',sortable:false, width:75},
				/* {name:'action',index:'action',sortable:false,width:60,formatter:function(cellvalue, options,rowObject) {
				    return '<a onclick="openActionPopup('+rowObject.partyId+',\''+rowObject.name+'\','+rowObject.analysisGoalRiskSuccessionID+','+rowObject.analysisReportDocumentID+','+rowObject.clientActionPlanDocumentID+',\''+rowObject.executionStatus+'\','+rowObject.buId+',\''+rowObject.isDatacollectionChanged+'\','+rowObject.fpplanType+','+rowObject.summaryActionPlanDocumentID+','+rowObject.advisorActionPlanDocumentID+','+rowObject.quickActionPlanDocumentID+',\''+rowObject.email+'\','+rowObject.clientActionPlanDocumentIDA+',\''+rowObject.potentialPing+'\',\''+rowObject.mobile+'\')">Action</a>';
				    
				}},
				{name:'actionComments',sortable:false,index:'comments',}  */


			],
	
			viewrecords : true,
			rowNum:10,
			rowList:[10,20,50,100,1000],
			pager : pager_selector,
			altRows: true,
			//toppager: true,
			
			//multiselect: true,
			//multikey: "ctrlKey",
	        multiboxonly: true,
	
	        loadComplete : function() {
	            var table = this;
	            setTimeout(function(){
	             styleCheckbox(table);
	             
	             updateActionIcons(table);
	             updatePagerIcons(table);
	             enableTooltips(table);
	            }, 0);
	           },
	           
	           
			editurl: "/dummy.html",//nothing is saved
			//caption: "jqGrid with inline editing"
	
			autowidth: true,
            shrinkToFit: true,	
	
	
	
			/**
			,
			grouping:true, 
			groupingView : { 
				 groupField : ['name'],
				 groupDataSorted : true,
				 plusicon : 'fa fa-chevron-down bigger-110',
				 minusicon : 'fa fa-chevron-up bigger-110'
			},
			caption: "Grouping"
			*/
	
		});
		$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
		
		
	
		//enable search/filter toolbar
		//jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
		//jQuery(grid_selector).filterToolbar({});
	
	
		//switch element when editing inline
		function aceSwitch( cellvalue, options, cell ) {
			setTimeout(function(){
				$(cell) .find('input[type=checkbox]')
					.addClass('ace ace-switch ace-switch-5')
					.after('<span class="lbl"></span>');
			}, 0);
		}
		//enable datepicker
		function pickDate( cellvalue, options, cell ) {
			setTimeout(function(){
				$(cell) .find('input[type=text]')
						.datepicker({format:'yyyy-mm-dd' , autoclose:true}); 
			}, 0);
		}
		

		function imageFormat( cellvalue, options, rowObject ){
			//alert(options.colModel.formatoptions.baseLinkUrl);
			return '<a href="'+options.colModel.formatoptions.baseLinkUrl+cellvalue+'"><div title="Edit selected row" class="ui-pg-div ui-inline-edit" onmouseover="jQuery(this).addClass(\'ui-state-hover\');" onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" ><span class="ui-icon ui-icon-pencil"></span></div></a>';
		}
		
		function viewProfile( cellvalue, options, cell ){
			
			return cellvalue;
		}
		
		
		
		
		
	
		//navButtons
		jQuery(grid_selector).jqGrid('navGrid',pager_selector,
			{ 	//navbar options
				edit: false,
				editicon : 'ace-icon fa fa-pencil blue',
				add: false,
				addicon : 'ace-icon fa fa-plus-circle purple',
				del: false,
				delicon : 'ace-icon fa fa-trash-o red',
				search: true,
				searchicon : 'ace-icon fa fa-search orange',
				refresh: false,
				refreshicon : 'ace-icon fa fa-refresh green',
				view: false,
				viewicon : 'ace-icon fa fa-search-plus grey',
			},
			{
				//edit record form
				//closeAfterEdit: true,
				//width: 700,
				recreateForm: true,
				beforeShowForm : function(e) {
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_edit_form(form);
				}
			},
			{
				//new record form
				//width: 700,
				closeAfterAdd: true,
				recreateForm: true,
				viewPagerButtons: false,
				beforeShowForm : function(e) {
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
					.wrapInner('<div class="widget-header" />')
					style_edit_form(form);
				}
			},
			{
				//delete record form
				recreateForm: true,
				beforeShowForm : function(e) {
					var form = $(e[0]);
					if(form.data('styled')) return false;
					
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_delete_form(form);
					
					form.data('styled', true);
				},
				onClick : function(e) {
					//alert(1);
				}
			},
			{
				//search form
				recreateForm: true,
				afterShowSearch: function(e){
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
					style_search_form(form);
				},
				afterRedraw: function(){
					style_search_filters($(this));
				}
				,
				multipleSearch: true,
				/**
				multipleGroup:true,
				showQuery: true
				*/
			},
			{
				//view record form
				recreateForm: true,
				beforeShowForm: function(e){
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
				}
			}
		)
	
	
		
		function style_edit_form(form) {
			//enable datepicker on "sdate" field and switches for "stock" field
			form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
			
			form.find('input[name=stock]').addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
					   //don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
					  //.addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');
	
					
			//update buttons classes
			var buttons = form.next().find('.EditButton .fm-button');
			buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
			buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
			buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
			
			buttons = form.next().find('.navButton a');
			buttons.find('.ui-icon').hide();
			buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
			buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');		
		}
	
		function style_delete_form(form) {
			var buttons = form.next().find('.EditButton .fm-button');
			buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
			buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
			buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
		}
		
		function style_search_filters(form) {
			form.find('.delete-rule').val('X');
			form.find('.add-rule').addClass('btn btn-xs btn-primary');
			form.find('.add-group').addClass('btn btn-xs btn-success');
			form.find('.delete-group').addClass('btn btn-xs btn-danger');
		}
		function style_search_form(form) {
			var dialog = form.closest('.ui-jqdialog');
			var buttons = dialog.find('.EditTable')
			buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
			buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
			buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
		}
		
		function beforeDeleteCallback(e) {
			var form = $(e[0]);
			if(form.data('styled')) return false;
			
			form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
			style_delete_form(form);
			
			form.data('styled', true);
		}
		
		function beforeEditCallback(e) {
			var form = $(e[0]);
			form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
			style_edit_form(form);
		}
	
	
	
		//it causes some flicker when reloading or navigating grid
		//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
		//or go back to default browser checkbox styles for the grid
		function styleCheckbox(table) {
		/**
			$(table).find('input:checkbox').addClass('ace')
			.wrap('<label />')
			.after('<span class="lbl align-top" />')
	
	
			$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
			.find('input.cbox[type=checkbox]').addClass('ace')
			.wrap('<label />').after('<span class="lbl align-top" />');
		*/
		}
		
	
		//unlike navButtons icons, action icons in rows seem to be hard-coded
		//you can change them like this in here if you want
		function updateActionIcons(table) {
			/**
			var replacement = 
			{
				'ui-ace-icon fa fa-pencil' : 'ace-icon fa fa-pencil blue',
				'ui-ace-icon fa fa-trash-o' : 'ace-icon fa fa-trash-o red',
				'ui-icon-disk' : 'ace-icon fa fa-check green',
				'ui-icon-cancel' : 'ace-icon fa fa-times red'
			};
			$(table).find('.ui-pg-div span.ui-icon').each(function(){
				var icon = $(this);
				var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
				if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
			})
			*/
		}
		
		//replace icons with FontAwesome icons like above
		function updatePagerIcons(table) {
			var replacement = 
			{
				'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
				'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
				'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
				'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
			};
			$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
				var icon = $(this);
				var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
				
				if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
			})
		}
	
		function enableTooltips(table) {
			$('.navtable .ui-pg-button').tooltip({container:'body'});
			$(table).find('.ui-pg-div').tooltip({container:'body'});
		}
	
		//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');
	
		$(document).one('ajaxloadstart.page', function(e) {
			$(grid_selector).jqGrid('GridUnload');
			$('.ui-jqdialog').remove();
			
		});
	});
	

	$(document).ready(function() {
		
	    $('#selecctall').click(function(event) {  //on click 
	        if(this.checked) { // check select status
	            $('.checkbox1').each(function() { //loop through each checkbox
	                this.checked = true;  //select all checkboxes with class "checkbox1"               
	            });
	        }else{
	            $('.checkbox1').each(function() { //loop through each checkbox
	                this.checked = false; //deselect all checkboxes with class "checkbox1"                       
	            });         
	        }
	    });
	    
	    
	    
	    $('#addquickSearch').blur(function(){
			 var arr = extractLast($('#addquickSearch').val());
			 this.value = this.value.replace(arr, '');
			 this.value = this.value.replace(/;/, '');
			
		  }); 

		$('#addquickSearch').click(function(){
			$('#addquickSearch').val('');
			$('#partyId').val(0);
		  }); 
	    
	});
</script>	
</body>
</html>