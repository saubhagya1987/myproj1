<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" import="java.util.*"%>
<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Login Details</title>

    <!--<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>-->
    <%-- <script type="text/javascript" src="<%=request.getContextPath()%>/js/nicEdit.js"></script> --%>
<%-- <style>

#ui-id-1{
	width:168px!important;
	padding-left:20px!important;}
#ui-id-2{
	width:168px!important;
	padding-left:24px!important;}
.ui-menu-item{
	list-style:none !important;}
.ui-corner-all{
	margin-left:-10px!important;}
.ui-helper-hidden-accessible{color:#000;}

</style>  
 <!-- -responsive css-->
<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">-->
<link href="<%=request.getContextPath()%>/css/style_serviceportal.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
<!--<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.ui.all.css" />-->
<!-- -responsive css-->
<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
<!--<script src="js/jquery-1.9.1.js"></script>-->
<!--<script src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.position.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.menu.js"></script>-->
<script src="<%=request.getContextPath()%>/js/jquery.ui.autocomplete.js"></script>
 <!-- <script>
	$(function() {
		var availableTags = [
			"ActionScript",
			"AppleScript",
			"Asp",
			"BASIC",
			"C",
			"C++",
			"Clojure",
			"COBOL",
			"ColdFusion",
			"Erlang",
			"Fortran",
			"Groovy",
			"Haskell",
			"Java",
			"JavaScript",
			"Lisp",
			"Perl",
			"PHP",
			"Python",
			"Ruby",
			"Scala",
			"Scheme"
		];
		$( "#tags" ).autocomplete({
			source: availableTags
		});
		
	});
	</script>
 -->
<!-- <script type="text/javascript">
	bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
</script>
<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">
 -->
 --%>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<!--css popup window start 1-->
<div style="display: none;" id="blanket"></div>
<div style="display: none; width:450px; height:380px; top:100px" id="popUpDiv">
<div class="close" style="margin-right:10px;"><a onClick="popup('popUpDiv')" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>

    <div id="popupwrapper_contactform">
   		
  		<div class="heading_contactform"><h3>Log Trouble Ticket</h3></div>
        <div id="poptable_contactform">
        	
             <div class="full">
              <input type="text" class="form-control" placeholder="Subject">
               </div>
                <div class="full" >
               <textarea class="form-control" rows="3" placeholder="Your Question" style="height: 100px;"></textarea>
			</div>
             <div class="full">
              <input type="text" class="form-control" placeholder="Attach File" >
              
               </div>
 </div>
   <div class="topbuttonholder">
        	<form><input class="dbtn" value="Send Email"   id="loginButton" type="button">	
            <input class="dbtn" value="Cancel" onClick="popup('popUpDiv')"  id="loginButton" type="button">	</form>	
        </div>  
        
	</div>
</div>
<!--css popup window 1 close-->
<!--css popup window start 2-->
<div style="display: none;" id="blanket"></div>
<div style="display: none; width:650px; height:620px; top:100px; overflow: auto;" id="popUpAlertaddnote" class="alert">
<div class="close" style="margin-right:10px;"><a onClick="popup('popUpAlertaddnote')" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>
<div id="addnote">
    <div id="popupwrapper_contactform">
   		<div class="heading_contactform" ><h3>Add User</h3></div>
        <div id="poptable_contactform" style="padding:10px; height:250px;">
        <span class="searchpadding padding_top" style="float:left; width:150px;">Role Name   <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder=" "></span>
 <div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Description    </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder=" "></span>
<div class="clearfix"></div>
       
        <span class="searchpadding padding_top" style="float:left; width:150px;">Access Starts Date <span class="red">*</span>   </span>
<span  class="searchpadding padding_top " style="float:left; width:400px; ">
<input name="address" type="text" id="date1" class="datepicker" style="float:left;"> <span style="float:left; margin:5px;"> <i class="calendaricon" ></i></span>
<input name="address" type="text" style="width:30px; float:left; margin:0 3px 0 0 ;"  class="form-control"  >&nbsp;
<input name="address" type="text" style="width:30px;; float:left; margin:0 3px 0 0 ;" >&nbsp;
<select name="Saving" class="form-control"  style="width:60px; float:left;">
                                <option>AM</option>	
                                <option>PM</option>
                              
        </select></span>
<div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Access Expires Date  </span>
<span  class="searchpadding padding_top " style="float:left; width:400px; ">
<input name="address" type="text" id="date1" class="datepicker" style="float:left;"> <span style="float:left; margin:5px;"> <i class="calendaricon" ></i></span>
<input name="address" type="text" style="width:30px; float:left; margin:0 3px 0 0 ;"  class="form-control"  >&nbsp;
<input name="address" type="text" style="width:30px;; float:left; margin:0 3px 0 0 ;" >&nbsp;
<select name="Saving" class="form-control"  style="width:60px; float:left;">
                                <option>AM</option>	
                                <option>PM</option>
                              
        </select></span>

        <div class="clearfix"></div>
         <span class="searchpadding padding_top" style="float:left; width:150px;">Control Options   <span class="red">*</span> </span>
<span  class="searchpadding padding_top " style="float:left; width:400px; ">
<input id="1" value="1" type="checkbox">
<span class="user">Active?</span>
<input id="1" value="1" type="checkbox">
<span class="user">Locked?</span>
<input id="1" value="1" type="checkbox">
<span class="user">Logged In?</span>
<input id="1" value="1" type="checkbox">
<span class="user">Force Change Password?
</span>
 
 </div>
  <div class="topbuttonholder">
        	<input class="dbtn" value="Save & New" id="Save" type="button">	
            <input class="dbtn" value="Save & Close" id="Save" type="button">	
            <input class="dbtn" value="Cancel" id="Cancel" type="button">	
      </div>
    </div>
	</div>
    
    
    <!-- delete-->
    <div id="deletenote">
    <div id="popupwrapper_contactform">
   		
  		<div class="heading_contactform"><h3> Message</h3></div>
        <div id="poptable_contactform" style="padding:10px;">
        	Do you want to delete this records selected? Please confirm.
 </div>
  <div class="topbuttonholder">
        	<form><input class="dbtn" value="Yes" id="Yes" type="button">	
            <input class="dbtn" value="No" id="No" type="button">
           	</form>	
        </div>
        </div>
	</div>
    
    <!-- delete-->
     <!-- Edit-->
    <div id="editnote">
    <div id="popupwrapper_contactform">
   		
  		<div class="heading_contactform"><h3> Edit User </h3></div>
       <div id="poptable_contactform" style="padding:10px; height:250px;">
        <span class="searchpadding padding_top" style="float:left; width:150px;">Role Name   <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder=" "></span>
 <div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Description    </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder=" "></span>
<div class="clearfix"></div>
       
        <span class="searchpadding padding_top" style="float:left; width:150px;">Access Starts Date <span class="red">*</span>   </span>
<span  class="searchpadding padding_top " style="float:left; width:400px; ">
<input name="address" type="text" id="date1" class="datepicker" style="float:left;"> <span style="float:left; margin:5px;"> <i class="calendaricon" ></i></span>
<input name="address" type="text" style="width:30px; float:left; margin:0 3px 0 0 ;"  class="form-control"  >&nbsp;
<input name="address" type="text" style="width:30px;; float:left; margin:0 3px 0 0 ;" >&nbsp;
<select name="Saving" class="form-control"  style="width:60px; float:left;">
                                <option>AM</option>	
                                <option>PM</option>
                              
        </select></span>
<div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Access Expires Date  </span>
<span  class="searchpadding padding_top " style="float:left; width:400px; ">
<input name="address" type="text" id="date1" class="datepicker" style="float:left;"> <span style="float:left; margin:5px;"> <i class="calendaricon" ></i></span>
<input name="address" type="text" style="width:30px; float:left; margin:0 3px 0 0 ;"  class="form-control"  >&nbsp;
<input name="address" type="text" style="width:30px;; float:left; margin:0 3px 0 0 ;" >&nbsp;
<select name="Saving" class="form-control"  style="width:60px; float:left;">
                                <option>AM</option>	
                                <option>PM</option>
                              
        </select></span>

        <div class="clearfix"></div>
         <span class="searchpadding padding_top" style="float:left; width:150px;">Control Options   <span class="red">*</span> </span>
<span  class="searchpadding padding_top " style="float:left; width:400px; ">
<input id="1" value="1" type="checkbox">
<span class="user">Active?</span>
<input id="1" value="1" type="checkbox">
<span class="user">Locked?</span>
<input id="1" value="1" type="checkbox">
<span class="user">Logged In?</span>
<input id="1" value="1" type="checkbox">
<span class="user">Force Change Password?
</span>
 
 </div>
  <div class="topbuttonholder">
        	<input class="dbtn" value="Save" id="Save" type="button">	
           
            <input class="dbtn" value="Cancel" id="Cancel" type="button">	
      </div>
    </div>
	</div>
</div>
<!--css popup window 2 close-->

    
      <!--Nav Menu Start--> 
 <div class="navbar-inverse">
	<div class="container">
    <div class="navbar-header">
		<button class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse" type="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
    	</button>
    <!--<a class="navbar-brand" href="#"> </a>-->
	</div>
</div>
</div>
	<!-- Code for displaying sub tab -->
	<% String msg=(String)request.getAttribute("codes");%>
	<%
	if(msg==null)
	{
	%>
	
	<% 
	}
	else
	{
	%>
	<%-- <div class="container">
				<div class="portfoliostrip collapse navbar-collapse">
					<ul class="navbar-sub">

						<li id="SPUserLink" class="active"><a
							href="<%=request.getContextPath()%>/user/loaduser.htm">User</a></li>
						<li id="SPRoleLink"><a
							href="<%=request.getContextPath()%>/rolelist/loadrole.htm">Role</a></li>
						<li id="SPSecurityReportsLink"><a href="#">Security Reports</a></li>

					</ul>
				</div>
			</div> --%>
	<% 
	}
	%>
	<!-- End of displaying sub tab -->
		

<!--Nav Menu End--> 
<!--breadcrum Menu Start--> 


 <!-- Center part start -->
 
 
 <div class="container-head">
    	  <div class="col-md-12" style="text-align: right;"> 
             <!-- accordion start-->
           
           	  <div class="accordion pull-left col-md-12" id="accordFundSel">
                <div class="accordion-group">
                
      
          <div class="page-header clearfix">
            <h1 class="pull-left">View Login Details</h1>
            <div class="nav-search pull-right" id="">
              <form class="form-search">
                
              </form>
          </div>  
 

     
    <%-- <div class="container white">
    	<div class="container-head">
    	  <div class="col-md-12" style="text-align: right;"> 
             <!-- accordion start-->
          
           	  <div class="accordion pull-left col-md-12" id="accordFundSel">
           	   <form method="post">
                <div class="accordion-group">
                  <div class="col-md-11" style="width:96%;" > 
                 	 	<span  style="float:left;">View Login Details</span>
                  		<span  class="col-md-10" style="float:right; margin-top:-3px;"> <input name="searchtext"  type="text" id="tags"  placeholder="Quick Search"></span>
                  </div>

                </div>
           	    <!-- accordion-group END -->
           	      </form>
              </div> --%>
           	  <!-- accordion  END -->
     
              
               <!-- accordion End -->
            </div >
          </div >
  	  <div class="container-body" style="margin-top:0px;">
        <!-- center -->


				<ul class="pagination pagination-sm">
					<!-- <li class="disabled"><a href="#">&laquo;</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li> -->
				</ul>
				

		<div class="table-responsive" id="display_table_lead" style="border:none;">
		  <div id="toreload">
		  <table id="grid-table"></table>
		<div id="grid-pager"></div>

						<%-- <display:table name="loginHist" uid="objPortalUser"
							class="table table-hover table-bordered table-striped"
							requestURI="#" sort="list" pagesize="${size}" id="data">

							<display:column title="User Name"
								property="userName" sortable="true"></display:column>
								
							<display:column title="Login Mode"
								property="loginAccessMode" sortable="true"></display:column>
								
							<display:column title="Source IP Address"
								property="sourceIPAddress" sortable="true"></display:column>
							
							<display:column title="Failure Reason"
								property="failureText" sortable="true"></display:column>
								
							<display:column title="Redirect URL" style="word-break:break-all;"
								property="redirectURLFullPath" sortable="true">
								</display:column>	
								
							 <display:column title="Login Date Time"
								property="loginDateTime" sortable="true"></display:column>	
																	
							<display:column title="Logout Date Time"
								property="logoutDateTime" sortable="true"></display:column>	
								
								
						</display:table> --%>
       
       
        <!-- Center-->    
     </div> 
     </div> 
     
    <div class="col-sm-7" >

					<ul class="pagination pagination-sm"
						style="float: left; margin-right: 20px;">
					<!-- 	<li class="disabled"><a href="#">&laquo;</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&raquo;</a></li> -->
					</ul>


<% String value=(String)request.getAttribute("codes");%>
	<%-- <%
	if(value==null)
	{
	%> --%>
	<%-- <div class="topmenuleft" >
	<div  class="customDropdown">
        <span >Page Size:</span>&nbsp;
    	<select  type="button" name="pageSize" id="page" onchange="partnerPagesizeurl()">
         
           		<option value="10" 
           				<c:if test="${size==10}"> selected="selected" </c:if>>10</option>
           		<option value="20" 
           				<c:if test="${size==20}"> selected="selected" </c:if>>20</option>
               <option value="50" 
               			<c:if test="${size==50}"> selected="selected" </c:if>>50</option>
               <option value="100" 
               			<c:if test="${size==100}"> selected="selected" </c:if>>100</option>
               <option value="10000" 
               			<c:if test="${size==10000}"> selected="selected" </c:if>>Show All&nbsp;</option>
   		</select>
 
     </div>	
	</div>
	<% 
	}
	else
	{
	%>
	<div class="topmenuleft" >
	<div  class="customDropdown">
        <span >Page Size:</span>&nbsp;
    	<select  type="button" name="pageSize" id="page" onchange="userPagesizeurl()">
     
           		<option value="10" 
           				<c:if test="${size==10}"> selected="selected" </c:if>>10</option>
           		<option value="20" 
           				<c:if test="${size==20}"> selected="selected" </c:if>>20</option>
               <option value="50" 
               			<c:if test="${size==50}"> selected="selected" </c:if>>50</option>
               <option value="100" 
               			<c:if test="${size==100}"> selected="selected" </c:if>>100</option>
               <option value="10000" 
               			<c:if test="${size==10000}"> selected="selected" </c:if>>Show All&nbsp;</option>
   		</select>
 
     </div>	
	</div>
	<% 
	}
	%> --%>




<%-- <div class="topmenuleft" >
<div  class="customDropdown">
        <span >Page Size:</span>&nbsp;
    	<select  type="button" name="pageSize" id="page" onchange="pagesizeurl()">
         
           		<option value="10" 
           				<c:if test="${size==10}"> selected="selected" </c:if>>10</option>
           		<option value="20" 
           				<c:if test="${size==20}"> selected="selected" </c:if>>20</option>
               <option value="50" 
               			<c:if test="${size==50}"> selected="selected" </c:if>>50</option>
               <option value="100" 
               			<c:if test="${size==100}"> selected="selected" </c:if>>100</option>
               <option value="10000" 
               			<c:if test="${size==10000}"> selected="selected" </c:if>>Show All&nbsp;</option>
   		</select>
 
     </div>	
</div> --%>

<%-- <div class="topmenuleft" >
  <ul>
  	<li> Export options: </li>
    <li> <a href="<%=request.getContextPath()%>/partnersp/loginHistCSV.htm?buId=${sessionScope.userSession.buId}&userId=${data.userId}" title="Export in CSV" alt="Export in CSV"><i class="cvsicon"></i></a></li>
    <li><a href="<%=request.getContextPath()%>/partnersp/loginHistExcel.htm?buId=${sessionScope.userSession.buId}&userId=${data.userId}" title="Export in Excel" alt="Export in Excel"> <i class="excelicon"></i></a></li>
    <li> <a href="<%=request.getContextPath()%>/partnersp/partnerXML.htm?buId=${sessionScope.userSession.buId}&userId=${sessionScope.userSession.userId}.01"  title="Export in XML" alt="Export in XML"><i class="xmlcon"></i></a></li>
  </ul>
 
  
 
 </div> --%>
</div>

     </div>
     
     </div>    
        	
<!-- Center part End -->          

<footer>
<jsp:include page="../common/footer.jsp" />
</footer>

<script>
var grid_data='${loginHist}';
index=JSON.parse(grid_data);

//alert("hieeeeeee");
//var grid_data=${loginHist};
//var grid_data=${loginHist};
//index=grid_data;
//console.log('grid_data:---'+grid_data);
//index=grid_data;


var subgrid_data = 
[
{id:"1", name:"sub grid item 1", qty: 11},
{id:"2", name:"sub grid item 2", qty: 3},
{id:"3", name:"sub grid item 3", qty: 12},
{id:"4", name:"sub grid item 4", qty: 5},
{id:"5", name:"sub grid item 5", qty: 2},
{id:"6", name:"sub grid item 6", qty: 9},
{id:"7", name:"sub grid item 7", qty: 3},
{id:"8", name:"sub grid item 8", qty: 8}
];

jQuery(function($) {
	var grid_selector = "#grid-table";
	var pager_selector = "#grid-pager";
	
	//resize to fit page size
	$(window).on('resize.jqGrid', function () {
		$(grid_selector).jqGrid( 'setGridWidth', $(".page-content").width() );
  })
	//resize on sidebar collapse/expand
	var parent_column = $(grid_selector).closest('[class*="col-"]');
	$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
		if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
			//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
			setTimeout(function() {
				$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
			}, 0);
		}
  })
	
  
  $('#addnote').on('hide.bs.modal', function (e) {
//if (!data) return e.preventDefault() // stops modal from being shown
			 refresh();
		})
		$('#editnote').on('hide.bs.modal', function (e) {
//if (!data) return e.preventDefault() // stops modal from being shown
			 refresh();
		})

	//if your grid is inside another element, for example a tab pane, you should use its parent's width:
	/**
	$(window).on('resize.jqGrid', function () {
		var parent_width = $(grid_selector).closest('.tab-pane').width();
		$(grid_selector).jqGrid( 'setGridWidth', parent_width );
	})
	//and also set width when tab pane becomes visible
	$('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
	  if($(e.target).attr('href') == '#mygrid') {
		var parent_width = $(grid_selector).closest('.tab-pane').width();
		$(grid_selector).jqGrid( 'setGridWidth', parent_width );
	  }
	})
	*/
	
	



	jQuery(grid_selector).jqGrid({
		//direction: "rtl",

		//subgrid options
		subGrid : false,
		//subGridModel: [{ name : ['No','Item Name','Qty'], width : [55,200,80] }],
		//datatype: "xml",
		subGridOptions : {
			//plusicon : "ace-icon fa fa-plus center bigger-110 blue",
			minusicon  : "ace-icon fa fa-minus center bigger-110 blue",
			openicon : "ace-icon fa fa-chevron-right center orange"
		},
		//for this example we are using local data
		subGridRowExpanded: function (subgridDivId, rowId) {
			var subgridTableId = subgridDivId + "_t";
			$("#" + subgridDivId).html("<table id='" + subgridTableId + "'></table>");
			$("#" + subgridTableId).jqGrid({
				datatype: 'local',
				data: subgrid_data,
				colNames: ['No','Item Name','Qty'],
				colModel: [
					{ name: 'id', width: 50 },
					{ name: 'name', width: 150 },
					{ name: 'qty', width: 50 }
				]
			});
		},
		
		
		
		
		

		data: index,
		datatype: "local",
		height: 250,
		//width:600,
		//colNames:['Biz Unit'],
		colNames:['User Name','Login Mode','Source IP Address','Failure Reason','Redirect URL','Login Date Time','Logout Date Time'],
		//colNames:['Section ',' ','Section1','Broadcast Title','Start/Expiry Datetime','Show Popup on Login','Update on','Source System'],
		 colModel:[
			
			{name:'userName',index:'userName',width:200},
			{name:'loginAccessMode',index:'loginAccessMode',width:200},
			{name:'sourceIPAddress',index:'sourceIPAddress',width:200},
			{name:'failureText',index:'failureText',width:200},
			{name:'redirectURLFullPath',index:'redirectURLFullPath',width:250},
			{name:'loginDateTime',index:'loginDateTime',width:200},
			{name:'logoutDateTime',index:'logoutDateTime',width:200}
			
			//{name:'startDate',index:'startDate'},
			
			 
		], 

		viewrecords : true,
		rowNum:10,
		rowList:[10,20,50,100,1000],
		pager : pager_selector,
		altRows: true,
		//toppager: true,
		
		//multiselect: true,
		//multikey: "ctrlKey",
      multiboxonly: true,

      loadComplete : function() {
		      var table = this;
		      setTimeout(function(){
		       styleCheckbox(table);
		       
		       updateActionIcons(table);
		       updatePagerIcons(table);
		       enableTooltips(table);
		      }, 0);
		     },

		editurl: "/dummy.html",//nothing is saved
		//caption: "jqGrid with inline editing"

		autowidth: true,
      shrinkToFit:false,	



		/**
		,
		grouping:true, 
		groupingView : { 
			 groupField : ['name'],
			 groupDataSorted : true,
			 plusicon : 'fa fa-chevron-down bigger-110',
			 minusicon : 'fa fa-chevron-up bigger-110'
		},
		caption: "Grouping"
		*/

	});
	$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
	
	

	//enable search/filter toolbar
	//jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
	//jQuery(grid_selector).filterToolbar({});


	//switch element when editing inline
	function aceSwitch( cellvalue, options, cell ) {
		setTimeout(function(){
			$(cell) .find('input[type=checkbox]')
				.addClass('ace ace-switch ace-switch-5')
				.after('<span class="lbl"></span>');
		}, 0);
	}
	//enable datepicker
	function pickDate( cellvalue, options, cell ) {
		setTimeout(function(){
			$(cell) .find('input[type=text]')
					.datepicker({format:'yyyy-mm-dd' , autoclose:true}); 
		}, 0);
	}
	
	
	

	//navButtons
	jQuery(grid_selector).jqGrid('navGrid',pager_selector,
		{ 	//navbar options
			edit: false,
			editicon : 'ace-icon fa fa-pencil blue',
			add: false,
			addicon : 'ace-icon fa fa-plus-circle purple',
			del: false,
			delicon : 'ace-icon fa fa-trash-o red',
			search: true,
			searchicon : 'ace-icon fa fa-search orange',
			refresh: false,
			refreshicon : 'ace-icon fa fa-refresh green',
			view: false,
			viewicon : 'ace-icon fa fa-search-plus grey',
		},
		{
			//edit record form
			//closeAfterEdit: true,
			//width: 700,
			recreateForm: true,
			beforeShowForm : function(e) {
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
				style_edit_form(form);
			}
		},
		{
			//new record form
			//width: 700,
			closeAfterAdd: true,
			recreateForm: true,
			viewPagerButtons: false,
			beforeShowForm : function(e) {
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
				.wrapInner('<div class="widget-header" />')
				style_edit_form(form);
			}
		},
		{
			//delete record form
			recreateForm: true,
			beforeShowForm : function(e) {
				var form = $(e[0]);
				if(form.data('styled')) return false;
				
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
				style_delete_form(form);
				
				form.data('styled', true);
			},
			onClick : function(e) {
				//alert(1);
			}
		},
		{
			//search form
			recreateForm: true,
			afterShowSearch: function(e){
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
				style_search_form(form);
			},
			afterRedraw: function(){
				style_search_filters($(this));
			}
			,
			multipleSearch: true,
			/**
			multipleGroup:true,
			showQuery: true
			*/
		},
		{
			//view record form
			recreateForm: true,
			beforeShowForm: function(e){
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
			}
		}
	)

	function style_edit_form(form) {
		//enable datepicker on "sdate" field and switches for "stock" field
		form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
		
		form.find('input[name=stock]').addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
				   //don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
				  //.addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');

				
		//update buttons classes
		var buttons = form.next().find('.EditButton .fm-button');
		buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
		buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
		buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
		
		buttons = form.next().find('.navButton a');
		buttons.find('.ui-icon').hide();
		buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
		buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');		
	}

	function style_delete_form(form) {
		var buttons = form.next().find('.EditButton .fm-button');
		buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
		buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
		buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
	}
	
	function style_search_filters(form) {
		form.find('.delete-rule').val('X');
		form.find('.add-rule').addClass('btn btn-xs btn-primary');
		form.find('.add-group').addClass('btn btn-xs btn-success');
		form.find('.delete-group').addClass('btn btn-xs btn-danger');
	}
	function style_search_form(form) {
		var dialog = form.closest('.ui-jqdialog');
		var buttons = dialog.find('.EditTable')
		buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
		buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
		buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
	}
	
	function beforeDeleteCallback(e) {
		var form = $(e[0]);
		if(form.data('styled')) return false;
		
		form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
		style_delete_form(form);
		
		form.data('styled', true);
	}
	
	function beforeEditCallback(e) {
		var form = $(e[0]);
		form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
		style_edit_form(form);
	}



	//it causes some flicker when reloading or navigating grid
	//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
	//or go back to default browser checkbox styles for the grid
	function styleCheckbox(table) {
	/**
		$(table).find('input:checkbox').addClass('ace')
		.wrap('<label />')
		.after('<span class="lbl align-top" />')


		$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
		.find('input.cbox[type=checkbox]').addClass('ace')
		.wrap('<label />').after('<span class="lbl align-top" />');
	*/
	}
	

	//unlike navButtons icons, action icons in rows seem to be hard-coded
	//you can change them like this in here if you want
	function updateActionIcons(table) {
		/**
		var replacement = 
		{
			'ui-ace-icon fa fa-pencil' : 'ace-icon fa fa-pencil blue',
			'ui-ace-icon fa fa-trash-o' : 'ace-icon fa fa-trash-o red',
			'ui-icon-disk' : 'ace-icon fa fa-check green',
			'ui-icon-cancel' : 'ace-icon fa fa-times red'
		};
		$(table).find('.ui-pg-div span.ui-icon').each(function(){
			var icon = $(this);
			var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
			if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
		})
		*/
	}
	
	//replace icons with FontAwesome icons like above
	function updatePagerIcons(table) {
		var replacement = 
		{
			'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
			'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
			'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
			'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
		};
		$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
			var icon = $(this);
			var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
			
			if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
		})
	}

	function enableTooltips(table) {
		$('.navtable .ui-pg-button').tooltip({container:'body'});
		$(table).find('.ui-pg-div').tooltip({container:'body'});
	}

	//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');

	$(document).one('ajaxloadstart.page', function(e) {
		$(grid_selector).jqGrid('GridUnload');
		$('.ui-jqdialog').remove();
		
	});
});

function openActionPopup(notifyTemplateID,pingOwner,active,name,favouriteTemplate){
	//alert(notifyTemplateID);
	$('#notifyTemplateIdHidden').val(notifyTemplateID);
	$('#notifyTemplateNameHidden').val(name);
	if(pingOwner=='Partner'){
		if(active=='true'){
			$('#suspendrow').removeClass('hide');
			$('#reactivaterow').attr('class','hide');
		}else{
			$('#reactivaterow').removeClass('hide');
			$('#suspendrow').attr('class','hide');
		}
	}
	$('#ScheduleRow').removeClass('hide');
	$('#DeliveryHistoryRow').removeClass('hide');
	$('#CloneRow').removeClass('hide');
	$('#ScheduleLink a').attr('href','${pageContext.request.contextPath}/addNewSchedulePing.htm?notifyTemplateID_P='+notifyTemplateID);
	$('#DeliveryHistoryLink a').attr('href','${pageContext.request.contextPath}/ping/getDelivaryHistory.htm?notifyTemplateId='+notifyTemplateID);
	if(favouriteTemplate!=1){
		$('#MarkasFavouriteRow').removeClass('hide');
		$('#UnMarkasFavouriteRow').attr('class','hide');
	}else{
		$('#UnMarkasFavouriteRow').removeClass('hide');
		$('#MarkasFavouriteRow').attr('class','hide');
	}
	$( ".action_dialog" ).removeClass('hide').dialog({
		resizable: false,
		modal: true,
      width: "auto",
	});
}





































/* function partnerPagesizeurl(){
	  //alert("Hi in Partner Pageing");
	  var pageSize=$('#page').val(); 
	   window.location.href= $('#contextPath').val()+'/partnersp/loadLoginHist.htm?pageSize='+pageSize+'&userId='+${data.userId};
	 } */
	 
/* function userPagesizeurl(){
	 //alert("Hi in User Pageing");
	  var pageSize=$('#page').val(); 
	  window.location.href= $('#contextPath').val()+'/user/loadLoginHist.htm?pageSize='+pageSize+'&userId='+${data.userId}+'&currentPage='+'user';
	 }  */															
	 
function addNote(){

$("#addnote").show();	
$("#deletenote, #editnote").hide();	
$("#popUpAlertaddnote").css ('height','420px')
$("#popUpAlertaddnote").css ('width','650px')
}

function deleteNote(){

$("#deletenote").show();	
$("#addnote, #editnote").hide();	
$("#popUpAlertaddnote").css ('height','400px')
$("#popUpAlertaddnote").css ('width','400px')

}
function editNote(){

$("#editnote").show();	
$("#addnote, #deletenote").hide();	
$("#popUpAlertaddnote").css ('height','420px')
$("#popUpAlertaddnote").css ('width','650px')

}
function biz(){
$("#biz").show();	
$("#user, #role, #city").hide();	

}
function user(){
$("#user").show();	
$("#biz, #role, #city").hide();	

}
function role(){
$("#role").show();	
$("#biz, #user, #city").hide();		
}
	
function city(){
$("#city").show();	
$("#biz, #user, #role").hide();		
}

function biz1(){
$("#biz1").show();	
$("#user1, #role1, #city1").hide();	

}
function user1(){
$("#user1").show();	
$("#biz1, #role1, #city1").hide();	

}
function role1(){
$("#role1").show();	
$("#biz1, #user1, #city1").hide();		
}
	
function city1(){
$("#city1").show();	
$("#biz1, #user1, #role1").hide();		
}
</script>
</body>
</html>