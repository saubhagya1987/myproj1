<%@page import="in.fiinfra.common.common.QueryRequest"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>

<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.common.QueryData"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<Script>
  function onDelete(queryId){
		showConfirm("Delete Current Record ?", function() {
			window.location.href= "${pageContext.request.contextPath}/query/delete?queryIds="+queryId;
		});
  }
</Script> 
<% 
      QueryRequest q = (QueryRequest) request.getAttribute("q");
      List<QueryData> data=(List<QueryData>) request.getAttribute("data"); 
      String queryPanel = q.getQueryPanel();
      q.setQueryPanel(null);
      
      %>

  <!-- end of "header" id -->
  <!-- end of "nav-menu" id -->
  <%-- <div id="header-strip" class="fl">
  <jsp:include page="../menu.jsp"></jsp:include>
    <h3 class="clearfix fl">QUERY LIST</h3>
   <a href="${pageContext.request.contextPath}/query/add" class="add-new-query-btn clearfix fr"><img src="${pageContext.request.contextPath}/resources/images/transparent.png" />Add New Query</a>

  </div> --%>
  <!-- end of "header-strip" id -->
  
  <!-- <div id="inner-shadow-strip"></div> -->
  <!-- end of "inner-shadow-strip" id -->
  <div class="topmenu pull-right">
  <a href="${pageContext.request.contextPath}/query/add" class="btn-primary btn-xs btn">
  <span class="menu-text">Add New Query</span>
  </a>
  </div>
  <div id="contents"> 
    <!--<div id="data-graph-bx">
      <div id="data-graph" class="common_sliding_radio"> <span class="lbl_first lbl">Data</span> <span class="lbl_second lbl">Graph</span> </div>
      <div class="clr"></div>
    </div>-->
    <%if (data !=null && !data.isEmpty()) {%>
    <br><br><br>
    <div class="col-xs-12">
								<table id="sample-table-1"
										class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th class="hidden-480 center">Subject</th>
												<th class="hidden-480 center">Type</th>
												<th class="hidden-480 center">Owner</th>
												<th class="hidden-480 center">Last Update</th>
												<th class="hidden-480 center">Status</th>
												<th class="hidden-480 center">Actions</th>
											</tr>
										</thead>
										
										<tbody>
											<% for(QueryData query:data){%>
											<tr>
												<td class="hidden-480 center"><%=CommonUtils.emptyIfNull(query.getSubject()) %></td>
												<td class="hidden-480 center"><%=CommonUtils.emptyIfNull(query.getQueryTypeName()) %></td>
												<td class="hidden-480 center"><%=CommonUtils.emptyIfNull(query.getQueryOwnerName()) %></td>
												<td class="hidden-480 center"><%=CommonUtils.reFormatDate(query.getLastUpdatedDate()) %></td>
												<td class="hidden-480 center ">
																									
													<%if("New".equals(CommonUtils.emptyIfNull(query.getStatus()))){ %>
													<span class="label"><%= CommonUtils.emptyIfNull(query.getStatus()) %></span>
													<%} %>
													<%if("In Progress".equals(CommonUtils.emptyIfNull(query.getStatus()))){%>
													<span class="label label-sm label-success"><%= CommonUtils.emptyIfNull(query.getStatus()) %></span>
													<%} %>
													<%if("Responded".equals(CommonUtils.emptyIfNull(query.getStatus()))){ %>
													<span class="label label-sm label-info"><%= CommonUtils.emptyIfNull(query.getStatus()) %></span>
													<%} %>
													<%if("Closed".equals(CommonUtils.emptyIfNull(query.getStatus()))){ %>
													<span class="label label-sm label-inverse"><%= CommonUtils.emptyIfNull(query.getStatus()) %></span>
													<%} %>
													<%if("Cancelled".equals(CommonUtils.emptyIfNull(query.getStatus()))){ %>
													<span class="label label-sm label-warning"><%= CommonUtils.emptyIfNull(query.getStatus()) %></span>
               <%}%> 
												</td>
												<td>
													<div>
            <a class="fa fa-pencil fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Edit" href="${pageContext.request.contextPath}/query/edit?queryId=<%=query.getQueryId()%>"></a>&nbsp;&nbsp;
			<a class="fa fa-trash fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Delete" onClick="onDelete(<%=query.getQueryId()%>)"></a>&nbsp;&nbsp;
			<a class="fa fa-question fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Add Question" href="${pageContext.request.contextPath}/query/messages?queryId=<%=query.getQueryId()%>"></a>
													
            </div>
												</td>
											</tr>
											<%}%> 

											</tbody>
									</table>
        </div>
   <%} else { %>
     <div class="clr"></div>     
        <div class="no_data_message">NO DATA FOUND</div> 
 <%} %>
    <!-- end of "inner-contents" id --> 
  </div>
  <!-- end of "contents" id -->

