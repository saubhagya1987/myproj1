<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.common.common.CodeValueData"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.cp.IncomeData"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

 <%IncomeData income=(IncomeData) request.getAttribute("incomeData"); 
	int index1 =(Integer) request.getAttribute("index");
	String s1=(String) request.getAttribute("s");
	List<CodeValueData> freqTypes =(List<CodeValueData>) request.getAttribute("freqList");
	List<CodeValueData> incomeTypes =(List<CodeValueData>) request.getAttribute("incomeTypes");
%> 

<script>
$(document).ready(function(){
    
	
	
	
    $('#income_form').validate({
    	
    	errorElement:'div',
    	errorClass:'errors',
    	
        rules: {
        	incomeName: { 
            required: true
        	},
        	incomeAmount:{ 
        	 required: true,
        	 digits:true,
        	 min:1
        	},
        	annualGrowth:{
        		required:true,
        		text:false,
        		digits:false
        		}
        },
        messages: {
        	incomeName :"Enter Income Title",
        	incomeAmount:{required:"Enter Income Amount",digits:"Please enter numbers only"},
        	annualGrowth :{required:"Enter Expected Growth"}
        }   
       
    });
	 // Calls the selectBoxIt method on your HTML select box
    });
$(function() {
    $('#incomeTypeId').change(function() {
    	var end = $("option:selected", this).text();
        // and update the hidden input's value
        $('#incomeName').val(end);
    });
});
    
</script>
<script>

$("body").on("click", ".submit_btn", function() {
	
	if($('#income_form').valid()){
 		$('#income_form').submit();	
 	}	
	});
  	// $('#asset-stock-form').submit();
	$("body").on("click", "#addSave", function() {
		
		if($('#income_form').valid()){
    		var form=$('#income_form');
    		form.append('<input name="action" type="hidden" value="add"/>');
    		form.submit();
    	}
	});  
  




function annualGrowthValidation(evt)
{
	 /* var x= document.getElementById('annualGrowth').value; */
	  
          var charCode = (evt.which) ? evt.which : evt.keyCode;
          if (charCode != 46 && charCode > 31 
            && (charCode < 48 || charCode > 57))
             return false;

          return true;
       
	//return true; 
	
}

</script> 
        
        
		  <form:form id="income_form" commandName="incomeData" action="${pageContext.request.contextPath}/financial/myIncome/save" method="POST">
            <fieldset>
            <input id="partyIncomeId" name="partyIncomeId" type="hidden"  value="<%=CommonUtils.zeroIfNULL(income.getPartyIncomeId())%>"/>
			<div class="col-xs-12 ">
              <div class="form-group">
             <label for="textArea" class="col-lg-2 control-label">Income Category</label>
                  <div class="col-lg-4">
                  <form:select  id="incomeTypeId"  class="form-control" path="incomeTypeId" name="incomeTypeId">
               <%   for (CodeValueData idv:incomeTypes){
                  %>
                  
            <option value='<%=idv.getCodeValueId()%>' <%=new Integer(idv.getCodeValueId()).equals(income.getIncomeTypeId())?" selected ":"" %>><%=CommonUtils.emptyIfNull(idv.getCodeValue())%></option>
            <%}%>
   
                  </form:select>
                  </div>
                </div><br> <br>
                
			</div>
			<div class="col-xs-12 ">
                <div class="form-group">
                  <label for="textArea" class="col-lg-2 control-label">Income Title <span class="required">*</span></label>
                  <div class="col-lg-4">
                  <form:input class="form-control" path="incomeName" id="incomeName" name="incomeName"  />
                </div>
                </div><br> <br>
                
			</div>
			<div class="col-xs-12 ">
                <div class="form-group">
                  <label for="textArea" class="col-lg-2 control-label">Income Amount <span class="required">*</span></label>
                   <div class="col-lg-4">
                  <form:input class="form-control" path="incomeAmount"  id="incomeAmount" />
                </div>
                </div><br> <br>
                
			</div>
			<div class="col-xs-12 ">
                <div class="form-group">
                  <label for="textArea" class="col-lg-2 control-label">Period</label>
                   <div class="col-lg-4">
                  <form:select path="incomeFrequencyId" id="incomeFrequencyId"  class="form-control">
               <% 
            for (CodeValueData idv:freqTypes){
                  %>
                  
           <option value='<%=idv.getCodeValueId()%>' <%=new Integer(idv.getCodeValueId()).equals(income.getIncomeFrequencyId())?" selected ":"" %>><%=CommonUtils.emptyIfNull(idv.getCodeValue())%></option>
            <%}%> 
   
                  </form:select>
                  </div>
                </div><br> <br>
                
			</div>
			<div class="col-xs-12 ">
                  <div class="form-group">
                  <label for="textArea" class="col-lg-2 control-label">Expected Growth<span class="required" aria-required="true">*</span> </label>
                  <div class="col-lg-4">
                  <form:input path="annualGrowth" class="form-control" id="annualGrowth" digits="true" onkeypress="return annualGrowthValidation(event);"/>
                </div>
   				</div><br> <br>
   				
			</div>
              </fieldset>
              </form:form>
	<div class="col-xs-12">
	<div class="col-lg-2"></div>
	<div class="col-lg-4">
	<div class="fr">
	 <input type="button"
       class="btn-primary btn-xs btn submit_btn" value="Save"></input>
     <input type="button" id="addSave"
       value="Save &amp; Add"  class="btn-primary btn-xs btn">
     
      <a class="btn-primary btn-xs btn"
       href="/FIINFRA-Client-WEB/financial/myIncome">Cancel</a>
    </div>
    </div>
</div>
