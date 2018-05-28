
/*rupali*/
currentReportName="";


var StartDate ;
var EndDate ;
var opportStatus;

function getOppbyStatus(reportName,partyId,buId) {
	StartDate = $('#from').val();
	status = $('#opportunityStatusId').val(); 
	EndDate = $('#to').val();
	var ClientpartyId = $('#quickSearchHidden').val();
	
var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId=" + buId+"&PartnerId=" + partyId  +"&ClientpartyId=" + ClientpartyId+"&status="+status + "&StartDate="+StartDate + "&EndDate="+EndDate ;
	
$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
	
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
function downOppbyStatus(format,partyId,buId){
	StartDate = $('#from').val();
	status = $('#opportunityStatusId').val(); 
	EndDate = $('#to').val();
	var ClientpartyId = $('#quickSearchHidden').val();

	
	if(currentReportName==""){
		alert("Please Select the report.");
		return;
	}
	
	
	var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId=" + buId+"&PartnerId=" + partyId  +"&ClientpartyId=" + ClientpartyId+"&status="+status + "&StartDate="+StartDate + "&EndDate="+EndDate ;
	window.location.href = reporturl;
	
	}
	
	function getOppTrackerList(reportName,partyId,buId) {
		StartDate = $('#from').val();

		EndDate = $('#to').val();
		var ClientpartyId = $('#quickSearchHidden').val();
	
	
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+ buId + "&PartnerId=" + partyId+ "&ClientpartyId=" + ClientpartyId + "&StartDate="+StartDate + "&EndDate="+EndDate ;
	
	$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
		
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
function downOppTrackerList(format,partyId,buId){
	StartDate = $('#from').val();

	EndDate = $('#to').val();
		var ClientpartyId = $('#quickSearchHidden').val();
		
		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId=" + buId + "&ClientpartyId=" + ClientpartyId + "&PartnerId=" + partyId+ "&StartDate="+StartDate + "&EndDate="+EndDate;
		
		window.location.href = reporturl;
		
		}
function getDCTrackerList(reportName,partyId,buId) {
	StartDate = $('#from').val();
	CurrentStage = $('#opportunityStatusId').val(); 
	EndDate = $('#to').val();
	var ClientpartyId = $('#quickSearchHidden').val();

	
var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId=" + buId +"&PartnerId=" + partyId  + "&ClientpartyId=" + ClientpartyId+"&CurrentStage="+CurrentStage + "&StartDate="+StartDate + "&EndDate="+EndDate ;
	
$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
	
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
function downDCTrackerList(format,partyId,buId){
	StartDate = $('#from').val();
	CurrentStage = $('#opportunityStatusId').val(); 
	EndDate = $('#to').val();
	var ClientpartyId = $('#quickSearchHidden').val();
	
	
	if(currentReportName==""){
		alert("Please Select the report.");
		return;
	}
	
	
	var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId=" + buId +"&PartnerId=" + partyId  + "&ClientpartyId=" + ClientpartyId + "&CurrentStage=" + CurrentStage + "&StartDate="+StartDate + "&EndDate="+EndDate ;
	window.location.href = reporturl;
	
	}
	function getClientSummary(reportName,partyId,buId) {
		var ClientpartyId = $('#quickSearchHidden').val();
		
		
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&PartnerId=" + partyId +"&ClientpartyId=" + ClientpartyId +"&buId=" + buId;
	
	$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
		
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
	
	
	function downloadclientsummary(format,partyId,buId){
		
		var ClientpartyId = $('#quickSearchHidden').val();
	
		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&PartnerId=" + partyId +"&ClientpartyId=" + ClientpartyId +"&buId=" + buId;
		
		window.location.href = reporturl;
		
		}
	function getClientGoalDetailSt(reportName,buId,partyId) {
		var ClientpartyId = $('#quickSearchHidden').val();
	
		
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId=" + buId+ "&PartnerId=" + partyId +"&ClientpartyId=" + ClientpartyId;
		
	$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
		
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
function downgetClientGoalDetailSt(format,buId,partyId){
		
	var ClientpartyId = $('#quickSearchHidden').val();
	
		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId=" + buId+ "&PartnerId=" + partyId +"&ClientpartyId=" + ClientpartyId;
		
		window.location.href = reporturl;
		
		}

	function getADWiseClientHold(reportName,partyId) {
		
		AsOnDate = $('#datepicker').val();
		var ClientpartyId = $('#quickSearchHidden').val();
		

	
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&PartnerId=" + partyId + "&ClientpartyId=" + ClientpartyId + "&AsOnDate="+AsOnDate ;

	$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
		
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
	

	function downADWClientHold(format,partyId){
		

		AsOnDate = $('#datepicker').val();
		var ClientpartyId = $('#quickSearchHidden').val();

			
			if(currentReportName==""){
				alert("Please Select the report.");
				return;
			}
			
			
			var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&PartnerId=" + partyId + "&ClientpartyId=" + ClientpartyId + "&AsOnDate="+AsOnDate ;
			
			
			window.location.href = reporturl;
			
			}
	
function getClientTxnHistory(reportName,partyId) {
		
		
		var ClientpartyId = $('#quickSearchHidden').val();
		var TransactionTypeId = $('#txntypeId').val(); 
		var Issuerid = $('#issurerId').val(); 
		StartDate = $('#from').val();
		EndDate = $('#to').val();
	
	
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&PartnerId=" + partyId+"&ClientpartyId=" + ClientpartyId +"&StartDate="+StartDate+ "&EndDate="+EndDate+ "&TxnTypeId=" + TransactionTypeId + "&IssuerId="+Issuerid ;
	
	$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
		
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
	
function downClientTxnHistory(format,partyId) {
	
	
	var ClientpartyId = $('#quickSearchHidden').val();
	var TransactionTypeId = $('#txntypeId').val(); 
	var Issuerid = $('#issurerId').val(); 
	StartDate = $('#from').val();
	EndDate = $('#to').val();

	
	if(currentReportName==""){
		alert("Please Select the report.");
		return;
	}
	var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&PartnerId=" + partyId+"&ClientpartyId=" + ClientpartyId +"&StartDate="+StartDate+ "&EndDate="+EndDate+ "&TxnTypeId=" + TransactionTypeId + "&IssuerId="+Issuerid ;

	window.location.href = reporturl;
}
	

	
	function getADWClientSIPRe(reportName,partyId) {
		
		var days= $('#days').val();
		var ClientpartyId = $('#quickSearchHidden').val();
		

	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&PartnerId=" + partyId +"&day="+days + "&ClientpartyId=" + ClientpartyId  ;
	
	$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
		
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
	
	function downADWClientSIPRe(format,partyId){
		var days= $('#days').val();
		var ClientpartyId = $('#quickSearchHidden').val();
		
		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&PartnerId="+ partyId + "&day="+days+  "&ClientpartyId=" + ClientpartyId ;
		
		
		window.location.href = reporturl;
		
		}
		
function getClientPorDetailedSt(reportName,partyId) {
		
		AsOnDate = $('#datepicker').val();
		var ClientpartyId = $('#quickSearchHidden').val();
		
	
	
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&ClientpartyId=" + ClientpartyId + "&AsOnDate="+AsOnDate +"&PartnerId="+ partyId  ;
		
	$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
		
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
	

	
		function downClientPorDetailedSt(format,partyId){
			var AsOnDate = $('#datepicker').val();
			var ClientpartyId = $('#quickSearchHidden').val();
			
	

	
			if(currentReportName==""){
				alert("Please Select the report.");
				return;
			}
			
			
			var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&ClientpartyId=" + ClientpartyId + "&AsOnDate="+AsOnDate +"&PartnerId="+ partyId  ;
			
			
			window.location.href = reporturl;
			
			}
		
		function getClientFolioMissNom(reportName,partyId) {
			
			var ClientpartyId = $('#quickSearchHidden').val();
		
		
		var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&PartnerId=" + partyId + "&ClientpartyId=" + ClientpartyId ;
			
		$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
			
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
	function downClientFolioMissNom(format,partyId){
			
			var ClientpartyId = $('#quickSearchHidden').val();
		
			if(currentReportName==""){
				alert("Please Select the report.");
				return;
			}
			
			
			var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&PartnerId=" + partyId + "&ClientpartyId=" + ClientpartyId;
			
			window.location.href = reporturl;
			
			}
	
function getPartOpenQueryList(reportName,partyId,buId) {
		
		StartDate = $('#from').val();
		EndDate = $('#to').val();
		var QueryCategory = $('#querytypeId').val(); 
		
	    var QueryContactParty = $('#queryconId').val(); 

	
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+ buId+"&StartDate=" +StartDate + "&EndDate=" +EndDate + "&QueryCategory="+QueryCategory + "&QueryOwnerParty="+partyId+ "&QueryContactParty="+QueryContactParty;

	$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
		
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
	
function downPartOpenQueryList(format,partyId,buId) {
	
	
	StartDate = $('#from').val();
	EndDate = $('#to').val();
	var QueryCategory = $('#querytypeId').val(); 
	
    var QueryContactParty = $('#queryconId').val(); 



	if(currentReportName==""){
		alert("Please Select the report.");
		return;
	}
	var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId="+ buId+"&StartDate=" +StartDate + "&EndDate=" +EndDate + "&QueryCategory="+QueryCategory + "&QueryOwnerParty="+partyId+ "&QueryContactParty="+QueryContactParty;


	window.location.href = reporturl;
}
	
function getPartOpenTaskList(reportName,partyId,buId) {
	StartDate = $('#from').val();
	EndDate = $('#to').val();
	var TaskCategory = $('#tasktypeId').val(); 

	var TaskContactPartyID = $('#taskconId').val(); 
	


var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+ buId+"&StartDate=" +StartDate + "&EndDate=" +EndDate + "&TaskCategory="+TaskCategory + "&TaskOwnerPartyID="+partyId+ "&TaskContactPartyID="+TaskContactPartyID;

$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
	
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

function downPartOpenTaskList(format,partyId,buId) {


StartDate = $('#from').val();
EndDate = $('#to').val();
var TaskCategory = $('#tasktypeId').val(); 

var TaskContactPartyID = $('#taskconId').val(); 


if(currentReportName==""){
	alert("Please Select the report.");
	return;
}
var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId="+ buId+"&StartDate=" +StartDate + "&EndDate=" +EndDate + "&TaskCategory="+TaskCategory + "&TaskOwnerPartyID="+partyId+ "&TaskContactPartyID="+TaskContactPartyID;

window.location.href = reporturl;
}


function getPingDelivery(reportName,partyId,buId) {
	StartDate = $('#from').val();

	EndDate = $('#to').val();
	var ClientpartyId = $('#quickSearchHidden').val();
	
var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+buId + "&PartnerId=" + partyId +"&ClientpartyId=" + ClientpartyId +"&StartDate="+StartDate + "&EndDate="+EndDate ;
	
$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
	
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
function downPingDelivery(format,partyId,buId){
	StartDate = $('#from').val();

	EndDate = $('#to').val();
	var ClientpartyId = $('#quickSearchHidden').val();

	
	if(currentReportName==""){
		alert("Please Select the report.");
		return;
	}
	
	
	var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId="+buId + "&PartnerId=" + partyId +"&ClientpartyId=" + ClientpartyId +"&StartDate="+StartDate + "&EndDate="+EndDate ;
	window.location.href = reporturl;
	
	}


function getAdWClientPoFolioSumm(reportName,partyId) {
	
	as_at_date = $('#datepicker').val();
	var ClientpartyId = $('#quickSearchHidden').val();
	


var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&as_at_date="+ as_at_date +"&PartnerId="+ partyId + "&ClientpartyId=" + ClientpartyId  ;
	
$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
	
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



	function downAdWClientPoFolioSumm(format,partyId){
		as_at_date = $('#datepicker').val();
		var ClientpartyId = $('#quickSearchHidden').val();
		



		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&as_at_date="+ as_at_date +"&PartnerId="+ partyId + "&ClientpartyId=" + ClientpartyId  ;
		
		
		window.location.href = reporturl;
		
		}
	
	function getSIPDetailReport(reportName,partyId) {
		
		as_at_date = $('#datepicker').val();
		var ClientpartyId = $('#quickSearchHidden').val();
		


		var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&PartnerId=" + partyId +"&ClientpartyId=" + ClientpartyId +"&as_at_date="+as_at_date  ;
		
		$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
			
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

		function downSIPDetailReport(format,partyId){
			as_at_date = $('#datepicker').val();
			var ClientpartyId = $('#quickSearchHidden').val();
			



			if(currentReportName==""){
				alert("Please Select the report.");
				return;
			}
			
			
			var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&PartnerId=" + partyId +"&ClientpartyId=" + ClientpartyId +"&as_at_date="+as_at_date  ;
			
			
			window.location.href = reporturl;
			
			}
		
		
		function getExecTrackerMIS(reportName,partyId,buId) {

			var ClientpartyId = $('#quickSearchHidden').val();
			


			var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&buId="+ buId+ "&PartnerId=" + partyId +"&ClientpartyId=" + ClientpartyId ;
			
			$("#reportview").html('<img  id="centerLoadingImage" src="images/loading15.gif" name="loadingImage" style="display:block;position:fixed;top:5%;left:2%;"/>');
				
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

			function downExecTrackerMIS(format,partyId,buId){
		
				var ClientpartyId = $('#quickSearchHidden').val();
				



				if(currentReportName==""){
					alert("Please Select the report.");
					return;
				}
				
				
				var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&buId="+ buId+ "&PartnerId=" + partyId +"&ClientpartyId=" + ClientpartyId  ;
				
				
				window.location.href = reporturl;
				
				}
