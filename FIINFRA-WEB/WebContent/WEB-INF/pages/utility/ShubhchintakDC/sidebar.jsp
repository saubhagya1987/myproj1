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
	
	var SectionToShowInDcList = $('#SectionToShowInDcList').val();
	var sectionarray = $('#section').val().split(',');
	var isContainsRiskCover=sectionarray.contains("39003");
	var isContainsEmergencyR=sectionarray.contains("39001");
	var isContainsCahflow=sectionarray.contains("39002");
	var isContainsRiskProfile=sectionarray.contains("39009");
	var isContainsSuccession=sectionarray.contains("39007");
	var isContainsRetirment=sectionarray.contains("39006");
	var isContainsGoal=sectionarray.contains("39005");
	var isContainsLoan=sectionarray.contains("39008");
	
	
	
	
	if (isContainsEmergencyR==false)
	{
		$('#Emergency').show();
		
	}
	else{
		$('#Emergency').hide();
	}
	
	if (isContainsCahflow==false)
	{
		$('#cashflow').show();
		
	}
	else{
		$('#cashflow').hide();
	}
	if (isContainsGoal==false)
	{
		$('#goal').show();
		
	}
	else{
		$('#goal').hide();
	}
	if (isContainsRetirment==false)
	{
		$('#retirment').show();
		
	}
	else{
		$('#retirment').hide();
		
	}
	if (isContainsLoan==false)
	{
		$('#loan').show();
		
	}
	else{
		$('#loan').hide();
	}
	if (isContainsRiskProfile==false)
	{
		$('#riskProfilelink').show();
		
	}
	else{
		$('#riskProfilelink').hide();
		
	}
	if (isContainsRiskCover==false)
	{
		$('#risk').show();
		
	}
	else{
		$('#risk').hide();
		
	}
	if (isContainsSuccession==false)
	{
		$('#succession').show();
		
	}
	else{
		$('#succession').hide();
		
	}
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
});
});
</script>
<body>

<input type="hidden" id="SectionToShowInDcList" value="${sessionScope.SectionToShowInDcList}"/>
<input type="hidden" id="section" value="${sessionScope.Section}"/>
 <div class="col-md-3 sidebar-offcanvas" role="navigation" style="margin-top:10px;padding-left:10px;margin-bottom: 10px;">
            <div class="list-group">
        		<a class="list-group-item active" href="#"> Details</a>
                <a href="<%=request.getContextPath()%>/DCPersonalInfoShubhchintak.htm" id="personalInfo" class="list-group-item">Personal Information</a>
                <a class="list-group-item" href="<%=request.getContextPath()%>/RiskProfile.htm" id="riskProfilelink">Risk Profile</a>	
              	
                <a href="#" class="list-group-item">Current Financial Status</a>
                <a href="<%=request.getContextPath()%>/EmergencyReady.htm" class="list-group-item" style="padding-left:20px; font-size:11px;" id="Emergency"><i class="dcarrowicon"></i>Emergency Readiness</a>
                	<a href="<%=request.getContextPath()%>/RiskCover.htm" id="risk" class="list-group-item" style="padding-left:20px; font-size:11px;">
                    <i class="dcarrowicon"></i> Risk Cover</a>
                    <a href="<%=request.getContextPath()%>/GoalReady.htm" class="list-group-item" style="padding-left:20px; font-size:11px;" id="goal"><i class="dcarrowicon"></i> Goal Readiness</a>
                    <a href="<%=request.getContextPath()%>/RetirementPlaning.htm" class="list-group-item" style="padding-left:20px; font-size:11px;" id="retirment"><i class="dcarrowicon"></i> Retirement Planning</a>
                    <a href="<%=request.getContextPath()%>/Cashflow.htm" class="list-group-item" style="padding-left:20px; font-size:11px;" id="cashflow"><i class="dcarrowicon"></i> Cash Flow</a>
                    <a href="<%=request.getContextPath()%>/Loan.htm" class="list-group-item" style="padding-left:20px; font-size:11px;" id="loan"><i class="dcarrowicon"></i> Loan Status</a>
                    <a href="<%=request.getContextPath()%>/SuccessionPlan.htm" class="list-group-item" style="padding-left:20px; font-size:11px;" id="succession"><i class="dcarrowicon"></i> Succession Readiness</a>
                	<a href="<%=request.getContextPath()%>/DCFutureFinancialExpectationShubhchintak.htm" id="futurefinancialepectations" class="list-group-item">Future Financial Expectations</a>                                  
                	                                   </div>
<center>
</center>
            <br><img src="" id="advertisedImage">
           
        </div>



</body>
</html>