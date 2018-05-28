<!DOCTYPE html>
<html lang="en"><head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>PortFolio : Auto Allocated Assets</title>

</head>
<body>
      <jsp:include page="../common/header.jsp"></jsp:include>
	
 <!-- Center part start -->
	<section>
          <div class="page-header">
				<h1>Auto Allocated Assets</h1>
			</div>
            
            <div class="tabbable">
    <ul class="nav nav-tabs" id="">
      <li class="dropdown"> <a id="myportfolio" data-toggle="dropdown" class="dropdown-toggle" href="#" aria-expanded="false">My Portfolio <i class="ace-icon fa fa-caret-down bigger-110 width-auto"></i></a>
        <ul class="dropdown-menu dropdown-info" id="myportfolioMenu">
          <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/folio/foliopage.htm'">MF Portfolio</a> </li>
          <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath() %>/folio/openclientportfolio.htm'">Client Portfolio </a> </li>
        </ul>
      </li>
      <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/et/getTxnSource.htm'">RTA File Uploads </a> </li>
      <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/et/getbulkuploadtransactiohistorydetails.htm?queueId=0'">Transaction History </a> </li>
      <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/loadreportAdWiseCilentPortfolioSummary.htm'">Reports</a> </li>
      <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/et/loadAvailablePrePrintedForms.htm?clientPartyId=0&ownerPartyId=${sessionScope.userSession.partyId}'">Preprinted Form</a> </li>
      <li class="active" id="autoAllocatedAssetsLink"> <a onclick="window.location.href='<%=request.getContextPath()%>/et/assetAutoAllocation.htm'">Auto Allocated Assets</a> </li>
      <li id="autoAllocatedAssetsLink"> <a onclick="showPasswordDialog();">MF Auto Upload Configuration</a> </li>
    </ul>
    <div class="tab-content">
      <div id="" class="tab-pane fade in active clearfix">
       
	 <form name="form" id="form">
					<div class="col-md-12">

						<!-- center -->

						<div class="list-group">
							<a class="list-group-item active" href="#"> Auto Allocated Assets
							</a>
							<div class="list-group-item">

								<div class="row">
									<div class="col-xs-pull-9">
										<div class="table-responsive" id="display_table_lead">
											<div id="toreload">

												<table id="grid-table"></table>

												<div id="grid-pager"></div>

											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					 </div>
				   </form>
      </div>
      <div id="" class="tab-pane fade"> </div>
      <div id="" class="tab-pane fade"> </div>
      <div id="" class="tab-pane fade"> </div>
    </div>
  </div>
                  
			<!--<div class="container-body">
				
				<form name="form" id="form">
					<div class="col-md-12">

					

						<div class="list-group">
							<a class="list-group-item active" href="#"> Auto Allocated Assets
							</a>
							<div class="list-group-item">

								<div class="row">
									<div class="col-xs-pull-9">
										<div class="table-responsive" id="display_table_lead">
											<div id="toreload">

												<table id="grid-table"></table>

												<div id="grid-pager"></div>

											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					 </div>
				   </form>
			     </div>-->
              

	</section>
	<!-- Center part End -->          

<jsp:include page="../common/footer.jsp" />

<script type="text/javascript">
			var grid_data =${assetAutoAllocation};
			index=grid_data;
			
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
					height: "???",
					colNames:['Asset Name','Goal Name','Client Name','Amount Allocated To Goal','Percentage Allocated To Goal','Status','Action'],
					colModel:[
						
						{name:'assetName',index:'assetName', width:370,},
						{name:'goalName',index:'goalName', width:250,},
						{name:'clientName',index:'clientName', width:300,},
						{name:'assetAmountToGoal',index:'assetAmountToGoal', width:200,},
						{name:'assetPercentToGoal',index:'assetPercentToGoal', width:200,},
						{name:'userId',index:'userId', width:70,},
						 {name:'action',index:'action', width:70,formatter:function(cellvalue, options,rowObject) {
						    return '<a onclick="openActionPopup('+rowObject.goalAssetId+',\''+rowObject.isReviewed+'\')">Action</a>';
						}}, 
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
							
							/* updateActionIcons(table); */
							updatePagerIcons(table);
							enableTooltips(table);
						}, 0);
					},
			
					editurl: "/dummy.html",//nothing is saved
					//caption: "jqGrid with inline editing"
			
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

	function deleteAsset(goalAssetId) {
		if (goalAssetId != 0) {
			$.ajax({
				type : "POST",
				url : $('#contextPath').val()
						+ '/et/deleteAsset.htm?goalAssetId=' + goalAssetId,
				dataType : "json",
				success : function(data) {
					$('#actionpopupalert').modal('hide');
					if (data == 'success') {

						showAlertMessage1("Success",
								"Asset  deleted successfully" + '\n',
								"confirmation", doNothing);
						location.reload();

					} else {
						showAlertMessage1("Error", "System error occured"
								+ '\n', "confirmation", doNothing);
					}
				}
			});
		}

	}

	function confirmAsset(goalAssetId) {
		if (goalAssetId != 0) {
			$.ajax({
				type : "POST",
				url : $('#contextPath').val()
						+ '/et/confirmAsset.htm?goalAssetId=' + goalAssetId,
				dataType : "json",
				success : function(data) {
					$('#actionpopupalert').modal('hide');
					if (data == 'success') {

						showAlertMessage1("Success",
								"Asset  confirmed successfully" + '\n',
								"confirmation", doNothing);
						location.reload();

					} else {
						showAlertMessage1("Error", "System error occured"
								+ '\n', "confirmation", doNothing);
					}
				}
			});
		}
	}

	function openActionPopup(goalAssetId, isReviewed) {
		$("#goalAssetId").val(goalAssetId);
		$('#editId a').attr('onClick', 'editAssetPOPUP(' + goalAssetId + ')');
		$('#deleteId a').attr('onClick', 'deleteAsset(' + goalAssetId + ')');
		$('#confirmId a').attr('onClick',
				'confirmAsset(' + goalAssetId + ',' + isReviewed + ')');
		$('#actionpopupalert').modal('show');
	}
	var currentValue = '';
	var availableValue='';
	function changeValues(){
		var totalAvailableAmount='';
		  availableValue = parseInt(availableValue);
		  currentValue = parseInt(currentValue);

		totalAvailableAmount=availableValue + currentValue;
		var currentValueAfterChange=parseInt($("#currentValue").val());
		var availableValueAfterChange=parseInt($("#availableValue").html());
		totalAvailableAmount=parseInt(totalAvailableAmount);

		availableValueAfterChange = totalAvailableAmount - currentValueAfterChange;
		$("#availableValue").html(availableValueAfterChange);
	
		 if(availableValueAfterChange < 0){
			$('#actioneditpopupalert').modal('hide');
			showAlertMessage1("Error", "Allocated amount must be smaller than or equal to available amount" + '\n', "confirmation", doNothing);
		} 
		
	}

	function editAssetPOPUP(goalAssetId) {
		if (goalAssetId != 0) {
			$.ajax({
						type : "GET",
						url : $('#contextPath').val()
								+ '/et/assetAutoAllocationDetailsWhileEdit.htm?goalAssetId='
								+ goalAssetId,
						dataType : "json",
						success : function(result) {
							$('#actionpopupalert').modal('hide');

							if (result.currentValue != ""
									&& result.currentValue != "undefined"
									&& result.currentValue != undefined) {
								currentValue=parseInt(result.currentValue);
								$("#allocatedAmountCurrent").html("<input type='text' name='currentValue' id='currentValue' value='"+parseInt(result.currentValue)+"' onchange='javascript:changeValues();'/>");
							} else {
								$("#allocatedAmountCurrent").html("<input type='text' name='currentValue' id='currentValue' value='' onchange='javascript:changeValues();'/>");
							}
							if (result.goalId != ""
									&& result.goalId != "undefined"
									&& result.goalId != undefined) {
								$("#goalId").val(result.goalId);
							}
							if (result.partyAssetId != ""
									&& result.partyAssetId != "undefined"
									&& result.partyAssetId != undefined) {
								$("#partyAssetId").val(result.partyAssetId);
							}
							if (result.maturingAmount != ""
									&& result.maturingAmount != "undefined"
									&& result.maturingAmount != undefined) {
								$("#maturingAmount").html(result.maturingAmount);
							}
							if (result.availableValue != ""
									&& result.availableValue != "undefined"
									&& result.availableValue != undefined) {
								availableValue=parseInt(result.availableValue);
								$("#availableValue").html(parseInt(result.availableValue));
							} else {
								$("#availableValue").html("0");
							}
							if (result.assetName != ""
									&& result.assetName != "undefined"
									&& result.assetName != undefined) {
								$("#assetName").html(result.assetName);
							}
							if (result.goalName != ""
									&& result.goalName != "undefined"
									&& result.goalName != undefined) {
								$("#goalName").html(result.goalName);
							}
							$("#partyId").val(result.partyId);

						}
					});
		          }
		     $('#actioneditpopupalert').modal('show');
	       }
	
	function editAsset() {
		var availableValue=$("#availableValue").html();
		var partyAssetId=$("#partyAssetId").val();
		var goalId= $("#goalId").val();
		var currentValue = $("#currentValue").val();
		var partyId= $("#partyId").val();
		
  /*      if ((goalId != "" && goalId != "undefined" && goalId != undefined)
			&& (currentValue != "" && currentValue != "undefined" && currentValue != undefined)
			&& (partyAssetId != "" && partyAssetId != "undefined" && partyAssetId != undefined)
			&& (availableValue != "" && availableValue != "undefined" && availableValue != undefined)) { */
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()
					+ '/et/saveAssetsAllocatedToGoal.htm?currentValue='
					+ currentValue + "&partyId=" + partyId + "&goalId="
					+ goalId + "&availableValue=" + availableValue
					+ "&partyAssetId=" + partyAssetId,
			dataType : "json",
			success : function(data) {
				$('#actioneditpopupalert').modal('hide');
				if (data == 'success') {

					showAlertMessage1("Success",
							"Asset  updated successfully" + '\n',
							"confirmation", doNothing);

				} else {
					showAlertMessage1("Error", "System error occured"
							+ '\n', "confirmation", doNothing);
				}
				location.reload();
			}
		});
	/* } */
}
</script>
        <input type="hidden" name="goalAssetId" id="goalAssetId"  value="0">
        <input type="hidden" name="partyId" id="partyId"  value="0">
         <input type="hidden" name="goalId" id="goalId"  value="0">
        <input type="hidden" name="partyAssetId" id="partyAssetId"  value="0">
        
     <div class="modal fade" id="actionpopupalert" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">Action List</h4>
										</div>
										<div class="modal-body">
											<table class="table table-bordered table-striped">
			<tr>
				<td id="editId">
					<i class="outputreport_icon"></i>
					<a href="#" style="color: #333;">
						<span class="user">Edit Allocation</span>
					</a>
				</td>
			</tr>
			<tr>
				<td id="deleteId">
					<i class="download_icon"></i>
					<a href="#" style="color: #333;">
						<span class="user">Delete Allocation</span>
					</a>
				</td>
			</tr>
			<tr>
				<td id="confirmId">
					<i class="emailicon"></i>
					<a href="#" style="color: #333;">
						<span class="user">Confirm Allocation</span>
					</a>
				</td>
			</tr>

		</table>
		</div></div></div></div>
		
		     <div class="modal fade" id="actioneditpopupalert" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">Asset Allocation Details</h4>
										</div>
										<div class="modal-body">
										
										<div class="row">
										<div class="form-group col-md-12 clearfix">
											<label class="col-sm-5 control-label no-padding-right"><b>Asset Name</b></label>
											<div class="col-sm-7">
											 : <span id="assetName"></span>
											</div>
										</div>
									    </div>
									    <div class="row">
										<div class="form-group col-md-12 clearfix">
											<label class="col-sm-5 control-label no-padding-right"><b>Goal Name</b></label>
											<div class="col-sm-7">
											 : <span id="goalName"></span>
											</div>
										</div>
									    </div>
									    <div class="row">
										<div class="form-group col-md-12 clearfix">
											<label class="col-sm-5 control-label no-padding-right"><b>Asset Available Value</b></label>
											<div class="col-sm-7">
											 : <span id="availableValue"></span>
											</div>
										</div>
									    </div>
									    <div class="row">
										<div class="form-group col-md-12 clearfix">
											<label class="col-sm-5 control-label no-padding-right"><b>Allocated Amount</b></label>
											<div class="col-sm-7">
											 : <span id="allocatedAmountCurrent"></span>
											</div>
										</div>
									    </div>
								
									    <div class="row">
										<div class="form-group col-md-12 clearfix">
											<label class="col-sm-1 control-label no-padding-right">
                                           </label>
											<div class="col-sm-11">
											<span class="pull-right">
											<input class="btn btn-primary btn-xs dbtn" type="button" value="Save " name="save" onclick="editAsset();"/> 
											<input class="btn btn-primary btn-xs dbtn" type="button" value=" Cancel" name="cancel" onclick="javascript:$('#actioneditpopupalert').modal('hide') ;"/> 
											</span>
											</div>
										</div>
									    </div>
		              </div></div></div></div>
										
</body>
</html>