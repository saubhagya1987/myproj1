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
	<title>Ping</title>
	
<script type="text/javascript">
	function getXLS()
{
		window.location.href = $('#contextPath').val()+"/ping/getPingsExport.htm?type=XLS";
}
function getCSV()
{
		window.location.href = $('#contextPath').val()+"/ping/getPingsExport.htm?type=CSV";
}
</script>
	
</head>
<body>

<input type="hidden" id="confirmdelete" name="confirmdelete">
<!--css popup window start 1-->
<jsp:include page="../common/header.jsp" />

<div class="modal fade" id="deletenote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
   			 <div class="modal-content">
      		<div class="modal-header">
       			 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Message</h4> 
		<!-- <div id="deletenote"> -->
			Do you want to delete this pings items ? Please confirm.
					<div style="float: right;">
						<form>
							<input class="btn btn-danger" value="Yes" id="Yes" type="button"
								onclick="confirmDelete()" /> 
								<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
						</form>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
<div class="page-header">
		<h1 class="pull-left">Ping</h1>
           <form class="form-search pull-right">
				<%-- <span class="input-icon">
				<input type="text" placeholder="Search ..." class="nav-search-input" id="search"  autocomplete="off" value="${value}">
				<i class="ace-icon fa fa-search nav-search-icon"></i></span> --%>
					</form>
           <div class="clearfix"></div>
	</div>

	<div class="row">
  		<jsp:include page="../ping/pingsidebar.jsp" />
  		<div class="col-md-10">
  		<%-- <a href="<%=request.getContextPath()%>/ping/addPing.htm" class="btn btn-primary" ><i class='ace-icon fa fa-plus'></i>Add New Ping</a> --%>
  		<!-- <input data-params="{}" type="button" id="SPDeleteAutoPingLink" class="dbtn deleteBtn" value="  Delete"  title="Delete" onclick="deletePings()"> -->
  		
  		<div class="list-group">
        			<a class="list-group-item active" href="#">Ping Library Manager  </a>
           				<div class="list-group-item">
           				<div class="topmenu pull-right margin_5px">
       							<a href="<%=request.getContextPath()%>/ping/addPing.htm" id="SPAddNewPingLink"><button data-params="{}" onClick="" type="button" class="btn btn-sm btn-primary" title="Add New Ping" alt="Add New Ping"><i class="ace-icon fa fa-plus"></i> Add New Ping</button></a>
								<button id="SPDeletePingLink" class="btn btn-sm btn-danger" onclick="deletePings()"><i class='ace-icon fa fa-trash'></i>Delete</button>
							</div>
                    <div class="clearfix"></div>
  		
  		
  		<div class="table-responsive" id="display_table_lead">
  			<div id="toreload">
	  		<table id="grid-table"></table>
				<div id="grid-pager"></div>
			</div>
	   </div>
	     <div class="clearfix"></div>
				 <div class="pull-left">
                        <div class="topmenuleft margin_5px" >
							 <span>Export options:</span>
							 <a class="margin_5px" onclick="getCSV()" title="Export in CSV" alt="Export in CSV"><i class="fa fa-file-pdf-o bigger-140"></i></a>
							 <a class="margin_5px" onclick="getXLS()" title="Export in Excel" alt="Export in Excel"><i class="fa fa-file-excel-o bigger-140"></i></a>
                        </div>
                 </div>
              <div class="row">
                 <div class="topmenu pull-right margin_5px">
       							<a href="<%=request.getContextPath()%>/ping/addPing.htm" id="SPAddNewPingLink"><button data-params="{}" onClick="" type="button" class="btn btn-sm btn-primary" title="Add New Ping" alt="Add New Ping"><i class="ace-icon fa fa-plus"></i> Add New Ping</button></a>
								<button id="SPDeletePingLink" class="btn btn-sm btn-danger" onclick="deletePings()"><i class='ace-icon fa fa-trash'></i>Delete</button>
			     </div>
		     </div>
   	  </div> 	
   	</div>
   </div>
 </div>
<form id="pingForm">
	<input type="hidden" id="notifyTemplateIdToSend" name="notifyTemplateId"/>
	<input type="hidden" id="isActive" name="isActive"/>
</form>
           
<!-- Center part End -->          

<jsp:include page="../common/footer.jsp" />
<script type="text/javascript">
function openPopupPingAction(id){
	$('#'+id).show();
}

function suspendPing(notifyTemplateId){
	$('#notifyTemplateIdToSend').val(notifyTemplateId);
	$('#isActive').val(false);
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/ping/updatePingActiveFlag.htm',
		data:$('#pingForm').serialize(),
		success : function(result) {
			if(result>0){
				showAlertMessage("Success", "<br/>Ping suspended successfully.", "confirmation", reloadPage);
			}else{
				showAlertMessage("Error", "The connection to the server has been lost. Please try again later.", "error", doNothing);
			}
		}
	});
}

function reactivatePing(notifyTemplateId){
	$('#notifyTemplateIdToSend').val(notifyTemplateId);
	$('#isActive').val(true);
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/ping/updatePingActiveFlag.htm',
		data:$('#pingForm').serialize(),
		success : function(result) {
			if(result>0){
				showAlertMessage("Success", "<br/>Ping reactivated successfully.", "confirmation", reloadPage);
			}else{
				showAlertMessage("Error", "The connection to the server has been lost. Please try again later.", "error", doNothing);
			}
		}
	});
}
function pagesizeurl(){
	var pageSize=$('#page').val();	
// 	window.location.href= $('#contextPath').val()+'/opportunity/getOpportunitiesList.htm?pageSize='+pageSize;
	setResult('');	
}



function setResult(filterRuleCriteria){
	  openPopupWebApp('centerLoadingImage', 25, 35);
	  var pageval =  $('#page').val();
	  $("#toreload").load('${pageContext.request.contextPath}/ping/getPings.htm #toreload', {
	   object: '${object}',
	   pageSize: $('#page').val(),//'${pageSize}', 
	   filterRule: filterRuleCriteria
	     }, function( response, status, xhr ) {
	      try{
// 	        	oppReady()
	        //addPageSize(filterRuleCriteria,pageval);
	        //$('#hfilterRule').val(filterRuleCriteria);
	        closePopupWebApp('');
	      }catch(e){
	         closePopupWebApp('');       
	      }
	     });
	 }


function markAsFavouritePing(notifyTemplateId){
	$('#notifyTemplateIdToSend').val(notifyTemplateId);
	$('#isActive').val("1");
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/ping/markPingAsFavourite.htm',
		data:$('#pingForm').serialize(),
		success : function(result) {
			if(result>0){
				showAlertMessage("Success", "<br/>Ping marked as favourite.", "confirmation", reloadPage);
			}else{
				showAlertMessage("Error", "The connection to the server has been lost. Please try again later.", "error", doNothing);
			}
		}
	});
}

function removeAsFavouritePing(notifyTemplateId){
	$('#notifyTemplateIdToSend').val(notifyTemplateId);
	$('#isActive').val("0");
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/ping/markPingAsFavourite.htm',
		data:$('#pingForm').serialize(),
		success : function(result) {
			if(result>0){
				showAlertMessage("Success", "<br/>Ping Unmarked as favourite.", "confirmation", reloadPage);
			}else{
				showAlertMessage("Error", "The connection to the server has been lost. Please try again later.", "error", doNothing);
			}
		}
	});
}
function clonePing(notifyTemplateId,pingName){
	$('#notifyTemplateIdToSend').val(notifyTemplateId);
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/ping/clonePing.htm',
		data:$('#pingForm').serialize(),
		success : function(result) {
			if(result>0){
				showAlertMessage("Success", "Copy of ping "+pingName+" created and saved.", "confirmation", reloadPage);
			}else{
				showAlertMessage("Error", "The connection to the server has been lost. Please try again later.", "error", doNothing);
			}
		}
	});
}

/**
 * deletes multiple users after taking confirmation.
 */
function deletePings() {
	  var slvals = []
	  $('input:checkbox[name=chkdeleteselect]:checked').each(function() {
	  slvals.push($(this).val());
	  })
	
	  
	 document.getElementById("confirmdelete").value = slvals;
	  if(slvals<=0)
		  {
		  bootbox.confirm("Please select at least one Ping to delete", function(result) {	
				
			});
		  }
	  else
		  {
		  deleteNote();  
		  }
}


function confirmDelete()
{
	 var slvals= document.getElementById("confirmdelete").value;
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/ping/deletePing.htm?notifyTemplateId='+slvals,
			success : function(result) {
				if(result>0){
					location.reload();
				}
			}
		});
}

$(function() {
	$('#SppingLibraryManagerLink').css('font-weight','bold');
})

</script>
<form id="pingForm">
	<input type="hidden" id="notifyTemplateIdToSend" name="notifyTemplateId"/>
	<input type="hidden" id="isActive" name="isActive"/>
</form>

<script type="text/javascript">
			var grid_data='${notifyTemplateDatas}';
// 			alert(grid_data);
			index=JSON.parse(grid_data);
			
			/*var index=new Array();
			$(grid_data).each(function(i,obj) {
				var object = {};
				object.name = obj.name;
				object.pingOwner=obj.pingOwner;
				object.notifyTemplateID=obj.notifyTemplateID;
				index.push(object);
				
			});*/
			
		/* 	var subgrid_data = 
			[
			 {id:"1", name:"sub grid item 1", qty: 11},
			 {id:"2", name:"sub grid item 2", qty: 3},
			 {id:"3", name:"sub grid item 3", qty: 12},
			 {id:"4", name:"sub grid item 4", qty: 5},
			 {id:"5", name:"sub grid item 5", qty: 2},
			 {id:"6", name:"sub grid item 6", qty: 9},
			 {id:"7", name:"sub grid item 7", qty: 3},
			 {id:"8", name:"sub grid item 8", qty: 8}
			]; */
			
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
				//	colNames:['Ping Name','Ping Owner','Tag List','Schedule Count','Recipient Count','Creation Date','Action'],
					
					colNames:[' ',' ','Ping Name','Ping Owner','Tag List','Schedule <br> Count','Recipient <br> Count','Creation <br> Date'],
					colModel:[
					          
                            
		      						
		      						{name:'notifyTemplateID', index:' ',formatter:imageFormat1,formatoptions:{baseLinkUrl:'${pageContext.request.contextPath}/ping/addPing.htm?notifyTemplateId='}, width: 50},

		 						   {name:'chkdeleteselect',index:'', width:50, sortable:false,formatter:function(cellvalue, options,rowObject) {
		 						       return '<input role="checkbox" type="checkbox"  class="cbox" value="'+rowObject.notifyTemplateID+'" id="chkdeleteselect" name="chkdeleteselect">';
		 						   }}, 
		      						
					         
                          
						{name:'name',index:'name'},
						{name:'pingOwner',index:'pingOwner'},
						{name:'tagList',index:'tagList',cellattr: function (rowId, tv, rawObject, cm, rdata) { return 'style="white-space: normal;"' }},
						{name:'scheduleCount',index:'scheduleCount'},
						{name:'recipientCount',index:'recipientCount'},
						{name:'createdDate',index:'createdDate'},
					 
					], 
			
					viewrecords : true,
					rowNum:10,
					rowList:[10,20,50],
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
				
				
				function imageFormat1( cellvalue, options, rowObject ){
					//alert(options.colModel.formatoptions.baseLinkUrl);
					/* if(rowObject.pingOwner=='Partner'){ */
						return '<a href="${pageContext.request.contextPath}/ping/addPing.htm?notifyTemplateId='+cellvalue+'&name='+rowObject.pingOwner+'"><div title="Edit selected row" class="ui-pg-div ui-inline-edit" onmouseover="jQuery(this).addClass(\'ui-state-hover\');" onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" ><span class="ui-icon ui-icon-pencil"></span></div></a>';
						/*	} else{
						return '<a href="${pageContext.request.contextPath}/ping/addPing.htm?notifyTemplateId='+cellvalue+'&name='+rowObject.pingOwner+'"><div title="View selected row" class="ui-pg-div ui-inline-edit" onmouseover="jQuery(this).addClass(\'ui-state-hover\');" onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" ><span class="fa fa-eye"></span></div></a>';
					} */
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

<input type="hidden" id="notifyTemplateIdHidden" value="0">
<input type="hidden" id="notifyTemplateNameHidden" value="">


</body>
<script>
function deleteNote(){

	//$("#deletenote").show();	
	
	$('#deletenote').modal('show');
	/* var height = ($(window).height() / 2) - (parseInt($('#popUpAlertaddnote').css('height'))/2);
	$('#popUpAlertaddnote').css('top',height);
	var width = ($(window).width() / 2) - (parseInt($('#popUpAlertaddnote').css('width'))/2);
	$('#popUpAlertaddnote').css('margin-left', width/3);
	$("#popUpAlertaddnote").css ('height','250px');
	$("#popUpAlertaddnote").css ('width','300px'); */

	}
$('#menu-wplook-sub-menu10').addClass('active');
$('#SPPingsLink').addClass('active');
</script>

</html>