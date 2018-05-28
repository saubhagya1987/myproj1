

currentReportName="";

var StartDate ;
var EndDate ;
var opportStatus;

function generateReport(reportName,partyId) {
		StartDate = $('#from').val();
		opportStatus = $('#opportunityStatusId').val(); 
		EndDate = $('#to').val();
	
	var reporturl ="report/reports birtreport.htm?ReportName="+reportName+"&ReportFormat=html&Partyid=" + partyId + "&StartDate="+StartDate + "&EndDate="+EndDate + "&status="+opportStatus;
		
	$("#reportview").html("Loading...<br><img src='images/loading.gif' align='middle' >");
		
        $('#reportview').load(reporturl ,function(response, status, xhr) {
        	
          if (status == "error") {
		    var msg = "Sorry but there was an error getting details ! ";
			$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
		  }
	    });
        
        currentReportName=reportName;	
	}
	
	
	function downloadReport1(format,partyId){
		StartDate = $('#from').val();
		EndDate = $('#to').val();
		opportStatus = $('#opportunityStatusId').val(); 
		

		//alert("currentReportName:::::::::::::::"+currentReportName);
		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&Partyid="+ partyId + "&StartDate="+StartDate + "&EndDate="+EndDate + "&status="+opportStatus;
		
		window.location.href = reporturl;
		
		}
	function getDCTrackerList(reportName,partyId) {
		StartDate = $('#from').val();
		opportStatus = $('#opportunityStatusId').val(); 
		EndDate = $('#to').val();
		var CurrentStage;
		
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&Partyid=" + partyId + "&StartDate="+StartDate + "&EndDate="+EndDate + "&CurrentStage="+opportStatus;
		
	$("#reportview").html("Loading...<br><img src='images/loading.gif' align='middle' >");
		
        $('#reportview').load(reporturl ,function(response, status, xhr) {
        	
          if (status == "error") {
		    var msg = "Sorry but there was an error getting details ! ";
			$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
		  }
	    });
        
        currentReportName=reportName;	
	}
	function downDCTrackerList(format,partyId){
		StartDate = $('#from').val();
		EndDate = $('#to').val();
		opportStatus = $('#opportunityStatusId').val(); 
		var CurrentStage;

		//alert("currentReportName:::::::::::::::"+currentReportName);
		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="birtreport?ReportName="+currentReportName+"&ReportFormat="+format+"&Partyid="+ partyId + "&StartDate="+StartDate + "&EndDate="+EndDate + "&CurrentStage="+opportStatus;
		
		window.location.href = reporturl;
		
		}
	function getClientSummary(reportName,partyId) {
		var ClientpartyId = $('#quickSearch').val().split(']');
		
		
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&Partyid=" + partyId +"&ClientpartyId=" + ClientpartyId[1] ;
	
	$("#reportview").html("Loading...<br><img src='images/loading.gif' align='middle' >");
		
        $('#reportview').load(reporturl ,function(response, status, xhr) {
        	
          if (status == "error") {
		    var msg = "Sorry but there was an error getting details ! ";
			$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
		  }
	    });
        
        currentReportName=reportName;	
	}
	
	
	function downloadclientsummary(format,partyId){
		
		var ClientpartyId = $('#quickSearch').val().split(']');
		//alert("ee:::"+partyId[1]);
		
		//alert("currentReportName:::::::::::::::"+currentReportName);
		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&Partyid=" + partyId +"&ClientpartyId=" + ClientpartyId[1] ;
		
		window.location.href = reporturl;
		
		}
	function getClientGoalDetailSt(reportName) {
		var PartyId = $('#quickSearch').val().split(']');
		alert("ee:::"+PartyId[1]);
		
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&Partyid=" + PartyId[1] ;
		
	$("#reportview").html("Loading...<br><img src='images/loading.gif' align='middle' >");
		
        $('#reportview').load(reporturl ,function(response, status, xhr) {
        	
          if (status == "error") {
		    var msg = "Sorry but there was an error getting details ! ";
			$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
		  }
	    });
        
        currentReportName=reportName;	
	}
function downgetClientGoalDetailSt(format){
		
		var PartyId = $('#quickSearch').val().split(']');
		//alert("ee:::"+partyId[1]);
		
		//alert("currentReportName:::::::::::::::"+currentReportName);
		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&Partyid=" + PartyId[1] ;
		
		window.location.href = reporturl;
		
		}

	function getADWiseClientHold(reportName,partyId) {
		
		StartDate = $('#from').val();
		var ClientpartyId = $('#quickSearchHidden').val();
		EndDate = $('#to').val();
		
	
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&PartnerId=" + partyId + "&ClientpartyId=" + ClientpartyId + "&StartDate="+StartDate + "&EndDate="+EndDate;
		
//	$("#reportview").html("Loading...<br><img src='images/loading.gif' align='middle' >");
		
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
		StartDate = $('#from').val();
		EndDate = $('#to').val();
		var ClientpartyId = $('#quickSearchHidden').val();
	

		//alert("currentReportName:::::::::::::::"+currentReportName);
		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&PartnerId="+ partyId + "&ClientpartyId=" + ClientpartyId +     "&StartDate="+StartDate + "&EndDate="+EndDate;
		
		
		window.location.href = reporturl;
		
		}
	
	function downClientTxnHistory(format,partyId){
	

		//alert("currentReportName:::::::::::::::"+currentReportName);
		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		var ClientpartyId = $('#quickSearchHidden').val();
		var TxnType = $('#txntypeId').val(); 
		var Issuer = $('#issurerId').val(); 
		StartDate = $('#from').val();
		EndDate = $('#to').val();
	
		var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&ClientpartyId=" + ClientpartyId + "&TransactionTypeId="+TxnType + "&Issuerid="+Issuer + "&StartDate="+StartDate + "&EndDate="+EndDate+ "&PartnerId=" + partyId;
		
		
		window.location.href = reporturl;
		
		}
	
	function getClientTxnHistory(reportName,partyId) {
		var ClientpartyId = $('#quickSearchHidden').val();
		var TxnType = $('#txntypeId').val(); 
		var Issuer = $('#issurerId').val(); 
		StartDate = $('#from').val();
		EndDate = $('#to').val();
//		var TxnFlow = $('#txnflow').val();
	
		var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&ClientpartyId=" + ClientpartyId + "&TransactionTypeId="+TxnType + "&Issuerid="+Issuer + "&StartDate="+StartDate + "&EndDate="+EndDate+ "&PartnerId=" + partyId;
		
		
//	$("#reportview").html("Loading...<br><img src='images/loading.gif' align='middle' >");
		
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
	
	function getADWClientSIPRe(reportName,partyId) {
		
		var days= $('#days').val();
		var ClientpartyId = $('#quickSearchHidden').val();
		
	
	
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&PatnerId=" + partyId + "&days="+days +"&ClientpartyId=" + ClientpartyId;
//	alert("ee:::"+reporturl);
//	$("#reportview").html("Loading...<br><img src='images/loading.gif' align='middle' >");
		
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
		
	

		//alert("currentReportName:::::::::::::::"+currentReportName);
		if(currentReportName==""){
			alert("Please Select the report.");
			return;
		}
		
		
		var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&PatnerId="+ partyId + "&ClientpartyId=" + ClientpartyId + "&days="+days ;
		
		
		window.location.href = reporturl;
		
		}
		
function getClientPorDetailedSt(reportName,partyId) {
		
		AsOnDate = $('#datepicker').val();
		var ClientpartyId = $('#quickSearchHidden').val();
		
	
	
	var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&ClientpartyId=" + ClientpartyId+ "&AsOnDate="+AsOnDate+"&PartnerId="+ partyId;
		
//	$("#reportview").html("Loading...<br><img src='images/loading.gif' align='middle' >");
		
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
			
	

			//alert("currentReportName:::::::::::::::"+currentReportName);
			if(currentReportName==""){
				alert("Please Select the report.");
				return;
			}
			
			
			var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&ClientpartyId=" + ClientpartyId + "&AsOnDate="+AsOnDate+"&PartnerId="+ partyId;
			
			
			window.location.href = reporturl;
			
			}
		
		function getClientFolioMissNom(reportName,partyId) {
			
			var ClientpartyId = $('#quickSearchHidden').val();
//			alert("ee:::"+ClientpartyId[1]);
			
		var reporturl ="birtreport.htm?ReportName="+reportName+"&ReportFormat=html&ClientpartyId=" + ClientpartyId + "&PartnerId=" + partyId ;
			
//		$("#reportview").html("Loading...<br><img src='images/loading.gif' align='middle' >");
			
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
			//alert("ee:::"+partyId[1]);
			
			//alert("currentReportName:::::::::::::::"+currentReportName);
			if(currentReportName==""){
				alert("Please Select the report.");
				return;
			}
			
			
			var reporturl ="birtreport.htm?ReportName="+currentReportName+"&ReportFormat="+format+"&ClientpartyId=" + ClientpartyId + "&PartnerId=" + partyId ;
			
			window.location.href = reporturl;
			
			}
	
	

	function getContactList(e){
		var event = window.event ? window.event : e;
		//alert(event.keyCode);
		
		if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 || event.keyCode==33 || event.keyCode==34 )
			return;
//	 	if(event.keyCode==13){
//	 		search();
//	 		return;
//	 	}
		$.ajax({
			  url: "getContactList?searchString="+$('#quickSearch').val(),
			  method:"post",
			  success:function(result){
				  var userLabelValueList = new Array();
				 $(result).each(function(i,obj){
						var object = {};
						object.value = obj.partyId;
						object.label = obj.fName+' '+obj.lName;
						
						userLabelValueList.push(object);
				 }); 
				 
				 $("#quickSearch")
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
					        	partyId=ui.item.value;
					        	$('#quickSearchHidden').val(partyId)
							
//						alert('a='+a);
					        // 					        feedItemPost
//					        alert('id='+ui);
					        
					        // add placeholder to get the comma-and-space at the end
					        terms.push( "" );
					        this.value = terms.join( "" );
					        
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
	function split( val ) {
	    return val.split( /;\s*/ );
	} 
	function extractLast( term ) {
	    return split( term ).pop();
	}
	
	function allowIntegersOnly(id,e){
//		alert(e.keyCode)
		if ( $.inArray(e.keyCode,[46,8,9,27,13]) !== -1 ||
	            // Allow: Ctrl+A
	           (e.keyCode == 65 && e.ctrlKey === true) || 
	            // Allow: home, end, left, right
	           (e.keyCode >= 35 && e.keyCode <= 39)) {
	                // let it happen, don't do anything
	                return;
	       }
	       else {
	           // Ensure that it is a number and stop the keypress
	           if (e.shiftKey || (e.keyCode < 48 || e.keyCode > 57) && (e.keyCode < 96 || e.keyCode > 105 )) {
	               e.preventDefault(); 
	           }   
	       }
		try{
			$('input[name="'+id+'"]').removeAttr('checked');
		}catch(e){
			
		}

	}
			