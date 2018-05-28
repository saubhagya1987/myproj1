
<%@page import="in.fiinfra.common.diy.models.ProductPurchaseURLs"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.cp.AllocationData"%>

<%@page import="in.fiinfra.cp.PlanData"%>
<%@page import="java.util.List"%>
<%List<PlanData> planData=(List<PlanData>) request.getAttribute("planData"); 
 List<ProductPurchaseURLs> productsUrl = (List<ProductPurchaseURLs>) request.getAttribute("productsOnline");%>
<!-- Custom Selectbox starts --><script>
function buyOnline(buyOnline){
	 var buyOnlineProducts = buyOnline;
	 console.log(buyOnlineProducts)
	  
	  $.ajax({
			 type :'GET',
	         url : "${pageContext.request.contextPath}/portfolio/myPlans/buyOnline?isUrl=buyOnlineProducts",
			 success : function(result)
			 {
				   alert(buyOnline);
				   window.location.href=''+buyOnlineProducts;
		    },	 
	          
		}); 
}
</script>
<!-- Custom Selectbox Ends -->

<!-- custom scroll to "common_in_content" -->


<!-- custom scroll to "common_in_content" -->

  <div>
     
       <%if(!planData.isEmpty()) {  %>
   
      <!--title starts-->
      <%long totalInvestment=0;
      for(PlanData p:planData){ %>
      
     <%--  <div class="my_plan_title_bx">
        <ul>
          <li class="input_title_one fl">
            <div class="icon_<%=p.getFpSectionTypeID() %>"></div>
          </li>
          
          <li class="input_title_two fl">
          <div class="my_plan_title"><%=p.getSectionType() %></div>
          <span>Action Needed</span></li>
          <li class="input_title_three fl"><span>Target Amount</span></li>
          <li class="input_title_four fl"><span>Investment Amount</span></li>
          <li class="input_title_five fl"><span>Product</span></li>
          <li class="input_title_six fl"><span>Status</span></li>
          <li class="input_title_ten fl"><span>Add Notes</span></li>
          <li class="input_title_eleven fl"><span>Raise Query</span></li>
          <div class="clr"></div>
        </ul>
      </div> --%>
      <!-- New Table  Head -->
      
      	
      	<div class="col-xs-12">
      	<div class="table-header"><%=p.getSectionType() %></div>
	<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th class="">Action Needed</th>
				<th class="">Target Amount</th>
				<th class="">Investment Amount</th>
				<th class="">Product</th>
				<th class="">Status</th>
				<th class="">Buy</th>
				<th class="">Actions</th>
			</tr>
      	</thead>
      <!-- New Table  Head End-->
      
      
      <!--title ends--> 
      <!--txt starts-->
     <!--  <div class="my_plan_li_bx"> -->
     
     	<tbody>
     
      <% 
      for(AllocationData a:p.getAllocation()){ 
        String style = "";
        switch(a.getExecutionStatusId()){
        case 95002:style = "progress";break;
        case 95003:style = "completed";break;
        case 95004:style = "cancelled";break;
        }
      %>
        <%-- <div class="my_plan_li_bx_in">
          <ul>
            <li class="input_txt_one fl"> &nbsp;<img name src width="1" height="1" alt/> </li>
            <li class="input_txt_two fl"><%=CommonUtils.actionNeeded(a, p) %> </li>
            <li class="input_txt_three fl"> <div class="my_plan_rupee"><%=CommonUtils.formatAmountINR(a.getTargetAmount()) %></div> </li>
            <li class="input_txt_four fl"><div class="my_plan_rupee"><%=a.getInvestedAmount() != 0?( CommonUtils.formatAmountINR(a.getInvestedAmount(),false) +" "+(CommonUtils.emptyIfNull(a.getFrequency()))):"0" %></div> </li>
            <li class="input_txt_five fl"><%=CommonUtils.emptyIfNull(a.getProductName()) %> </li>
            <%if(a.getExecutionStatusId()==0) {
            	style = "pending";
            %>
            <li class="input_txt_six fl">
            <a href="${pageContext.request.contextPath}/portfolio/myPlans/approve?productId=<%=a.getProductId()%>&prodAllocationId=<%=a.getProdAllocationId()%>&fpActionPlanId=<%=a.getFpActionPlanId()%>"  class="<%=style %>">Click here to approve</a> </li>
            <% }
            else{
            %>
            <li class="input_txt_six fl"><a  class="<%=style%>"><%=a.getStatus() %></a> </li>
            <%} %>
            <li class="input_txt_ten fl"><div class="n-f"><%= ((a.getNoteCount() != null) ? a.getNoteCount() : 0 ) %></div><a href="${pageContext.request.contextPath}/notes/note?refId=<%=a.getProdAllocationId()%>&refTypeId=111010&<%=BaseRequest.encode("returnUrl", "/portfolio/myPlans")%>" class="add_notes"> </a></li>
            <li class="input_txt_eleven fl"><a href="${pageContext.request.contextPath}/query/add?refId=<%=a.getProdAllocationId()%>&refTypeId=111010&<%=BaseRequest.encode("returnUrl", "/portfolio/myPlans")%>" class="raise_query"> </a> </li>
            <div class="clr"></div>
          </ul>
        
        </div> --%>
        <!-- TR -->
        
        	<tr>
				<td class=""><%=CommonUtils.actionNeeded(a, p) %></td>
				<td class=""><%=CommonUtils.formatAmountINR(a.getTargetAmount()) %></td>
				<td class=""><%=a.getInvestedAmount() != 0?( CommonUtils.formatAmountINR(a.getInvestedAmount(),false) +" "+(CommonUtils.emptyIfNull(a.getFrequency()))):"0" %></td>
				<td class=""><%=CommonUtils.emptyIfNull(a.getProductName()) %></td>
				
				<%if(a.getExecutionStatusId()==0) {
            	style = "pending";%>
				<td class=""><a href="${pageContext.request.contextPath}/portfolio/myPlans/approve?productId=<%=a.getProductId()%>&prodAllocationId=<%=a.getProdAllocationId()%>&fpActionPlanId=<%=a.getFpActionPlanId()%>"  class="<%=style %>">Click here to approve</a></td>
				<% }
            else{
            %>
				<td class=""><a  class="<%=style%>"><%=a.getStatus() %></a></td>
				<%} %>
				
			<td class="">
			
			<% for(ProductPurchaseURLs url:productsUrl) {  %>
			<% if((a.getProductId().equals(url.getProductId()))) {%>
			<a href="" target="_blank" onclick="buyOnline('<%=url.getUrl()%>')" class="btn-primary btn-xs btn">Buy Online</a>
			<%}} %>
			</td>
															<td class=""><div class="hidden-sm hidden-xs btn-group">

													<%-- 	<button class="btn btn-xs btn-info">
															<a href="${pageContext.request.contextPath}/financial/myIncome/addUpdate?incomeId=<%=n.getPartyIncomeId()%>">
															<i class="fa fa-pencil btn-xs btn-info"></i></a>
														</button> --%>

														<button class="btn btn-xs btn-info">
														<a href="${pageContext.request.contextPath}/notes/note?refId=<%=a.getProdAllocationId()%>&refTypeId=111010&<%=BaseRequest.encode("returnUrl", "/portfolio/myPlans")%>">
															<i class="fa fa-pencil btn-xs btn-info"></i></a>
														</button>
														
													<a class="icon-add-notes fa-2x" href="${pageContext.request.contextPath}/notes/note?refTypeId=111010&<%=BaseRequest.encode("returnUrl", "/financial/myPlans")%>&refId=<%=n.getProdAllocationId() %>">
															</a>
												
												
														<a class="fa fa-question fa-2x" href="${pageContext.request.contextPath}/query/add?refId=<%=a.getProdAllocationId()%>&refTypeId=111010&<%=BaseRequest.encode("returnUrl", "/portfolio/myPlans")%>">
															</a>
														
							
            </div></td>
							
			</tr>
        	<!-- End TR -->
        <%
        totalInvestment+=a.getInvestedAmount();
      } %>
      </tbody>
      </table>
      </div>
    <!--   </div> -->
      <%} %>
        <!--txt ends --> 
        <!--txt ends --> 
        
      <div class="row">
	<div class="col-xs-6"></div>
	<div class="col-xs-6">
		<div class="dataTables_paginate paging_simple_numbers"
			id="sample-table-2_paginate">
			<label class="pull-right label label-lg arrowed-in-right arrowed-in hidden-xs"><span>Net Investment :&nbsp</span><i class="fa fa-inr fa-lg"></i><span><%=CommonUtils.formatAmountINR(totalInvestment, true)%></span></label>
		</div>
	</div>
</div>
      
 
    <%}else{  %>
   	<br><br><br>
   <div class="clr"></div>     
        <div class="no_data_message">There is no Plan Defined by you</div> 
    <%} %>
    <!-- end of "inner-contents" id --> 
 
</div>
