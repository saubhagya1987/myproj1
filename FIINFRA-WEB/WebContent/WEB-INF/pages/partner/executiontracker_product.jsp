<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Execution Tracker : Products Recommendation</title>
<script type="text/javascript">
	function submitproposedInvestmentTableForm(){
		if(validateAllocation() && validateAllocationAmount()){
		var etData = [];
		$('.productList').each(function(index , element){
		var obj = {};
		var productId = element.value;
		obj["productName"] = productId.toString();
		etData.push(obj);
		
	});
	
	$('.investmentTypeList').each(function(index , element){
		var investmentType = element.value;
		var obj = etData[index];
		obj.investmentType = investmentType;
	});
	
	$('.frequencyList').each(function(index , element){
		var frequency = element.value;
		var obj = etData[index];
		obj.frequency = frequency;
	});
	
	$('.clientApprovalStatusList').each(function(index , element){
		var clientApprovalStatus = element.value;
		var obj = etData[index];
		obj.clientApprovalStatus = clientApprovalStatus;
	});
	$('.allocationPercent').each(function(index , element){
		var allocationPercent = element.value;
		var obj = etData[index];
		obj.allocationPercent = allocationPercent;
	});
	$('.allocationAmount').each(function(index , element){
		var investmentAmount = element.value;
		var obj = etData[index];
		obj.investmentAmount = investmentAmount;
	});
	$('.checkBox').each(function(index,element){
		$('.checkBox').attr("checked", false);     
	});
	
	console.log("<   "+JSON.stringify( {etDataList : etData})+"   >");
	
		$.ajax({
        url: $('#contextPath').val()+'/et/saveProposedInvestments.htm?fpActionPlanId='+$('#fpActionPlanId').val(),
        type: 'POST',
        contentType: 'application/json',
        data:JSON.stringify(etData),
        dataType: 'json',
        success:function(data){
        	if(data.success!=null){
        		bootbox.dialog({
        			message: "<span class='bigger-110'>"+data.success+"</span>",
        			buttons: {
        				  confirm: {
        					 label: "OK",
        					 className: "btn-primary btn-xs",
        				  }
        				  
        			}
        			
        		});
        		//showAlertMessage1("Success",data.success +'\n',"confirmation", doNothing);
				//$('#proposedInvestmentTableForm input,select').attr('disabled','disabled');	
        		//$('#invType').removeAttr('disabled');
        	}else if(data.error!=null){
        		bootbox.dialog({
        			message: "<span class='bigger-110'>"+data.error+"</span>",
        			buttons: {
        				  confirm: {
        					 label: "OK",
        					 className: "btn-primary btn-xs",
        				  }
        				  
        			}
        			
        		});
        		
        	}
        }
    });
   
	}
	
};

function validateCalAllocation(){
	
    var totalAllocation = 0;
	$('.allocationPercent').each(function(i,obj){ 
		totalAllocation += Number($(this).val());
	});
	
	if(totalAllocation > 100)
	 {
		bootbox.dialog({
			message: "<span class='bigger-110'>Allocation percent should not exceeds 100%</span>",
			buttons: {
				  confirm: {
					 label: "OK",
					 className: "btn-primary btn-xs",
				  }
				  
			}
			
		});
		return false;
	 }	
	
	
	return true;
}


function validateAllocation(){
	var checked=true;
	
	$('.allocationPercent').each(function(i,obj){ 
		if($(this).val() == ""){ 
			checked=false;
			return false;
		} else{
			checked=true;
		}
		
	});
	if(!checked){
		bootbox.dialog({
			message: "<span class='bigger-110'>Please enter allocation</span>",
			buttons: {
				  confirm: {
					 label: "OK",
					 className: "btn-primary btn-xs",
				  }
				  
			}
			
		});
		/* 
		showAlertMessage1("Success",
				'Please enter allocation \n',
				"confirmation", doNothing); */
	}
	
	return checked;
}

function validateAllocationAmount(){
	var checked=true;
	
	$('.allocationAmount').each(function(i,obj){ 
		if($(this).val() == ""){ //alert($(this).val());
			checked=false;
			return false;
		} else{
			checked=true;
		}
		
	});
	if(!checked){
		
		bootbox.dialog({
			message: "<span class='bigger-110'>Please enter investment amount</span>",
			buttons: {
				  confirm: {
					 label: "OK",
					 className: "btn-primary btn-xs",
				  }
				  
			}
			
		});
		/* showAlertMessage1("Success",
				'Please enter investment amount \n',
				"confirmation", doNothing); */
	}
	
	return checked;
} 
</script>
</head>
<body>
	<input type="hidden" id="fpActionPlanId" value="${fpActionPlanId}" />
	<input type="hidden" id="partyId" value="${executionDetails.partyId}" />
	<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>" />

	<!--css popup window 1 close-->
	<jsp:include page="../common/header.jsp" />
	<!-- Center part start -->
<section>
	<div class="">
			<div class="main-content">
              <div class="main-contnet-inner">
                <div class="page-content">
                  <div class="page-header clearfix">
                     <h1 class="pull-left">
                     Execution Tracker for <c:choose>
							<c:when test="${sessionScope.clientType==14006}">
								<i title="Client" class="clienticon"> </i>
							</c:when>
							<c:when test="${sessionScope.clientType==14007}">
								<i title="PClient" class="pclienticon"> </i>
							</c:when>
							<c:when test="${sessionScope.clientType==14005}">
								<i class="opportunityicon"></i>
							</c:when>
						</c:choose>${sessionScope.contactName}
                     </h1>
                     </div>
       				<div class="container-body">
						<!-- Top start-->
						<div class="col-sm-12">
										<div class="widget-box">
											<div class="widget-header">
												<h4 class="smaller">Execution Details</h4>
											</div>

											<div class="widget-body">
												<div class="widget-main">
													<div class="row">
														<div class="col-md-3">
															<div class="well well-lg">
																<div class="row">
																	<div class="col-md-4">
																		<i class="ace-icon fa fa-mortar-board green bigger-300 "></i>
																	</div>
																	<div class="col-md-8">
																		<h5 class="dark">Goal</h5>
																		<h4 class="blue">${executionDetails.goalName}</h4>
																		
																		<div class="space">  </div>
																		<div class="space">  </div>
																		<div class="space">  </div>
																		<div class="space">  </div>
																	</div>
																</div>
															</div>
														</div>
					
														<div class="col-md-3">
															<div class="well well-lg">
																<div class="row">
																	<div class="col-md-4">
																		<i class="ace-icon fa fa-bar-chart green bigger-300 "></i>
																	</div>
																	<div class="col-md-8">
																		<h5 class="dark">Status</h5>
																		<h4 class="blue">${executionDetails.executionStatus}</h4>
																		
																		<h5 class="dark">EX Start Date</h5>
																		<h4 class="blue">${executionDetails.executionStartDate}</h4>
																	</div>
																</div>
															</div>
														</div>
					
														<div class="col-md-3">
															<div class="well well-lg">
																<div class="row">
																	<div class="col-md-4">
																		<i class="menu-icon fa icon-opportunity green bigger-300"></i>
																	</div>
																	<div class="col-md-8">
																		<h5 class="dark">Target Amount</h5>
																		<h4 class="blue">${executionDetails.targetAmount}</h4>
																		
																		<h5 class="dark">Year</h5>
																		<h4 class="blue">${executionDetails.targetYear}</h4>
																	</div>
																</div>
															</div>
														</div>
														
														<div class="col-md-3">
															<div class="well well-lg">
																<div class="row">
																	<div class="col-md-4">
																		<i class="ace-icon fa fa-money green bigger-300 "></i>
																	</div>
																	<div class="col-md-8">
																		<h5 class="dark">Recommended Investment</h5>
																		<h4 class="blue">${executionDetails.recommendedInvestment}</h4>
																		
																	
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div><!-- /.col -->
							</div><!-- /.row -->
								
								<hr />

					<div class="container-body">
						<div class="col-sm-12">
							<div class="widget-box">
								<div class="widget-header">
									<h4 class="smaller">Proposed Investment for execution</h4>
								</div>

								<div class="widget-body">
									<div class="widget-main">
										<!-- #section:elements.popover -->
										<div class="row">
											<jsp:include page="executiontracker_actions.jsp"></jsp:include>
											<div class="col-md-9" style="margin-bottom:10px;">
												<div class="col-xs-12 col-sm-12 widget-container-col ui-sortable">
													<div class="widget-box widget-color-blue ui-sortable-handle">
														<div class="widget-header">
															<h5 class="widget-title bigger lighter">
																Recommended Investment
															</h5>
															<div class="widget-toolbar widget-toolbar-light no-border">
																<a href="#" data-action="collapse">
																	<i class="ace-icon fa fa-chevron-up"></i>
																</a>
															</div>
														</div>
														<div class="widget-body">
															<div class="widget-main no-padding">
																<div class="table-responsive" id="display_table_lead"
																	style="border: none;">
																	<div id="toreload">
																		<table id="recommendedInvestmentTable"
																			class="table table-hover table-bordered table-striped">
																			<thead>
																				<tr>
																					<th class="thead"><b style="color:grey;">Product </b></th>
																					<th class="thead"><b style="color:grey;">Allocation %</b></th>
																					<th class="thead"><b style="color:grey;">Investment Type</b></th>
																					<th class="thead"><b style="color:grey;">Investment Amount
																							(Rs.)</b></th>
																					<th class="thead"><b style="color:grey;">Frequency</b></th>
																				</tr>
																			</thead>
							
																		</table>
																		<!-- Center-->
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
							        			<div class="clearfix"></div>
        			
								        			<div class="col-xs-12 col-sm-12 widget-container-col ui-sortable">
														<div class="widget-box widget-color-blue ui-sortable-handle">
															<div class="widget-header">
																<h5 class="widget-title bigger lighter">
																	Proposed Investment
																</h5>
																<div class="widget-toolbar widget-toolbar-light no-border">
																	<a href="#" data-action="collapse">
																		<i class="ace-icon fa fa-chevron-up"></i>
																	</a>
																</div>
															</div>
															<div class="widget-body">
																<div class="widget-main no-padding">
																	<div style="width: 100%">
																		<div style="float:left;margin: 5px;">
																			<table>
																				<tr>
																					<td>
																						Investment Type:
																					</td>
																					<td>
																						<select id="invType" onChange="changeRows(this.value);">
																							<option value="sip">SIP</option>
																							<option value="lumpsum">Lumpsum</option>
																							<option value="all">All</option>
																						</select>
																					</td>
																				</tr>
																			</table>
																		</div>
																		<div style="float:right;margin: 5px;">
																			<table>
																				<tr>
																					<td>
																						<div style="float:right;margin: 5px;" data-params="{}" type="button"
																						class="btn btn-primary btn-xs dbtn" title="Add"
																						alt="Add" onClick="addRows();"><i class="fa fa-plus"></i> Add </div>
																					</td>
																					<td>
																						<div data-params="{}" type="button" class="btn btn-primary btn-xs dbtn"
																							title="Delete" alt="Delete"
																							onClick="deleteRow();"><i class="fa fa-trash"></i> Delete</div>
																					</td>
																				</tr>
																			</table>
																			
																			
																		</div>
																		<div class="clearfix"></div>
																	
																	
																
																	<div class="table-responsive" id="display_table_lead"
																		style="border: none;">
																		<div id="toreload">
																			<form id="proposedInvestmentTableForm">
																				<table id="proposedInvestmentTable"
																					class="table table-hover table-bordered table-striped">
																					<thead>
																						<tr>
																						<!-- 	<th class="thead">&nbsp;</th>
																							 --><th class="thead">&nbsp;</th>
																							<th class="thead"><b style="color:grey;">Product</b></th>
																							<th class="thead"><b style="color:grey;">Allocation %</b></th>
																							<!-- <th  class="thead"><a href="#">Investment Type</a></th> -->
																							<th class="thead"><b style="color:grey;">Investment Amount
																									(Rs.)</b></th>
																							<th class="thead"><b style="color:grey;">Frequency</b></th>
																							<th class="thead"><b style="color:grey;">Client Approval</b></th>
																							<th class="thead"><b style="color:grey;">Approval Action</b></th>
																						</tr>
																					</thead>
																				</table>
																			</form>
																		</div>
																	</div>
																	
																	
																	<div style="width: 100%">
																		
																		<div style="float:right;margin: 5px;">
																			<table>
																				<tr>
																					<td>
																						<input id="save1" type="button" class="btn btn-primary btn-xs dbtn " value="Save"
																							title="Save" alt="Save"
																							onclick="submitproposedInvestmentTableForm();">
																					</td>
																					<td>
																						<input id="cancel1" type="button" class="btn btn-primary btn-xs dbtn " value="Cancel"
																						title="Cancel" alt="Cancel" onClick="window.history.back();">
																					</td>
																				</tr>
																			</table>
																			
																			
																		</div>
																		<div class="clearfix"></div>
																	</div>
																	
																</div>
															</div>
														</div>
													</div>
								      				<div class="clearfix"></div>
												
												</div>		
											</div>
													</div>
													
										<!-- /section:elements.popover -->
									</div>
								</div>
							</div>
						</div><!-- /.col -->
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- Center part End -->

	<jsp:include page="../common/footer.jsp" />
	<script>
function changeRows(invType){

	if(invType=='sip'){
		$('tr[name="sip"]').show();
		$('tr[name="lumpsum"]').hide();
	}else if(invType=='lumpsum'){
		$('tr[name="sip"]').hide();
		$('tr[name="lumpsum"]').show();
	}else{
		$('tr[name="sip"]').show();
		$('tr[name="lumpsum"]').show();
	}
	
}
$(document).ready(function(){
	selectProducts='';
	$('#proposedInvestment').css('font-weight','bold');
	$('#executionLink').addClass('active');

	//alert($('#fpActionPlanId').val());
	$.ajax({
		  url: $('#contextPath').val()+"/et/investments.htm?fpActionPlanId="+$('#fpActionPlanId').val(),
		  method:"post",
		  success:function(result){
	 		//alert(result);
	 		  
	 		  var recommendedInvestment=result[0];
	 		  var proposedInvestment=result[1];
	 		  var pickLists=result[2];
	 		  $(recommendedInvestment).each(function(i,obj){
	 			  
	 			  //alert(obj.productName);
	 			  $('#recommendedInvestmentTable').append('<tr><td>'+obj.productName+'</td><td>'+obj.allocationPercent+'</td><td>'+obj.investmentType+'</td><td>'+obj.investmentAmount+'</td><td>'+obj.frequency+'</td></tr>');
	 			
	 			  selectProducts+='<option value="'+obj.partyId+'">'+obj.productName+'</option>';
	 			 
	 	 		   /* for(var key in pickLists.Products){
	 	 			 if(pickLists.Products[key]==obj.productName){
	 	 			 selectProducts+='<option value="'+key+'">'+obj.productName+'</option>';
	 	 			 }
	 	 		   } */
	 			  
	 		  });
	 		/*   selectProducts='';
	 		 for(var key in pickLists.Products){
		 		 selectProducts+='<option value="'+key+'">'+pickLists.Products[key]+'</option>';
	 		 } */
	 		 //alert(selectProducts);
	 		  selectInvestmentType='';
	 		 for(var key in pickLists.InvestmentType){
	 			selectInvestmentType+='<option value="'+key+'">'+pickLists.InvestmentType[key]+'</option>';
	 		 }
	 		  selectFrequency='';
	 		 for(var key in pickLists.Frequency){
	 			selectFrequency+='<option value="'+key+'">'+pickLists.Frequency[key]+'</option>';
	 		 }
	 		  selectClientApproval='';
	 		 for(var key in pickLists.ClientApprovalStatus){
	 			selectClientApproval+='<option value="'+key+'">'+pickLists.ClientApprovalStatus[key]+'</option>';
	 		 }
	 	
	 		var rowName='';
	 		 $(proposedInvestment).each(function(i,obj){
	 			  
	 			//alert(obj.investmentAmount);
	 			var buttonAction =setAction(obj.clientApprovalStatus,i,obj.fpExecutionId);
	 			if(obj.investmentType==96001){
	 				rowName="sip";
	 			}else{
	 				rowName="lumpsum";
	 			}
				
				
				$('#proposedInvestmentTable').append('<tr name="'+rowName+'" id="row'+i+'"><td><input id="'+i+'" class="checkBox '+i+'"  type="checkbox" /></td><td>'
						+'<select style="width:150px;" class="productList '+i+'" id="productList'+i+'">'
						+selectProducts+'</select></td><td><input style="width:60px;" onkeypress="return isNumber(event)" type="text" value="'+obj.allocationPercent+'" class="allocationPercent '+i+'" id="allocationPercent'+i+'" maxlength="10"/>'+
						'</td><td style="display:none;"><select  class="investmentTypeList '+i+'" id="investmentTypeList'+i+'" >'+selectInvestmentType+
						'</select></td><td><input style="width:100px;" type="text" value="'+obj.investmentAmount+'" onkeypress="return isNumber(event)" class="allocationAmount '+i+'" id="investmentAmount'+i+'" maxlength="18"/></td><td><select  class="frequencyList '+i+'" id="frequencylist'+i+'">'+
						selectFrequency+'</select></td><td><select onChange="changeAction(this);" class="clientApprovalStatusList '+i+'" id="clientApprovalStatusList'+i+'">'+selectClientApproval+
						'</select></td><td>'+buttonAction+'</td></tr>');
				$('#productList'+i).val(obj.productName);
				$('#investmentTypeList'+i).val(obj.investmentType);
				$('#frequencylist'+i).val(obj.frequency);
				$('#clientApprovalStatusList'+i).val(obj.clientApprovalStatus);
				proposedCount=i;	 			  
	 		  });
	 		   
	 		
// 	 		<<td><span class="thead"><input id="2052732" name="2052733" type="checkbox"></span></td>
	 		//$('#proposedInvestmentTableForm input,select').attr('disabled','disabled');	
	 		//$('#invType').removeAttr('disabled');
			$('tr[name="lumpsum"] ').hide();
		  }
	
	
		});
//	alert($('input').attr('disabled'));
	
		
		

	//$(':select').prop('readonly',true);
});
function setAction(status,i,fpExecutionId){
	var buttonAction='';
	//alert(status);
	switch(parseInt(status)){
	
	case 95001:
		buttonAction='<input onClick="updateStatus('+fpExecutionId+','+i+');" type="button" value="Send Approval Request" class="'+i+'" id="button'+i+'"/>';
		break;
	case 95002:
		//alert('in 95002 case');
		buttonAction='<input onClick="updateStatus('+fpExecutionId+','+i+');" type="button" value="Send Approval Reminder" class="'+i+'" id="button'+i+'"/>';
		break;
	case 95003:
		buttonAction='';
		break;
	case 95004:
		buttonAction='<input onClick="updateStatus('+fpExecutionId+','+i+');" type="button" value="Resend Approval Request" class="'+i+'" id="button'+i+'"/>';
		break;	
	default:	
		buttonAction='<input onClick="updateStatus('+fpExecutionId+','+i+');" type="button" value="Send Approval Request"  class="'+i+'" id="button'+i+'"/>';
	}
	//alert(buttonAction);
	return buttonAction
}
function changeAction(obj){
	//alert($(obj).val());
	var id=$(obj).attr('class').split(' ')[1];
	//alert(id);
	id="#button"+id;
	//alert($(id).val());
	$(id).show();
switch(parseInt($(obj).val())){
	
	case 95001:
		$(id).val('Send Approval Request');
		break;
	case 95002:
		//alert('in case 95002');
		$(id).val('Send Approval Reminder');
		break;
	case 95003:
		$(id).hide();
		break;
	case 95004:
		$(id).val('Resend Approval Request');
		break;	
	default:	
		$(id).val('Send Approval Request');
		//buttonAction='<input type="button" value="Send Approval Request" id="button'+i+'"/>';
	}
	
}

/* function enableInputs(i){
//	alert(i);
	$('.'+i).removeAttr('disabled');
	
} */
function addRows(){
	
	
	var i=proposedCount;
	i++;
	var buttonAction =setAction(95001,i);
	//setAction(95001,i);
	
	$('#proposedInvestmentTable').append('<tr id="row'+i+'"><td><input id="'+i+'" class="checkBox '+i+'"  type="checkbox"/></td><td>'
			+'<select style="width:150px; !important" class="productList '+i+'" id="productList'+i+'">'
			+selectProducts+'</select></td><td><input type="text" style="width:60px;" value="" class="allocationPercent '+i+'" id="allocationPercent'+i+'"  maxlength="10"/>'+
			'</td><td style="display:none;"><select  class="investmentTypeList '+i+'" id="investmentTypeList'+i+'" >'+selectInvestmentType+
			'</select></td><td><input type="text" style="width:100px;" value="" class="allocationAmount '+i+'" id="investmentAmount'+i+'"  maxlength="18"/></td><td><select  class="frequencyList '+i+'" id="frequencylist'+i+'">'+
			selectFrequency+'</select></td><td><select onChange="changeAction(this);" class="clientApprovalStatusList '+i+'" id="clientApprovalStatusList'+i+'">'+selectClientApproval+
			'</select></td><td>'+buttonAction+'</td></tr>');
}

/* function enableTf2(){

$("#stageType, #save1, #cancel1").show();
$('#manufacturer, #product, #scheme, #option, #investmenttype, #investmentamount, #frequency, #allocation,#manufacturer1, #product1, #scheme1, #option1, #investmenttype1, #investmentamount1').removeAttr("disabled", true);
} */

function deleteRow(){
	
	var checked=false;
	$('.checkBox').each(function(i,obj){
		if($(this).is(':checked')){
			if ($(this).is(':disabled') )
			{
				checked=false;
			}else{
				var id="#row"+$(this).attr('id');
				//alert('removing...'+id);
				$(id).remove();
				checked=true;	
			}
			
		}
		
	});
	if(!checked){
		
		bootbox.dialog({
			message: "<span class='bigger-110'>Please select atleast one row to delete</span>",
			buttons: {
				  confirm: {
					 label: "OK",
					 className: "btn-primary btn-xs",
				  }
				  
			}
			
		});
	}
		
	
	
}
function updateStatus(fpExecutionId,i){
	var ok=confirm("Do you want to send an approval request?");
	if (ok==true){
	$.ajax({
		  url: $('#contextPath').val()+"/et/updateEtClientApproval.htm?fpExecutionId="+fpExecutionId+"&fpActionPlanId="+$('#fpActionPlanId').val()+"&partyId="+$('#partyId').val(),
		  method:"post",
		  success:function(result){
				
			bootbox.dialog({
				message: "<span class='bigger-110'>You have sent approval request</span>",
				buttons: {
					  confirm: {
						 label: "OK",
						 className: "btn-primary btn-xs",
					  }
					  
				}
				
			});
		
			  $('#clientApprovalStatusList'+i).val(95002);
			  
			  }
		  });
	}
}	
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

</script>
</body>
</html>