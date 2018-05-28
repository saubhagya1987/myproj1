<!DOCTYPE html>
<html lang="en"><head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>Execution Tracker : Action</title>
 
</head>
<body>

<jsp:include page="../common/header.jsp"></jsp:include>  
 <section>
	<input type="hidden" id="fpActionPlanId" value="${param.fpActionPlanId}"/>
	<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>">
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
			<jsp:include page="executiontracker_actions.jsp"></jsp:include>
			<div class="col-md-9"  style="margin-top:0px; padding-left:10px;" >
				<div class="list-group">
  					<a class="list-group-item active" href="#">Cancel Execution </a>
  					<div class="list-group-item" style="min-height:270px;">
						<div class="row">
    						<div class="col-xs-pull-9">
                				<div class="col-xs-pull-9 searchpadding padding_top"></div>
              					<div class="col-xs-pull-12 searchpadding padding_top">
              						Current Status is <span class="label label-info">${etData.executionStatus}</span>
              					</div>
                    			<input type="hidden" id="status" value="${etData.executionStatus}"/>
  								<div class="col-xs-pull-12 " id="reason"><br>Enter Cancellation Reason.
  									<textarea id="comment" class="form-control" rows="3"></textarea>
  								</div>
  								
								<div class="col-xs-pull-12 searchpadding padding_top" style="float:right;">
									<div class="space"></div>
  								
									<button id="save1" class="btn btn-primary btn-xs dbtn" type="button" onclick="saveComment();">
										<i class="ace-icon fa fa-check bigger-110"></i>
										Confirm
									</button>
					              	<button class="btn btn-primary btn-xs dbtn" type="reset" onclick="window.history.back();">
										<i class="ace-icon fa fa-undo bigger-110"></i>
										Cancel
									</button>
            					</div>
    						</div>
						</div>
					</div>
				</div>
   	  		</div>
		</div>
	</div>
	</div>
	</div>
	</div>
</section>         

<jsp:include page="../common/footer.jsp" />
<script>
$(document).ready(function(){
	$('#cancelExecution').css('font-weight','bold');
	$('#comment').val('${etData.cancelNoteText}');
	if($('#status').val()=='Cancelled'){
		$('#save1').hide();
	}
});

function saveComment(){
	if($('#comment').val().trim()==''){
		showAlertMessage1("Warning",
				'Please enter cancel reason\n',
				"confirmation", doNothing);
		return;
}
	
	$.ajax({
		url: $('#contextPath').val()+"/et/cancelExecution.htm?fpActionPlanId="+$('#fpActionPlanId').val(),
		method:"post",
		contentType: 'application/json',
	    data:JSON.stringify($('#comment').val()),
	    dataType: 'json',
		success:function(data){
	        if(data.success!=null){
	  			showAlertMessage1("Success",data.success+'\n',"confirmation", openexecutionWindow);
	       	}else if(data.error!=null){
				showAlertMessage1("Error",data.error+'\n',"error", doNothing);
		    }
		}
	});
	
}

function openexecutionWindow(){
	window.setTimeout(10000,window.location.href=$('#contextPath').val()+'/et/getExecutionStatus.htm?fpActionPlanId='+$('#fpActionPlanId').val());
}

function enableTf2(){
	$("#stageType, #save1, #cancel1").show();	
}

function enableTf1(){
	if($('#stageType').val()=='Execution Approval Request to client'){
		$("#eproduct, #capproval").removeClass("disablelink");
		$("#sms, #sendsms").hide();	
		$("#email, #sendemail").show();
	}else{
		$("#sms,  #sendsms").show();	
		$("#email,  #sendemail").hide();
	}
	if($('#stageType').val()=='Execution Cancelled'){
		$("#reason").show();
	}
}
</script>
</body>
</html>