<%@page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en"><head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Goal List</title>
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
    <!--<script src="js/jquery-1.js"></script>
    <script src="js/bootstrap.min.js"></script>
     <script src="js/bootstrap-responsive.js"></script>
      <script src="js/bootstrap-responsive.min.js"></script>
      <script src="js/bootstrap.js"></script>
    <script src="js/holder.js"></script>
-->
 <!-- -responsive css-->
<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
--><!-- -responsive css-->
<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript" src="js/pop.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
-->	<script src="<%=request.getContextPath()%>/js/report.js"></script>
	


<!--<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">-->
<style>
.popupnew2 {
position: absolute;
top: 42%;
left: 75%;
padding: 20px;
z-index: 9000;
width: auto;
background-color: #fff;
display: none;
border: 1px solid #eee;
border-radius: 4px;	
-webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
}

</style>

<!--<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">-->



<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->

<script type="text/javascript">
$(document).ready(function(){
	  $.ajax({
			 type :'GET',
	      url : $('#contextPath').val() +"/birtreport/urlForReport.htm",
			 success : function(result) 
			 {
				 //alert("URL AjexHiiii"+result);
				// reportLink =  result;
				 $('#abc').val(result);
				 
				  
				 
		}
		});
}); 

var hidePopupTimeoutId;
$(".choose").live("mouseover", function () {
    clearTimeout( hidePopupTimeoutId );
    $(".tracker").show();
});


$(".choose").live("mouseout", function () {
    hidePopupTimeoutId = setTimeout( function() {
        $(".tracker").hide();
    },500);
});

$(".tracker").live("mouseenter", function() {
    clearTimeout( hidePopupTimeoutId );
});


$(".tracker").live("mouseleave", function() {
    $(".tracker").hide();
});
function getPopUpAction(id)
{
	//alert('in getPopUpAction='+id);
	$("#"+id).show();		
}




function goToProfilePage(partyid,recordType)
{

	if(recordType=='Opportinity')
		{
		window.location.href = $('#contextPath').val()+"/opportunityprofile.htm?partyId="+partyid;
		
		}
	else{
		window.location.href = $('#contextPath').val()+"/clientprofile.htm?partyId="+partyid;
	}
}


function redirectET(){
	 
	//alert( $('#quickSearch').val());
	 
	 $('#partyId').val(map[$('#quickSearch').val()]);
	 
	 document.getApDataForm.action=$('#contextPath').val()+"/et/getApDetails.htm";
	 document.getApDataForm.submit();
	}

function getXLS()
{
	    var condition = GetURLParameter('condition');
	    if (condition==undefined){
	    	condition='';
	    }
	    var parameterValue = GetURLParameter('parameterValue');
	    if (parameterValue==undefined){
	    	parameterValue='';
	    }
	    var firstElement = GetURLParameter('firstElement');
	    if (firstElement==undefined){
	    	firstElement='';
	    }
	    var lastElement = GetURLParameter('lastElement');
	    if (lastElement==undefined){
	    	lastElement='';
	    }
		window.location.href = $('#contextPath').val()+"/goal/getGoalListXLS.htm?condition="+condition+'&pageSize='+$('#page').val()+'&parameterValue='+parameterValue+'&firstElement='+firstElement+'&lastElement='+lastElement;
}
function getCSV()
{
 	 	var condition = GetURLParameter('condition');
	    if (condition==undefined){
	    	condition='';
	    }
	    var parameterValue = GetURLParameter('parameterValue');
	    if (parameterValue==undefined){
	    	parameterValue='';
	    }
	    var firstElement = GetURLParameter('firstElement');
	    if (firstElement==undefined){
	    	firstElement='';
	    }
	    var lastElement = GetURLParameter('lastElement');
	    if (lastElement==undefined){
	    	lastElement='';
	    }
		window.location.href = $('#contextPath').val()+"/goal/getGoalListCSV.htm?condition="+condition+'&pageSize='+$('#page').val()+'&parameterValue='+parameterValue+'&firstElement='+firstElement+'&lastElement='+lastElement;
}
function pagesizeurl(){	
	var pageSize=$('#page').val();	
	setResult('');	
}
function setResult(filterRuleCriteria){	
	  openPopupWebApp('centerLoadingImage', 25, 35);
	  var pageval =  $('#page').val();
	  $("#toreload").load('${pageContext.request.contextPath}/goal/getGoalList.htm #toreload', {
	   object: '${object}',
	   pageSize: $('#page').val(),//'${pageSize}', 
	   filterRule: filterRuleCriteria
	     }, function( response, status, xhr ) {
	      try{	    	
//	        	showQueryDetails();
	        //addPageSize(filterRuleCriteria,pageval);
	        //$('#hfilterRule').val(filterRuleCriteria);
	        closePopupWebApp('');
	      }catch(e){
	         closePopupWebApp('');       
	      }
	     });
	 }
	 function getClientSummary_Goal(partnerId,buId,clientId)
	 {
		  window.location.href = $('#contextPath').val()+"/loadreportClientGoalSummary.htm?clientId="+clientId;
	 }
	 function getClientGoalDetails_Goal(clientId)
	 {
		 window.location.href = $('#contextPath').val()+"/loadreportClientGoalDetails.htm?clientId="+clientId;
	 }

</script>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/common_popup.jsp" />
<input id="contextPath" type="hidden" name="contextPath" 
		value="<%=request.getContextPath()%>" />
 	
 <!-- Center part start -->
 <section>
 
 <!-- <div class="container">
     	<div class="topmenuleft">
       
      <ul>
      	<li><select class="form-control button">
  <option>Status</option>
  <option>Campaign Name</option>
  <option>Phone Number</option>
  <option>City</option>
  <option>Last Name</option>
  <option>First Name</option>
</select></li>
        <li><select class="form-control button">
  <option>Open</option>
  <option>Meeting Follow-up</option>
  <option>Meeting Fixed</option>
  <option>Meeting Done</option>
  <option>Converted</option>
  <option>Not Interested</option>
</select></li>
        <li><select class="form-control button">
  <option>BNI</option>
  <option>Corp Comm</option>
  <option>Employee Referral</option>
  <option>Opportunity Engines</option>
  <option>NDC</option>
  <option>Seminar (MKT)</option>
  <option>Seminar (WS)</option>
  <option>Web</option>
  <option>Client Referral</option>
  <option>Opportunity Referral</option>
  <option>BP</option>
   <option>Database</option>
          <option>FP Referral</option>
            <option>Web-XRAY</option>
              <option>Web-FinancialX-Ray</option>
              <option>Web-Wellness</option>
              <option>Others</option>
              <option>PO</option>
</select></li>
        <li><select class="form-control button">
  <option>Contains</option>
  <option>Equals</option>
  
</select></li>
<li><input class="btn dbtn" type="button" value="Search" name="button_AdvanceSearchGO" data-cid="advanceSearch" data-params=""></li>
       
      </ul>

        </div>
     </div>-->
     
    <div class="container">
    <div class="main-content">
      <div class="main-contnet-inner">
        <div class="page-content">
        <div class="page-header clearfix">
							<h1 class="pull-left">
								Goal List  
								<%
									if (request.getParameter("condition") != null
											&& request.getParameter("condition").equals("GoalByType")) {
								%>- <span id="goalType"></span>
								<%
									}
								%>
								<%
									if (request.getParameter("parameterValue") != null
											&& request.getParameter("parameterValue").equals("1")) {
								%>: 0-3
								Yrs<%
									}
								%>
								<%
									if (request.getParameter("parameterValue") != null
											&& request.getParameter("parameterValue").equals("2")) {
								%>: 4-6
								Yrs<%
									}
								%>
								<%
									if (request.getParameter("parameterValue") != null
											&& request.getParameter("parameterValue").equals("3")) {
								%>: 7-10
								Yrs<%
									}
								%>
								<%
									if (request.getParameter("parameterValue") != null
											&& request.getParameter("parameterValue").equals("4")) {
								%>: 11-14
								Yrs<%
									}
								%>
								<%
									if (request.getParameter("parameterValue") != null
											&& request.getParameter("parameterValue").equals("5")) {
								%>: 15-17
								Yrs<%
									}
								%>
								<%
									if (request.getParameter("parameterValue") != null
											&& request.getParameter("parameterValue").equals("6")) {
								%>: 18-20
								Yrs<%
									}
								%>
								<%if(request.getParameter("parameterValue")!=null && request.getParameter("parameterValue").equals("7")){%>: 20+
								Yrs<%}%>
							</h1>
						</div>
    	<div class="container-head">
    	  <div class="col-md-12" style="text-align: right;"> 
             <!-- accordion start-->
           
           	 <div class="accordion pull-left " id="accordFundSel">
                <div class="accordion-group">
                  <!-- <div class="pull-left fundtool_left_col_head "> <span style="float:left;">Goal List</span> </div>
                  <div class="accordion-heading" style="float:right;"> <a class="accordion-toggle " data-toggle="collapse" data-parent="#accordFundSel" href="#collapseFundSel"> <span style=" margin-top:0px;" class="searchicon none"  alt="Search" title="Search"></span> </a> </div> -->
                  <div style="height: auto;" id="collapseFundSel" class="accordion-body pull-left serchboxnew collapse">
                    <div class="accordion-inner table-responsive">
                    	<div style="width: 1211px;">
                        <!--1 search start -->
                           <div class="filterbox searchpadding">
                            <div class="head"> Stage</div>
                           <div class="drop_box_body">
                             <ul class="nav  nav-stacked">
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                                New </li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                                Open</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                                Partially executed</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                                Executed</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                                Completed</li>
                            
                            </ul>
                         	</div>
                         </div>
                         
                         <div class="filterbox searchpadding">
                          <div class="head">Goal Type</div>
                          <div class="drop_box_body">
                            <ul class="nav  nav-stacked">
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" >
                                Home </li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                                Car</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" >
                                Education</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                               Emergency funding</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" >
                                Retirement</li>
                             
                            </ul>
                          </div>
                        </div>
                        
                        <div class="filterbox searchpadding">
                          <div class="head">Goal Name</div>
                          <div class="drop_box_body">
                            <ul class="nav  nav-stacked">
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                               Purchase a house</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                               Child education</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Build long term health corpus</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Retirement</li>
                                
                             <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Emergency funding</li>
                                 <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Buy a house</li>
                                 <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Buy a Car</li>
                             
                             
                            </ul>
                          </div>
                        </div>
                        
                         <div class="filterbox searchpadding">
                          <div class="head"> Duration</div>
                          <div class="drop_box_body">
                            <ul class="nav  nav-stacked">
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Jan2010-Dec2010</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                               Jan2011-Dec2011</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                               Jan2012-Dec2012</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                               Jan2013-Dec2013</li>
                                <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                               Jan2014-Dec2014</li>
                             
                             
                             
                            </ul>
                          </div>
                        </div>
                        
                         <div class="filterbox searchpadding">
                          <div class="head">Amount</div>
                          <div class="drop_box_body">
                            <ul class="nav  nav-stacked">
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                1000000/-</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                               1500000/-</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                2000000/-</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                2500000/-</li>
                             
                             
                            </ul>
                          </div>
                        </div>
                          <div class="filterbox searchpadding">
                          <div class="head">Last 10 updated goals</div>
                          <div class="drop_box_body">
                            <ul class="nav  nav-stacked">
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Home</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                               Retirement</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Child education</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                 Buy a house</li>
                             
                             
                            </ul>
                          </div>
                        </div>
                      
                        </div>
                       </div>
                         <div class="col-md-1">
                      <button type="button" id="updatefilterlist" class="btn">Show</button>
                    </div>
                    </div>          
                    <!-- accordion-inner END -->
                  <!-- accordion-body END -->
                </div>
           	    <!-- accordion-group END -->
              </div>
           	  <!-- accordion  END -->
               <!-- accordion End -->
            </div >
          </div >
  	  <div class="clearfix"></div>
            <div class="table-responsive" id="display_table_lead" style="border: none;">
  	  <div id="toreload" class="col-md-12 tabular_break_word">
		<table id="grid-table"></table>
	</div>
	<div id="grid-pager"></div>			                        
	 <!-- <div class="topmenuleft" >
		  <ul>
		  	<li> Export options: </li>
		    <li> <a onclick="getCSV()" title="Export in CSV" alt="Export in CSV"><i class="cvsicon"></i></a></li>
		    <li><a onclick="getXLS()" title="Export in Excel" alt="Export in Excel"> <i class="excelicon"></i></a></li>
		  </ul>
	 </div> -->
	 <div class="topmenuleft margin_5px" >
	 <span>Export options:</span>
	 <a class="margin_5px" onclick="getCSV()" title="Export in CSV" alt="Export in CSV"><i class="fa fa-file-o bigger-140"></i></a>
	 <a class="margin_5px" onclick="getXLS()" title="Export in Excel" alt="Export in Excel"><i class="fa fa-file-excel-o bigger-140"></i></a>                  
     </div>
     </div>
     </div>
     </div>
     </div>
     </div>
            	
</section>           	
<!-- Center part End -->    

<jsp:include page="../common/footer.jsp" />

<form method="post" name="getApDataForm" id="getApDataForm">
<input type="hidden" id="partyIdToSend" name="partyId"/></form>
<input type="hidden" id="hiddenPartyId" name="hiddenPartyId" value="0"/></form>
<script>

function openEtFromGoal(partyId){
	$('#partyIdToSend').val(partyId);
	$('#getApDataForm').attr('action',$('#contextPath').val()+"/et/getApDetails.htm");
	$('#getApDataForm').submit();
} 
showSelectedTab('goalsLink');
</script>

<script type="text/javascript">
function showProfile( cellvalue, options, rowObject ){
	var recordTypeId = rowObject.recordTypeId;
	if(recordTypeId == '14005'){
		return '<span><a href="${pageContext.request.contextPath}/opportunityprofile.htm?partyId='+rowObject.partyId+'" style="cursor:default;" title="Opportunity"><i></i>'+ cellvalue +'</a></span>';
	}else{
		return '<span><a href="${pageContext.request.contextPath}/clientprofile.htm?partyId='+rowObject.partyId+'" style="cursor:default;" title="Client"><i></i>'+ cellvalue +'</a></span>';
	}
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
			 var index=${goalDataList};
			 //grid_data=JSON.parse(grid_data); 
			
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
					//colNames:['Contact Name','Goal Type','Goal Name','Goal Year','Current Cost','Future Cost','Allocated Asset Value','Status','Achievement Scale(%)','Estimated Revenue','Action'],
					colNames:['Contact Name','Goal Name','Goal Year','Current Cost','Future Cost','Allocated Asset Value','Status','Achievement Scale(%)','Estimated Revenue','Action'],
					colModel:[					
						{name:'contactName',index:'contactName', formatter:showProfile},
						/* {name:'goalType',index:'goalType'}, */
						{name:'goalName',index:'goalName'},
						{name:'goalEndYear',index:'goalEndYear'},
						{name:'currentCost',index:'currentCost'},
						{name:'futureCost',index:'futureCost'},
						{name:'investmentAmount',index:'investmentAmount'},						
						{name:'goalStatus',index:'goalStatus',formatter:showStatus},												
						{name:'AchievementScale',index:'AchievementScale'},			
						{name:'estimatedRevenue',index:'estimatedRevenue'},					
						{name:'action',index:'action',formatter:function(cellvalue, options,rowObject) {
							$('#goalType').html(rowObject.goalType);
						    //return '<a onclick="openActionPopup('+rowObject.notifyTemplateID+',\''+rowObject.pingOwner+'\',\''+rowObject.active+'\',\''+rowObject.name+'\',\''+rowObject.favouriteTemplate+'\')">Action</a>';
							return '<a onclick="openActionPopup('+rowObject.partyId+',\''+rowObject.goalId+'\',\''+rowObject.goalType+'\')">Action</a>';
						}},
						
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
					//caption: "jqGrid with inline editing"
			
					autowidth: true,
		            shrinkToFit:true,	
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
			
			function openActionPopup(partyId,goalId,goalType){
				//alert(notifyTemplateID);
				//$('#DeliveryHistoryLink a').attr('href','${pageContext.request.contextPath}/ping/getDelivaryHistory.htm?notifyTemplateId='+notifyTemplateID);
				$('#goaldetail').removeClass('hide');
				$('#executiontracker').removeClass('hide');
				$('#clientgoalsummaryreport').removeClass('hide');
				$('#ClientGoalDetailReport').removeClass('hide');				
				$('#GoalDetail a').attr("href",'${pageContext.request.contextPath}/goal/getAssetAllocationForGoal.htm?goalId='+goalId+'&goalType='+goalType);
				$('#goaldetail a').attr("href",'${pageContext.request.contextPath}/goal/getAssetAllocationForGoal.htm?goalId='+goalId+'&goalType='+goalType);
				$("#hiddenPartyId").val(partyId);							
				$( ".action_dialog" ).removeClass('hide').dialog({
					resizable: false,
					modal: true,
                    width: "auto",
				});
			
				
			}
			
			function openEtFromGoal(partyId){
				partyId = $('#hiddenPartyId').val();				
				$('#partyIdToSend').val(partyId);
				$('#getApDataForm').attr('action',$('#contextPath').val()+"/et/getApDetails.htm");
				$('#getApDataForm').submit();
			}
			/* 
			function getClientSummary_Goal(partnerId,buId,clientId)
			 {						
				  clientId = $("#hiddenPartyId").val();				  		
				  window.location.href = $('#contextPath').val()+"/loadreportClientGoalSummary.htm?clientId="+clientId;
			 }
			 function getClientGoalDetails_Goal(clientId)
			 {
				 clientId = $("#hiddenPartyId").val();
				 window.location.href = $('#contextPath').val()+"/loadreportClientGoalDetails.htm?clientId="+clientId;
			 } */
			 
			 function getClientSummary_Goal(partyid,buId,clientId)
			 {
				 //alert("Hiii in 1");
				 var nodeid = ${sessionScope.nodeId};
				 var buid = ${sessionScope.userSession.buId};
				 
				
				 getClientSummary(partyid,buid,clientId,nodeid);
				 
				 // window.location.href = $('#contextPath').val()+"/loadreportClientGoalSummary.htm?clientId="+clientId;
			 }

			 
			  function getClientSummary(partyid,buid,clientId,nodeid)
			  {
				// alert("Hiiii in 2");
				  var buId=buid;
				  
					//var ClientpartyId = $('#quickSearchHidden').val();
					var ClientpartyId = clientId;
					if ((ClientpartyId == '')||(ClientpartyId == 'NULL'))
					    {
						ClientpartyId=0;
					    }
				
				
					var url="ClientGoalSummaryReport&rs:Command=Render&rc:Parameters=false&buId="+buId+"&partnerId="+partyid+"&partyId="+ClientpartyId+"&loggedpartyId="+partyid+"&nodeId="+nodeid+"";
				callReport(url);
				  var actionByUserID = ${sessionScope.userSession.userId};
				  var sourceModule='Rpt_PP_ClientGoalSummaryReport.rdl';
				  var sourceScreen='Rpt_PP_ClientGoalSummaryReport.rdl';
				  var objectName = buId+','+partyid+','+ClientpartyId+','+partyid+','+nodeid;
				  $.ajax({
						 type :'POST',
				      url : $('#contextPath').val() +"/birtreport/auditForReport.htm?actionByPartyId="+partyid+"&actionByUserID="+actionByUserID+"&eventID="+97191+"&sourceSystemID="+31001+"&sourceModule="+sourceModule+"&sourceScreen="+sourceScreen+"&objectName="+objectName,
						 success : function(result) 
						 {
							 //alert("Audit AjexHiiii");

					}
					});
			  }
			  
//		 	 function getClientGoalDetails_Goal(clientId)
//		 	 {
//		 		 window.location.href = $('#contextPath').val()+"/loadreportClientGoalDetails.htm?clientId="+clientId;
//		 	 }



			  function getClientGoalDetails_Goal(clientId)
				 {
					 //alert("Hiii in 1");
					 var nodeid = ${sessionScope.nodeId};
					 var buid = ${sessionScope.userSession.buId};
					 var partyid= ${sessionScope.userSession.partyId};
					 
					// alert(nodeid);
					 getClientGoalDetails(partyid,buid,clientId,nodeid);
					 
					 // window.location.href = $('#contextPath').val()+"/loadreportClientGoalSummary.htm?clientId="+clientId;
				 }
			
			function getClientGoalDetails(partyid,buid,clientId,nodeid)
			{
				    //alert("Hi in 2");
				    var buId=buid;
					var ClientpartyId = clientId;
					if ((ClientpartyId == '')||(ClientpartyId == 'NULL'))
					    {
						ClientpartyId=0;
					    }
				
				
					var url="ClientGoalDetailsReport&rs:Command=Render&rc:Parameters=false&buId="+buId+"&partnerId="+partyid+"&partyId="+ClientpartyId+"&loggedpartyId="+partyid+"&nodeId="+nodeid+"";
				  callReport(url);
				  var actionByUserID = ${sessionScope.userSession.userId};
				  var sourceModule='Rpt_PP_ClientGoalDetailsReport.rdl';
				  var sourceScreen='Rpt_PP_ClientGoalDetailsReport.rdl';
				  var objectName = buId+','+partyid+','+ClientpartyId+','+partyid;
				  $.ajax({
						 type :'POST',
				      url : $('#contextPath').val() +"/birtreport/auditForReport.htm?actionByPartyId="+partyid+"&actionByUserID="+actionByUserID+"&eventID="+97191+"&sourceSystemID="+31001+"&sourceModule="+sourceModule+"&sourceScreen="+sourceScreen+"&objectName="+objectName,
						 success : function(result) 
						 {
							 //alert("Audit AjexHiiii");

					}
					});
					  
				  
				  
			  }
			 
			 
			 
			 
		</script>
		<div class="common_dialog hide action_dialog">
  <table id="" class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0">
    <tbody>
      <tr id="">
        <th class="thead">Action List</th>
      </tr>
      <tr id="goaldetail" class="hide">
        <td id="GoalDetail"><i class="fa fa-check" ></i><a  href="#"><span class="">GoalDetails</span></a> </td>
      </tr>
      <tr id="executiontracker" class="hide">
        <td id="ExecutionTracker"><i class="fa fa-check" ></i><a  onclick="$('.action_dialog').hide();openEtFromGoal(0)"><span class="">Execution Tracker</span></a> </td>
      </tr>
      <tr id="clientgoalsummaryreport" class="hide">
        <td id="ClientGoalSummaryReport"><i class="fa fa-check" ></i><a onClick="$('.action_dialog').hide();getClientSummary_Goal(${sessionScope.userSession.partyId},${sessionScope.userSession.buId},0);location.reload();"><span class="">Client Goal Summary Report</span></a> </td>
      </tr>      
      <!-- <tr id="ClientGoalDetailReport" class="hide">
        <td id="clientgoaldetailreport"><i class="fa fa-check" ></i><a onClick="$('.action_dialog').hide();getClientGoalDetails_Goal(0);location.reload();"><span class="">Client Goal Detail Report</span></a> </td>
      </tr>   -->   
    </tbody>
  </table>
</div>
</body>
</html>