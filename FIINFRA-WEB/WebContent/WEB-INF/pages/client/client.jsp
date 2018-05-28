<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<title>Client</title>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<style>
#ui-id-2 {
	width: 168px!important;
	padding-left: 24px!important;
}
.ui-menu-item {
	list-style: none !important;
}
.ui-corner-all {
	margin-left: -10px!important;
}
.ui-helper-hidden-accessible {
	color: #000;
}
.tab {
	height: 30px;
	width: 150px;
	background-color: #d2d2d2;
	float: left;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	text-align: center;
	line-height: 31px;
	font-weight: bold;
	color: #363636;
	margin: 0px 5px 0px 5px;
	text-decoration: none !important;
}
.tab-select {
	background-color: #575757;
	color: #fff;
}
.tab-select:hover {
	color: #fff;
}
</style>
<script>

	
	</script>
<style>
.goalicon {
	background: url(../images/goalopportunityicon.png);
	padding-right: 17px;
	width: 18px;
	height: 20px;
	padding-bottom: 2px;
}
.changeicon {
	background: url(../images/allCommon-Icons.png) no-repeat -0px -767px;
	padding-right: 17px;
	height: 20px;
	padding-top: 2px;
}
</style>
<style>
.column_bx {
	height: 464px;
	width: 84%;
	margin: auto;
}
.column_left, .column_middle, .column_right {
	width: 90%;
	position: relative;
}
.column_left .title, .column_middle .title, .column_right .title {
	position: relative;
	top: 16px;
	font-family: Arial, Helvetica, sans-serif;
	color: #3a3a3e;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	line-height: 15px;
}
.column_left .des, .column_middle .des, .column_right .des {
	position: relative;
	top: 24px;
	font-family: Arial, Helvetica, sans-serif;
	color: #3a3a3e;
	font-size: 12px;
	text-align: center;
	line-height: 15px;
}
.column_left .theme, .column_middle .theme, .column_right .theme {
	height: 190px;
	width: 100%;
	position: relative;
	top: 20px;
	z-index: 100;
}
.column_left .thumb, .column_middle .thumb, .column_right .thumb {
	height: 160px;
	width: 100%;
	-moz-box-shadow: 0px 0px 3px 1px #B3B3B3;
	-webkit-box-shadow: 0px 0px 3px 1px #B3B3B3;
	box-shadow: 0px 0px 3px 1px #B3B3B3;
	background: #fff;
	text-align: center;
	border-radius: 10px;
	z-index: 100;
	margin-left: 6px;
	display: block;
}
.column_left .theme.selected:before, .column_middle .theme.selected:before, .column_right .theme.selected:before {
	height: 173px;
	width: 106%;
	-moz-box-shadow: 0px 3px 3px 1px #5C5C5C;
	-webkit-box-shadow: 0px 3px 3px 1px #5C5C5C;
	box-shadow: 0px 3px 3px 1px #5C5C5C;
	content: "";
	position: absolute;
	z-index: -10;
	top: -7px;
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
<script type="text/javascript">
var hidePopupTimeoutId;

function clientsearch()
{
	    var value = $('#search').val();
  // alert('value='+value);   
	window.location.href = $('#contextPath').val()+"/client/getClientList.htm?value="+value+'&pageSize=10&autoPlanClient=${autoPlanClient}';
}

function clientQuickSearch(partyId,isAllClients){
	var searchString=$('#mergeclientsearch').val();
	if(partyId==0)
		partyId=$('#basecontactPartyIdForMerge').val();

	var isFromProfile=false;

	$("#toreload1").load('${pageContext.request.contextPath}/client/getClientListToMerge.htm #toreload1', {
		   object: '${object}',
		   contactpartyId: partyId,
		   isAllClients:isAllClients,
		   isFromProfile:isFromProfile,
		   value:searchString,
		     }, function( response, status, xhr ) {
		      try{
		        closePopupWebApp('');
		      }catch(e){
		         closePopupWebApp('');       
		      }
		     });
	$('#basecontactPartyIdForMerge').val(partyId);
	openMergeClientPopup(isAllClients,partyId);
}

</script>
</head><body>
<jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/common_popup.jsp" />
<!--         <input type="hidden" name="dcInputPartyId" id="dcInputPartyId" value="">
        <input type="hidden" name="dcInputBuId" id="dcInputBuId" value=""> -->
        
        
        <!-- Center part start -->
        <section>
          <div class="">
            <div class="main-content">
              <div class="main-contnet-inner">
                <div class="page-content">
                  <div class="page-header clearfix">
                    <h1 class="pull-left">Client</h1>
                    <div class="nav-search pull-right" id="">
                      <form class="form-search">
                        <span class="input-icon">
                        <input type="text" placeholder="Search ..." class="nav-search-input" id="search" autocomplete="off" value="${value}">
                        <i class="ace-icon fa fa-search nav-search-icon"></i></span>
                      </form>
                    </div>
                  </div>
                  <div class="container-body">
                    <div class="topmenu row rightAlign dropdown"> <a class="" href="<%=request.getContextPath()%>/addClient.htm" id="NewClientLink">
                      <button data-params="{}" class="southspace1 westspace1 dbtn createNewBtn btn btn-primary btn-xs" title="New Client" ><i class="fa fa-plus"></i> New Client</button>
                      </a>
                     <!--  <button data-params="{}" class="southspace1 westspace1 dbtn deleteBtn btn btn-primary btn-xs" id="DeleteClientLink"  title="Delete Client" onclick="deleteClients()"><i class="fa fa-trash"></i> Delete Client</button> -->
                      <!-- <button class="southspace1 westspace1 dbtn createNewBtn btn btn-primary btn-xs" id="moveClients"  title="Move Client" onclick="openMoveOpportunitiesPOPUP()"><i class="fa fa-arrows-alt"></i> Move Client</button> -->
                     <!--  <button class="southspace1 westspace1 dbtn createNewBtn btn btn-primary btn-xs" id="BulkActivationLink"  title="Bulk Activation" onclick="bulkActivation()"><i class="fa fa-plus"></i> Bulk Activation</button> -->
                      <button class="southspace1 westspace1 dbtn createNewBtn btn btn-primary btn-xs" id="bulkClientXRayActivationLink" title="Bulk X - Ray Activation" onclick="bulkXRayActivation()"><i class="fa fa-play"></i> Bulk X - Ray Activation</button>
                      <div class="dropdown inlineBlock"><a class="dropdown-toggle" href="#" data-toggle="dropdown" >
                        <button data-params="{}" class="southspace1 westspace1 dbtn createNewBtn btn btn-primary btn-xs" title="More Action" alt="More Action"><i class="fa fa-plus"></i> More Action</button>
                        </a>
                        <ul class="dropdown-menu pull-right" id="moreButtonClick">
                          <li><a  id="massEmailLink" onclick="sendBlukEmail()"><i class="fa fa-envelope"></i> <span
									class="user">Mass Email</span></a></li>
                          <li><a id="massSMSLink" onclick="sendMassSMS()"><i class="fa fa-mobile size-24"></i> <span
									class="user">Mass SMS</span></a></li>
                          <li><a  id="bulkDCReminderLink" onclick="sendBulkDcReminder()"><i class="fa fa-bell"></i> <span
									class="user">Bulk - Financial Plan Reminder</span></a></li>
                          <li><a  id="clientbulkXRayReminderLink" onclick="sendBulkXRayReminder()"><i class="fa fa-bell"></i> <span
									class="user">Bulk X - RAY Reminder</span></a></li>
									  <li><a  id="DeleteClientLink"  title="Delete Client" onclick="deleteClients()"><i class="fa fa-trash"></i> <span
									class="user">
									Delete Client
									</span></a></li>
									
									   <li><a id="moveClients"  title="Move Client" onclick="openMoveOpportunitiesPOPUP()"><i class="fa fa-arrows-alt"></i> <span
									class="user">
									Move Client
									</span></a></li>
									
									   <li><a  id="BulkActivationLink"  title="Bulk Activation" onclick="bulkActivation()"><i class="fa fa-plus"></i> <span
									class="user">
									Bulk Activation
									</span></a></li>
                        </ul>
                      </div>
                      <!--        </div> --> 
                    </div>
                    <div class="clearfix"></div>
                    <div class="jq_parent row" id="display_table_lead" style="border: none;">
                      <c:choose>
                        <c:when test="${autoPlanClient==0}">
                          <ul class="nav nav-tabs padding-12 tab-color-blue background-blue">
                            <li class="active"><a class="tab tab-select" id="allClientLink" onclick="refreshGrid(1)">All</a></li>
                            <li ><a class="tab" id="autoPlanClientLink" onclick="refreshGrid(0)">Auto Plan</a></li>
                          </ul>
                        </c:when>
                        <c:otherwise>
                          <ul class="nav nav-tabs padding-12 tab-color-blue background-blue">
                            <li ><a class="tab" id="allClientLink" onclick="refreshGrid(1)">All</a></li>
                            <li class="active"><a class="tab  tab-select" id="autoPlanClientLink" onclick="refreshGrid(0)">Auto Plan</a></li>
                          </ul>
                        </c:otherwise>
                      </c:choose>
                      <div class="clearfix"></div>
                      <div id="toreload" class="tabular_break_word col-md-12">
                        <table id="grid-table">
                        </table>
                        <div id="grid-pager"></div>
                        <!-- 		<a onclick="getXLS()">Export as Excel</a> -->
                        <div class="topmenuleft margin_5px" ><span>Export options:</span> <a class="margin_5px" onclick="getCSV()" title="Export in CSV" alt="Export in CSV"><i class="fa icon-csv bigger-170"></i></a> <a class="margin_5px" onclick="getXLS()" title="Export in Excel" alt="Export in Excel"><i class="fa fa-file-excel-o bigger-170"></i></a> 
                          <!--                   </ul> --> 
                        </div>
                        
                        <!-- Center--> 
                      </div>
                    </div>
                  </div>
                  <!-- container-body --> 
                </div>
                <!-- page-content --> 
              </div>
              <!--  main-contnet-inner --> 
            </div>
            <!--main-content End  --> 
          </div>
          <!-- container End --> 
        </section>
        <!-- Center part End --> 
        
        <script>
$(document).ready(function() {
	$('#tgl-help').on('click',function(){
        //e.preventDefault();
        $('#tgl-helptext').slideToggle();
    });
    
});



</script> 
        <script>
var contactTypeList;
var stageList;
var mergeClientList;
var mergeClientId;

function refreshGrid(isAllClient){
	var autoPlanClient=0;
	if(isAllClient==0){
		autoPlanClient=1;
		$('#allClientLink').removeClass('tab-select');
		$('#autoPlanClientLink').addClass('tab-select');
		$('#allClientLink').parent("li").removeClass('active');
		$('#autoPlanClientLink').parent("li").addClass('active');
	}else{
		$('#autoPlanClientLink').removeClass('tab-select');
		$('#allClientLink').addClass('tab-select');
		$('#autoPlanClientLink').parent("li").removeClass('active');
		$('#allClientLink').parent("li").addClass('active');
	}
	$('#autoPlanClient').val(autoPlanClient);
	setResult(autoPlanClient);	
}

$(function() {
	$("#search").keydown(function(event) {
		console.log('here:----'+event.keyCode);
		//alert('here:----'+event.keyCode);
		if (event.keyCode == 13) {
			var value = $('#search').val();
			event.preventDefault();
			  // alert('value='+value);   
				window.location.href = $('#contextPath').val()+"/client/getClientList.htm?value="+value+'&pageSize=10&autoPlanClient=${autoPlanClient}';
		}
		
	});
	console.log('autoPlanClient:--------------------${autoPlanClient}')
	$("#mergeclientsearch").keydown(function(event) {
		if (event.keyCode == 13) {
			event.preventDefault();
			clientQuickSearch(0,false);
		}
	});
	showSelectedTab('clientLink');
	setTimeout(function(){closePopupWebApp('');},200);
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=7,15',
		success : function(result) {
			contactTypeList=result;
			setTimeout(function(){closePopupWebApp('');},200);
					
		}
	});
});

function getPopUpAction(id)
{
	$("#"+id).show();		
}

function viewQuery(partyId){
//	 var value = $('#tags').val();
//alert($('#contextPath').val());
	window.location.href = $('#contextPath').val()+"/query/getQueryList.htm?partyId="+partyId;
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
				"Please select at least one Client to Send X-Ray Reminder.",
				"information", doNothing);
	} else{
// 		alert('Hi'+list);
		var message = "";
		if (list.length == 1) {
			message = "Do you want to Send this Client X-Ray Reminder?";
		} else {
			message = "Do you want to Send these Clients X-Ray Reminder ?";
		}
		showAlertMessage1("Message", "<br/>" + message, "question",
				doNothing1);
		$('.ZebraDialog_Button1').attr('href','javascript:bulkXRayReminderTrue()');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');

	}	
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


function pagesizeurl(){
	var pageSize=$('#page').val();	
// 	window.location.href= $('#contextPath').val()+'/opportunity/getOpportunitiesList.htm?pageSize='+pageSize;
	setResult('');	
}
function getXLS()
{
	    var value = GetURLParameter('value');
	    if (value==undefined){
	    	value='';
	    }
		window.location.href = $('#contextPath').val()+"/client/getClientListXLS.htm?value="+value+'&pageSize='+$('#page').val()+'&autoPlanClient='+$('#autoPlanClient').val();
}
function getCSV()
{
	    var value = GetURLParameter('value');
	    if (value==undefined){
	    	value='';
	    }
		window.location.href = $('#contextPath').val()+"/client/getClientListCSV.htm?value="+value+'&pageSize='+$('#page').val()+'&autoPlanClient='+$('#autoPlanClient').val();
}


function setResult(filterRuleCriteria){
	window.location.href='${pageContext.request.contextPath}/client/getClientList.htm?autoPlanClient='+filterRuleCriteria;
	
	 }

function redirectDcActivation(partyId)
{
	

		$('#partyIds').val(partyId);
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/opportunity/redirectDcActivation.htm",
			data : $('#bulkActivateForm').serialize(),
			success : function(result) {
// 				alert(result);
				var recordCount=result[0];
				var isExistAnyUser=result[1];
				var isAlreadyActivated=result[2];
				var isContactEmailPresent=result[3];
// 				alert('recordCount------'+recordCount);

// 				alert('isContactEmailPresent------'+isContactEmailPresent);
				if(recordCount>0){
// 					localStorage.setItem('actionName',
// 							window.location.pathname);
					showAlertMessage1("Success",
							"<br/>"+" Client Portal activated. ",
							"confirmation", reloadPage);
					
				}else if(isAlreadyActivated==1){
					showAlertMessage1("Error",
							"<br/>"+" Client Portal already activated. ",
							"error", doNothing);
				}else if(isExistAnyUser==1){
					showAlertMessage1("Error",
							"<br/>"+" Username already exist. Please change EmailId and then try again.",
							"error", doNothing);
				}else if(isContactEmailPresent==1){
					showAlertMessage1("Error",
							"<br/>"+" Contact Email Not Present For Client.Please enter EmailId and then try Again. ",
							"error", doNothing);
				}
				
			}
		});
		
		
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
		showAlertMessage1("Message", 'You have chosen to switch from basic version to detailed plan. Please note you will not be able to switch back to basic versions. Please confirm your choice.', "question",
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
					window.location.href= $('#contextPath').val()+'/quickDcDetails.htm?partyId='+partyId+'&buId='+buId+'&name='+pname+'&client=1';
				}
				else if(version=='Desktop'){
					window.location.href= $('#contextPath').val()+'/opportunity/redirectDcInput.htm?partyId='+partyId+'&buId='+buId+'&pname='+pname+'&isDatacollectionChange='+datacollectionChange+'&isClient=1';
				}else{
					window.location.href= $('#contextPath').val()+'/opportunity/redirectDcfpt.htm?partyId='+partyId+'&buId='+buId+'&pname='+pname+'&isDatacollectionChange='+datacollectionChange+'&recordTypeId='+14006;
				}
		}else{
		$.ajax({
		type : 'POST',
		url : $('#contextPath').val()+"/opportunity/updateFpplanType.htm?fpPlanTypeId="+fpPlanTypeId+"&partyId="+partyId,
		//data : $('#bulkActivateForm').serialize(),
		success : function(result) {
			//var recordCount=result[0];
			
			$('#fpPlanTypeId').val(fpPlanTypeId);
			buId = $('#buId').val();
			if(version=='Quick'){
				window.location.href= $('#contextPath').val()+'/quickDcDetails.htm?partyId='+partyId+'&buId='+buId+'&name='+pname+'&client=1';
			}
			else if(version=='Desktop'){
				window.location.href= $('#contextPath').val()+'/opportunity/redirectDcInput.htm?partyId='+partyId+'&buId='+buId+'&pname='+pname+'&isDatacollectionChange='+datacollectionChange+'&isClient=1';
			}else{
				window.location.href= $('#contextPath').val()+'/opportunity/redirectDcfpt.htm?partyId='+partyId+'&buId='+buId+'&pname='+pname+'&isDatacollectionChange='+datacollectionChange+'&recordTypeId='+14005;
			}
		}
		});
}
}
function openDcInputPopup(partyId,buId,pname,datacollectionChange,fpPlanTypeId)
{
	//alert('fpPlanTypeId='+fpPlanTypeId)
	openPopupDcInput(partyId,buId,pname,datacollectionChange,fpPlanTypeId);
}

function viewClientProfileDetails(partyId){
	//alert(partyId);
	window.location.href= $('#contextPath').val()+'/clientprofile.htm?partyId='+partyId;
}

function openGenerateReportPopup(partyId,buId)
{
//	 alert('${data.stage}');
	 $('.popupnew2').hide();
	openPopupGenerateReport(partyId,buId);
}

/**
 * deletes multiple users after taking confirmation.
 */
function deleteClients() {
	list = new Array();
	
	var cntr=0;
	$('#grid-table :checked').each(function(i, obj) {
		if($(this).attr('id')!='selectAll' && $(this).attr('id')!='chkdeleteselect' && $(this).attr('id')!='' && $(this).attr('id')!=undefined && $(this).attr('id')!=0){
			list[cntr] = $(this).attr('id');
			cntr+=1;
		}
		
	});
// 	$('#data :checked').each(function(i, obj) {
// 		list[i] = $(this).attr('id');
// 	});
	if (list.length == 0) {
		showAlertMessage1("Message",
				"Please select at least one Client to delete.",
				"information", doNothing);
	} else{
		var message = "";
		if (list.length == 1) {
			message = "Do you want to delete this Client?";
		} else {
			message = "Do you want to delete these Clients?";
		}
		showAlertMessage1("Message", "<br/>" + message, "question",
				doNothing1);
		$('.ZebraDialog_Button1').attr('href','javascript:deleteClientsTrue()');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
	}
}

function deleteClientsTrue() {
	var message = "";
	if (list.length == 1) {
		message = "Client successfully deleted.";
	} else {
		message = "Clients successfully deleted.";
	}
	setTimeout(function() {
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/client/deleteClients.htm?partyIds=" + list,
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
				"Please select at least one Client to Send Financial Plan Reminder.",
				"information", doNothing);
	} else{
		var message = "";
		if (list.length == 1) {
			message = "Do you want to Send this Client Financial Plan Reminder?";
		} else {
			message = "Do you want to Send these Client Financial Plan Reminder ?";
		}
		showAlertMessage1("Message", "<br/>" + message, "question",
				doNothing1);
		$('.ZebraDialog_Button1').attr('href','javascript:bulkDCReminderTrue()');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
	}
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
					showAlertMessage("Success", '<br/>Reminder sent successfully.', "confirmation", doNothing)
				
			}
		});
	}, 500);
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
				"Please select at least one Client.",
				"information", doNothing);
	}
	else
		{
			createGraph();
			openPopupMoveOpportunities();
			
		}
	 
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
// 	$('#data :checked').each(function(i, obj) {
// 		list[i] = $(this).attr('id');
// 	});
	if (list.length == 0) {
		showAlertMessage1("Message",
				"Please select at least one Client.",
				"information", doNothing);
	} else{
		var message = "";
		if (list.length == 1) {
			message = "Do you want to activate these Client?";
		} else {
			message = "Do you want to activate these Clients?";
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
		message = "Client successfully Activated.";
	} else {
		message = list.length + "Clients successfully Activated.";
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
				var isContactEmailPresent=result[3];
				
				if(recordCount>0){
// 					localStorage.setItem('actionName',
// 							window.location.pathname);
					showAlertMessage1("Success",
							"<br/>"+" Client Portal activated. ",
							"confirmation", reloadPage);
					
				}else if(isAlreadyActivated==1){
					showAlertMessage1("Error",
							"<br/>"+" Client Portal already activated for one or more Client from the list. ",
							"error", doNothing);
				}else if(isExistAnyUser==1){
					showAlertMessage1("Error",
							"<br/>"+" Username already exist for one or more Client from the list. Please change EmailId and then try again.",
							"error", doNothing);
				}else if(isContactEmailPresent==1){
					showAlertMessage1("Error",
							"<br/>"+" Contact Email Not Present For one or more Client. Please enter EmailId and then try Again.  ",
							"error", doNothing);
				}
				
			}
		});
		
	}, 500);
	
}



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
				"Please select at least one Client.",
				"information", doNothing);
	} else{
		var message = "";
		if (list.length == 1) {
			message = "Do you want to activate X-Ray for these Client?";
		} else {
			message = "Do you want to activate X-Ray for these Client?";
		}
		showAlertMessage1("Message", "<br/>" + message, "question",
				doNothing1);
		$('.ZebraDialog_Button1').attr('href','javascript:xrayActivateOpportunityTrue()');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
	}
}
function xrayActivateOpportunityTrue(){
	var message = "";
	if (list.length == 1) {
		message = "X-Ray for Client successfully activated.";
	} else {
		message = list.length + "X-Ray for Client successfully activated.";
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
							"<br/>"+" X-Ray already activated for one or more Client from the list. ",
							"error", doNothing);
				}
			}
		});
		
	}, 500);	
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
function openEt(partyId){
	$('#partyIdToSend').val(partyId);	 
	$('#getApDataForm').attr('action',$('#contextPath').val()+"/et/getApDetails.htm");
	$('#getApDataForm').submit();	
} 


function reloadPage(){
	location.reload();
}

function preConvertClientPopup(partyId,contactTypeID){
	var currentContactType='';
	$('#convertToContactType').empty();
	$('#convertToContactType').append('<option value="0">--Select--</option>');
	$(contactTypeList).each(function(i,obj) {
		var codeTypeId=obj.codeTypeId;
		var codeValue=obj.codeValue;
		var codevalueId=obj.codeValueId;
		if(codeTypeId==15 && codevalueId>contactTypeID){
			$('#convertToContactType').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
		}
	});
	if(contactTypeID==15003){
		currentContactType='Client';
	}else{
		currentContactType='Premium Client';
	}
	
	openConvertClientPopup(currentContactType,partyId)
}

/* By vaibhav Deshmukh 
  logic to fetch details of other client which are related to selected clents and show details in Popup*/ 

function mergeClientPopup(partyId,isAllClients){
	if(partyId==0)
		partyId=$('#basecontactPartyIdForMerge').val();
	//alert('partyId='+partyId);
	var isFromProfile=false;
	  openPopupWebApp('centerLoadingImage', 25, 35);
// 	  $('#basecontactPartyIdForMerge').val(partyId);
	//  localStorage.setItem("basecontactPartyIdForMerge", partyId);
	$("#toreload1").load('${pageContext.request.contextPath}/client/getClientListToMerge.htm #toreload1', {
		   object: '${object}',
		   contactpartyId: partyId,
		   isAllClients:isAllClients,
		   isFromProfile:isFromProfile,
		   
		   //'${pageSize}', 
		   //filterRule: filterRuleCriteria
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
	$('#basecontactPartyIdForMerge').val(partyId);
	openMergeClientPopup(isAllClients,partyId);
	
	
}

function mergeClients()
{
	
	mergeClientList = new Array();
	
	$('#data1 :checked').each(function(i, obj) {
		mergeClientId = $(this).attr('id');
	});
// 	alert('mergeClientId='+mergeClientId);
	if (mergeClientId == undefined || mergeClientId == 'undefined') {
		showAlertMessage1("Message",
				"Please select one Client to merge.",
				"information", doNothing);
	} else{
		var message = "";
		if (mergeClientId > 0) {
			message = "Do you want to merge this Client?";
		} 
		showAlertMessage1("Message", "<br/>" + message, "question",
				doNothing1);
		$('.ZebraDialog_Button1').attr('href','javascript:mergeClientTrue()');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');

	}
}
function mergeClientTrue() {
	
	var message = "";
	if (mergeClientId > 0) {
		message = "Client successfully merged.";
	} 
	$('#mergeClientId').val(mergeClientId);
	
   var contactPartyId = $('#basecontactPartyIdForMerge').val();
   $('#contactPartyId_MergeClient').val(contactPartyId);
  // alert('contactPartyId='+contactPartyId)
	setTimeout(function() {
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/client/mergeClients.htm", 
			data : $('#mergeClientForm').serialize(),
					
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

function sendEmail(partyId,name,email){
	$('#partyIdForNotification').val(partyId);
	$('#nameForNotification').val(name);
	$('#notifyToForNotification').val(email)
	$('#notifyType').val('email');
	$('#sendNotificationForm').attr('action','${pageContext.request.contextPath}/sendnotification.htm');
	$('#sendNotificationForm').submit();
}
function sendBlukEmail(){
	list = new Array();
	$('#grid-table :checked').each(function(i, obj) {
		list[i] = $(this).attr('id');
	});
	if (list.length == 0) {
		showAlertMessage1("Message",
				"<br/>Please select at least one Client.",
				"information", doNothing);
	} else{
		$('#partyIdForNotification').val(list);
		$('#nameForNotification').val('');
		$('#notifyToForNotification').val('Bulk');
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
	$('#sendNotificationForm').submit();
}
function sendMassSMS(){
	list = new Array();
	$('#grid-table :checked').each(function(i, obj) {
		list[i] = $(this).attr('id');
	});
	if (list.length == 0) {
		showAlertMessage1("Message",
				"<br/>Please select at least one Client.",
				"information", doNothing);
	} else{
		$('#partyIdForNotification').val(list);
		$('#nameForNotification').val('');
		$('#notifyToForNotification').val('');
		$('#notifyType').val('sms')
		$('#sendNotificationForm').attr('action','${pageContext.request.contextPath}/sendnotification.htm');
		$('#isBulk').val('1');
		$('#sendNotificationForm').submit();
	}
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
//		alert(sendReportPartyId);
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
		
//			obj.notifyTemplateID
			});
			$('#potentialping_dialog').modal('show')
			
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
//				alert('taglist='+tagList);
				var notifyScheduleId = 0;
			var xmlStringNotifyParty='<Root>';
			xmlStringNotifyParty +='<party><partyId>'+contactPartyId+'</partyId></party>';	
			xmlStringNotifyParty +='</Root>';
			//alert('xmlStringNotifyParty='+xmlStringNotifyParty);
			
			$('#xmlStringNotifyParty').val(xmlStringNotifyParty);
			$.ajax({
				type : "POST",
				 
				url : $('#contextPath').val()+'/ping/insertSchedulePings.htm?xmlStringNotifyParty='+xmlStringNotifyParty+'&tagList='+tagList+'&notifyScheduleId='+notifyScheduleId+'&ping='+notifyTemplateID,
				data: $('#insertSchedulePings').serialize(),
				
				success : function(result) {
					result = JSON.parse(result);
					//alert('result='+result);
					if(result == "success"){
						$('#potentialping_dialog').modal('hide');
						showAlertMessage("Success", "<br/> Schedule Ping successfully.", "information", doNothing());
					}
					
				}
			});
		}
	});
	}

</script> 
        <script type="text/javascript">
			var grid_data = 
			[ 
				{name:"Ajit Godbharle",rm:"Harshvardhan Chaudhari",city:"Pune",date:"2007-12-03",email:"11hkachoria@gmail.com", contact:"7865366768",dc_status:"Yes",stage:"<div class='progress pos-rel' data-percent='66%'><div class='progress-bar' style='width:66%;'></div></div>",action:"<a class='action'  onclick=''>Action </a>",comments:""},
				{name:"Ajit Godbharle",rm:"Harshvardhan Chaudhari",city:"Pune",date:"2007-12-03",email:"11hkachoria@gmail.com", contact:"7865366768",dc_status:"Yes",stage:"<div class='progress pos-rel' data-percent='66%'><div class='progress-bar' style='width:66%;'></div></div>",action:"<a class='action' href='' onclick=''>Action </a>",comments:""},
				{name:"Ajit Godbharle",rm:"Harshvardhan Chaudhari",city:"Pune",date:"2007-12-03",email:"11hkachoria@gmail.com", contact:"7865366768",dc_status:"Yes",stage:"<div class='progress pos-rel' data-percent='66%'><div class='progress-bar' style='width:66%;'></div></div>",action:"<a class='action' href='' onclick=''>Action </a>",comments:""},
				
			];
			//grid_data='${clientDatas}';
			//console.log('grid_data:---'+grid_data);
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
					url:$('#contextPath').val()+'/client/getClientGrid.htm?value=${value}&autoPlanClient=${autoPlanClient}&sord=${desc}',
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
					
			
			
// 					data: grid_data,
					datatype: "json",
					height: 250,
// 					colNames:[' ', 'Name','RM','City','PAN No.','Created Date', 'Email Id','Contact Number','Client Portal Activated?','Stage','Status','Auto Plan Client','Action','Action'],
					colNames:[' ', 'Name','RM','Email Id','Contact Number','Client Portal Activated?','Stage','1<sup>st</sup> AR Generation Date','Status','Auto Plan Client','Action','Action'],
					colModel:[						
						{name:'checkbox',width:'50px',align:'center',index:'checkbox',sortable:false,formatter:function(cellvalue, options,rowObject) {
						    return '<input role="checkbox" type="checkbox"  class="cbox" id="'+rowObject.partyId+'" name="clientCb">';
						}},
						//{name:'partyId', index:'partyId', width:25,formatter:imageFormat,formatoptions:{baseLinkUrl:'${pageContext.request.contextPath}/addClient.htm?partyId='}},						
						{name:'name',width:'200px',index:'name',formatter:viewProfile},
						{name:'rmHead',index:'rm'},
// 						{name:'city',index:'city'},
// 						{name:'panNo',index:'panNo'},
// 						{name:'createdDate',index:'date',sortable:false},
						{name:'email',index:'email'},
						{name:'mobile',index:'contact'},
						{name:'dcActivation',width:'125px',index:'dc_status',formatter:yesNoFormat}, 
						{name:'stage',width:'150px',index:'stage',sortable:false,formatter:percentageFormat},
						{name:'arGenerationDate',width:'150px',index:'date',sortable:false},
// 						{name:'action',index:'action2',hidden:true},
						{name:'action',width:'75px',index:'action'},
						{name:'action',width:'75px',index:'action',formatter:yesNoFormat},												
						{name:'action1',width:'100px',index:'action1',sortable:false,formatter:boldFormat,formatter:function(cellvalue, options,rowObject) {
								return '<h6><b><a onclick="openActionPopup('+rowObject.xrayReportDocumentID+','+rowObject.partyId+',\''+rowObject.name+'\','+rowObject.analysisGoalRiskSuccessionID+','+rowObject.analysisReportDocumentID+','+rowObject.clientActionPlanDocumentID+',\''+rowObject.executionStatus+'\','+rowObject.buId+',\''+rowObject.isDatacollectionChanged+'\','+rowObject.fpplanType+','+rowObject.summaryActionPlanDocumentID+','+rowObject.advisorActionPlanDocumentID+','+rowObject.quickActionPlanDocumentID+',\''+rowObject.email+'\','+rowObject.clientActionPlanDocumentIDA+',\''+rowObject.potentialPing+'\',\''+rowObject.mobile+'\',\''+rowObject.executionStatusStr+'\',\''+rowObject.action+'\',\''+rowObject.stage+'\',\''+rowObject.dcActivation+'\')">Action</a></b></h6>';
						}},
						{name:'autoPlanAction',width:'145px',index:'autoPlanAction',sortable:false,hidden:true,formatter:boldFormat,formatter:function(cellvalue, options,rowObject) {
							if(rowObject.action!='New' && rowObject.action!='' && rowObject.action!='Generated')
								return '<h6><b><a onclick="showAutoplanAction('+rowObject.partyId+',\''+rowObject.name+'\',\''+rowObject.action+'\')">Action</a></b></h6>';
							else
								return '';
						    
						}},
// 						{name:'actionComments',index:'comments',sortable:false} 
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
					
// 					multiselect: true,
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
					scrollOffset:0,
                    height:'100%',
                    width:'100%',
                    scrollOffset:0,
			
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
			
			function viewProfile( cellvalue, options, cell ){				
// 				return '<h6><b><a onclick="viewClientProfileDetails('+cell.partyId+')">&nbsp; '+cellvalue+'</a></b></h6>';				
				if(cell.stage=='DCT Completed' || cell.stage=='DCT Submitted')
				{
					if(cell.isDatacollectionChanged == '1')
					{
						return '<h6><i class="fa icon-my-goals size-16"></i> <i class="fa fa-user size-16"></i> <i class="fa fa-refresh size-16"  style="vertical-align: -2px;" title="Please click on Generate Report if you would like to see the revised Analysis Report"></i> <b><a onclick="viewClientProfileDetails('+cell.partyId+')">'+cellvalue+'</a></b></h6>';	
					}else{
						return '<h6><i class="fa icon-my-goals size-16"></i> <i class="fa fa-user size-16"></i><b><a onclick="viewClientProfileDetails('+cell.partyId+')">'+cellvalue+'</a></b></h6>';
					}														
				}						
				else{
					if(cell.isDatacollectionChanged == '1')
					{
						return '<h6><i class="fa fa-user size-16"></i> <i class="fa fa-refresh size-16" style="vertical-align: -2px;" title="Please click on Generate Report if you would like to see the revised Analysis Report"></i> <b><a onclick="viewClientProfileDetails('+cell.partyId+')">'+cellvalue+'</a></b></h6>';
					}else{
						return '<h6><i class="fa fa-user size-16"></i> <b><a onclick="viewClientProfileDetails('+cell.partyId+')">'+cellvalue+'</a></b></h6>';	
					}						
				}
			}
			
			

		function openActionPopup(xrayReportDocumentID,partyId,name,analysisGoalRiskSuccessionID,analysisReportDocumentID,clientActionPlanDocumentID,executionStatus,buId,isDatacollectionChanged,fpplanType,summaryActionPlanDocumentID,advisorActionPlanDocumentID,quickActionPlanDocumentID,email,clientActionPlanDocumentIDA,potentialPing,mobile,executionStatusStr,action,stage,dcActivation){
					//alert(partyId);
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
					$('#DCReminderLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');sendDCReminder('+partyId+')');
					$('#ViewQueryLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');viewQuery('+partyId+')');
					$('#ExecutionTrackerLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');openEt('+partyId+')');
					$('#mergeClientLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');mergeClientPopup('+partyId+',false)');
					$('#SendEmailLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');sendEmail('+partyId+',\''+name+'\',\''+email+'\')');
					$('#SendPotentialPingLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');openMatchingTagPopup(\'Opportunity\','+partyId+')');
					$('#SendSMSLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');sendSMS('+partyId+',\''+name+'\',\''+mobile+'\')');
					$('#clientXRayActivationLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');redirectXRayActivation('+partyId+')');
					$('#clientXRayToolLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');xrayTool('+partyId+',\''+name+'\')');
					$('#clientSendReportsLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');openSendReportPopup('+partyId+',\''+name+'\')');
					$('#clientGenerateReportLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');openGenerateReportPopup('+partyId+',\''+buId+'\')');
					$('#XRayReportLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');downloadAttachmentForRequestQ(\'392\',\''+xrayReportDocumentID+'\',\''+partyId+'\')');
					
					if(xrayReportDocumentID !=0 || analysisGoalRiskSuccessionID !=0 || analysisReportDocumentID !=0 || clientActionPlanDocumentID !=0 || summaryActionPlanDocumentID !=0 || advisorActionPlanDocumentID !=0 || quickActionPlanDocumentID !=0 || clientActionPlanDocumentIDA!=0)
					{
						$('.sendReportsTr').show();
						$('.GenerateReportLink').show();
					}
					else
					{
						$('.sendReportsTr').hide();	
						$('.GenerateReportLink').hide();
					}
					
// 					if(stage=="DCT Completed")
// 					{
// 						$('.GenerateReportLink').show();	
// 					}
// 					else
// 					{
// 						$('.GenerateReportLink').hide();	
// 					}
					
					if(executionStatusStr!='Generated' && executionStatusStr!='New' && action=='1'){
						$('#DCInputLink a').attr('href','${pageContext.request.contextPath}/autoPlanDetails.htm?partyId='+partyId+'&stage='+executionStatusStr+'&name='+name+'');
						$('#DCInputLink a').removeClass('inactive_link');
						$('#DCInputLink a').removeAttr('onclick');
					}
					else if(executionStatus>0){
						//hide data collection link here
						$('#DCInputLink a').addClass('inactive_link');
						$('#DCInputLink a').removeAttr('href');
						$('#DCInputLink a').removeAttr('onclick');
					}else{
						$('#DCInputLink a').attr('onclick','$(\'#action_dialog\').modal(\'hide\');openDcInputPopup('+partyId+','+buId+',\''+name+'\',\''+isDatacollectionChanged+'\','+fpplanType+')');
						$('#DCInputLink a').removeClass('inactive_link');
						$('#DCInputLink a').removeAttr('href');
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
					$('#action_dialog').modal('show')
			}
				function showAutoplanAction(partyId,name,action){
					$('#autoPlanReviewLink').attr('href','${pageContext.request.contextPath}/autoPlanDetails.htm?partyId='+partyId+'&stage='+action+'&name='+name+'');					
					$('#action_dialog1').modal('show')
				}

				 jQuery(function($) {
			        	/*$("#search").keyup(function(event) {
							if (event.keyCode == 13) {
								oppsearch();
							}
						});*/
						
						if('${autoPlanClient}'==1){
// 							$("#grid-table").hideCol("action");
							$("#grid-table").hideCol("stage");
							$("#grid-table").showCol("action1");
// 							$("#grid-table").hideCol("dcActivation");
// 							$("#grid-table").showCol("action");
							$("#grid-table").showCol("status");
						}
						else{
 							$("#grid-table").hideCol("action");						
						}
			        $( ".action" ).on('click', function(e) {
								e.preventDefault();
							
								$('#action_dialog').modal('show')
							});
							
							$( ".progress").on('click', function(e) {
								e.preventDefault();
							
								$('#progress_dialog').modal('show')
							});
			});
				 function xrayTool(partyId,name)
				 {
				 	window.location.href= $('#contextPath').val()+'/opportunity/xray.htm?partyId='+partyId+'&name='+name;
				 	//alert('partyId='+partyId)
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
//				          $('#jstree1').jstree();
				     try{
				 	
				 	$('#jstree2').jstree({
//				          "contextmenu": {
//				              "select_node": true,
//				              "show_at_node": false
//				              //"items": customMenu1
//				          },
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
//				  		setChildArray1(nodeId,nodeLevel,childArray);
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
//				  		var parentNodeId=obj.parentNodeId;
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
//				  			obj.state='{opened": "true","selected":"true"}';
				 			obj.type=typeName;
				 			obj.nodeId=locationId;
				 			obj.level=level;
				 			obj.children=new Array();
				 			childArray.push(obj);
				 		}
				 		//myObj.children=childArray;
//				  		setChildArray1(nodeId,nodeLevel,childArray);
				 		setTimeout(function() {
				 			setChildArray1(nodeId,nodeLevel,childArray)
				 		}, 10000);
				 	});
				 }

				 function  userClick(nodeId,partyId)
				 {
				 	closePopupMoveOpportunities();	
				 	
				 	
				 	list = new Array();
				 	
				 	var cntr=0;
				 	$('#grid-table :checked').each(function(i, obj) {
				 		if($(this).attr('id')!='selectAll' && $(this).attr('id')!='chkdeleteselect' && $(this).attr('id')!='' && $(this).attr('id')!=undefined && $(this).attr('id')!=0){
				 			list[cntr] = $(this).attr('id');
				 			cntr+=1;
				 		}
				 		
				 	});
				 	
//				 	alert(list);
				 	
				 	var message = "";
				 	message = "Do You Want To Move Client?";
				 	showAlertMessage1("Message", "<br/>" + message, "question",
				 			doNothing1);
				 	$('.ZebraDialog_Button1').attr('href','javascript:moveUser('+partyId+','+nodeId+')');
				 	$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
				 	
				 }

				 function moveUser(partyId,nodeId)
				 {
//				 	alert("move user:");

				 	$.ajax({
				 			type : 'GET',
//				 			data: 'list="+list+"&partyId="+partyId+"&nodeId="+nodeId',
				 			url :  $('#contextPath').val() +"/partner/moveClientOrOpportunity.htm?list="+list+"&partyId="+partyId+"&nodeId="+nodeId,
				 					success :function(result)
				 					{
				 			//			alert(result);
				 						 var result=result;					
				 						if(result=='1'){
				 							showAlertMessage1("Success",
				 									"<br/>Client Moved successfully.",
				 									"information",reloadPage);
				 	 					}else {
				 	 						showAlertMessage("Error","<br/> Error occured while Moving Client. ", 'error', doNothing);
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
				 	//$("#life_insurance_methods").animate("slow").css("visibility","visible");
				 	
				 }
				 
				 
</script>
        <!-- <div class="modal fade" id="action_dialog_test" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="">Actions</h4>
              </div>
              <div class="modal-body">
                <table id="" class="table table-bordered table-striped" max-width="100%" cellpadding="0" cellspacing="0">
                  <tbody>
                    <tr id="">
                      <th class="thead">Action List</th>
                      <th class="thead">Document List</th>
                      <th class="thead">Task List</th>
                    </tr>
                    <tr id="dCActivationTr">
                      <td id="dCActivationLink"><i class="fa fa-check size-18"></i> <a onclick=""><span class="">Data Collection Activation</span></a></td>
                      <td id="AnalysisReportLink" onclick=""><i class="fa fa-file-pdf-o size-18"></i> <a><span class="">Analysis - Comprehensive</span></a></td>
                      <td id="tasktd1"></td>
                    </tr>
                    <tr id="DCReminderTr">
                      <td id="DCReminderLink"><i class="fa fa-clock-o"></i> <a onclick=""><span class="">Financial Plan Reminder</span></a></td>
                      <td id="AnalysisReportLink" onclick=""><i class="fa fa-file-pdf-o"></i> <a><span class="">Analysis - Comprehensive</span></a></td>
                      <td id="tasktd1"></td>
                    </tr>
                    <tr id="PartnerActionPlanLink1">
                      <td id="DCInputLink"><i class="fa fa-database size-18"></i> <a onclick=""><span class="">Data Collection Input</span></a></td>
                      <td id="SummaryActionPlanLink" onclick="" class="hide"><i class="fa fa-file-pdf-o size-18"></i> <a><span class="">Analysis - Goals and Risk</span></a></td>
                      <td id="PartnerActionPlanLink" name="PartnerActionPlanLink1" onclick="" class="hide"><i class="fa fa-file-pdf-o size-18"></i> <a><span class="">RM Action Plan</span></a> <i class="fa fa-question" id="abc" onclick="actionPlanHelpPopUp();"></i></td>
                      <td id="tasktd2"></td>
                    </tr>
                    <tr id="ClientActionPlanLink1">
                      <td id="ViewQueryLink"><i class="fa fa-question-circle size-18"></i> <a onclick=""><span class="">View Query</span></a></td>
                      <td id="QuickActionPlanLink" onclick="" class="hide"><i class="fa fa-file-pdf-o size-18"></i> <a><span class="">Analysis - Goals</span></a></td>
                      <td id="ClientActionPlanLink" name="ClientActionPlanLink1" onclick="" class="hide"><i class="fa fa-file-pdf-o size-18"></i> <a><span class="">Client Action Plan</span></a> <i class="fa fa-question" id="abc" onclick="actionPlanHelpPopUp();"></i></td>
                      <td id="tasktd3"></td>
                    </tr>
                    <tr id="">
                      <td id="ExecutionTrackerLink"><i class="fa fa-check-square-o size-18"></i> <a onclick=""><span class="">Execution Tracker</span></a></td>
                      <td id="AnalysisGoalRiskSuccessionID" onclick=""><i class="fa fa-file-pdf-o size-18"></i> <a><span class="">Analysis - Goals, Risk & Succession</span></a></td>
                      <td id="tasktd4"></td>
                    </tr>
                    <tr id="PartnerActionPlanLink2">
                      <td id="mergeClientLink"><i class="fa fa-exchange size-18"></i> <a onclick=""><span class="">Merge Other Clients</span></a></td>
                      <td id="PartnerActionPlanLink" name="PartnerActionPlanLink2" class="hide" onclick=""><i class="fa fa-file-pdf-o size-18"></i> <a><span class="">Partner Action Plan</span></a> <i class="fa fa-question" id="abc" onclick="actionPlanHelpPopUp();"></i></td>
                      <td id="afterPartnerAP" class="hide"></td>
                      <td id="tasktd5"></td>
                    </tr>
                    <tr id="ClientActionPlanLink2">
                      <td id="SendEmailLink"><i class="fa fa-envelope size-18"></i> <a onclick=""><span class="">Send Email</span></a></td>
                      <td id="ClientActionPlanLink" name="ClientActionPlanLink2" onclick="" class="hide"><i class="fa fa-file-pdf-o size-18"></i> <a><span class="">Client Action Plan B</span></a> <i class="fa fa-question" id="abc" onclick="actionPlanHelpPopUp();"></i></td>
                      <td id="afterClientAP" class="hide"></td>
                      <td id="tasktd6"></td>
                    </tr>
                    <tr id="">
                      <td id="SendSMSLink"><i class="fa fa-mobile size-24"></i> <a onclick=""><span class="">Send SMS</span></a></td>
                      <td id="ClientActionPlanDocumentIDALink" onclick="" class="hide"><i class="fa fa-file-pdf-o size-18"></i> <a><span class="">Client Action Plan A</span></a> <i class="fa fa-question" id="abc" onclick="actionPlanHelpPopUp();"></i></td>
                      <td id="afterClientAPA" class="hide"></td>
                      <td id="tasktd7"></td>
                    </tr>
                    <tr id="">
                      <td id="clientXRayActivationLink"><i class="fa fa-play"></i> <a><span class="user">X-Ray Activation</span></a></td>
                      <td id="XRayReportLink" onclick="" class="hide"><i class="fa fa-file-pdf-o"></i>&nbsp;<a><span class="">X-Ray Report</span></a>&nbsp;<i class="fa fa-question" id="abc" onclick="actionPlanHelpPopUp();"></i></td>
                      <td id="tasktd8"></td>
                    </tr>
                    <tr id="">
                      <td id="clientXRayToolLink"><i class="fa icon-x-ray"></i> <a ><span class="user">X-RAY Tool</span></a></td>
                      <td></td>
                      <td id="tasktd9"></td>
                    </tr>
                    <tr id="sendPotentialPingTr">
                      <td id="SendPotentialPingLink"><i class="fa fa-comment size-18"></i> <a onclick=""><span class="">Send Potential Ping</span></a></td>
                      <td id="" onclick=""><a><span class="">&nbsp;</span></a></td>
                      <td id=""></td>
                    </tr>
                    <tr id="sendReportsTr">
                      <td id="SendReportsLink"><i class="fa fa-database size-18"></i>&nbsp;<a><span class="user">Send Reports</span></a></td>
                      <td id="" onclick=""><a><span class="">&nbsp;</span></a></td>
                      <td id=""></td>
                    </tr>
                    <tr id="">
                      <td id="GenerateReportLink"><i class="fa fa-database size-18"></i> <a ><span class="user">Generate Report</span></a></td>
                      <td></td>
                      <td id="tasktd10"></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>-->
        
        <div class="modal fade" id="action_dialog" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="">Actions</h4>
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
              													<td id="mergeClientLink"><i class="fa fa-exchange size-18"></i> <a onclick=""><span class="">Merge Other Clients</span></a></td>
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
              													<td id="clientSendReportsLink"><i class="fa   icon-send_report size-20"></i>&nbsp;<a><span class="user">Send Reports</span></a></td>
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
												              <td id="dCActivationLink"><i class="fa fa-check size-18"></i> <a onclick=""><span class="">Data Collection Activation</span></a></td>
												            </tr>
												            <tr class="DCReminderTr">
	              												 <td id="DCReminderLink"><i class="fa fa-clock-o"></i> <a onclick=""><span class="">Financial Plan Reminder</span></a></td>
												            </tr>
												             <tr id="PartnerActionPlanLink1">
    															<td id="DCInputLink"><i class="fa fa-database size-18"></i> <a onclick=""><span class="">Data Collection Input</span></a></td>
 															</tr>
 															<tr id="">
 																 <td id="clientXRayActivationLink"><i class="fa fa-play"></i>&nbsp;<a><span class="user">X-Ray Activation</span></a></td>
 															</tr>
 															<tr id="">
              													<td id="clientXRayToolLink"><i class="fa icon-x-ray"></i>&nbsp;<a><span class="user">X-RAY Tool</span></a></td>
              												</tr>
              												<tr class="GenerateReportLinkTr">
              													<td id="clientGenerateReportLink"><i class="fa icon-genrate_report size-20"></i>&nbsp;<a ><span class="user">Generate Report</span></a></td>
              												</tr>
											            </tbody>
										            </table>
												</div>

												<div id="report" class="tab-pane fade">
							                      	<table class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0">
								          				<tbody>
								          					<tr id="">
								          						<td id="AnalysisReportLink" onclick=""><i class="fa fa-file-pdf-o size-18"></i> <a><span class="">Analysis - Comprehensive</span></a></td>
								          					</tr>
								          					<tr id="">
								          						<td id="SummaryActionPlanLink" onclick="" class="hide"><i class="fa fa-file-pdf-o size-18"></i> <a><span class="">Analysis - Goals and Risk</span></a></td>
								          					</tr>
								          					<tr id="">
								          						 <td id="QuickActionPlanLink" onclick="" class="hide"><i class="fa fa-file-pdf-o size-18"></i> <a><span class="">Analysis - Goals</span></a></td>
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
          </div>
        </div>
        
        <div class="modal fade" id="action_dialog1" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="">&nbsp;</h4>
              </div>
              <div class="modal-body">
                <table id="" class="table table-bordered table-striped" max-width="100%" cellpadding="0" cellspacing="0">
                  <tbody>
                    <tr >
                      <td id=""><i class="fa fa-comment"></i> <a href="" id="autoPlanReviewLink"><span >Review</span></a></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <input type="hidden" id="partyIdHidden" value="0">
        <input type="hidden" id="partyIdNameHidden" value="">
        <script>
        jQuery(function($) {

			});
</script>
        <form id="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocument.htm">
          <input type="hidden" name="docId" id="documentIdToDownload">
        </form>
        <jsp:include page="../common/footer.jsp" />
<form id="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocument.htm">
  <input type="hidden" name="docId" id="documentIdToDownload">
</form>
<form id="bulkActivateForm">
  <input type="hidden" id="partyIds" name="partyIds">
  <input type="hidden" id="roleId" name="roleId" value="15">
</form>
<form method="post" id="getApDataForm" name="getApDataForm">
  <input type="hidden" id="partyIdToSend" name="partyId">
</form>
<form id="sendNotificationForm" name="sendNotificationForm" method="post">
  <input type="hidden" id="partyIdForNotification" name="partyId">
  <input type="hidden" id="nameForNotification" name="name">
  <input type="hidden" id="notifyTargetForNotification" name="notifyTarget" value="Client">
  <input type="hidden" id="notifyToForNotification" name="notifyTo">
  <input type="hidden" id="notifyType" name="notifyType">
  <input type="hidden" id="isBulk" name="isBulk">
</form>
<div class="modal fade" id="popUpMergeClient" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Merge Other Clients</h4>
      </div>
      <div class="modal-body">
        <div class="row" id="popupMergeClientHtml">
          <div class="list-group" id="changePasswordDetailsDiv" >
            <div class="nav-search pull-right southspace2" id="" style="position: static;">
              <form class="form-search">
                <span class="input-icon">
                <input type="text" placeholder="Search ..." class="nav-search-input" id="mergeclientsearch"  autocomplete="off">
                <i class="ace-icon fa fa-search nav-search-icon"></i></span>
              </form>
            </div>
            <!-- </div> -->
            <div class="clearfix"></div>
            <form id="mergeClientForm" class="clearfix">
              <div id="display_table_lead" class="jq_parent row" style="border:none;">
                <div id="toreload1" class="col-md-12 table-responsive tabular_break_word">
                  <display:table name="mergeclientDatas" uid="objPortalUser" class="table table-hover table-bordered table-striped" requestURI="#" sort="list"  id="data1">
                    <display:column   style=""  sortable="true" title=""><span id="span${data1.partyId}">
                      <input id="${data1.partyId}" name="tagCb" type="radio" >
                      </span></display:column>
                    <display:column property="firstName" class="" style="" title="First Name" sortable="true"></display:column>
                    <display:column property="lastName" class="" style="" title="Last Name" sortable="true"></display:column>
                    <display:column property="contactEmail" class="" style="" title="Email" sortable="true"></display:column>
                    <display:column property="panNo" class="" style="" title="Pan No" sortable="true"></display:column>
                  </display:table>
                </div>
              </div>
              <input type="hidden" id="basecontactPartyIdForMerge" name="basecontactPartyIdForMerge" value="">
              <div class="topmenu">
                <div class="margin_5px btn btn-primary btn-xs pull-right" title="Show All" onclick="mergeClientPopup(0,true)"><i class="fa fa-plus"></i>Show All</div>
                <div class="margin_5px btn btn-primary btn-xs pull-right" title="Merge Client"  onclick="$('#popUpMergeClient').modal('hide');mergeClients();"><i class="fa fa-plus"></i>Merge Client</div>
              </div>
              
              <!-- 		             -->
              <input type="hidden" id="mergeClientId" name="mergeClientId" value="">
              <input type="hidden" id="contactPartyId_MergeClient" name="contactPartyId_MergeClient" value="">
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
          <div class="list-group" id="changePasswordDetailsDiv1" ><!-- <a class="list-group-item active">Financial Plan Input Links</a>-->
            <form id="DcInputtForm">
              <div class="col-md-4">
                <div class="column_middle" id="dc_Input_Desktop_Version_btn">
                  <div class="theme" id="thumbdc_Input_Desktop_Version"><a href="#" class="thumb" >
                    <div style="top: 33px; left: 39px; position: absolute; "><img src="<%=request.getContextPath()%>/images/basic_user.png"  alt="" onclick="redirectDcInput()"></div>
                    </a></div>
                  <div class="title dcmenu">Financial Planner - Basic Plan</div>
                  <div class="des">Planning tool to collect the data in Quick Way</div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="column_middle" id="dc_Input_FPT_btn" >
                  <div class="theme" id="themedc_Input_FPT"><a href="#" class="thumb" >
                    <div style="top: 25px; left: 46px; position: absolute; "><img src="<%=request.getContextPath()%>/images/tab_icon.png"  alt="" onclick="redirectDcInputFpt()"></div>
                    </a></div>
                  <div class="title dcmenu">Financial Planner - Advanced Plan</div>
                  <div class="des">Planning tool to collect the data Step by Step</div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="column_right" id="dc_Input_FPT_Details_btn">
                  <div class="theme " id="thumbdc_Input_FPT_Details"><a href="#" class="thumb">
                    <div style="top: 17px; left: 50px; position: absolute; "><img src="<%=request.getContextPath()%>/images/advanced_user.png"  alt="" onclick="redirectDcInputFptDetails()"></div>
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
<div class="modal fade" id="popupMoveOpportunities" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
						aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Move Client</h4>
      </div>
      <div class="modal-body">
        <div class="" id="popupDcInputHtml">
          <div class="list-group" id="changePasswordDetailsDiv1">
            <!-- <a class="list-group-item active">Financial Plan Input Links</a>-->
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

<!--<div id="nachDialogForMove" title="Move User">Are you sure you want to Move Client?</div>-->

<!-- </div> -->
<div class="modal fade" id="progress_dialog" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="">Stages</h4>
      </div>
      <div class="modal-body">
        <table id="dcStageTable" class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0">
        </table>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="potentialping_dialog" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="">&nbsp;</h4>
      </div>
      <div class="modal-body" style="height:455px;overflow-y:auto">
        <table id="potentialPingTable" class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0">
        </table>
      </div>
    </div>
  </div>
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
        </div>
        <div class="topmenu centerAlign">
          <button class="btn-primary btn btn-xs southspace1" type="button" id="sendReportPartyIdbtn" name="Send Report" onclick="sendReport()">Send Report</button>
        </div>
        <input type="hidden" id="sendReportPartyId" name="sendReportPartyId">
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
<script type="text/javascript">
function  actionPlanHelpPopUp()
{
  //$(".ui-dialog-titlebar-close").click();
  $('#popUpActionPlanHelp').modal('show') ;
}

</script>
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
</body>
</html>
