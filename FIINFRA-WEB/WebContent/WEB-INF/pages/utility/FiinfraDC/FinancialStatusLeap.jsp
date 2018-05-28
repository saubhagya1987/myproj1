<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html">
<html>

<head>
<meta charset='UTF-8' />


<script
	src='<%=request.getContextPath()%>/js/jquery.min.js'></script>
<script src='<%=request.getContextPath()%>/js/example.js'></script>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/jquery-ui.css" />

<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/main.css" />
<link rel='stylesheet'
	href='<%=request.getContextPath()%>/css/style.css' />

<link rel='stylesheet'
	href='<%=request.getContextPath()%>/css/Input_style.css' />

<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<style>
.output-body .cash-flow-controls ul {
	margin: 10px -1px 5px 0 !important;
}

h5 {
	font-size: 20px;
}

.did-you-know {
	height: 155px;
}
.container-head p {
text-shadow: none;
}
a{
cursor: pointer;
}
.radiolable{
margin-right: 5px;
}
.tdinp{
width: 100%;
}
.output_header{
width: 898px;
}
.output_header_subhead{
color:white;
}
table{
margin-bottom: 10px;
}
.action-buttons{
margin-right: -10px !important;
}
table tr td{
/* padding-bottom: 10px; */
padding-top: 10px;
}
#riskCoverQuestion table{
height: 30px !important;
}
#riskCoverQuestion .textfieldg{
width: 100%
}
.bold{
font-weight: bold;
}
.errorMessage1	 {
	color: red;
	font-size: 0.9em;
	margin: 4px !important;
	font-size: 18px ;
}
 .output_header{
		float:left;	
		background:url(../../images/Axis-op/output_header_newFFE.png) no-repeat top right;
		height:92px;
		width:980px;
		margin:0px  0 0 0px;
}	
</style>
<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/js/example.js"></script>
<script>
	var $ = $.noConflict();
	$(function() {
		$('#question587tr').hide();
		$('#headerTable').find('.member').hide();
		// 		$('..ui-widget-content').css('')
		// 		$("#slider").slider({
		// 			value : 0,
		// 			min : 0,
		// 			max : 100,
		// 			step : 10,
		// 			slide : function(event, ui) {
		// 				$("#amount").val(ui.value + "%");
		// 			}
		// 		});
		// 		$("#amount").val($("#slider").slider("value") + "%");
		// 		alert($('#contextPath').val());
	
		
// 		<div class="body" style="text-align: left; margin-left: 55px;">
// 		<h4>Fidelity Investments recommends how much savings you should have
// 		at different ages:</h4>
// 		<br> <h3>1.At age 35, you should have saved
// 		an amount equal to your annual salary.</h3><br> 2.At age 45, you
// 		should have saved three times your annual salary.<br> 3.At
// 		55, you should have five times your salary.<br> 4.When you
// 		retire, you should have eight times your annual pay.<br>
// 		Not more than 50% of your disposal income should go into
// 		repaying loans<br> Saving 20% of disposable income starting
// 		from an early age is a sure shot way of building wealth<br>
// 	</div>
	var showedAllCashflowTrivia=true;
	var showedAllEmergencyTrivia=true;
	var showedAllRiskTrivia=true;
	var showedAllGoalTrivia=true;
	var showedAllRetireTrivia=true;
	var showedAllDebtTrivia=true;
	var showedAllSuccessionPlanTrivia=true;
 	window.setInterval(function(){
 		//alert($('#cashflowControls').css('display'));
		if(showedAllCashflowTrivia  && $('#cashflowControls').css('display')!='none')
			{
				$('#cashflowTrivia h5#1').fadeOut(5000, function() {
				    // Animation complete.
					showedAllCashflowTrivia=false;
				  });
				$('#cashflowTrivia h5#1').fadeIn(5000, function() {
				    // Animation complete.
				    $('#cashflowTrivia h5#1').hide();
					$('#cashflowTrivia h5#2').fadeOut(10000, function() {
					    // Animation complete.
					  });
					$('#cashflowTrivia h5#2').fadeIn(5000, function() {
					    // Animation complete.
					    $('#cashflowTrivia h5#2').hide();
						$('#cashflowTrivia h5#3').fadeOut(10000, function() {
						    // Animation complete.
						  });
						$('#cashflowTrivia h5#3').fadeIn(5000, function() {
						    // Animation complete.
						    $('#cashflowTrivia h5#3').hide();
							$('#cashflowTrivia h5#4').fadeOut(10000, function() {
							    // Animation complete.
							  });
							$('#cashflowTrivia h5#4').fadeIn(5000, function() {
							    // Animation complete.
								$('#cashflowTrivia h5#4').hide();
								$('#cashflowTrivia h5#5').fadeOut(10000, function() {
								    // Animation complete.
								  });
								$('#cashflowTrivia h5#5').fadeIn(5000, function() {
								    // Animation complete.
									$('#cashflowTrivia h5#5').hide();
									$('#cashflowTrivia h5#6').fadeOut(10000, function() {
									    // Animation complete.
									  });
									$('#cashflowTrivia h5#6').fadeIn(5000, function() {
									    // Animation complete.
										$('#cashflowTrivia h5#6').hide();
										showedAllCashflowTrivia=true;
									  });
								  });
							  });
		
						  });
					  });
				  });
		
			}
		
		if(showedAllEmergencyTrivia  && $('#emergencyReady').css('display')!='none')
		{
			$('#emergencyTrivia h5#emergencyTrivia_1').fadeOut(10000, function() {
			    // Animation complete.
				showedAllEmergencyTrivia=false;
			  });
			$('#emergencyTrivia h5#emergencyTrivia_1').fadeIn(5000, function() {
			    // Animation complete.
			   $('#emergencyTrivia h5#emergencyTrivia_1').hide();
				$('#emergencyTrivia h5#emergencyTrivia_2').fadeOut(10000, function() {
				    // Animation complete.
				  });
				$('#emergencyTrivia h5#emergencyTrivia_2').fadeIn(5000, function() {
				    // Animation complete.
				    $('#emergencyTrivia h5#emergencyTrivia_2').hide();
				  //  alert(showedAllEmergencyTrivia);
				  $('#emergencyTrivia h5#emergencyTrivia_2').fadeOut(10000, function() {
				    // Animation complete.
				  });
				$('#emergencyTrivia h5#emergencyTrivia_2').fadeIn(5000, function() {
				    // Animation complete.
				    $('#emergencyTrivia h5#emergencyTrivia_2').hide();
				  //  alert(showedAllEmergencyTrivia);
				    showedAllEmergencyTrivia=true;
				  });				    
				  });
			  });
	
		}
		
		if(showedAllRiskTrivia  && $('#riskCover').css('display')!='none')
		{
			$('#riskTrivia h5#riskTrivia_1').fadeOut(10000, function() {
			    // Animation complete.
				showedAllRiskTrivia=false;
			  });
			$('#riskTrivia h5#riskTrivia_1').fadeIn(5000, function() {
			    // Animation complete.
			    $('#riskTrivia h5#riskTrivia_1').hide();
				$('#riskTrivia h5#riskTrivia_2').fadeOut(10000, function() {
				    // Animation complete.
				  });
				$('#riskTrivia h5#riskTrivia_2').fadeIn(5000, function() {
				    // Animation complete.
				    $('#riskTrivia h5#riskTrivia_2').hide();
					$('#riskTrivia h5#riskTrivia_3').fadeOut(10000, function() {
					    // Animation complete.
					  });
					$('#riskTrivia h5#riskTrivia_3').fadeIn(5000, function() {
					    // Animation complete.
					    $('#riskTrivia h5#riskTrivia_3').hide();
						$('#riskTrivia h5#riskTrivia_4').fadeOut(10000, function() {
						    // Animation complete.
						  });
						$('#riskTrivia h5#riskTrivia_4').fadeIn(5000, function() {
						    // Animation complete.
							$('#riskTrivia h5#riskTrivia_4').hide();
							$('#riskTrivia h5#riskTrivia_5').fadeOut(10000, function() {
							    // Animation complete.
							  });
							$('#riskTrivia h5#riskTrivia_5').fadeIn(5000, function() {
							    // Animation complete.
								$('#riskTrivia h5#riskTrivia_5').hide();														
									showedAllRiskTrivia=true;								 
							  });
						  });
	
					  });
				  });
			  });
	
		}
		if(showedAllGoalTrivia  && $('#goalReady').css('display')!='none')
		{
			$('#goalTrivia h5#goalTrivia_1').fadeOut(10000, function() {
			    // Animation complete.
				showedAllGoalTrivia=false;
			  });
			$('#goalTrivia h5#goalTrivia_1').fadeIn(5000, function() {
			    // Animation complete.
			    $('#goalTrivia h5#goalTrivia_1').hide();
				$('#goalTrivia h5#goalTrivia_2').fadeOut(10000, function() {
				    // Animation complete.
				  });
				$('#goalTrivia h5#goalTrivia_2').fadeIn(5000, function() {
				    // Animation complete.
				    $('#goalTrivia h5#goalTrivia_2').hide();
					$('#goalTrivia h5#goalTrivia_3').fadeOut(10000, function() {
					    // Animation complete.
					  });
					$('#goalTrivia h5#goalTrivia_3').fadeIn(5000, function() {
					    // Animation complete.
					    $('#goalTrivia h5#goalTrivia_3').hide();
					    showedAllGoalTrivia=true;
		
	
					  });
				  });
			  });
			
			
			
		}
		
		if(showedAllRetireTrivia  && $('#retirementPlan').css('display')!='none')
		{
			$('#retireTrivia h5#retireTrivia_1').fadeOut(10000, function() {
			    // Animation complete.
				showedAllRetireTrivia=false;
			  });
			$('#retireTrivia h5#retireTrivia_1').fadeIn(5000, function() {
			    // Animation complete.
			    $('#retireTrivia h5#retireTrivia_1').hide();
				$('#retireTrivia h5#retireTrivia_2').fadeOut(10000, function() {
				    // Animation complete.
				  });
				$('#retireTrivia h5#retireTrivia_2').fadeIn(5000, function() {
				    // Animation complete.
				    $('#retireTrivia h5#retireTrivia_2').hide();
					$('#retireTrivia h5#retireTrivia_3').fadeOut(10000, function() {
					    // Animation complete.
					  });
					$('#retireTrivia h5#retireTrivia_3').fadeIn(5000, function() {
					    // Animation complete.
					    $('#retireTrivia h5#retireTrivia_3').hide();
					    showedAllRetireTrivia=true;
		
	
					  });
				  });
			  });
	
		}
		
		
		if(showedAllDebtTrivia  && $('#debtFree').css('display')!='none')
		{
			$('#debtTrivia h5#debtTrivia_1').fadeOut(10000, function() {
			    // Animation complete.
				showedAllDebtTrivia=false;
			  });
			$('#debtTrivia h5#debtTrivia_1').fadeIn(5000, function() {
			    // Animation complete.
			    $('#debtTrivia h5#debtTrivia_1').hide();
				$('#debtTrivia h5#debtTrivia_2').fadeOut(10000, function() {
				    // Animation complete.
				  });
				$('#debtTrivia h5#debtTrivia_2').fadeIn(5000, function() {
				    // Animation complete.
				    $('#debtTrivia h5#debtTrivia_2').hide();
					$('#debtTrivia h5#debtTrivia_3').fadeOut(10000, function() {
					    // Animation complete.
					  });
					$('#debtTrivia h5#debtTrivia_3').fadeIn(5000, function() {
					    // Animation complete.
					    $('#debtTrivia h5#debtTrivia_3').hide();
						$('#debtTrivia h5#debtTrivia_4').fadeOut(10000, function() {
						    // Animation complete.
						  });
						$('#debtTrivia h5#debtTrivia_4').fadeIn(5000, function() {
						    // Animation complete.
						    $('#debtTrivia h5#debtTrivia_4').hide();
							showedAllDebtTrivia=true;						
						  });
	
					  });
				  });
			  });
	
		}
	
		
		if(showedAllSuccessionPlanTrivia  && $('#successionPlan').css('display')!='none')
		{
			$('#successionPlanTrivia h5#successionPlanTrivia_1').fadeOut(10000, function() {
			    // Animation complete.
				showedAllSuccessionPlanTrivia=false;
			  });
			$('#successionPlanTrivia h5#successionPlanTrivia_1').fadeIn(5000, function() {
			    // Animation complete.
			    $('#successionPlanTrivia h5#successionPlanTrivia_1').hide();
				$('#successionPlanTrivia h5#successionPlanTrivia_2').fadeOut(10000, function() {
				    // Animation complete.
				  });
				$('#successionPlanTrivia h5#successionPlanTrivia_2').fadeIn(5000, function() {
				    // Animation complete.
				    $('#successionPlanTrivia h5#successionPlanTrivia_2').hide();
					$('#successionPlanTrivia2 h5#successionPlanTrivia_3').fadeOut(10000, function() {
					    // Animation complete.
					  });
					$('#successionPlanTrivia h5#successionPlanTrivia_3').fadeIn(5000, function() {
					    // Animation complete.
					    $('#successionPlanTrivia h5#successionPlanTrivia_3').hide();											
					    showedAllSuccessionPlanTrivia=true;						

					  });
				  });
			  });
	
		}
		
 	},400);
 		 	
	});
	
	
	
</script>
<style>
.border {
	border: 1px solid !important;
	border-color: red !important;
}

.input-box-controls { /* 	background: none repeat scroll 0 0 #7F7F7F; */
	border: medium none;
	display: inline-block;
	margin-left: 4px;
	padding: 9px 5px;
	width: 246px;
	color: black !important;
}

.ui-slider-handle {
	width: 0px !important;
}

.output-body .cash-flow-controls .drop-down-controls select {
	color: white;
	margin-left: 4px;
}

a {
	margin-left: 4px;
}

.ui-widget-content {
	/* 	background: url("../../images/slider-controls.png") no-repeat left */
	/* 		center !important; */
	border: 1px solid #AAAAAA;
	color: #222222;
	height: 36px !important;
	border: none;
	width: 246px !important;
	top: 12px;
	height: 34px;
	border: none
}

.ui-widget-content {
	top: 0;
}

.slider-value {
	position: absolute;
}

.slider-controls {
	height: 32px !important;
	position: absolute;
}

.ui-slider-horizontal .ui-slider-handle {
	left: 0;
	top: 16px;
	background: none !important;
	margin-top: 5px !important;
	margin-left: 0px !important;
	border: 1px solid red !important;
}

.page-body {
	margin-top: -31px;
}

.body {
	border-bottom-right-radius: 80px;
}

.output-head {
	margin-top: -32px;
}
</style>
<title>Financial Status</title>






<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
            <script>
                document.createElement('figure');
                document.createElement('figcaption');
            </script>
        <![endif]-->

<!-- <script -->
<!-- 	src='http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js'></script> -->
<%-- <script src='<%=request.getContextPath()%>/js/example.js'></script> --%>
<script src='<%=request.getContextPath()%>/js/applyTheme.js'></script>

<!-- Function Code to Convert from Number to Words --Amruta -->
<script>
function test_skill(id) {
	
    var junkVal=$('#'+id).val();
	//alert(junkVal)
    junkVal=Math.floor(junkVal);
    var obStr=new String(junkVal);
    numReversed=obStr.split("");
    actnumber=numReversed.reverse();
 
    if(Number(junkVal) >=0){
        //do nothing
    }
    else{
    	showAlertMessage("Error",
				"Invalid Charactor,Please Enter Numeric Value.",
				"error", doNothing);
//         alert('Wrong Number cannot be converted');
        return false;
    }
    if(Number(junkVal)==0){
       // $('#'+id+'moneyText').html(obStr+''+' Rupees Zero Only');
        $('#'+id+'moneyText').html('Zero Rs. Only');
        return false;
    }
    if(actnumber.length>9){
    	actnumber.junkVal=0;
    	 $('#'+id+'moneyText').html('');
		//alert('Oops!!!! The Number is too long to covert');
        return false;
    }
 
    var iWords=["Zero", " One", " Two", " Three", " Four", " Five", " Six", " Seven", " Eight", " Nine"];
    var ePlace=['Ten', ' Eleven', ' Twelve', ' Thirteen', ' Fourteen', ' Fifteen', ' Sixteen', ' Seventeen', ' Eighteen', ' Nineteen'];
    var tensPlace=['dummy', ' Ten', ' Twenty', ' Thirty', ' Forty', ' Fifty', ' Sixty', ' Seventy', ' Eighty', ' Ninety' ];
 
    var iWordsLength=numReversed.length;
    var totalWords="";
    var inWords=new Array();
    var finalWord="";
    j=0;
    for(i=0; i<iWordsLength; i++){
        switch(i)
        {
        case 0:
            if(actnumber[i]==0 || actnumber[i+1]==1 ) {
                inWords[j]='';
            }
            else {
                inWords[j]=iWords[actnumber[i]];
            }
            inWords[j]=inWords[j]+' ';
            break;
        case 1:
            tens_complication();
            break;
        case 2:
            if(actnumber[i]==0) {
                inWords[j]='';
            }
            else if(actnumber[i-1]!=0 && actnumber[i-2]!=0) {
                inWords[j]=iWords[actnumber[i]]+' Hundred and';
            }
            else {
                inWords[j]=iWords[actnumber[i]]+' Hundred';
            }
            break;
        case 3:
            if(actnumber[i]==0 || actnumber[i+1]==1) {
                inWords[j]='';
            }
            else {
                inWords[j]=iWords[actnumber[i]];
            }
            if(actnumber[i+1] != 0 || actnumber[i] > 0){
                inWords[j]=inWords[j]+" Thousand";
            }
            break;
        case 4:
            tens_complication();
            break;
        case 5:
            if(actnumber[i]==0 || actnumber[i+1]==1) {
                inWords[j]='';
            }
            else {
                inWords[j]=iWords[actnumber[i]];
            }
            if(actnumber[i+1] != 0 || actnumber[i] > 0){
                inWords[j]=inWords[j]+" Lakh";
            }
            break;
        case 6:
            tens_complication();
            break;
        case 7:
            if(actnumber[i]==0 || actnumber[i+1]==1 ){
                inWords[j]='';
            }
            else {
                inWords[j]=iWords[actnumber[i]];
            }
            inWords[j]=inWords[j]+" Crore";
            break;
        case 8:
            tens_complication();
            break;
        default:
            break;
        }
        j++;
    }
 
    function tens_complication() {
        if(actnumber[i]==0) {
            inWords[j]='';
        }
        else if(actnumber[i]==1) {
            inWords[j]=ePlace[actnumber[i-1]];
        }
        else {
            inWords[j]=tensPlace[actnumber[i]];
        }
    }
    inWords.reverse();
    for(i=0; i<inWords.length; i++) {
        finalWord+=inWords[i];
    }
   //alert(finalWord)
    //$('#'+id+'moneyText').html(obStr+'  '+finalWord);
    $('#'+id+'moneyText').html(finalWord+'Rs.');
	
}
</script>

</head>

<body>
<%-- 	<jsp:include page="../PathFinder/PathFinderHeader.jsp" /> --%>
<input id="theme" type="hidden" name="theme" value="${sessionScope.branding.theme}" />
<input type="hidden" id="context" value="<%=request.getContextPath()%>" />
<input type="hidden" name="leadBuId1" id="leadBuId1" value="${sessionScope.buId}">
<%-- <jsp:include page="../PathFinder/NavigationLinksPF.jsp"> --%>
<%-- 		<jsp:param name="param1" value="Current Financial Status" /> --%>
<%-- 	</jsp:include> --%>
	<div class="center group">

<%-- 		<jsp:include page="SideBar.jsp" /> --%>
		<form action="" name="showPathFinderOutputPdfForm" method="post" >
				<input type="hidden" name="leadId" value="${sessionScope.leadId}">
			</form>
		<!-- 		<form name="financialStatusForm" id="financialStatusForm" action="saveleadFinancialStstus"> -->
  
  	   <div id="emergencyReady" >
   	 <div class="output-body pf-op-body" style="margin-top: 13px;width: 981px;margin-left: 241px;margin-right: 0px;">

						<div class="output_header">
                            <div class="output_header_subhead">YOUR Current Financial Status</div>
                        </div>
        <div id="mainleft" >
			<div id="emergencyQuestion">
          
          </div>
          <b class="errorMessage1" style="float: left;">* MANDATORY FIELD </b>
               <div class="action-buttons">
<!-- 							<input class="submit" type="button" -->
<!-- 								onClick="saveFinancialStstus();" value="Save" title="Save"> -->
							<!-- 							<input class="submit" type="button" onClick="openNextPage();" value="Next"> -->
<!-- 							<input class="submit" type="button" -->
<!-- 								onClick="openPreviousPage('cashflowControls','emergencyReady');" -->
<!-- 								value="Back" style="margin-right: 5px;" title="Back"> -->
								
								<input
								class="submit" type="button"
								onClick="openNextPage('riskCover','emergencyReady');"
								value="Next" title="Next">
							<!-- 						<input class="submit" type="submit" value="Cancel"> -->
						</div>
          <p>&nbsp;</p>
        </div> 
        <div id="mainright">
       <img src="<%=request.getContextPath()%>/images/Axis-op/emergency.gif" />
        </div>
        
        <br /> <br />
						<div class="pf-op-container group">
						  <div id="powerby"></div>
						 
						</div> 
						
						
					</div> <!-- output-body -->
					
		
        </div>
  
  
   <div id="cashflowControls" style="display: none;">
   	 <div class="output-body pf-op-body" style="margin-top: 13px;width: 981px;margin-left: 241px;margin-right: 0px;">

						<div class="output_header">
                            <div class="output_header_subhead">YOUR Current Financial Status</div>
                        </div>
        <div id="mainleft" >
        <table width="100%" cellpadding="1" cellspacing="1">
            	
            	<tr>
            	  <td colspan="5" class="aligncenter input_head">Do a reality check... How are you feeling about your financial situation today?<br />
            	    Not how you would like it to be, not your desired situation, but an objective assessment of what<br />
           	      you have done with your money so far? Try here...</td>
          	  </tr>
          	  </table>
          	  <br/>
          	  
			<div id="cashflowQuestions">
          
          </div>
             <b class="errorMessage1" style="float: left;">* MANDATORY FIELD </b>
               <div class="action-buttons">
<!-- 							<input class="submit" type="button" -->
<!-- 								onClick="saveFinancialStstus();" value="Save" title="Save"> -->
							<!-- 							<input class="submit" type="button" onClick="openNextPage();" value="Next"> -->
							
							
														<input class="submit" type="button"
								onClick="openPreviousPage('retirementPlan','cashflowControls');"
								value="Back" style="margin-right: 5px;" title="Back">
							
							<input
								class="submit" type="button"
								onClick="openNextPage('debtFree','cashflowControls');"
								value="Next" title="Next">
							<!-- 						<input class="submit" type="submit" value="Cancel"> -->
						</div>	
          <p>&nbsp;</p>
        </div> 
        <div id="mainright">
       		<img src="<%=request.getContextPath()%>/images/Axis-op/cash_flow.gif" />
        </div> 
        <br /> <br />
						<div class="pf-op-container group">
						  <div id="powerby"></div>
						 
						</div> 
						
						
					</div> <!-- output-body -->
					
		
        </div>
  	



	   <div id="successionPlan" style="display: none;">
   	 <div class="output-body pf-op-body" style="margin-top: 13px;width: 981px;margin-left: 241px;margin-right: 0px;">

						<div class="output_header">
                            <div class="output_header_subhead">YOUR Current Financial Status</div>
                        </div>
        <div id="mainleft" >
			<div id="successPlanQuestion">
          
          </div>
              <div class="action-buttons">
<!-- 							<input class="submit" type="button" -->
<!-- 								onClick="saveFinancialStstus();" value="Save" title="Save"> -->
							<!-- 							<input class="submit" type="button" onClick="openNextPage();" value="Next"> -->
							<input class="submit" type="button" style="margin-right: 5px;"
								onClick="openPreviousPage('debtFree','successionPlan');"
								value="Back" title="Back"> <input class="submit"
								type="button" onClick="saveFinancialStstus('yes');" value="Next"
								title="Next">
							<!-- 						<input class="submit" type="submit" value="Cancel"> -->
						</div>
          <p>&nbsp;</p>
        </div> 
        <div id="mainright">
       <img src="<%=request.getContextPath()%>/images/Axis-op/succession.gif" />
        </div>
        <br /> <br />
						<div class="pf-op-container group">
						  <div id="powerby"></div>
						 
						</div> 
						
						
					</div> <!-- output-body -->
					
		
        </div>
        
        
        
        	   <div id="debtFree" style="display: none;">
   	 <div class="output-body pf-op-body" style="margin-top: 13px;width: 981px;margin-left: 241px;margin-right: 0px;">

						<div class="output_header">
                            <div class="output_header_subhead">YOUR Current Financial Status</div>
                        </div>
        <div id="mainleft" >
			<div id="debtFreeQuestion">
          
          </div>
             <div class="action-buttons">
<!-- 							<input class="submit" type="button" -->
<!-- 								onClick="saveFinancialStstus();" value="Save" title="Save"> -->
							<!-- 							<input class="submit" type="button" onClick="openNextPage();" value="Next"> -->
							<input class="submit" type="button"
								onClick="openPreviousPage('cashflowControls','debtFree');"
								value="Back" style="margin-right: 5px;" title="Back"><input
								class="submit" type="button"
								onClick="openNextPage('successionPlan','debtFree');"
								value="Next" title="Next">
							<!-- 						<input class="submit" type="submit" value="Cancel"> -->
						</div>
          <p>&nbsp;</p>
        </div> 
        <div id="mainright">
       <img src="<%=request.getContextPath()%>/images/Axis-op/loan.gif" />
        </div>
        <br /> <br />
						<div class="pf-op-container group">
						  <div id="powerby"></div>
						 
						</div> 
						
						
					</div> <!-- output-body -->
					
		
        </div>
        
        
		        	   <div id="riskCover" style="display: none;">
   	 <div class="output-body pf-op-body" style="margin-top: 13px;width: 981px;margin-left: 241px;margin-right: 0px;">

						<div class="output_header">
                            <div class="output_header_subhead">YOUR Current Financial Status</div>
                        </div>
        <div id="mainleft" >
			<div id="riskCoverQuestion">
          
          </div>
            <div class="action-buttons">
<!-- 							<input class="submit" type="button" -->
<!-- 								onClick="saveFinancialStstus();" value="Save" title="Save"> -->
							<!-- 							<input class="submit" type="button" onClick="openNextPage();" value="Next"> -->
							<input class="submit" type="button" style="margin-right: 5px;"
								onClick="openPreviousPage('emergencyReady','riskCover');"
								value="Back" title="Back"><input class="submit"
								type="button" onClick="openNextPage('goalReady','riskCover');"
								value="Next" title="Next">
							<!-- 						<input class="submit" type="submit" value="Cancel"> -->
						</div>
          <p>&nbsp;</p>
        </div> 
        <div id="mainright">
       <img src="<%=request.getContextPath()%>/images/Axis-op/risk.gif" />
        </div>
        <br /> <br />
						<div class="pf-op-container group">
						  <div id="powerby"></div>
						 
						</div> 
						
						
					</div> <!-- output-body -->
					
		
        </div>
		
		
				        	   <div id="goalReady" style="display: none;">
   	 <div class="output-body pf-op-body" style="margin-top: 13px;width: 981px;margin-left: 241px;margin-right: 0px;">

						<div class="output_header">
                            <div class="output_header_subhead">YOUR Current Financial Status</div>
                        </div>
        <div id="mainleft" >
			<div id="goalReadyQuestion">
          
          </div>
           <div class="action-buttons">
<!-- 							<input class="submit" type="button" -->
<!-- 								onClick="saveFinancialStstus();" value="Save" title="Save"> -->
							<!-- 							<input class="submit" type="button" onClick="openNextPage();" value="Next"> -->
							<input class="submit" type="button" style="margin-right: 5px;"
								onClick="openPreviousPage('riskCover','goalReady');"
								value="Back" title="Back"><input class="submit"
								type="button"
								onClick="openNextPage('retirementPlan','goalReady');"
								value="Next" title="Next">
							<!-- 						<input class="submit" type="submit" value="Cancel"> -->
						</div>
          <p>&nbsp;</p>
        </div> 
        <div id="mainright">
       <img src="<%=request.getContextPath()%>/images/Axis-op/goal.gif" />
        </div>
        <br /> <br />
						<div class="pf-op-container group">
						  <div id="powerby"></div>
						 
						</div> 
						
						
					</div> <!-- output-body -->
					
		
        </div>
		
		
		
						        	   <div id="retirementPlan" style="display: none;">
   	 <div class="output-body pf-op-body" style="margin-top: 13px;width: 981px;margin-left: 241px;margin-right: 0px;">

						<div class="output_header">
                            <div class="output_header_subhead">YOUR Current Financial Status</div>
                        </div>
        <div id="mainleft" >
			<div id="retirementPlanQuestion">
          
          </div>
             <b class="errorMessage1" style="float: left;">* MANDATORY FIELD </b>
           <div class="action-buttons">
<!-- 							<input class="submit" type="button" -->
<!-- 								onClick="saveFinancialStstus();" value="Save" title="Save"> -->
							<!-- 							<input class="submit" type="button" onClick="openNextPage();" value="Next"> -->
							<input class="submit" type="button" style="margin-right: 5px;"
								onClick="openPreviousPage('goalReady','retirementPlan');"
								value="Back" title="Back"><input class="submit"
								type="button"
								onClick="openNextPage('cashflowControls','retirementPlan');"
								value="Next" title="Next">
							<!-- 						<input class="submit" type="submit" value="Cancel"> -->
						</div>
          <p>&nbsp;</p>
        </div> 
        <div id="mainright">
       <img src="<%=request.getContextPath()%>/images/Axis-op/retirement.gif" />
        </div>
        <br /> <br />
						<div class="pf-op-container group">
						  <div id="powerby"></div>
						 
						</div> 
						
						
					</div> <!-- output-body -->
					
		
        </div>
		
		
		



		<!-- END page-body -->
		<!-- 		</form> -->
	</div>
	<!-- END center -->



	<script>
		var questionListToIterate = new Array();
		function openNextPage(idToShow, idToHide) {
		var isTrue=saveFinancialStstus('true');
// 			alert('isTrue='+isTrue);
			if(isTrue==false){
				
			}
			else{
				$('#' + idToShow).show();
				$('#' + idToHide).hide();
			}
		}
		function openPreviousPage(idToShow, idToHide) {
			$('#' + idToShow).show();
			$('#' + idToHide).hide();
		}

		function saveFinancialStstus(next) {
// 			alert('in saveFinancialStstus');
			var isClickedNext=next;
			var isValidate = true;
			// 			alert("in save" + questionListToIterate.length)
			var xmlString = "<Root>";
// 			alert(questionListToIterate)
			$(questionListToIterate)
					.each(
							function(i, obj1) {
								// 				alert($('a[name="' + obj + '"]').html());
								$($('input[name="' + obj1 + '"]:checked'))
										.each(
												function(i, obj) {
													id = $(obj).attr('id');
													id = id
															.substring(id
																	.indexOf('option') + 6);
															alert('id='+id);
// 													if ($(obj).attr('class') == 'selected') {
														xmlString += '<Question><QuestionId>'
																+ obj1
																+ '</QuestionId>';
														xmlString += '<OptionId>'
																+ id
																+ '</OptionId>';
														xmlString += '<OptionValue></OptionValue></Question>';

// 													}
												});
								var count=1;
								$($('input[id="' + obj1 + '"]'))
										.each(
												function(i, obj) {
													id = $(obj).val();
													
													if (!isNumeric(id)) {
														isValidate = false;
														
														addCssStyles($(obj).attr('id'),
																'Please enter digits only.');
														return false;
													} 																						
													else {
																				removeCssStyles($(obj).attr('id'));
													}	
// 													if(id==598)
// 														{
														
// 															isValidate = false;
														
// 														addCssStyles($(obj).attr('id'),
// 																'Please Enter age.');
// 														return false;
// 														}
// 													else {
// 															removeCssStyles($(obj).attr('id'));
// 														}	
													xmlString += '<Question><QuestionId>'
														+ obj1
														+ '</QuestionId>';
												xmlString += '<OptionId></OptionId>';
												xmlString += '<OptionValue>'
														+ id
														+ '</OptionValue></Question>';
													
												
												});
								$($('input[id="' + obj1 + '_tf"]'))
								.each(
										function(i, obj) {
											id = $(obj).val();
										
											
												
											if (!isNumeric(id)) {
												isValidate = false;
												
												addCssStyles($(obj).attr('id'),
														'Please enter digits only.');
												return false;
											} 																						
											else {
																		removeCssStyles($(obj).attr('id'));
											}
											
										
											
											xmlString += '<Question><QuestionId>'
												+ obj1
												+ '</QuestionId>';
										xmlString += '<OptionId></OptionId>';
										xmlString += '<OptionValue>'
												+ id
												+ '</OptionValue></Question>';
										
											
										
										});
								
								
								if(obj1==595){
									var i=1;
									while(i<8){
										id=$('input[id="' + obj1 + '_'+i+'"]').val();
									
										if (!isNumeric(id)) {
											isValidate = false;
											
											addCssStyles(''+obj1 + '_'+i+'',
													'Please enter digits only.');
											return false;
										} 																						
										else {
																	removeCssStyles(''+obj1 + '_'+i+'');
										}		
										
										xmlString += '<Question><QuestionId>'
												+ obj1
												+ '</QuestionId>';
										xmlString += '<OptionId></OptionId>';
										xmlString += '<OptionValue>'
												+ id
												+ '</OptionValue></Question>';
										i=i+1;
									}
								}
								if(obj1==596){
									var i=1;
									while(i<8){
										
										id=$('input[id="' + obj1 + '_'+i+'"]').val();
										
										if (!isNumeric(id)) {
											isValidate = false;
											addCssStyles(''+obj1 + '_'+i+'',
													'Please enter digits only.');
											return false;
										} 																						
										else {
																	removeCssStyles(''+obj1 + '_'+i+'');
										}		
										xmlString += '<Question><QuestionId>'
												+ obj1
												+ '</QuestionId>';
										xmlString += '<OptionId></OptionId>';
										xmlString += '<OptionValue>'
												+ id
												+ '</OptionValue></Question>';
										i=i+1;
									}
								}
								if(obj1==601){
									try{
									var i=1;
									
									while(i<5){
// 										alert('input[id="601_'+i+'"]')
										id=$('input[id="601_'+i+'"]').val();
// 										alert('id='+id)
										if (!isNumeric(id)) {
											isValidate = false;
											addCssStyles('601_'+i,
													'Please enter digits only.');
											return false;
										} 																						
										else {
																	removeCssStyles('601_'+i);
										}		
										
										xmlString += '<Question><QuestionId>'
												+ obj1
												+ '</QuestionId>';
										xmlString += '<OptionId></OptionId>';
										xmlString += '<OptionValue>'
												+ id
												+ '</OptionValue></Question>';
										i=i+1;
									}
									}catch(e)
									{
										alert(e)
									}
								}
								
								if(obj1==623){
									try{
									var i=1;
									while(i<5){
// 										alert('input[id="623_'+i+'"]')
										id=$('input[id="623_'+i+'"]').val();
// 										alert('id='+id)
// 										alert('id='+id)
										if (!isNumeric(id)) {
											isValidate = false;
											addCssStyles('623_'+i,
													'Please enter digits only.');
											return false;
										} 																						
										else {
																	removeCssStyles('623_'+i);
										}		
										xmlString += '<Question><QuestionId>'
												+ obj1
												+ '</QuestionId>';
										xmlString += '<OptionId></OptionId>';
										xmlString += '<OptionValue>'
												+ id
												+ '</OptionValue></Question>';
										i=i+1;
									}
									}catch(e)
									{
										alert(e)
									}
								}
								
								 
									  
// 								  alert('value='+value);
								  
								  
// 								    alert('radioValue='+radioValue);
// 									if(value=="")
// 										{
// 											alert('please fill mandetory fields');
// 										}
								
// 								if(obj1==602){
// 									var i=1;
// 									while(i<10){
// 										id=$('input[id="' + obj1 + '_'+i+'"]').val();
// 										if (!isNumeric(id)) {
// 											isValidate = false;
// 											addCssStyles(''+obj1 + '_'+i+'',
// 													'Please enter digits only.');
// 										} 																						
// 										else {
// 																	removeCssStyles(''+obj1 + '_'+i+'');
// 										}		
										
// 										xmlString += '<Question><QuestionId>'
// 												+ obj1
// 												+ '</QuestionId>';
// 										xmlString += '<OptionId></OptionId>';
// 										xmlString += '<OptionValue>'
// 												+ id
// 												+ '</OptionValue></Question>';
// 										i=i+1;
// 									}
// 								}
								
								$($('select[name="' + obj1 + '"] :selected'))
										.each(
												function(i, obj) {
													id = $(obj).val();
													// 													alert(arg)
													if ($(
															'select[name="'
																	+ obj1
																	+ '"]')
															.attr('multiple') == 'multiple') {
														xmlString += '<Question><QuestionId>'
																+ obj1
																+ '</QuestionId>';
														xmlString += '<OptionId>'
																+ id
																+ '</OptionId>';
														xmlString += '<OptionValue>_eof_</OptionValue></Question>';
													} else {
														xmlString += '<Question><QuestionId>'
																+ obj1
																+ '</QuestionId>';
														xmlString += '<OptionId>'
																+ id
																+ '</OptionId>';
														xmlString += '<OptionValue></OptionValue></Question>';
													}
												});

							});
			xmlString += "</Root>";
// 			alert('xmlString='+xmlString);
// 			isValidate=false;
			 					  var radio572 = $("input[name=572]").is(':checked');
								  var radio571=  $("input[name=571]").is(':checked');
								  var radio579=  $("input[name=579]").is(':checked');
								  
								  var value572 = $("#572_tf").val();
								  var value571=  $("#571_tf").val();
								  var value598 =$("#598").val();

// 								  alert('radio572='+radio572);
// 								  alert('radio571='+radio571);
								  
// 								  alert(value572);
// 								  alert(value571);
								  
							if(isClickedNext!='true' || isClickedNext==undefined){
							if( radio571==false)
									  {
										   isValidate = false;	

									  }
							
							 if( radio571!=false)
									  {
										  if(value571=="")
									  		{
											  
									  			isValidate = true;
									  		}
									  }
							
							
							    if(value571!="")
									  {
										  if(radio571==false)
									  		{
									  			isValidate = true;
									  		}
									  }
							
							if(isValidate!=false){
							   if(radio572==false)
								  {
									   isValidate = false;	

								  }
							
							
							    if( radio572!=false)
									  {
									  	if(value572=="")
									  		{
									  			isValidate = true;
									  		}
									  }
							
						
							    if(value572!="")
									  {
									  	if( radio572==false)
									  		{
									  			isValidate = true;
									  		}
									  }
							}
							
							if(isValidate!=false){
							   if(radio579=="" ||  radio579==false)
									  {
									  	isValidate = false;
									  }
							}
							if(isValidate!=false){
								    if(value598=="")
									  {
									  	isValidate = false;
									  }
							}
							}
// 				alert('isClickedNext='+isClickedNext);
// 				alert('isValidate='+isValidate);
					if(isClickedNext=='true')
					{
					if(isValidate){
					next='no';
					$('body')
					.append(
							'<form name="financialStatusForm1" method="post" id="financialStatusForm1">');
					try{
					$('#XMlString').remove();
					}catch(e)
					{
						
					}
					$('#financialStatusForm1')
					.append(
							'<input  type="hidden" id="XMlString" name="XMlString" value="'+xmlString+'"/>');
					$.ajax({
				         type : "POST",
				         url : $('#context').val()+'/partner/saveleadFinancialStstus?next='+next,
				         data :  $("#financialStatusForm1").serialize(), 
				         success : function(result) {
				          
// 				        	 alert('in success of ajax');
				         }
				         });
				    }
					else{
						showAlertMessage(
								"Error",
								"Input form is incomplete and cannot be saved. Please review all pages and ensure choices for"+ 
								" all mandatory questions have been selected properly and values entered correctly.",
								"error", doNothing);
						return false;
					}
					}
					
				else if(isClickedNext==undefined || isClickedNext=='yes'){
// 					alert('isClickedNext='+isClickedNext);
// 					alert('next='+next);
				if (isValidate) {
					$('body')
					.append(
							'<form name="financialStatusForm" method="post" id="financialStatusForm" action="'
									+ $('#contextPath').val()
									+ '/partner/saveleadFinancialStstus">');
					try{
						$('#XMlString').remove();
						}catch(e)
						{
							
						}
					$('#financialStatusForm')
					.append(
							'<input  type="hidden" id="XMlString" name="XMlString" value="'+xmlString+'"/>');

				if(next=='yes'){
					$('#financialStatusForm')
					.append(
							'<input  type="hidden" name="next" value="yes">');				
				}
				else{
					$('#financialStatusForm')
					.append(
							'<input  type="hidden" name="next" value="no">');
					
					
				}
				console.log($('#leadBuIdFinancialStatus').val());			
				console.log(xmlString);			
					document.financialStatusForm.submit();
				}
// 				alert(xmlString);
			
			
			else{
				showAlertMessage(
						"Error",
						"Input form is incomplete and cannot be saved. Please review all pages and ensure choices for"+ 
						" all mandatory questions have been selected properly and values entered correctly.",
						"error", doNothing);
					//alert('Please enter required details');
			}
				}

			// 			alert(xmlString);
		}
		function selectOption(id, name) {
			try{			
			var text=$('#'+id+'[name="'+name+'"]').val();
			if(text=='No' || text=='no'){	
				
				//alert(questionList);
				$(questionList).each(function(i,obj){
					//alert(obj.parentQuestion);
					if(obj.parentQuestion==name){						
// 						alert('id is:--'+obj.questionId)
						
						$('input[name="'+obj.questionId+'"]').attr('disabled','disabled');
						$('input[name="'+obj.questionId+'"]').attr('checked',false);
						$('#'+obj.questionId).attr('disabled','disabled');
						$('#'+obj.questionId).val('');
// 						if(obj.counter==63010){
// 							$('input[name='+obj.questionId+']').each(function(i,obj){
								
// 								$(obj).attr('disabled','disabled');
// 								$(obj).val('');
// 							});
							
// 						}
						
					}
				});
			}
			else{
				$(questionList).each(function(i,obj){
					//alert(obj.parentQuestion);
					if(obj.parentQuestion==name){
						$('#'+obj.questionId).removeAttr('disabled');
						$('#'+obj.questionId).val('');
						$('input[name="'+obj.questionId+'"]').removeAttr('disabled');
					}
					
				});
			}
// 			alert('id:--'+id+':---name----'+name)
			$('#'+id+'[name="'+name+'"]').attr('checked','checked');
// 			event.preventDefault();
			}
			catch(e){
// 				alert(e);
				$('#'+id+'[name="'+name+'"]').attr('checked','checked');
			}
			
		}
		//adds the css class applied for the validations
		function addCssStyles(pElementId, pErrorMsg) {
			$('#' + pElementId).css('border-color','red');
			$('#' + pElementId).attr('title', pErrorMsg);
		}

		//removes the css class applied for the validations
		function removeCssStyles(pElementId) {
			$('#' + pElementId).css('border-color','grey');
			$('#' + pElementId).removeAttr('title');
		}
		String.prototype.contains = function(it) {
			return this.indexOf(it) != -1;
		};
		$(document)
				.ready(
						function() {
							$(document).ajaxStop(function() {
								closePopupWebApp('centerLoadingImage');
								
								
							});

							$(document).ajaxStart(function() {
								openPopupWebApp('centerLoadingImage', 25, 35);
							});
							// 					alert("in ready");

							
								
															
							
																
							
							
							$
									.ajax({
										type : "POST",
										url : $('#contextPath').val()
												+ '/partner/getFinancialStatus',

										success : function(result) {
											try{
// 											alert(result);
											result = JSON.parse(result);
											questionList = result[0];
											var optionList = result[1];
											var selectedQuetionOptionList = result[2];
											var dependentList = result[3];
											$('#cashflowQuestions').empty();
											$('#emergencyQuestion').empty();
											$('#riskCoverQuestion').empty();
											$('#goalReadyQuestion').empty();
											$('#retirementPlanQuestion')
													.empty();
											$('#debtFreeQuestion').empty();
											$('#successPlanQuestion').empty();
											var cashint=0;
											$(questionList)
													.each(
															function(i, obj) {
																var questionId = obj.questionId;
																var question = obj.question;
																var sectionType = obj.questionType;
																var questionType = obj.counter;
																if (questionListToIterate
																		.contains(questionId)) {
																	// 																	alert("in if")

																} else {
																	// 																	alert("in else")
																	questionListToIterate
																			.push(questionId);
																}
																
// 																			
																
																if (sectionType == 125001) {
																	
																	if(questionId==574){
																		 
																		 $(
																			'#cashflowQuestions')
																			.append(
																					'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td width="47%" class="alignleft bold">'+question+'</td><td width="53%" class="alignleft newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+questionId+'tr"></tr></table></td></tr></table>');
																	                  
																	}
																	else if( questionType==63004){
																		$(
																		'#cashflowQuestions')
																		.append(
																				'<table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top:20px;" id="question'+questionId+'"><tr><td width="100%" class="alignleft bold">'+question+'</td><td width="100%"  id="question'+questionId+'tr"></tr></table>');
																	}
																	
																	else{
																		
																		if(questionId==571 || questionId==572 )
																			{
																			$(
																			'#cashflowQuestions')
																			.append(
																					'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td colspan="5" class="alignleft bold"><b class="errorMessage1">*</b>'+question+'</td></tr><tr id="question'+questionId+'tr"></tr></table>');
																					
																			}
																		else{
																		$(
																		'#cashflowQuestions')
																		.append(
																				'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td colspan="5" class="alignleft bold">'+question+'</td></tr><tr id="question'+questionId+'tr"></tr></table>');
																	}
																	}
																				
																	
																} else if (sectionType == 125002) {
																	if(questionId==575){
																		$(
																		'#emergencyQuestion')
																		.append(
																				'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td colspan="5" class="alignleft bold">'+question+'</td></tr><tr id="question'+questionId+'tr"></tr></table>');
																	}
																	else  if(questionType==63001){
																		 
																		 $(
																			'#emergencyQuestion')
																			.append(
																					'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td width="47%" class="alignleft bold">'+question+'</td><td width="53%" class="alignleft newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+questionId+'tr"></tr></table></td></tr></table>');
																	                  
																	}
																	else if(questionType==63008)
																		{
																		$(
																		'#emergencyQuestion')
																		.append(
																				'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td colspan="5" class="alignleft bold">'+question+'</td></tr><tr><td width="53%" class="alignleft newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+questionId+'tr"></tr></table></td></tr></table>');
																		}
																	else if(questionType==63003){
																		if(questionId==579)
																		{
																		$(
																		'#emergencyQuestion')
																		.append(
																				'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td colspan="5" class="alignleft bold"><b class="errorMessage1">*</b>'+question+'</td></tr><tr><td width="53%" class="alignleft newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+questionId+'tr"></tr></table></td></tr></table>');
																		}
																	else{
																		 $(
																			'#emergencyQuestion')
																			.append(
																					'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td colspan="5" class="alignleft bold">'+question+'</td></tr><tr><td width="53%" class="alignleft newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+questionId+'tr"></tr></table></td></tr></table>');
																	                  
																	}
																	}
																} else if (sectionType == 125003) {
																	
																	if(questionId==580 ||  questionType==63005){
																		if(questionId==587)
																			{
																			$(
																			'#riskCoverQuestion')
																			.append(
																					'<table width="100%" cellpadding="1" cellspacing="1" style="margin-top:20px;" id="question'+questionId+'"><tr><td colspan="5" style="padding-left:10px" class="alignleft bold">'+question+' [Use CTRL key to select multiple family members] </td></tr><tr id="question'+questionId+'tr"></tr></table>');	
																			}
																		else{
																		$(
																		'#riskCoverQuestion')
																		.append(
																				'<table width="100%" cellpadding="1" cellspacing="1" style="margin-top:20px;" id="question'+questionId+'"><tr><td colspan="5" style="padding-left:10px" class="alignleft bold">'+question+'</td></tr><tr id="question'+questionId+'tr"></tr></table>');
																		}
																		}
																	/*this question is removed from new leap input and its front question is 586*/
																	else if(questionId==585  ){
																		$(
																		'#riskCoverQuestion')
																		.append(
																				'<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;" ><tr><td width="26%" class="alignleft bold">'+question+'</td><td width="24%" class="alignleft newtableborder"><table class="alignleft  border="0" cellspacing="0" cellpadding="0"><tr id="question'+questionId+'tr"></tr></table></td><td width="30%" id="question'+questionId+'"></td><td width="20%" class="alignleft newtableborder"><table class="alignleft  border="0" cellspacing="0" cellpadding="0"><tr id="question'+(questionId+1)+'tr"></tr></table></td></table>');
																	}
																	else if(questionId==584)
																		{
																		$(
																		'#riskCoverQuestion')
																		.append(
																				'<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;" ><tr><td width="26%" class="alignleft bold">'+question+'</td><td width="24%" class="alignleft newtableborder"><table class="alignleft  border="0" cellspacing="0" cellpadding="0"><tr id="question'+questionId+'tr"></tr></table></td><td width="30%" id="question'+questionId+'"></td><td width="20%" class="alignleft bold"><table class="alignleft  border="0" cellspacing="0" cellpadding="0"><tr id="question622tr"></tr></table></td></table>');
																		}
																	
																	else if(questionId==586 || questionId==589 || questionId==591 ) {
																		$(
																		'#question'+(questionId-1))
																		.append(
																				question);
																	}
																	else if(questionId==622)
																		{
																		$(
																				'#question584')
																				.append(
																						question);
																		}
																	else if( questionId==588 || questionId==590    ){
																		$(
																		'#riskCoverQuestion')
																		.append(
																				'<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;" ><tr><td width="26%" class="alignleft bold">'+question+'</td><td width="24%" class="alignleft newtableborder"><table class="alignleft  border="0" cellspacing="0" cellpadding="0"><tr id="question'+questionId+'tr"></tr></table></td><td width="30%" id="question'+questionId+'"></td><td width="20%" class="alignleft" id="question'+(questionId+1)+'tr"></td></table>');
																	}
																	else if(questionId==582 ){
																		
																		 $(
																			'#riskCoverQuestion')
																			.append(
																					'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td colspan="5" class="alignleft bold">'+question+'</td></tr><tr><td width="53%" class="alignleft newtableborder"><table width="90%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+questionId+'tr"></tr></table></td></tr></table>');
																	                  
																	}
																	
																	else if( questionType==63004){
																		$(
																		'#riskCoverQuestion')
																		.append(
																				'<table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top:20px;" id="question'+questionId+'"><tr><td width="50%" class="alignleft bold">'+question+'</td><td width="50%"  id="question'+questionId+'tr"></tr></table>');
																	}
																	
																	
																	else  if(questionType==63001 ){
																		 
																		 $(
																			'#riskCoverQuestion')
																			.append(
																					'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td width="20%" class="alignleft bold">'+question+'</td><td width="53%" class="alignleft newtableborder"><table width="99%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+questionId+'tr"></tr></table></td></tr></table>');
																	                  
																	}
																	else if(questionType==63003 ){
																		
																		 $(
																			'#riskCoverQuestion')
																			.append(
																					'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td colspan="5" class="alignleft bold">'+question+'</td></tr><tr><td width="53%" class="alignleft newtableborder"><table width="99%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+questionId+'tr"></tr></table></td></tr></table>');
																	                  
																	}
																} else if (sectionType == 125004) {
																	if(questionId==593){
																		$(
																		'#goalReadyQuestion')
																		.append(
																				'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td colspan="5" class="alignleft bold">'+question+'</td></tr><tr id="question'+questionId+'tr"></tr></table>');
																	}else if( questionId==594){
																		$(
																		'#goalReadyQuestion')
																		.append(
																				'<table style="width:100;" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;"><tr><td width="20%" class="alignleft">&nbsp;</td><td width="42%" class="aligncenter bold" id="question'+(questionId+1)+'"></td><td id="question'+(questionId+2)+'" width="38%" class="aligncenter bold"></td></tr><tr><td id="question'+questionId+'tr_1"></td><td id="question'+(questionId+1)+'tr_1"></td><td id="question'+(questionId+2)+'tr_1"></td></tr><tr><td id="question'+questionId+'tr_2"></td><td id="question'+(questionId+1)+'tr_2"></td><td id="question'+(questionId+2)+'tr_2"></td></tr><tr><td id="question'+questionId+'tr_3"></td><td id="question'+(questionId+1)+'tr_3"></td><td id="question'+(questionId+2)+'tr_3"></td></tr><tr><td id="question'+questionId+'tr_4"></td><td id="question'+(questionId+1)+'tr_4"></td><td id="question'+(questionId+2)+'tr_4"></td></tr><tr><td id="question'+questionId+'tr_5"></td><td id="question'+(questionId+1)+'tr_5"></td><td id="question'+(questionId+2)+'tr_5"></td></tr><tr><td id="question'+questionId+'tr_6"></td><td id="question'+(questionId+1)+'tr_6"></td><td id="question'+(questionId+2)+'tr_6"></td></tr><tr><td id="question'+questionId+'tr_7"></td><td id="question'+(questionId+1)+'tr_7"></td><td id="question'+(questionId+2)+'tr_7"></td></tr></table>');
																	}else if(questionId==595 || questionId==596){
																		$(
																		'#question'+questionId)
																		.append(
																				question);
																	}
																	else  if(questionType==63001){
																		 
																		 $(
																			'#goalReadyQuestion')
																			.append(
																					'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td width="47%" class="alignleft bold">'+question+'</td><td width="53%" class="alignleft newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+questionId+'tr"></tr></table></td></tr></table>');
																	                  
																	}
																	else if(questionType==63003){
																		
																		 $(
																			'#goalReadyQuestion')
																			.append(
																					'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td colspan="5" class="alignleft bold">'+question+'</td></tr><tr><td width="53%" class="alignleft newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+questionId+'tr"></tr></table></td></tr></table>');
																	                  
																	}
																} else if (sectionType == 125005) {
																	
																	if(questionId==597){
																		$(
																		'#retirementPlanQuestion')
																		.append(
																				'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td colspan="5" class="alignleft bold">'+question+'</td></tr><tr id="question'+questionId+'tr"></tr></table>');
																	}
																	else if( questionId==624){
																		$(
																		'#retirementPlanQuestion')
																		.append(
																				'<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;"><tr><td width="18%" class="alignleft">&nbsp;</td><td width="42%" class="aligncenter bold" id="question601"></td><td id="question623" width="39%" class="aligncenter bold"></td></tr><tr><td id="question'+questionId+'tr_1"></td><td id="question601tr_1"></td><td id="question623tr_1"></td></tr><tr><td id="question'+questionId+'tr_2"></td><td id="question601tr_2"></td><td id="question623tr_2"></td></tr><tr><td id="question'+questionId+'tr_3"></td><td id="question601tr_3"></td><td id="question623tr_3"></td></tr><tr><td id="question'+questionId+'tr_4"></td><td id="question601tr_4"></td><td id="question623tr_4"></td></tr></table>');
																	}else if(questionId==601){
																		
																		$(
																		'#question'+questionId)
																		.append(
																				question);
																	}
																	else if(questionId==623)
																		{
																		
																		$(
																				'#question'+questionId)
																				.append(
																						question);
																		}
																	else if(questionType==63008)
																	{
																	$(
																	'#retirementPlanQuestion')
																	.append(
																			'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td colspan="5" class="alignleft bold">'+question+'</td></tr><tr><td width="53%" class="alignleft newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+questionId+'tr"></tr></table></td></tr></table>');
																	}
																	
// 																	else if(questionId==601){
// 																		$(
// 																		'#retirementPlanQuestion')
// 																		.append(
// 																				'<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;" id="question'+questionId+'"><tr><td colspan="4" class="alignleft bold">'+question+'</td></tr><tr ><td width="13%" id="question'+questionId+'tr_1"></td> <td width="45%" ><span class="alignleft " id="question'+(questionId+1)+'tr_1"></span></td><td width="45%" id="question'+questionId+'tr_2"></td> <td width="42%" ><span class="alignleft " id="question'+(questionId+1)+'tr_2"></span></td></tr><tr ><td id="question'+questionId+'tr_3"></td> <td><span class="alignleft " id="question'+(questionId+1)+'tr_3"></span></td><td id="question'+questionId+'tr_4"></td> <td ><span class="alignleft " id="question'+(questionId+1)+'tr_4"></span></td></tr><tr ><td id="question'+questionId+'tr_5"></td> <td><span class="alignleft " id="question'+(questionId+1)+'tr_5"></span></td><td id="question'+questionId+'tr_6"></td> <td ><span class="alignleft " id="question'+(questionId+1)+'tr_6"></span></td></tr><tr ><td id="question'+questionId+'tr_7"></td> <td><span class="alignleft " id="question'+(questionId+1)+'tr_7"></span></td><td id="question'+questionId+'tr_8"></td> <td ><span class="alignleft " id="question'+(questionId+1)+'tr_8"></span></td></tr><tr ><td id="question'+questionId+'tr_9"></td> <td><span class="alignleft " id="question'+(questionId+1)+'tr_9"></span></td><td></td> <td ><span class="alignleft "></span></td></tr></table>');
// 																	}
																	else if( questionType==63004){
																		if(questionId==598)
																			{
																			$(
																			'#retirementPlanQuestion')
																			.append(
																					'<table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top:20px;" id="question'+questionId+'"><tr><td width="50%" class="alignleft bold"><b class="errorMessage1">*</b>'+question+'</td><td width="50%"  id="question'+questionId+'tr"></tr></table>');
																			}
																		else{
																		$(
																		'#retirementPlanQuestion')
																		.append(
																				'<table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top:20px;" id="question'+questionId+'"><tr><td width="50%" class="alignleft bold">'+question+'</td><td width="50%"  id="question'+questionId+'tr"></tr></table>');
																		}
																		}
																	else  if(questionType==63001){
																		 
																		 $(
																			'#retirementPlanQuestion')
																			.append(
																					'<table width="100%" cellpadding="1" cellspacing="1" style="margin-top:20px;" id="question'+questionId+'"><tr><td width="47%" class="alignleft bold">'+question+'</td><td width="53%" class="alignleft newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+questionId+'tr"></tr></table></td></tr></table>');
																	                  
																	}
																	else if(questionType==63003){
																		
																		 $(
																			'#retirementPlanQuestion')
																			.append(
																					'<table width="100%" cellpadding="1" cellspacing="1" style="margin-top:20px;" id="question'+questionId+'"><tr><td colspan="5" class="alignleft bold">'+question+'</td></tr><tr><td width="53%" class="alignleft newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+questionId+'tr"></tr></table></td></tr></table>');
																	                  
																	}
																} else if (sectionType == 125006) {
																	if(questionId==603){
																		$(
																		'#debtFreeQuestion')
																		.append(
																				'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td colspan="5" class="alignleft bold">'+question+'</td></tr><tr id="question'+questionId+'tr"></tr></table>');
																	}
																	else  if(questionType==63001){
																		 
																		 $(
																			'#debtFreeQuestion')
																			.append(
																					'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td width="47%" class="alignleft bold">'+question+'</td><td width="53%" class="alignleft newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+questionId+'tr"></tr></table></td></tr></table>');
																	                  
																	}
																	else if(questionType==63003){
																		
																		 $(
																			'#debtFreeQuestion')
																			.append(
																					'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td colspan="5" class="alignleft bold">'+question+'</td></tr><tr><td width="53%" class="alignleft newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+questionId+'tr"></tr></table></td></tr></table>');
																	                  
																	}
																	else if(questionType==63004){
																		$(
																		'#debtFreeQuestion')
																		.append(
																				'<table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top:20px;" id="question'+questionId+'"><tr><td width="50%" class="alignleft bold">'+question+'</td><td width="50%"  id="question'+questionId+'tr"></tr></table>');
																		}
																	else if(questionType==63008)
																	{
																	$(
																	'#debtFreeQuestion')
																	.append(
																			'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td colspan="5" class="alignleft bold">'+question+'</td></tr><tr><td width="53%" class="alignleft newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+questionId+'tr"></tr></table></td></tr></table>');
																	}
																} else if (sectionType == 125007) {
																	if(questionId==608){
																		$(
																		'#successPlanQuestion')
																		.append(
																				'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td colspan="5" class="alignleft bold">'+question+'</td></tr><tr id="question'+questionId+'tr"></tr></table>');
																	}
																	else  if(questionType==63001){
																		 
																		 $(
																			'#successPlanQuestion')
																			.append(
																					'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td width="47%" class="alignleft bold">'+question+'</td><td width="53%" class="alignleft newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+questionId+'tr"></tr></table></td></tr></table>');
																	                  
																	}
																	else if(questionType==63003){
																		
																		 $(
																			'#successPlanQuestion')
																			.append(
																					'<table width="100%" cellpadding="1" cellspacing="1" id="question'+questionId+'"><tr><td colspan="5" class="alignleft bold">'+question+'</td></tr><tr><td width="53%" class="alignleft newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+questionId+'tr"></tr></table></td></tr></table>');
																	                  
																	}
																}

															});
											var cnt1=1;
											var cnt2=1;

											$(optionList)
													.each(
															function(i, obj) {
																
																if (obj.questionType == 63005) {
																
																	$(
																			'#question'
																					+ obj.questionId)
																			.attr(
																					'class',
																					'controls five-controls');
																	$(
																			'#question'
																					+ obj.questionId)
																			.siblings()
																			.css(
																					'height',
																					'66px');
																	// 																	alert("in if..........");

																	// 																		alert("in if..........2nd");

																	$(
																			'#question'
																					+ obj.questionId)
																			.append(
																					'<select title="Hold Ctrl key to select multiple" multiple="multiple" style="margin-left: 10px;width:100%;min-width:245px;height: 45px;" name="'+obj.questionId+'" id="select'+obj.questionId+'"></select>');
																	$(
																			dependentList)
																			.each(
																					function(
																							i,
																							obj1) {
// 																						alert(obj1.optionId+">>>>>>>>>>"+obj1.option);

																						// 																		alert("in else..........");
																						$(
																								'#select'
																										+ obj.questionId)
																								.append(
																										'<option value="'+obj1.optionId+'">'
																												+ obj1.option
																												+ '</option>');
																					});

																}
																else if (obj.questionType == 63008) {
																	
																	if($('#question'+ obj.questionId+'troptiontable').val()==undefined){
												            			 $(	'#question'+ obj.questionId+'tr').append('<td ><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+ obj.questionId+'troptiontable"><td><label class="radiolable"><input name="'+ obj.questionId+'"  type="checkbox" onclick="selectOption(id, name)" id="option'+obj.optionId+'" value="'+obj.option+'" /></label>'+obj.option+'</td></tr></table></td>');
												            		 }else{
												            			 $('#question'+ obj.questionId+'troptiontable').append('<td><label class="radiolable"><input name="'+ obj.questionId+'" onclick="selectOption(id, name)" type="checkbox" id="option'+obj.optionId+'" value="'+obj.option+'" /></label>'+obj.option+'</td>');
												            		 }
																}
																else if(obj.questionId==598){
																	$(
																			'#question'
																					+ obj.questionId+'tr')
																			.append('<input type="text"  id="'+ obj.questionId+'" style="width:100%"  class="textfieldg" />');
													            	 
												            	 }
																else if(obj.questionType==63004){
																	
																	if(obj.questionId==605)
																		{
																		$(
																				'#question'
																						+ obj.questionId+'tr')
																					
																					.append('<input type="text"  id="'+ obj.questionId+'" class="textfieldg" onkeyup="test_skill(id);"/></br><div id="'+obj.questionId+'moneyText" align="left" style="border:1px solid grey; width:348px;" ></div>');	
																		}
																	else{
																	$(
																			'#question'
																					+ obj.questionId+'tr')
																				
																				.append('<input type="text"  id="'+ obj.questionId+'" class="textfieldg" onkeyup="test_skill(id);"/></br><div id="'+obj.questionId+'moneyText" align="left" style="border:1px solid grey;" ></div>');
																										            	 
																	}
																	}
																else if(obj.questionType==63011){
																	if(obj.questionId==571){
												            		 if($('#question'+ obj.questionId+'troptiontable').val()==undefined){																																																																											
												            			 $(	'#question'+ obj.questionId+'tr').append('<td class="newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+ obj.questionId+'troptiontable"><td width="100px"><label><input id="'+ obj.questionId+'_tf" type="text" class="textfieldbiggray" placeholder="Please provide the exact amount" onkeyup="test_skill(id);" /></label></br><div id="'+ obj.questionId+'_tfmoneyText" align="left" style="border:1px solid grey; height:80px; width:198px;" ></div></td><td width="30px"><img src="'+$('#contextPath').val()+'/images/Axis-op/or.gif" width="30" height="29" /></td><td><label class="radiolable"><input name="'+ obj.questionId+'"  type="radio" onclick="selectOption(id, name)" id="option'+obj.optionId+'" value="'+obj.option+'" /></label>'+obj.option+'</td></tr></table></td>');
												            			  //'#question'+ obj.questionId+'tr').append('																																									   <input type="text"  id="'+ obj.questionId+'" class="textfieldg" onkeyup="test_skill(id);"/></br><div id="'+obj.questionId+'moneyText" align="left" style="border:1px solid grey; width:348px;" ></div>');
												            			 
												            		 }else{																																																	//.append('<input type="text"  id="'+ obj.questionId+'" class="textfieldg" onkeyup="test_skill(id);"/></br><div id="'+obj.questionId+'moneyText" align="left" style="border:1px solid grey; width:348px;" ></div>');
												            			 $('#question'+ obj.questionId+'troptiontable').append('<td><label class="radiolable"><input name="'+ obj.questionId+'" onclick="selectOption(id, name)" type="radio" id="option'+obj.optionId+'" value="'+obj.option+'" /></label>'+obj.option+'</td>');
												            		 }
																	}else{
																		 if($('#question'+ obj.questionId+'troptiontable').val()==undefined){
													            			 $(	'#question'+ obj.questionId+'tr').append('<td class="newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+ obj.questionId+'troptiontable"><td width="100px"><label><input id="'+ obj.questionId+'_tf" type="text" class="textfieldbiggray" placeholder="Please provide the exact amount" onkeyup="test_skill(id);" /></label></br><div id="'+ obj.questionId+'_tfmoneyText" align="left" style="border:1px solid grey; height:80px; width:198px;" ></div></td><td width="30px"><img src="'+$('#contextPath').val()+'/images/Axis-op/or.gif" width="30" height="29" /></td><td><label class="radiolable"><input name="'+ obj.questionId+'"  type="radio" onclick="selectOption(id, name)" id="option'+obj.optionId+'" value="'+obj.option+'" /></label>'+obj.option+'</td></tr></table></td>');
													            			 //$(	'#question'+ obj.questionId+'tr').append('<td class="newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+ obj.questionId+'troptiontable"><td width="100px"><label><input id="'+ obj.questionId+'_tf" type="text" class="textfieldbiggray" placeholder="Please provide the exact amount" onkeyup="test_skill(id);" /></label></br><div id="'+ obj.questionId+'_tfmoneyText" align="left" style="border:1px solid grey; height:80px; width:200px;" ></div></td><td width="30px"><img src="'+$('#contextPath').val()+'/images/Axis-op/or.gif" width="30" height="29" /></td><td><label class="radiolable"><input name="'+ obj.questionId+'"  type="radio" onclick="selectOption(id, name)" id="option'+obj.optionId+'" value="'+obj.option+'" /></label>'+obj.option+'</td></tr></table></td>');
													            		 }else{
													            			 $('#question'+ obj.questionId+'troptiontable').append('<td><label class="radiolable"><input name="'+ obj.questionId+'" onclick="selectOption(id, name)" type="radio" id="option'+obj.optionId+'" value="'+obj.option+'" /></label>'+obj.option+'</td>');
													            		 }
																	}
												            	 }
																else if(obj.questionId==594){
												            		 $(
																				'#question'
																						+ obj.questionId+'tr_'+cnt1).append(obj.option);
												            		 $(
																				'#question'
																						+ (obj.questionId+1)+'tr_'+cnt1).append('<input type="text"  id="'+ (obj.questionId+1)+'_'+cnt1+'"   class="textfieldg" onkeyup="test_skill(id);"/></br><div id="'+(obj.questionId+1)+'_'+cnt1+'moneyText" align="left" style="border:1px solid grey" ></div>');
												            		 				//.append('<input type="text"  id="'+ obj.questionId+'" class="textfieldg" onchange="test_skill(id);"/></br><div id="'+obj.questionId+'moneyText" align="left" style="border:1px solid grey" ></div>');
												            		 $(
																				'#question'
																						+ (obj.questionId+2)+'tr_'+cnt1).append('<input type="text"  id="'+ (obj.questionId+2)+'_'+cnt1+'"   class="textfieldg" onkeyup="test_skill(id);"/></br><div id="'+(obj.questionId+2)+'_'+cnt1+'moneyText" align="left" style="border:1px solid grey" ></div>');
												            		 cnt1+=1;
												            	 }else if(obj.questionId==595 || obj.questionId==596){
												            		 
												            	 }
// 												            	 else if(obj.questionId==601){
// 												            		 $(
// 																				'#question'
// 																						+ obj.questionId+'tr_'+cnt2).append(obj.option);
// 												            		 $(
// 																				'#question'
// 																						+ (obj.questionId+1)+'tr_'+cnt2).append('<input type="text"  id="'+ (obj.questionId+1)+'_'+cnt2+'"   class="textfieldg"/>');
// 												            		 cnt2+=1;
// 																	}else if(obj.questionId==602){
// 																	}
												            	 else if(obj.questionId==624){
												            		 $(
																				'#question'
																						+ obj.questionId+'tr_'+cnt2).append(obj.option);
												            		 $(
																				'#question601tr_'+cnt2).append('<input type="text"  id="601_'+cnt2+'" class="textfieldg" onkeyup="test_skill(id);"/></br><div id="601_'+cnt2+'moneyText" align="left" style="width:348px; border:1px solid grey" ></div>');
												            		 $(
																				'#question623tr_'+cnt2).append('<input type="text"  id="623_'+cnt2+'" class="textfieldg" onkeyup="test_skill(id);"/></br><div id="623_'+cnt2+'moneyText" align="left" style="width:348px; border:1px solid grey" ></div>');
												            		 cnt2+=1;
												            	 }else if(obj.questionId==601 || obj.questionId==623){
												            		 
												            	 }
																
																else {
													            if(obj.questionId==570 || obj.questionId==575 || obj.questionId==580 || obj.questionId==593 || obj.questionId==597 || obj.questionId==603 || obj.questionId==608){
													            	if(obj.option=='1'){
													            		$(
																				'#question'
																						+ obj.questionId+'tr')
																				.append('<td class="tablehead"><label class="radiolable"> <input name="'+ obj.questionId+'" onclick="selectOption(id, name)" type="radio" id="option'+obj.optionId+'" value="'+obj.option+'" /></label>1 (low)</td>');
													            	}else if(obj.option=='5'){
													            		$(
																				'#question'
																						+ obj.questionId+'tr')
																				.append('<td class="tablehead"><label class="radiolable"> <input name="'+ obj.questionId+'" onclick="selectOption(id, name)" type="radio" id="option'+obj.optionId+'" value="'+obj.option+'" /></label>5 (high)</td>');
													            	}else{
													            		$(
																				'#question'
																						+ obj.questionId+'tr')
																				.append('<td class="tablehead"><label class="radiolable"> <input name="'+ obj.questionId+'" onclick="selectOption(id, name)" type="radio" id="option'+obj.optionId+'" value="'+obj.option+'" /></label>'+obj.option+'</td>');
													            	}
													            	
													            }else{
													            	
													            	 
													            	$(
																			'#question'
																					+ obj.questionId+'tr')
																			.append('<td><label class="radiolable"><input name="'+ obj.questionId+'" type="radio" onclick="selectOption(id, name)" id="option'+obj.optionId+'" value="'+obj.option+'" /></label>'+obj.option+'</td>');
													            	 }
													            
																	
																}

															});
											var count=1;
											var cnt1=1;
											var cnt2=1;
											var cnt3=1;
											$(selectedQuetionOptionList)
													.each(
															function(i, obj) {
																if (obj.option == '_eof_') {
																	// 																	 alert(obj.optionId);
																	// 																	$('#select'+obj.questionId+' :selected').each(function(i, selected){ 

																	$(
																			'#select'
																					+ obj.questionId
																					+ ' option[value="'
																					+ obj.optionId
																					+ '"]')
																			.attr(
																					"selected",
																					true);
																	// 																			  $(this).attr('selected','selected');
																	// 																		  }
																	// 																		});

																} else if (obj.optionId == 0) {
																	try{
																		if(obj.questionId=='561' || obj.questionId=='372'){
																			
																			$(
																					'#input'
																							+ obj.questionId+'_'+count)
																					.val(obj.option);
																			count++;
																			if(count==8){
																				count=1;
																			}
																		}else if(obj.questionId=='595' || obj.questionId=='596'){
																			
																			$(
																					'#'
																							+ obj.questionId+'_'+cnt1)
																					.val(obj.option);
																			cnt1++;
																			if(cnt1==8){
																				cnt1=1;
																			}
																		}
																		else if(obj.questionId=='601' || obj.questionId=='623'){
																			
																			
																			$(
																					'#'
																							+ obj.questionId+'_'+cnt2)
																					.val(obj.option);
																			cnt2++;
																			if(cnt2==5){
																				cnt2=1;
																			}
																			
																		}
																		else if(obj.questionId=='602'){
																			
																			$(
																					'#'
																							+ obj.questionId+'_'+cnt2)
																					.val(obj.option);
																			cnt2++;
																			if(cnt2==10){
																				cnt2=1;
																			}
																		}
																		
																		else{
																				
																	
																	$(
																			'input[id="'
																					+ obj.questionId
																					+ '"]')
																			.val(
																					obj.option);
																	$(
																			'input[id="'
																					+ obj.questionId
																					+ '_tf"]')
																			.val(
																					obj.option);
																}
																	}catch(e){
																		$(
																				'input[id="'
																						+ obj.questionId
																						+ '"]')
																				.val(
																						obj.option);
																		$(
																				'input[id="'
																						+ obj.questionId
																						+ '_tf"]')
																				.val(
																						obj.option);
																	}	} else {
																	selectOption(
																			'option'
																					+ obj.optionId,
																			obj.questionId);
																	$(
																			'#select'
																					+ obj.questionId)
																			.val(
																					obj.optionId);
																}
																// 																$('.ui-widget-content')
																// 																.css(
																// 																		'background',
																// 																		'url("'
																// 																				+ $('#contextPath').val()
																// 																				+ '/images/slider-controls.png") no-repeat leftcenter !important');

																// 																					+ obj);
															});
// 							$('#question381').siblings().css('height','56px');
// 							$('#question344').siblings().css('height','18px');
						//	$('#question381 a').css('float','left');
						//	$('#question381').css('height','73px');
						//	$('#question381').css('width','245px');
							$('#option138,#option139,#option140').css('width','31%');
							$('#option138,#option139,#option140').css('height','60%');
							$('#option138,#option139,#option140').css('padding-top','22px');
							//$('#question344').css('font-size', '10px');
// 							$('.ui-widget-content').css('background')
// 							$('#question374').css('width', '250px');
// 							$('#question374').siblings().css('height','56px');
// 							$('#question374 a').css('margin-top', '2px');
							$('#question369 a,#question371 a').css('width', '13.2%');
							//$('#question369 a').css('height', '37px');
							//$('#question369,#question371 a').siblings().css('height','35px');
							$('#question371 a').css('height', '20px');
							$('#question561').css('height', '34px');
							//$('#question367,#question353').css('height', '70px');
							//$('#question367 a,#question353 a').css('height', '56px');
							$('#question374 a').css('width', '13.2%');
							$('#question343,#question344,#question348,#question351,#question352,#question366,#question373,#question379,#question370,#question378,#question375,#question376,#question387,#question385').css('height', '53px');
							$('#question343 a,#question344 a,#question348 a,#question351 a,#question352 a,#question366 a,#question373 a,#question373 a,#question367 a,#question370 a,#question375 a,#question376 a,#question387 a,#question379 a,#question387 a').css('height', '28px');
							$('#question343 a,#question344 a,#question348 a,#question351 a,#question352 a,#question366 a,#question373 a,#question373 a,#question367 a,#question370 a,#question375 a,#question376 a,#question387 a,#question379 a,#question387 a').css('padding-top', '18px');
							$('#question369 a').removeAttr('href');
							$('#question371 a').removeAttr('href');
							$('#question369 a').removeAttr('onclick');
							$('#question371 a').removeAttr('onclick');
							//$('#question353').css('height', '40px');
							$('#question353 a,#question367 a,#question353 a,#question383 a').css('height', '40px');
							$('#question353 a,#question367 a,#question353 a,#question383 a').css('padding-top', '23px');
							$('#question345,#question346,#question381').css('width', '245px');
							$('#question378 input').css('height', '53px');
							
							
// 							$('#slider345').css('background-image', 'url(' + $('#contextPath').val() + '/images/slider-controls.png) no-repeat left center !important');
											
							$(questionList).each(function(i,obj){
								//alert(obj.parentQuestion);
								if(obj.parentQuestion!=0){
									var  selected=false;	
									$('#question'+obj.parentQuestion + ' a').each(function(j,obj1){
										//alert('---'+$(obj1).attr('class'));	
										if($(obj1).attr('class')!=undefined){
											selected=true;
										}
									});
									//alert('question '+obj.questionId+' selcted???'+selected);
									if(!selected){
										$('#select'+obj.questionId).attr('disabled','disabled');
										//alert('#input'+obj.questionId);
										$('#input'+obj.questionId).attr('disabled','disabled');		
									}
									
								}
							});	
							$('a[name="369"]').each(function(i,obj){
								$(obj).css('cursor','default');
								$(obj).css('text-decoration','none');
							});
							
							$('a[name="371"]').each(function(i,obj){
								$(obj).css('cursor','default');
								$(obj).css('text-decoration','none');
							});
							
							

										}catch(e){
											
											closePopupWebApp('centerLoadingImage');
										}
									}
										
									});

							// 							alert(questionListToIterate)									
						});
		Array.prototype.contains = function(obj) {
			var i = this.length;
			while (i--) {
				if (this[i] == obj) {
					return true;
				}
			}
			return false;
		}
		function Next(){
			if (validateInfo()) {
				//alert($('#photograph_browse').val());
				//$('form').append('<input type="hidden" name="next" value="yes">');	
				$('#next').val('yes');
				document.saveLeadDetailsPathFinderForm.submit();
			} else {
				return;
			}
			//window.location.href=$('#context').val()+"/partner/PathFinder/FinancialStatus.jsp";
		}
		
// 		$('.side-bar').css('margin-top','-32px');
	$('.survey-links').css('margin-top','1px');
	function addNotes(){
		window.location.href=$('#context').val()+'/Utility/PathFinder/AddNotes.jsp?notesType=currrentFinStatus';
	}
	</script>
<%-- 	<jsp:include page="../PathFinder/PathFinderFooter.jsp" /> --%>
</body>

</html>