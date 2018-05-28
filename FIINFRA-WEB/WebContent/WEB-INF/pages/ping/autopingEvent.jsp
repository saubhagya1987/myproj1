<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Auto Ping Event</title>
<style>
.mostusedNewicon {
	background: url(../images/allCommon-Icons.png) no-repeat -89px -2928px;
	padding-right: 20px;
	width: 20px;
	height: 20px;
	padding-bottom: 15px;
}
.popularicon {
	background: url(../images/allCommon-Icons.png) no-repeat -89px -2955px;
	padding-right: 20px;
	width: 20px;
	height: 20px;
	padding-bottom: 15px;
}
.favoriteicon {
	background: url(../images/allCommon-Icons.png) no-repeat -89px -2982px;
	padding-right: 20px;
	width: 20px;
	height: 20px;
	padding-bottom: 15px;
}
</style>
</head>
<body>
<!--css popup window start 1-->
<jsp:include page="../common/header.jsp" />

<!-- Center part start -->
<section>
<div class="">
<div class="page-header">
  <h1>Auto Pings</h1>
</div >
<div class="container-body">
<!--  include ping side bar -->
<jsp:include page="pingsidebar.jsp" />
<div class="col-md-9"  style="margin-top:10px; padding-left:10px;"  >
  <div class="list-group"><a class="list-group-item active" href="#">Auto Ping Events</a>
    <div class="accordion pull-left col-md-12" id="accordFundSel" style="margin-left:-5px;">
      <input type="hidden" name="eventId" value="<%=request.getParameter("eventId")%>"/>
      <!-- accordion-group END -->
    </div>
    <!-- accordion  END -->
    <!-- accordion End -->
    <div class="list-group-item">
      <div class="topmenu"></div>
      <div class="table-responsive" id="display_table_lead" style="border:none;">
        <div id="toreload" class="col-md-12 tabular_break_word">
          <table id="grid-table">
          </table>
          <div id="grid-pager"></div>
        </div>
      </div>
      <div class="col-sm-7">
        <div class="topmenuleft margin_5px" ><span>Export options:</span><a href="<%=request.getContextPath()%>/ping/eventExportAutoPing.htm?type=CSV" class="margin_5px" title="Export in CSV" alt="Export in CSV"><i class="fa icon-csv bigger-150"></i></a><a href="<%=request.getContextPath()%>/ping/eventExportAutoPing.htm?type=excel" class="margin_5px" title="Export in Excel" alt="Export in Excel"><i class="fa fa-file-excel-o bigger-150"></i></a></div>
      </div>
      <div class="row">
        <div class="topmenu"></div>
      </div>
    </div>
  </div>
</div>
</div>

</section>

<!-- Center part End -->

<jsp:include page="../common/footer.jsp" />

<!-- inline scripts related to this page -->
<script type="text/javascript">
			var grid_data = '${autoping_eventlist}';
			var index = JSON.parse(grid_data);
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
				
				
				jQuery(grid_selector).jqGrid({
					//direction: "rtl",
			
					//subgrid options
					subGrid : false,
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
					colNames:[' ','Event','Event Description','Source', 'Status','Action'],
					colModel:[
						
						{name:'eventId',index:'eventId', hidden:true},
						{name:'event',width:'210px',index:'event'},
						{name:'eventDescription',width:'210px',index:'eventDescription'},
						{name:'source',index:'source'},
						{name:'isRecuring',index:'isRecuring',formatter:showStatus},
						{name:'isRecuring',index:'isRecuring',formatter:changeStatus} 
					], 
			
					viewrecords : true,
					rowNum:10,
					rowList:[10,20,50,100,1000],
					pager : pager_selector,
					altRows: true,
					//toppager: true,
					
					multiselect: false,
			        multiboxonly: false,
			
					loadComplete : function() {
						var table = this;
						setTimeout(function(){
							
							updatePagerIcons(table);
							enableTooltips(table);
						}, 0);
					},
			
					editurl: "/dummy.html",//nothing is saved
					caption: ""
			
					,autowidth: true,
					shrinkToFit:false,
			
				});
				$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
				
				
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
				
				function showStatus( cellvalue, options, cell ){
					var status = 'Enabled';
					var Disstatus = 'Disabled';
					if(cellvalue == '1'){
						return  '<span>'+$(status).selector+'</span>';
					} else {
						return  '<span>'+$(Disstatus).selector+'</span>';
					}
				}
				
				function changeStatus( cellvalue, options, cell ){
					var status = 'Enable';
					var Disstatus = 'Disable';
					if(cellvalue == '1'){
						return '<a  onclick="changeAutoPingStatus('+cell.eventId+',\''+$(Disstatus).selector+'\')"><div title="Edit selected row" class="ui-pg-div ui-inline-edit" onmouseover="jQuery(this).addClass(\'ui-state-hover\');" onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" ></div>'+$(Disstatus).selector+'</a>';
					} else {
						return '<a  onclick="changeAutoPingStatus('+cell.eventId+',\''+$(status).selector+'\')"><div title="Edit selected row" class="ui-pg-div ui-inline-edit" onmouseover="jQuery(this).addClass(\'ui-state-hover\');" onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" ></div>'+$(status).selector+'</a>';
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
						recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
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
			
			
				$(document).one('ajaxloadstart.page', function(e) {
					$(grid_selector).jqGrid('GridUnload');
					$('.ui-jqdialog').remove();
				});
			});
		</script>

</body>
<script type="text/javascript">
function changePageSize(){
	var searchtext=$('#searchtext').val();
 	$("#toreload").load('${pageContext.request.contextPath}/ping/getAutoPingEvent.htm #toreload', {
	   object: '${object}',
	   pageSize: $('#page').val(),
	   searchtext:searchtext,

}, function( response, status, xhr ) {
      try{
        //closePopupWebApp('');
      }catch(e){
        // closePopupWebApp('');       
      }
     });
}
</script>
<script type="text/javascript">
function deletePings() {
	list = new Array();
	$('#data :checked').each(function(i, obj) {
		list[i] = $(this).attr('id');
	});
	if (list.length == 0) {
		showAlertMessage1("Message",
				"Please select at least one Ping to delete.",
				"information", doNothing);
	} else{
		var message = "";
		if (list.length == 1) {
			message = "Do you want to delete this Ping?";
		} else {
			message = "Do you want to delete these Pings?";
		}
		showAlertMessage1("Message", "<br/>" + message, "question",
				doNothing1);
		$('.ZebraDialog_Button1').attr('href','javascript:deletePingsTrue()');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
	}
}

function deletePingsTrue() {
	var message = "";
	if (list.length == 1) {
		message = "Ping successfully deleted.";
	} else {
		message = "Pings successfully deleted.";
	}
	setTimeout(function() {
		$('#notifyTemplateIdToSend').val(list);
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/autping/deleteAutoPing.htm',
			data:$('#pingForm').serialize(),
			success : function(result) {
				if(result>0){
					showAlertMessage("Success", "<br/>"+message+"", "confirmation", reloadPage);
				}else{
					showAlertMessage("Error", "The connection to the server has been lost. Please try again later.", "error", doNothing);
				}
			}
		});
	}, 500);
}
$(function() {
	$('#PPAutoPingEventListLink').css('font-weight','bold');
})

function changeAutoPingStatus(eventId,flag){
	var message = "";
	if (flag== "Enable") {
		message = "Event enabled successfully.";
	} else {
		message = "Event disabled successfully.";
	}
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/ping/changeAutoPingStatus.htm?eventId='+eventId+'&flag='+flag,
		data:$('#pingForm').serialize(),
		success : function(result) {
			if(result==null){
				showAlertMessage("Success", "<br/>"+message+"", "confirmation", reloadPage);
			}else{
				showAlertMessage("Error", "The connection to the server has been lost. Please try again later.", "error", doNothing);
			}
		}
	});
}

</script>
<form id="autopingForm">
  <input type="hidden" id="notifyTemplateIdToSend" name="pingId"/>
  <input type="hidden" id="isActive" name="isActive"/>
</form>
</html>