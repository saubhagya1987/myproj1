<%@page import="in.fiinfra.common.common.QueryRequest"%>
<%@page import="in.fiinfra.query.model.CommonUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.common.QueryData"%>
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%> 

<%@page import="java.util.List"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
      <% 
      QueryRequest q = (QueryRequest) request.getAttribute("q");
      List<QueryData> data=(List<QueryData>) request.getAttribute("data"); 
      String queryPanel = q.getQueryPanel();
      
      q.setQueryPanel(null);
      
      %>        
     <div class="actions clearfix">
        <div class="in_out clearfix "> <div class="fl inbox <%="inbox".equalsIgnoreCase(queryPanel)?" strong":"" %>"><a class="inbox <%="inbox".equalsIgnoreCase(queryPanel)?" active":"" %>" href="${pageContext.request.contextPath}/query/list?queryPanel=inbox&<%=q.buildQueryString()%>">inbox</a> <span class="count">${inboxCount}</span></div>
        <div class="fr sent <%="sentbox".equalsIgnoreCase(queryPanel)?"strong":"" %>">
        <a class="<%="sentbox".equalsIgnoreCase(queryPanel)?"active":"" %>" href="${pageContext.request.contextPath}/query/list?queryPanel=sentbox&<%=q.buildQueryString()%>">sent</a> 
        <span class="count">${sentCount}</span></div></div>
        <div class="export clearfix"><ul class="reset clearfix fr ">
        <li><a href="${pageContext.request.contextPath}/query/csv?queryPanel=sentbox" class="cvs queryListReportsQueryLink"></a></li><li><a href="${pageContext.request.contextPath}/query/xls?queryPanel=sentbox" class="xls queryListReportsQueryLink"></a></li></ul>
        <div class="txt fl">Export to:</div></div>
        </div>
        <div class="clearfix"></div>
        <div class="query_data">
        <ul class="heading_ul clearfix reset tabular">
        <li class="first">action</li>
        <li class="second"><span class="thead_view"></span></li>
        <li class="third">subject</li>
        <li class="fourth">query type</li>
        <li class="fifth">query owner</li>
        <li class="sixth">query for</li>
        <li class="seventh">last updated</li>
        <li class="eight">status</li>
        </ul>
        <div class="records">
        <%if(data!=null && !data.isEmpty()){ %>
 		 <% for(QueryData query:data){
        	 String actionStyle = "";
         	if(StringUtils.equals(query.getStatus(), "New")){
            	 actionStyle = "new status";
         	}
         	
         	else if(StringUtils.equals(query.getStatus(), "Cancelled")){
 				actionStyle="cancel status" ;       		
         	}
         	else if(StringUtils.equals(query.getStatus(), "Responded")){
 				actionStyle="responded status" ;       		
         	}
         	else if(StringUtils.equals(query.getStatus(), "In Progress")){
         		actionStyle="progress status";
         	}
         	else if (StringUtils.equals(query.getStatus(), "Closed")){
         		actionStyle="completed status";
         	}
         	
         %>
          <ul class="records_ul clearfix reset tabular ">
        	 <li class="first"><span class="common_custom_checkbox"></span><input type="checkbox"  class="default_checkbox" id= "querySelector" name="querySelector" value="<%=query.getQueryId()%>"/></li>
       		 <li class="second"><a href="${pageContext.request.contextPath}/query/messages?queryId=<%=query.getQueryId()%>"  ><%=query.getUnreadCount() %></a></li>
       		 <li class="third"><%=CommonUtils.emptyIfNull(query.getSubject()) %></li> 
        	 <li class="fourth"><%=CommonUtils.emptyIfNull(query.getQueryTypeName()) %></li>
        	 <li class="fifth"><%=CommonUtils.emptyIfNull(query.getQueryOwnerName()) %></li>
        	 <li class="sixth"> <%=CommonUtils.emptyIfNull(query.getQueryFor()) %></li>
        	 <li class="seventh"> <%=CommonUtils.emptyIfNull(query.getLastUpdatedDate()) %></li>
        	 <li class="eight"><span class="<%=actionStyle%>"><%=query.getStatus() %></span></li>
        	 </ul>
        	 <script>
        	 $(document).ready(function(){
        		 $('.xls').removeClass("inactiveLink");
				 $('.cvs').removeClass("inactiveLink");
        	 });
        	 </script> 
        <% }
  		}  
        else {%>
        	<div><p>No records found.</p></div>
        	<script type="text/javascript">
        	 $("#successDialog").html("No record found.");
   			 $( "#successDialog").dialog( "open" );
   			$('.xls').addClass("inactiveLink");
			 $('.cvs').addClass("inactiveLink");
        	</script>
        	
        <%} %>
        </div>
        </div>
                