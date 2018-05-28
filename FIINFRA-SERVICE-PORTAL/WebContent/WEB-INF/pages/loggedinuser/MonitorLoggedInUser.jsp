<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Monitor Logged In User</title>
  <%-- <link rel="stylesheet" href="<%=request.getContextPath()%>//resources/demos/style.css" /> --%>
  
  
  
<style>
   
 

#ui-id-1{
	width:168px!important;
	/* padding-left:20px!important; */}
#ui-id-2{
	width:168px!important;
	/* padding-left:24px!important; */}
.ui-menu-item{
list-style:none !important;}
.ui-corner-all{
margin-left:10px!important;}
.ui-helper-hidden-accessible{color:#000;}
.chart {
  width: 100%; 
  height: 300px;
}

.chart_outside{
        position:relative;
   /*      display: inline;
        border: 2px solid #FFF;
        width: 500px;
        height: 460px;
        background: #000;
        margin: 5px 5px 5px 5px; */
        }

.chart_inside{
		position:relative;
        /* position:absolute; */
        left:-247px;
        right:0px;
        top:0px;
        }
</style>  
 <!-- -responsive css-->



<script type="text/javascript">
function resetval()
{
	
	    $('#addquickSearchpart').val('');
		$('#addquickSearchHiddenpart').val('');
		$('#addquickSearch').val('');
		$('#addquickSearchHidden').val('');
		$('#documentNameId').val('');
		$('#descriptionNoteId').val('');
		$('#statusId').empty();
      		
}

function reload()
{
location.reload();
}

</script>
<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">

</head>
<body>

<jsp:include page="../common/header.jsp" />
<%HttpSession hes=request.getSession();%>

<input id="contextPath" type="hidden" name="contextPath"	value="<%=request.getContextPath()%>" />

<input id="status" type="hidden" name="status"	value="<%=hes.getAttribute("status")%>" />
<!--css popup window start 1-->
<div style="display: none;" id="blanket"></div>
<div style="display: none; width:450px; height:380px; top:100px" id="popUpDiv">
<div class="close" style="margin-right:10px;"><a onClick="popup('popUpDiv');" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>

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
<div style="display: none; width:650px; height:550px; top:100px" id="popUpAlertaddnote" class="alert">
<div class="close" style="margin-right:10px;"><a onClick="popup('popUpAlertaddnote');refresh();" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>

   
</div>
<!--css popup window 2 close-->

    
      <!--Nav Menu Start--> 
      <div class="container">
			
		</div>
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
<!--Nav Menu End--> 
<!--breadcrum Menu Start--> 


 <!-- Center part start -->
 <section>

     
 <div>
			    	<div>
			    	  <div class="col-md-12" style="text-align: right;"> 
			             <!-- accordion start-->
			           
			           	  <div class="accordion pull-left col-md-12" id="accordFundSel">
			                <div class="accordion-group">
			                	
			                   <div class="page-header clearfix">   <h1 class="pull-left" ><B>Monitor Logged In Users</B></h1></div>
			                  		
			                  </div>
			               
			
			                </div>
			              </div>
			           	 
			            </div >
  	  <div class="container-body" style="margin-top:0px;">
        <!-- center -->
        
			     	<div class="ui-id-1" >
			        <div class="boxshadow" style="margin:20px 0;">  
						        <center>
						        	  <div id="chart_div" class="chart" >  </div>
						<!--         	<img src="images/logged_user_graph.gif" class="img-responsive"> -->
						        </center>
						  	</div> 
			        
			        </div>
          
  
       
  <!-- <ul class="pagination pagination-sm"> -->
  			<div class = "row">
						 <form name="abc" id="abc" method="Post"  action="<%=request.getContextPath()%>/loggedinuser/loadLoggedInUserList.htm">
							<input id="viewStatus" type="hidden" name="viewStatus"	/>
							
							 <span  class="searchpadding padding_top" style="float:left; font-weight: bold ;">Monitor Logging in user </span>
										 <div class="searchboxreport" style="position: relative;bottom:6.5px;left: 30px">
											<span  class="searchpadding padding_top" style="float:left;">
												<select name="statusViewId" class="form-control" id="statusId"   onchange="viewStatusUrl()"   >
															 <c:forEach var="item" items="${viewstatus}">
												        		 <option value="${item.statusViewId}" <c:if test="${item.statusViewId==statusId}"> selected="selected" </c:if> >${item.sourceSystemName}</option>
												          	</c:forEach> 
									           	</select></span>
								           
							</div>	
							</form>	
			</div><br/>
<!--  onchange="viewStatusUrl()" -->
			<div class="table-responsive" id="display_table_lead" style="border:none;">
				  <div id="toreload">
			    		<table id="grid-table"></table>
						<div id="grid-pager"></div>
		     		</div> 
    		 </div>
    
     
    			<div class="col-sm-7" >
 						<div class="pull-left">
		     				 <div class="hr-12"></div>
			     				 <div class="topmenuleft margin_5px" >
			          			 	<span>Export options:</span>
			          			 	<a href="<%=request.getContextPath()%>/loggedinuser/getCSV.htm" title="Export in CSV" alt="Export in CSV"><i class="fa fa-file-pdf-o bigger-140"></i></a>
									<a href="<%=request.getContextPath()%>/loggedinuser/getExecl.htm"title="Export in Excel" alt="Export in Excel" ><i class="fa fa-file-excel-o bigger-140"></i></a>
			          			 	
			                    </div>
						</div>
				</div>



     </div>
     
</div>    
 
    
            	
</section>           	
<!-- Center part End -->          

<footer>
  <jsp:include page="../common/footer.jsp" />
 </footer>

<!--    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>-->
    <!-- <script type="text/javascript" src="https://www.google.com/jsapi"></script> -->
     <script  type="text/javascript" src="<%=request.getContextPath()%>/js/googleChartApi.js"></script>
   
   
      <script type="text/javascript">
    
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart);

    function chart(){
    	//alert("In Chart Ajex");
    	$.ajax({
			type : "GET",
			 url: $('#contextPath').val()+"/loggedinuser/getChartData.htm",
				contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(data) {
				 showGoogleEarningLineChart('PCGraph', data);
			},
		/* 	error : function(msg) {
				$('.azaxslides').removeClass('loading');
				//showMessage('An error occured while loading',true);
			} */
		});
    }
    
 
    
      function showGoogleEarningLineChart(elementId, dataList){
      	
      	var data = google.visualization.arrayToDataTable(dataList);
      	
      	var options = {
      	          //title: 'Earning/Expenses',
      	         // chartArea:{left:-247,top:8,width:'100%',height:'100%'}
      			 // chartArea.left:-247,
      			   
      			    //height:'100%',
      	           // width:'200%',
      	             series: {
      	            	 		0:{color:'#982455'},
      							1:{color:'#0012ff'}
      					},
      	     // chartArea:{left:'-174'},
      	            backgroundColor: { fill:'transparent' },
      	   			hAxis: {title: 'Time',  titleTextStyle: {color: '#333'}},
           			vAxis: {title: 'Count',minValue: 0, maxValue: 20},
           			animation: {duration: 1000, easing: 'out'}
      				};

      	var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
      	chart.draw(data, options);
      }

       
    
      function drawChart() {
    	  //f();
    	  var i = $('#status').val();
    	  
    	//  alert("hh"+$('#status').val() + i);
    	ViewStatus(i)
//     	if(i == "53001"){ ViewStatus(53001);}
//     	else if(i == "53002"){ ViewStatus(53002);}
//     	else if(i == "53003"){  ViewStatus(53003);}
//     	else {ViewStatus(0);}
    	  chart();
    	  
    	 // var data = google.visualization.arrayToDataTable(dataList);
      /*   var data = google.visualization.arrayToDataTable([
          ['Time', 'Partner', 'Client'],
          ['2004',  1000,      0],
          ['2005',  1170,      5],
          ['2006',  660,       10],
          ['2007',  1030,      1500],
          ['2008',  1030,      20],
          ['2009',  1030,      25],
          ['2010',  1030,      30],
          ['2011',  1030,      35]
        ]); */

    /*     var options = {
        		
        		
//           title: 'Company Performance'
        };
        
        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        //var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

        chart.draw(data, options);   */
      }
      
      $(window).resize(function(){
    	  drawChart();
    	});
    </script>
    
    
<script>


 function viewStatusUrl(){
	 var viewstatus=$('#statusId').val(); 
	 document.getElementById("viewStatus").value =viewstatus;
	 document.getElementById("abc").submit();
 }
	 

function addNote(){
	$("#addnote").show();	
	$("#deletenote, #editnote").hide();
	$("#tags").hide();
	$("#popUpAlertaddnote").css('height', '560px');
	$("#popUpAlertaddnote").css('width', '650px'); 
	$("#popUpAlertaddnote").css('z-index', '999px');
	
	var height = ($(window).height() / 2) - (parseInt($('#popUpAlertaddnote').css('height'))/2);
	$('#popUpAlertaddnote').css('top',height+15);
	var width = ($(window).width() / 2) - (parseInt($('#popUpAlertaddnote').css('width'))/2);
	$('#popUpAlertaddnote').css('margin-left', width/3);
	$('#popUpAlertaddnote').css('position','fixed');
	//$("#popUpAlertaddnote").css ('left','425px');
	//$("#popUpAlertaddnote").css ('top','100px');
	//addTestimonialStatus('add',0);
}

function deleteNote(){
	$("#deletenote").show();	
	$("#addnote, #editnote").hide();	
// 	$("#popUpAlertaddnote").css ('left','425px');
// 	$("#popUpAlertaddnote").css ('top','200px');
	$("#popUpAlertaddnote").css('height', '370px');
	var height = ($(window).height() / 2) - (parseInt($('#popUpAlertaddnote').css('height'))/2);
	$('#popUpAlertaddnote').css('top',height);
	var width = ($(window).width() / 2) - (parseInt($('#popUpAlertaddnote').css('width'))/2);
	$('#popUpAlertaddnote').css('margin-left', width/3);
	$('#popUpAlertaddnote').css('position','fixed');
			
}

function editNote(){
	$("#editnote").show();	
	$("#addnote, #deletenote").hide();
// 	$("#popUpAlertaddnote").css ('left','425px');
// 	$("#popUpAlertaddnote").css ('top','100px');
	$("#popUpAlertaddnote").css('height', '560px')
	$("#popUpAlertaddnote").css('width', '650px')
	var height = ($(window).height() / 2) - (parseInt($('#popUpAlertaddnote').css('height'))/2);
	$('#popUpAlertaddnote').css('top',height+15);
	var width = ($(window).width() / 2) - (parseInt($('#popUpAlertaddnote').css('width'))/2);
	$('#popUpAlertaddnote').css('margin-left', width/3);
	$('#popUpAlertaddnote').css('position','fixed');

}



$(document).ready(function(){
    //addNewDownload('add',0);
 //  ViewStatus(0);
	});




function ViewStatus(ids)
{
	 //alert(action);
	   	$.ajax(
	   			{ 				
	   		  type: "POST",
	   		url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=53',
	   		 dataType: 'json',
			  contentType: 'application/json',
				   		  success:function(result)
	   		  { 
						        	
						        	var id = '#statusId';
						        $('#statusId').empty();
						       	 //$('#statusId').append('<option value="0">--Select--</option>');
						        	//$('#downloadSectionId').empty();
						       
				   			 
				   			// alert(id);
				   		//	 alert(ids);
						      $(result).each(function(i, obj) {
						          var module=obj.codeValue;
							        var modulename=obj.codeValueId;

							        
							       
							        if(modulename==53004)
							        	{
							        	
							        	}
							        else
							        	{
							        	
							        	
							        if(ids == modulename)
								    {
							      		$(id).append('<option value="'+ modulename+'" selected="selected">'+ module + '</option>');
							      	} else{
							      		$(id).append('<option value="'+ modulename+'">'+ module + '</option>');	
							      	}
							        	}
								 //  $('#common_popup_div,#shadow_div_web_app').remove();
								   });
						      
							//	$('#').empty();
							//	 $('#').empty();						
									
					
						
	   		  }
	   	
	   	});
	  
	   
}

</script>


	<script type="text/javascript">
			var grid_data = ${loggedUserList};
			//alert(grid_data);
			
			var subgrid_data = 
			[
			 {id:"1", name:"sub grid item 1", qty: 11},
			 {id:"2", name:"sub grid item 2", qty: 3},
			 {id:"3", name:"sub grid item 3", qty: 12},
			 {id:"4", name:"sub grid item 4", qty: 5},
			 {id:"5", name:"sub grid item 5", qty: 2},
			 {id:"6", name:"sub grid item 6", qty: 9},
			 {id:"7", name:"sub grid item 7", qty: 3},
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
				
			
				
				
			
			/* 
			 var viewStatus=$('#statusId').val(); 

	// var value = $(this).val();
     alert(viewStatus);

 	$.ajax(
   			{ 				
   		  type: "POST",
   		url:$('#contextPath').val()+'/loggedinuser/loadLoggedInUserList.htm?viewStatus='+viewStatus,
   		 dataType: 'json',
		  contentType: 'application/json',
			   		  success:function(result)
   		  { 
			   			 alert("suc"+result);		  
			   			  
   		  }
   		 });*/
   		//alert("hi${"+statusViewId+"}");
				jQuery(grid_selector).jqGrid({
					//direction: "rtl",
			
					//subgrid options url:$('#contextPath').val()+'/loggedinuser/loadLoggedInUserList.htm?viewStatus='+$('#statusId').val(),
					//url:$('#contextPath').val()+'/loggedinuser/loadLoggedInUserList.htm?viewStatus=${statusViewId}',
					subGrid : false,
					//subGridModel: [{ name : ['No','Item Name','Qty'], width : [55,200,80] }],
					//datatype: "xml",
					subGridOptions : {
						plusicon : "ace-icon fa fa-plus center bigger-110 blue",
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
					

			

					data: grid_data,
					datatype: "local",
					height: 250,
					colNames:['User Type','User ID','User Name', 'Biz Unit','Email ID', 'Contact No','Assigned Role','Last Login On','Session ID'],
					colModel:[
						
						{name:'partyType',index:'partyType'},
						{name:'userId',index:'userId' },
						{name:'userName',index:'userName'},
						{name:'bizUnit',index:'bizUnit'},
						{name:'emailId',index:'emailId'},
						{name:'contactNo',index:'contactNo'},
						{name:'assignedRole',index:'assignedRole'},
						{name:'lastLoginOn',index:'lastLoginOn'},
						{name:'sessionId',index:'sessionId'}
					], 

			
					viewrecords : true,
					rowNum:10,
					rowList:[10,20,30,100,1000],
					pager : pager_selector,
					altRows: true,
				//	height: "auto",
					//toppager: true,
					
					multiselect: false,
					//multikey: "ctrlKey",
			        multiboxonly: false,
			
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
					/* caption: "jqGrid with inline editing" */
			         autowidth: true,
			
			
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
			
			
			
		</script>
		
</body>
</html>