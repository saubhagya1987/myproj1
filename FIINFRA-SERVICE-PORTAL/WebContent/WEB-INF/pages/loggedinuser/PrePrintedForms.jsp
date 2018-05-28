<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Preprinted Form</title>


 <script  type="text/javascript" src="<%=request.getContextPath()%>/js/googleChartApi.js"></script> 

<style>
#ui-id-1 {
	width: 168px !important;
	/* padding-left: 20px !important; */
}

#ui-id-2 {
	width: 168px !important;
	/* padding-left: 24px !important; */
}

.ui-menu-item {
	list-style: none !important;
}

.ui-corner-all {
	margin-left: 10px !important;
}

.ui-helper-hidden-accessible {
	color: #000;
}
div.ui-datepicker{
font-size:10px;
left: 609px !important;
/*width: auto !important;*/
}
.ui-datepicker .ui-datepicker-prev span, .ui-datepicker .ui-datepicker-next span{
	left:80% !important
}
.ui-datepicker .ui-datepicker-header{
	float:right;
	width:167px !important;
}

#poptable_contactform1{
float: left;
width: 100%;
background-color: #f5f5f5;
margin: 0 10px 10px 0px;
height:320px;
}
/* .pcf{
padding: 10px !important;
height: 325px !important;
}
.newpcf{
padding: 10px !important;
height: 425px !important;
} */
</style>

	
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<!--css popup window start 2-->
	<div style="display: none;" id="blanket"></div>
	<div style="display: none; width: 650px; height: 450px; top: 100px" id="popUpAlertaddnote" class="alert">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpAlertaddnote')" href="#"><img alt=""
				src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
		</div>
		

	

	</div>
	<div class="clearfix"></div><br/><br/>
	<!--css popup window 2 close-->


	
	<!-- Center part start -->
	<section>
		<div>
		<div class="container-head" id="abcdefg">
				<div class="col-md-12" style="text-align: right;">
					
					
					<div class="page-header clearfix">
			            <h1 class="pull-left" ><B>PrePrinted Form</B></h1>
			        
			          </div>
				</div>
			</div>
			<div class="container-body" style="margin-top: 0px;">
				<!-- center -->
     	<div class="ui-id-1" >
        <div class="boxshadow" style="margin:20px 0;">  
        <center>
        	  <div id="chart_div" class="chart" style="height:300px; width:100%"  >  </div>

        </center>
        
        </div> 
        </div>  

				
				<div class="topmenu">

				</div>

				<div class="table-responsive" id="display_table_lead"
					style="border: none;">
					<div id="toreload">
					
					<table id="grid-table"></table>
						<div id="grid-pager"></div>
					
					</div>
				</div>

				<div class="col-sm-7">

					
						 <div class="pull-left">
		     				 <div class="hr-12"></div>
		     				 <div class="topmenuleft margin_5px" >
		          			 	<span>Export options:</span>
		          			 	<a href="<%=request.getContextPath()%>/preprintedform/prePrintedExecl?type=excel" title="Export in CSV" alt="Export in CSV"><i 	class="fa fa-file-pdf-o bigger-140"></i></a>
								<a href="<%=request.getContextPath()%>/preprintedform/prePrintedExecl?type=CSV" title="Export in Excel" alt="Export in Excel"> <i class="fa fa-file-excel-o bigger-140"></i></a>
		          			 	
		                    </div>
							</div>



				</div>
			
			</div>

		</div>
	</section>
	<!-- Center part End -->


	<script type="text/javascript">
			var grid_data = ${prePrintedList};
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
				
			
				
				
			
			
			
				jQuery(grid_selector).jqGrid({
					//direction: "rtl",
			
					//subgrid options
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
					colNames:['BizUnit','Partner Name','Product','Form Name', 'Form Path','Generated On'],
					colModel:[
						
						{name:'lastName',index:'lastName'},
						{name:'partnerName',index:'partnerName'},
						{name:'product',product:'name'},
						{name:'formName',formName:'to'},
						{name:'formPath',index:'formPath'},
						{name:'generatedOn',index:'generatedOn'},
						
					], 

			
					viewrecords : true,
					rowNum:10,
					rowList:[10,20,30],
					pager : pager_selector,
					altRows: true,
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
			
					//,autowidth: true,
			
			
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
						multipleSearch: false,
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
		
		
		
		
<script type="text/javascript">
	
	

google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawChart);
	
	function pagesizeurl(){
		  var pageSize=$('#page').val(); 
		   window.location.href= $('#contextPath').val()+'/preprintedform/loadPrePrintedForm.htm?pageSize='+pageSize;
		 }
	
	$(document).ready(function(){
	
		$.ajax(
	   			{ 				
	   		  type: "POST",
	   		url:$('#contextPath').val()+'/preprintedform/getChartData.htm',
	   		 dataType: 'json',
			  contentType: 'application/json',
				   		  success:function(result)
	   		  	{ 
				   			//  alert("result"+result);
				   			showGoogleEarningLineChart('PCGraph', result);
	   		  	}
	   	
	   	});
		
		});
	
	

    function showGoogleEarningLineChart(elementId, dataList)
    {
    	
    	var data = google.visualization.arrayToDataTable(dataList);
    	
    	
    	
    	var options = {
    	         
    	             series: {
    	            	 		0:{color:'#982455'},
    							1:{color:'#0012ff'},
    	            	 		2:{color:'#00BFFF'},
    							3:{color:'#008744'},
    							
    					},
    	     
    	            backgroundColor: { fill:'transparent' },
    	   			hAxis: {title: 'Month',  titleTextStyle: {color: '#333'}},
         			vAxis: {title: 'Count',minValue: 0, maxValue: 20},
         			animation: {duration: 1000, easing: 'out'}
    				};

    	var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
    	chart.draw(data, options);
    }

     
  
    function drawChart() {
  	  //f();
  	  var i;
  	  
  	  
  	
  	 // chart();

    }
    
    $(window).resize(function(){
  	  drawChart();
  	});

	</script>
	
	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
	<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css"> -->


</body>
</html>