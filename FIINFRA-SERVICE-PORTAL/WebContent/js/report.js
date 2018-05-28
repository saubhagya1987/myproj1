

currentReportName="";

var StartDate ;
var EndDate ;
var opportStatus;

function getOppbyStatus(reportName,buId,partyId) {
	StartDate = $('#from').val();
	status = $('#opportunityStatusId').val(); 
	EndDate = $('#to').val();
	var ClientpartyId = $('#quickSearchHidden').val();
	
	var PartnerId = $('#quickSearchHiddenpart').val();
	
var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId=" + buId+"&PartnerId=" + PartnerId  +"&ClientpartyId=" + ClientpartyId+"&status="+status + "&StartDate="+StartDate + "&EndDate="+EndDate+ "&loggedpartyId="+ partyId;
	
$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;margin-right: auto;margin-left: auto;margin-top:250px"/>');

$('#reportview').load(reporturl ,function(response, status, xhr) {
	//$('#downloadOptions').hide();	
  if (status == "error") {
    var msg = "Sorry but there was an error getting details ! ";
	$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
  }else{
	  $('#downloadOptions').show();			 
	  $('.div_dragger').trigger("click");
  }
});

currentReportName=reportName;	
}
function downOppbyStatus(format,buId,partyId){
	StartDate = $('#from').val();
	status = $('#opportunityStatusId').val(); 
	EndDate = $('#to').val();
	var ClientpartyId = $('#quickSearchHidden').val();
	var PartnerId = $('#quickSearchHiddenpart').val();
	
	if(currentReportName==""){
		alert("Please Select the report.");
		return;
	}
	
	
	var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId=" + buId+"&PartnerId=" + PartnerId  +"&ClientpartyId=" + ClientpartyId+"&status="+status + "&StartDate="+StartDate + "&EndDate="+EndDate + "&loggedpartyId="+ partyId;
	window.location.href = reporturl;
	
	}
	
	function getOppTrackerList(reportName,buId,partyId) {
		StartDate = $('#from').val();
		
		EndDate = $('#to').val();
		var ClientpartyId = $('#quickSearchHidden').val();
		var PartnerId = $('#quickSearchHiddenpart').val();
	
	
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+ buId  + "&PartnerId=" + PartnerId+ "&ClientpartyId=" + ClientpartyId + "&StartDate="+StartDate + "&EndDate="+EndDate + "&loggedpartyId="+ partyId;
		
	$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;margin-right: auto;margin-left: auto;margin-top:250px"/>');
	
    $('#reportview').load(reporturl ,function(response, status, xhr) {
    	//$('#downloadOptions').hide();	
      if (status == "error") {
	    var msg = "Sorry but there was an error getting details ! ";
		$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
	  }else{
		  $('#downloadOptions').show();			 
		  $('.div_dragger').trigger("click");
	  }
    });
    
    currentReportName=reportName;	
}
function downOppTrackerList(format,buId,partyId){
	StartDate = $('#from').val();
	
	EndDate = $('#to').val();
		var ClientpartyId = $('#quickSearchHidden').val();
		var PartnerId = $('#quickSearchHiddenpart').val();
		
		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId=" + buId  + "&PartnerId=" + PartnerId + "&ClientpartyId=" + ClientpartyId + "&StartDate="+StartDate + "&EndDate="+EndDate+ "&loggedpartyId="+ partyId;
		
		window.location.href = reporturl;
		
		}
	function getDCTrackerList(reportName,buId,partyId) {
		StartDate = $('#from').val();
		CurrentStage = $('#opportunityStatusId').val(); 
		EndDate = $('#to').val();
		var ClientpartyId = $('#quickSearchHidden').val();
		var PartnerId = $('#quickSearchHiddenpart').val();
		
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId=" + buId +"&PartnerId=" + PartnerId  + "&ClientpartyId=" + ClientpartyId+"&CurrentStage="+CurrentStage + "&StartDate="+StartDate + "&EndDate="+EndDate + "&loggedpartyId=" + partyId;
		
	$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;margin-right: auto;margin-left: auto;margin-top:250px"/>');
	
    $('#reportview').load(reporturl ,function(response, status, xhr) {
    	//$('#downloadOptions').hide();	
      if (status == "error") {
	    var msg = "Sorry but there was an error getting details ! ";
		$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
	  }else{
		  $('#downloadOptions').show();			 
		  $('.div_dragger').trigger("click");
	  }
    });
    
    currentReportName=reportName;	
}
	function downDCTrackerList(format,buId){
		StartDate = $('#from').val();
		CurrentStage = $('#opportunityStatusId').val(); 
		EndDate = $('#to').val();
		var ClientpartyId = $('#quickSearchHidden').val();
		var PartnerId = $('#quickSearchHiddenpart').val();

		
		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId=" + buId +"&PartnerId=" + PartnerId  + "&ClientpartyId=" + ClientpartyId+"&CurrentStage="+CurrentStage + "&StartDate="+StartDate + "&EndDate="+EndDate + "&loggedpartyId=" + partyId;
		window.location.href = reporturl;
		
		}
	function getClientSummary(reportName,buId,partyId) {
		var ClientpartyId = $('#quickSearchHidden').val();
		
		var PartnerId = $('#quickSearchHiddenpart').val();
		
		
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&PartnerId=" + PartnerId +"&ClientpartyId=" + ClientpartyId +"&buId=" + buId+ "&loggedpartyId="+ partyId;
	
	/*$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');*/
	
    $('#reportview').load(reporturl ,function(response, status, xhr) {
    	//$('#downloadOptions').hide();	
      if (status == "error") {
	    var msg = "Sorry but there was an error getting details ! ";
		$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
	  }else{
		  $('#downloadOptions').show();			 
		  $('.div_dragger').trigger("click");
	  }
    });
    
    currentReportName=reportName;	
}
	
	function downloadclientsummary(format,buId,partyId){
		
		var ClientpartyId = $('#quickSearchHidden').val();
		var PartnerId = $('#quickSearchHiddenpart').val();
	
		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&PartnerId=" + PartnerId +"&ClientpartyId=" + ClientpartyId +"&buId=" + buId + "&loggedpartyId=" + partyId;
		
		window.location.href = reporturl;
		
		}
	function getClientGoalDetailSt(reportName,buId,partyId) {
		var ClientpartyId = $('#quickSearchHidden').val();
		var PartnerId = $('#quickSearchHiddenpart').val();
	
		
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId=" + buId+ "&PartnerId=" + PartnerId +"&ClientpartyId=" + ClientpartyId + "&loggedpartyId=" + partyId;
		
	$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;margin-right: auto;margin-left: auto;margin-top:250px"/>');
	
    $('#reportview').load(reporturl ,function(response, status, xhr) {
    	//$('#downloadOptions').hide();	
      if (status == "error") {
	    var msg = "Sorry but there was an error getting details ! ";
		$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
	  }else{
		  $('#downloadOptions').show();			 
		  $('.div_dragger').trigger("click");
	  }
    });
    
    currentReportName=reportName;	
}
function downgetClientGoalDetailSt(format,buId,partyId){
		
	var ClientpartyId = $('#quickSearchHidden').val();
	var PartnerId = $('#quickSearchHiddenpart').val();
	
		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format + "&buId=" + buId+ "&PartnerId=" + PartnerId +"&ClientpartyId=" + ClientpartyId + "&loggedpartyId=" + partyId;
		window.location.href = reporturl;
		
		}

	function getADWiseClientHold(reportName,buId) {
		
		AsOnDate = $('#datepicker').val();
		var ClientpartyId = $('#quickSearchHidden').val();
		
		var PartnerId = $('#quickSearchHiddenpart').val();
	
	
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId=" + buId+"&PartnerId=" + PartnerId + "&ClientpartyId=" + ClientpartyId + "&AsOnDate="+AsOnDate ;

	$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;margin-right: auto;margin-left: auto;margin-top:250px"/>');
	
    $('#reportview').load(reporturl ,function(response, status, xhr) {
    	//$('#downloadOptions').hide();	
      if (status == "error") {
	    var msg = "Sorry but there was an error getting details ! ";
		$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
	  }else{
		  $('#downloadOptions').show();			 
		  $('.div_dragger').trigger("click");
	  }
    });
    
    currentReportName=reportName;	
}
	
	

	function downADWiseClientHold(format,buId){
		

		AsOnDate = $('#datepicker').val();
		var ClientpartyId = $('#quickSearchHidden').val();
		
		var PartnerId = $('#quickSearchHiddenpart').val();
	

			
			if(currentReportName==""){
				alert("Please Select the report.");
				return;
			}
			
			
			var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId=" + buId+"&PartnerId=" + PartnerId + "&ClientpartyId=" + ClientpartyId + "&AsOnDate="+AsOnDate ;
			
			
			window.location.href = reporturl;
			
			}
	

function getADWClientSIPRe(reportName,buId) {
	
	day = $('#days').val();
	var ClientpartyId = $('#quickSearchHidden').val();
	var PartnerId = $('#quickSearchHiddenpart').val();
	


var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+ buId +"&PartnerId="+ PartnerId +"&ClientpartyId=" + ClientpartyId + "&day="+day  ;
	
$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;margin-right: auto;margin-left: auto;margin-top:250px"/>');

$('#reportview').load(reporturl ,function(response, status, xhr) {
	//$('#downloadOptions').hide();	
  if (status == "error") {
    var msg = "Sorry but there was an error getting details ! ";
	$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
  }else{
	  $('#downloadOptions').show();			 
	  $('.div_dragger').trigger("click");
  }
});

currentReportName=reportName;	
}



	function downADWClientSIPRe(format,buId){
		day = $('#days').val();
		var ClientpartyId = $('#quickSearchHidden').val();
		var PartnerId = $('#quickSearchHiddenpart').val();



		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId=" + buId +"&PartnerId="+ PartnerId + "&ClientpartyId=" + ClientpartyId + "&day="+day   ;
		
		
		window.location.href = reporturl;
		
		}
	

		function getClientFolioMissNom(reportName,buId) {
			
			var ClientpartyId = $('#quickSearchHidden').val();
			var PartnerId = $('#quickSearchHiddenpart').val();
			
			
			
		
		var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId=" + buId + "&PartnerId=" + PartnerId +"&ClientpartyId=" + ClientpartyId  ;
			
		$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
		
	    $('#reportview').load(reporturl ,function(response, status, xhr) {
	    	//$('#downloadOptions').hide();	
	      if (status == "error") {
		    var msg = "Sorry but there was an error getting details ! ";
			$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
		  }else{
			  $('#downloadOptions').show();			 
			  $('.div_dragger').trigger("click");
		  }
	    });
	    
	    currentReportName=reportName;	
	}
	function downClientFolioMissNom(format,buId){
			
			var ClientpartyId = $('#quickSearchHidden').val();
			var PartnerId = $('#quickSearchHiddenpart').val();
			
			if(currentReportName==""){
				alert("Please Select the report.");
				return;
			}
			
			
			var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId="+ buId+ "&PartnerId=" + PartnerId + "&ClientpartyId=" + ClientpartyId ;
			
			window.location.href = reporturl;
			
			}
	
function getPartOpenQueryList(reportName,buId,partyId) {
		
		StartDate = $('#from').val();
		EndDate = $('#to').val();
		var QueryCategory = $('#querytypeId').val(); 
		
	    var QueryContactParty = $('#queryconId').val(); 
		var PartnerId = $('#quickSearchHiddenpart').val();
		
		
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+ buId+"&StartDate=" +StartDate + "&EndDate=" +EndDate + "&QueryCategory="+QueryCategory + "&QueryOwnerParty="+PartnerId+ "&QueryContactParty="+QueryContactParty  + "&loggedpartyId=" + partyId;

/*	$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;margin-right: auto;margin-left: auto;margin-top:250px"/>');*/
	
    $('#reportview').load(reporturl ,function(response, status, xhr) {
    	//$('#downloadOptions').hide();	
      if (status == "error") {
	    var msg = "Sorry but there was an error getting details ! ";
		$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
	  }else{
		  $('#downloadOptions').show();			 
		  $('.div_dragger').trigger("click");
	  }
    });
    
    currentReportName=reportName;	
}
function downPartOpenQueryList(format,buId,partyId) {
	
	
	StartDate = $('#from').val();
	EndDate = $('#to').val();
	var QueryCategory = $('#querytypeId').val(); 
	
    var QueryContactParty = $('#queryconId').val(); 
    var PartnerId = $('#quickSearchHiddenpart').val();



	if(currentReportName==""){
		alert("Please Select the report.");
		return;
	}
	var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId="+ buId+"&StartDate=" +StartDate + "&EndDate=" +EndDate + "&QueryCategory="+QueryCategory + "&QueryOwnerParty="+PartnerId+ "&QueryContactParty="+QueryContactParty + "&loggedpartyId=" + partyId;


	window.location.href = reporturl;
}
	
function getPartOpenTaskList(reportName,buId,partyId) {
	StartDate = $('#from').val();
	EndDate = $('#to').val();
	var TaskCategory = $('#tasktypeId').val(); 

	var TaskContactPartyID = $('#taskconId').val(); 
	 var PartnerId = $('#quickSearchHiddenpart').val();


var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+ buId+"&StartDate=" +StartDate + "&EndDate=" +EndDate + "&TaskCategory="+TaskCategory + "&TaskOwnerPartyID="+PartnerId+ "&TaskContactPartyID="+TaskContactPartyID + "&loggedpartyId=" + partyId;

/*$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;margin-right: auto;margin-left: auto;margin-top:250px"/>');*/

$('#reportview').load(reporturl ,function(response, status, xhr) {
	//$('#downloadOptions').hide();	
  if (status == "error") {
    var msg = "Sorry but there was an error getting details ! ";
	$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
  }else{
	  $('#downloadOptions').show();			 
	  $('.div_dragger').trigger("click");
  }
});

currentReportName=reportName;	
}

function downPartOpenTaskList(format,buId,partyId) {


StartDate = $('#from').val();
EndDate = $('#to').val();
var TaskCategory = $('#tasktypeId').val(); 

var TaskContactPartyID = $('#taskconId').val(); 
var PartnerId = $('#quickSearchHiddenpart').val();


if(currentReportName==""){
	alert("Please Select the report.");
	return;
}
var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId="+ buId+"&StartDate=" +StartDate + "&EndDate=" +EndDate + "&TaskCategory="+TaskCategory + "&TaskOwnerPartyID="+PartnerId+ "&TaskContactPartyID="+TaskContactPartyID + "&loggedpartyId=" + partyId;

window.location.href = reporturl;
}


function getPingDelivery(reportName,buId,partyId) {
	StartDate = $('#from').val();

	EndDate = $('#to').val();
	var ClientpartyId = $('#quickSearchHidden').val();
	var PartnerId = $('#quickSearchHiddenpart').val(); 
	
var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+buId + "&PartnerId=" + PartnerId +"&ClientpartyId=" + ClientpartyId +"&StartDate="+StartDate + "&EndDate="+EndDate +"&loggedpartyId="+ partyId;
	
$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;margin-right: auto;margin-left: auto;margin-top:250px"/>');

$('#reportview').load(reporturl ,function(response, status, xhr) {
	//$('#downloadOptions').hide();	
  if (status == "error") {
    var msg = "Sorry but there was an error getting details ! ";
	$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
  }else{
	  $('#downloadOptions').show();			 
	  $('.div_dragger').trigger("click");
  }
});

currentReportName=reportName;	
}
function downPingDelivery(format,buId,partyId){
	StartDate = $('#from').val();

	EndDate = $('#to').val();
	var ClientpartyId = $('#quickSearchHidden').val();
	var PartnerId = $('#quickSearchHiddenpart').val(); 
	
	if(currentReportName==""){
		alert("Please Select the report.");
		return;
	}
	
	
	var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId="+buId + "&PartnerId=" + PartnerId +"&ClientpartyId=" + ClientpartyId +"&StartDate="+StartDate + "&EndDate="+EndDate +"&loggedpartyId="+ partyId;
	window.location.href = reporturl;
	
	}


function getAdWClientPoFolioSumm(reportName,buId) {
	
	var PartnerId = $('#quickSearchHiddenpart').val();
	as_at_date = $('#datepicker').val();
	var ClientpartyId = $('#quickSearchHidden').val();



var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+buId +"&PartnerId="+ PartnerId + "&ClientpartyId=" + ClientpartyId  + "&as_at_date="+ as_at_date ;


$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');

$('#reportview').load(reporturl ,function(response, status, xhr) {
	//$('#downloadOptions').hide();	
  if (status == "error") {
    var msg = "Sorry but there was an error getting details ! ";
	$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
  }else{
	  $('#downloadOptions').show();			 
	  $('.div_dragger').trigger("click");
  }
});

currentReportName=reportName;	
}


	function downAdWClientPoFolioSumm(format,buId){
		
		var PartnerId = $('#quickSearchHiddenpart').val();
		as_at_date = $('#datepicker').val();
		var ClientpartyId = $('#quickSearchHidden').val();
		



		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId="+buId +"&PartnerId="+ PartnerId + "&ClientpartyId=" + ClientpartyId +"&as_at_date="+ as_at_date  ;
		
		
		window.location.href = reporturl;
		
		}
	
	function getClientMIS(reportName) {
		buId = $('#bupartyname').val();
		var ContactType = $('#opportunityStatusId').val();	
		StartDate = $('#from').val();
		EndDate = $('#to').val();
		
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+buId  +"&StartDate="+StartDate + "&EndDate="+EndDate + "&ContactType="+ContactType;
		
	$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
	
    $('#reportview').load(reporturl ,function(response, status, xhr) {
    	//$('#downloadOptions').hide();	
      if (status == "error") {
	    var msg = "Sorry but there was an error getting details ! ";
		$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
	  }else{
		  $('#downloadOptions').show();			 
		  $('.div_dragger').trigger("click");
	  }
    });
    
    currentReportName=reportName;	
}
	function downClientMIS(format){
		
		buId = $('#bupartyname').val();
		var ContactType = $('#opportunityStatusId').val();	
		StartDate = $('#from').val();
		EndDate = $('#to').val();
		
		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId="+buId +"&StartDate="+StartDate + "&EndDate="+EndDate + "&ContactType="+ContactType;
		window.location.href = reporturl;
		
		}

	function getAuditHistory(reportName,buId) {
		
		StartDate = $('#from').val();
		EndDate = $('#to').val();
		
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+buId + "&StartDate=" + StartDate + "&EndDate=" + EndDate;
		
/*	$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');*/
	
    $('#reportview').load(reporturl ,function(response, status, xhr) {
    	//$('#downloadOptions').hide();	
      if (status == "error") {
	    var msg = "Sorry but there was an error getting details ! ";
		$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
	  }else{
		  $('#downloadOptions').show();			 
		  $('.div_dragger').trigger("click");
	  }
    });
    
    currentReportName=reportName;	
}
	function downAuditHistory(format,buId){
		StartDate = $('#from').val();
		EndDate = $('#to').val();

		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId="+buId + "&StartDate=" + StartDate + "&EndDate=" + EndDate;
		window.location.href = reporturl;
		
		}

	function getGoalTyDuMISRe(reportName) {
		
		
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+buId;
		
	$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;margin-right: auto;margin-left: auto;margin-top:250px"/>');
	
    $('#reportview').load(reporturl ,function(response, status, xhr) {
    	//$('#downloadOptions').hide();	
      if (status == "error") {
	    var msg = "Sorry but there was an error getting details ! ";
		$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
	  }else{
		  $('#downloadOptions').show();			 
		  $('.div_dragger').trigger("click");
	  }
    });
    
    currentReportName=reportName;	
}
	function downGoalTyDuMISRe(format){
		
		
		
		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId="+buId ;
		window.location.href = reporturl;
		
		}

	function getBizUnitGoalMIS(reportName,buId,partyId) {
		/*GoalType = $('#hdnFrom').val();*/
		GoalYear = $('#goalyearId').val();
		GoalType = $('#opportunityStatusId').val();
	

		
		var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+buId + "&GoalType="+ GoalType+ "&GoalYear=" +GoalYear + "&loggedpartyId="+ partyId;
			
		$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;margin-right: auto;margin-left: auto;margin-top:250px"/>');
		
	    $('#reportview').load(reporturl ,function(response, status, xhr) {
	    	//$('#downloadOptions').hide();	
	      if (status == "error") {
		    var msg = "Sorry but there was an error getting details ! ";
			$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
		  }else{
			  $('#downloadOptions').show();			 
			  $('.div_dragger').trigger("click");
		  }
	    });
	    
	    currentReportName=reportName;	
	}
		function downBizUnitGoalMIS(format,buId,partyId){
			
			GoalType = $('#opportunityStatusId').val();
			GoalYear = $('#goalyearId').val();
			
			if(currentReportName==""){
				alert("Please Select the report.");
				return;
			}
			
			
			var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId="+buId + "&GoalType="+ GoalType+ "&GoalYear=" +GoalYear+ "&loggedpartyId="+ partyId;
			window.location.href = reporturl;
			
			}	
		
		
		function getLoginExcpReport(reportName,buId,partyId) {
			
			StartDate = $('#datepicker').val();
			EndDate = $('#datepicker1').val();
			
		var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+buId +  "&StartDate=" + StartDate + "&EndDate=" + EndDate + "&loggedpartyId="+partyId;
		
		//$("#reportview").html("Loading...");
		$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;margin-right: auto;margin-left: auto;margin-top:250px"/>');
			
		    $('#reportview').load(reporturl ,function(response, status, xhr) {
		    	//$('#downloadOptions').hide();	
		      if (status == "error") {
			    var msg = "Sorry but there was an error getting details ! ";
				$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
			  }else{
				  $('#downloadOptions').show();			 
				  $('.div_dragger').trigger("click");
			  }
		    });
		    
		    currentReportName=reportName;	
		}
		function downLoginExcpReport(format,buId,partyId){
			
			StartDate = $('#datepicker').val();
			EndDate = $('#datepicker1').val();

			if(currentReportName==""){
				alert("Please Select the report.");
				return;
			}
			
			
			var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId="+buId + "&StartDate=" + StartDate + "&EndDate=" + EndDate+ "&loggedpartyId="+partyId;
			window.location.href = reporturl;
			
			}
		
		function getADwiseTxnHistory(reportName,buId) {
		 PartnerId = $('#quickSearchHiddenpart').val();
			 ClientpartyId = $('#quickSearchHidden').val();
			 TxnTypeId = $('#txntypeId').val();
			 IssuerId = $('#issurerId').val();
			StartDate = $('#from').val();
			EndDate = $('#to').val();
		
		var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+buId + "&PartnerId=" + PartnerId +"&ClientpartyId="+ ClientpartyId+ "&StartDate=" + StartDate + "&EndDate=" + EndDate + "&TxnTypeId="+ TxnTypeId +"&IssuerId="+ IssuerId ;
			
		$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;margin-right: auto;margin-left: auto;margin-top:250px"/>');
		
	    $('#reportview').load(reporturl ,function(response, status, xhr) {
	    	//$('#downloadOptions').hide();	
	      if (status == "error") {
		    var msg = "Sorry but there was an error getting details ! ";
			$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
		  }else{
			  $('#downloadOptions').show();			 
			  $('.div_dragger').trigger("click");
		  }
	    });
	    
	    currentReportName=reportName;	
	}
		function downADwiseTxnHistory(format,buId){
			 PartnerId = $('#quickSearchHiddenpart').val();
			 ClientpartyId = $('#quickSearchHidden').val();
			 TxnTypeId = $('#txntypeId').val();
			 IssuerId = $('#issurerId').val();
			StartDate = $('#from').val();
			EndDate = $('#to').val();
			
			if(currentReportName==""){
				alert("Please Select the report.");
				return;
			}
			
			
			var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId=" +buId + "&PartnerId=" + PartnerId +"&ClientpartyId="+ ClientpartyId + "&StartDate=" + StartDate + "&EndDate=" + EndDate + "&TxnTypeId="+ TxnTypeId +"&IssuerId="+ IssuerId ;
			window.location.href = reporturl;
			
			}

		function getPartnerLoginTracker(reportName,partyId) {
			 buId = $('#bupartyname').val();
			 
			 var StartDate =$('#from').val();
			 var EndDate =$('#to').val();

			 var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+buId+ "&StartDate="+StartDate+"&EndDate="+EndDate+ "&loggedpartyId="+ partyId;
			 
	$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
			
		    $('#reportview').load(reporturl ,function(response, status, xhr) {
		    	//$('#downloadOptions').hide();	
		      if (status == "error") {
			    var msg = "Sorry but there was an error getting details ! ";
				$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
			  }else{
				  $('#downloadOptions').show();			 
				  $('.div_dragger').trigger("click");
			  }
		    });
		    
		    currentReportName=reportName;	
		}
			function downPartnerLoginTracker(format,partyId){
				 buId = $('#bupartyname').val();
				 var StartDate =$('#from').val();
				 var EndDate =$('#to').val();

				
				if(currentReportName==""){
					alert("Please Select the report.");
					return;
				}
				
				
				var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId=" +buId + "&StartDate=" + StartDate + "&EndDate=" + EndDate + "&loggedpartyId="+ partyId;
				window.location.href = reporturl;
				
				}

			function getClientGoalProReport(reportName,partyId) {
				
				var ClientpartyId = $('#quickSearchHidden').val();
				var PartnerId = $('#quickSearchHiddenpart').val();
				 buId = $('#bupartyname').val();
				
		
			
			var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+ buId + "&PartnerId=" + PartnerId +"&ClientpartyId=" + ClientpartyId + "&loggedpartyId="+ partyId;
	
			
			$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
			
		    $('#reportview').load(reporturl ,function(response, status, xhr) {
		    	//$('#downloadOptions').hide();	
		      if (status == "error") {
			    var msg = "Sorry but there was an error getting details ! ";
				$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
			  }else{
				  $('#downloadOptions').show();			 
				  $('.div_dragger').trigger("click");
			  }
		    });
		    
		    currentReportName=reportName;	
		}
		function downClientGoalProReport(format,partyId){
				
				var ClientpartyId = $('#quickSearchHidden').val();
				var PartnerId = $('#quickSearchHiddenpart').val();
				 buId = $('#bupartyname').val();
				if(currentReportName==""){
					alert("Please Select the report.");
					return;
				}
				
				
				var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId="+ buId+ "&PartnerId=" + PartnerId + "&ClientpartyId=" + ClientpartyId + "&loggedpartyId="+ partyId;
				
				window.location.href = reporturl;
				
				}
		
		
		function getUserList(reportName,buId) {
			
			StartDate = $('#from').val();
			EndDate = $('#to').val();
			roleId = $('#addroleId').val();
			
		var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+buId + "&StartDate=" + StartDate + "&EndDate=" + EndDate + "&roleId=" + roleId;
			
		$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;margin-right: auto;margin-left: auto;margin-top:250px"/>');
		
	    $('#reportview').load(reporturl ,function(response, status, xhr) {
	    	//$('#downloadOptions').hide();	
	      if (status == "error") {
		    var msg = "Sorry but there was an error getting details ! ";
			$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
		  }else{
			  $('#downloadOptions').show();			 
			  $('.div_dragger').trigger("click");
		  }
	    });
	    
	    currentReportName=reportName;	
	}
		function downUserList(format,buId){
			StartDate = $('#from').val();
			EndDate = $('#to').val();
			roleId = $('#addroleId').val();
			if(currentReportName==""){
				alert("Please Select the report.");
				return;
			}
			
			
			var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId="+buId + "&StartDate=" + StartDate + "&EndDate=" + EndDate+ "&roleId=" + roleId;
			window.location.href = reporturl;
			
			}
		
		function getAnalysisReportGenTracker(reportName,partyId) {
			
		
			 buId = $('#bupartyname').val();
			 StartDate = $('#from').val();
			 EndDate = $('#to').val();
			
		
		var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+ buId+ "&StartDate=" + StartDate + "&EndDate=" + EndDate+ "&loggedpartyId="+ partyId;
			
		$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
		
	    $('#reportview').load(reporturl ,function(response, status, xhr) {
	    	//$('#downloadOptions').hide();	
	      if (status == "error") {
		    var msg = "Sorry but there was an error getting details ! ";
			$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
		  }else{
			  $('#downloadOptions').show();			 
			  $('.div_dragger').trigger("click");
		  }
	    });
	    
	    currentReportName=reportName;	
	}
	function downAnalysisReportGenTracker(format,partyId){
			StartDate = $('#from').val();
			EndDate = $('#to').val();
			buId = $('#bupartyname').val();
			
			
			if(currentReportName==""){
				alert("Please Select the report.");
				return;
			}
			
			
			var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId="+ buId + "&StartDate=" + StartDate + "&EndDate=" + EndDate+ "&loggedpartyId="+ partyId;
			
			window.location.href = reporturl;
			
			}
	
	
	function getPartnerMIS(reportName,partyId) {
		
		
		 buId = $('#bupartyname').val();
		 StartDate = $('#from').val();
		 EndDate = $('#to').val();
		
	
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+ buId+ "&StartDate=" + StartDate + "&EndDate=" + EndDate+ "&loggedpartyId="+ partyId;

	$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
	
    $('#reportview').load(reporturl ,function(response, status, xhr) {
    	//$('#downloadOptions').hide();	
      if (status == "error") {
	    var msg = "Sorry but there was an error getting details ! ";
		$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
	  }else{
		  $('#downloadOptions').show();			 
		  $('.div_dragger').trigger("click");
	  }
    });
    
    currentReportName=reportName;	
}
	
	
	
	
function downPartnerMIS(format,partyId){
		StartDate = $('#from').val();
		EndDate = $('#to').val();
		buId = $('#bupartyname').val();
		
		
		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId="+ buId + "&StartDate=" + StartDate + "&EndDate=" + EndDate+ "&loggedpartyId="+ partyId;
		
		window.location.href = reporturl;
		
		}

function getfileUpload(reportName) {
	var PartnerId = $('#quickSearchHiddenpart').val();
	 buId = $('#bupartyname').val();	
	 StartDate = $('#datepicker').val();
		EndDate = $('#datepicker1').val();
		BatchId = $('#batchid').val();
	
var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&StartDate="+StartDate+"&EndDate="+EndDate+"&buId="+buId+"&PartnerId="+PartnerId+"&BatchId="+$.trim(BatchId);

$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');

$('#reportview').load(reporturl ,function(response, status, xhr) {
	//$('#downloadOptions').hide();	
  if (status == "error") {
    var msg = "Sorry but there was an error getting details ! ";
	$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
  }else{
	  $('#downloadOptions').show();			 
	  $('.div_dragger').trigger("click");
  }
});

currentReportName=reportName;	
}
function downfileUpload(format){
	
	var PartnerId = $('#quickSearchHiddenpart').val();
	 buId = $('#bupartyname').val();	
	 StartDate = $('#datepicker').val();
		EndDate = $('#datepicker1').val();
		BatchId = $('#batchid').val(); 
	if(currentReportName==""){
		alert("Please Select the report.");
		return;
	}
	
	
	var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&StartDate="+StartDate+"&EndDate="+EndDate+"&buId="+buId+"&PartnerId="+PartnerId+"&BatchId="+$.trim(BatchId);
	
	window.location.href = reporturl;
	
	}

function getPrePrintedFormMIS(reportName,partyId) {
	
	PartnerId = $('#quickSearchHiddenpart').val();
	StartDate = $('#from').val();
	EndDate = $('#to').val();

	
var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&PartnerId="+PartnerId+"&StartDate="+StartDate+"&EndDate="+EndDate+"&loggedpartyId="+partyId;

$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;margin-right: auto;margin-left: auto;margin-top:250px"/>');

$('#reportview').load(reporturl ,function(response, status, xhr) {
	//$('#downloadOptions').hide();	
  if (status == "error") {
    var msg = "Sorry but there was an error getting details ! ";
	$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
  }else{
	  $('#downloadOptions').show();			 
	  $('.div_dragger').trigger("click");
  }
});

currentReportName=reportName;	
}
function downPrePrintedFormMIS(format,partyId){
	
	PartnerId = $('#quickSearchHiddenpart').val();
	StartDate = $('#from').val();
	EndDate = $('#to').val();

	if(currentReportName==""){
		alert("Please Select the report.");
		return;
	}
	
	
	var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&PartnerId="+PartnerId+"&StartDate="+StartDate+"&EndDate="+EndDate+"&loggedpartyId="+partyId;
	
	window.location.href = reporturl;
	
	}

function getServiceTeamPartActDetails(reportName) {
	
	buID = $('#bupartyname').val();
	 
	 var StartDate =$('#from').val();
	 var EndDate =$('#to').val();

	
var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buID="+buID+"&StartDate="+StartDate+"&EndDate="+EndDate;

$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');

$('#reportview').load(reporturl ,function(response, status, xhr) {
	//$('#downloadOptions').hide();	
  if (status == "error") {
    var msg = "Sorry but there was an error getting details ! ";
	$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
  }else{
	  $('#downloadOptions').show();			 
	  $('.div_dragger').trigger("click");
  }
});

currentReportName=reportName;	
}
function downServiceTeamPartActDetails(format){
	
	 buId = $('#bupartyname').val();
	 
	 var StartDate =$('#from').val();
	 var EndDate =$('#to').val();

	if(currentReportName==""){
		alert("Please Select the report.");
		return;
	}
	
	
	var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buID="+buID+"&StartDate="+StartDate+"&EndDate="+EndDate;
	
	window.location.href = reporturl;
	
	}


/*Subscription Report*/


function getPaymentReceipt(reportName,paymentId,partyId,contextPath) {
	
	var reporturl =contextPath+"/subx/report?ReportName="+reportName+"&ReportFormat=html&paymentId="+ paymentId+ "&partyId=" + partyId ;
	alert(reporturl);
	$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
	
   $('#reportview').load(reporturl ,function(response, status, xhr) {
   	//$('#downloadOptions').hide();	
     if (status == "error") {
	    var msg = "Sorry but there was an error getting details ! ";
		$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
	  }else{
		  $('#downloadOptions').show();			 
		  $('.div_dragger').trigger("click");
	  }
   });
   
   currentReportName=reportName;	
}	
function getSubscriptionMIS(reportName,buId,contextPath,userID) {
	
	var startDate=$("#startDate").val();
	var endDate=$("#endDate").val();
		
	var reporturl =contextPath+"/subx/report?ReportName="+reportName+"&ReportFormat=html&buId="+buId+"&userId="+userID+"&StartDate="+startDate+"&EndDate="+endDate;
	
	$("#reportview").html("Loading...");
		
        $('#reportview').load(reporturl ,function(response, status, xhr) {
        	
          if (status == "error") {
		    var msg = "Sorry but there was an error getting details ! ";
			$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
		  }else{
			  $('#downloadOptions').show();			 
			  $('.div_dragger').trigger("click");
		  }
	    });
        
        currentReportName=reportName;	
	}
	
	
	function getTransactionDetails(reportName,buId,contextPath,userId) {
		
		var partnerId=$("#partnerId").val();
		var orderStatusID=$("#orderStatusID").val();
		var startDate=$("#startDate").val();
		var endDate=$("#endDate").val();
		
		var reporturl =contextPath+"/subx/report.htm?ReportName="+reportName+"&ReportFormat=html&buId="+buId+"&userId="+userId+"&PartnerId="+partnerId+"&OrderStatus="+orderStatusID+"&StartDate="+startDate+"&EndDate="+endDate;
	
	$("#reportview").html("Loading...");
		
        $('#reportview').load(reporturl ,function(response, status, xhr) {
        	
          if (status == "error") {
		    var msg = "Sorry but there was an error getting details ! ";
			$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
		  }else{
			  $('#downloadOptions').show();			 
			  $('.div_dragger').trigger("click");
		  }
	    });
        
        currentReportName=reportName;	
	}
	
	
	function getPaymentMIS(reportName,buId,contextPath,userID) {
		
		var startDate=$("#startDate").val();
		var endDate=$("#endDate").val();
		
		var reporturl =contextPath+"/subx/report.htm?ReportName="+reportName+"&ReportFormat=html&buId="+buId+"&userId="+userID+"&StartDate="+startDate+"&EndDate="+endDate;
	
	$("#reportview").html("Loading...");
		
        $('#reportview').load(reporturl ,function(response, status, xhr) {
        	
          if (status == "error") {
		    var msg = "Sorry but there was an error getting details ! ";
			$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
		  }else{
			  $('#downloadOptions').show();			 
			  $('.div_dragger').trigger("click");
		  }
	    });
        
        currentReportName=reportName;	
	}
	
	function getPartnersInTrialPeriod(reportName,buId,contextPath,userId) {
		
	
	var reporturl =contextPath+"/subx/report.htm?ReportName="+reportName+"&ReportFormat=html&buId="+buId+"&userId="+userId;

	$("#reportview").html("Loading...");
		
        $('#reportview').load(reporturl ,function(response, status, xhr) {
        	
          if (status == "error") {
		    var msg = "Sorry but there was an error getting details ! ";
			$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
		  }else{
			  $('#downloadOptions').show();			 
			  $('.div_dragger').trigger("click");
		  }
	    });
        
        currentReportName=reportName;	
	}
	
	function getPartnersPaymentDue(reportName,buId,contextPath,userId) {
		
		
		var reporturl =contextPath+"/subx/report.htm?ReportName="+reportName+"&ReportFormat=html&buId="+buId+"&userId="+userId;
	
	$("#reportview").html("Loading...");
		
        $('#reportview').load(reporturl ,function(response, status, xhr) {
        	
          if (status == "error") {
		    var msg = "Sorry but there was an error getting details ! ";
			$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
		  }else{
			  $('#downloadOptions').show();			 
			  $('.div_dragger').trigger("click");
		  }
	    });
        
        currentReportName=reportName;	
	}
	
function downloadPartnersInTrialPeriod(format,buId,userId){
	
		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="report.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId=" + buId+"&userId="+userId;
		
		window.location.href = reporturl;
		
		}

function downloadPartnersPaymentDue(format,buId,userId){
	
	if(currentReportName==""){
		alert("Please Select the report.");
		return;
	}
	
	
	var reporturl ="report.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId="+buId+"&userId="+userId;
	
	window.location.href = reporturl;
	
	}

function downloadPaymentMIS(format,buId,userID){

	var startDate=$("#startDate").val();
	var endDate=$("#endDate").val();
	if(currentReportName==""){
		alert("Please Select the report.");
		return;
	}
	
	
	var reporturl ="report.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId=" + buId+"&userId="+userID+"&StartDate="+startDate+"&EndDate="+endDate;
	
	window.location.href = reporturl;
	
	}

function downloadSubscriptionMIS(format,buId,userID){
	var startDate=$("#startDate").val();
	var endDate=$("#endDate").val();
	if(currentReportName==""){
		alert("Please Select the report.");
		return;
	}
	
	
	var reporturl ="report.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId=" + buId+"&userId="+userID+"&StartDate="+startDate+"&EndDate="+endDate;
	
	window.location.href = reporturl;
	
	}
function downloadTransactionDetails(format,buId,userId){
	
	if(currentReportName==""){
		alert("Please Select the report.");
		return;
	}
	

	var partnerId=$("#partnerId").val();
	var orderStatusID=$("#orderStatusID").val();
	var startDate=$("#startDate").val();
	var endDate=$("#endDate").val();
	var reporturl ="report.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId=" + buId+"&userId"+userId+"&partnerId="+partnerId+"&orderStatus="+orderStatusID+"&starDate="+startDate+"&endDate="+endDate;
	
	/*var reporturl ="report.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId=" + buId+"&partyId="+partyId;*/
	
	window.location.href = reporturl;
	
	}

/*Subscription Reports End*/


/*Partmer MIS Report*/


function getPartnerActivityMIS(reportName,buId,partyId) {
	StartDate = $('#datepicker').val();
	EndDate = $('#datepicker1').val();
	var PartnerId = $('#quickSearchHiddenpart').val();
	
var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&PartnerId=" + PartnerId + "&buId=" + buId+ "&StartDate="+StartDate + "&EndDate="+EndDate+ "&loggedpartyId="+ partyId;
	
$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;margin-right: auto;margin-left: auto;margin-top:250px"/>');

$('#reportview').load(reporturl ,function(response, status, xhr) {
	//$('#downloadOptions').hide();	
  if (status == "error") {
    var msg = "Sorry but there was an error getting details ! ";
	$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
  }else{
	  $('#downloadOptions').show();			 
	  $('.div_dragger').trigger("click");
  }
});

currentReportName=reportName;	
}

function downPartnerActivityMIS(format,buId,partyId){
	StartDate = $('#datepicker').val();
	EndDate = $('#datepicker1').val();
	var PartnerId = $('#quickSearchHiddenpart').val();
	
	if(currentReportName==""){
		alert("Please Select the report.");
		return;
	}
	var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&PartnerId=" + PartnerId + "&buId=" + buId+ "&StartDate="+StartDate + "&EndDate="+EndDate+ "&loggedpartyId="+ partyId;
	window.location.href = reporturl;
	
	}




function getPartnerActivityMIS(reportName,buId,partyId) {
	StartDate = $('#datepicker').val();
	EndDate = $('#datepicker1').val();
	var PartnerId = $('#quickSearchHiddenpart').val();
	
var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&PartnerId=" + PartnerId + "&buId=" + buId+ "&StartDate="+StartDate + "&EndDate="+EndDate+ "&loggedpartyId="+ partyId;
	
$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;margin-right: auto;margin-left: auto;margin-top:250px"/>');

$('#reportview').load(reporturl ,function(response, status, xhr) {
	//$('#downloadOptions').hide();	
  if (status == "error") {
    var msg = "Sorry but there was an error getting details ! ";
	$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
  }else{
	  $('#downloadOptions').show();			 
	  $('.div_dragger').trigger("click");
  }
});

currentReportName=reportName;	
}

function downPartnerActivityMIS(format,buId,partyId){
	StartDate = $('#datepicker').val();
	EndDate = $('#datepicker1').val();
	var PartnerId = $('#quickSearchHiddenpart').val();
	
	if(currentReportName==""){
		alert("Please Select the report.");
		return;
	}
	var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&PartnerId=" + PartnerId + "&buId=" + buId+ "&StartDate="+StartDate + "&EndDate="+EndDate+ "&loggedpartyId="+ partyId;
	window.location.href = reporturl;
	
	}










function getPartnerSystemAccessMIS(reportName,buId,partyId) {
	usertype = $('#recordtypeId').val();
	
var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&usertype=" + usertype + "&buId=" + buId+  "&loggedpartyId="+ partyId;
	
$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;margin-right: auto;margin-left: auto;margin-top:250px"/>');

$('#reportview').load(reporturl ,function(response, status, xhr) {
	//$('#downloadOptions').hide();	
  if (status == "error") {
    var msg = "Sorry but there was an error getting details ! ";
	$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
  }else{
	  $('#downloadOptions').show();			 
	  $('.div_dragger').trigger("click");
  }
});

currentReportName=reportName;	
}

function downPartnerSystemAccessMIS(format,buId,partyId){
	usertype = $('#recordtypeId').val();
	
	if(currentReportName==""){
		alert("Please Select the report.");
		return;
	}
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&usertype=" + usertype + "&buId=" + buId+  "&loggedpartyId="+ partyId;
	window.location.href = reporturl;
	
	}

