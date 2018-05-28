<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<script>
$(function(){
	$('#${param.param1}').addClass('dcmenu');
	$('#${param.param1}').css('font-weight','bold');
	$(function(){
		var SectionName;
		var ImagePathAddInDCInput="";
		var Url="";
		var buIdInSession = $('#buIdInSession').val();
		//alert('buIdInSession='+buIdInSession);
		$.ajax({
	        type: "GET",
	        url : $('#contextPath').val()
			+ '/xml/BuConfuguration.xml',
	        
	        dataType: "xml",
	        success: function(xml) {
		        	$(xml).find('Bu').each(function(i,obj){
		        		var buId= $(this).attr('Id');
		        		  $(obj).find('Section').each(function(i,obj){
		        			  SectionName = $(this).attr('Name');
		        			  if(buId==buIdInSession){
			        				  if(SectionName=='Advertisement In Dc Input')
			        				  {
				        				  $(obj).find('Configuration').each(function(i,obj){  
				        					  ImagePathAddInDCInput = $(this).attr('ImagePath');
					        			      Url = $(this).attr('Url');
					        			  });   
				    				  }
		        			  } 
		        		  });
		        	});
		       	 //alert('ImagePathAddInDCInput='+ImagePathAddInDCInput);
			     // alert("SectionName = "+SectionName+"  ImagePathForAdInDc1 = "+ImagePathForAdInDc1+" Url = "+Url)
			$('#advertisedImage').attr('src',ImagePathAddInDCInput);			 
	        }	
		 });	
})
</script>
<body>


 <div class="col-md-3 sidebar-offcanvas" role="navigation" style="margin-top:10px;padding-left:10px;margin-bottom: 10px">
             <div class="list-group">
    <a class="list-group-item active" href=""> Details</a>
    <a href="<%=request.getContextPath()%>/DCPersonalInfoFiinfra.htm" id="personalInfo" class="list-group-item">Personal Information</a>
     <a class="list-group-item" href="<%=request.getContextPath()%>/RiskProfileFiinfra.htm" id="riskProfilelink">Risk Profile</a>
   
    <a href="#" class="list-group-item">Current Financial Status</a>
    <a href="<%=request.getContextPath()%>/CashflowFiinfra.htm" onclick="setSelectedMenu(id)" id="cashflow"  class="list-group-item dcsidelinks" style="padding-left:20px; font-size:11px;">
    <i class="dcarrowicon"></i>Cash Flow</a>
    <a href="<%=request.getContextPath()%>/EmergencyReadyFiinfra.htm"  onclick="setSelectedMenu(id)" id="Emergency"  class="list-group-item  dcsidelinks" style="padding-left:20px; font-size:11px;">
    <i class="dcarrowicon"></i> Emergency Readiness</a>
    <a href="<%=request.getContextPath()%>/RiskCoverFiinfra.htm" onclick="setSelectedMenu(id)" id="risk"  class="list-group-item  dcsidelinks" style="padding-left:20px; font-size:11px;">
	<i class="dcarrowicon"></i> Risk Cover</a>
    <a href="<%=request.getContextPath()%>/GoalReadyFiinfra.htm" onclick="setSelectedMenu(id)" id="goal"  class="list-group-item  dcsidelinks" style="padding-left:20px; font-size:11px;">  
    <i class="dcarrowicon"></i> Goal Readiness</a>
    <a href="<%=request.getContextPath()%>/RetirementPlaningFiinfra.htm" onclick="setSelectedMenu(id)" id="retirment"  class="list-group-item  dcsidelinks" style="padding-left:20px; font-size:11px;">
    <i class="dcarrowicon"></i> Retirement Planning</a>
   <a href="<%=request.getContextPath()%>/LoanFiinfra.htm" onclick="setSelectedMenu(id)" id="loan"  class="list-group-item  dcsidelinks" style="padding-left:20px; font-size:11px;"> 
   <i class="dcarrowicon"></i>Loan Status</a>
   <a href="<%=request.getContextPath()%>/SuccessionPlanFiinfra.htm" onclick="setSelectedMenu(id)" id="succession"  class="list-group-item  dcsidelinks" style="padding-left:20px; font-size:11px;">
   <i class="dcarrowicon"></i> Succession Readiness</a>
   <a href="<%=request.getContextPath()%>/DCFutureFinancialExpectationFiinfra.htm" id="futurefinancialepectations" class="list-group-item">Future Financial Expectations</a>
 </div>
<center>
</center>
            <br><img src="" id="advertisedImage"> 
           
        </div>



</body>
</html>