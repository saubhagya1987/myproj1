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
<title>Query</title>

   <style type="text/css">
.page-title{margin: 13px 0 0px 8px !important; font-weight: bolder; }  

.h1{font-family: Arial !important;}
</style>
	
	
	<script type="text/javascript">
	
	
	
	function newQuery()
	{
		window.location.href = $('#contextPath').val()+"/addquery.htm";
		}

	
function deletequery() {
	  var slvals = []
	  $('input:checkbox[name=chkdeleteselect]:checked').each(function() {
	  slvals.push($(this).val());
	  })
	
	  
	 document.getElementById("confirmdelete").value = slvals;
	 
	  if(slvals<=0)
		  {
		  //alert('Please Select at Least One Record.');
		  
		  	  bootbox.dialog({
			  	message: "<span class='bigger-110'>Please select at least one Record.</span>",
				buttons: 			
				{
					"click" :
					{
						"label" : "OK!",
						"className" : "btn-sm btn-primary",
						"callback": function() {
			//				location.reload();
						}
					}
				}
			});
		  
		  
		 // location.reload();
		 // popup('popUpAlertaddnote');
		  }
	  else
		  {
		 // alert("yes");
		  deleteNote();  
		  }
	}
	
	</script>
<!-- <script type="text/javascript">
function editTask(Id)
{
																					 
		window.location.href = $('#contextPath').val()+"/partnersp/getTaskDetail.htm?taskId="+Id;
}
function newTask()
{

	window.location.href = $('#contextPath').val()+"/addtask.htm";
	}

	

function deletetasks() {
	  var slvals = []
	  $('input:checkbox[name=chkdeleteselect]:checked').each(function() {
	  slvals.push($(this).val());
	  })
	
	  
	 document.getElementById("confirmdelete").value = slvals;
	 
	  if(slvals<=0)
		  {
		  //alert('Please Select at Least One Record.');
		  
		  	  bootbox.dialog({
			  	message: "<span class='bigger-110'>Please select at least one Record.</span>",
				buttons: 			
				{
					"click" :
					{
						"label" : "OK!",
						"className" : "btn-sm btn-primary",
						"callback": function() {
			//				location.reload();
						}
					}
				}
			});
		  
		  
		 // location.reload();
		 // popup('popUpAlertaddnote');
		  }
	  else
		  {
		 // alert("yes");
		  deleteNote();  
		  }
	}

function deleteNote()
{
	
	$('#deletenote').modal('show');
	}

function reload()
{
	location.reload();
}
function none()
{
}


function downloadAttachmentDownload(filepath,fileName) { 
	   if(filepath=="")
		   {
		
		showAlertMessage1("Message",
				"There is no such file/attachment found.",
				"information", none);
		
		   }
	   else
		   {
		   
		   
			var   str = fileName.replace(/ +/g, "");
			var   str1 = filepath.replace(/ +/g, "");   
			   window.location.href= $('#contextPath').val()+'/partnersp/downloadAttachmentDownload1.htm?filepath='+str1+"&fileName="+str;	   
		   }
	 
	
}   




function tasksearch()
{
   var value = $('#search').val();
	window.location.href = $('#contextPath').val()+"/partnersp/getTaskList.htm?value="+value;
}
function getXLS()
{

	    var value="";
		window.location.href = $('#contextPath').val()+"/partnersp/getTaskListXLS.htm?value="+value+'&pageSize='+$('#page').val();
}
function getCSV()
{
	    var value="";
	    
		window.location.href = $('#contextPath').val()+"/partnersp/getTaskListCSV.htm?value="+value+'&pageSize='+$('#page').val();
}
function pagesizeurl(){	
	var pageSize=$('#page').val();	
	setResult('');	
}
function setResult(filterRuleCriteria){	
	  openPopupWebApp('centerLoadingImage', 25, 35);
	  var pageval =  $('#page').val();
	  $("#toreload").load('${pageContext.request.contextPath}/partnersp/getTaskList.htm #toreload', {
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
function confirmDelete()
{
	 var slvals= document.getElementById("confirmdelete").value;
	 
	   	  $.ajax({
		type : 'POST',
		url : $('#contextPath').val()+"/partnersp/deleteTask.htm?TaskIds="+slvals,
	
  success : function(result) 
  {	  
	 $('#deletenote').hide();  
	  
  	  bootbox.dialog({
		  	message: "<span class='bigger-110'>Record Deleted Successfully.</span>",
			buttons: 			
			{
				"click" :
				{
					"label" : "OK!",
					"className" : "btn-sm btn-primary",
					"callback": function() {
						location.reload();
					}
				}
			}
		});
  }
     
  }); 
}

</script>
 -->
</head>
<body>
<input type="hidden" id="confirmdelete" name="confirmdelete">
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/common_popup.jsp" />

 <!-- Center part start -->
 
	<div class="modal fade" id="deletenote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
   			 <div class="modal-content">
      		<div class="modal-header">
       			 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Delete Record</h4> 
		</div>
		<div class="modal-body">
			Do you want to delete this selected records? Please confirm.
					</div>
					<div class="modal-footer">
						
							<!-- <input class="dbtn" value="Yes" id="Yes" type="button"		onclick="confirmDelete();" /> 
								<input				class="dbtn" value="No" id="No" type="button"			onclick="popup('popUpAlertaddnote');"/>
								 -->
								
								
										
								<button id="" class="btn btn-sm btn-primary"  onclick="confirmDelete();" >Yes</button>
								<button id="" class="btn btn-sm btn-primary"   class="close" data-dismiss="modal" aria-label="Close"  >No</button>
								
						
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	
     
     <div class="page-title page-header clearfix">
		<h1 class="pull-left">Query</h1>
	
	</div>
    	

		<div class="pull-right">
<!-- <div class="space"></div> -->
     <button id="SPAddNewTaskLink"   class="btn btn-xs btn-primary" onClick="newQuery();"><!-- <i class='ace-icon fa fa-plus'></i> -->New Query</button>
     <button id="SPDeleteTaskLink"  class="btn btn-xs btn-primary" onClick="deletequery();"><!-- <i class='ace-icon fa fa-trash'></i> -->Delete</button> 
         </div>
    
    
    <div class="clearfix"></div>
    <div class="space-8"></div>

       <table id="grid-table"></table>
       <div id="grid-pager"></div>
  
    <div class="pull-left">
          <div class="space"></div>
          <div class="topmenuleft margin_5px" >
               <span>Export options:</span>
               <a href="#"  onclick="getCSV()" title="Export in CSV" alt="Export in CSV"><i class="ace-icon fa icon-csv bigger-170"></i></a>
               <a href="#" onclick="getXLS()" title="Export in Excel" alt="Export in Excel"><i class="ace-icon fa fa-file-excel-o bigger-170"></i></a>
               
                    </div>
    </div>
    
  <!--   <div class="pull-right">
    <div class="space"></div>
    
    				  <button id="SPAddNewTaskLink" class="btn btn-sm btn-primary" onClick="newTask();"><i class='ace-icon fa fa-plus'></i>New Task</button>
                    <button id="SPDeleteTaskLink" class="btn btn-sm btn-primary" onClick="deletetasks();"><i class='ace-icon fa fa-trash'></i>Delete</button> 
         
    </div> -->  
				
	
<!-- </div> -->
	
            	
     	
		<footer>
	  <jsp:include page="../common/footer.jsp" />

	</footer>


<script type="text/javascript">
			var grid_data = ${queryList};
			
			//alert(grid_data+"queryList");
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
					ignoreCase: true,

					colNames:[' ', ' ','Subject','Query Type','Query From','Query For','Last Modified Date','Last Modified by','Status'],
					colModel:[
 	 					
							
						
						
	   {name:'checkbox', index:'checkbox',index:'', width:50, sortable:false,formatter:function(cellvalue, options,rowObject) {
						       return '<input role="checkbox" type="checkbox"  class="cbox" value="'+rowObject.queryID+'" id="chkdeleteselect" name="chkdeleteselect">';
						   }}, 
						   
							 {name:'queryID',index:'queryID', width:50, fixed:true, sortable:false, resize:false,


						 		 formatter: function(cellvalue, options,rowObject) {
						 																										//	+rowObject.partyId+'
						 		               <%-- // return '<a href="<%=request.getContextPath()%>/partnersp/getTaskDetail.htm?taskId=" ${rowObject.id} onclick="#" id="SPEditTaskLink"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>'; --%>
						 		               return '<a href="#" onclick="editQuery('+rowObject.id+');" id="SPEditQueryLink"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';
								} 
							}, 
						   
						{name:'subject',index:'subject'} ,
					 	{name:'queryTypeName',index:'queryTypeName'},
							{name:'queryfrom',index:'queryfrom'},
						{name:'queryFor',index:'queryFor'},
						{name:'lastModifiedDate',index:'lastModifiedDate'},
						{name:'lastModified',index:'lastModified'},  
						{name:'statusName',index:'statusName'}
						
						
			
						
						
						
					], 
			
					viewrecords : true,
					rowNum:10,
					rowList:[10,20,30,50,100],
					pager : pager_selector,
					altRows: true,
					//toppager: true,
					
					multiselect: false,
					//multikey: "ctrlKey",
			        multiboxonly: true,
			
					/* loadComplete : function() {
						var table = this;
						setTimeout(function(){
							styleCheckbox(table);
							
							updateActionIcons(table);
							updatePagerIcons(table);
							enableTooltips(table);
						}, 0);
					},
			 */
			 loadComplete : function() {
					var table = this;
					setTimeout(function(){
						styleCheckbox(table);
						if($('#selectAll').attr('id')==undefined)
						$('#jqgh_grid-table_checkbox').before('<br/><input  type="checkbox" id="selectAll" style="margin-right: 25px;">');
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
					//caption: "Biz Unit List"
			
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
				
				
				
	/* 			function doformatPriority( cellvalue, options, cell ) {
					if(cellvalue == 'Low'){
						return  '<span class="label label-success">'+cellvalue+'</span>';
					} else if(cellvalue == 'Normal'){
						return  '<span class="label">'+cellvalue+'</span>';
					} else if(cellvalue == 'High'){
						return  '<span class="label label-lg label-purple">'+cellvalue+'</span>';	
					}else if(cellvalue == 'Urgent'){
						return  '<span class=" label label-warning">'+cellvalue+'</span>';
					} 
				} */
			
/*  				function doformatstatus( cellvalue, options, cell ) {
					if(cellvalue == 'New'){
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
 */
			
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
			 $('#menu-wplook-sub-menu4').addClass('active');	
			 $('#SPTasksLink').addClass('active');
			</script>
		
</body>
</html>