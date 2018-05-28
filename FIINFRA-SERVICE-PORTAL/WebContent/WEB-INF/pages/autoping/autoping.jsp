<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>AutoPing</title>
<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico"
	rel="shortcut icon">
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<input type="hidden" id="confirmdelete" name="confirmdelete">
	 <div class="modal fade" id="deletenote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
   			 <div class="modal-content">
      		<div class="modal-header">
       			 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Delete Record</h4> 
        		</div>
		<!-- <div id="deletenote"> -->
			<div class="modal-body"> 
			Do you want to delete this selected records? Please confirm.
			</div>
					<div class="modal-footer">
						<form>
							<!-- <input class="dbtn" value="Yes" id="Yes" type="button"
								onclick="confirmDelete();popup('popUpAlertaddnote');" />  -->
								<!-- <input
								class="dbtn" value="No" id="No" type="button"
								onclick="popup('popUpAlertaddnote');"/> -->
								<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="confirmDelete();"> Yes</button>
								<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" class="close" data-dismiss="modal" aria-label="Close"> No</button>
								
						</form>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	<!-- <div class="modal fade" id="deletenote" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Delete Record</h4>
					</div>
					<div class="modal-body">
					<div id="deletenote">
					Do you want to delete this selected records? Please confirm.
					</div>
					<div class="modal-footer">
						<form>
							<input class="btn btn-danger" value="Yes" id="Yes" type="button"
								onclick="confirmDelete()" />
							<button type="button" class="btn btn-default"
								data-dismiss="modal">No</button>
						</form>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div> -->
	

	<div class="page-header">
		<h1 class="pull-left">AutoPing</h1>
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
			<%-- <a href="<%=request.getContextPath()%>/autoping/addAutoPing.htm"" class="btn btn-primary" ><i class='ace-icon fa fa-plus'></i>Add New AutoPing</a> --%>
			<!-- <input data-params="{}" type="button" id="SPDeleteAutoPingLink" class="dbtn deleteBtn" value="  Delete"  title="Delete" onclick="deletePings()"> -->

			<div class="list-group">
				<a class="list-group-item active" href="#">AutoPing Library
					Manager </a>
				<div class="list-group-item">
					<div class="topmenu pull-right margin_5px">
						<a href="<%=request.getContextPath()%>/autoping/addAutoPing.htm"
							id="SPAddNewAutoPingLink"><button data-params="{}" onClick=""
								type="button" class="btn btn-sm btn-primary"
								title="Add New AutoPing" alt="Add New AutoPing">
								<i class="ace-icon fa fa-plus"></i> Add New AutoPing
							</button></a>
						<button id="SPDeletePingLink" class="btn btn-sm btn-primary"
							onclick="deletePings()">
							<i class='ace-icon fa fa-trash'></i>Delete
						</button>
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
						<!--  <div class="space"></div> -->
						<div class="topmenuleft margin_5px">
							<span>Export options:</span> <a class="margin_5px"
								onclick="getCSV()" title="Export in CSV" alt="Export in CSV"><i
								class="fa fa-file-pdf-o bigger-140"></i></a> <a class="margin_5px"
								onclick="getXLS()" title="Export in Excel" alt="Export in Excel"><i
								class="fa fa-file-excel-o bigger-140"></i></a>
						</div>
					</div>
					<div class="row">
						<div class="topmenu pull-right margin_5px">
							<!--   <div class="space"></div> -->
							<a href="<%=request.getContextPath()%>/autoping/addAutoPing.htm"
								id="SPAutoPingAddNewLink"><button data-params="{}"
									onClick="" type="button" class="btn btn-sm btn-primary"
									title="Add New AutoPing" alt="Add New AutoPing">
									<i class="ace-icon fa fa-plus"></i> Add New AutoPing
								</button></a>
							<button id="SPDeletePingLink" class="btn btn-sm btn-primary"
								onclick="deletePings()">
								<i class='ace-icon fa fa-trash'></i>Delete
							</button>
						</div>

					</div>

				</div>

			</div>

		</div>
	</div>


	<jsp:include page="../common/footer.jsp" />

	<script type="text/javascript">
			var grid_data = ${autoping_List};
			
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
			
			
			
					data: grid_data,
					datatype: "local",
					height: 250,
					ignoreCase: true,
					colNames:[' ',' ','Auto Ping Name','Source','Event','Delivery Channel','Created Date','Action'],
					colModel:[
					     
					          {name:'notifyTemplateID', index:' ',formatter:imageFormat1,formatoptions:{baseLinkUrl:'${pageContext.request.contextPath}/autoping/addAutoPing.htm?notifyTemplateId='}, width: 50}, 
					 
					               
		                            {name:'chkdeleteselect',index:'', width:50, sortable:false,formatter:function(cellvalue, options,rowObject) {
			 						       return '<input role="checkbox" type="checkbox"  class="cbox" value="'+rowObject.notifyTemplateID+'" id="chkdeleteselect" name="chkdeleteselect">';
			 						   }}, 
		                                        
		               	{name:'name',index:'name',cellattr: function (rowId, tv, rawObject, cm, rdata) { return 'style="white-space: normal;"' }},
						{name:'source',index:'source'},
						{name:'event',index:'event',cellattr: function (rowId, tv, rawObject, cm, rdata) { return 'style="white-space: normal;"' }},
						{name:'deliveryChannel',index:'deliveryChannel'},
						{name:'createdDate',index:'createdDate'},
						{name:'action',index:'action',formatter:function(cellvalue, options,rowObject) {
						    return '<a onclick="openActionPopup('+rowObject.notifyTemplateID+',\''+rowObject.name+'\',\''+rowObject.source+'\',\''+rowObject.event+'\')">Action</a>';
						}}
						], 
			
					viewrecords : true,
					rowNum:10,
					rowList:[10,20,30],
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
			
					autowidth: false,
					
			
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
						return '<a href="${pageContext.request.contextPath}/autoping/addAutoPing.htm?notifyTemplateId='+cellvalue+'&source='+rowObject.source+'"><div title="Edit selected row" class="ui-pg-div ui-inline-edit" onmouseover="jQuery(this).addClass(\'ui-state-hover\');" onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" ><span class="ui-icon ui-icon-pencil"></span></div></a>';
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


	


	<div class="common_dialog hide action_dialog">
		<table id="" class="table table-bordered table-striped" width="100%"
			cellpadding="0" cellspacing="0">
			<tbody>
				<tr id="">
					<th class="thead">Action List</th>

				</tr>
				<tr id="">
					<td id="SPAutoPingActionScheduleLink"><i class="fa fa-check"></i>
						<a onclick=""><span class="">Schedule</span></a></td>

				</tr>
				<!--  <tr id="">
	        <td id="SPReProcessLink"><i class="fa fa-database"></i> <a onclick=""><span class="">Reprocess</span></a></td>
	      </tr>
	      <tr id="">
	        <td id="ViewErrorCountLink"><i class="fa fa-clock-o"></i> <a onclick=""><span class="">View Error Count</span></a></td>
	        
	      </tr>
	      <tr id="">
	        <td id="SPViewUploadedTransLink"><i class="fa fa-question-circle"></i> <a onclick=""><span class="">View Uploaded Transaction</span></a></td>
	       
	      </tr> -->

			</tbody>
		</table>
	</div>




</body>
<script>
	function ViewAutoPingActionScheduleLink(notifyTemplateID, name, source,
			event) {

		window.location.href = $('#contextPath').val()
				+ "/autoping/scheduleAp.htm?pingId=" + notifyTemplateID
				+ "&pingName=" + name + "&source=" + source + "&event=" + event;
	}
	
	


	<%-- function ViewAutoPingActionScheduleLink(notifyTemplateID){

		  /*   window.location.href = $('#contextPath').val()+"/autoping/scheduleAp.htm?pingId="+notifyTemplateID;  */
		   window.location.href = "<%=request.getContextPath()%>/autoping/scheduleAp.htm?pingId="+notifyTemplateID;
		   
		  } --%>
		  
		  function openActionPopup(notifyTemplateID,name,source,event){
		 // alert('Hi');
		   /*'+rowObject.filepath+',\''+rowObject.fileName+'\','+rowObject.batchId+','+rowObject.status+'\'  */
		   $('#SPAutoPingActionScheduleLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();ViewAutoPingActionScheduleLink('+notifyTemplateID+',\''+name+'\',\''+source+'\',\''+event+'\')'); 
		  // $('#SPReProcessLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();confirmReprocess('+batchId+',\''+status+'\')');
		  // $('#ViewErrorCountLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();ViewErrorCount('+batchId+')');
		  // $('#SPViewUploadedTransLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();ViewUploadedTrans('+batchId+')');
		 
		   
		   /* if(executionStatus<1){
		    //hide data collection link here
		   } */
		   if('${sessionScope.userSession.buId}'!='27829'){
		    $('#SPAutoPingActionScheduleLink').removeClass('hide');
		   /*  $('#SPReProcessLink').removeClass('hide');
		    $('#ViewErrorCountLink').removeClass('hide');
		    $('#SPViewUploadedTransLink').removeClass('hide');
		    */ 
		    
		   }else{
		    $('#SPAutoPingActionScheduleLink').removeClass('hide');
		    /* $('#SPReProcessLink').removeClass('hide');
		    $('#ViewErrorCountLink').removeClass('hide');
		    $('#SPViewUploadedTransLink').removeClass('hide'); */
		    
		   }
		   
		   
		    $( ".action_dialog" ).removeClass('hide').dialog({
		    resizable: false,
		    modal: true,
		                width: "auto",
		   }); 
		  
		   
		 /*   $( ".action_dialog" ).removeClass('hide').dialog({
			     resizable: true, 
			     modal: true, 
			                 width: "auto",
			                 position: { my: "center", at: "right", of: window },
			                 
			                }); */
		   
		  } 
		  
		        jQuery(function(cash) {
		         $("#search").keyup(function(event) {
		    if (event.keyCode == 13) {
		     oppsearch();
		    }
		   });
		        $( ".action" ).on('click', function(e) {
		     e.preventDefault();
		    
		     $( ".action_dialog" ).removeClass('hide').dialog({
		      resizable: false,
		      modal: true,
		                        width: "auto",
		     });
		    });
		    
		    $( ".progress").on('click', function(e) {
		     e.preventDefault();
		    
		     $( ".progress_dialog" ).removeClass('hide').dialog({
		      resizable: false,
		      modal: true,
		      width: "auto",
		                        
		     });
		    });
		   });
		   
		        function getXLS()
		        {
		        	
		        	 	window.location.href = "<%=request.getContextPath()%>/autoping/autopingExport.htm?type=excel"; 
		        }
		        function getCSV()
		        {
		        		window.location.href = "<%=request.getContextPath()%>/autoping/autopingExport.htm?type=CSV";
		      	}
		
	
</script>
<script>
	function deleteNote() {

		//$("#deletenote").show();	

		$('#deletenote').modal('show');
		/* var height = ($(window).height() / 2) - (parseInt($('#popUpAlertaddnote').css('height'))/2);
		$('#popUpAlertaddnote').css('top',height);
		var width = ($(window).width() / 2) - (parseInt($('#popUpAlertaddnote').css('width'))/2);
		$('#popUpAlertaddnote').css('margin-left', width/3);
		$("#popUpAlertaddnote").css ('height','250px');
		$("#popUpAlertaddnote").css ('width','300px'); */

	}

	function deletePings() {
		var slvals = []
		$('input:checkbox[name=chkdeleteselect]:checked').each(function() {
			slvals.push($(this).val());
		})

		document.getElementById("confirmdelete").value = slvals;
		if (slvals <= 0) {
			 bootbox.dialog({
					message: "<span class='bigger-110'>Please select at least one Record.</span>",
					buttons: 			
					{
						"click" :
						{
							"label" : "OK!",
							"className" : "btn-sm btn-primary",
							"callback": function() {
								
							}
						}
					}
				});
			/* bootbox.confirm("Please select at least one AutoPing to delete",
					function(result) {

					}); */
		} else {
			deleteNote();
		}
	}

	function confirmDelete() {
		var slvals = document.getElementById("confirmdelete").value;
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()
					+ '/ping/deletePing.htm?notifyTemplateId=' + slvals,
			success : function(result) {
				$("#deletenote").hide();
				if(result>0){					
					 bootbox.dialog({
							message: "<span class='bigger-110'>Deleted Successfully</span>",
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
					//location.reload();
				}
			}
				
				
// 				if (result > 0) {
// 					location.reload();
// 				}
// 			}
		});
	}
	function reload()
	{
		location.reload();
	}
	$('#menu-wplook-sub-menu10').addClass('active');
	$('#SPAutoPingsLink').addClass('active');
</script>



</html>