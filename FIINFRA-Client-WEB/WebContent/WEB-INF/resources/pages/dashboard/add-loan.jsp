<%@page import="in.fiinfra.cp.LoanData"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.common.common.CodeValueData"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.cp.IncomeData"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<%List<CodeValueData> freqTypes =(List<CodeValueData>) request.getAttribute("freqList");
List<CodeValueData> loanTypes =(List<CodeValueData>) request.getAttribute("loanTypes");
LoanData loan=(LoanData) request.getAttribute("loan");%>
<script>
$(document).ready(function(){
$('#loan-form').validate({
	errorClass:"errors", 
               rules: {
                   loanName:{ 
                   	required: true
                   },
                   loanAmount: {
                           required: true,
                           digits:true,
                           min:1
                       },
                   emiAmount: {
                           required: true,
                           digits:true,
                           min:1
                       }
                  
               },
               messages: {
               	loanName: "Enter Loan Name",
               	loanAmount: "Enter Amount",
               	emiAmount: "Enter EMI"
                   
               }
              
           });
});
</script>
<script>
function saveLoan() {
 	if($('#loan-form').valid()){
 		$('#loan-form').submit();	
 	}
}
</script>

<%-- <% /* LoanData loan=(LoanData) request.getAttribute("n");  */
	/* int index1 =(Integer) request.getAttribute("index");
	String s1=(String) request.getAttribute("s"); */
	List<CodeValueData> freqTypes =(List<CodeValueData>) request.getAttribute("freqList");
	List<CodeValueData> loanTypes =(List<CodeValueData>) request.getAttribute("loanTypes");
%>  --%>

<%--  <div id="loanDiv_<%=index1 %>" class="my_portfolio_li_bx <%=index1 == 1 ? "first_row": index1==0?"dummy": ""%> " style="<%=index1==0?"display:none":"" %>">
 
  <form method="POST" action="${pageContext.request.contextPath}/portfolio/myLoan/save" >
         <div class="my_portfolio_li_bx_in">
          <ul>
            <li class="input_txt_one fl">
            <div id="typeIcon" class="icon_<%=loan.getLoanTypeId() != null ?loan.getLoanTypeId():loanTypes.get(0).getCodeValueId() %>"></div></li>  
            <li class="input_txt_two fl">
              <input id="action" name="action" type="hidden"  value="save"/>
              <input id="partyLoanId" name="partyLoanId" type="hidden"  value="<%=CommonUtils.zeroIfNULL(loan.getPartyLoanId())%>"/>
               <select id="loanTypeId" name="loanTypeId" class="required">
                  <%  
                  for (CodeValueData idv:loanTypes){
                  %>
                  
                  <option value='<%=idv.getCodeValueId()%>' <%=new Integer(idv.getCodeValueId()).equals(loan.getLoanTypeId())?" selected ":"" %>><%=CommonUtils.emptyIfNull(idv.getCodeValue())%></option>
                  <%}%>
                  </select>
                   
            </li>
            <li class="input_txt_three fl">
              <input class="grt_bx required numbersOnly" value="<%=loan.getLoanAmount()>0?loan.getLoanAmount():0 %>" name="loanAmount" id="loanAmount"/>
            </li>
            <li class="input_txt_four fl">
             <input class="grt_bx required numbersOnly" value="<%=loan.getLoanTenureMonths()!= null&&loan.getLoanTenureMonths()>0?loan.getLoanTenureMonths():"0" %>" name="loanTenureMonths" id="loanTenureMonths"/>
            </li>
            <li class="input_txt_five fl">
             <input class="grt_bx required numbersOnly" value="<%=loan.getEmiAmount()>0?loan.getEmiAmount():0 %>" name="emiAmount" id="emiAmount"/>
            </li>
            <li class="input_txt_six fl">
            <select class="sel_wid" id="emiFreqId" name="emiFreqId" class="required">
                  <%  
                  for (CodeValueData idv:freqTypes){
                  %>
                  
                  <option value='<%=idv.getCodeValueId()%>' <%=new Integer(idv.getCodeValueId()).equals(loan.getEmiFreqId())?" selected ":"" %>><%=CommonUtils.emptyIfNull(idv.getCodeValue())%></option>
                  <%}%>
                  </select>
              <div class="exp_grt_bx">
                <input type="text" class="exp_grt_txt " name="annualGrowth" value="<%=income.getAnnualGrowth() %>" />
                <div class="exp_grt_per">%</div>
              </div>
            </li>
            <li class="input_txt_seven fl"> <a href="#" class="save_row"> </a>
            </li>
            <li class="input_txt_eight fl"> <a href="#"  class="delete_row"> </a></li>
            <li class="input_txt_nine fl"> <a class="add_doc add_note"> </a></li>
             <li class="input_txt_ten fl"> <a class="add_query"> </a></li>
            <li class="input_txt_nine fl"> <a href="${pageContext.request.contextPath}/notes/note?refId=<%=loan.getPartyLoanId()%>&refTypeId=111015&<%=BaseRequest.encode("returnUrl", "/portfolio/myLoan")%>" class="add_doc"> </a></li>
            <li class="input_txt_ten fl"> <a href="${pageContext.request.contextPath}/query/add" class="add_query"> </a></li>
            <div class="clr"></div>
             
          </ul>
          
               </div>
 </form>
        </div>  --%>
        
        
		 <form:form method="POST" id="loan-form" action="${pageContext.request.contextPath}/portfolio/myLoan/save" commandName="loan" >
		<input id="partyLoanId" name="partyLoanId" type="hidden"   value="<%=CommonUtils.zeroIfNULL(loan.getPartyLoanId())%>"/>
		<fieldset>
			<div class="col-xs-12 ">
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">Loan Type</label>
					<div class="col-lg-4">
						<form:select class="form-control" id="loanTypeId" path="loanTypeId">
<%  
                  for (CodeValueData idv:loanTypes){
                  %>
                  
                  <option value='<%=idv.getCodeValueId()%>' <%=new Integer(idv.getCodeValueId()).equals(loan.getLoanTypeId())?" selected ":"" %>><%=CommonUtils.emptyIfNull(idv.getCodeValue())%></option>
                  <%}%>
						</form:select>
					</div>
				</div>
				<br> <br>
			</div>
			
			<div class="col-xs-12 ">
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">Loan Amount <span class="required">*</span></label>
					<div class="col-lg-4">
						<form:input type="text" class="form-control"
							
							path="loanAmount" id="loanAmount"/>
					</div>
				</div>
				<br> <br>
			</div>
			<div class="col-xs-12 ">
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">Tenure</label>
					<div class="col-lg-4">
						<form:input class="form-control"
							
							path="loanTenureMonths"/>
					</div>
				</div>
				<br> <br>
			</div>
			<div class="col-xs-12 ">
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">EMI Amount <span class="required">*</span></label>
					<div class="col-lg-4">
						<form:input type="text" class="form-control"
							
							path="emiAmount"/>
					</div>
				</div>
				<br> <br>
			</div>
			<div class="col-xs-12 ">
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">EMI Frequency
						</label>
					<div class="col-lg-4">
						<form:select class="form-control" id="emiFreqId" path="emiFreqId">
<%  
                  for (CodeValueData idv:freqTypes){
                  %>
                  
                  <option value='<%=idv.getCodeValueId()%>' <%=new Integer(idv.getCodeValueId()).equals(loan.getEmiFreqId())?" selected ":"" %>><%=CommonUtils.emptyIfNull(idv.getCodeValue())%></option>
                  <%}%>
                  </form:select>
						
					</div>
				</div>
				<br> <br>
			</div>
		</fieldset>
	</form:form>
	<div class="col-xs-12" align="center">
	<div class="col-lg-2"></div>
	<div class="col-lg-4">
	<div class="fr">
	  <input type="button"
       class="btn-primary btn-xs btn" value="Save" onClick="saveLoan();"></input>
     <input type="button" id="addSave"
       value="Save &amp; Add" onClick="saveLoan();" class="btn-primary btn-xs btn">
    
      <a class="btn-primary btn-xs btn"
       href="/FIINFRA-Client-WEB/portfolio/myLoan">Cancel</a>
    </div>
    </div>
    </div>
	  