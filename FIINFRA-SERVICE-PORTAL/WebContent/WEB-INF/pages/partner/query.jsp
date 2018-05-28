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
<title>Query </title>
 <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
 <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!--<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
     <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
      <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
   <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>-->

    


<!-- -responsive css-->
<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">-->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
<!-- -responsive css-->
<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
	<!--<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>-->


  <script src="<%=request.getContextPath()%>/js/common.js"></script>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/zebra_dialog.css" type="text/css">


<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->

</head>
<body>
<style>
.queryattchmentbox{
display: none;
}
.comment{
text-align: left !important;
}
a:hover{
text-decoration: none !important;
}
#blanket{
height: 100%;
position: fixed;
}

</style>
	<jsp:include page="../common/header.jsp" />

 <!-- Center part start -->
 <section>
     <div class="container white">
    	<div class="container-head">
         <div class="col-md-12" style="text-align: right;"> 
              <!-- accordion start-->
            	  <div class="accordion pull-left col-md-12" id="accordFundSel">
                <div class="accordion-group">
            <div class="col-md-11" style="width:99%;" > 
                 	 	<span  style="float:left;">Query-Inbox</span>
                  		<span  class="col-md-10" style="float:right; margin-top:-6px;"> 
                  			<input name="text"  type="text" id="tags"  style="width:100px;"  placeholder="Quick Search">
                  			&nbsp;<input type="button" class="dbtn" value="search" onclick="querysearch()">
                  		</span>
                  </div>
<!--                   <div class="accordion-heading" > <a class="accordion-toggle " data-toggle="collapse" data-parent="#accordFundSel" href="#collapseFundSel"> <span style=" margin-top:0px;" class="searchicon"  alt="Search" title="Search"></span> </a> </div> -->
                   <div class="accordion-heading" > 
			              </div>
                  <div style="height: auto;" id="collapseFundSel" class="accordion-body pull-left serchboxnew collapse">
                    <div class="accordion-inner table-responsive">
                     <div style="width: 1211px;">
                        <!--1 search start -->
                       
                          <div class="filterbox searchpadding">
                            <div class="head">Filter </div>
                           <div class="drop_box_body">
                            <span class="searchtext"> Subject</span> 
                            <input name="text" type="text" id="fname" class="form-control" value="" /> 
                            <span class="searchtext"> Owner</span> 
                            <input name="text" type="text" id="fname" class="form-control" value="" />
                            <span class="searchtext"> Reference No</span> 
                            <input name="text" type="text" id="fname" class="form-control" value="" />
                           
                             <br>
                         	</div>
                         </div>
                        <div class="filterbox searchpadding">
                          <div class="head">Type</div>
                          <div class="drop_box_body">
                            <ul class="nav  nav-stacked">
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox"  checked>
                               General</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Action Plan</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox"  checked>
                                Plan Execution</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Goal Related</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                                Portfolio Related</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                                Customer Service</li>
                                <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                                Financial Plan</li>
                                <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Pathfinder tool related</li>
                             
                            </ul>
                          </div>
                        </div>
                         </div>
                          <div class="box_button pull-left">
                      <button type="button" id="updatefilterlist" class="btn">Show</button>
                    </div>
                    </div>
                       
                      
          
                    <!-- accordion-inner END -->
                
                   
                   
                  </div>
                  <!-- accordion-body END -->
                </div>
           	    <!-- accordion-group END -->
              </div>
           	  <!-- accordion  END -->
 
              
               <!-- accordion End -->
            </div >
          </div >
	  	<div class="container-body">
        
        <!-- center -->
       
			
 <!-- center -->
  
        
<!--         <ul class="pagination pagination-sm"> -->
<!--   <li  class="disabled"><a href="#">&laquo;</a></li> -->
<!--   <li><a href="#">1</a></li> -->
<!--   <li><a href="#">2</a></li> -->
<!--   <li><a href="#">3</a></li> -->
<!--   <li><a href="#">4</a></li> -->
<!--   <li><a href="#">5</a></li> -->
<!--   <li><a href="#">&raquo;</a></li> -->
<!-- </ul>	 -->
<div class="topmenu">
        	
<a id="SPAddNewQueryLink" href="<%=request.getContextPath()%>/addQuery.htm"><input data-params="{}" type="button" class="dbtn createNewBtn" value="  New Query" title="New Query" alt="New Query"></a>
<input id="SPDeleteQueryLink"  type="button" class="dbtn deleteBtn" value="  Delete"  title="Delete" onclick="deleteQueries()">

 </div>
<div class="row" >

    	<a onclick="openQueryPanel('inbox')">Inbox <span class="badge" style="margin-bottom"10px;">${unreadQueryInboxCount}</span></a>
    	<a onclick="openQueryPanel('sentbox')">Sent <span class="badge" style="margin-bottom"10px;">${unreadQuerySentboxCount}</span></a>
   
</div>


<div class="table-responsive" id="display_table_lead" style="border:none;">
		  <div id="toreload">
			                        
 <display:table name="queryDatas" uid="objPortalUser" class="table table-hover table-bordered table-striped"
	requestURI="#" sort="list" pagesize="${pagesize}" id="data" export="false">
	


<c:choose>
    <c:when test="${data.isReadByParty==false}">
	    <display:column  class="unreadmail" 
			style=""  sortable="true">
			<span id="span${data.queryId}">
	 			 <input id="${data.queryId}" name="queryCb" type="checkbox">
			</span>
			</display:column>
		<display:column  class="unreadmail" 
			style=""  sortable="true">
			<a  onclick="viewQueryDetails(${data.queryId})"><img id="SPEditQueryLink" src="<%=request.getContextPath()%>/images/view.png" alt="View" title="View Query"></a>
			</display:column>
	      <display:column property="subject" class="unreadmail"
			style="" title="Subject" sortable="true"></display:column>
		<display:column property="queryTypeName" class="unreadmail"
			style="" title="Query Type" sortable="true"></display:column>
		<display:column  class="unreadmail"
			style="" title="Query From" sortable="true">
			<c:choose>
			    <c:when test="${data.queryFromRecordType==14005}">
			    	<span class="label"><a  style="cursor:default;" title="Opportunity">
												<i class="opportunityicon"></i>${data.queryOwnerName}</a></span>
			    </c:when>
			    <c:when test="${data.contactType==14006}">
			    <span class="label"><a style="cursor:default;" title="Client">
  					<i class="pclienticon" title="PClient"></i>${data.queryOwnerName}</a></span>
			    </c:when>
			    <c:when test="${data.contactType==14007}" >
			    <span class="label"><a style="cursor:default;" title="Premium Client"> <i class="clienticon" title="Client"></i>${data.queryOwnerName}</a></span>
			    </c:when>
			    <c:otherwise>
			    <span class="label"><a style="cursor:default;" title="Partner"> <i class="selficon" title="Client"></i>${data.queryOwnerName}</a></span>
			     </c:otherwise>
	   		</c:choose>
			
			</display:column>
		<display:column  class="unreadmail"
			style="" title="Query For" sortable="true">
			<c:choose>
			    <c:when test="${data.contactType==15002}">
			    	<span class="label"><a  style="cursor:default;" title="Opportunity">
												<i class="opportunityicon"></i>${data.queryFor}</a></span>
			    </c:when>
			    <c:when test="${data.contactType==15004}">
			    <span class="label"><a style="cursor:default;" title="Premium Client">
  					<i class="pclienticon" title="PClient"></i>${data.queryFor}</a></span>
			    </c:when>
			    <c:when test="${data.contactType==15003}" >
			    <span class="label"><a style="cursor:default;" title="Client"> <i class="clienticon" title="Client"></i>${data.queryFor}</a></span>
			    </c:when>
			    <c:otherwise>
			    <span class="label"><a style="cursor:default;" title="Partner"> <i class="selficon" title="Self"></i>Self</a></span>
			     </c:otherwise>
	   		</c:choose>
		</display:column>
		<display:column property="lastUpdatedDate" class="unreadmail"
			style="" title="Last Updated Date" sortable="true"></display:column>
		<display:column property="lastUpdatedByName" class="unreadmail"
			style="" title="Last Updated By" sortable="true"></display:column>
		<display:column  class="unreadmail"
			style="" title="Status" sortable="true">
			<c:choose>
			    <c:when test="${data.status=='New'}">
			    	<span class="label label-info">${data.status}</span>
			    </c:when>
			    <c:when test="${data.status=='Work In Progress'}">
			    <span class="label label-warning">${data.status}</span>
			    </c:when>
			    <c:when test="${data.status=='Responded'}">
			    <span class="label label-success">${data.status}</span>
			    </c:when>
			    <c:when test="${data.status=='Closed'}">
			    <span class="label label-danger">${data.status}</span>
			    </c:when>
			    <c:when test="${data.status=='Cancelled'}">
			    <span class="label label-danger">${data.status}</span>
			    </c:when>
	   		</c:choose>
		</display:column>
    </c:when>
    <c:otherwise>
	    <display:column  
			style=""  sortable="true" class="readmail">
			<span id="span${data.queryId}">
	 			 <input id="${data.queryId}" name="queryCb" type="checkbox">
			</span>
		</display:column>
		<display:column  
			style=""  sortable="true" class="readmail">
			<a  onclick="viewQueryDetails(${data.queryId})"><img src="<%=request.getContextPath()%>/images/view.png" alt="View" title="View Query"></a>
			</display:column>
	       <display:column property="subject"  class="readmail"
			style="" title="Subject" sortable="true"></display:column>
		<display:column property="queryTypeName"  class="readmail"
			style="" title="Query Type" sortable="true"></display:column>
		<display:column   class="readmail"
			style="" title="Query From" sortable="true">
			
			<c:choose>
			    <c:when test="${data.queryFromRecordType==14005}">
			    	<span class="label"><a  style="cursor:default;" title="Opportunity">
												<i class="opportunityicon"></i>${data.queryOwnerName}</a></span>
			    </c:when>
			    <c:when test="${data.contactType==14006}">
			    <span class="label"><a style="cursor:default;" title="Client">
  					<i class="pclienticon" title="PClient"></i>${data.queryOwnerName}</a></span>
			    </c:when>
			    <c:when test="${data.contactType==14007}" >
			    <span class="label"><a style="cursor:default;" title="Premium Client"> <i class="clienticon" title="Client"></i>${data.queryOwnerName}</a></span>
			    </c:when>
			    <c:otherwise>
			    <span class="label"><a style="cursor:default;" title="Partner"> <i class="selficon" title="Client"></i>${data.queryOwnerName}</a></span>
			     </c:otherwise>
	   		</c:choose>
		</display:column>
		<display:column  class="readmail"
			style="" title="Query For" sortable="true">
			<c:choose>
			    <c:when test="${data.contactType==15002}">
			    	<span class="label"><a   style="cursor:default;" title="Opportunity">
												<i class="opportunityicon"></i>${data.queryFor}</a></span>
			    </c:when>
			    <c:when test="${data.contactType==15004}">
			    <span class="label"><a style="cursor:default;" title="Premium Client">
  					<i class="pclienticon" title="PClient"></i>${data.queryFor}</a></span>
			    </c:when>
			    <c:when test="${data.contactType==15003}" >
			    <span class="label"><a style="cursor:default;" title="Client"> <i class="clienticon" title="Client"></i>${data.queryFor}</a></span>
			    </c:when>
			     <c:otherwise>
			    <span class="label"><a style="cursor:default;" title="Partner"> <i class="selficon" title="Client"></i>Self</a></span>
			     </c:otherwise>
	   		</c:choose>
		</display:column>
		<display:column property="lastUpdatedDate"  class="readmail"
			style="" title="Last Updated Date" sortable="true"></display:column>
		<display:column property="lastUpdatedByName" class="readmail"
			style="" title="Last Updated By" sortable="true"></display:column>
	
		<display:column  class="readmail"
			style="" title="Status" sortable="true">
			<c:choose>
			    <c:when test="${data.status=='New'}">
			    	<span class="label label-info">${data.status}</span>
			    </c:when>
			    <c:when test="${data.status=='Work In Progress'}">
			    <span class="label label-warning">${data.status}</span>
			    </c:when>
			    <c:when test="${data.status=='Responded'}">
			    <span class="label label-success">${data.status}</span>
			    </c:when>
			    <c:when test="${data.status=='Closed'}">
			    <span class="label label-danger">${data.status}</span>
			    </c:when>
			    <c:when test="${data.status=='Cancelled'}">
			    <span class="label label-danger">${data.status}</span>
			    </c:when>
	    	</c:choose>
		</display:column>
    </c:otherwise>
</c:choose>

<!-- 		<td><span class="label label-info">New</span></td> -->
<!-- <td><span class="label label-warning">In Progress</span></td> -->
<!-- <td><span class="label label-success">Completed</span></td> -->
<!-- <td><span class="label label-danger">Cancelled</span></td> -->
</display:table>
        
        <!-- Center--> 
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
     	<option value="100">100</option>
     	<option value="500">500</option>
     	<option value="1000">1000</option>
     	<option value="10000">Show All&nbsp;</option>
     </select> 
     </div>	
</div>
       
<!--  <div class="row"> -->
<!--      <div class="col-xs-pull-9"> -->
<!--          <ul class="pagination pagination-sm"  style="float:left; margin-right:10px;"> -->
<!--           <li  class="disabled"><a href="#">&laquo;</a></li> -->
<!--           <li><a href="#">1</a></li> -->
<!--           <li><a href="#">2</a></li> -->
<!--           <li><a href="#">3</a></li> -->
<!--           <li><a href="#">4</a></li> -->
<!--           <li><a href="#">5</a></li> -->
<!--           <li><a href="#">&raquo;</a></li> -->
<!--         </ul>	 -->
<!--         <div class="topmenuleft" > -->
<!--          <div  class="customDropdown"> -->
<!--                <span >Page Size:</span>&nbsp; -->
<!--                  <select  type="button" name="pageSize" id="page" value="10"> -->
<!--                 <option selected="selected" value="10">10</option> -->
<!--                 <option value="20">20</option> -->
<!--                 <option value="50">50</option> -->
<!--                 <option value="100">100&nbsp;</option> -->
<!--              </select>  -->
<!--            </div>	 -->
<!--         </div> -->
<!--         <div class="topmenuleft" > -->
<!--           <ul> -->
<!--             <li> Export Options: </li> -->
<!--             <li> <a href="#" title="Export in CSV" alt="Export in CSV"><i class="cvsicon"></i></a></li> -->
<!--             <li><a href="#" title="Export in Excel" alt="Export in Excel"> <i class="excelicon"></i></a></li> -->
<!--             <li> <a href="#"  title="Export in XML" alt="Export in XML"><i class="xmlcon"></i></a></li> -->
<!--           </ul> -->
<!--          </div> -->
<!--      </div> -->
<!--     <div class="col-xs-pull-3"> -->
<!--  <div class="topmenu"> -->
<%--  <a id="SPAddNewQueryLink" href="<%=request.getContextPath()%>/addQuery.htm"> <input data-params="{}"  type="button" class="dbtn createNewBtn" value="  New Query" title="New Query" alt="New Query"></a> --%>
<!--     <input id="SPDeleteQueryLink" data-params="{}" type="button" class="dbtn deleteBtn" value="  Delete" onclick="deleteQueries()"  title="Delete"> -->
<!--  </div>	 -->
<!--     </div> -->
<!--    </div> -->
<div style="display: none;" id="blanket"></div>
<div style="display: none; width:800px; height:500px; overflow:auto;" id="popUpQuery">
<div class="close" style="margin-right:10px; margin-bottom:30px;"><a onClick="closeQueryDetailsDiv()" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>
<!-- -->
<div class="row"><br><br>
 <div class="list-group" id="queryDetailsDiv" >

	</div>
	<div id="lastCommentDiv"></div>
       </div>
       </div>
    </div>
    
  
    
     
   </div>   
<!-- Center part End -->          

<%-- <jsp:include page="../common/footer.jsp" /> --%>
<script type="text/javascript">
var list = new Array();
var queryId=0;
var statusList;
$(function() {
	showSelectedTab('queryLink');
	var queryId=$('#queryIdToOpen').val();
	if(queryId!=0){
// 		viewQueryDetails(queryId);
alert("Comment added successfully");

showQueryDetails();
		/* showAlertMessage1("Message",
				"<br/>Comment added successfully.",
				"information", showQueryDetails); */
	}
// 	alert($('#queryPanelSession').val())
	if($('#queryPanelSession').val()=='inbox'){
		$('#panelTitle').html('Query-Inbox');
	}else{
		$('#panelTitle').html('Query-Sent');
	}
	
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=22',
		success : function(result) {
			statusList=result;
			
		}
	});
// 	$('.pagelinks a').css('border','1px solid #dddddd');
// 	$('.pagelinks').css('padding','5px 5px');
// 	$('.pagelinks').css('border','1px solid #dddddd');
// 	$('#data').css('margin-top','10px');
// 	$('#toreload').css('margin-top','10px');
// 	$('.pagelinks a').css('padding','5px 5px');
// 	$('.pagelinks a').css('line-height','1.428571429');
	(function(d){d.Zebra_Dialog=function(g,k){var s={animation_speed:250,auto_close:!1,buttons:!0,custom_class:!1,keyboard:!0,max_height:0,message:"",modal:!0,overlay_close:!0,overlay_opacity:0.9,position:"center",reposition_speed:100,source:!1,title:"",type:"information",vcenter_short_message:!0,width:0,onClose:null},a=this;a.settings={};options={};"string"==typeof g&&(options.message=g);if("object"==typeof g||"object"==typeof k)options=d.extend(options,"object"==typeof g?g:k);a.init=function(){a.settings= d.extend({},s,options);a.isIE6="explorer"==j.name&&6==j.version||!1;a.settings.modal&&(a.overlay=jQuery("<div>",{"class":"ZebraDialogOverlay"}).css({position:a.isIE6?"absolute":"fixed",left:0,top:0,opacity:a.settings.overlay_opacity,"z-index":1E3}),a.settings.overlay_close&&a.overlay.bind("click",function(){a.close()}),a.overlay.appendTo("body"));a.dialog=jQuery("<div>",{"class":"ZebraDialog"+(a.settings.custom_class?" "+a.settings.custom_class:"")}).css({position:a.isIE6?"absolute":"fixed",left:0, top:0,"z-index":1001,visibility:"hidden"});!a.settings.buttons&&a.settings.auto_close&&a.dialog.attr("id","ZebraDialog_"+Math.floor(9999999*Math.random()));var e=parseInt(a.settings.width);!isNaN(e)&&(e==a.settings.width&&e.toString()==a.settings.width.toString()&&0<e)&&a.dialog.css({width:a.settings.width});a.settings.title&&jQuery("<h3>",{"class":"ZebraDialog_Title"}).html(a.settings.title).appendTo(a.dialog);e=jQuery("<div>",{"class":"ZebraDialog_BodyOuter"+(!a.settings.title?" ZebraDialog_NoTitle": "")+(!l()?" ZebraDialog_NoButtons":"")}).appendTo(a.dialog);a.message=jQuery("<div>",{"class":"ZebraDialog_Body"+(""!=m()?" ZebraDialog_Icon ZebraDialog_"+m():"")});0<a.settings.max_height&&(a.message.css("max-height",a.settings.max_height),a.isIE6&&a.message.attr("style","height: expression(this.scrollHeight > "+a.settings.max_height+' ? "'+a.settings.max_height+'px" : "85px")'));a.settings.vcenter_short_message?jQuery("<div>").html(a.settings.message).appendTo(a.message):a.message.html(a.settings.message); if(a.settings.source&&"object"==typeof a.settings.source){var b=a.settings.vcenter_short_message?d("div:first",a.message):a.message,c;for(c in a.settings.source)switch(c){case "ajax":var f="string"==typeof a.settings.source[c]?{url:a.settings.source[c]}:a.settings.source[c],g=jQuery("<div>").attr("class","ZebraDialog_Preloader").appendTo(b);f.success=function(a){g.remove();b.append(a);h(!1)};d.ajax(f);break;case "iframe":iframe_options=d.extend({width:"100%",height:"100%",marginheight:"0",marginwidth:"0", frameborder:"0"},"string"==typeof a.settings.source[c]?{src:a.settings.source[c]}:a.settings.source[c]);b.append(jQuery("<iframe>").attr(iframe_options));break;case "inline":b.append(a.settings.source[c])}}a.message.appendTo(e);if(c=l()){var n=jQuery("<div>",{"class":"ZebraDialog_Buttons"}).appendTo(a.dialog);d.each(c,function(e,b){var c=jQuery("<a>",{href:"javascript:logoutClick("+e+")","class":"ZebraDialog_Button"+e});d.isPlainObject(b)?c.html(b.caption):c.html(b);c.bind("click",function(){void 0!=b.callback&& b.callback(a.dialog);a.close(void 0!=b.caption?b.caption:b)});c.appendTo(n)});jQuery("<div>",{style:"clear:both"}).appendTo(n)}a.dialog.appendTo("body");d(window).bind("resize",h);a.settings.keyboard&&d(document).bind("keyup",p);a.isIE6&&d(window).bind("scroll",q);!1!==a.settings.auto_close&&(a.dialog.bind("click",function(){clearTimeout(a.timeout);a.close()}),a.timeout=setTimeout(a.close,a.settings.auto_close));h(!1);return a};a.close=function(e){a.settings.keyboard&&d(document).unbind("keyup",p); a.isIE6&&d(window).unbind("scroll",q);d(window).unbind("resize",h);a.overlay&&a.overlay.animate({opacity:0},a.settings.animation_speed,function(){a.overlay.remove()});a.dialog.animate({top:0,opacity:0},a.settings.animation_speed,function(){a.dialog.remove();if(a.settings.onClose&&"function"==typeof a.settings.onClose)a.settings.onClose(void 0!=e?e:"")})};var h=function(e){var b=d(window).width(),c=d(window).height(),f=a.dialog.width(),g=a.dialog.height(),f={left:0,top:0,right:b-f,bottom:c-g,center:(b- f)/2,middle:(c-g)/2};a.dialog_left=void 0;a.dialog_top=void 0;a.settings.modal&&a.overlay.css({width:b,height:c});d.isArray(a.settings.position)&&(2==a.settings.position.length&&"string"==typeof a.settings.position[0]&&a.settings.position[0].match(/^(left|right|center)[\s0-9\+\-]*$/)&&"string"==typeof a.settings.position[1]&&a.settings.position[1].match(/^(top|bottom|middle)[\s0-9\+\-]*$/))&&(a.settings.position[0]=a.settings.position[0].toLowerCase(),a.settings.position[1]=a.settings.position[1].toLowerCase(), d.each(f,function(b,e){for(var c=0;2>c;c++){var d=a.settings.position[c].replace(b,e);d!=a.settings.position[c]&&(0==c?a.dialog_left=eval(d):a.dialog_top=eval(d))}}));if(void 0==a.dialog_left||void 0==a.dialog_top)a.dialog_left=f.center,a.dialog_top=f.middle;a.settings.vcenter_short_message&&(b=a.message.find("div:first"),c=b.height(),f=a.message.height(),c<f&&b.css({"padding-top":(f-c)/2}));"boolean"==typeof e&&!1===e||0==a.settings.reposition_speed?a.dialog.css({left:a.dialog_left,top:a.dialog_top, visibility:"visible"}):a.dialog.css("visibility","visible").animate({left:a.dialog_left,top:a.dialog_top},a.settings.reposition_speed);a.dialog.find("a[class^=ZebraDialog_Button]:first").focus();a.isIE6&&setTimeout(r,500)},r=function(){var e=d(window).scrollTop(),b=d(window).scrollLeft();a.settings.modal&&a.overlay.css({top:e,left:b});a.dialog.css({left:a.dialog_left+b,top:a.dialog_top+e})},l=function(){if(!0!==a.settings.buttons&&!d.isArray(a.settings.buttons))return!1;if(!0===a.settings.buttons)switch(a.settings.type){case "question":a.settings.buttons= ["No","Yes"];break;default:a.settings.buttons=["Ok"]}return a.settings.buttons.reverse()},m=function(){switch(a.settings.type){case "confirmation":case "error":case "information":case "question":case "warning":return a.settings.type.charAt(0).toUpperCase()+a.settings.type.slice(1).toLowerCase();default:return!1}},p=function(e){27==e.which&&a.close();return!0},q=function(){r()},j={init:function(){this.name=this.searchString(this.dataBrowser)||"";this.version=this.searchVersion(navigator.userAgent)|| this.searchVersion(navigator.appVersion)||""},searchString:function(a){for(var b=0;b<a.length;b++){var c=a[b].string,d=a[b].prop;this.versionSearchString=a[b].versionSearch||a[b].identity;if(c){if(-1!=c.indexOf(a[b].subString))return a[b].identity}else if(d)return a[b].identity}},searchVersion:function(a){var b=a.indexOf(this.versionSearchString);if(-1!=b)return parseFloat(a.substring(b+this.versionSearchString.length+1))},dataBrowser:[{string:navigator.userAgent,subString:"MSIE",identity:"explorer", versionSearch:"MSIE"}]};j.init();return a.init()}})(jQuery);
	
});

function pagesizeurl(){	
	var pageSize=$('#page').val();	
	setResult('');	
}

function setResult(filterRuleCriteria){	
	  openPopupWebApp('centerLoadingImage', 25, 35);
	  var pageval =  $('#page').val();
	  $("#toreload").load('${pageContext.request.contextPath}/query/getQueryList.htm #toreload', {
	   object: '${object}',
	   pageSize: $('#page').val(),//'${pageSize}', 
	   filterRule: filterRuleCriteria
	     }, function( response, status, xhr ) {
	      try{	    	
// 	        	showQueryDetails();
	        //addPageSize(filterRuleCriteria,pageval);
	        //$('#hfilterRule').val(filterRuleCriteria);
	        closePopupWebApp('');
	      }catch(e){
	         closePopupWebApp('');       
	      }
	     });
	 }

function showQueryDetails(){
	var queryId=$('#queryIdToOpen').val();
	if(queryId!=0){
		viewQueryDetails(queryId);
	}
}


function querysearch()
{
   var value = $('#tags').val();
//    alert('value='+value);
	window.location.href = $('#contextPath').val()+"/query/getQueryList.htm?value="+value;
}
/**
 * deletes multiple users after taking confirmation.
 */
function deleteQueries() {
	list = new Array();
	$('#data :checked').each(function(i, obj) {
		list[i] = $(this).attr('id');
	});
	if (list.length == 0) {
		showAlertMessage1("Message",
				"Please select at least one Query to delete.",
				"information", doNothing);
	} else{
		var message = "";
		if (list.length == 1) {
			message = "Do you want to delete this Query?";
		} else {
			message = "Do you want to delete these Queries?";
		}
		showAlertMessage1("Message", "<br/>" + message, "question",
				doNothing1);
		$('.ZebraDialog_Button1').attr('href','javascript:deleteQueriesTrue()');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
// 		$('.ZebraDialog_Question').css('background-size', '149px');
// 		$('.ZebraDialog_Question').css('background-position-x', '5px');
// 		$('.ZebraDialog_Question').css('background-position-y', '2px');
// 		$('.ZebraDialog_Question').css('background-position', '5px 2px');
	}
}

function deleteQueriesTrue() {
	var message = "";
	if (list.length == 1) {
		message = "Query successfully deleted.";
	} else {
		message = "Queries successfully deleted.";
	}
	setTimeout(function() {
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/query/deleteQuery.htm?queryIds=" + list,
			success : function(result) {
				if(result=='success'){
					localStorage.setItem('actionName',
							window.location.pathname);
					showAlertMessage1("Success",
							'<br/>' + message,
							"confirmation", redirectFunction1);
					
				}else{
					showAlertMessage1("Error",
							"The connection to the server has been lost. Please try again later.",
							"error", doNothing);
				}
				
			}
		});
	}, 500);
}


function openQueryPanel(queryPanel){
	$('#queryPanel').val(queryPanel);
	$('#querycountForm').submit();
}
function closeQueryDetailsDiv(){
	$('#queryDetailsDiv').hide();
	$('#popUpQuery').hide();
	$('#blanket').hide();
}

function saveQueryStatus(queryId){
	var message='Data saved successfully.';
	$.ajax({
		type : 'POST',
		url : $('#contextPath').val()+"/query/saveQueryStatus.htm?queryId=" + queryId+'&status='+$('#queryStatus').val(),
		success : function(result) {
			if(result>0){
				closeQueryDetailsDiv();
				
				localStorage.setItem('actionName',
						window.location.pathname);
				setTimeout(function() {
				showAlertMessage1("Success",
						'<br/>' + message,
						"confirmation", redirectFunction1);
				}, 50);
				
			}else{
				showAlertMessage1("Error",
						"The connection to the server has been lost. Please try again later.",
						"error", doNothing);
			}
			
		}
	});
}
function viewQueryDetails(queryId){
	console.log($('#contextPath').val()+'/'+$('#userPhoto').val())
	var commentAttachmentHtml='<div class="col-md-10 searchpadding padding_top" style="margin-right:50px;"><span id="commentAttachment1dailog"> <input class="btn dbtn" type="button" value="Choose File" name="Choose File" onclick="openFileDailog(\'commentAttachment1\')"> No file chosen </span><span id="commentAttachment1name"></span><br /> <span id="commentAttachment2dailog"> <input class="btn dbtn" type="button" value="Choose File" name="Choose File" onclick="openFileDailog(\'commentAttachment2\')"> No file chosen </span><span id="commentAttachment2name"></span><br /> <span id="commentAttachment3dailog"> <input class="btn dbtn" type="button" value="Choose File" name="Choose File" onclick="openFileDailog(\'commentAttachment3\')"> No file chosen </span><span id="commentAttachment3name"></span><br /> <input type="file" name="commentAttachment" id="commentAttachment1" style="display: none;"> <input type="file" name="commentAttachment" id="commentAttachment2" style="display: none;"> <input type="file" name="commentAttachment" id="commentAttachment3" style="display: none;"> </div>';
	$.ajax({
		type : 'POST',
		url : $('#contextPath').val()+"/query/getQueryDetails.htm?queryId=" + queryId,
		success : function(result) {
			var queryData=result;
			var subject=queryData.subject;
			var queryOwnerName=queryData.queryOwnerName;
			var notes=queryData.notes;
			var lastUpdatedDate=queryData.lastUpdatedDate;
			var photoPath=queryData.photoPath;
			var attachment1DocId=queryData.attachment1DocId;
			var attachment2DocId=queryData.attachment2DocId;
			var attachment3DocId=queryData.attachment3DocId;
			var doc1Name=queryData.doc1Name;
			var doc2Name=queryData.doc2Name;
			var doc3Name=queryData.doc3Name;
			var queryCommentDatas=queryData.queryCommentDatas;
			var status=queryData.status;
			$('#queryDetailsDiv').empty();
			$('#queryDetailsDiv').append('<a class="list-group-item active" >Query Comments</a>');
			$('#queryDetailsDiv').append('<div class="list-group-item commentlist" id="mainQueryDiv" style="margin-bottom: 10px;"></div>');
			$('#mainQueryDiv').append('<div class="col-md-12" ><div class="col-md-6"><div class="querymain"><div class="querypicbig" ><img id="queryDefaultImage" onerror="showDefaultImageOnError(id)"  style="width:80px;height:80px;" src="'+$('#contextPath').val()+'/'+photoPath+'"></div><div><p><b>'+subject+'</b><br><span>'+notes+'</span> <br/><span class="querydetail">'+lastUpdatedDate+' by '+queryOwnerName+'<br/><br/> <a onclick="openAttachments(\'queryattchmentbox\')" id="queryAttachmentLink" style="font-size:13px"> <img name="queryattchmentbox" src="'+ $('#contextPath').val()+ '/images/plus.gif">&nbsp;Attachment</a></span><div class="queryattchmentbox" id="queryattchmentbox"></div>  </p></div></div></div><div class="col-md-1">&nbsp;</div><div class="col-md-5" id="statusDiv"></div></div>');
			$('#statusDiv').append('<div class="col-xs-pull-5 searchpadding padding_top">  Current Status is <span class="label" id="queryStatusLabel"></span></a> <span style="float:right; "> <a href="#" onClick="$(\'#queryStatus,#statuschangebutton\').show();$(\'#editstatus\').hide();$(\'#queryStatus\').val('+status+')"  id="editstatus"><img src="'+$('#contextPath').val()+'/images/editnew.png"></a><br></span></div><div class="col-xs-pull-5 searchpadding padding_top" id="changeStatus" ><select name="Status" class="form-control" id="queryStatus"  style="display:none;" > </select></div><div class="col-xs-pull-12 searchpadding padding_top none" id="statuschangebutton" style="float:right;"><input id="save1" class="btn dbtn" type="button" value="Save" name="Save" onclick="saveQueryStatus('+queryId+')">  <input id="cancel1" class="btn dbtn" type="button" value="Cancel" name="Cancel" onClick="$(\'#queryStatus,#statuschangebutton\').hide();$(\'#editstatus\').show()"></div>');
			
			
			$(statusList).each(function(i,obj) {
				var codeTypeId=obj.codeTypeId;
				var codeValue=obj.codeValue;
				var codevalueId=obj.codeValueId;
				$('#queryStatus').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				if(status==codevalueId){
					$('#queryStatusLabel').html(codeValue);
				    if(codeValue=='New'){
				    	$('#queryStatusLabel').addClass('label-info');
				    }else if(codeValue=='Work In Progress'){
				    	$('#queryStatusLabel').addClass('label-warning');
				    }else if(codeValue=='Responded'){
				    	$('#queryStatusLabel').addClass('label-success');
				    }else if(codeValue=='Closed'){
				    	$('#queryStatusLabel').addClass('label-danger');
				    }else if(codeValue=='Cancelled'){
				    	$('#queryStatusLabel').addClass('label-danger');
				    }
					
				}
			});
			
			$(queryCommentDatas).each(function(i,obj) {
				var commentText=obj.commentText;
				var commentOwner=obj.commentOwner;
				var createdDate=obj.createdDate;
				var photoPath=obj.photoPath;
				var doc1Id=obj.doc1Id;
				var doc2Id=obj.doc2Id;
				var doc3Id=obj.doc3Id;
				var doc1Name=obj.doc1Name;
				var doc1Name=obj.doc1Name;
				var doc3Name=obj.doc3Name;
				var queryCommentID=obj.queryCommentId;
				$('#mainQueryDiv').append('<div class="querymain"> <div class="well comment"><div class="querypic" ><img id="commentDefaultImage'+queryCommentID+'" onerror="showDefaultImageOnError(id)"  style="width:32px;height:32px;" src="'+$('#contextPath').val()+'/'+photoPath+'"></div><div><p><b>'+commentText+'</b><br><span class="querydetail">'+createdDate+' by '+commentOwner+'<br/><br/> <a onclick="openAttachments(\'commentattchmentbox'+queryCommentID+'\')" style="font-size:13px" id="commentAttachmentLink'+queryCommentID+'"><img name="commentattchmentbox'+queryCommentID+'" src="'+ $('#contextPath').val()+ '/images/plus.gif">&nbsp;Attachment</a></span><div class="queryattchmentbox" id="commentattchmentbox'+queryCommentID+'"></div>  </p></div></div></div>');
				if(doc1Id==0){
					$('#commentAttachmentLink'+queryCommentID).remove();
					$('#commentattchmentbox'+queryCommentID).remove();
				}else{
					$('#commentattchmentbox'+queryCommentID).append('<a onclick="downloadAttachment('+doc1Id+')">'+doc1Name+'</a><br/>');
					
					if(doc2Id!=0){
						$('#commentattchmentbox'+queryCommentID).append('<a onclick="downloadAttachment('+doc2Id+')">'+doc2Name+'</a><br/>');
					}
					if(doc3Id!=0){
						$('#commentattchmentbox'+queryCommentID).append('<a onclick="downloadAttachment('+doc3Id+')">'+doc3Name+'</a>');
					}
				}
			})
			if(attachment1DocId==0){
				$('#queryAttachmentLink').remove();
				$('#queryattchmentbox').remove();
				
			}else{
				$('#queryattchmentbox').append('<a onclick="downloadAttachment('+attachment1DocId+')">'+doc1Name+'</a><br/>');
				if(attachment2DocId!=0){
					$('#queryattchmentbox').append('<a onclick="downloadAttachment('+attachment2DocId+')">'+doc2Name+'</a><br/>');
				}
				if(attachment3DocId!=0){
					$('#queryattchmentbox').append('<a onclick="downloadAttachment('+attachment3DocId+')">'+doc3Name+'</a>');
				}
			}
			
			$('#mainQueryDiv').append('<form id="commentForm" enctype="multipart/form-data" method="post"><input type="hidden" name="queryId" value="'+queryId+'"><div class="querymain"> <div class="well comment" style="float:left;"><div class="querypic" ><img id="commentDefaultImage0"   style="width:32px;height:32px;" onerror="showDefaultImageOnError(id)" src="'+$('#contextPath').val()+'/'+$('#userPhoto').val()+'"></div> <div class="queryrow"> <textarea  name="commentText" id="commentText" class="form-control" rows="2"></textarea></div> '+commentAttachmentHtml+' <br/><div style="margin-left:4px;"><input type="button" class="dbtn createNewBtn" value="  Add Comment" title="Add Comment" onclick="addComment()" alt="Add Comment"></div>   </div></div></form>');
				
			$('#commentAttachment1').change(function() {
				$('#commentAttachment1dailog').hide();
				$('#commentAttachment1name').html($('#commentAttachment1').val().substring($('#commentAttachment1').val().lastIndexOf('\\')+1)+' <a onclick="removeattachment(\'commentAttachment1\')">Remove</a>');
				$('#commentAttachment1name').show();
			});
			$('#commentAttachment2').change(function() {
				$('#commentAttachment2dailog').hide();
				$('#commentAttachment2name').html($('#commentAttachment2').val().substring($('#commentAttachment2').val().lastIndexOf('\\')+1)+' <a onclick="removeattachment(\'commentAttachment2\')">Remove</a>');
				$('#commentAttachment2name').show();
			});
			$('#commentAttachment3').change(function() {
				$('#commentAttachment3dailog').hide();
				$('#commentAttachment3name').html($('#commentAttachment3').val().substring($('#commentAttachment3').val().lastIndexOf('\\')+1)+' <a onclick="removeattachment(\'commentAttachment3\')">Remove</a>');
				$('#queryAttachment3name').show();
			});
			$('#span' + queryId).parent().attr('class','readmail');
			$('#span' + queryId).parent().siblings().attr('class','readmail');
			$('#queryDetailsDiv').show();
// 			$('html, body').animate({ scrollTop: $('#footer').offset().top}, 'slow');
			$('#popUpQuery').show();
			$('#blanket').show();
// 			alert($(window).height())
			var height = ($(window).height() / 2) - (parseInt($('#popUpQuery').css('height'))/2);
// 			alert(height)
			$('#popUpQuery').css('top',height);
			var width = ($(window).width() / 2) - (parseInt($('#popUpQuery').css('width'))/2);
			$('#popUpQuery').css('margin-left', width);
			$('#popUpQuery').css('position','fixed');
		}
	});
}


function openAttachments(id){
	if($('#'+id).css('display')=='none'){
		$('#'+id).show();
		$('img[name="'+id+'"]').attr('src',$('#contextPath').val()+'/images/minus.gif');
	}else{
		$('#'+id).hide();
		$('img[name="'+id+'"]').attr('src',$('#contextPath').val()+'/images/plus.gif');
	}
}



function openFileDailog(id){
	$('#'+id).click();
}
function removeattachment(id){
	$('#'+id+'dailog').show();
	$('#'+id+'name').html('');
	$('#'+id+'name').hide();
	$('#'+id).val('');
}

function addComment(){
	var isValidated=true;
	if($('#commentText').val()==''){
		addCssStyles('commentText','Please enter Comment Text.');
		isValidated=false;
	}else{
			removeCssStyles('commentText');
		}
	if(isValidated==true){
			$('#commentForm').attr('action',$('#contextPath').val()+'/query/saveComment.htm');
			$('#commentForm').submit();
	}
}


</script>
	<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />
	<form method="post" id="querycountForm" action="<%=request.getContextPath()%>/query/getQueryList.htm">
		<input type="hidden" id="queryPanel" name="queryPanel">
	</form>
	
	
	<form id="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocument.htm">
		<input type="hidden" name="docId" id="documentIdToDownload">
	</form>
	
	<% 
String commentResult="fail";
	int queryId=0;
	commentResult=session.getAttribute("CommentResult")==null?"fail":session.getAttribute("CommentResult").toString();
	queryId=session.getAttribute("QueryId")==null?0:Integer.parseInt(session.getAttribute("QueryId").toString());
if(commentResult.equals("success")){
	session.setAttribute("CommentResult","fail");
	session.setAttribute("QueryId",0);
	%>
	<input type="hidden" id="commentMessage" value="success"/>
	<input type="hidden" id="queryIdToOpen" value="<%=queryId%>"/>
	
	<%
}else{
	%>
	<input type="hidden" id="commentMessage" value="fail"/>
	<input type="hidden" id="queryIdToOpen" value="0"/>
	<%
}
%>
<%
String queryPanel="inbox";
queryPanel=session.getAttribute("queryPanel")==null?"inbox":session.getAttribute("queryPanel").toString();
session.setAttribute("queryPanel","inbox");
if(!queryPanel.equals("")){
%>
<input type="hidden" id="queryPanelSession" value="<%=queryPanel%>"/>
<%}else{ %>
<input type="hidden" id="queryPanelSession" value="inbox"/>
<%} %>
	<a href="#footer" id="focusFooter"></a>
</body>




</html>