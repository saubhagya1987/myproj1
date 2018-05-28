<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Report</title>
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
<!--    <script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>-->
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/nicEdit.js"></script>
<style>

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
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style_serviceportal.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.ui.all.css" />
<!-- -responsive css-->
<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
<script src="js/jquery-1.9.1.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.position.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.menu.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.autocomplete.js"></script>

<script type="text/javascript">
	bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
</script>
	
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/report.js"> </script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/report.css" />


<style>
a.list-group-item.active {
  z-index: 0;
  color: #ffffff;
  background-color: #438eb9;
  border-color: #438eb9; 
}

{ z-index: 0;
  color: #ffffff;
  background-color: #ae2760;
  border-color: #ae2760;
}
</style> 



</head>
<body> 
<jsp:include page="../common/header.jsp" />
<div style="display: none;" id="blanket"></div>
<div style="display: none; width:650px; height:620px; top:100px; overflow: auto;" id="popUpAlertaddnote" class="alert">
<div class="close" style="margin-right:10px;"><a onClick="popup('popUpAlertaddnote')" href="#"><img alt="" src="images/btn_close.gif" /></a></div>

    <div id="reportnote">
    <div id="popupwrapper_contactform">
   		
  		<div class="heading_contactform"><h3> Edit User </h3></div>
  		<div id="downloadOptions" align="right" style="display:none;">
				
				<a style="color:black;">Dwonload Report as:</a>
				<a href="#" onclick="downloadReport1('pdf')" >pdf</a>,
				<a href="#" onclick="downloadReport1('xls')" >xls</a>,
				<a href="#" onclick="downloadReport1('doc')" >doc</a>,
					
			</div>
       <div id="poptable_contactform" style="padding:10px; height:850px;">
       
        	<span  class="searchpadding padding_top" style="float:left; width:150px;">Party Type   <span class="red">*</span> </span>
        
<div id="reportview"></div>
             	</div>
      </div> 
    </div>
	</div>

<!--css popup window start 1-->
<div style="display: none;" id="blanket"></div>
<div style="display: none; width:450px; height:380px;" id="popUpDiv">
<div class="close" style="margin-right:10px;"><a onClick="popup('popUpDiv')" href="#"><img alt="" src="images/btn_close.gif" /></a></div>

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
 <!-- center part starts  -->
  <span class="list-group"></span>
      
     
     <div class="page-header"> 
		<h1 class="pull-left"> Opportunity </h1>
           
           <div class="clearfix"></div>  
	</div>  
   <!--div starts  -->      
     <div class="row" >    
  		 <div  class="col-md-3">  
        	   <a class="list-group-item active" href="#"> Opportunity Reports</a>
              <a id="SPOpportunityTrackerListReportLink" href="loadreportOpportunityTrakerList.htm" class="list-group-item"> Opportunity Tracker List </a>  
			   <a id="SPOpportunityByStatusReportLink" href="loadOppoByStatusReport.htm" class="list-group-item" href="#">Opportunity by Status</a>
               <a href="loadOppTrackerMIS.htm" class="list-group-item" href="#Data">  Opportunity Tracker MIS</a><!--suvarna need to hide  --> 
       </div>   
  		<div class="col-md-9">
            				
                    <div class="clearfix"></div>
  		
              
<!-- Search start-->  
         <form onsubmit="return false">
				
        		<a class="list-group-item active" href="#">Opportunity Tracker MIS</a>
           <div class="list-group-item">
<!-- Search start  -->    
          	<div  class="searchboxreport"> 
               <span style="font-size:11px; flaot:left; margin-left:0px;">Opportunity status </span>&nbsp;
                <select  type="button" name="opportunityStatus" id="opportunityStatus">
              	<option>Open</option>
                <option>New</option>
                 &nbsp; 
				 <input  type="button" class="btn btn-sm btn-primary" value="Show" title="Show" alt="Show"  onClick="generateReport('OpportunityByStatus.rptdesign');popup('popUpAlertaddnote')"> <br>	
				
            </select>
              <span class="style1">Start Date </span>  <input  type="text" name="Startdatename" id="Startdatename" class=" " value=" " >
             <span class="style1"> End Date </span>  <input  type="text" name="Enddatename" id="Enddatename" class=" " value=" " >
            <a href="#" style="color:#fff;" onClick="reportnote();generateReport('OpportunityByStatus.rptdesign')"> <input  type="button" class="btn btn-sm btn-primary" value="Show" title="Show" alt="Show"  onClick="popup('popUpAlertaddnote')"></a>
            </div>
                
             <div></div>
            
           <!--  <div id="reportData" >
				<br>
				Reports will be loaded here when user selects report from left navigation.
			</div>  --> 
			
				<div id="downloadOptions" align="right">
				
				<a style="color:black;">Dwonload Report as:</a>
				<a href="#" onclick="downloadReport1('pdf')" >pdf</a>,
				<a href="#" onclick="downloadReport1('xls')" >xls</a>,
				<a href="#" onclick="downloadReport1('doc')" >doc</a>,
					
			</div>
			
            
            
<!-- Search start -->
      <div class="row" style="display:none;" id="showreport" > 
        <ul class="pagination pagination-sm">
  <li  class="disabled"><a href="#">&laquo;</a></li>
  <li><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#">&raquo;</a></li>
</ul>	

 
        <div class="topmenuleft" >
          <ul>
            <li> Export Options: </li>
            <li> <a href="#" title="Export in CVS" alt="Export in CVS"><i class="cvsicon"></i></a></li>
            <li><a href="#" title="Export in Excel" alt="Export in Excel"> <i class="excelicon"></i></a></li>
            <li> <a href="#"  title="Export in XML" alt="Export in XML"><i class="xmlcon"></i></a></li>
          </ul>
         </div>
     </div> 
    </div>
							<!-- div added by shrinivas -->
							<div class="searchboxreport" id="showErrDiv" style="display:none;">
								<span style="text-align:center;display: inline-block; width:100%;margin-top:150px;font-weight:bold;font-size:15px;color:green;margin-bottom: 150px;">You are not authorized to view this page, please contact admin.</span>
							</div>
		</form>

   	  </div> 	  
   	</div> 

      
         	<br/><br/>
 
 <!-- center part ends -->
 
       
<footer>
  <jsp:include page="../common/footer.jsp" />
 </footer>
      
<!-- Center part End -->          

    <script type="text/javascript">
    
    function  reportnote()
    {
    	$("#reportnote").show();
    	$("#popUpAlertaddnote").css ('height','1000px');
    	$("#popUpAlertaddnote").css ('width','1000px');
    }
    
 	$(document).ready(function() {
 		    $("#Startdatename").datepicker({
 		        showOn: 'button',
 		        buttonText: 'Show date',
 		        buttonImageOnly: true,
 		        buttonImage: 'http://jqueryui.com/resources/demos/datepicker/images/calendar.gif',
 		        dateFormat: 'dd/mm/yy',
 		        constrainInput: true,
 		       // minDate: 0
 		    });

 		    $(".ui-datepicker-trigger").mouseover(function() {
 		        $(this).css('cursor', 'pointer');
 		    });
 		});
    
    $(document).ready(function() {
    	 $("#Enddatename").datepicker({
		        showOn: 'button',
		        buttonText: 'Show date',
		        buttonImageOnly: true,
		        buttonImage: 'http://jqueryui.com/resources/demos/datepicker/images/calendar.gif',
		        dateFormat: 'dd/mm/yy',
		        constrainInput: true,
		       // minDate: 0
		    });

		    $(".ui-datepicker-trigger").mouseover(function() {
		        $(this).css('cursor', 'pointer');
		    });
		});
    
    </script>

</body>
</html>