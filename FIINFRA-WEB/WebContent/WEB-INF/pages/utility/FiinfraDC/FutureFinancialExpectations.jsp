<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Data Collection </title>
 <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
 <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>

    


<!-- -responsive css-->
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
<link href="<%=request.getContextPath()%>/css/Ffreedom_dc.css" rel="stylesheet">
<!-- -responsive css-->
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>

<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">



<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->
<script>
	
		$(document)
				.ready(
						function() {
// 							$('#dcinputname').attr('margin-left','5px');
							$('#dcinputname').append($('#dcInputUsername').val());
							
						});
		</script>
</head>
<body>
<!--css popup window start 1-->
<jsp:include page="../../common/header.jsp" />
<jsp:include page="../../common/common_popup.jsp" />
<input type="hidden" name="dcInputUsername" id="dcInputUsername" value="${sessionScope.dcInputUsername}">		
   


 	
 <!-- Center part start -->
 <section>
 

 
     
    <div class="container white">
    	<div class="container-head">
        
          <div class="col-md-12" style="text-align: right;">
          <span style="float:left; font-weight:bold;" id="dcinputname"> Data Collection for&nbsp;<i class="opportunityicon" > </i> </span>  
          <span> 
          <input class="dcbutton" type="button" value="Exit"  id="exit" onclick="redirectToOpportunity()"  name="Exit"> </span>
        </div >
      </div>
       
        <div class="container-body " style="padding:5px;">
        
        </div>
	  	<div class="container-body">
      <div class="col-md-12">
       <div class="col-md-3" style="padding-left:10px;"><img src="<%=request.getContextPath()%>/images/futuref.jpg"></div>
      <div class="col-md-6 dchead " style="padding-left:10px;">DATA COLLECTION </div> 
    <div class="col-md-3" style="text-align:right;"> <img src="<%=request.getContextPath()%>/images/goalreadiness.gif"></div>
      </div>
      
        <!-- center -->
     
      <jsp:include page="sidebar.jsp">
		<jsp:param name="param1" value="futurefinancialepectations" />
	</jsp:include>
        <div class="col-md-9"  style="margin-top:10px; padding-left:10px;"  >
			
 <!-- center -->
        
         <div class="list-group">
        		<a class="list-group-item active" href="#">Future Financial Expectations</a>
                <!-- accordion start-->
           <!-- accordion  END -->
           <!-- accordion End -->
                
           <div class="list-group-item">
       
   	


		<div class="row"><img src="<%=request.getContextPath()%>/images/futurefe.png" class="img-responsive">
		  <!-- About You Start-->
        <!-- About You Start-->
<div class="panel panel-default" style="margin-top:10px;">
           
          <div class="panel-body">Enter in the below fields the various Financial Goals,  									Aspirations and Commitment that you foresee in the next 15-20  									years</div>                                      
          </div>
          <!-- end-->
           <div class="panel panel-default" style="margin-top:10px;">
        
          <div class="panel-heading"><a id="extendedfamily"></a>Details</div>
          <div class="panel-body">
            <div class=" table-responsive">	
            
          <table class="table table-striped" cellpadding="2" cellspacing="2" id="goalTable">
                    
                    
                </table>
                <form id="goalDataForm" method="post" action="<%=request.getContextPath()%>/dc/saveDCFutureFinancialExpectations.htm">
                	<input type="hidden" name="goalDataXml" id="goalDataXml">
                </form>
          </div> 
         	
                	
                	
            </div>                                      
          </div>
          <!-- end-->
           <div class="topmenu">           
 <input class="btn dbtn" type="button" value="Save" name="Save" onclick="saveGoals(0)"> 

    <a onclick="redirectDcInput()"> <input class="btn dbtn" type="button" value="Cancel" name="Cancel"> </a>
      <a >  
      <input class="btn dbtn" type="button" value="Next" name="Next" onclick="saveGoals(1)">     </a>      
        </div> 	
        </div>
       
        
        
    </div>
</div>
</div></div>      	<br/><br/>
       	</div>
</div>
      
<!-- Center part End -->          

<jsp:include page="../../common/footer.jsp" />
<script>
var goalTypeList;
var goalTypeSelect='';
function addnew(){

$("#new1, #d11").show();
$("#new1,#new2,#new3").addClass("form-control")
$("#child1,#a2,#new1,#new2,#new3").removeClass("none")
}

function updateGoalDescription(obj){
	var id=$(obj).closest("td").attr('id');
	id=id.substring(id.indexOf('goalTypeTd')+10);
	$('#goalDescription'+id).val($('option:selected', $(obj)).text()=='--Select--'?'':$('option:selected', $(obj)).text());
	
}
function pageReady(){
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=35',
		success : function(result) {
// 			$('#goalTypeId').append('<option value="0">--Select--</option>');
			goalTypeSelect='<select name="goalTypeId" onchange="updateGoalDescription(this)" class="form-control" style="width:100px;">';
			goalTypeSelect+='<option value="0">--Select--</option>';
			goalTypeList=result;
			$(result).each(function(i,obj) {
				var codeTypeId=obj.codeTypeId;
				var codeValue=obj.codeValue;
				var codevalueId=obj.codeValueId;
				if(codeTypeId==35){
					goalTypeSelect+='<option value="'+codevalueId+'">'+codeValue+'</option>';
				}
			});
			goalTypeSelect+="</select>";
			
// 			<a href="#" onClick="addnew();" alt="Add Manufacturers" title="Add Manufacturers">
//             <span id="a2" class="none"><i class="addicon" style="display: inline;">  </i></span></a>
			var lastTdId=0;
			var maxId=0;
			$.ajax({
				type : "POST",
				url : $('#contextPath').val()+'/dc/getDCFutureFinancialExpectationsDetails.htm',
				success : function(result) {
					$('#goalTable').empty();
					$('#goalTable').append('<tr><td width="15%"><strong>Goal Type</strong></td><td width="17%"><strong>Goal/Commitment</strong></td><td width="17%"><strong>Goal Year</strong></td><td width="30%"><strong>Today\'s Cost</strong></td><td width="6%">&nbsp;</td></tr>');
					$(result).each(function(i,obj) {
						var goalTypeId=obj.goalTypeId;
						var goalDescription=obj.goalDescription;
						var goalEndYear=obj.goalEndYear;
						var goalAmountPv=obj.goalAmountPv;
						var goalFamilyPartyId=obj.goalFamilyPartyId;
// 						alert(goalTypeId+'--'+goalDescription+'--'+goalEndYear+'--'+goalAmountPv+'--'+goalFamilyPartyId)
						$('#goalTable').append('<tr id="goaltr'+(i+1)+'" name="goaltr"><td id="goalTypeTd'+(i+1)+'">'+goalTypeSelect+'</td><td><input name="goalDescription" class="form-control  pull-left" type="text" id="goalDescription'+(i+1)+'"  value="'+goalDescription+'" width="100px !important;" /></td><td><input name="goalEndYear" class="form-control  pull-left" type="text" id="goalEndYear'+(i+1)+'"  value="'+goalEndYear+'" width="100px !important;" /></td><td><input name="goalAmountPv" class="form-control  pull-left" type="text" id="goalAmountPv'+(i+1)+'"  value="'+goalAmountPv+'" width="100px !important;" onkeyup="test_skill(id)"/><br><span class="amountinword" id="goalAmountPv'+(i+1)+'moneyText"></span></td><td id="goalTd'+(i+1)+'">&nbsp;</td></tr>');
						lastTdId='goalTd'+(i+1);
						maxId=(i+1);
                    	$('#goalTypeTd'+(i+1)+' select').val(goalTypeId);
					});
					if(result.length==0){
						var i=0;
						var i=result.length;
						while(i<3){
							lastTdId='goalTd'+(i+1);
							maxId=(i+1);
							$('#goalTable').append('<tr id="goaltr'+(i+1)+'" name="goaltr"><td id="goalTypeTd'+(i+1)+'">'+goalTypeSelect+'</td><td><input name="goalDescription" class="form-control  pull-left" type="text" id="goalDescription'+(i+1)+'"  width="100px !important;" /></td><td><input name="goalEndYear" class="form-control  pull-left" type="text" id="goalEndYear'+(i+1)+'"   width="100px !important;" /></td><td><input name="goalAmountPv" class="form-control  pull-left" type="text" id="goalAmountPv'+(i+1)+'"   width="100px !important;" onkeyup="test_skill(id)"/><br><span class="amountinword" id="goalAmountPv'+(i+1)+'moneyText"></span></td><td id="goalTd'+(i+1)+'">&nbsp;</td></tr>');
							i+=1;
						}
						$('#'+lastTdId).html('<a  onClick="addNewGoal(\'goalTd'+maxId+'\');" alt="Add Manufacturers" title="Add Manufacturers"><span id="a2" ><i class="addicon" style="display: inline;">  </i></span></a>');
					}else if(result.length<3){
						var i=result.length;
						while(i<3){
							lastTdId='goalTd'+(i+1);
							maxId=(i+1);
							$('#goalTable').append('<tr id="goaltr'+(i+1)+'" name="goaltr"><td id="goalTypeTd'+(i+1)+'">'+goalTypeSelect+'</td><td><input name="goalDescription" class="form-control  pull-left" type="text" id="goalDescription'+(i+1)+'"   width="100px !important;" /></td><td><input name="goalEndYear" class="form-control  pull-left" type="text" id="goalEndYear'+(i+1)+'"   width="100px !important;" /></td><td><input name="goalAmountPv" class="form-control  pull-left" type="text" id="goalAmountPv'+(i+1)+'"   width="100px !important;" onkeyup="test_skill(id)"/><br><span class="amountinword" id="goalAmountPv'+(i+1)+'moneyText"></span></td><td id="goalTd'+(i+1)+'">&nbsp;</td></tr>');
							i+=1;
						}
						$('#'+lastTdId).html('<a  onClick="addNewGoal(\'goalTd'+maxId+'\');" alt="Add Manufacturers" title="Add Manufacturers"><span id="a2" ><i class="addicon" style="display: inline;">  </i></span></a>');
					}else{
						$('#'+lastTdId).html('<a  onClick="addNewGoal(\'goalTd'+maxId+'\');" alt="Add Manufacturers" title="Add Manufacturers"><span id="a2" ><i class="addicon" style="display: inline;">  </i></span></a>');
					}
					
					$('#goalTable input[name="goalAmountPv"]').each(function() {
						$(this).attr('onkeydown','allowIntegersOnly(id,event)');
					});
					$('#goalTable input[name="goalEndYear"]').each(function() {
						$(this).attr('onkeydown','allowIntegersOnly(id,event)');
					});
					$('#goalTable input[name="goalAmountPv"]').each(function() {
						$(this).attr('maxlength','16');
					});
					$('#goalTable input[name="goalEndYear"]').each(function() {
						$(this).attr('maxlength','4');
					});
				}
			});
		}});
}

$(function() {
	pageReady();
});

function addNewGoal(id){
	$('#'+id).html('&nbsp;');
	var maxId=parseInt(id.substring(id.indexOf('goalTd')+6));
	maxId+=1;
	$('#goalTable').append('<tr id="goaltr'+maxId+'" name="goaltr"><td id="goalTypeTd'+maxId+'">'+goalTypeSelect+'</td><td><input name="goalDescription" class="form-control  pull-left" type="text" id="goalDescription'+maxId+'"   width="100px !important;" /></td><td><input name="goalEndYear" class="form-control  pull-left" type="text" id="goalEndYear'+maxId+'"   width="100px !important;" /></td><td><input name="goalAmountPv" class="form-control  pull-left" type="text" id="goalAmountPv'+maxId+'"   width="100px !important;" onkeyup="test_skill(id)"/><br><span class="amountinword" id="goalAmountPv'+maxId+'moneyText"></span></td><td id="goalTd'+maxId+'"><a  onClick="addNewGoal(\'goalTd'+maxId+'\');" alt="Add Manufacturers" title="Add Manufacturers"><span id="a2" ><i class="addicon" style="display: inline;">  </i></span></a></td></tr>');
	$('#goalTable input[name="goalAmountPv"]').each(function() {
		$(this).attr('onkeydown','allowIntegersOnly(id,event)');
	});
	$('#goalTable input[name="goalEndYear"]').each(function() {
		$(this).attr('onkeydown','allowIntegersOnly(id,event)');
	});
	$('#goalTable input[name="goalAmountPv"]').each(function() {
		$(this).attr('maxlength','16');
	});
	$('#goalTable input[name="goalEndYear"]').each(function() {
		$(this).attr('maxlength','4');
	});
}

function saveGoals(isNext){
	var goalDataXml='<Root>';
	var isValidated=true;
	
	$('tr[name="goaltr"]').each(function(i,obj) {
		var isValidRow=true;
		var id=$(obj).attr('id');
		var goalTypeId=$('#'+id+' select[name="goalTypeId"]').val();
		var goalDescription=$('#'+id+' input[name="goalDescription"]').val();
		var goalEndYear=$('#'+id+' input[name="goalEndYear"]').val();
		var goalAmountPv=$('#'+id+' input[name="goalAmountPv"]').val();
		if(goalTypeId!=0 || goalDescription!='' || goalEndYear!='' || goalAmountPv!=''){
			isValidRow=validateRow(obj);
			if(isValidRow==false){
				isValidated=isValidRow;
			}
			if(goalTypeId!=0 && goalDescription!='' && goalEndYear!='' && goalAmountPv!='' && isValidRow==true){
				goalDataXml+='<Goal>';
				goalDataXml+='<GoalDescription><![CDATA['+goalDescription+']]></GoalDescription>';
				goalDataXml+='<GoalEndYear><![CDATA['+goalEndYear+']]></GoalEndYear>';
				goalDataXml+='<GoalAmountPv><![CDATA['+goalAmountPv+']]></GoalAmountPv>';
				goalDataXml+='<GoalTypeId><![CDATA['+goalTypeId+']]></GoalTypeId>';
				goalDataXml+='<GoalFamilyPartyID>0</GoalFamilyPartyID>';
				goalDataXml+='<GoalStartYear><![CDATA['+goalEndYear+']]></GoalStartYear>';
				goalDataXml+='<IsLoan>0</IsLoan>';
				goalDataXml+='<LoanAmount>0</LoanAmount>';
				goalDataXml+='<LoanDownPayment>0</LoanDownPayment>';
				goalDataXml+='<LoanInterestPercentage>0</LoanInterestPercentage>';
				goalDataXml+='<LoanDurationYears>0</LoanDurationYears>';
				goalDataXml+='<GoalName><![CDATA['+goalDescription+']]></GoalName>';
				goalDataXml+='</Goal>';
			}
		}
	})
	goalDataXml+='</Root>';
	if(isValidated==true){
		$('#goalDataXml').val(goalDataXml);
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/dc/saveDCFutureFinancialExpectations.htm',
			data:$('#goalDataForm').serialize(),
			success : function(result) {
				if(result>=1){
					
					if(isNext==1){
            			localStorage.setItem('actionName',$('#contextPath').val()+'/DCHomeFiinfra.htm');
//             			showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", redirectFunction);
			redirectFurther();
            		}else{
            			showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", pageReady);
            		}
				}else{
					showAlertMessage("Error",
							"The connection to the server has been lost. Please try again later.",
							"error", doNothing);
				}
			}
		});
	}else{
		showAlertMessage("Error",
				"There are some validation errors on the page please check to proceed further.",
				"error", doNothing);
	}
}

function validateRow(obj){
	var isvalidRow=true;
	var id=$(obj).attr('id');
	var goalTypeId=$('#'+id+' select[name="goalTypeId"]').val();
	var goalDescription=$('#'+id+' input[name="goalDescription"]').val();
	var goalEndYear=$('#'+id+' input[name="goalEndYear"]').val();
	var goalAmountPv=$('#'+id+' input[name="goalAmountPv"]').val();
	var currentyear=new Date().getFullYear();
	if(goalTypeId==0){
		$('#'+id+' select[name="goalTypeId"]').css('border-color','red');
		$('#'+id+' select[name="goalTypeId"]').attr('title', 'Please select Goal Type.');
		isvalidRow=false;
	}else{
		$('#'+id+' select[name="goalTypeId"]').css('border-color','grey');
		$('#'+id+' select[name="goalTypeId"]').removeAttr('title');
	}
	if(goalDescription==''){
		$('#'+id+' input[name="goalDescription"]').css('border-color','red');
		$('#'+id+' input[name="goalDescription"]').attr('title', 'Please Enter Goal Description.');
		isvalidRow=false;
	}else{
		$('#'+id+' input[name="goalDescription"]').css('border-color','grey');
		$('#'+id+' input[name="goalDescription"]').removeAttr('title');
	}
	if(goalEndYear==''){
		$('#'+id+' input[name="goalEndYear"]').css('border-color','red');
		$('#'+id+' input[name="goalEndYear"]').attr('title', 'Please Enter Goal Year.');
		isvalidRow=false;
	}else if(goalEndYear<currentyear){
		$('#'+id+' input[name="goalEndYear"]').css('border-color','red');
		$('#'+id+' input[name="goalEndYear"]').attr('title', 'Goal Year can not be past year.');
		isvalidRow=false;
	}else if(goalEndYear>currentyear+100){
		$('#'+id+' input[name="goalEndYear"]').css('border-color','red');
		$('#'+id+' input[name="goalEndYear"]').attr('title', 'Goal Year can not be after 100 years.');
		isvalidRow=false;
	}else{
		$('#'+id+' input[name="goalEndYear"]').css('border-color','grey');
		$('#'+id+' input[name="goalEndYear"]').removeAttr('title');
	}
	if(goalAmountPv==''){
		$('#'+id+' input[name="goalAmountPv"]').css('border-color','red');
		$('#'+id+' input[name="goalAmountPv"]').attr('title', 'Please Enter Goal Cost.');
		isvalidRow=false;
	}else{
		$('#'+id+' input[name="goalAmountPv"]').css('border-color','grey');
		$('#'+id+' input[name="goalAmountPv"]').removeAttr('title');
	}
	
	return isvalidRow;
}


</script>
</body>
</html>