function checkAuthentication(){
	
	var pageName  = window.location.pathname.split('/');
	var module = pageName[2];
	
	//alert(module);
 	var controllIds=$('#idList').val().split(',');
 	//alert(controllIds);
	$(controllIds).each(function(){
		var exitFlag=false;
		//$('[id='+this.replace("[", "").replace("]", "")+']').remove();
		var link = this.trim();
		//alert(link);
		if(link == 'SPBroadcastLink' && module=='broadcast'){
			$("#hidebroadcast").hide("scale", 1);
			$("#showSecErrDiv").show("scale", 500);
			exitFlag = true;
		} else if(link == 'SPPortfolioSummaryReportLink' && module=='loadreportAdWiseCilentPortfolioSummary.htm'){
			$("#hidesumRpt").hide("scale", 1);
			$("#showSecErrDiv").hide("scale", 1);
			$("#showErrDiv").show("scale", 500);
			exitFlag = true;
		} else if(link == 'SPclientGoalSummaryReportLink' && module=='loadreportClientGoalSummary.htm'){
			$("#hidesumRpt").hide("scale", 1);
			$("#showSecErrDiv").hide("scale", 1);
			$("#showErrDiv").show("scale", 500);
			exitFlag = true;
		}else if(link == 'SPexecutionTrackerListReportLink' && module=='loadreportExecutionTrackerList.htm'){
			$("#hidesumRpt").hide("scale", 1);
			$("#showSecErrDiv").hide("scale", 1);
			$("#showErrDiv").show("scale", 500);
			exitFlag = true;
		} else if(link == 'SPOpportunityTrackerListReportLink' && module=='loadreportOpportunityTrakerList.htm'){
			$("#hidesumRpt").hide("scale", 1);
			$("#showSecErrDiv").hide("scale", 1);
			$("#showErrDiv").show("scale", 500);
			exitFlag = true;
		}else if(link == 'SPDCTrackerListReportLink' && module=='loadreportDCTrackerList.htm'){
			$("#hidesumRpt").hide("scale", 1);
			$("#showSecErrDiv").hide("scale", 1);
			$("#showErrDiv").show("scale", 500);
			exitFlag = true;
		}else if(link == 'SPPingDeliveryReportLink' && module=='loadreportPingDelivery.htm'){
			$("#hidesumRpt").hide("scale", 1);
			$("#showSecErrDiv").hide("scale", 1);
			$("#showErrDiv").show("scale", 500);
			exitFlag = true;
		}else if(link == 'SPSerTeamPartnerActDetailsRptLink' && module=='loadreportServiceTeamPartnerActivityDetails.htm'){
			$("#hidesumRpt").hide("scale", 1);
			$("#showSecErrDiv").hide("scale", 1);
			$("#showErrDiv").show("scale", 500);
			exitFlag = true;
		}else if(link == 'SPSystemAccessHistoryReportLink' && module=='loadreportSystemAccessHistory.htm'){
			$("#hidesumRpt").hide("scale", 1);
			$("#showSecErrDiv").hide("scale", 1);
			$("#showErrDiv").show("scale", 500);
			exitFlag = true;
		}else if(link == 'SPPartnerMISReportLink' && module=='loadreportPartnerMIS.htm'){
			$("#hidesumRpt").hide("scale", 1);
			$("#showSecErrDiv").hide("scale", 1);
			$("#showErrDiv").show("scale", 500);
			exitFlag = true;
		}else if(link == 'SPFileUploadErrorSumLink' && module=='loadreportFileUploadErrorSum.htm'){
			$("#hidesumRpt").hide("scale", 1);
			$("#showSecErrDiv").hide("scale", 1);
			$("#showErrDiv").show("scale", 500);
			exitFlag = true;
		}else if((link == 'SPBizUnitLink' || link == 'SPBizUnitLink1') && module=='bizunit'){
			
			$("#hidebizUnit").hide();
			$("#showSecErrDiv").show("scale", 500);
			exitFlag = true;
		} else if((link == 'SPSecurityLink' || link == 'SPUserLink') && module=='user'){
			$("#hideUserListPage").hide();
			$("#showSecErrDiv").show("scale", 500);
			exitFlag = true;
		} else if(link == 'SPCodeTypeLink' && module=='codetype'){
			$("#hideCodeTypePage").hide();
			$("#showSecErrDiv").show("scale", 500);
			exitFlag = true;
		} else if((link == 'SPSecurityLink' || link == 'SPRoleLink') && module=='rolelist'){
			$("#hideRoleListPage").hide();
			$("#hideRoleAccessListPage").hide();
			$("#showSecErrDiv").show("scale", 500);
			exitFlag = true;
		}
		
		
		if (exitFlag) return false;
	});
	
}