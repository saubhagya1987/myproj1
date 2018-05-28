<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Tags List</title>
<script type="text/javascript">
var hidePopupTimeoutId;
$(".choose1").on("mouseover", function () {
    clearTimeout( hidePopupTimeoutId );
    $(".popupnewpingtag1").show();
});


$(".choose1").on("mouseout", function () {
    hidePopupTimeoutId = setTimeout( function() {
        $(".popupnewpingtag1").hide();
    },500);
});

$(".popupnewpingtag1").on("mouseenter", function() {
    clearTimeout( hidePopupTimeoutId );
});


$(".popupnewpingtag1").on("mouseleave", function() {
    $(".popupnewpingtag1").hide();
});

function deleteTags() {
	list = new Array();
	$('#data :checked').each(function(i, obj) {
		list[i] = $(this).attr('id');
	});
	if (list.length == 0) {
		showAlertMessage1("Message",
				"Please select at least one Tag to delete.",
				"information", doNothing);
	} else{
		var message = "";
		if (list.length == 1) {
			message = "Do you want to delete this Tag?";
		} else {
			message = "Do you want to delete these Tag?";
		}
		showAlertMessage1("Message", "<br/>" + message, "question",
				doNothing1);
		$('.ZebraDialog_Button1').attr('href','javascript:deleteTagsTrue()');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
	}
}

function deleteTagsTrue() {
	var message = "";
	if (list.length == 1) {
		message = "Tags successfully deleted.";
	} else {
		message = "Tags successfully deleted.";
	}
	

	setTimeout(function() {
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/ping/deleteTags.htm?tagIds=" + list,
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
function addNewTags()
{
	window.location.href= $('#contextPath').val() +"/addTags.htm";
}
function getXLS()
{
	var notifyTemplateId=$('#notifyTemplateId').val();
	
		window.location.href = $('#contextPath').val()+"/ping/getTagsListXLS.htm";
}
function getCSV()
{
		window.location.href = $('#contextPath').val()+"/ping/getTagsListCSV.htm";
}
</script>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<input id="contextPath" type="hidden" name="contextPath" 
		value="<%=request.getContextPath()%>" />

<!-- Center part start -->
<section>
<div class="">
<div class="page-header">
  <h1>Pings </h1>
</div >
<div class="container-body">

<!-- center --> 
<!--  include ping side bar -->
<jsp:include page="pingsidebar.jsp" />
<div class="col-md-9"  style="margin-top:10px; padding-left:10px;" >
  
  <!-- center -->
  
  <div class="list-group"><a class="list-group-item active" href="#">Tags List</a>
    
    <!-- accordion start-->
    
    <div class="accordion pull-left col-md-12" id="accordFundSel" style="margin-left:-5px;">
      <div class="accordion-group">
        <div class="pull-left fundtool_left_col_head "></div>
        <div class="accordion-heading none" style="float:right;"><a class="accordion-toggle " data-toggle="collapse" data-parent="#accordFundSel" href="#collapseFundSel"><span style=" margin-top:0px;" class="searchiconb"  alt="Search" title="Search"></span></a></div>
        <div style="height: auto;" id="collapseFundSel" class="accordion-body pull-left serchboxnew collapse">
          <div class="accordion-inner table-responsive">
            <div style="width: 1500px;">
              <!--1 search start -->
              
              <div class="filterbox searchpadding">
                <div class="head">Favourites</div>
                <div class="drop_box_body">
                  <ul class="nav  nav-stacked">
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Men</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Women</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Family</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Child</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Youngsters</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Middle Aged</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Old Aged</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Education plan</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Education Opportunity</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Conservative Risk Profile</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Aggressive Risk Profile</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Investment</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Retirement</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Saving</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Doctors</li>
                  </ul>
                </div>
              </div>
              <div class="filterbox searchpadding">
                <div class="head">Matching Tag</div>
                <div class="drop_box_body">
                  <ul class="nav  nav-stacked">
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Education</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      saving for Women</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Family Insurance</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Child Insurance</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Retirement Plan</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Retirement for Youngsterss</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Retirement for Middle Aged</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Retirement for Old Aged</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Investment for Women</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Education Opportunity</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Conservative Risk Profile</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Aggressive Risk Profile</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Investment</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Retirement</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Saving</li>
                  </ul>
                </div>
              </div>
              <div class="filterbox searchpadding">
                <div class="head">Most popular [top 10]</div>
                <div class="drop_box_body">
                  <ul class="nav  nav-stacked">
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Family Insurance</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Child Insurance</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Retirement Plan</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Retirement for Youngsterss</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Retirement for Middle Aged</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Retirement for Old Aged</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Investment for Women</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Education Opportunity</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Conservative Risk Profile</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Aggressive Risk Profile</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Investment</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Retirement</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Saving</li>
                  </ul>
                </div>
              </div>
              <div class="filterbox searchpadding">
                <div class="head">Most used [top 10]</div>
                <div class="drop_box_body">
                  <ul class="nav  nav-stacked">
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Family Insurance</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Child Insurance</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Retirement Plan</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Retirement for Youngsterss</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Retirement for Middle Aged</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Retirement for Old Aged</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Investment for Women</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Education Opportunity</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Conservative Risk Profile</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Aggressive Risk Profile</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Investment</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Retirement</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Saving</li>
                  </ul>
                </div>
              </div>
              <div class="filterbox searchpadding">
                <div class="head">Notification Target</div>
                <div class="drop_box_body">
                  <ul class="nav  nav-stacked">
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Family Insurance</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Child Insurance</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Retirement Plan</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Retirement for Youngsterss</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Retirement for Middle Aged</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Retirement for Old Aged</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Investment for Women</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Education Opportunity</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Conservative Risk Profile</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Aggressive Risk Profile</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Investment</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Retirement</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Saving</li>
                  </ul>
                </div>
              </div>
              <div class="filterbox searchpadding">
                <div class="head">Delivery Channel</div>
                <div class="drop_box_body">
                  <ul class="nav  nav-stacked">
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      Email</li>
                    <li>
                      <input id="15Large"  value="15Large" type="checkbox">
                      SMS</li>
                  </ul>
                </div>
              </div>
            </div>
            
            <!-- accordion-inner END -->
            <div class="col-md-1">
              <button type="button" id="updatefilterlist" class="btn">Show</button>
            </div>
          </div>
        </div>
        <!-- accordion-body END -->
      </div>
      <!-- accordion-group END -->
    </div>
    <!-- accordion  END -->
    <!-- accordion End -->
    
    <div class="list-group-item">
      <div class="topmenu pull-right margin_5px"><a href="#">
        <button type="button" class="btn btn-primary btn-xs  createNewBtn southspace1" id="AddNewTagLink"  onclick="addNewTags()" title="Add New Tag" alt="Add New Tag"><i class="fa fa-plus"></i>Add New Tag</button>
        <button data-params="{}" type="button" class="btn btn-primary btn-xs  deleteBtn westspace1 southspace1" id="DeleteTagLink" title="Delete" onclick="deleteTags()"><i class="fa fa-close"></i>Delete</button>
        </a></div>
      <div class="clearfix"></div>
      <div class="table-responsive" id="display_table_lead" style="border:none;">
        <div id="toreload" class="tabular_break_word">
          <table id="grid-table">
          </table>
          <div id="grid-pager"></div>
          
          <!-- Center-->
        </div>
      </div>
      <div class="row">
        <div class="col-xs-pull-9">
          <div class="topmenuleft" ></div>
          <div class="topmenuleft" >
            <div class="topmenuleft margin_5px" ><span>Export options:</span><a class="margin_5px" onclick="getCSV()" title="Export in CSV" alt="Export in CSV"><i class="fa icon-csv bigger-150"></i></a><a class="margin_5px" onclick="getXLS()" title="Export in Excel" alt="Export in Excel"><i class="fa fa-file-excel-o bigger-150"></i></a></div>
          </div>
          <div class="topmenu pull-right margin_5px">
            <button type="button" class="btn btn-primary btn-xs  createNewBtn southspace1" id="AddNewTagLink"  onclick="addNewTags()" title="Add New Tag" alt="Add New Tag"><i class="fa fa-plus"></i>Add New Tag</button>
            <button data-params="{}" type="button" class="btn btn-primary btn-xs westspace1  deleteBtn southspace1" id="DeleteTagLink" title="Delete" onclick="deleteTags()"><i class="fa fa-close"></i>Delete</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<br/>
<br/>
</div>
</div>

<!-- Center part End -->

<jsp:include page="../common/footer.jsp" />
<script>
$(document).ready(function(){ 
	 $('#pingTagListLink').css('font-weight','bold');
});
</script>
<script type="text/javascript">
			var grid_data ='${tagDatas}';
			index=JSON.parse(grid_data);
			
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
					colNames:['Tag Name','Description', 'Mapped Code Type Name', 'Last Update date', 'Last Update By'],
					colModel:[
						{name:'notifyTagName',width:220,index:'notifyTagName'},
						{name:'notifyTagDescription',width:220,index:'notifyTagDescription'},
						{name:'mappedCodeValue',index:'mappedCodeValue'},
						{name:'lastModifiedDate',index:'lastModifiedDate'},
						{name:'lastModifiedBy',index:'lastModifiedBy'}
					], 
			
					viewrecords : true,
					rowNum:10,
					rowList:[10,20,50,100,1000],
					pager : pager_selector,
					altRows: true,
			        multiboxonly: true,
			
					loadComplete : function() {
						var table = this;
						setTimeout(function(){
							
							updatePagerIcons(table);
							enableTooltips(table);
						}, 0);
					},
			
					editurl: "/dummy.html",//nothing is saved
			
					autowidth: true,
		            shrinkToFit:false,	
			
				});
				$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
				
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
						recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
						//new record form
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
					form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:false})
					
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
</html>