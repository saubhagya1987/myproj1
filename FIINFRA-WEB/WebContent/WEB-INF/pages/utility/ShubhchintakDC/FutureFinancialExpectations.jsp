<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Financial Plan </title>
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
    <!--<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>
-->
    


<!-- -responsive css-->
<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
--><link href="<%=request.getContextPath()%>/css/Axis_dc.css" rel="stylesheet">
<!-- -responsive css-->
	<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>

<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
-->


<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->
	<style>
	.pointer{
	
	}
	</style>

</head>
<body>
<!--css popup window start 1-->
<jsp:include page="../../common/header.jsp" />
<jsp:include page="../../common/common_popup.jsp" />
	<input type="hidden" name="dcInputUsername" id="dcInputUsername" value="${sessionScope.dcInputUsername}">	
   <input type="hidden" name="dcInputDocId_AnalysisReport" id="dcInputDocId_AnalysisReport" value="${sessionScope.dcInputDocId_AnalysisReport}">

 <input type="hidden" name="inflationRate_DcInput" id="inflationRate_DcInput" value="${sessionScope.inflationRate_DcInput}">
 <input type="hidden" name="redirectToPage" id="redirectToPage" value="${sessionScope.redirectToClient}">
 	
 <!-- Center part start -->
 <section>
 

 
     
    <div class="container">
    	<div class="container-head">
        
          <div class="col-md-12" style="text-align: right;">
          <span style="float:left; font-weight:bold;" id="dcinputname"> Financial Plan for&nbsp;<i class="opportunityicon"  style="cursor: pointer;"> </i> </span>  
          <span> 
          <input class="dcbutton" type="button" value="Exit"  id="exit" onclick="redirectToOpportunity()"  name="Exit"> </span>
        </div >
      </div >
       
        <div class="container-body " style="padding:5px;">
        
        </div>
	  	<div class="container-body">
      <div class="col-md-12">
       <div class="col-md-3" style="padding-left:10px;"><img src="<%=request.getContextPath()%>/images/${sessionScope.userSession.themeName}/futuref.jpg"></div>
      <div class="col-md-6 dchead " style="padding-left:10px;">FINANCIAL PLAN</div> 
    <div class="col-md-3" style="text-align:right;"> <img src="<%=request.getContextPath()%>/images/${sessionScope.userSession.themeName}/goalreadiness.gif"></div>
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
       
   	


		<div class="row"><img src="<%=request.getContextPath()%>/images/${sessionScope.userSession.themeName}/futurefe.png" class="img-responsive">
		  <!-- About You Start-->
        <!-- About You Start-->
<div class="panel panel-default" style="margin-top:10px;">
           
          <div class="panel-body">Enter in the below fields the various Financial Goals,  									Aspirations and Commitment that you foresee in the next 15-20  									years</div>                                      
          </div>
          <!-- end-->
           <div class="panel panel-default" style="margin-top:10px;">
        
        <div class="widget-header"><a id="extendedfamily"></a>
          <h5 class="widget-title">Details</h5>
        </div>
<!--           <div class="panel-heading"><a id="extendedfamily"></a>Details</div> -->
          <div class="panel-body">
            <div class=" table-responsive">	
            
          <table class="table table-striped" cellpadding="2" cellspacing="2" id="goalTable">
                    
                    
                </table>
                <form id="goalDataForm" method="post" action="<%=request.getContextPath()%>/dc/saveDCFutureFinancialExpectations.htm">
                	<input type="hidden" name="goalDataXml" id="goalDataXml">
                </form>
          </div> 
         	
                	
             <span style="font-weight: bold;">&nbsp;&nbsp;&nbsp;Note:- Do not add a retirement planning goal, as it has been taken up as by default goal.</span>   	
            </div>                                      
          </div>
          <!-- end-->
            <div class="topmenu pull-right">  
            	<button class="btn-primary btn btn-xs" type="button" id="Save" name="Save" onclick="saveGoals(0)">Save</button>         
				<button class="btn-primary btn btn-xs" type="button" name="Cancel" onclick="redirectDcInput()">Cancel</button>
		 		<button class="btn-primary btn btn-xs" type="button" id="Next" name="Next" onclick="saveGoals(1)">Next</button>        
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

$(document)
.ready(
		function() {
//				$('#dcinputname').attr('margin-left','5px');
			$('#dcinputname').append($('#dcInputUsername').val());
			
		});

var goalTypeList;
var goalTypeSelect='';
var familyMemberSelect='';
var goalMonth='';
var goalPriority='';
function addnew(){

$("#new1, #d11").show();
$("#new1,#new2,#new3").addClass("form-control")
$("#child1,#a2,#new1,#new2,#new3").removeClass("none")
}

function updateGoalDescription(obj){
	var id=$(obj).closest("td").attr('id');
	id=id.substring(id.indexOf('goalTypeTd')+10);
	$('#goalDescription'+id).val($('option:selected', $(obj)).text()=='--Select--'?'':$('option:selected', $(obj)).text());
	var selected = $('option:selected', $(obj)).val();
	if(selected != 35016) {
		$('#isAsset'+id).prop( "checked", false );
		$("#isAsset"+id).hide();
	} else {
		$('#isAsset'+id).prop( "checked", false );
		$("#isAsset"+id).show();
		
	}
}

function pageReady(){
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()
				+ '/dc/getFamilyMemberList.htm',
				success : function(result) {
					familyMemberSelect='<select name="goalGFmilyMemberPartyId" class="form-control" style="width:100px;">';
					familyMemberSelect+='<option value="0">--Select--</option>';
					$(result).each(function(i,obj) {
						familyMemberSelect+='<option value="'+obj.partyId+'">'+obj.name+'</option>';
					});
					familyMemberSelect+="</select>";
				
	
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=35,36',
		success : function(result) {
// 			$('#goalTypeId').append('<option value="0">--Select--</option>');
			goalTypeSelect='<select name="goalTypeId" onchange="updateGoalDescription(this)" class="form-control" style="width:100px;">';
			goalTypeSelect+='<option value="0">--Select--</option>';
			goalPriority='<select name="goalPriorityId"  class="form-control" style="width:100px;">';
			goalPriority+='<option value="0">--Select--</option>';
			
			goalTypeList=result;
			$(result).each(function(i,obj) {
				var codeTypeId=obj.codeTypeId;
				var codeValue=obj.codeValue;
				var codevalueId=obj.codeValueId;
				if(codeTypeId==35){
					goalTypeSelect+='<option value="'+codevalueId+'">'+codeValue+'</option>';
				}
				else if(codeTypeId==36)
					{
					goalPriority+='<option value="'+codevalueId+'">'+codeValue+'</option>';
					}
			});
			goalTypeSelect+="</select>";
			goalPriority+="</select>";
			goalMonthSelect='<select name="goalMonth" class="form-control  pull-left"  id="goalMonth'+(i+1)+'"   width="100px !important;" >';
			goalMonthSelect+='<option value="0">--Select--</option>';
			for (var i=1;i<=12;i++)
				{
				if(i==1)
				goalMonthSelect+='<option value="'+i+'">January</option>';	
				else if(i==2)
				goalMonthSelect+='<option value="'+i+'">February</option>';
				else if(i==3)
				goalMonthSelect+='<option value="'+i+'">March</option>';
				else if(i==4)
				goalMonthSelect+='<option value="'+i+'">April</option>';
				else if(i==5)
				goalMonthSelect+='<option value="'+i+'">May</option>';
				else if(i==6)
				goalMonthSelect+='<option value="'+i+'">June</option>';
				else if(i==7)
				goalMonthSelect+='<option value="'+i+'">July</option>';
				else if(i==8)
				goalMonthSelect+='<option value="'+i+'">August</option>';
				else if(i==9)
				goalMonthSelect+='<option value="'+i+'">September</option>';
				else if(i==10)
				goalMonthSelect+='<option value="'+i+'">October</option>';
				else if(i==11)
				goalMonthSelect+='<option value="'+i+'">November</option>';
				else if(i==12)
				goalMonthSelect+='<option value="'+i+'">December</option>';	
				}
			
			goalMonthSelect+="</select>";
			
// 			<a href="#" onClick="addnew();" alt="Add Goal" title="Add Goal">
//             <span id="a2" class="none"><i class="addicon" style="display: inline;">  </i></span></a>
			var lastTdId=0;
			var maxId=0;
			var goalInflationRate;
			var isToAllocateAsset;
			$.ajax({
				type : "POST",
				url : $('#contextPath').val()+'/dc/getDCFutureFinancialExpectationsDetails.htm',
				success : function(result) {
					$('#goalTable').empty();
					$('#goalTable').append('<tr><td width="10%"><strong>Goal Type</strong></td><td width="10%"><strong>Goal For</strong></td><td width="10%"><strong>Goal/Commitment</strong></td><td width="17%"><strong>Goal Month</strong></td><td width="15%"><strong>Goal Year</strong></td><td width="10%"><strong>Today\'s Cost(*)</strong></td><td width="10"><strong>Inflation Rate(%)</strong></td><td width="7%"><strong>Priority</strong></td><td width="7%">&nbsp;</td></tr>');
					$(result).each(function(i,obj) {
						var goalTypeId=obj.goalTypeId;
						var goalDescription=obj.goalDescription;
						var goalEndYear=obj.goalEndYear;
						var goalAmountPv=obj.goalAmountPv;
						var goalFamilyPartyId=obj.goalFamilyPartyId;
						var goalMonth = obj.goalMonth;
						isToAllocateAsset = obj.isAllocateAsset;
						goalInflationRate =obj.goalInflationRate;
						if(goalInflationRate=='' || goalInflationRate ==null)
							{
							goalInflationRate=$('#inflationRate_DcInput').val();
							}
						//alert('in iterating Data');
// 						alert(goalTypeId+'--'+goalDescription+'--'+goalEndYear+'--'+goalAmountPv+'--'+goalFamilyPartyId)
						//alert('result length='+result.length)
						if(maxId==0)
						{
							$('#goalTable').append('<tr id="goaltr'+(i+1)+'" name="goaltr"><td id="goalTypeTd'+(i+1)+'">'+goalTypeSelect+'</td><td id="goalFamilyPartyId'+(i+1)+'">'+familyMemberSelect+'</td><td><input name="goalDescription" class="form-control  pull-left" type="text" id="goalDescription'+(i+1)+'"  value="'+goalDescription+'" width="100px !important;" /></td><td id="goalMonth'+(i+1)+'">'+goalMonthSelect+'</td><td><input name="goalEndYear" class="form-control  pull-left" type="text" id="goalEndYear'+(i+1)+'"  value="'+goalEndYear+'" width="100px !important;" /></td><td><input name="goalAmountPv" class="form-control  pull-left" type="text" id="goalAmountPv'+(i+1)+'"  value="'+goalAmountPv+'" width="100px !important;" onkeyup="test_skill(id)"/><br><span class="amountinword" id="goalAmountPv'+(i+1)+'moneyText"></span></td><td><input name="inflationRate" class="form-control  pull-left" type="text" id="inflationRate'+(i+1)+'" value="'+goalInflationRate+'"  maxlength="5" width="100px !important;" /></td><td id="priority'+(i+1)+'"><img src="<%=request.getContextPath()%>/images/downarrow.png" title="down" style="cursor: pointer;" class="downArrow" onclick="setPriority('+(i+1)+',\'down\')"></td><td id="goalTd'+(i+1)+'">&nbsp;</td><td><input id="isAsset'+(i+1)+'" type="checkbox"><span id="assetAllocationText'+(i+1)+'"></span></td></tr>');
						}
						else if(maxId>0 && (maxId<result.length-1 || result.length<3)){
							$('#goalTable').append('<tr id="goaltr'+(i+1)+'" name="goaltr"><td id="goalTypeTd'+(i+1)+'">'+goalTypeSelect+'</td><td id="goalFamilyPartyId'+(i+1)+'">'+familyMemberSelect+'</td><td><input name="goalDescription" class="form-control  pull-left" type="text" id="goalDescription'+(i+1)+'"  value="'+goalDescription+'" width="100px !important;" /></td><td id="goalMonth'+(i+1)+'">'+goalMonthSelect+'</td><td><input name="goalEndYear" class="form-control  pull-left" type="text" id="goalEndYear'+(i+1)+'"  value="'+goalEndYear+'" width="100px !important;" /></td><td><input name="goalAmountPv" class="form-control  pull-left" type="text" id="goalAmountPv'+(i+1)+'"  value="'+goalAmountPv+'" width="100px !important;" onkeyup="test_skill(id)"/><br><span class="amountinword" id="goalAmountPv'+(i+1)+'moneyText"></span></td><td><input name="inflationRate" class="form-control  pull-left" type="text" id="inflationRate'+(i+1)+'" value="'+goalInflationRate+'" maxlength="5"  width="100px !important;" /></td><td id="priority'+(i+1)+'"><img src="<%=request.getContextPath()%>/images/downarrow.png" title="down" class="downArrow" style="cursor: pointer;" onclick="setPriority('+(i+1)+',\'down\')"> &nbsp;<img src="<%=request.getContextPath()%>/images/uparrow.png" title="up" class="upArrow" style="cursor: pointer;" onclick="setPriority('+(i+1)+',\'up\')"></td><td id="goalTd'+(i+1)+'">&nbsp;</td><td><input id="isAsset'+(i+1)+'" type="checkbox"><span id="assetAllocationText'+(i+1)+'"></span></td></tr>');
						}
						else{
							$('#goalTable').append('<tr id="goaltr'+(i+1)+'" name="goaltr"><td id="goalTypeTd'+(i+1)+'">'+goalTypeSelect+'</td><td id="goalFamilyPartyId'+(i+1)+'">'+familyMemberSelect+'</td><td><input name="goalDescription" class="form-control  pull-left" type="text" id="goalDescription'+(i+1)+'"  value="'+goalDescription+'" width="100px !important;" /></td><td id="goalMonth'+(i+1)+'">'+goalMonthSelect+'</td><td><input name="goalEndYear" class="form-control  pull-left" type="text" id="goalEndYear'+(i+1)+'"  value="'+goalEndYear+'" width="100px !important;" /></td><td><input name="goalAmountPv" class="form-control  pull-left" type="text" id="goalAmountPv'+(i+1)+'"  value="'+goalAmountPv+'" width="100px !important;" onkeyup="test_skill(id)"/><br><span class="amountinword" id="goalAmountPv'+(i+1)+'moneyText"></span></td><td><input name="inflationRate" class="form-control  pull-left" type="text" id="inflationRate'+(i+1)+'" value="'+goalInflationRate+'" maxlength="5"  width="100px !important;" /></td><td id="priority'+(i+1)+'"><img src="<%=request.getContextPath()%>/images/uparrow.png" title="up" class="upArrow" style="cursor: pointer;" onclick="setPriority('+(i+1)+',\'up\')"></td><td id="goalTd'+(i+1)+'">&nbsp;</td><td><input id="isAsset'+(i+1)+'" type="checkbox"><span id="assetAllocationText'+(i+1)+'"></span></td></tr>');
						}
						lastTdId='goalTd'+(i+1);
						//alert('max id='+maxId)
						maxId=(i+1);
						//alert('max id='+maxId)
                    	$('#goalTypeTd'+(i+1)+' select').val(goalTypeId);
						if(goalTypeId != '35016') {
							$("#isAsset"+(i+1)).hide();
						}
                    	$('#goalFamilyPartyId'+(i+1)+' select').val(goalFamilyPartyId);
                    	$('#goalMonth'+(i+1)+' select').val(goalMonth);
                    	if(isToAllocateAsset ==1)
                    		$('#isAsset'+(i+1)).prop( "checked", true );
					});
					if(result.length==0){
						//alert('in if case result is less than 0')
						var i=0;
// 						lastTdId='goalTd1';
// 						maxId=1;
// 						$('#goalTable').append('<tr id="goaltr'+(i+1)+'" name="goaltr"><td id="goalTypeTd'+(i+1)+'">'+goalTypeSelect+'</td><td id="goalFamilyPartyId'+(i+1)+'">'+familyMemberSelect+'</td><td><input name="goalDescription" class="form-control  pull-left" type="text" id="goalDescription'+(i+1)+'"  width="100px !important;" /></td><td><input name="goalEndYear" class="form-control  pull-left" type="text" id="goalEndYear'+(i+1)+'"   width="100px !important;" /></td><td><input name="goalAmountPv" class="form-control  pull-left" type="text" id="goalAmountPv'+(i+1)+'"   width="100px !important;" onkeyup="test_skill(id)"/><br><span class="amountinword" id="goalAmountPv'+(i+1)+'moneyText"></span></td><td id="goalTd'+(i+1)+'">&nbsp;</td></tr>');
						goalInflationRate=$('#inflationRate_DcInput').val();
							var i=result.length;
							while(i<3){
								lastTdId='goalTd'+(i+1);
								maxId=(i+1);
								//alert('max id='+maxId)
								if(maxId==1){
									$('#goalTable').append('<tr id="goaltr'+(i+1)+'" name="goaltr"><td id="goalTypeTd'+(i+1)+'">'+goalTypeSelect+'</td><td id="goalFamilyPartyId'+(i+1)+'">'+familyMemberSelect+'</td><td><input name="goalDescription" class="form-control  pull-left" type="text" id="goalDescription'+(i+1)+'"  width="100px !important;" /></td><td id="goalMonth'+(i+1)+'">'+goalMonthSelect+'</td><td><input name="goalEndYear" class="form-control  pull-left" type="text" id="goalEndYear'+(i+1)+'"   width="100px !important;" /></td><td><input name="goalAmountPv" class="form-control  pull-left" type="text" id="goalAmountPv'+(i+1)+'"   width="100px !important;" onkeyup="test_skill(id)"/><br><span class="amountinword" id="goalAmountPv'+(i+1)+'moneyText"></span></td><td><input name="inflationRate" class="form-control  pull-left" type="text" maxlength="5" id="inflationRate'+(i+1)+'" value="'+goalInflationRate+'"   width="100px !important;" /></td><td id="priority'+(i+1)+'"><img src="<%=request.getContextPath()%>/images/downarrow.png" title="down" class="downArrow" style="cursor: pointer;" onclick="setPriority('+(i+1)+',\'down\')"></td><td id="goalTd'+(i+1)+'">&nbsp;</td><td><input id="isAsset'+(i+1)+'" type="checkbox" style="display:none;"><span id="assetAllocationText'+(i+1)+'"></span></td></tr>');		
								}
								else if(maxId==2)
									{

										$('#goalTable').append('<tr id="goaltr'+(i+1)+'" name="goaltr"><td id="goalTypeTd'+(i+1)+'">'+goalTypeSelect+'</td><td id="goalFamilyPartyId'+(i+1)+'">'+familyMemberSelect+'</td><td><input name="goalDescription" class="form-control  pull-left" type="text" id="goalDescription'+(i+1)+'"  width="100px !important;" /></td><td id="goalMonth'+(i+1)+'">'+goalMonthSelect+'</td><td><input name="goalEndYear" class="form-control  pull-left" type="text" id="goalEndYear'+(i+1)+'"   width="100px !important;" /></td><td><input name="goalAmountPv" class="form-control  pull-left" type="text" id="goalAmountPv'+(i+1)+'"   width="100px !important;" onkeyup="test_skill(id)"/><br><span class="amountinword" id="goalAmountPv'+(i+1)+'moneyText"></span></td><td><input name="inflationRate" class="form-control  pull-left" type="text" maxlength="5" id="inflationRate'+(i+1)+'"  value="'+goalInflationRate+'"  width="100px !important;" /></td><td id="priority'+(i+1)+'"><img src="<%=request.getContextPath()%>/images/downarrow.png" title="down" class="downArrow" style="cursor: pointer;" onclick="setPriority('+(i+1)+',\'down\')">&nbsp;<img src="<%=request.getContextPath()%>/images/uparrow.png" title="up" class="upArrow" style="cursor: pointer;" onclick="setPriority('+(i+1)+',\'up\')"></td><td id="goalTd'+(i+1)+'">&nbsp;</td><td><input id="isAsset'+(i+1)+'" type="checkbox"  style="display:none;"><span id="assetAllocationText'+(i+1)+'"></span></td></tr>');
									}
								else{
									$('#goalTable').append('<tr id="goaltr'+(i+1)+'" name="goaltr"><td id="goalTypeTd'+(i+1)+'">'+goalTypeSelect+'</td><td id="goalFamilyPartyId'+(i+1)+'">'+familyMemberSelect+'</td><td><input name="goalDescription" class="form-control  pull-left" type="text" id="goalDescription'+(i+1)+'"  width="100px !important;" /></td><td id="goalMonth'+(i+1)+'">'+goalMonthSelect+'</td><td><input name="goalEndYear" class="form-control  pull-left" type="text" id="goalEndYear'+(i+1)+'"   width="100px !important;" /></td><td><input name="goalAmountPv" class="form-control  pull-left" type="text" id="goalAmountPv'+(i+1)+'"   width="100px !important;" onkeyup="test_skill(id)"/><br><span class="amountinword" id="goalAmountPv'+(i+1)+'moneyText"></span></td><td><input name="inflationRate" class="form-control  pull-left" type="text" maxlength="5" id="inflationRate'+(i+1)+'" value="'+goalInflationRate+'"   width="100px !important;" /></td><td id="priority'+(i+1)+'"><img src="<%=request.getContextPath()%>/images/uparrow.png" title="up" class="upArrow" style="cursor: pointer;" onclick="setPriority('+(i+1)+',\'up\')"></td><td id="goalTd'+(i+1)+'">&nbsp;</td><td><input id="isAsset'+(i+1)+'" type="checkbox"  style="display:none;"><span id="assetAllocationText'+(i+1)+'"></span></td></tr>');
								}
								i+=1;
							}
						$('#'+lastTdId).html('<a  onClick="addNewGoal(\'goalTd'+maxId+'\');" alt="Add Goal" title="Add Goal"><span id="a2" ><i class="addicon" style="display: inline;">  </i></span></a>');
					}else if(result.length<3){
						//alert('in else case result is less than 3')
						var i=result.length;
						//alert('goalInflationRate='+goalInflationRate)
// 						if(goalInflationRate=='' || goalInflationRate==null)
// 							{
// 							goalInflationRate=$('#inflationRate_DcInput').val();
// 							}
						
						while(i<3){
							lastTdId='goalTd'+(i+1);
							maxId=(i+1);
							
							if(maxId!=3){
								//alert('in if result less than 3');
								$('#goalTable').append('<tr id="goaltr'+(i+1)+'" name="goaltr"><td id="goalTypeTd'+(i+1)+'">'+goalTypeSelect+'</td><td id="goalFamilyPartyId'+(i+1)+'">'+familyMemberSelect+'</td><td><input name="goalDescription" class="form-control  pull-left" type="text" id="goalDescription'+(i+1)+'"  width="100px !important;" /></td><td id="goalMonth'+(i+1)+'">'+goalMonthSelect+'</td><td><input name="goalEndYear" class="form-control  pull-left" type="text" id="goalEndYear'+(i+1)+'"   width="100px !important;" /></td><td><input name="goalAmountPv" class="form-control  pull-left" type="text" id="goalAmountPv'+(i+1)+'"   width="100px !important;" onkeyup="test_skill(id)"/><br><span class="amountinword" id="goalAmountPv'+(i+1)+'moneyText"></span></td><td><input name="inflationRate" class="form-control  pull-left" maxlength="5" type="text" id="inflationRate'+(i+1)+'" value="'+goalInflationRate+'"  width="100px !important;" /></td><td id="priority'+(i+1)+'"><img src="<%=request.getContextPath()%>/images/downarrow.png" title="down" class="downArrow" style="cursor: pointer;" onclick="setPriority('+(i+1)+',\'down\')">&nbsp;<img src="<%=request.getContextPath()%>/images/uparrow.png" title="up" class="upArrow" style="cursor: pointer;" onclick="setPriority('+(i+1)+',\'up\')"></td><td id="goalTd'+(i+1)+'">&nbsp;</td><td><input id="isAsset'+(i+1)+'" type="checkbox" style="display:none"><span id="assetAllocationText'+(i+1)+'"></span></td></tr>');
									//alert($('#goalDescription'+maxId).val())
									 if($('#goalDescription'+maxId).val()=='')
									 {
									 goalInflationRate=$('#inflationRate_DcInput').val();
									 $('#inflationRate'+maxId).val(goalInflationRate)
									 }	
									 if(isToAllocateAsset ==1)
				                    		$('#isAsset'+(i+1)).prop( "checked", true );
							}
							else{
								//alert('in else result less than 3');
								$('#goalTable').append('<tr id="goaltr'+(i+1)+'" name="goaltr"><td id="goalTypeTd'+(i+1)+'">'+goalTypeSelect+'</td><td id="goalFamilyPartyId'+(i+1)+'">'+familyMemberSelect+'</td><td><input name="goalDescription" class="form-control  pull-left" type="text" id="goalDescription'+(i+1)+'"  width="100px !important;" /></td><td id="goalMonth'+(i+1)+'">'+goalMonthSelect+'</td><td><input name="goalEndYear" class="form-control  pull-left" type="text" id="goalEndYear'+(i+1)+'"   width="100px !important;" /></td><td><input name="goalAmountPv" class="form-control  pull-left" type="text" id="goalAmountPv'+(i+1)+'"   width="100px !important;" onkeyup="test_skill(id)"/><br><span class="amountinword" id="goalAmountPv'+(i+1)+'moneyText"></span></td><td><input name="inflationRate" class="form-control  pull-left" maxlength="5" type="text" id="inflationRate'+(i+1)+'" value="'+$('#inflactionRateForNewGoal').val()+'"   width="100px !important;" /></td><td id="priority'+(i+1)+'"><img src="<%=request.getContextPath()%>/images/uparrow.png" title="up" class="upArrow" style="cursor: pointer;" onclick="setPriority('+(i+1)+',\'up\')"></td><td id="goalTd'+(i+1)+'">&nbsp;</td><td><input id="isAsset'+(i+1)+'" type="checkbox"  style="display:none;"><span id="assetAllocationText'+(i+1)+'"></span></td></tr>');
							}
							
<%-- 							$('#goalTable').append('<tr id="goaltr'+(i+1)+'" name="goaltr"><td id="goalTypeTd'+(i+1)+'">'+goalTypeSelect+'</td><td id="goalFamilyPartyId'+(i+1)+'">'+familyMemberSelect+'</td><td><input name="goalDescription" class="form-control  pull-left" type="text" id="goalDescription'+(i+1)+'"  width="100px !important;" /></td><td id="goalMonth'+(i+1)+'">'+goalMonthSelect+'</td><td><input name="goalEndYear" class="form-control  pull-left" type="text" id="goalEndYear'+(i+1)+'"   width="100px !important;" /></td><td><input name="goalAmountPv" class="form-control  pull-left" type="text" id="goalAmountPv'+(i+1)+'"   width="100px !important;" onkeyup="test_skill(id)"/><br><span class="amountinword" id="goalAmountPv'+(i+1)+'moneyText"></span></td><td><input name="inflationRate" class="form-control  pull-left" type="text" id="inflationRate'+(i+1)+'"  width="100px !important;" /></td><td id="priority'+(i+1)+'"><img src="<%=request.getContextPath()%>/images/uparrow.png" title="down"></td><td id="goalTd'+(i+1)+'">&nbsp;</td></tr>'); --%>
							i+=1;
						}
						$('#'+lastTdId).html('<a  onClick="addNewGoal(\'goalTd'+maxId+'\');" alt="Add Goal" title="Add Goal"><span id="a2" ><i class="addicon" style="display: inline;">  </i></span></a>');
					}else{
						$('#'+lastTdId).html('<a  onClick="addNewGoal(\'goalTd'+maxId+'\');" alt="Add Goal" title="Add Goal"><span id="a2" ><i class="addicon" style="display: inline;">  </i></span></a>');
					}
					$('#goalTable input[name="goalAmountPv"]').each(function() {
						$(this).attr('onkeydown','allowIntegersOnly(id,event)');
					});
					
					$('#goalTable input[name="inflationRate"]').each(function() {
						$(this).attr('onkeydown','allowOnlyDecimal1(id,event)');
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
				}});
}

$(function() {
	pageReady();
});

function addNewGoal(id){
	$('#'+id).html('&nbsp;');
	var maxId=parseInt($('#goalTable tr').length)-1;
	$('#'+id).prev('td').html('<img src="<%=request.getContextPath()%>/images/downarrow.png" title="down" class="downArrow" style="cursor: pointer;" onclick="setPriority('+maxId+',\'down\')">&nbsp;<img src="<%=request.getContextPath()%>/images/uparrow.png" title="up" class="upArrow" style="cursor: pointer;" onclick="setPriority('+maxId+',\'up\')">');
	maxId+=1;
	var goalInflationRate=$('#inflationRate_DcInput').val();
	$('#goalTable').append('<tr id="goaltr'+maxId+'" name="goaltr"><td id="goalTypeTd'+maxId+'">'+goalTypeSelect+'</td><td id="goalFamilyPartyId'+maxId+'">'+familyMemberSelect+'</td><td><input name="goalDescription" class="form-control  pull-left" type="text" id="goalDescription'+maxId+'"   width="100px !important;" /></td><td id="goalMonth'+maxId+'">'+goalMonthSelect+'</td><td><input name="goalEndYear" class="form-control  pull-left" type="text" id="goalEndYear'+maxId+'"   width="100px !important;" /></td><td><input name="goalAmountPv" class="form-control  pull-left" type="text" id="goalAmountPv'+maxId+'"   width="100px !important;" onkeyup="test_skill(id)"/><br><span class="amountinword" id="goalAmountPv'+maxId+'moneyText"></span></td><td><input name="inflationRate" class="form-control  pull-left" type="text" id="inflationRate'+maxId+'" value="'+goalInflationRate+'"  maxlength="5"  width="100px !important;" /></td><td id="priority'+maxId+'"><img src="<%=request.getContextPath()%>/images/uparrow.png" title="up" style="cursor: pointer;" onclick="setPriority('+maxId+',\'up\')"></td><td id="goalTd'+maxId+'"><a  onClick="addNewGoal(\'goalTd'+maxId+'\');" alt="Add Goal" title="Add Goal"><span id="a2" ><i class="addicon" style="display: inline;">  </i></span></a></td><td><input id="isAsset'+(maxId)+'" type="checkbox"  style="display:none;"></td></tr>');
	$('#goalTable input[name="goalAmountPv"]').each(function() {
		$(this).attr('onkeydown','allowIntegersOnly(id,event)');
	});
	$('#goalTable input[name="inflationRate"]').each(function() {
		$(this).attr('onkeydown','allowOnlyDecimal1(id,event)');
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
function setPriority(id, arrowType)
{
	 var a=id+1;
	if(arrowType=='down')
		{
			$("#goaltr"+id+" td[id^='priority']").empty();
			var goalTrId=$("#goaltr"+id).next().attr('id');
			$("#"+goalTrId+" td[id^='priority']").empty();
			var cntr=goalTrId.substring(goalTrId.indexOf('goaltr')+6);
			$("#goaltr"+id).insertAfter($("#goaltr"+id).next());
			$('#goalTd'+id).html('&nbsp;');
			$('#goalTd'+cntr).html('&nbsp;');
			
			if($('#goalTable tr:first').next().attr('id')==goalTrId){
				$("#"+goalTrId+" td[id^='priority']").append('<img src="<%=request.getContextPath()%>/images/downarrow.png" title="down" class="downArrow" style="cursor: pointer;" onclick="setPriority('+cntr+',\'down\')">');
			}else{
				$("#"+goalTrId+" td[id^='priority']").append('<img src="<%=request.getContextPath()%>/images/downarrow.png" title="down" class="downArrow" style="cursor: pointer;" onclick="setPriority('+cntr+',\'down\')">&nbsp;<img src="<%=request.getContextPath()%>/images/uparrow.png" title="up" class="upArrow" style="cursor: pointer;" onclick="setPriority('+(cntr)+',\'up\')">');
			}
			if($('#goalTable tr:last').attr('id')=='goaltr'+id){
				$("#goaltr"+id+" td[id^='priority']").append('<img src="<%=request.getContextPath()%>/images/uparrow.png" title="up" class="upArrow" style="cursor: pointer;" onclick="setPriority('+(id)+',\'up\')">');
				$('#goalTd'+id).html('<a  onClick="addNewGoal(\'goalTd'+id+'\');" alt="Add Goal" title="Add Goal"><span id="a2" ><i class="addicon" style="display: inline;">  </i></span></a>');
			}else{
				$("#goaltr"+id+" td[id^='priority']").append('<img src="<%=request.getContextPath()%>/images/downarrow.png" title="down" class="downArrow" style="cursor: pointer;" onclick="setPriority('+id+',\'down\')">&nbsp;<img src="<%=request.getContextPath()%>/images/uparrow.png" title="up" class="upArrow" style="cursor: pointer;" onclick="setPriority('+(id)+',\'up\')">');
			}
		}
	else{
	 		$("#goaltr"+id+" td[id^='priority']").empty();
			var goalTrId=$("#goaltr"+id).prev().attr('id');
			$("#"+goalTrId+" td[id^='priority']").empty();
			var cntr=goalTrId.substring(goalTrId.indexOf('goaltr')+6);
			$("#goaltr"+id).insertBefore($("#goaltr"+id).prev()); 
			
			$('#goalTd'+id).html('&nbsp;');
			$('#goalTd'+cntr).html('&nbsp;');
			
			if($('#goalTable tr:last').attr('id')==goalTrId){
				$("#"+goalTrId+" td[id^='priority']").append('<img src="<%=request.getContextPath()%>/images/uparrow.png" title="up" class="upArrow" style="cursor: pointer;" onclick="setPriority('+(cntr)+',\'up\')">');
				$('#goalTd'+cntr).html('<a  onClick="addNewGoal(\'goalTd'+cntr+'\');" alt="Add Goal" title="Add Goal"><span id="a2" ><i class="addicon" style="display: inline;">  </i></span></a>');
			}else{
				$("#"+goalTrId+" td[id^='priority']").append('<img src="<%=request.getContextPath()%>/images/downarrow.png" title="down" class="downArrow" style="cursor: pointer;" onclick="setPriority('+cntr+',\'down\')">&nbsp;<img src="<%=request.getContextPath()%>/images/uparrow.png" title="up" class="upArrow" style="cursor: pointer;" onclick="setPriority('+(cntr)+',\'up\')">');
			}
			
			if($('#goalTable tr:first').next().attr('id')=='goaltr'+id){
				$("#goaltr"+id+" td[id^='priority']").append('<img src="<%=request.getContextPath()%>/images/downarrow.png" title="down" class="downArrow" style="cursor: pointer;" onclick="setPriority('+(id)+',\'down\')">');
			}else{
				$("#goaltr"+id+" td[id^='priority']").append('<img src="<%=request.getContextPath()%>/images/downarrow.png" title="down" class="downArrow" style="cursor: pointer;" onclick="setPriority('+id+',\'down\')">&nbsp;<img src="<%=request.getContextPath()%>/images/uparrow.png" title="up" class="upArrow" style="cursor: pointer;" onclick="setPriority('+(id)+',\'up\')">');
			}
			
	}

// 	alert($('#goalTable tr:first').next().attr('id'));
// 	alert($('#goalTable tr:last').attr('id'));

}

function saveGoals(isNext){
	var goalDataXml='<Root>';
	var isValidated=true;
	var cntr=1;
	$('tr[name="goaltr"]').each(function(i,obj) {
		var isValidRow=true;
		var id=$(obj).attr('id');
		
		//alert("id="+id)
		var goalTypeId=$('#'+id+' select[name="goalTypeId"]').val();
		var goalDescription=$('#'+id+' input[name="goalDescription"]').val();
		var goalEndYear=$('#'+id+' input[name="goalEndYear"]').val();
		var goalAmountPv=$('#'+id+' input[name="goalAmountPv"]').val();
		var goalFamilyPartyID=$('#'+id+' select[name="goalGFmilyMemberPartyId"]').val();
		var goalInfletionRate = $('#'+id+' input[name="inflationRate"]').val();
		var goalMonthId = $('#'+id+' select[name="goalMonth"]').val();
		var isToAllocateAsset = $('#isAsset'+cntr).is(":checked");		
				
		if(goalTypeId!=0 || goalDescription!='' || goalEndYear!='' || goalAmountPv!='' || (goalFamilyPartyID!=0 && goalFamilyPartyID!=null && goalFamilyPartyID!='null' && goalFamilyPartyID!=undefined)){
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
				goalDataXml+='<GoalFamilyPartyID>'+goalFamilyPartyID+'</GoalFamilyPartyID>';
				goalDataXml+='<GoalStartYear><![CDATA['+goalEndYear+']]></GoalStartYear>';
				goalDataXml+='<IsLoan>0</IsLoan>';
				goalDataXml+='<LoanAmount>0</LoanAmount>';
				goalDataXml+='<LoanDownPayment>0</LoanDownPayment>';
				goalDataXml+='<LoanInterestPercentage>0</LoanInterestPercentage>';
				goalDataXml+='<LoanDurationYears>0</LoanDurationYears>';
				goalDataXml+='<GoalName><![CDATA['+goalDescription+']]></GoalName>';
				goalDataXml+='<GoalInfletionRate><![CDATA['+goalInfletionRate+']]></GoalInfletionRate>';
				goalDataXml+='<GoalMonth><![CDATA['+goalMonthId+']]></GoalMonth>';
				goalDataXml+='<GoalPriority><![CDATA['+cntr+']]></GoalPriority>';
				if(goalTypeId == 35016) {
					if(isToAllocateAsset == false)
						goalDataXml+='<IsToAllocateAsset><![CDATA['+0+']]></IsToAllocateAsset>';
					else
						goalDataXml+='<IsToAllocateAsset><![CDATA['+1+']]></IsToAllocateAsset>';
				}
				goalDataXml+='</Goal>';
				cntr=cntr+1;
			}
		}
	})
	goalDataXml+='</Root>';
	console.log('goalDataXml:--'+goalDataXml);
	if(isValidated==true){
		$('#goalDataXml').val(goalDataXml);
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/dc/saveDCFutureFinancialExpectations.htm',
			data:$('#goalDataForm').serialize(),
			success : function(result) {
				if(result>=1){
					if(isNext==1){
            			localStorage.setItem('actionName',$('#contextPath').val()+'/DCHomeShubhchintak.htm');
//             			showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", redirectFunction);
            			redirectFunction()
            		}else{
            			 var isDatacollectionChange = $('#dcInputDocId_AnalysisReport').val();
   	        		 if(isDatacollectionChange==0 || isDatacollectionChange=='0' || isDatacollectionChange==null )
   	      				{
   	      				 showAlertMessage1("Message",
   	     	        					"<br/>Data saved successfully.",
   	     	        					"confirmation", doNothing);
   	     	        		 $('.ZebraDialog').css('top','250px');
   	      				}
   	      			else{
   	      				showAlertMessage("Success", "<br/>Data saved successfully.Please click on Generate Report if you would like to see the revised Analysis Report.", "confirmation", pageReady);		
   	      			}
            			
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
function isNewAnalysisReportGenerationRequired1()
{
	var isDocIdAvailable = $('#dcInputDocId_AnalysisReport').val();
	//alert('doc id in personal info='+isDocIdAvailable);
	if(isDocIdAvailable==0 || isDocIdAvailable=='0' || isDocIdAvailable==null )
		{
		
		}
	else{
		showAlertMessage("Success", "<br/>Please click on Generate Report if you would like to see the revised Analysis Report.", "confirmation", pageReady);		
	}
}
function validateRow(obj){
	var isvalidRow=true;
	var id=$(obj).attr('id');
	var goalTypeId=$('#'+id+' select[name="goalTypeId"]').val();
	var goalDescription=$('#'+id+' input[name="goalDescription"]').val();
	var goalEndYear=$('#'+id+' input[name="goalEndYear"]').val();
	var goalAmountPv=$('#'+id+' input[name="goalAmountPv"]').val();
	var goalFamilyPartyID=$('#'+id+' select[name="goalGFmilyMemberPartyId"]').val();
	var inflationRate=$('#'+id+' input[name="inflationRate"]').val();
	var goalMonth=$('#'+id+' select[name="goalMonth"]').val();
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
	
	if((goalFamilyPartyID==0 || goalFamilyPartyID==null || goalFamilyPartyID=='null' || goalFamilyPartyID==undefined)){
		$('#'+id+' select[name="goalGFmilyMemberPartyId"]').css('border-color','red');
		$('#'+id+' select[name="goalGFmilyMemberPartyId"]').attr('title', 'Please select Goal For.');
		isvalidRow=false;
	}else{
		$('#'+id+' select[name="goalGFmilyMemberPartyId"]').css('border-color','grey');
		$('#'+id+' select[name="goalGFmilyMemberPartyId"]').removeAttr('title');
	}
	if(inflationRate==''){
		$('#'+id+' input[name="inflationRate"]').css('border-color','red');
		$('#'+id+' input[name="inflationRate"]').attr('title', 'Please Enter Inflation Rate.');
		isvalidRow=false;
	}else if(inflationRate>15){
		$('#'+id+' input[name="inflationRate"]').css('border-color','red');
		$('#'+id+' input[name="inflationRate"]').attr('title', 'Please Enter value between 0 to 15.');
		isvalidRow=false;
	}else{
		$('#'+id+' input[name="inflationRate"]').css('border-color','grey');
		$('#'+id+' input[name="inflationRate"]').removeAttr('title');
	}
// 	alert('goalMonth='+goalMonth)
// 	alert('inflationRate='+inflationRate)
	if(goalMonth==0){
		$('#'+id+' select[name="goalMonth"]').css('border-color','red');
		$('#'+id+' select[name="goalMonth"]').attr('title', 'Please select Goal Month.');
		isvalidRow=false;
	}else{
		$('#'+id+' select[name="goalMonth"]').css('border-color','grey');
		$('#'+id+' select[name="goalMonth"]').removeAttr('title');
	}
	return isvalidRow;
}
</script>
</body>
</html>
