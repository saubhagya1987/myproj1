<!-- Custom Selectbox starts -->
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="in.fiinfra.common.diy.models.Task"%>
<%@page import="in.fiinfra.common.common.TaskData"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.common.common.QueryData"%>

<!-- Custom Selectbox Ends -->

<script>
$(document).ready(function () {
    /* Equity*/
    $("#inner_contents_my_portfolio_data .equity_div_dragger").click(function () {
      //  $(".equity_list_bx").FadeIn("slow");
		 $.when($(".list_bx").not(".equity_list_bx").fadeOut("slow")).done(function() {
          $(".equity_list_bx").fadeToggle("slow");
		  });
       });

    /*Debts*/
    $("#inner_contents_my_portfolio_data .debts_div_dragger").click(function () {
      //  $(".travel_goals_list_bx").slideToggle("slow");
	   $.when($(".list_bx").not(".debts_list_bx").fadeOut("slow")).done(function() {
          $(".debts_list_bx").fadeToggle("slow");
		  });
    });

    /*Gold*/
    $("#inner_contents_my_portfolio_data .gold_div_dragger").click(function () {
      //  $(".travel_goals_list_bx").slideToggle("slow");
	   $.when($(".list_bx").not(".gold_list_bx").fadeOut("slow")).done(function() {
          $(".gold_list_bx").fadeToggle("slow");
		  });
    });
});
</script>
  <!-- end of "header" id -->
  <!-- end of "nav-menu" id -->
  <%-- <div id="header-strip" class="fl">
  <jsp:include page="../menu.jsp"></jsp:include>
    <h3 class="clearfix fl">MY ALERTS</h3>
   </div> --%>
   
   
   
  <!-- end of "header-strip" id -->
  
  <!-- <div id="inner-shadow-strip"></div> -->
  <!-- end of "inner-shadow-strip" id -->
  
  <div id="contents"> 
    <!--<div id="data-graph-bx">
      <div id="data-graph" class="common_sliding_radio"> <span class="lbl_first lbl">Data</span> <span class="lbl_second lbl">Graph</span> </div>
      <div class="clr"></div>
    </div>-->
    <% List<Task> lstTask=(List<Task>) request.getAttribute("taskList");%>
   
		<!-- Table for Pending Tasks  -->
		
		<div class="col-xs-12">
			<div class="table-header">Pending Tasks</div>
		<%
			if (lstTask != null && !lstTask.isEmpty()) {
		%>
			<table id="sample-table-1"
				class="table table-striped table-bordered table-hover">
				<thead>
					<!-- <tr>
						<th class="hidden-480" colspan="4">Pending Tasks</th>
					</tr> -->
					<tr>
						<th class="hidden-480">Owner</th>
						<th class="hidden-480">Due Date</th>
						<th class="hidden-480">For</th>
						<th class="hidden-480">What</th>
					</tr>
				</thead>
				
				<tbody>
				<%
					for(Task t: lstTask) {
				%>
					<tr>
						<td class="hidden-480"><%=StringUtils.left(t.getOwnerPartyName(),20) %></td>
						<td class="hidden-480"><%=t.getDueDateTimeString() %></td>
						<td class="hidden-480"><%=t.getSubject() %></td>
						<td class="hidden-480"><%=t.getStatusName() %></td>
					</tr>
					<%
					}
				%>
				</tbody>
				
			</table>
      </div>
		<%
			}  else {
		%>
          
             <div class="clr"></div>
            <div class="no_data_message">There are no Pending Tasks for you</div> 
          
		<%
			}
		%>
		<!-- End of Table -->

 


		<%
			List<QueryData> queries= (List<QueryData>) request.getAttribute("queryList");
		%>
  
          <br><br><br>
          <div class="col-xs-12">
			<div class="table-header">Pending Queries</div>
			 <%if (queries != null&& !queries.isEmpty()) { %>
			<table id="sample-table-1"
				class="table table-striped table-bordered table-hover">
				<thead>
					<!-- <tr>
						<th class="hidden-480" colspan="4">Pending Tasks</th>
					</tr> -->
					<tr>
						<th class="hidden-480">Owner</th>
						<th class="hidden-480">Last Update</th>
						<th class="hidden-480">Subject</th>
						<th class="hidden-480">Type</th>
					</tr>
				</thead>
				
				<tbody>
          
          
            <% 
            for(QueryData q:queries ){ 
            	String actionStyle = "";
             	if(StringUtils.equals(q.getStatus(), "New")){
                	 actionStyle = "new status";
             	}
             	
             	else if(StringUtils.equals(q.getStatus(), "Cancelled")){
     				actionStyle="cancel status" ;       		
             	}
             	else if(StringUtils.equals(q.getStatus(), "Responded")){
     				actionStyle="responded status" ;       		
             	}
             	else if(StringUtils.equals(q.getStatus(), "In Progress")){
             		actionStyle="progress status";
             	}
             	else if (StringUtils.equals(q.getStatus(), "Closed")){
             		actionStyle="completed status";
             	}
            
            %>
         
            <tr>
						<td class="hidden-480"><%=StringUtils.left(q.getQueryOwnerName(),20) %></td>
						<td class="hidden-480"><%=q.getLastUpdatedDate() %></td>
						<td class="hidden-480"><a href="${pageContext.request.contextPath}/query/messages?queryId=<%=q.getQueryId()%>&<%=BaseRequest.encode("returnUrl", "/common/alerts")%>"  class="comment_row"><%=q.getSubject() %></a></td>
						<td class="hidden-480"><%=q.getQueryTypeName() %></td>
					</tr>
            
            
          <%}%>
          </tbody>
				
			</table>
		</div>
          
            
          
      <%} else { %>
          
             <div class="clr"></div>
            <div class="no_data_message">There are no Pending Queries for you</div> 
          
          <% } %>
      </div>
    