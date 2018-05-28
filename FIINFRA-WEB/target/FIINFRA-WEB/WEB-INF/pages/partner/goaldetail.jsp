<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://displaytag.sf.net" prefix="display"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Goals Detail</title>
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
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>
-->
 <!-- -responsive css-->
<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
--><!-- -responsive css-->
<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="<%=request.getContextPath()%>/text/javascript" src="js/pop.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
--><script src="<%=request.getContextPath()%>/js/googleChartApi.js"></script>

<!--<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">-->




<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->


</head>
<body>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/common_popup.jsp" />
<input id="contextPath" type="hidden" name="contextPath" 
		value="<%=request.getContextPath()%>" />
<!--css popup window start 1-->
<div style="display: none;" id="blanket"></div>
<div style="display: none; width:450px; height:380px; top:100px" id="popUpDiv">
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

	
   <!-- <div class="row breadcrumbbg">
  <div class="container">
    <ol class="breadcrumb">
      <li style="margin-left:15px;">You are here: <a href="#" title="Home" onClick="Home">Home</a></li>
     <!-- <li><a href="#">Library</a></li>
      <li class="active">Data</li>
    </ol>
  </div>
  </div>-->
   


 	
 <!-- Center part start -->
 <section>
 

     
    <div class="container">
    	<div class="page-header clearfix">
							<h1 class="pull-left">Goal Details</h1>
							<div class="nav-search pull-right hide" id="">
								<form class="form-search">
									<span class="input-icon"> <input type="text"
										placeholder="Search ..." class="nav-search-input"
										id="search" autocomplete="off"> <i
										class="ace-icon fa fa-search nav-search-icon"></i></span>
								</form>
							</div>
						</div>
  	  <div class="container-body" style="margin-top:0px;">
       	<div class="col-md-12 goalboxnew" style="padding:5px 10px;">
        	 <div class="col-md-9">
             	<i class="" id="goalImage" onerror="$(this).attr('class','')"></i><br/>
       			<h3><label id ="name" ></label></h3>
             </div>	
             <div class="col-md-2 infobox infobox-blue infobox-medium infobox-dark pad-nesw2" style="height:auto"><strong> Goal Year</strong> <label id="GoalEndYear">- 2014-2018 </label><br>
		       <strong>Due in</strong> <label id="duein">- 2 Year 6 Month </label></div>
			<div class="col-md-12">

<!--             <div class="col-md-7" style="padding-left:10px;" > -->
<!--             <h5>Achievement Scale</h5> -->
<!--         	<h4><label id="goalCurrentvalue"></label></h4> -->
           
        	</div>
        	 <div class="col-md-5"style="padding-left:10px;" >
        	 <h5 class="strong">Goal Amount</h5>
        	<h4><label class="green strong" id="goalFuturevalue"></label></h4>
            
        	</div>
             <div class="col-md-8" style="padding-left:10px;">
                        <div class="progress"  style="width: 100%;">
          <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" id="AcheivedPercentage_goalAmount">
            <label id="goalAmountPercentage">100%</label> 
          </div>
        </div>
</div>
<!-- 2 -->
		<div class="col-md-12">

 <div class="col-md-7" style="padding-left:10px;" >
            <h5 class="strong">Achievement Scale</h5>
        	<h4><label id="goalCurrentvalue" class="green strong"></label></h4>
        	</div>
           
        	</div>
<!--         	 <div class="col-md-5"style="padding-left:10px;" > -->
<!--         	 <h5>Goal Amount</h5> -->
<!--         	<h4><label id="goalFuturevalue"></label></h4> -->
            
<!--         	</div> -->
             <div class="col-md-8" style="padding-left:10px;">
                        <div class="progress"  style="width: 100%;">
          <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" id="AcheivedPercentage">
            <label id="GoalAcheivedPercentage">50%</label> 
          </div>
</div>
 </div>
<!--    3 -->
   		<div class="col-md-12">

 <div class="col-md-7" style="padding-left:10px;" >
            <h5 class="strong">Achieved So Far</h5>
        	<h4 class="green strong"><label id="goalCurrentvalue"></label></h4>
        	</div>
           
        	</div>
<!--         	 <div class="col-md-5"style="padding-left:10px;" > -->
<!--         	 <h5>Goal Amount</h5> -->
<!--         	<h4><label id="goalFuturevalue"></label></h4> -->
            
<!--         	</div> -->
             <div class="col-md-8" style="padding-left:10px;">
                        <div class="progress"  style="width: 100%;">
          <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" id="AcheivedPercentage_SoFar">
            <label id="GoalAcheivedPercentageSoFar">50%</label> 
          </div>
</div>
 </div>
   
 <div class="row"><div class="col-md-12 padding_top list-group southspace2" style="padding-left:10px;">
	<div class="goalbox">
 	 	<div class="head list-group-item active">Recommendation for Investment </div>
       </div>
  		<div class="list-group-item clearfix">
        <div class="col-md-4">
        <div class="widget-box">
        <div class="headgrey widget-header"><h4 class="widget-title lighter smaller">
													
													Recommended Investment
												</h4></div>
        <div class="goalbox widget-body clearfix" style="margin:0 5px;">
          <div class="col-md-12" style="padding: 5px;">
              <div class="col-md-3" style="padding-top:5px;"><span class="user strong">Lumpsum</span></div> 
              <div class="col-md-6" style="padding-top:5px;">
                  <div class="progress"  style="width: 100%;">	
                       <div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" id="RecLumsum">
                      </div>
                  </div> 
             </div>
          	 <div class="col-md-3"  style="padding-top:5px;"><span id ="RLumsum" class="user strong"></span></div> 
         </div>
          
          <div class="col-md-12" style="padding: 5px;">
            <div class="col-md-3"><span class="user strong">SIP</span></div> 
            <div class="col-md-6" >
                  <div class="progress"  style="width: 100%;">	
                       <div class="progress-bar progress-bar-success  progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" id="RecSIP">
                      </div>
                  </div> 
             </div>
          <div class="col-md-3 " ><span id ="RSIP" class="user strong"></span></div> 
          </div>
              
          
          
        </div>
        </div>
        </div>
        
        <div class="col-md-4">
         <div class="widget-box">
         <div class="headgrey widget-header"><h4 class="widget-title lighter smaller">
													
													Current Investment
												</h4></div>
         <div class="goalbox widget-body clearfix"  style="margin:0 5px;">
        	 <div class="col-md-12" style="padding: 5px;">
              <div class="col-md-3" style="padding-top:5px;"><span class="user strong">Lumpsum</span></div> 
              <div class="col-md-6" style="padding-top:5px;">
                  <div class="progress"  style="width: 100%;">	
                       <div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" id="CurLumsum">
                      </div>
                  </div> 
             </div>
          	 <div class="col-md-3 " style="padding-top:5px;"><span id ="CLumsum" class="user strong">1 lakhs</span></div> 
         </div>
          
          <div class="col-md-12" style="padding: 5px;">
            <div class="col-md-3"><span class="user strong">SIP</span></div> 
            <div class="col-md-6" >
                  <div class="progress"  style="width: 100%;">	
                       <div class="progress-bar progress-bar-success  progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" id="CurSIP">
                      </div>
                  </div> 
             </div>
          <div class="col-md-3 " ><span id ="CSIP" class="user strong"></span></div> 
          </div>
        
        </div>
        </div>
        </div>
        
        <div class="col-md-4">
        <div class="widget-box">
         <div class="headgrey widget-header"> <h4 class="widget-title lighter smaller">
													
													Gap Amount
												</h4></div>
         <div class="goalbox widget-body clearfix"  style="margin:0 5px;">
        	 <div class="col-md-12" style="padding: 5px;">
              <div class="col-md-3" style="padding-top:5px;"><span class="user strong">Lumpsum</span></div> 
              <div class="col-md-6" style="padding-top:5px;">
                  <div class="progress"  style="width: 100%;">	
                       <div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" id="GapLumsum">
                      </div>
                  </div> 
             </div>
          	 <div class="col-md-3 " style="padding-top:5px;"><span id ="GLumsum" class="user strong"></span></div> 
         </div>
          
          <div class="col-md-12" style="padding: 5px;">
            <div class="col-md-3"><span class="user strong">SIP</span></div> 
            <div class="col-md-6" >
                  <div class="progress"  style="width: 100%;">	
                       <div class="progress-bar progress-bar-success  progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" id="GapSIP">
                      </div>
                  </div> 
             </div>
          <div class="col-md-3 " ><span id ="GSIP" class="user strong"></span></div> 
          </div>
        </div>
        </div>
        </div>
</div> 
 </div></div>
 
 <!-- investment end-->     
 <div class="col-md-12 padding_top southspace2" style="margin-top:0px;">

 <div class="col-md-6" style="padding-left:10px;">
  <div  class="goalbox widget-box">
 	<div class="head widget-header"><h4 class="widget-title lighter smaller">Recommended Allocation												</h4></div>
    <div class="text"></div>
    <div class="calign widget-body" id="assetclassid"></div>
<!--       <img src="images/assetclass1.gif"  style="margin-right:20px;" class="img-responsive">  	 -->
 </div>
 </div>
 
  <div class="col-md-6 " style="padding-left:10px;">
  <div class="goalbox widget-box">
  <div class="head widget-header"><h4 class="widget-title lighter smaller">Current Allocation												</h4></div> 
   <div class="text"></div>
    <div class="calign widget-body" id="currentAllocationAsset"></div>  	
 </div>
 </div>

 
 
</div>
 <!-- asset class end-->
<div class="col-md-12 padding_top southspace2" style="margin-top:0px;">

 <div class="col-md-6" style="padding-left:10px;">
  <div  class="goalbox widget-box">
 
    <div class="text"></div>
    <div class="calign widget-body" id="Producttype"></div>
        	
 </div>
 </div>
 
  <div class="col-md-6 " style="padding-left:10px;">
  <div class="goalbox widget-box">
 
<!--    <div class="text">Product Type</div> -->
    <div class="calign widget-body" id="CurrentProducttype">
<!--     <img src="../images/assettype2.gif"  style="margin-left:25px;" class="img-responsive"> -->
    </div> 
  
        	
 </div>
 </div>

 
 
</div>
 <!-- asset class end-->
 
 <div class="col-md-12 padding_top southspace2" style="margin-top:0px;">

 <div class="col-md-6" style="padding-left:10px;">
  <div  class="goalbox widget-box">
 
    <div class="text"></div>
    <div class="calign widget-body" id ="Productcategory"></div>
        	
 </div>
 </div>
 
  <div class="col-md-6 " style="padding-left:10px;">
  <div class="goalbox widget-box">
 
<!--    <div class="text">Product Category</div> -->
    <div class="calign widget-body" id="categoryType">
<!--     <img src="../images/productc2.gif" style="margin-left:15px;" class="img-responsive"> -->
    </div> 
  
        	
 </div>
 </div>

 
 
</div>
 <!-- Product end-->
 
<!--  <div class="col-md-12 padding_top " style="padding-left:10px;"> -->
 
<!--  <div class="goalbox2"  style="Height:410px;"> -->
<!--  	 	<div class="head">CashFlow Analysis </div> -->
<!--   <div class="calign2"> -->
<!--   <img src="../images/cashflow.gif"> -->
<!--   </div>       -->
<!--   </div> -->
<!--  </div> -->
 
 <!-- CashFlow Analysis end-->
  <div class="col-md-12 padding_top " style="padding-left:10px;">
  <div class="goalbox2">
<!--  <div class="head">Assets Allocated to the Goal</div>
--> </div>
 <!-- Grid start-->
   <!-- center -->
        
	
<!--<div class="topmenu">
        	
<input data-params="{}" type="button" class="dbtn createNewBtn" value="  Add " title="New Opportunities" alt="New Opportunities">
<input data-params="{}" type="button" class="dbtn importNewBtn" value="  Delete"  title="Import Opportunities" alt="Import Opportunities">
<input data-params="{}" type="button" class="dbtn createNewBtn" value="  Edit " title="Bulk Activation" alt="Bulk Activation">
<input data-params="{}" type="button" class="dbtn createNewBtn" value="  More Action" title="More Action" alt="More Action">
 </div>-->

		<div class="table-responsive" id="display_table_lead">
		  <div id="toreload">
			               <table id="grid-table"></table>

	<div id="grid-pager"></div>			           
<!-- <thead> -->
<!-- <tr> -->
<!--   <th width="22%" class="thead"><a href="#">Asset Name</a></th> -->
<!--   <th width="12%" class="thead"><a href="#">Cost (Rs)</a></th> -->
<!--   <th width="16%" class="thead"><a href="#">Current Value (Rs)</a></th> -->
<!--   <th width="12%" class="thead"><a href="#">CAGR/XIRR    </a></th> -->
<!--   <th width="14%" class="thead"> <a href="#">%Allocated to Goal</a></th> -->
<!--   <th width="17%" class="thead"> <a href="#">% Contribution to Goal   </a></th> -->
<!--   <th width="7%" class="thead"><a href="#">Action</a></th> -->
<!-- </tr></thead> -->
<!-- <tbody> -->
<!-- <tr> -->
<!--   <td>UTI Equity Fund</td> -->
<!--   <td>  5 lakhs</td> -->
<!--   <td>7 lakhs</td> -->
<!--   <td>10%</td> -->
<!--   <td>100%</td> -->
<!--   <td>70%</td> -->
<!--   <td><a class="chooset" href="executiontracker_action.html" >Action </a> -->
<!--       <div class="tracker2" style="width:400px;"> -->
<!--       <div class="close" ><a onClick="$('.tracker2').hide()" href="#"><img alt="" src="images/btn_close.gif" /></a></div> -->
<!--   <table class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0"> -->
<!--         	<tr> -->
<!--             	<th class="thead">Action List</th> -->
<!--                 <th class="thead">Document List</th> -->
<!--             </tr> -->
<!--             <tr> -->
<!--             	<td><i class="activaticon"> </i><a href="#"  style="color:#333;"><span class="user">Allocate to another Goal</span></a> </td> -->
<!--                <td><i class="outputreport_icon"></i><a href="#" style="color:#333;"><span class="user">Document 1</span></a>        </td> -->
<!--             </tr> -->
<!--              <tr> -->
<!--             	  <td><span class="deactivaticon"></span><a href="#" style="color:#333;"><span class="user">&nbsp;Un-allocate</span></a></td> -->
<!--                <td><i class="outputreport_icon"></i><a href="#" style="color:#333;"><span class="user">Document 2</span></a></td> -->
<!--             </tr> -->
<!--             <tr> -->
<!--             	<td><i class="changeicon"></i><a href="#" style="color:#333;"><span class="user">                                                                                                                                               Change Allocation %</span></a></td> -->
<!--                 <td></td> -->
<!--             </tr> -->
            
<!--             </table> -->
<!--       </div></td> -->
<!-- </tr> -->
<!-- <tr > -->
<!--   <td>BSL Short Term Fund</td> -->
<!--   <td>2 lakhs</td> -->
<!--   <td>3 lakhs</td> -->
<!--   <td>10%</td> -->
<!--   <td>50%</td> -->
<!--   <td>15%</td> -->
<!--   <td><a class="chooset" href="executiontracker_action.html" >Action </a> -->
<!--       <div class="tracker2"   style="width:400px;"> -->
<!--        <div class="close" ><a onClick="$('.tracker2').hide()" href="#"><img alt="" src="images/btn_close.gif" /></a></div> -->
<!--   <table class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0"> -->
<!--         	<tr> -->
<!--             	<th class="thead">Action List</th> -->
<!--                 <th class="thead">Document List</th> -->
<!--             </tr> -->
<!--             <tr> -->
<!--             	<td><i class="activaticon"> </i><a href="#"  style="color:#333;"><span class="user">Allocate to another Goal</span></a> </td> -->
<!--                <td><i class="outputreport_icon"></i><a href="#" style="color:#333;"><span class="user">Document 1</span></a>        </td> -->
<!--             </tr> -->
<!--              <tr> -->
<!--             	  <td><span class="deactivaticon"></span><a href="#" style="color:#333;"><span class="user">&nbsp;Un-allocate</span></a></td> -->
<!--                <td><i class="outputreport_icon"></i><a href="#" style="color:#333;"><span class="user">Document 2</span></a></td> -->
<!--             </tr> -->
<!--             <tr> -->
<!--             	<td><i class="changeicon"></i><a href="#" style="color:#333;"><span class="user">                                                                                                                                               Change Allocation %</span></a></td> -->
<!--                 <td></td> -->
<!--             </tr> -->
            
<!--             </table> -->
<!--       </div></td> -->
<!-- </tr> -->
<!-- <tr> -->
<!--   <td>UTI Equity Fund</td> -->
<!--   <td>50,000</td> -->
<!--   <td>1 lakhs</td> -->
<!--   <td>10%</td> -->
<!--   <td>100%</td> -->
<!--   <td>10%</td> -->
<!--   <td><a class="chooset" href="executiontracker_action.html" >Action </a> -->
<!--       <div class="tracker2"  style="width:400px;" > -->
<!--        <div class="close" ><a onClick="$('.tracker2').hide()" href="#"><img alt="" src="images/btn_close.gif" /></a></div> -->
<!--   <table class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0"> -->
<!--         	<tr> -->
<!--             	<th class="thead">Action List</th> -->
<!--                 <th class="thead">Document List</th> -->
<!--             </tr> -->
<!--             <tr> -->
<!--             	<td><i class="activaticon"> </i><a href="#"  style="color:#333;"><span class="user">Allocate to another Goal</span></a> </td> -->
<!--                <td><i class="outputreport_icon"></i><a href="#" style="color:#333;"><span class="user">Document 1</span></a>        </td> -->
<!--             </tr> -->
<!--              <tr> -->
<!--             	  <td><span class="deactivaticon"></span><a href="#" style="color:#333;"><span class="user">&nbsp;Un-allocate</span></a></td> -->
<!--                <td><i class="outputreport_icon"></i><a href="#" style="color:#333;"><span class="user">Document 2</span></a></td> -->
<!--             </tr> -->
<!--             <tr> -->
<!--             	<td><i class="changeicon"></i><a href="#" style="color:#333;"><span class="user">                                                                                                                                               Change Allocation %</span></a></td> -->
<!--                 <td></td> -->
<!--             </tr> -->
            
<!--             </table> -->
<!--       </div></td> -->
<!-- </tr> -->
<!-- <tr > -->
<!--   <td>BSL Short Term Fund</td> -->
<!--   <td> 5 lakhs</td> -->
<!--   <td>7 lakhs</td> -->
<!--   <td>10%</td> -->
<!--   <td>100%</td> -->
<!--   <td>70%</td> -->
<!--   <td><a class="chooset" href="executiontracker_action.html" >Action </a> -->
<!--       <div class="tracker2"  style="width:400px;" > -->
<!--        <div class="close" ><a onClick="$('.tracker2').hide()" href="#"><img alt="" src="images/btn_close.gif" /></a></div> -->
<!--   <table class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0"> -->
<!--         	<tr> -->
<!--             	<th class="thead">Action List</th> -->
<!--                 <th class="thead">Document List</th> -->
<!--             </tr> -->
<!--             <tr> -->
<!--             	<td><i class="activaticon"> </i><a href="#"  style="color:#333;"><span class="user">Allocate to another Goal</span></a> </td> -->
<!--                <td><i class="outputreport_icon"></i><a href="#" style="color:#333;"><span class="user">Document 1</span></a>        </td> -->
<!--             </tr> -->
<!--              <tr> -->
<!--             	  <td><span class="deactivaticon"></span><a href="#" style="color:#333;"><span class="user">&nbsp;Un-allocate</span></a></td> -->
<!--                <td><i class="outputreport_icon"></i><a href="#" style="color:#333;"><span class="user">Document 2</span></a></td> -->
<!--             </tr> -->
<!--             <tr> -->
<!--             	<td><i class="changeicon"></i><a href="#" style="color:#333;"><span class="user">                                                                                                                                               Change Allocation %</span></a></td> -->
<!--                 <td></td> -->
<!--             </tr> -->
            
<!--             </table> -->
<!--       </div></td> -->
<!-- </tr> -->

<!-- <tr> -->
<!--   <td>Axis Short Term Fund </td> -->
<!--   <td>2 lakhs</td> -->
<!--   <td>3 lakhs</td> -->
<!--   <td>10%</td> -->
<!--   <td>50%</td> -->
<!--   <td>15%</td> -->
<!--   <td><a class="chooset" href="executiontracker_action.html" >Action </a> -->
<!--       <div class="tracker2"  style="width:400px;" > -->
<!--        <div class="close" ><a onClick="$('.tracker2').hide()" href="#"><img alt="" src="images/btn_close.gif" /></a></div> -->
<!--   <table class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0"> -->
<!--         	<tr> -->
<!--             	<th class="thead">Action List</th> -->
<!--                 <th class="thead">Document List</th> -->
<!--             </tr> -->
<!--             <tr> -->
<!--             	<td><i class="activaticon"> </i><a href="#"  style="color:#333;"><span class="user">Allocate to another Goal</span></a> </td> -->
<!--                <td><i class="outputreport_icon"></i><a href="#" style="color:#333;"><span class="user">Document 1</span></a>        </td> -->
<!--             </tr> -->
<!--              <tr> -->
<!--             	  <td><span class="deactivaticon"></span><a href="#" style="color:#333;"><span class="user">&nbsp;Un-allocate</span></a></td> -->
<!--                <td><i class="outputreport_icon"></i><a href="#" style="color:#333;"><span class="user">Document 2</span></a></td> -->
<!--             </tr> -->
<!--             <tr> -->
<!--             	<td><i class="changeicon"></i><a href="#" style="color:#333;"><span class="user">                                                                                                                                               Change Allocation %</span></a></td> -->
<!--                 <td></td> -->
<!--             </tr> -->
            
<!--             </table> -->
<!--       </div></td> -->
<!-- </tr> -->
<!-- <tr > -->
<!--   <td>UTI Mid Cap Equity Fund</td> -->
<!--   <td>50,000</td> -->
<!--   <td>1 lakhs</td> -->
<!--   <td>10%</td> -->
<!--   <td>100%</td> -->
<!--   <td>10%</td> -->
<!--   <td><a class="chooset" href="executiontracker_action.html" >Action </a> -->
<!--       <div class="tracker2"  style="width:400px;" > -->
<!--        <div class="close" ><a onClick="$('.tracker2').hide()" href="#"><img alt="" src="images/btn_close.gif" /></a></div> -->
<!--   <table class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0"> -->
<!--         	<tr> -->
<!--             	<th class="thead">Action List</th> -->
<!--                 <th class="thead">Document List</th> -->
<!--             </tr> -->
<!--             <tr> -->
<!--             	<td><i class="activaticon"> </i><a href="#"  style="color:#333;"><span class="user">Allocate to another Goal</span></a> </td> -->
<!--                <td><i class="outputreport_icon"></i><a href="#" style="color:#333;"><span class="user">Document 1</span></a>        </td> -->
<!--             </tr> -->
<!--              <tr> -->
<!--             	  <td><span class="deactivaticon"></span><a href="#" style="color:#333;"><span class="user">&nbsp;Un-allocate</span></a></td> -->
<!--                <td><i class="outputreport_icon"></i><a href="#" style="color:#333;"><span class="user">Document 2</span></a></td> -->
<!--             </tr> -->
<!--             <tr> -->
<!--             	<td><i class="changeicon"></i><a href="#" style="color:#333;"><span class="user">                                                                                                                                               Change Allocation %</span></a></td> -->
<!--                 <td></td> -->
<!--             </tr> -->
            
<!--             </table> -->
<!--       </div></td> -->
<!-- </tr> -->

<!-- <tr> -->
<!--   <td >UTI Floating Rate Fund</td> -->
<!--   <td>2 lakhs</td> -->
<!--   <td>3 lakhs</td> -->
<!--   <td>10%</td> -->
<!--   <td>50%</td> -->
<!--   <td>15%</td> -->
<!--   <td><a class="chooset" href="executiontracker_action.html" >Action </a> -->
<!--       <div class="tracker2"  style="width:400px;" > -->
<!--        <div class="close" ><a onClick="$('.tracker2').hide()" href="#"><img alt="" src="images/btn_close.gif" /></a></div> -->
<!--   <table class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0"> -->
<!--         	<tr> -->
<!--             	<th class="thead">Action List</th> -->
<!--                 <th class="thead">Document List</th> -->
<!--             </tr> -->
<!--             <tr> -->
<!--             	<td><i class="activaticon"> </i><a href="#"  style="color:#333;"><span class="user">Allocate to another Goal</span></a> </td> -->
<!--                <td><i class="outputreport_icon"></i><a href="#" style="color:#333;"><span class="user">Document 1</span></a>        </td> -->
<!--             </tr> -->
<!--              <tr> -->
<!--             	  <td><span class="deactivaticon"></span><a href="#" style="color:#333;"><span class="user">&nbsp;Un-allocate</span></a></td> -->
<!--                <td><i class="outputreport_icon"></i><a href="#" style="color:#333;"><span class="user">Document 2</span></a></td> -->
<!--             </tr> -->
<!--             <tr> -->
<!--             	<td><i class="changeicon"></i><a href="#" style="color:#333;"><span class="user">                                                                                                                                               Change Allocation %</span></a></td> -->
<!--                 <td></td> -->
<!--             </tr> -->
            
<!--             </table> -->
<!--       </div></td> -->
<!-- </tr> -->
<!-- <tr > -->
<!--   <td>Axis Triple Advantage Fund</td> -->
<!--   <td>50,000</td> -->
<!--   <td>1 lakhs</td> -->
<!--   <td>10%</td> -->
<!--   <td>100%</td> -->
<!--   <td>10%</td> -->
<!--   <td><a class="chooset" href="executiontracker_action.html" >Action </a> -->
<!--       <div class="tracker2"  style="width:400px;" > -->
<!--        <div class="close" ><a onClick="$('.tracker2').hide()" href="#"><img alt="" src="images/btn_close.gif" /></a></div> -->
<!--   <table class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0"> -->
<!--         	<tr> -->
<!--             	<th class="thead">Action List</th> -->
<!--                 <th class="thead">Document List</th> -->
<!--             </tr> -->
<!--             <tr> -->
<!--             	<td><i class="activaticon"> </i><a href="#"  style="color:#333;"><span class="user">Allocate to another Goal</span></a> </td> -->
<!--                <td><i class="outputreport_icon"></i><a href="#" style="color:#333;"><span class="user">Document 1</span></a>        </td> -->
<!--             </tr> -->
<!--              <tr> -->
<!--             	  <td><span class="deactivaticon"></span><a href="#" style="color:#333;"><span class="user">&nbsp;Un-allocate</span></a></td> -->
<!--                <td><i class="outputreport_icon"></i><a href="#" style="color:#333;"><span class="user">Document 2</span></a></td> -->
<!--             </tr> -->
<!--             <tr> -->
<!--             	<td><i class="changeicon"></i><a href="#" style="color:#333;"><span class="user">                                                                                                                                               Change Allocation %</span></a></td> -->
<!--                 <td></td> -->
<!--             </tr> -->
            
<!--             </table> -->
<!--       </div></td> -->
<!-- </tr> -->
<!-- </tbody></table> -->
 
        
                     
       
        <!-- Center-->    
     </div> 
     </div> 
  
  <!-- grid end-->
    </div>
      
      
   </div>    
  </div>
    
            	
</section>           	
<!-- Center part End -->          

<jsp:include page="../common/footer.jsp" />

<%
		int goalId = 0;
		String goalType="";
		try {
			goalId = Integer.parseInt(request.getParameter("goalId")
					.toString());
			goalType= request.getParameter("goalType")
					.toString();
			if (goalId != 0) {
	%>
	<input type="hidden" id="goalidHidden" name="goalId"
		value="<%=goalId%>">
	<input type="hidden" id="goalTypeHidden" name="goalType"
		value="<%=goalType%>">
	<%
		}
		} catch (Exception e) {
	%>
	<input type="hidden" id="goalidHidden" value="0">
	<input type="hidden" id="goalTypeHidden" value="">
	<%
		}
	%>

		<script type="text/javascript">
function showProfile( cellvalue, options, rowObject ){
	var recordTypeId = rowObject.recordTypeId;
	if(recordTypeId == '14005')
		return '<span class="label"><a href="${pageContext.request.contextPath}/addOpportunity.htm?partyId='+rowObject.partyId+'" style="cursor:default;" title="Opportunity"><i class="opportunityicon"></i>'+ cellvalue +'</a></span>';
	else
		return '<span class="label"><a href="${pageContext.request.contextPath}/addClient.htm?partyId='+rowObject.partyId+'" style="cursor:default;" title="Client"><i class="pclienticon"></i>'+ cellvalue +'</a></span>';
}

function showStatus( cellvalue, options, rowObject ){	
		if(cellvalue == 'New')	    
	    	return '<span class="label label-info">' + cellvalue +' </span>';
	    else if(cellvalue == 'Partially Executed')	    
		    	return '<span class="label bggoalh">' + cellvalue +' </span>';
		else if(cellvalue == 'Open')	    
			    	return '<span class="label label-primary">' + cellvalue +' </span>';		
		else if(cellvalue == 'Executed')	    
			return '<span class="label bggoalo">' + cellvalue +' </span>';				
		else if(cellvalue == 'Completed')	    
			return '<span class="label label-danger">' + cellvalue +' </span>';
		else if(cellvalue == 'Cancelled')	    
				return '<span class="label label-danger">' + cellvalue +' </span>';
	}
			 var index=${goalAssetAllocationList};
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
					//colNames:[' ', 'ID','Last Sales','Name', 'Stock', 'Ship via','Notes'],
					colNames:['Asset Name','Cost(Rs)','Current Value(Lac)','CAGR/XIRR','%Allocated to Goal','% Contribution to Goal'],
					colModel:[					
						{name:'assetName',index:'assetName', width:200,},
						{name:'cost',index:'cost', width:150,},
						{name:'currentvalue',index:'currentvalue', width:200,},
						{name:'cagr',index:'cagr', width:150,},
						{name:'assetPercentAllocated2Goal',index:'assetPercentAllocated2Goal', width:180,},
						{name:'percentContributiontoGoal',index:'percentContributiontoGoal', width:220,}						
					], 
			
					viewrecords : true,
					rowNum:10,
					rowList:[10,20,50,100,1000],
					pager : pager_selector,
					altRows: true,
					//toppager: true,
					
// 					multiselect: true,
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
					caption: "Assets Allocated to the Goal",
			
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
						search: false,
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
					buttons.addClass('btn btn-xs').find('[class*="-icon"]').hide();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
					buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
					
					buttons = form.next().find('.navButton a');
					buttons.find('.ui-icon').hide();
					buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
					buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');		
				}
			
				function style_delete_form(form) {
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-xs btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
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
					buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-xs btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
					buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-xs btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
					buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-xs btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
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
		</script>
        <script type="text/javascript">

google.load("visualization", "1", {
 	packages : [ "corechart",'gauge']
// packages:['gauge']
});


$(function(){
	showSelectedTab('goalsLink');
 	getgoaltopsectiodetails();
 	displayRecommendedAllocationAssetclass();
 	displayRecommendedAllocationProductType();
 	displayRecommendedAllocationCategoryType();
 	getRecommedationType();
 	displayCurrentAllocationAssetType();
 	displayCurrentAllocationProductType()
 	displayCurrentAllocationCategoryType();
}) ;


function displayRecommendedAllocationAssetclass() {
	isDataAvailable = true;
	var value = $('#goalidHidden').val();
	$('#assetclassid').show();
	//$('#oppChartbyStage').hide();
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/partner/showPieChart.htm?goalid='+value+'&type=RecAllocationAssetclass',
		success : function(result) {
			
			var firstRow = new Array();
			firstRow.push('Asset Class');
			firstRow.push('Asset Class');
			var title = 'Asset Class  ';
					//+ $("#leadSourceRange option:selected").text();
			var divId = 'assetclassid';
			var outerArray = create2dArray(result, firstRow);
			drawCharts(outerArray, title, divId);

		}
	});
}

function displayRecommendedAllocationProductType() {
	var value = $('#goalidHidden').val();
	isDataAvailable = true;
	$('#Producttype').show();
	//$('#oppChartbyStage').hide();
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/partner/showPieChart.htm?goalid='+value+'&type=RecAllocationProducttype',
		success : function(result) {
			
			var firstRow = new Array();
			firstRow.push('Product Type');
			firstRow.push('Product Type');
			var title = 'Product Type  ';
					//+ $("#leadSourceRange option:selected").text();
			var divId = 'Producttype';
			var outerArray = create2dArray(result, firstRow);
			
			drawCharts(outerArray, title, divId);

		}
	});
}

function displayRecommendedAllocationCategoryType() {
	var value = $('#goalidHidden').val();
	isDataAvailable = true;
	$('#Productcategory').show();
	//$('#oppChartbyStage').hide();
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/partner/showPieChart.htm?goalid='+value+'&type=RecAllocationCategory',
		success : function(result) {
			
			var firstRow = new Array();
			firstRow.push('Product Category');
			firstRow.push('Product Category');
			var title = 'Product Category  ';
					//+ $("#leadSourceRange option:selected").text();
			var divId = 'Productcategory';
			var outerArray = create2dArray(result, firstRow);
			
			drawCharts(outerArray, title, divId);

		}
	});
}

function displayCurrentAllocationAssetType() {
	var value = $('#goalidHidden').val();
	isDataAvailable = true;
	$('#currentAllocationAsset').show();
	//$('#oppChartbyStage').hide();
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/partner/showPieChart.htm?goalid='+value+'&type=CurrentAllocationAsset',
		success : function(result) {
			
			var firstRow = new Array();
			firstRow.push('Asset Class');
			firstRow.push('Asset Class');
			var title = 'Asset Class  ';
					//+ $("#leadSourceRange option:selected").text();
			var divId = 'currentAllocationAsset';
			var outerArray = create2dArray(result, firstRow);
			
			drawCharts(outerArray, title, divId);

		}
	});
}


function displayCurrentAllocationProductType() {
	var value = $('#goalidHidden').val();
	isDataAvailable = true;
	$('#CurrentProducttype').show();
	//$('#oppChartbyStage').hide();
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/partner/showPieChart.htm?goalid='+value+'&type=CurrentAllocationProduct',
		success : function(result) {
			
			var firstRow = new Array();
			firstRow.push('Product Type');
			firstRow.push('Product Type');
			var title = 'Product Type ';
					//+ $("#leadSourceRange option:selected").text();
			var divId = 'CurrentProducttype';
			var outerArray = create2dArray(result, firstRow);
			
			drawCharts(outerArray, title, divId);

		}
	});
}

function displayCurrentAllocationCategoryType() {
	var value = $('#goalidHidden').val();
	isDataAvailable = true;
	$('#categoryType').show();
	//$('#oppChartbyStage').hide();
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/partner/showPieChart.htm?goalid='+value+'&type=CurrentAllocationCategory',
		success : function(result) {
			
			var firstRow = new Array();
			firstRow.push('Product Category');
			firstRow.push('Product Category');
			var title = 'Product Category  ';
					//+ $("#leadSourceRange option:selected").text();
			var divId = 'categoryType';
			var outerArray = create2dArray(result, firstRow);
			
			drawCharts(outerArray, title, divId);

		}
	});
}




function create2dArray(result, firstRow) {
	
	isDataAvailable = false;
	var innerArray = new Array();
	var outerArray = new Array();
	innerArray.push(firstRow[0]);
	innerArray.push(firstRow[1]);
	outerArray.push(innerArray);
	for ( var i = 0; i < result.length; i++) {

		innerArray = new Array();
		innerArray.push(result[i].title);
		innerArray.push(parseFloat(result[i].count));
		outerArray.push(innerArray);
		//alert(outerArray);
		if (result[i].value != 0) {
			isDataAvailable = true;
		}
	}
	return outerArray;
}

function drawCharts(outerArray, title, divId) {
	//alert(outerArray);
	var data = google.visualization.arrayToDataTable(outerArray);
	var options = {
		backgroundColor: 'transparent',	
		title : title,
		is3D: true
		,height: 300
		,width: '100%'
		//sliceVisibilityThreshold : 0
	};

	var chart = new google.visualization.PieChart(document
			.getElementById(divId));
	chart.draw(data, options);

}

function getgoaltopsectiodetails()
{
var value = $('#goalidHidden').val();

	$.ajax({
		type : 'POST',
		url : $('#contextPath').val()+ "/goal/getGoalDetails.htm?goalid="+value+"&type=TopSection",
		 success : function(result) {
		$(result).each(	function(i,obj) {
											
											var Name = obj.name;
											var GoalName= obj.goalName;
											var GoalEndYear = obj.goalEndYear;
											var GoalAmountFV = obj.goalAmountFV+' Lac';
											var duein = obj.duein;
											var GoalAmountPV =  obj.goalAmountPV+' Lac';
											var achievedPercentage = obj.achievedGoalPercetage;
											var goalachievedPercentage = obj.achievedGoalPercetage+'%';
											var achivedGoalPercentageSofar=obj.achivedGoalPercentageSofar+'%';
											
										
											
											//alert('GoalAmountPV='+GoalAmountPV);
											$('#name').html(Name); // to set value in label 
											$('#GoalEndYear').html(GoalEndYear); 
											$('#goalAmount').html(GoalEndYear); 
											$('#goalFuturevalue').html(GoalAmountFV); 
											$('#duein').html(duein); 
											$('#goalCurrentvalue').html(GoalAmountPV);
											$('#GoalAcheivedPercentage').html(goalachievedPercentage);
											$('#AcheivedPercentage').css('width',achievedPercentage +'%');
											$('#goalAmountPercentage').html(100);
											$('#AcheivedPercentage_goalAmount').css('width',100 +'%');
											$('#GoalAcheivedPercentageSoFar').html(achivedGoalPercentageSofar);
											$('#AcheivedPercentage_SoFar').css('width',achivedGoalPercentageSofar +'%');
											Name=$('#goalTypeHidden').val();
											if(Name=='Car'){
												$('#goalImage').attr('class','fa fa-car bigger-300 blue');
											}else if(Name=='Higher Education'){
												$('#goalImage').attr('class','fa fa-graduation-cap  bigger-300 blue');
											}else if(Name=='Marriage'){
												$('#goalImage').attr('class','fa fa-heart bigger-300 blue');
											}else if(Name=='Property or House'){
												$('#goalImage').attr('class','fa fa-home bigger-300 blue');
											}else if(Name=='Travel or Vacation'){
											$('#goalImage').attr('class','fa fa-map-marker bigger-300 blue');
											}else if(Name=='Retirement'){
												$('#goalImage').attr('class','fa fa-calendar bigger-300 blue');
											}else if(Name=='Parental Responsibility'){
											$('#goalImage').attr('class','fa fa-wheelchair bigger-300 blue');
											}else if(Name=='Start Business'){
												$('#goalImage').attr('class','fa fa-cogs bigger-300 blue');
											}else if(Name=='Others'){
												$('#goalImage').attr('class','fa fa-anchor bigger-300 blue');
											}else if(Name=='Target Corpus') {
													$('#goalImage').attr('class','icon-target_corpus size-48 blue');
											}
											
											//$('#doc1link').attr('onclick','downloadAttachment('+Attchemnt1id+')'); // to set value in a href onclick function
								
										});
					}
				});
	} 
	
	
function getAssetAllocationForGoal()
{
var value = $('#goalidHidden').val();
	$.ajax({
		type : 'POST',
		url : $('#contextPath').val()+ "/goal/getAssetAllocationForGoal.htm?goalid="+value+"&type=detail",
		 success : function(result) {
		$(result).each(	function(i,obj) {
											
											var assetName = obj.assetName;
											var cost= obj.cost;
											var currentvalue = obj.currentvalue;
											var cagr = obj.cagr;
											var AssetPercentAllocated2Goal = obj.AssetPercentAllocated2Goal;
											var percentContributiontoGoal =  obj.percentContributiontoGoal;
											
											
											
											
											//alert()
// 											$('#name').html(Name); // to set value in label 
// 											$('#GoalEndYear').html(GoalEndYear); 
// 											$('#goalAmount').html(GoalEndYear); 
// 											$('#goalFuturevalue').html(GoalAmountFV); 
// 											$('#duein').html(duein); 
// 											$('#goalCurrentvalue').html(GoalAmountPV);
// 											$('#GoalAcheivedPercentage').html(goalachievedPercentage);
// 											$('#AcheivedPercentage').css('width',achievedPercentage +'%');
											//$('#doc1link').attr('onclick','downloadAttachment('+Attchemnt1id+')'); // to set value in a href onclick function
								
										});
					}
				});
	} 


function getRecommedationType()
{
var value = $('#goalidHidden').val();
var RecLumsumAmount;
var RecSIPAmount;
var CURLumsumAmount;
var CURSIPAmount;
var GAPLumsumAmount;
var GAPSIPAmount;
	$.ajax({
		type : 'POST',
		url : $('#contextPath').val()+ "/goal/getGoalDetails.htm?goalid="+value+"&type=RecommendationInvestment",
		 success : function(result) {
		$(result).each(	function(i,obj) {
			
			for ( var i = 0; i < result.length; i++) {
				
				//alert(result[i].name)
				if(result[i].name=='RecLumsumAmount'){
					
					if(result[i].amount<1)
						{
							$('#RecLumsum').css('width',0+'%');
							$('#RLumsum').html(result[i].amount);	
						}
					else
						{
							$('#RecLumsum').css('width',result[i].widthPercentage +'%');
							$('#RLumsum').html(result[i].amount+' Lac');	
						}
					
					}
				if(result[i].name=='RecSIPAmount'){
					$('#RecSIP').css('width',result[i].widthPercentage +'%');
					$('#RSIP').html(result[i].amount+ ' thousand');
				}
				if(result[i].name=='CURLumsumAmount'){
					$('#CurLumsum').css('width',result[i].widthPercentage +'%');
					$('#CLumsum').html(result[i].amount+' Lac');
				}
				if(result[i].name=='CURSIPAmount'){
					$('#CurSIP').css('width',result[i].widthPercentage +'%');
					$('#CSIP').html(result[i].amount+ ' thousand');
				}
				if(result[i].name=='GAPLumsumAmount'){
					$('#GapLumsum').css('width',result[i].widthPercentage +'%');
					$('#GLumsum').html(result[i].amount+' Lac');
				}
				if(result[i].name=='GAPSIPAmount'){
					$('#GapSIP').css('width',result[i].widthPercentage +'%');
					$('#GSIP').html(result[i].amount+ ' thousand');
				}
				
			}
		//	$('#GoalAcheivedPercentage').html(goalachievedPercentage);
		//	$('#AcheivedPercentage').css('width',achievedPercentage +'%');
											
								
										});
					}
				});
	} 


var hidePopupTimeoutId;

$(".chooset").on("mouseover", function () {
    clearTimeout( hidePopupTimeoutId );
    $(".tracker2").show();
});


$(".chooset").on("mouseout", function () {
    hidePopupTimeoutId = setTimeout( function() {
        $(".tracker2").hide();
    },500);
});

$(".tracker2").on("mouseenter", function() {
    clearTimeout( hidePopupTimeoutId );
});


$(".tracker2").on("mouseleave", function() {
    $(".tracker2").hide();
});



</script>
<script>
$(window).resize(function(){
displayRecommendedAllocationAssetclass();
displayRecommendedAllocationProductType();
displayRecommendedAllocationCategoryType();
displayCurrentAllocationAssetType();
displayCurrentAllocationProductType()
displayCurrentAllocationCategoryType();
  });
</script>
</body>
</html>