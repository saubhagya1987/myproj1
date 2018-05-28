<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Opportunities</title>
<!-- Financial Plan Input Links css -->
<style>
.column_bx {
	height: 464px;
	width: 84%;
	margin: auto;
}
/*.column_left, .column_middle, .column_right {
	width: 90%;
	position: relative;
}*/
.column_left .title, .column_middle .title, .column_right .title {
	margin:16px 0 0;
	font-family: Arial, Helvetica, sans-serif;
	color: #3a3a3e;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	line-height: 15px;
}
.column_left .des, .column_middle .des, .column_right .des {
	margin:10px 0 0;
	font-famil3a3e;
	font-size: 12px;
	text-aligy: Arial, Helvetica, sans-serif;
	color: #3an: center;
	line-height: 15px;
}
.column_left .theme, .column_middle .theme, .column_right .theme {
	height:127px;
	width: 100%; position:relative; z-index:100;
	
}
.column_left .thumb, .column_middle .thumb, .column_right .thumb {
	height: 100%;
	width: 100%;
	-moz-box-ox-shadow: 0px 0px 3px 1px #B3B3B3;
	box-shadshadow: 0px 0px 3px 1px #B3B3B3;
	-webkit-bow: 0px 0px 3px 1px #B3B3B3;
	background: #fff;
	text-align: center;
	border-radius: 10px;
	z-index: 100;
	position:relative;
	display: block;
	line-height: 127px;
}
.column_left .theme.selected:before, .column_middle .theme.selected:before, .column_right .theme.selected:before {
	
	-moz-box-shadow: 0px 3px 3px 1px #5C5C5C;
	-webkit-box-shadow: 0px 3px 3px 1px #5C5C5C;
	box-shadow: 0px 3px 3px 1px #5C5C5C;
	content: "";
	position: absolute;
	z-index: -10;
	top: -4px;
	bottom: -4px;
    left: -4px;
    right: -4px;
	background: #BE4763;
	background: -moz-linear-gradient(top, #be4763 49%, #be4763 49%, #a8394f 50%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(49%, #BE4763), color-stop(49%, #BE4763), color-stop(50%, #A8394F));
	background: -webkit-linear-gradient(top, #BE4763 49%, #BE4763 49%, #A8394F 50%);
	background: -o-linear-gradient(top, #be4763 49%, #be4763 49%, #a8394f 50%);
	background: -ms-linear-gradient(top, #be4763 49%, #be4763 49%, #a8394f 50%);
	background: linear-gradient(to bottom, #BE4763 49%, #BE4763 49%, #A8394F 50%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#be4763', endColorstr='#a8394f', GradientType=0 );
}
.inactiveLink {
	opacity: 0.2;
}
</style>
<style>
.goalicon { background:url(../images/goalopportunityicon.png); padding-right:17px; width:18px; height:20px; padding-bottom: 2px; }
.datacollectionChangedicon { background:url(../images/datacollectionModification.png); /*                  padding-right:17px;  */
                  width:18px; height:20px; padding-bottom: 2px; }
.changeicon { background:url(../images/allCommon-Icons.png) no-repeat -0px -767px; padding-right:16px; height:16px; padding-top:2px; }
/*#ui-id-1 { width:168px!important; padding-left:20px!important; }
#ui-id-2 { width:168px!important; padding-left:24px!important; }
*/.ui-menu-item { list-style:none !important; }
.ui-corner-all { margin-left:-10px!important; }
.ui-helper-hidden-accessible { color:#000; }
</style>
<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico"
	rel="shortcut icon">
</head>
<body>
<jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/common_popup.jsp" />
        <input type="hidden" id="xmlStringNotifyParty" name="xmlStringNotifyParty">
        <!-- Center part start -->
        <section>
          <div class="">
            <div class="main-content">
              <div class="main-contnet-inner">
                <div class="page-content">
                  <div class="page-header clearfix">
                    <h1 class="pull-left">Opportunities</h1>
                    <div class="nav-search pull-right" id="">
                      <form class="form-search">
                        <span class="input-icon">
                        <input type="text" placeholder="Search ..." class="nav-search-input" id="search"  autocomplete="off" value="${value}">
                        <i class="ace-icon fa fa-search nav-search-icon"></i></span>
                      </form>
                    </div>
                  </div>
                  <div class="container-body">
                    <div class="topmenu row rightAlign"> <a class="" href="<%=request.getContextPath()%>/addOpportunity.htm" id="newOpportunityLink">
                      <button data-params="{}" class="southspace1 westspace1 dbtn createNewBtn btn btn-primary btn-xs" title="New Opportunitity" alt="New Opportunitity"><i class="fa icon-opportunity"></i> New Opportunitity</button>
                      </a>
                      <!--  <button data-params="{}" class="southspace1 westspace1 dbtn deleteBtn btn btn-primary btn-xs " id="deleteOpportunityLink"  title="Delete Opportunities" onclick="deleteOpportunities()"><i class="fa fa-trash"></i> Delete Opportunities</button> -->
                      <!-- <button class="southspace1 westspace1 dbtn createNewBtn btn btn-primary btn-xs" id="moveOpportinities"  title="Move Opportunities" onclick="openMoveOpportunitiesPOPUP()"><i class="fa fa-arrows-alt"></i> Move Opportunities</button> -->
                      <!--  <button class="southspace1 westspace1 dbtn createNewBtn btn btn-primary btn-xs" id="bulkActivationLink"  title="Bulk Activation" onclick="bulkActivation()"><i class="fa fa-play"></i> Bulk Activation</button> -->
                      <button class="southspace1 westspace1 dbtn createNewBtn btn btn-primary btn-xs" id="bulkOpportunityXRayActivationLink" title="Bulk X - Ray Activation" onclick="bulkXRayActivation()"><i class="fa fa-play"></i> Bulk X - Ray Activation</button>
                      <a class="" href="<%=request.getContextPath()%>/bulkUploadOpportunity.htm" id="importOpportunityLink">
                      <button class="southspace1 westspace1 dbtn importNewBtn btn btn-primary btn-xs" title="Import Opportunities"><i class="fa fa-level-down"></i> Import Opportunities</button>
                      </a>
                      <div class="dropdown inlineBlock"> <a class="dropdown-toggle" href="#" data-toggle="dropdown" aria-expanded="false">
                        <button data-params="{}" class="southspace1 westspace1 dbtn createNewBtn btn btn-primary btn-xs"
							 title="More Action" alt="More Action"><i class="fa fa-plus"></i> More Action</button>
                        </a>
                        <ul class="dropdown-menu pull-right" role="menu" id="moreButtonClick">
                          <li><a  id="massEmailLink" onclick="sendBlukEmail()"><i class="fa fa-envelope"></i> <span
									class="user">Mass Email</span></a></li>
                          <li><a id="massSMSLink" onclick="sendMassSMS()"><i class="fa fa-mobile bigger-160"></i> <span
									class="user">Mass SMS</span></a></li>
                          <li><a  id="bulkDCReminderLink" onclick="sendBulkDcReminder()"><i class="fa fa-bell"></i> <span
									class="user">Bulk - Financial Plan Reminder</span></a></li>
                          <li><a  id="bulkOpportunityXRayReminderLink" onclick="sendBulkXRayReminder()"><i class="fa fa-bell"></i> <span
									class="user">Bulk X - RAY Reminder</span></a></li>
									<li><a id="deleteOpportunityLink"  onclick="deleteOpportunities()"><i class="fa fa-trash"></i> <span
									class="user">
										Delete Opportunities
                                   </span></a></li>
									    <li><a   id="moveOpportinities"  title="Move Opportunities" onclick="openMoveOpportunitiesPOPUP()"><i class="fa fa-arrows-alt"></i> <span
									class="user">

										Move Opportunities

									</span></a></li>
								  <li><a  id="bulkActivationLink"  title="Bulk Activation" onclick="bulkActivation()"><i class="fa fa-play"></i> <span
									class="user">
									Bulk Activation
								</span></a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="jq_parent row" id="display_table_lead" style="border: none;">
                      <div id="toreload" class="col-md-12 table-responsive tabular_break_word">
                        <table id="grid-table">
                        </table>
                        <div id="grid-pager"></div>
                        <div class="topmenuleft margin_5px" ><span>Export options:</span><a class="margin_5px" onclick="getCSV()" title="Export in CSV" alt="Export in CSV"><i class="fa icon-csv bigger-170"></i></a><a class="margin_5px" onclick="getXLS()" title="Export in Excel" alt="Export in Excel"><i class="fa fa-file-excel-o bigger-170"></i></a> </div>
                        
                        <!-- Center--> 
                      </div>
                    </div>
                  </div>
                </div>
              </div>
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
$(function() {
	var partyId=$('#partyIdToView').val();
	if(partyId!=0){

	}
	showSelectedTab('opportunityLink');	
	setTimeout(function(){closePopupWebApp('');},200);
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=6,7,15',
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
			
			setTimeout(function(){closePopupWebApp('');},200);
		}
	});
});


function oppReady(){
	var partyId=$('#partyIdToView').val();
	if(partyId!=0){

	}
	showSelectedTab('opportunityLink');	
	
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=6,7,15',
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

					$(result).each(function(i,obj) {

						if(obj.fpStageEndDate==''){
							$('#stage'+obj.partyId).append('<tr><td>'+obj.stage+'</td><td><span class="deactivaticon"></span></td><td></td><td></td></tr>');
						}else{
							$('#stage'+obj.partyId).append('<tr><td>'+obj.stage+'</td><td><span class="activaticon"></span></td><td>'+obj.fpStageEndDate+'</td><td>'+obj.fpStageEndDateTime+'</td></tr>');
							$('#stage'+obj.partyId).parent().parent().attr('title',obj.stage);
						}
					});
					
// 					$.ajax({
// 						type : "POST",
// 						url : $('#contextPath').val()+'/opportunity/getOpportunitiesTaskList.htm?value=Opportunity',
// 						success : function(result) {
// 							var cntr=1;
// 							var lastPartyId=0;

// 		 					$(result).each(function(i,obj){
// 		 						var partyId=obj.oppID;
// 		 						var taskName=obj.taskName;
// 		 						var taskNewName = taskName.substring(0, 15)+'....';
// 		 						var Taskid=obj.taskId;
		 						
// 		 						if(lastPartyId==0){
// 		 							lastPartyId=partyId;
// 		 						}else if(lastPartyId!=partyId){
// 		 							cntr=1;
// 		 						}

// 		 						$('#TaskList'+partyId+' tr:nth-child('+(cntr+1)+')').append('<td id="TaskListLink"> <a title="'+taskName+'" href="${pageContext.request.contextPath}/addtask.htm?taskId='+Taskid+'">'+taskNewName+'</a></td>');
// 								cntr+=1;
									
// 							})
// 							$(".tasklist tr").each(function(i){
// 								var id=$(this).attr('id');
// 								if(($('#'+id+' td:nth-child(3)').html()==undefined || $('#'+id+' td:nth-child(3)').html()=='') && $('#'+id+' th:nth-child(3)').html()==undefined){
// 									$(this).append('<td id="TaskListLink"></td>');
// 								}
// 							});
		 					
// 						}
// 					});
					activateSecurity();
					
				}
			});
		}
	});
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
	list = new Array();
	var cntr=0;
	$('#grid-table :checked').each(function(i, obj) {
		if($(this).attr('id')!='selectAll' && $(this).attr('id')!='chkdeleteselect' && $(this).attr('id')!='' && $(this).attr('id')!=undefined && $(this).attr('id')!=0){
			list[cntr] = $(this).attr('id');
			cntr+=1;
		}
		
	});
// 	$('#grid-table :checked').each(function(i, obj) {
// 		if($(this).attr('id')!='selectAll' && $(this).attr('id')!='chkdeleteselect')
// 		list[i] = $(this).attr('id');
// 	});
	if (list.length == 0) {
		showAlertMessage1("Message",
				"Please select at least one Opportunity to delete.",
				"information", doNothing);
	} else{
// 		alert(list);
		var message = "";
		if (list.length == 1) {
			message = "Do you want to delete this Opportunity?";
		} else {
			message = "Do you want to delete these Opportunities?";
		}
		showAlertMessage1("Message", "<br/>" + message, "question",
				doNothing1);
		$('.ZebraDialog_Button1').attr('href','javascript:deleteOpportunityTrue()');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
		
		

	}
}

function sendBulkDcReminder() {
	list = new Array();
	var cntr=0;
	$('#grid-table :checked').each(function(i, obj) {
		if($(this).attr('id')!='selectAll' && $(this).attr('id')!='chkdeleteselect' && $(this).attr('id')!='' && $(this).attr('id')!=undefined && $(this).attr('id')!=0){
			list[cntr] = $(this).attr('id');
			cntr+=1;
		}
		
	});
	if (list.length == 0) {
		showAlertMessage1("Message",
				"Please select at least one Opportunity to Send Financial Plan Reminder.",
				"information", doNothing);
	} else{
// 		alert('Hi'+list);
		var message = "";
		if (list.length == 1) {
			message = "Do you want to Send this Opportunity Financial Plan Reminder?";
		} else {
			message = "Do you want to Send these Opportunities Financial Plan Reminder ?";
		}
		showAlertMessage1("Message", "<br/>" + message, "question",
				doNothing1);
		$('.ZebraDialog_Button1').attr('href','javascript:bulkDCReminderTrue()');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');

	}
}


function sendBulkXRayReminder(){
	list = new Array();
	var cntr=0;
	$('#grid-table :checked').each(function(i, obj) {
		if($(this).attr('id')!='selectAll' && $(this).attr('id')!='chkdeleteselect' && $(this).attr('id')!='' && $(this).attr('id')!=undefined && $(this).attr('id')!=0){
			list[cntr] = $(this).attr('id');
			cntr+=1;
		}
		
	});
	if (list.length == 0) {
		showAlertMessage1("Message",
				"Please select at least one Opportunity to Send X-Ray Reminder.",
				"information", doNothing);
	} else{
// 		alert('Hi'+list);
		var message = "";
		if (list.length == 1) {
			message = "Do you want to Send this Opportunity X-Ray Reminder?";
		} else {
			message = "Do you want to Send these Opportunities X-Ray Reminder ?";
		}
		showAlertMessage1("Message", "<br/>" + message, "question",
				doNothing1);
		$('.ZebraDialog_Button1').attr('href','javascript:bulkXRayReminderTrue()');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');

	}	
}

function setResult(filterRuleCriteria){
	  openPopupWebApp('centerLoadingImage', 25, 35);
	  var pageval =  $('#page').val();
	  $("#toreload").load('${pageContext.request.contextPath}/opportunity/getOpportunitiesList.htm #toreload', {
	   object: '${object}',
	   pageSize: $('#page').val(),//'${pageSize}', 
	   filterRule: filterRuleCriteria
	     }, function( response, status, xhr ) {
	      try{
	        	oppReady()
	      
	        closePopupWebApp('');
	      }catch(e){
	         closePopupWebApp('');       
	      }
	     });
	 }


function deleteOpportunityTrue() {
	var message = "";
	if (list.length == 1) {
		message = "Opportunity successfully deleted.";
	} else {
		message = "Opportunities successfully deleted.";
	}
	setTimeout(function() {
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/opportunity/deleteOpportunities.htm?partyIds=" + list,
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
	}, 500);
}


function bulkDCReminderTrue() {
	var message = "";
	if (list.length == 1) {
		message = "Financial Plan reminder sent successfully ";
	} else {
		message = "Financial Plan reminder sent successfully deleted.";
	}
	setTimeout(function() {
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/opportunity/bulkDCReminder.htm?partyIds=" + list,
			success : function(result) {
				if(result=='success')
					showAlertMessage("Success", '<br/>Reminder sent successfully.', "confirmation", doNothing);		
			}
		});
	}, 500);
}

function bulkXRayReminderTrue() {
	var message = "";
	if (list.length == 1) {
		message = "X-Ray reminder sent successfully ";
	} else {
		message = "X-Ray reminder sent successfully deleted.";
	}
	setTimeout(function() {
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/opportunity/bulkXRayReminder.htm?partyIds=" + list,
			success : function(result) {
				if(result=='success')
					showAlertMessage("Success", '<br/>Reminder sent successfully.', "confirmation", doNothing);		
			}
		});
	}, 500);
}

function viewQuery(partyId){

	window.location.href = $('#contextPath').val()+"/query/getQueryList.htm?partyId="+partyId;
}

function openEt(partyId){
	$('#partyIdToSend').val(partyId);	 
	$('#getApDataForm').attr('action',$('#contextPath').val()+"/et/getApDetails.htm");
	$('#getApDataForm').submit();	
} 

function viewOpportunityDetails(partyId){
	$.ajax({
		type : 'POST',
		
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

	$("#"+id).show();		
}

function openGenerateReportPopup(partyId,buId)
{

	 $('.popupnew2').hide();
	 openPopupGenerateReport(partyId,buId);
}


function openMoveOpportunitiesPOPUP()
{
	list = new Array();
	var cntr=0;
	$('#grid-table :checked').each(function(i, obj) {
		if($(this).attr('id')!='selectAll' && $(this).attr('id')!='chkdeleteselect' && $(this).attr('id')!='' && $(this).attr('id')!=undefined && $(this).attr('id')!=0){
			list[cntr] = $(this).attr('id');
			cntr+=1;
		}
		
	});
	
 if (list.length == 0) {
		showAlertMessage1("Message",
				"Please select at least one Opportunity.",
				"information", doNothing);
	}
	else
		{
			createGraph();
			openPopupMoveOpportunities();
			
		}
	 
}


function redirectDcInput()
{
		showAlertMessage1("Message", 'You have selected Financial Planner - Basic Plan. Please confirm your choice.', "question",
				doNothing1);
		$('.ZebraDialog').css('z-index','99999999999999');
		$('.ZebraDialog_Button1').attr('href','javascript:updateFpplanType(522003,'+$('#partyId_DcInput').val()+',\'Quick\')');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');

}
function redirectDcInputFpt()
{
	showAlertMessage1("Message", 'You have selected Financial Planner - Advanced Plan. Please confirm your choice.', "question",
			doNothing1);
	$('.ZebraDialog').css('z-index','99999999999999');
	$('.ZebraDialog_Button1').attr('href','javascript:updateFpplanType(522001,'+$('#partyId_DcInput').val()+',\'Desktop\')');
	$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');

}
function redirectDcInputFptDetails()
{
	if($('#fpPlanTypeId').val()==522002 || $('#fpPlanTypeId').val()=='522002'){
	updateFpplanType(522002,$('#partyId_DcInput').val(),'FPT');
	}else if($('#fpPlanTypeId').val()==0 || $('#fpPlanTypeId').val()=='522002'){
	 	showAlertMessage1("Message", 'You have selected  Interactive Financial Planner - Detailed Plan. Please note you will not be able to switch back to basic versions. Please confirm your choice.', "question",
			doNothing1);
	$('.ZebraDialog').css('z-index','99999999999999');
	$('.ZebraDialog_Button1').attr('href','javascript:updateFpplanType(522002,'+$('#partyId_DcInput').val()+',\'FPT\')');
	$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
	}else{
		showAlertMessage1("Message", 'You have chosen to switch from basic version to detailed version. Please note you will not be able to switch back to basic versions. Please confirm your choice.', "question",
				doNothing1);
		$('.ZebraDialog').css('z-index','99999999999999');
		$('.ZebraDialog_Button1').attr('href','javascript:updateFpplanType(522002,'+$('#partyId_DcInput').val()+',\'FPT\')');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
	}

}

function updateFpplanType(fpPlanTypeId,partyId,version)
{
	
	var partyId,buId,pname,datacollectionChange;
			partyId=$('#partyId_DcInput').val();
			pname=$('#opportunityName_DcInput').val();
			datacollectionChange=$('#datacollectionChange_DcInput').val();
			buId = $('#buId').val();
	if($('#fpPlanTypeId').val()==fpPlanTypeId){
		if(version=='Quick'){
			window.location.href= $('#contextPath').val()+'/quickDcDetails.htm?partyId='+partyId+'&buId='+buId+'&name='+pname+'&client=0';
		}
		else if(version=='Desktop'){
			window.location.href= $('#contextPath').val()+'/opportunity/redirectDcInput.htm?partyId='+partyId+'&buId='+buId+'&pname='+pname+'&isDatacollectionChange='+datacollectionChange+'&isClient=0';
		}else{
			window.location.href= $('#contextPath').val()+'/opportunity/redirectDcfpt.htm?partyId='+partyId+'&buId='+buId+'&pname='+pname+'&isDatacollectionChange='+datacollectionChange+'&recordTypeId='+14005;
		}
	}else{
	$.ajax({
		type : 'POST',
		url : $('#contextPath').val()+"/opportunity/updateFpplanType.htm?fpPlanTypeId="+fpPlanTypeId+"&partyId="+partyId,
		
		success : function(result) {
		
			
			$('#fpPlanTypeId').val(fpPlanTypeId);
			
			buId = $('#buId').val();
			if(version=='Quick'){
				window.location.href= $('#contextPath').val()+'/quickDcDetails.htm?partyId='+partyId+'&buId='+buId+'&name='+pname+'&client=0';
			}
			else if(version=='Desktop'){
				window.location.href= $('#contextPath').val()+'/opportunity/redirectDcInput.htm?partyId='+partyId+'&buId='+buId+'&pname='+pname+'&isDatacollectionChange='+datacollectionChange+'&isClient=0';
			}else{
				window.location.href= $('#contextPath').val()+'/opportunity/redirectDcfpt.htm?partyId='+partyId+'&buId='+buId+'&pname='+pname+'&isDatacollectionChange='+datacollectionChange+'&recordTypeId='+14005;
			}
		}
	});
	}
}
function openDcInputPopup(partyId,buId,pname,datacollectionChange,fpPlanTypeId)
{
	
	openPopupDcInput(partyId,buId,pname,datacollectionChange,fpPlanTypeId);
}

function redirectXRayActivation(partyId){
	$('#partyIds').val(partyId);
	$.ajax({
		type : 'POST',
		url : $('#contextPath').val()+"/opportunity/redirectXRayActivation.htm",
		data : $('#bulkActivateForm').serialize(),
		success : function(result) {

			var recordCount=result[0];
			var isAlreadyActivated=result[1];
			
			if(recordCount>0){


				showAlertMessage1("Success",
						"<br/>"+" X-Ray Activated. ",
						"confirmation", reloadPage);
				
			}else if(isAlreadyActivated==1){
				showAlertMessage1("Error",
						"<br/>"+" X-Ray already activated. ",
						"error", doNothing);
			}
			
		}
	});
}

function redirectDcActivation(partyId)
{
		
		$('#partyIds').val(partyId);
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/opportunity/redirectDcActivation.htm",
			data : $('#bulkActivateForm').serialize(),
			success : function(result) {
			
				var recordCount=result[0];
				var isExistAnyUser=result[1];
				var isAlreadyActivated=result[2];
				var isContactEmailPresent=result[3];
				
				if(recordCount>0){

					showAlertMessage1("Success",
							"<br/>"+" Client Portal Activated. ",
							"confirmation", reloadPage);
					
				}else if(isAlreadyActivated==1){
					showAlertMessage1("Error",
							"<br/>"+" Client Portal already activated. ",
							"error", doNothing);
				}else if(isExistAnyUser>0){
				
					showAlertMessage1("Error",
							"<br/>"+" Username already exist. Please change EmailId and then try again.",
							"error", doNothing);				
				}else if(isContactEmailPresent==1){
					showAlertMessage1("Error",
							"<br/>"+" Contact Email Not Present For Opportunity. Please enter EmailId and then try Again.  ",
							"error", doNothing);
				}
				
			}
		});
		
		
}


function bulkActivation() {
	list = new Array();
	
	var cntr=0;
	$('#grid-table :checked').each(function(i, obj) {
		if($(this).attr('id')!='selectAll' && $(this).attr('id')!='chkdeleteselect' && $(this).attr('id')!='' && $(this).attr('id')!=undefined && $(this).attr('id')!=0){
			list[cntr] = $(this).attr('id');
			cntr+=1;
		}
		
	});
	

	if (list.length == 0) {
		showAlertMessage1("Message",
				"Please select at least one Opportunity.",
				"information", doNothing);
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

	}
}




function activateOpportunityTrue() {
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

				var recordCount=result[0];
				var isExistAnyUser=result[1];
				var isAlreadyActivated=result[2];
				var isContactEmailPresent=result[3];
				

				
				if(recordCount>0){

					showAlertMessage1("Success",
							"<br/>"+" Client Portal Activated. ",
							"confirmation", reloadPage);
					
				}else if(isAlreadyActivated==1){
					showAlertMessage1("Error",
							"<br/>"+" Client Portal already activated for one or more opportunity from the list. ",
							"error", doNothing);
				}else if(isExistAnyUser==1){

					showAlertMessage1("Error",
							"<br/>"+" Username already exist for one or more opportunity from the list. Please change EmailId and then try again.",
							"error", doNothing);
				}else if(isContactEmailPresent==1){
					showAlertMessage1("Error",
							"<br/>"+" Contact Email Not Present For one or more Opportunity. Please enter EmailId and then try Again.  ",
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
	
	window.location.href= $('#contextPath').val()+'/opportunityprofile.htm?partyId='+partyId;
}

function xrayTool(partyId,name)
{
	window.location.href= $('#contextPath').val()+'/opportunity/xray.htm?partyId='+partyId+'&name='+name;
	
}
function sendEmail(partyId,name,email){
	$('#partyIdForNotification').val(partyId);
	$('#nameForNotification').val(name);
	$('#notifyToForNotification').val(email)
	$('#notifyType').val('email');
	$('#sendNotificationForm').attr('action','${pageContext.request.contextPath}/sendnotification.htm');
	$('#isBulk').val('0');
	$('#sendNotificationForm').submit();
}
function sendBlukEmail(){
	list = new Array();
	$('#grid-table :checked').each(function(i, obj) {
		list[i] = $(this).attr('id');
	});
	if (list.length == 0) {
		showAlertMessage1("Message",
				"Please select at least one Opportunity.",
				"information", doNothing);
	} else{
	$('#partyIdForNotification').val(list);
	$('#nameForNotification').val('');
	$('#notifyToForNotification').val('Bulk')
	$('#notifyType').val('email');
	$('#sendNotificationForm').attr('action','${pageContext.request.contextPath}/sendnotification.htm');
	$('#isBulk').val('1');
	$('#sendNotificationForm').submit();
	}
}

function sendSMS(partyId,name,phone){
	$('#partyIdForNotification').val(partyId);
	$('#nameForNotification').val(name);
	$('#notifyToForNotification').val(phone);
	$('#notifyType').val('sms');
	$('#sendNotificationForm').attr('action','${pageContext.request.contextPath}/sendnotification.htm');
	$('#isBulk').val('0');
	$('#sendNotificationForm').submit();
}

function sendMassSMS(){
	list = new Array();
	$('#grid-table :checked').each(function(i, obj) {
		list[i] = $(this).attr('id');
	});
	if (list.length == 0) {
		showAlertMessage1("Message",
				"Please select at least one Opportunity.",
				"information", doNothing);
	} else{
	$('#partyIdForNotification').val(list);
	$('#nameForNotification').val('');
	$('#notifyToForNotification').val('');
	$('#notifyType').val('sms');
	$('#sendNotificationForm').attr('action','${pageContext.request.contextPath}/sendnotification.htm');
	$('#isBulk').val('1');
	$('#sendNotificationForm').submit();
	}
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
<form method="post" id="getApDataForm" name="getApDataForm">
  <input type="hidden" id="partyIdToSend" name="partyId">
</form>
<form id="sendNotificationForm" name="sendNotificationForm" method="post">
  <input type="hidden" id="partyIdForNotification" name="partyId">
  <input type="hidden" id="nameForNotification" name="name">
  <input type="hidden" id="notifyTargetForNotification" name="notifyTarget" value="Opportunity">
  <input type="hidden" id="notifyToForNotification" name="notifyTo">
  <input type="hidden" id="notifyType" name="notifyType">
  <input type="hidden" id="isBulk" name="isBulk">
</form>
<div style="display: none;" id="blanket"></div>
<div class="modal fade" id="popUpConvertClient" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Convert Opportunity</h4>
      </div>
      <div class="modal-body">
        <div class="row" >
          <div class="list-group" id="changePasswordDetailsDiv" >
            <form id="convertClientForm">
              <div class="row">
                <div class="form-group col-md-12 clearfix">
                  <label class="col-sm-3 control-label no-padding-right" for="currentContactType">Current Contact Type</label>
                  <div class="col-sm-9"><span id="currentContactType"></span></div>
                </div>
              </div>
              <div class="row">
                <div class="form-group col-md-12 clearfix">
                  <label class="col-sm-3 control-label no-padding-right" for="convertToContactType">Convert to Contact Type<span class="red">*</span></label>
                  <div class="col-sm-9">
                    <select  id="convertToContactType" name="convertToContactType" class="form-control" validate="select" emsg="Convert to Contact Type">
                    </select>
                    <div id="convertToContactType_error" class="help-block hide">Please select Convert to Contact Type.</div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="form-group col-md-12 clearfix">
                  <label class="col-sm-3 control-label no-padding-right" for="convertNote">Convert Note<span class="red">*</span></label>
                  <div class="col-sm-9">
                    <textarea style="height: 100px;" class="form-control"  id="convertNote" validate="1" emsg="Convert Note" name="convertNote"></textarea>
                    <div id="convertNote_error" class="help-block hide">Please enter Convert Note.</div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="form-group col-md-12 clearfix">
                  <label class="col-sm-3 control-label no-padding-right" for="buttons"></label>
                  <div class="col-sm-9">
                    <div class="margin_5px btn btn-primary btn-xs pull-right" id="cancel"  onclick="convertContact('convertClientForm','Opportunity')">Update</div>
                  </div>
                </div>
              </div>
              <input type="hidden" id="contactPartyId" name="partyId">
              <input type="hidden" id="sectionName" name="sectionName" value="Opportunity">
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="popupDcInput" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Financial Plan Input Links</h4>
      </div>
      <div class="modal-body">
        <div class="row" id="popupDcInputHtml">
          <div class="list-group clearfix" id="changePasswordDetailsDiv1" style="height: 294px;
overflow-y: auto;" ><!-- <a class="list-group-item active">Financial Plan Input Links</a>-->
            <form id="DcInputtForm" class="clearfix">
             <div class="col-md-4 southspace3 northspace1">
                <div class="column_middle" id="dc_Input_Desktop_Version_btn">
                  <div class="theme" id="thumbdc_Input_Desktop_Version"><a href="#" class="thumb" >
                   <img src="<%=request.getContextPath()%>/images/basic_user.png"  alt="" onclick="redirectDcInput()">
                    </a></div>
                  <div class="title dcmenu">Financial Planner - Basic Plan</div>
                  <div class="des">Planning tool to collect the data in Quick Way</div>
                </div>
              </div>
              <div class="col-md-4 southspace3 northspace1">
                <div class="column_middle" id="dc_Input_FPT_btn" >
                  <div class="theme" id="themedc_Input_FPT"><a href="#" class="thumb" >
                   <img src="<%=request.getContextPath()%>/images/tab_icon.png"  alt="" onclick="redirectDcInputFpt()">
                    </a></div>
                  <div class="title dcmenu">Financial Planner - Advanced Plan</div>
                  <div class="des">Planning tool to collect the data Step by Step</div>
                </div>
              </div>
              <div class="col-md-4 southspace3 northspace1">
                <div class="column_right" id="dc_Input_FPT_Details_btn">
                  <div class="theme " id="thumbdc_Input_FPT_Details"><a href="#" class="thumb">
                    <img src="<%=request.getContextPath()%>/images/advanced_user.png"  alt="" onclick="redirectDcInputFptDetails()">
                    </a></div>
                  <div class="title dcmenu">Interactive Financial Planner - Detailed Plan</div>
                  <div class="des">An Interactive planning tool to capture Income, expense, assets, liability and insurance information in detail and allocate assets to specific goals at asset level.</div>
                </div>
              </div>
              <input type="hidden" id="partyId_DcInput" value="">
              <input type="hidden" id="opportunityName_DcInput" value="">
              <input type="hidden" id="datacollectionChange_DcInput" value="">
              <input type="hidden" id="fpPlanTypeId" value="">
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- </div> -->
<script>
$(document).ready(function() {

    
	$(function()
			{
				$("#nachDialogForMove").dialog(
			     {
			      autoOpen : false,
			      width:800,
			      show : {
			       effect : "blind",
			       duration : 200
			      },
			      hide : {
			       effect : "explode",
			       duration : 200
			      },
			      buttons : {
			       "Ok" : function() {
			

			    	   $(this).dialog("close");
			       },
			       
			       "Cancel" : function() {
			    	   $(this).dialog("close");
				       }
			      }
			     }); 
		});	
	
	function openNachDialogForMove(){
		$("#nachDialogForMove").dialog("open");
		
	}
	$('#tgl-help').on('click',function(){
      
        $('#tgl-helptext').slideToggle();
	  
    });
    
});



</script>
<script type="text/javascript">
	var hidePopupTimeoutId;



	$(".choose").on("mouseout", function() {
		hidePopupTimeoutId = setTimeout(function() {
			$(".popupnew").hide();
		}, 500);
	});

	$(".popupnew").on("mouseenter", function() {
		clearTimeout(hidePopupTimeoutId);
	});

	$(".popupnew").on("mouseleave", function() {
		$(".popupnew").hide();
	});



	$(".choose2").on("mouseover", function() {		
		clearTimeout(hidePopupTimeoutId);
		$(".popupnew2").show();
	});

	$(".choose2").on("mouseout", function() {
		hidePopupTimeoutId = setTimeout(function() {
			$(".popupnew2").hide();
		}, 500);
	});

	$(".popupnew2").on("mouseenter", function() {
		clearTimeout(hidePopupTimeoutId);
	});

	$(".popupnew2").on("mouseleave", function() {
		$(".popupnew2").hide();
	});

	function myFunction() {
		alert("Thank you for writing to us. We will take prompt action on this ticket and revert to you shortly.");
	}

	function oppsearch()
	{
		    var value = $('#search').val();   
		window.location.href = $('#contextPath').val()+"/opportunity/getOpportunitiesList.htm?value="+value;
	}
	
	function getXLS()
	{
		    var value = GetURLParameter('value');
		    if (value==undefined){
		    	value='';
		    }
			window.location.href = $('#contextPath').val()+"/opportunity/getOpportunitiesListXLS.htm?value="+value+'&pageSize='+$('#page').val();
	}
	function getCSV()
	{
		    var value = GetURLParameter('value');
		    if (value==undefined){
		    	value='';
		    }
			window.location.href = $('#contextPath').val()+"/opportunity/getOpportunitiesListCSV.htm?value="+value+'&pageSize='+$('#page').val();
	}
	
	function getSendReport(partyId)
	{
		$('#sendReportPartyId').val(partyId);
		$('#sendReportTable').empty();
		$('#sendReportTable').append('<tr id=""><th class="thead"></th><th class="thead">Document Name</th></tr>;');

		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/opportunity/getSendReport.htm?partyId=" + partyId,
			success : function(result) {
				$(result).each(function(i,obj) {
					
				//alert(result);
			if(obj.analysisReportDocumentID!=0){
			    $('#sendReportTable')
					.append(
							'<tr><td><input type="checkbox" id="'+obj.analysisReportDocumentID+'"></td><td> Analysis - Comprehensive </td></tr>');
			}
			if(obj.summaryActionPlanDocumentID!=0){
			    $('#sendReportTable')
					.append(
							'<tr><td><input type="checkbox" id="'+obj.summaryActionPlanDocumentID+'"></td><td>  Analysis - Goals and Risk </td></tr>');
			}
			if(obj.quickActionPlanDocumentID!=0){
			    $('#sendReportTable')
					.append(
							'<tr><td><input type="checkbox" id="'+obj.quickActionPlanDocumentID+'"></td><td> Analysis - Goals </td></tr>');
			}
			if(obj.analysisGoalRiskSuccessionID!=0){
			    $('#sendReportTable')
					.append(
							'<tr><td><input type="checkbox" id="'+obj.analysisGoalRiskSuccessionID+'"></td><td> Analysis - Goals, Risk & Succession </td></tr>');
			}
			if(obj.advisorActionPlanDocumentID!=0){
			    $('#sendReportTable')
					.append(
							'<tr><td><input type="checkbox" id="'+obj.advisorActionPlanDocumentID+'"></td><td> Partner Action Plan </td></tr>');
			}
			if(obj.clientActionPlanDocumentID!=0){
			    $('#sendReportTable')
					.append(
							'<tr><td><input type="checkbox" id="'+obj.clientActionPlanDocumentID+'"></td><td> Client Action Plan B </td></tr>');
			}
			if(obj.clientActionPlanDocumentIDA!=0){
			    $('#sendReportTable')
					.append(
							'<tr><td><input type="checkbox" id="'+obj.clientActionPlanDocumentIDA+'"></td><td> Client Action Plan A </td></tr>');
			}
			});
		
				$('#sendReport_dialog').modal();
				
			}
		});
	}
	
	function getMatchingTagsAndPotentialPings(contactPartyId)
	{
		$('#potentialPingTable').empty();
		$('#potentialPingTable').append('<tr id=""><th class="thead">Matching Tags</th><th class="thead">Potential Pings</th><th class="thead"></th></tr>;');
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/ping/getMatchingTagsAndPotentialPings.htm?partyId=" + contactPartyId,
			success : function(result) {
				$(result).each(function(i,obj) {
					
					$('#potentialPingTable')
					.append(
							'<tr id="potentialPingTable'
									+ i
									+ '"></tr>');
			$('#potentialPingTable' + i)
					.append(
							'<td  > '
									+ obj.notifyTagName
									+ '</td>');
			$('#potentialPingTable' + i)
					.append(
							'<td> '
									+ obj.name
									+ '</td>');
			$('#potentialPingTable' + i)
					.append(
							'<td><a href="#" id="'+contactPartyId+'" name="'+obj.notifyTemplateID+'" onclick="send(id,name);">Send </a></td>');
			

				});
				$('#potentialping_dialog').modal();
				
			}
		});
	}
	
	function send(contactPartyId, notifyTemplateID)
	{
		
		
		var tagList='<Root>';
		
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/ping/getTagsForPing.htm?ping='+notifyTemplateID,
			success : function(result) {
				
				$(result).each(function(i,obj) {

					tagList+='<Tag>';
					tagList+='<TagId>'+obj.notifyTagId+'</TagId>';
					tagList+='<ValueId>'+obj.notifyTagValueId+'</ValueId>';
					tagList+='</Tag>';
				});
				tagList+='</Root>'

					var notifyScheduleId = 0;
				var xmlStringNotifyParty='<Root>';
				xmlStringNotifyParty +='<party><partyId>'+contactPartyId+'</partyId></party>';	
				xmlStringNotifyParty +='</Root>';

				
				$('#xmlStringNotifyParty').val(xmlStringNotifyParty);
				$.ajax({
					type : "POST",
					 
					url : $('#contextPath').val()+'/ping/insertSchedulePings.htm?xmlStringNotifyParty='+xmlStringNotifyParty+'&tagList='+tagList+'&notifyScheduleId='+notifyScheduleId+'&ping='+notifyTemplateID,
					data: $('#insertSchedulePings').serialize(),
					
					success : function(result) {
						result = JSON.parse(result);
			
						if(result == "success"){
							$('#potentialping_dialog').modal('hide');
							showAlertMessage("Success", "<br/> Schedule Ping successfully.", "information", doNothing());
							
						}
						
					}
				});
			}
		});

			
		}
	
		function sendReport(){
			
			list = new Array();
			var cntr=0;
			$('#sendReportTable :checked').each(function(i, obj) {
				if($(this).attr('id')!='' && $(this).attr('id')!=undefined && $(this).attr('id')!=0){
					list[cntr] = $(this).attr('id');
					cntr+=1;
				}				
			});
			
			if (list.length == 0) {
				$('#fatalMessage').empty();
				$('#fatalMessage').append('<span style="color:red;">Please select at least one Report to Send.</span>');
			}
			else if(list.length > 3) {
				$('#fatalMessage').empty();
				$('#fatalMessage').append('<span style="color:red;">You cannot send more than 3 Reports.</span>');
			}
			
			else {
				var message = "";
				
				message = "Do you want to Send these Reports?";
				$('#sendReport_dialog').modal().hide();
				showAlertMessage1("Message", "<br/>" + message, "question",
						doNothing1);
				$('.ZebraDialog_Button1').attr('href','javascript:sendReportsTrue()');
				$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
			}						
		}
		
		function sendReportsTrue() {
			var sendReportPartyId=$('#sendReportPartyId').val();
// 			alert(sendReportPartyId);
			var message = "";
			
			if (list.length == 1) {
				message = "Report sent successfully.";
			} else {
				message = "Reports sent successfully.";
			}
			
			setTimeout(function() {
				$.ajax({
					type : 'POST',
					url : $('#contextPath').val()+'/common/sendGeneratedReports.htm?reportIds=' + list+'&sendReportPartyId='+sendReportPartyId,
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
			}, 500);
			
		}
</script>
<script type="text/javascript">
			var grid_data = 
			[ 
				{name:"Ajit Godbharle",rm:"Harshvardhan Chaudhari",city:"Pune",date:"2007-12-03",email:"11hkachoria@gmail.com", contact:"7865366768",dc_status:"Yes",stage:"<div class='progress pos-rel' data-percent='66%'><div class='progress-bar' style='width:66%;'></div></div>",action:"<a class='action'  onclick=''>Action </a>",comments:""},
				{name:"Ajit Godbharle",rm:"Harshvardhan Chaudhari",city:"Pune",date:"2007-12-03",email:"11hkachoria@gmail.com", contact:"7865366768",dc_status:"Yes",stage:"<div class='progress pos-rel' data-percent='66%'><div class='progress-bar' style='width:66%;'></div></div>",action:"<a class='action' href='' onclick=''>Action </a>",comments:""},
				{name:"Ajit Godbharle",rm:"Harshvardhan Chaudhari",city:"Pune",date:"2007-12-03",email:"11hkachoria@gmail.com", contact:"7865366768",dc_status:"Yes",stage:"<div class='progress pos-rel' data-percent='66%'><div class='progress-bar' style='width:66%;'></div></div>",action:"<a class='action' href='' onclick=''>Action </a>",comments:""},
				
			];
			
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
					$(grid_selector).jqGrid( 'setGridWidth', $("#toreload").width() );
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
					url:$('#contextPath').val()+'/opportunity/getOpportunitiesGrid.htm?value=${value}&sord=${desc}',
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
					
			
			
					//data: grid_data,
					datatype: "json",
					//height: 530,
// 					colNames:[' ',' ', 'Name','RM','City', 'Created Date', 'Email Id','Contact Number','Client Portal Activated?','Stage','Action'],
					colNames:[' ',' ', 'Name','RM','Email Id','Contact Number','Client Portal Activated?','Stage','1<sup>st</sup> AR Generation Date','Action'],
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
						{name:'checkbox',align:'center',width:'50px',index:'checkbox',sortable:false,formatter:function(cellvalue, options,rowObject) {
						    return '<input role="checkbox" type="checkbox"  class="cbox" id="'+rowObject.partyId+'" name="opportunityCb">';
						}},
						{name:'partyId',align:'center',width:'50px',index:'partyId',formatter:imageFormat,formatoptions:{baseLinkUrl:'${pageContext.request.contextPath}/addOpportunity.htm?partyId='}},
						{name:'name',width:'200px',index:'name',formatter:viewProfile},
						{name:'rmHead',index:'rm'},
// 						{name:'city',index:'city'},
// 						{name:'createdDate',index:'date',sortable:false},
						{name:'email',index:'email'},
						{name:'mobile',width:'130px',index:'contact'},
						{name:'dcActivation',width:'105px',index:'dc_status',formatter:yesNoFormat}, 
						{name:'stage',width:'120px',index:'stage',sortable:false,formatter:percentageFormat},
						{name:'arGenerationDate',index:'date',sortable:false},
						{name:'action',width:'120px',index:'action',sortable:false,formatter:function(cellvalue, options,rowObject) {
						    return '<h6><b><a onclick="openActionPopup('+rowObject.xrayReportDocumentID+','+rowObject.partyId+',\''+rowObject.name+'\','+rowObject.analysisGoalRiskSuccessionID+','+rowObject.analysisReportDocumentID+','+rowObject.clientActionPlanDocumentID+',\''+rowObject.executionStatus+'\','+rowObject.buId+',\''+rowObject.isDatacollectionChanged+'\','+rowObject.fpplanType+','+rowObject.summaryActionPlanDocumentID+','+rowObject.advisorActionPlanDocumentID+','+rowObject.quickActionPlanDocumentID+',\''+rowObject.email+'\','+rowObject.clientActionPlanDocumentIDA+',\''+rowObject.potentialPing+'\',\''+rowObject.mobile+'\',\''+rowObject.stage+'\',\''+rowObject.dcActivation+'\')">Action</a></b></h6>';						    
						}},
// 						{name:'actionComments',sortable:false,index:'comments',} 
						

					], 
					ignoreCase:true,
					jsonReader : {
						root : "rows",
						repeatitems : false,
						page : "page",
						total: "total",
						records : "records",
						id : "partyId",
						cell : "cell",
						},

			
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
							if($('#selectAll').attr('id')==undefined)
							$('#jqgh_grid-table_checkbox').before('<br/><input  type="checkbox" id="selectAll">');
							updateActionIcons(table);
							updatePagerIcons(table);
							enableTooltips(table);
							$('#selectAll').click(function(event) {  //on click 
						        if(this.checked) { // check select status
						            $('.cbox').each(function(i,obj) { //loop through each checkbox
						                this.checked = true;  //select all checkboxes with class   "checkbox1"    
									$(obj).attr('checked','checked');
						            });
						        }else{
						            $('.cbox').each(function(i,obj) { //loop through each checkbox
						                this.checked = false; //deselect all checkboxes with class "checkbox1"
						            	$(obj).removeAttr('checked');
						            });         
						        }
						        $('#selectAll').checked = true;
						    });
							
						}, 0);
					},
			
					editurl: "/dummy.html",//nothing is saved
					caption: ""
			
					,autowidth: true,
		            shrinkToFit:false,	
			
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
// 				jQuery(grid_selector).jqGrid('filterToolbar', { stringResult: true, searchOnEnter: true});
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
				
				function imageFormat( cellvalue, options, rowObject ){
					//alert(options.colModel.formatoptions.baseLinkUrl);
					return '<a href="'+options.colModel.formatoptions.baseLinkUrl+cellvalue+'"><div title="Edit selected row" class="ui-pg-div ui-inline-edit" onmouseover="jQuery(this).addClass(\'ui-state-hover\');" onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" ><span class="ui-icon ui-icon-pencil"></span></div></a>';
				}
				
				function viewProfile( cellvalue, options, cell ){
					if(cell.stage=='DCT Completed' || cell.stage=='DCT Submitted')
					{
						if(cell.isDatacollectionChanged == '1')
						{
							return '<h6><i class="fa icon-my-goals size-16"></i> <i class="fa icon-opportunity size-16"></i> <i class="fa fa-refresh size-16" style="vertical-align: -2px;" title="Please click on Generate Report if you would like to see the revised Analysis Report"></i> <b><a onclick="viewOpportunityProfileDetails('+cell.partyId+')">'+cellvalue+'</a></b></h6>';	
						}else{
							return '<h6><i class="fa icon-my-goals size-16"></i> <i class="fa icon-opportunity size-16"></i><b><a onclick="viewOpportunityProfileDetails('+cell.partyId+')">'+cellvalue+'</a></b></h6>';
						}														
					}						
					else{
						if(cell.isDatacollectionChanged == '1')
						{
							return '<h6><i class="fa icon-opportunity size-16"></i> <i class="fa fa-refresh size-16" style="vertical-align: -2px;" title="Please click on Generate Report if you would like to see the revised Analysis Report"></i> <b><a onclick="viewOpportunityProfileDetails('+cell.partyId+')">'+cellvalue+'</a></b></h6>';
						}else{
							return '<h6><i class="fa icon-opportunity size-16"></i> <b><a onclick="viewOpportunityProfileDetails('+cell.partyId+')">'+cellvalue+'</a></b></h6>';	
						}						
					}
				}
				
				//enable datepicker
				function pickDate( cellvalue, options, cell ) {
					setTimeout(function(){
						$(cell) .find('input[type=text]')
								.datepicker({format:'yyyy-mm-dd' , autoclose:true}); 
					}, 0);
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
						search: false,
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
					/*//enable datepicker on "sdate" field and switches for "stock" field
					form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
					
					form.find('input[name=stock]').addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
							   //don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
							  //.addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');
			
							
					//update buttons classes
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-xs').find('[class*="-icon"]').hide();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
					buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
					
					buttons = form.next().find('.navButton a');
					buttons.find('.ui-icon').hide();
					buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
					buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');	*/	
				}
			
				function style_delete_form(form) {
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-xs btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
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
					buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-xs btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
					buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-xs btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
					buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-xs btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
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
		</script>
<script>
		function openActionPopup(xrayReportDocumentID,partyId,name,analysisGoalRiskSuccessionID,analysisReportDocumentID,clientActionPlanDocumentID,executionStatus,buId,isDatacollectionChanged,fpplanType,summaryActionPlanDocumentID,advisorActionPlanDocumentID,quickActionPlanDocumentID,email,clientActionPlanDocumentIDA,potentialPing,mobile,stage,dcActivation){
			if(dcActivation==0)
			{
				$('.dCActivationTr').show();
				$('.DCReminderTr').hide();
			}else{
				$('.DCReminderTr').show();
				$('.dCActivationTr').hide();				
			}				
			
			$('#dCActivationLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');redirectDcActivation('+partyId+')');
		$('#AnalysisReportLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');downloadAttachmentForRequestQ(\'383\',\''+analysisReportDocumentID+'\',\''+partyId+'\')');
		$('#SummaryActionPlanLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');downloadAttachmentForRequestQ(\'385\',\''+summaryActionPlanDocumentID+'\',\''+partyId+'\')');
		$('#PartnerActionPlanLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');downloadAttachmentForRequestQ(\'387\',\''+advisorActionPlanDocumentID+'\',\''+partyId+'\')');	
		$('#QuickActionPlanLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');downloadAttachmentForRequestQ(\'384\',\''+quickActionPlanDocumentID+'\',\''+partyId+'\')');
		$('#ClientActionPlanLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');downloadAttachmentForRequestQ(\'388\',\''+clientActionPlanDocumentID+'\',\''+partyId+'\')');
		$('#PartnerActionPlanLinkspa a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');downloadAttachmentForRequestQ(\'387\',\''+advisorActionPlanDocumentID+'\',\''+partyId+'\')');
		$('#ClientActionPlanLinkspa a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');downloadAttachmentForRequestQ(\'388\',\''+clientActionPlanDocumentID+'\',\''+partyId+'\')');
		$('#AnalysisGoalRiskSuccessionID a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');downloadAttachmentForRequestQ(\'386\',\''+analysisGoalRiskSuccessionID+'\',\''+partyId+'\')');
		$('#ClientActionPlanDocumentIDALink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');downloadAttachmentForRequestQ(\'389\',\''+clientActionPlanDocumentIDA+'\',\''+partyId+'\')');
		$('#XRayReportLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');downloadAttachmentForRequestQ(\'392\',\''+xrayReportDocumentID+'\',\''+partyId+'\')');	
		
			$('#DCReminderLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');sendDCReminder('+partyId+')');
			$('#ViewQueryLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');viewQuery('+partyId+')');
			$('#ExecutionTrackerLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');openEt('+partyId+')');
			$('#ConvertLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');openConvertClientPopup(\'Opportunity\','+partyId+')');
			$('#SendEmailLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');sendEmail('+partyId+',\''+name+'\',\''+email+'\')');
			$('#SendPotentialPingLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');openMatchingTagPopup(\'Opportunity\','+partyId+')');
			$('#SendSMSLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');sendSMS('+partyId+',\''+name+'\',\''+mobile+'\')');
			$('#SendSMSLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');sendSMS('+partyId+',\''+name+'\',\''+mobile+'\')');
			$('#opportunityXRayActivationLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');redirectXRayActivation('+partyId+')');
			$('#opportunityXRayToolLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');xrayTool('+partyId+',\''+name+'\')');			
			$('#opportunitySendReportsLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');openSendReportPopup('+partyId+',\''+name+'\')');
			$('#opportunityGenerateReportLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');openGenerateReportPopup('+partyId+',\''+name+'\')');
			$('#opportunityXRayToolLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');xrayTool('+partyId+',\''+name+'\')');
// 			xrayReportDocumentID,analysisGoalRiskSuccessionID,analysisReportDocumentID,clientActionPlanDocumentID,summaryActionPlanDocumentID,advisorActionPlanDocumentID,quickActionPlanDocumentID,clientActionPlanDocumentIDA
			$('#SendXrayEmail a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');xrayEmailSurvey('+partyId+')');
			
			if(xrayReportDocumentID !=0 || analysisGoalRiskSuccessionID !=0 || analysisReportDocumentID !=0 || clientActionPlanDocumentID !=0 || summaryActionPlanDocumentID !=0 || advisorActionPlanDocumentID !=0 || quickActionPlanDocumentID !=0 || clientActionPlanDocumentIDA!=0)
			{
				$('.sendReportsTr').show();
				$('.GenerateReportLinkTr').show();
				
			}
			else
			{
				$('.sendReportsTr').hide();	
				$('.GenerateReportLinkTr').hide();
			}
			
//			alert($('#stage'));
// 			if(stage=='DCT Completed' || stage=='DCT Submitted')
// 				{
// 					$('.GenerateReportLinkTr').show();
					
// 				}
// 			else
// 				{
// 					$('.GenerateReportLinkTr').hide();	
// 				}
			
			if(executionStatus>0){
				//hide data collection link here
				$('#DCInputLink a').addClass('inactive_link');
			}else{

					$('#DCInputLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');openDcInputPopup('+partyId+','+buId+',\''+name+'\',\''+isDatacollectionChanged+'\','+fpplanType+')');

				$('#DCInputLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');openDcInputPopup('+partyId+','+buId+',\''+name+'\',\''+isDatacollectionChanged+'\','+fpplanType+')');
				$('#DCInputLink a').removeClass('inactive_link');
			}
			if('${sessionScope.userSession.buId}'!='27829'){
				$('#SummaryActionPlanLink').removeClass('hide');
				$('#QuickActionPlanLink').removeClass('hide');
				$('#ClientActionPlanDocumentIDALink').removeClass('hide');
				$('#AnalysisGoalRiskSuccessionID').removeClass('hide');
				
				$('#PartnerActionPlanLink').removeClass('hide');
				$('#ClientActionPlanLink').removeClass('hide');
				
				$('#PartnerActionPlanLinkspa').attr('class','hide');
				$('#ClientActionPlanLinkspa').attr('class','hide');
				$('#afterPartnerAP').attr('class','hide');
				$('#afterClientAP').attr('class','hide');
				$('#afterClientAPA').attr('class','hide');
				$('#XRayReportLink').removeClass('hide');
			}else{
				$('#PartnerActionPlanLinkspa').removeClass('hide');
				$('#ClientActionPlanLinkspa').removeClass('hide');
				$('#afterPartnerAP').removeClass('hide');
				$('#afterClientAP').removeClass('hide');
				$('#afterClientAPA').removeClass('hide');
				$('#XRayReportLink').removeClass('hide');
			
				//$('#SummaryActionPlanLink').attr('class','hide');
				//$('#QuickActionPlanLink').attr('class','hide');
				$('#SummaryActionPlanLink').removeClass('hide');
				$('#QuickActionPlanLink').removeClass('hide');
				$('#AnalysisGoalRiskSuccessionID').removeClass('hide');
				$('#PartnerActionPlanLink').attr('class','hide');
				$('#ClientActionPlanLink').attr('class','hide');
				$('#ClientActionPlanDocumentIDALink').attr('class','hide');
			}
			if(potentialPing=='1'){
				$('.sendPotentialPingTr').show();
			}else{
				$('.sendPotentialPingTr').hide();
			}
			
            
		
		
			/*$.ajax({
				type : "POST",
				url : $('#contextPath').val()+'/opportunity/getOpportunitiesTaskList.htm?value=Opportunity&partyId='+partyId,
				success : function(result) {
 					$(result).each(function(i,obj){
 						var partyId=obj.oppID;
 						var taskName=obj.taskName;
 						var taskNewName = taskName.substring(0, 15)+'....';
 						var Taskid=obj.taskId;
 						$('#tasktd'+(i+1)).append('<a title="'+taskName+'" href="${pageContext.request.contextPath}/addtask.htm?taskId='+Taskid+'">'+taskNewName+'</a>');
					});
					
				}
			});*/
			$('#action_dialog').modal();
		}
        jQuery(function($) {
        	$("#search").keyup(function(event) {
				if (event.keyCode == 13) {
					event.preventDefault();
					oppsearch();
				}
			});
        $( ".action" ).on('click', function(e) {
				$('#action_dialog').modal();
				});
				
		     $( ".progress").on('click', function(e) {
				$('#progress_dialog').modal();
				});
				
			});
			

        
        </script>
<!-- <div class="modal fade" id="action_dialog_test" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Actions</h4>
      </div>
      <div class="modal-body">
        <table id="" class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0">
          <tbody>
            <tr id="">
              <th class="thead">Action List</th>
              <th class="thead">Document List</th>
              <th class="thead">Task List</th>
            </tr>
            <tr id="dCActivationTr">
              <td id="dCActivationLink"><i class="fa fa-check"></i>&nbsp;<a onclick=""><span class="">Data Collection Activation</span></a></td>
              <td id="AnalysisReportLink" onclick=""><i class="fa fa-file-pdf-o"></i><a>&nbsp;<span class="">Analysis - Comprehensive</span></a></td>
              <td id="tasktd1"></td>
            </tr>
            <tr id="DCReminderTr">
              <td id="DCReminderLink"><i class="fa fa-bell"></i>&nbsp;<a onclick=""><span class="">Financial Plan Reminder</span></a></td>
              <td id="AnalysisReportLink" onclick=""><i class="fa fa-file-pdf-o"></i>&nbsp;<a><span class="">Analysis - Comprehensive</span></a></td>
              <td id="tasktd1"></td>
            </tr>
            <tr id="PartnerActionPlanLink1">
              <td id="DCInputLink"><i class="fa fa-pencil"></i>&nbsp;<a onclick=""><span class="">Data Collection Input</span></a></td>
              <td id="SummaryActionPlanLink" onclick="" class="hide"><i class="fa fa-file-pdf-o"></i>&nbsp;<a><span class="">Analysis - Goals and Risk</span></a></td>
              <td id="tasktd2"></td>
            </tr>
            <tr id="ClientActionPlanLink1">
              <td id="ViewQueryLink"><i class="fa fa-question-circle"></i>&nbsp;<a onclick=""><span class="">View Query</span></a></td>
              <td id="QuickActionPlanLink" onclick="" class="hide"><i class="fa fa-file-pdf-o"></i>&nbsp;<a><span class="">Analysis - Goals</span></a></td>
              <td id="tasktd3"></td>
            </tr>
            <tr id="">
              <td id="ExecutionTrackerLink"><i class="fa fa-check-square-o"></i>&nbsp;<a onclick=""><span class="">Execution Tracker</span></a></td>
              <td id="AnalysisGoalRiskSuccessionID" onclick=""><i class="fa fa-file-pdf-o"></i>&nbsp;<a><span class="">Analysis - Goals, Risk and Succession</span></a></td>
              <td id="tasktd4"></td>
            </tr>
            <tr id="PartnerActionPlanLink2">
              <td id="ConvertLink"><i class="fa fa-exchange"></i>&nbsp;<a onclick=""><span class="">Convert</span></a></td>
              <td id="PartnerActionPlanLink" name="PartnerActionPlanLink2" class="hide" onclick=""><i class="fa fa-file-pdf-o"></i>&nbsp;<a><span class="">Partner Action Plan</span></a>&nbsp;<i class="fa fa-question" onclick="actionPlanHelpPopUp();"></i></td>
              <td id="PartnerActionPlanLinkspa" name="PartnerActionPlanLink1" onclick="" class="hide"><i class="fa fa-file-pdf-o"></i>&nbsp;<a><span class="">RM Action Plan</span></a><i class="fa fa-question" onclick="actionPlanHelpPopUp();"></i></td>              <td id="afterPartnerAP" class="hide"></td>
              <td id="tasktd5"></td>
            </tr>
            <tr id="ClientActionPlanLink2">
              <td id="SendEmailLink"><i class="fa fa-envelope"></i>&nbsp;<a onclick=""><span class="">Send Email</span></a></td>
              <td id="ClientActionPlanLink" name="ClientActionPlanLink2" onclick="" class="hide"><i class="fa fa-file-pdf-o"></i>&nbsp;<a><span class="">Client Action Plan B</span></a>&nbsp;<i class="fa fa-question" onclick="actionPlanHelpPopUp();"></i></td>
              <td id="ClientActionPlanLinkspa" name="ClientActionPlanLink1" onclick="" class="hide"><i class="fa fa-file-pdf-o"></i>&nbsp;<a><span class="">Client Action Plan</span></a>&nbsp;<i class="fa fa-question" onclick="actionPlanHelpPopUp();"></i></td>
              <td id="afterClientAP" class="hide"></td>
              <td id="tasktd6"></td>
            </tr>
            <tr id="">
              <td id="SendSMSLink"><i class="fa fa-mobile bigger-160"></i>&nbsp;<a onclick=""><span class="">Send SMS</span></a></td>
              <td id="ClientActionPlanDocumentIDALink" onclick="" class="hide"><i class="fa fa-file-pdf-o"></i>&nbsp;<a><span class="">Client Action Plan A</span></a>&nbsp;<i class="fa fa-question" id="abc" onclick="actionPlanHelpPopUp();"></i></td>
              <td id="afterClientAPA" class="hide"></td>
              <td id="tasktd7"></td>
            </tr>
            <tr id="">
              <td id="opportunityXRayActivationLink"><i class="fa fa-play"></i>&nbsp;<a><span class="user">X-Ray Activation</span></a></td>
              <td id="XRayReportLink" onclick="" class="hide"><i class="fa fa-file-pdf-o"></i>&nbsp;<a><span class="">X-Ray Report</span></a>&nbsp;<i class="fa fa-question" id="abc" onclick="actionPlanHelpPopUp();"></i></td>              
              <td id="tasktd8"></td>
            </tr>
            <tr id="">
              <td id="opportunityXRayToolLink"><i class="fa icon-x-ray"></i>&nbsp;<a><span class="user">X-RAY Tool</span></a></td>
              <td></td>
              <td id="tasktd9"></td>
            </tr>
            <tr id="sendPotentialPingTr">
              <td id="SendPotentialPingLink"><i class="fa fa-comment"></i>&nbsp;<a onclick=""><span class="">Send Potential Ping</span></a></td>
              <td id="" onclick=""><a><span class="">&nbsp;</span></a></td>
              <td id=""></td>
            </tr>
            <tr id="sendReportsTr">
              <td id="SendReportsLink"><i class="fa fa-database size-18"></i>&nbsp;<a><span class="user">Send Reports</span></a></td>
              <td id="" onclick=""><a><span class="">&nbsp;</span></a></td>
              <td id=""></td>              
            </tr>
            <tr id="SendXrayEmailTr">
              <td id="SendXrayEmail"><i class="fa icon-x-ray"></i>&nbsp;<a ><span class="user">Send Xray Survery Email</span></a></td>
              <td></td>
              <td id=""></td>
            </tr>
            <tr id="">
              <td id="GenerateReportLink"><i class="fa fa-database size-18"></i>&nbsp;<a ><span class="user">Generate Report</span></a></td>
              <td></td>
              <td id=""></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>-->

<div class="modal fade" id="action_dialog" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Actions</h4>
      </div>
      <div class="modal-body">
        <div class="tabbable">
											<ul class="nav nav-tabs" id="actionTab">
												<li class="active">
													<a data-toggle="tab" href="#tools">
														Tools
														
													</a>
												</li>

												<li>
													<a data-toggle="tab" href="#report">
														Reports
														
													</a>

													<ul class="dropdown-menu dropdown-info">
														<li>
															<a data-toggle="tab" href="#dropdown1">@fat</a>
														</li>

														<li>
															<a data-toggle="tab" href="#dropdown2">@mdo</a>
														</li>
													</ul>
												</li>
												
												<li >
													<a data-toggle="tab" href="#crm">
														
														CRM
													</a>
												</li>
											</ul>

											<div class="tab-content">
												<div id="crm" class="tab-pane fade ">
                                                <table id="" class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0">
											          <tbody>
											          		<tr id="ClientActionPlanLink1">
            													<td id="ViewQueryLink"><i class="fa fa-question-circle"></i>&nbsp;<a onclick=""><span class="">View Query</span></a></td>
           													</tr>
           													<tr id="">
              													<td id="ExecutionTrackerLink"><i class="fa fa-check-square-o"></i>&nbsp;<a onclick=""><span class="">Execution Tracker</span></a></td>
              												</tr>
              												<tr id="PartnerActionPlanLink2">
              													<td id="ConvertLink"><i class="fa fa-exchange"></i>&nbsp;<a onclick=""><span class="">Convert</span></a></td>
              												</tr>
              												<tr id="ClientActionPlanLink2">
              													<td id="SendEmailLink"><i class="fa fa-envelope"></i>&nbsp;<a onclick=""><span class="">Send Email</span></a></td>
              												</tr>
              												<tr id="">
              													<td id="SendSMSLink"><i class="fa fa-mobile bigger-160"></i>&nbsp;<a onclick=""><span class="">Send SMS</span></a></td>
              												</tr>
              												<tr class="sendPotentialPingTr">
              													<td id="SendPotentialPingLink"><i class="fa fa-comment"></i>&nbsp;<a onclick=""><span class="">Send Potential Ping</span></a></td>
              												</tr>
              												<tr class="sendReportsTr">
              													<td id="opportunitySendReportsLink"><i class="fa icon-send_report size-20"></i>&nbsp;<a><span class="user">Send Reports</span></a></td>
              												</tr>
              												<tr id="SendXrayEmailTr" class="hide">
              													<td id="SendXrayEmail"><i class="fa icon-x-ray"></i>&nbsp;<a ><span class="user">Send Xray Survery Email</span></a></td>
              												</tr>
              												
											            </tbody>
										            </table>
												</div>

												<div id="tools" class="tab-pane fade in active">
													<table id="" class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0">
											          <tbody>
												            <tr class="dCActivationTr">
												              <td id="dCActivationLink"><i class="fa fa-check"></i>&nbsp;<a onclick=""><span class="">Data Collection Activation</span></a></td>
												            </tr>
												            <tr class="DCReminderTr">
	              												<td id="DCReminderLink"><i class="fa fa-bell"></i>&nbsp;<a onclick=""><span class="">Financial Plan Reminder</span></a></td>
												            </tr>
												             <tr id="PartnerActionPlanLink1">
    															<td id="DCInputLink"><i class="fa fa-pencil"></i>&nbsp;<a onclick=""><span class="">Data Collection Input</span></a></td>
 															</tr>
 															<tr id="">
 																 <td id="opportunityXRayActivationLink"><i class="fa fa-play"></i>&nbsp;<a><span class="user">X-Ray Activation</span></a></td>
 															</tr>
 															<tr id="">
              													<td id="opportunityXRayToolLink"><i class="fa icon-x-ray"></i>&nbsp;<a><span class="user">X-RAY Tool</span></a></td>
              												</tr>
              												<tr class="GenerateReportLinkTr">
              													<td id="opportunityGenerateReportLink"><i class="fa icon-genrate_report size-20"></i>&nbsp;<a ><span class="user">Generate Report</span></a></td>
              												</tr>
											            </tbody>
										            </table>
												</div>

												<div id="report" class="tab-pane fade">
							                      	<table class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0">
								          				<tbody>
								          					<tr id="">
								          						<td id="AnalysisReportLink" onclick=""><i class="fa fa-file-pdf-o"></i><a>&nbsp;<span class="">Analysis - Comprehensive</span></a></td>
								          					</tr>
								          					<tr id="">
								          						<td id="SummaryActionPlanLink" onclick="" class="hide"><i class="fa fa-file-pdf-o"></i>&nbsp;<a><span class="">Analysis - Goals and Risk</span></a></td>
								          					</tr>
								          					<tr id="">
								          						<td id="QuickActionPlanLink" onclick="" class="hide"><i class="fa fa-file-pdf-o"></i>&nbsp;<a><span class="">Analysis - Goals</span></a></td>
								          					</tr>
								          					<tr id="">
								          						<td id="AnalysisGoalRiskSuccessionID" onclick=""><i class="fa fa-file-pdf-o"></i>&nbsp;<a><span class="">Analysis - Goals, Risk & Succession</span></a></td>
								          					</tr>
								          					<tr id="">
								          						<td id="PartnerActionPlanLink" name="PartnerActionPlanLink2" class="hide" onclick=""><i class="fa fa-file-pdf-o"></i>&nbsp;<a><span class="">Partner Action Plan</span></a>&nbsp;<i class="fa fa-question" onclick="actionPlanHelpPopUp();"></i></td>
              													<td id="PartnerActionPlanLinkspa" name="PartnerActionPlanLink1" onclick="" class="hide"><i class="fa fa-file-pdf-o"></i>&nbsp;<a><span class="">RM Action Plan</span></a><i class="fa fa-question" onclick="actionPlanHelpPopUp();"></i></td>              <td id="afterPartnerAP" class="hide"></td>
								          					</tr>
								          					<tr id="">
								          						<td id="ClientActionPlanDocumentIDALink" onclick="" class="hide"><i class="fa fa-file-pdf-o"></i>&nbsp;<a><span class="">Client Action Plan A</span></a>&nbsp;<i class="fa fa-question" id="abc" onclick="actionPlanHelpPopUp();"></i></td>
								          					</tr>
								          					<tr id="">
								          						<td id="ClientActionPlanLink" onclick="" class="hide"><i class="fa fa-file-pdf-o"></i>&nbsp;<a><span class="">Client Action Plan B</span></a>&nbsp;<i class="fa fa-question" id="abc" onclick="actionPlanHelpPopUp();"></i></td>
								          					</tr>
								          					<tr id="">
								          						<td id="XRayReportLink" onclick="" class="hide"><i class="fa fa-file-pdf-o"></i>&nbsp;<a><span class="">X-Ray Report</span></a></td>
								          					</tr>
								          					
											          	</tbody>
										        	</table>
												</div>

											</div>
										</div>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<div class="modal fade" id="popUpActionPlanHelp" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
							aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Action Plan Help</h4>
      </div>
      <div class="modal-body">The action plan is a list of recommended actions you need to take
        to bridge the gaps:
        <ul>
          <li>In meeting your goals</li>
          <li>In your  emergency &succession plan</li>
          <li>In the various risk coverage</li>
        </ul>
        <p>First few pages show recommended products (mostly Mutual Funds) for each goal and corresponding investments needed for both SIP and lumpsum options. A product wise summary view is provided for your convenience which lists a product and how much you need to invest in that product for each of the goals. It allows you to choose a particular option.</p>
        <p>These recommendations are based on the goal duration, your risk appetite and the advisors research and analysis of various products in the market.</p>
        <p>Next page shows the gaps and actions for bridging the gap in emergency products.  The recommendations are based on your monthly expenses and keeping in mind the liquidity of the investments.</p>
        They are typically deposits and liquid funds.
        <p>Following page shows the gaps in the required coverage and the available coverage.  We recommend two options to choose from. The premiums mentioned are approximate. Please approach your advisor to get specific quote/proposals.</p>
        <p>Finally, the succession planning related actions are outlined on the last page.  Will preparation is facilitated through the backend service team of your advisor.</p>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="popupGenerateReport" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Generate Report</h4>
      </div>
      <div class="modal-body">
        <div class="row" id="popupDcInputHtml">
          <div class="list-group" id="changePasswordDetailsDiv1" >
            <div class="row"><br>
              <br>
              <div class="clearfix"></div>
              <div class="col-md-12" style="margin:30px 0;">
                <ul>
                  <input type="radio" name="analysisComprehensive" id="analysisGoals" value="3" >
                  &nbsp;&nbsp;&nbsp;Analysis - Goals<br><br>
                
                  <input type="radio" name="analysisComprehensive" id="analysisGoalsandRisk" value="4" >
                  &nbsp;&nbsp;&nbsp;&nbsp;Analysis - Goals and Risk<br><br>
               
                  <input type="radio" name="analysisComprehensive" id="analysisGoalsRiskSuccession" value="5" >
                  &nbsp;&nbsp;&nbsp;&nbsp;Analysis - Goals, Risk & Succession<br><br>
                  <input type="radio" name="analysisComprehensive" id="analysisComprehensive" value="1" checked="checked">
                  &nbsp;&nbsp;&nbsp;&nbsp;Analysis - Comprehensive
                </ul>
                <center>
                  <br>
                  <a href="#">
                  <input class="btn btn-primary ZebraDialog_Button1" type="button" value="Generate Report" name="Generate Report" onclick="submit();closePopupGenerateReport();">
                  </a>
                </center>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="popupMoveOpportunities" tabindex="-1"

		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
						aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Move Opportunities</h4>
      </div>
      <div class="modal-body">
        <div class="" id="popupDcInputHtml">
          <div class="list-group" id="changePasswordDetailsDiv1">
            <div class="row">
              <div class="list-group-item" id="biz-panels">
                <div id="jstree2" class="jstree jstree-1 jstree-default"
										role="tree"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div style="display: none;" id="blanket"></div>
<div class="modal fade" id="insuranceMethodsPopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Life Insurance Methods</h4>
      </div>
      <div class="modal-body">
        <div class="row"><br>
          <br>
          <div class="list-group" id="liMethodsDetailsDiv" >
            <form id="pnl-zm">
              <div class="row clearfix">
                <button class="btn btn-primary btn-xsall pull-right eastspace4" id="tgl-help"><span class="fa fa-question"></span>Help</button>
                <div class="clearfix"></div>
                <div id="tgl-helptext" style="width:71%;
height: 300px;position:absolute;padding: 10px;z-index: 999;position: absolute;top:97px;overflow-y: auto; right:10px;background:#ccc; display:none"><span>Please see below description about calculation methods.</span>
                  <ul>
                    <li><b>Income Replacement  :</b><br/>
                      <b>Objective:</b>In case of death of primary earning member, financial loss to family is equivalent to the income that person would have earned till his / her retirement. Life insurance can be a way this loss is replaced to the family.<br/>
                      <b>Insurance cover =</b>(Current  Annual Income * number of years to retirement)</li>
                    <li><b>Expense Replacement  :</b><br/>
                      <b>Objective:</b>In case of death of the primary earning member, the expenses of the dependents have to be handled till they are alive. To ensure that in the absence of the breadwinner , all the inevitable expenses are  planned for and helps the family to be financially sound.<br/>
                      <b>Insurance cover =</b>Present value ( expenses for expected life remaining) while accounting for Effective rate of return.  Effective rate of return 
                      is based on the growth rate and inflation rate - available cover</li>
                    <li><b>HLV Replacement  :</b><br/>
                      <b>Objective:</b>To ensure that in the absence of the breadwinner , all the inevitable expenses and life goals (goals such as education, marriage) are  planned for. The 
                      method also takes into account the outstanding loans and current assets.<br/>
                      <b>Insurance cover =</b>Cover as per Expense replacement method without considering EMIs + Value of life goals  + Loans outstanding - Available assets - available cover</li>
                    <li><b>Example:</b>Let's see how it works for Mr. A.B. Joshi. Let's make following assumptions:
                      <table class="exmple_table">
                        <tbody>
                          <tr>
                            <th class="col1">Age</th>
                            <td class="col2">35</td>
                            <th class="col3">Inflation rate</th>
                            <td class="col4">6%</td>
                          </tr>
                          <tr>
                            <th>Income</th>
                            <td>INR 5 Lac p.a.</td>
                            <th>Return on Existing investment</th>
                            <td>7%</td>
                          </tr>
                          <tr>
                            <th>Expenses</th>
                            <td>INR 30,000/-  p.m.</td>
                            <th>Life expectancy</th>
                            <td>85</td>
                          </tr>
                          <tr>
                            <th>EMIs</th>
                            <td>INR 15,000/- p.m.</td>
                            <th>Retirement Age</th>
                            <td>60</td>
                          </tr>
                          <tr>
                            <th>Existing cover</th>
                            <td>INR 15 Lac</td>
                            <th>Existing Loans</th>
                            <td>INR 60 Lac</td>
                          </tr>
                        </tbody>
                      </table>
                      <table class="goals">
                        <caption class="strong">
                        Goals
                        </caption>
                        <tbody>
                          <tr>
                            <th class="col1">Education</th>
                            <td class="col2">INR 10 Lac</td>
                          </tr>
                          <tr>
                            <th>Child Marriage</th>
                            <td>INR 5.5 Lac</td>
                          </tr>
                        </tbody>
                      </table>
                      <table class="currentInvestment">
                        <caption class="strong">
                        Current Investments
                        </caption>
                        <tbody>
                          <tr>
                            <th class="col1">Equity</th>
                            <td class="col2">INR 5 Lacs</td>
                          </tr>
                          <tr>
                            <th>Debt</th>
                            <td>INR 85,000</td>
                          </tr>
                        </tbody>
                      </table>
                      <br/>
                      <br/>
                      <br/>
                      <br/>
                      <b>Income Replacement</b><br/>
                      Insurance cover = (5 Lac * (60-35)) - 15 Lac = 1.11 Cr<br/>
                      <b>Expense Replacement</b><br/>
                      ROR = (1+Growth rate)/(1+Inflation Rate)-1 = (1.07/1.06-1) = 0.94% 
                      Insurance cover = PV(ROR/12,(Life Expectancy-Current Age)*12,-Mothly expenses,0,0) 
                      = PV (0.94%, (85-35)*12, -45000,0,0) 
                      = 2.15 Cr<br/>
                      <b>HLV</b><br/>
                      Insurance cover as per expense replacement without EMI = 1.43 CR 
                      Insurance cover = 1.43 Cr.  + 15.5 Lac + 60 Lac - 6 Lacs - 15 lacs = 1.97 Cr</li>
                  </ul>
                </div>
              </div>
              <table class="table table-striped" cellpadding="5" cellspacing="5" id="liMethodsTable" style="width: 98%;margin-left: 10px;margin-top: 10px;">
                <tr>
                  <th width="22%" style="border-top: none !important;">Calculation Method</th>
                  <th width="78%" style="border-top: none !important;" >Insurance Amount</th>
                </tr>
                <tr>
                  <td width="22%" style="border-top: none !important;">HLV</td>
                  <td width="78%" style="border-top: none !important;" id="hlvAmount"></td>
                </tr>
                <tr>
                  <td width="22%" style="border-top: none !important;">Expense Replacement</td>
                  <td width="78%" style="border-top: none !important;" id="expenseAmount"></td>
                </tr>
                <tr>
                  <td width="25%" style="border-top: none !important;">Income Replacement</td>
                  <td width="78%" style="border-top: none !important;" id="incomeAmount"></td>
                </tr>
              </table>
              <table class="table table-striped" cellpadding="5" cellspacing="5" id="liMethodsTable" style="width: 98%;margin-left: 10px;margin-top: 10px;">
                <tr>
                  <th colspan="2">Select calculation method for this contact</th>
                </tr>
                <tr>
                  <td colspan="2"><select id="liMethodSelect" class="form-control"  style="background-color:rgb(255, 255, 255);border:1px solid rgb(204, 204, 204);box-shadow:0px 1px 1px rgba(0, 0, 0, 0.075) inset;width: 50%">
                      <option value="0">HLV</option>
                      <option value="1">Expense Replacement</option>
                      <option value="2">Income Replacement</option>
                    </select></td>
                </tr>
                <tr>
                  <td><input id="save" class="btn btn-primary btn-xsall" type="button" value="Submit"   onclick="saveLIMethod()"></td>
                </tr>
              </table>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="progress_dialog" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Stages</h4>
      </div>
      <div class="modal-body">
        <div class="table-responsive">
          <table id="dcStageTable" class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0">
          </table>
        </div>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<div class="modal fade" id="potentialping_dialog" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Potential Ping</h4>
      </div>
      <div class="modal-body" style="height:455px;overflow-y:auto">
        <div class="table-responsive">
          <table id="potentialPingTable" class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0">
          </table>
        </div>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>


<div class="modal fade" id="sendReport_dialog" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Send Report</h4>
      </div>
      
       <div id="fatalMessage"></div>
      <div class="modal-body">
        <div class="table-responsive">
          <table id="sendReportTable" class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0">
          </table>
          <button class="btn-primary btn btn-xs southspace1 pull-right" type="button" id="sendReportPartyIdbtn" name="Send Report" onclick="sendReport()">Send Report</button>       
        </div>
       
       <input type="hidden" id="sendReportPartyId" name="sendReportPartyId">
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

<!--<div class="common_dialog hide potentialping_dialog">
  <table id="potentialPingTable" class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0">
  </table>
</div>-->
<script type="text/javascript">
function  actionPlanHelpPopUp()
{
 // $(\'#action_dialog\').modal(\'hide\');
  $('#popUpActionPlanHelp').modal('show') ;
  $('#action_dialog').modal('hide') ;
  
}
</script>

</body>
<script>
function bulkXRayActivation(){
	list = new Array();
	
	var cntr=0;
	$('#grid-table :checked').each(function(i, obj) {
		if($(this).attr('id')!='selectAll' && $(this).attr('id')!='chkdeleteselect' && $(this).attr('id')!='' && $(this).attr('id')!=undefined && $(this).attr('id')!=0){
			list[cntr] = $(this).attr('id');
			cntr+=1;
		}
		
	});
	
	if (list.length == 0) {
		showAlertMessage1("Message",
				"Please select at least one Opportunity.",
				"information", doNothing);
	} else{
		var message = "";
		if (list.length == 1) {
			message = "Do you want to activate X-Ray for these Opportunity?";
		} else {
			message = "Do you want to activate X-Ray for these Opportunities?";
		}
		showAlertMessage1("Message", "<br/>" + message, "question",
				doNothing1);
		$('.ZebraDialog_Button1').attr('href','javascript:xrayActivateOpportunityTrue()');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
	}
}

function createGraph()
{
	
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
    
    try{
	
	$('#jstree2').jstree({

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
    
	
}

function xrayEmailSurvey(partyId)
{
 //window.location.href= $('#contextPath').val()+'/opportunity/sendXraySurveyEmail.htm';
 //alert('partyId='+partyId)
 $.ajax({
	 type :'GET',
	
     url : "${pageContext.request.contextPath}/opportunity/sendXraySurveyEmail.htm?partyId="+partyId,
	 success : function(result)
	 {
		 showAlertMessage1("Success","Xray Survey Email Sent","confirmation",doNothing)
		// alert('Xray Survey Email Sent')
	 }
});
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

			obj.type=typeName;
			obj.nodeId=locationId;
			obj.level=level;
			obj.children=new Array();
			childArray.push(obj);
		}
	
		setTimeout(function() {
			setChildArray1(nodeId,nodeLevel,childArray)
		}, 10000);
	});
}

function  userClick(nodeId,partyId)
{
	closePopupMoveOpportunities();	
	list = new Array();
	var partyIds;
	var cntr=0;
	$('#grid-table :checked').each(function(i, obj) {
		if($(this).attr('id')!='selectAll' && $(this).attr('id')!='chkdeleteselect' && $(this).attr('id')!='' && $(this).attr('id')!=undefined && $(this).attr('id')!=0){
			list[cntr] = $(this).attr('id');
			cntr+=1;
		}
		
	});
	
	for (i = 0; i < list.length; i++) 
	{
		partyIds =+','+ list[i];
    }
	
	

	
	var message = "";
	message = "Do You Want To Move Opportunities?";
	showAlertMessage1("Message", "<br/>" + message, "question",
			doNothing1);
	$('.ZebraDialog_Button1').attr('href','javascript:moveUser('+partyId+','+nodeId+')');
	$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
	
}

function moveUser(partyId,nodeId)
{


	$.ajax({
			type : 'GET',
	
			url :  $('#contextPath').val() +"/partner/moveClientOrOpportunity.htm?list="+list+"&partyId="+partyId+"&nodeId="+nodeId,
					success :function(result)
					{
	
						 var result=result;					
						if(result=='1'){
							showAlertMessage1("Success",
									"<br/>Opportunities Moved successfully.",
									"information",reloadPage);
	 					}else {
	 						showAlertMessage("Error","<br/> Error occured while Moving Opportunities. ", 'error', doNothing);
	 					} 
					}
		}); 
 	 
}

function closeMoveContactDialog(){
	$(".default_checkbox").attr("checked", false);
	checkedIds = '';
	$(".white_checkbox").removeClass("white_checkbox_checkbox_checked");
	$(".overlay").fadeOut("slow");
	$("#moveContactsDialog").fadeOut("slow");
	$("#life_insurance_methods").fadeOut("slow");
	
	
}
function xrayActivateOpportunityTrue(){
	var message = "";
	if (list.length == 1) {
		message = "X-Ray for Opportunity successfully activated.";
	} else {
		message = list.length + "X-Ray for Opportunities successfully activated.";
	}
	setTimeout(function() {
		$('#partyIds').val(list);
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/opportunity/redirectXRayActivation.htm",
			data : $('#bulkActivateForm').serialize(),
			success : function(result) {

				var recordCount=result[0];
				var isAlreadyActivated=result[1];
				
				
				if(recordCount>0){
					showAlertMessage1("Success",
							"<br/>"+" X-Ray activated. ",
							"confirmation", reloadPage);
					
				}else if(isAlreadyActivated==1){
					showAlertMessage1("Error",
							"<br/>"+" X-Ray already activated for one or more opportunity from the list. ",
							"error", doNothing);
				}
			}
		});
		
	}, 500);	
}
</script>
</html>
