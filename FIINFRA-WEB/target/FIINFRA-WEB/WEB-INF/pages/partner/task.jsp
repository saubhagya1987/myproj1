<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Task</title>
<style>
#ui-id-1 { width: 168px!important; padding-left: 20px!important; }
#ui-id-2 { width: 168px!important; padding-left: 24px!important; }
.ui-menu-item { list-style: none !important; }
.ui-corner-all { margin-left: -10px!important; }
.ui-helper-hidden-accessible { color: #000; }
</style>
<script>
	$(function() {
		
		$("#search").keyup(function(event) {
			if (event.keyCode == 13) {
				//$("#searchbtn").click();
				tasksearch();
			}
		});
		
		showSelectedTab('taskLink');
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
<script type="text/javascript">
function deletetasks() {
	list = new Array();
	$('#grid-table :checked').each(function(i, obj) {
		list[i] = $(this).attr('id');
	});
	if (list.length == 0) {
		showAlertMessage1("Message",
				"Please select at least one Task to delete.",
				"information", doNothing);
	} else{
		var message = "";
		if (list.length == 1) {
			message = "Do you want to delete this task?";
		} else {
			message = "Do you want to delete these tasks?";
		}
		showAlertMessage1("Message", "<br/>" + message, "question",
				doNothing1);
		$('.ZebraDialog_Button1').attr('href','javascript:deleteTasksTrue()');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
	}
}

function deleteTasksTrue() {
	var message = "";
	if (list.length == 1) {
		message = "Task successfully deleted.";
	} else {
		message = "Tasks successfully deleted.";
	}
	setTimeout(function() {
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/task/deleteTask.htm?TaskIds=" + list,
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



function tasksearch()
{
   var value = $('#search').val();

	window.location.href = $('#contextPath').val()+"/task/getTaskList.htm?value="+value;
}
function getXLS()
{
	    var value = GetURLParameter('value');
	    if (value==undefined){
	    	value='';
	    }
		window.location.href = $('#contextPath').val()+"/task/getTaskListXLS.htm?value="+value+'&pageSize='+$('#page').val();
}
function getCSV()
{
	    var value = GetURLParameter('value');
	    if (value==undefined){
	    	value='';
	    }
		window.location.href = $('#contextPath').val()+"/task/getTaskListCSV.htm?value="+value+'&pageSize='+$('#page').val();
}
function pagesizeurl(){	
	var pageSize=$('#page').val();	
	setResult('');	
}
function setResult(filterRuleCriteria){	
	  openPopupWebApp('centerLoadingImage', 25, 35);
	  var pageval =  $('#page').val();
	  $("#toreload").load('${pageContext.request.contextPath}/task/getTaskList.htm #toreload', {
	   object: '${object}',
	   pageSize: $('#page').val(),//'${pageSize}', 
	   filterRule: filterRuleCriteria
	     }, function( response, status, xhr ) {
	      try{	    	
	        closePopupWebApp('');
	      }catch(e){
	         closePopupWebApp('');       
	      }
	     });
	 }


</script>
</head>
<body>
<jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/common_popup.jsp" />
        <!-- Center part start -->
        <section>
        <div class="page-header clearfix">
          <h1 class="pull-left">Tasks</h1>
          <div class="nav-search pull-right hide" id="">
            <form class="form-search">
              <span class="input-icon">
              <input type="text"
										placeholder="Search ..." class="nav-search-input"
										id="search" autocomplete="off">
              <i
										class="ace-icon fa fa-search nav-search-icon"></i></span>
            </form>
          </div>
        </div>
        <div class="container-body">
          <button data-params="{}"
								class="margin_5px dbtn deleteBtn btn btn-primary btn-xs pull-right"
								id="id-btn-dialog2" title="Delete Task" onclick="deletetasks()"> <i class="fa fa-trash"></i> Delete Task </button>
          <a class="pull-right margin_5px"
								href="<%=request.getContextPath()%>/addtask.htm" id="">
          <button class=" dbtn createNewBtn btn btn-primary btn-xs pull-right" id="" title="Add Task"> <i class="fa fa-plus"></i> Add Task </button>
          </a>
          <div class="clearfix"></div>
          <div class="table-responsive" id="display_table_lead"
								style="border: none;">
            <div id="toreload" class="col-md-12 tabular_break_word">
              <table id="grid-table">
              </table>
              <div id="grid-pager"></div>
              <div class="topmenuleft margin_5px"> <span>Export options:</span><a class="margin_5px"
											onclick="getCSV()" title="Export in CSV" alt="Export in CSV"><i
											class="fa icon-csv bigger-170"></i></a><a class="margin_5px"
											onclick="getXLS()" title="Export in Excel"
											alt="Export in Excel"><i
											class="fa fa-file-excel-o bigger-170"></i></a> </div>
            </div>
          </div>
        </div>
        <!-- end of container-body div --> 
     
  </section>
  <!-- Center part End -->
  
  <jsp:include page="../common/footer.jsp" />

<!-- inline scripts related to this page -->
<script type="text/javascript">
			var grid_data = 
			[ 
				{id:"1",name:"Desktop Computer",note:"note",stock:"Yes",ship:"FedEx", sdate:"2007-12-03"},
				{id:"2",name:"Laptop",note:"Long text ",stock:"Yes",ship:"InTime",sdate:"2007-12-03"},
				{id:"3",name:"LCD Monitor",note:"note3",stock:"Yes",ship:"TNT",sdate:"2007-12-03"},
				{id:"4",name:"Speakers",note:"note",stock:"No",ship:"ARAMEX",sdate:"2007-12-03"},
				{id:"5",name:"Laser Printer",note:"note2",stock:"Yes",ship:"FedEx",sdate:"2007-12-03"},
				{id:"6",name:"Play Station",note:"note3",stock:"No", ship:"FedEx",sdate:"2007-12-03"},
				{id:"7",name:"Mobile Telephone",note:"note",stock:"Yes",ship:"ARAMEX",sdate:"2007-12-03"},
				{id:"8",name:"Server",note:"note2",stock:"Yes",ship:"TNT",sdate:"2007-12-03"},
				{id:"9",name:"Matrix Printer",note:"note3",stock:"No", ship:"FedEx",sdate:"2007-12-03"},
				{id:"10",name:"Desktop Computer",note:"note",stock:"Yes",ship:"FedEx", sdate:"2007-12-03"},
				{id:"11",name:"Laptop",note:"Long text ",stock:"Yes",ship:"InTime",sdate:"2007-12-03"},
				{id:"12",name:"LCD Monitor",note:"note3",stock:"Yes",ship:"TNT",sdate:"2007-12-03"},
				{id:"13",name:"Speakers",note:"note",stock:"No",ship:"ARAMEX",sdate:"2007-12-03"},
				{id:"14",name:"Laser Printer",note:"note2",stock:"Yes",ship:"FedEx",sdate:"2007-12-03"},
				{id:"15",name:"Play Station",note:"note3",stock:"No", ship:"FedEx",sdate:"2007-12-03"},
				{id:"16",name:"Mobile Telephone",note:"note",stock:"Yes",ship:"ARAMEX",sdate:"2007-12-03"},
				{id:"17",name:"Server",note:"note2",stock:"Yes",ship:"TNT",sdate:"2007-12-03"},
				{id:"18",name:"Matrix Printer",note:"note3",stock:"No", ship:"FedEx",sdate:"2007-12-03"},
				{id:"19",name:"Matrix Printer",note:"note3",stock:"No", ship:"FedEx",sdate:"2007-12-03"},
				{id:"20",name:"Desktop Computer",note:"note",stock:"Yes",ship:"FedEx", sdate:"2007-12-03"},
				{id:"21",name:"Laptop",note:"Long text ",stock:"Yes",ship:"InTime",sdate:"2007-12-03"},
				{id:"22",name:"LCD Monitor",note:"note3",stock:"Yes",ship:"TNT",sdate:"2007-12-03"},
				{id:"23",name:"Speakers",note:"note",stock:"No",ship:"ARAMEX",sdate:"2007-12-03"}
			];
			grid_data = '${taskDatas}';
			grid_data = JSON.parse(grid_data);
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
					$(grid_selector).jqGrid( 'setGridWidth', $("#toreload").width() );
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
					colNames:[' ',' ','TaskOwner' ,'Subject Category','Task For', 'Task Created By', 'Subject','Start Date','End Date','Priority','Status' ],
					colModel:[
						/* {name:'myac',index:'', width:80, fixed:true, sortable:false, resize:false,
							formatter:'actions', 
							formatoptions:{ 
								keys:true,
								//delbutton: false,//disable delete button
								
								delOptions:{recreateForm: true, beforeShowForm:beforeDeleteCallback},
								//editformbutton:true, editOptions:{recreateForm: true, beforeShowForm:beforeEditCallback}
							}
						}, */
						{name:'checkbox', index:'checkbox',width:50,align:'center',sortable:false,formatter:function(cellvalue, options,rowObject) {
						    return '<input role="checkbox" type="checkbox"  class="cbox" id="'+rowObject.id+'" name="taskCb">';
						}},
						{name:'id',index:'editLink',width:50,align:'center',formatter:imageFormat,formatoptions:{baseLinkUrl:'${pageContext.request.contextPath}/addtask.htm?taskId='}},
						{name:'ownerPartyName',index:'ownerPartyName'},
						{name:'categoryName',index:'categoryName',width:80,},
						{name:'targetPartyName',index:'targetPartyName',formatter:doformatTaskFor},
						{name:'taskCreatedBy',index:'taskCreatedBy'},
						{name:'subject',index:'subject'},
						{name:'dueDateTimeString',index:'dueDateTimeString'},
						{name:'endDateTimeString',index:'endDateTimeString'},
						{name:'priorityName',index:'priorityName',width:80,formatter:doformatPriority},
						{name:'statusName',index:'statusName',width:80,formatter:doformatstatus}
					], 
			
					viewrecords : true,
					rowNum:10,
					rowList:[10,20,30,50,100],
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
							if($('#selectAll').attr('id')==undefined)
							$('#jqgh_grid-table_checkbox').before('<br/><input  type="checkbox" id="selectAll">');
							updateActionIcons(table);
							updatePagerIcons(table);
							enableTooltips(table);
							$('#selectAll').click(function(event) {  //on click 
						        if(this.checked) { // check select status
						            $('.cbox').each(function(i,obj) { //loop through each checkbox
						                this.checked = true;  //select all checkboxes with class   "checkbox1"    
									$(obj).attr('checked','checked');
						            });
						        }else{
						            $('.cbox').each(function(i,obj) { //loop through each checkbox
						                this.checked = false; //deselect all checkboxes with class "checkbox1"
						            	$(obj).removeAttr('checked');
						            });         
						        }
						        $('#selectAll').checked = true;
						    });
							
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
				
				function doformatTaskFor( cellvalue, options, cell ){
					if(cell.targetContactType == 'Opportunity' && cellvalue!="undefined" && cellvalue!=undefined && cell.targetContactType!="undefined" && cell.targetContactType!=undefined){
						return  '<i class="fa icon-opportunity size-16"></i>'+' '+cellvalue;
					} else if(cell.targetContactType == 'Client'  && cellvalue!="undefined" && cellvalue!=undefined  && cell.targetContactType!="undefined" && cell.targetContactType!=undefined){
						return  '<i class="fa fa-user size-16"></i>'+' '+cellvalue;
					} else if(cell.targetContactType == 'Premium Client'  && cellvalue!="undefined" && cellvalue!=undefined  && cell.targetContactType!="undefined" && cell.targetContactType!=undefined){
						return  '<i class="fa icon-premium_client size-16"></i>'+' '+cellvalue;	
					}else if((cell.targetContactType=='')  || (cell.targetContactType!=undefined) || (cell.targetContactType!="undefined")){
                             if(cellvalue!='' && cellvalue!="undefined" && cellvalue!=undefined){
                            	 return  cellvalue;
							}else{
								return '';
							}  
					}
				}
				
				function doformatPriority( cellvalue, options, cell ) {
					if(cellvalue == 'Low'){
						return  '<span class="label label-success">'+cellvalue+'</span>';
					} else if(cellvalue == 'Medium'){
						return  '<span class="label">'+cellvalue+'</span>';
					} else if(cellvalue == 'High'){
						return  '<span class="label label-lg label-purple">'+cellvalue+'</span>';	
					}else if(cellvalue == 'Urgent'){
						return  '<span class=" label label-warning">'+cellvalue+'</span>';
					} 
				}
			
				function doformatstatus( cellvalue, options, cell ) {
					if(cellvalue == 'Scheduled'){
						return  '<span class="label">'+cellvalue+'</span>';
					} else if(cellvalue == 'In Progress'){
						return  '<span class="label label-warning">'+cellvalue+'</span>';
					} else if(cellvalue == 'On Hold'){
						return  '<span class="label label-lg label-purple">'+cellvalue+'</span>';	
					}else if(cellvalue == 'Completed'){
						return  '<span class="label label-success">'+cellvalue+'</span>';
					} else if(cellvalue == 'Cancelled'){
						return  '<span class="label label-danger">'+cellvalue+'</span>';
					}
					else if(cellvalue == 'Open'){
						return  '<span class="label label-info ">'+cellvalue+'</span>';
					}
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
		</script>
</body>
</html>