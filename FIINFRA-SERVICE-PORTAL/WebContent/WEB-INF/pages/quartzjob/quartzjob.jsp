<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>Quartz</title>

    <!-- Placed at the end of the document so the pages load faster -->
    <!--<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>
	<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">-->
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
<!--	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
-->
	<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
	<style>
		.mostusedNewicon{
		                background:url(../images/allCommon-Icons.png) no-repeat -89px -2928px; 
		                padding-right:20px;
		                width:20px;
		                height:20px; 
		                padding-bottom: 15px;
		                }
		.popularicon{
		                background:url(../images/allCommon-Icons.png) no-repeat -89px -2955px; 
		                padding-right:20px;
		                width:20px;
		                height:20px; 
		                padding-bottom: 15px;}
		.favoriteicon{
		                background:url(../images/allCommon-Icons.png) no-repeat -89px -2982px; 
		                padding-right:20px;
		                width:20px;
		                height:20px; 
		                padding-bottom: 15px;}
	
	</style>

</head>
<body>
<!--css popup window start 1-->
<jsp:include page="../common/header.jsp" />
<%-- <jsp:include page="../common/common_popup.jsp" /> --%>
 	
 <!-- Center part start -->
 <section>
 
	<div class="container white">
    	<div class="container-head">
        	<div class="col-md-12" style="text-align: right;">
        		<span style="float:left;">Scheduler</span>
           	</div>
        </div >
       
        <!-- <div class="container-body" style="padding:5px;"/> -->
	  	<div class="container-body">
      	<!--  include ping side bar -->
      	<jsp:include page="schedulersidebar.jsp" />
        	<div class="col-md-9"  style="margin-top:10px; padding-left:10px;"  >
         		<div class="list-group">
        			<a class="list-group-item active" href="#">Scheduler Library Manager  </a>
           	  		<div class="accordion pull-left col-md-12" id="accordFundSel" style="margin-left:-5px;">
         
           	    			<!-- accordion-group END -->
              			</div>
           	  			<!-- accordion  END -->
   						<!-- accordion End -->
           				<div class="list-group-item">
       						<div class="topmenu">
        	
							<%-- 	<a href="<%=request.getContextPath()%>/autoping/addAutoPing.htm" id="SPAddNewAutoPingLink"><input data-params="{}" onClick="" type="button" class="dbtn createNewBtn" value="  Add New AutoPing" title="Add New AutoPing" alt="Add New AutoPing"></a>
								<input data-params="{}" type="button" id="SPDeleteAutoPingLink" class="dbtn deleteBtn" value="  Delete"  title="Delete" onclick="deletePings()">
						 --%>	</div>

							<div class="table-responsive" id="display_table_lead" style="border:none;">
		  						<div id="toreload">
		  							<display:table name="quratzList"  uid="objPortalUser" class="table table-hover table-bordered table-striped" 
										requestURI="#" sort="list" pagesize="10" id="data">
										<display:column title="Job Group" sortable="true" property="jobGroup"></display:column>
										<display:column title="Job Name" sortable="true" property="jobName"></display:column>
										<display:column title="Action">
											<a class="choose1"  style="color:#428bca" onclick="openPopupPingAction('popup${data.jobGroup}');">Action </a>
												<div class="popupnewping1" id="popup${data.jobGroup}" style="top:22%;left: 81% !important;">
									    		 <div class="close" ><a onClick="$('#popup${data.jobGroup}').hide()" ><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>
									       			<table class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0">
									        			<tr>
										            		<th class="thead">Action List</th>
										            		</tr>
											                <tr>
										       		     	<td id="ScheduleLink"><i class="scheduleicon"></i><a href="<%=request.getContextPath()%>/autoping/scheduleAp.htm?pingId=${data.jobGroup}"  style="color:#333;"><span class="user">Stop</span></a></td>
									            		
									            		</tr>
									            </table>
									            </div>
										</display:column>
									</display:table>
								</div> 
    						</div>
    					<div class="col-sm-7">
							<div class="topmenuleft">
 								<div  class="customDropdown">
       								<span >Page Size:</span>&nbsp;
   									<select  type="button" name="pageSize" id="page" onchange="pagesizeurl()" value="10">
								     	<option selected="selected" value="10">10</option>
								     	<option value="20">20</option>
								     	<option value="50">50</option>
								     	<option value="500">500</option>
								     	<option value="1000">1000</option>
								     	<option value="10000">Show All&nbsp;</option>
								     </select> 
   								</div>	
							</div>
							
							<div class="topmenuleft" >
									  <ul>
									  	<li> Export options: </li>
									    <li> <a onclick="getCSV()" title="Export in CSV" alt="Export in CSV"><i class="cvsicon"></i></a></li>
									    <li><a onclick="getXLS()" title="Export in Excel" alt="Export in Excel"> <i class="excelicon"></i></a></li>
									  </ul>
							</div>
						</div>
   						<div class="row">
     						<div class="topmenu">
         
						<%-- 		<a href="<%=request.getContextPath()%>/autoping/addAutoPing.htm" id="SPAddNewPingLink"><input data-params="{}" onClick="" type="button" class="dbtn createNewBtn" value="  Add New AutoPing" title="Add New AutoPing" alt="Add New AutoPing"></a>
								<input type="button" class="dbtn deleteBtn" id="SPDeletePingLink" value="  Delete"  title="Delete" onclick="deletePings()">
 					 --%>		</div>
   						</div>
    				</div>
				</div>
			</div>
		</div>  
       </div>
</section>
      
<!-- Center part End -->          

<jsp:include page="../common/footer.jsp" />
<script type="text/javascript">
function openPopupPingAction(id){
	$('#'+id).show();
}
</script>
 <form id="schForm">
	<input type="text" id="notifyTemplateIdToSend" name="notifyTemplateId"/>
	<input type="text" id="isActive" name="isActive"/>
</form>

</body>

</html>