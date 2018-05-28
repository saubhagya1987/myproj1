<!DOCTYPE html>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>RTA File Uploads- Upload History</title>
</head>
<body>
<script type="text/javascript">

function sendForReprocess(id,records){
	if(id== null){
		return;
	}
	
	$.ajax({
		type : "GET",
		url : $('#contextPath').val()+'/et/requestforreprocess.htm?queueId='+id,
		dataType : "json",
		success : function(data){
		
			$('.popupnewup1').hide()
			if(data!=null){
				 if(data.success!=null)
					  showAlertMessage1("Success",
							  data.success+'\n',
								"confirmation", doNothing);  
		 		  else
		 			 showAlertMessage1("Error",
		 					data.error+'\n',
								"confirmation", doNothing);  
			  }			
			
		} 
	});
}
function confirmReprocess(id){
	var reprocessDivId  = "#reprocessresponsediv_" + id;
	$(reprocessDivId).show();
}
function getErrorDetails(id){
	
	if(id == null){
		return;
	} else{
		$('#errordetailstable').empty();
		$('#popUpAction').modal('hide');
		$('#popErrCount').modal('show');
	}
	$.ajax({
		type : "GET",
		url : $('#contextPath').val()+'/et/getbulkuploaderrorcount.htm?queueId='+id,
		dataType : "json",
		success : function(data){
			//alert(data);
			if(data!=''){
				if(data === null ){
					alert(data);
					$('#errordetailstable').append('<tr><td>'+'Records Not Available'+'</td></tr>');
					return;
				}
				//var errordetailsdivId  = "#errordetailsdiv_" + id;
				//var errorDetailsTableId = "#errordetailstable_" + id; 
				
				for(var i=0 ; i<data.length; i++){
					var failureType = data[i].FailureType;
					var errorDetails = data[i].ErrorDetails;
					var recordNo = data[i].RecordNo;
					
					$('#errordetailstable').append('<tr><td>'+recordNo+'</td><td>'+failureType+'</td><td>'+errorDetails+'</td></tr>');
					
				}
			
			} else{
				$('#errordetailstable').append('<tr><td>'+'Records Not Available'+'</td></tr>');
			}
			
		} 
	});
}
</script>

<jsp:include page="../common/header.jsp"></jsp:include>

	<section>
     <div class="page-header">
    <h1>RTA File Uploads </h1>
  </div>
     <div class="tabbable">
    <ul class="nav nav-tabs" id="">
      <li class="dropdown"> <a id="myportfolio" data-toggle="dropdown" class="dropdown-toggle" href="#" aria-expanded="false">My Portfolio <i class="ace-icon fa fa-caret-down bigger-110 width-auto"></i></a>
        <ul class="dropdown-menu dropdown-info" id="myportfolioMenu">
          <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/folio/foliopage.htm'">MF Portfolio</a> </li>
          <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath() %>/folio/openclientportfolio.htm'">Client Portfolio </a> </li>
        </ul>
      </li>
      <li class="active"> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/et/getTxnSource.htm'">File Uploads </a> </li>
      <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/et/getbulkuploadtransactiohistorydetails.htm?queueId=0'">Transaction History </a> </li>
      <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/loadreportAdWiseCilentPortfolioSummary.htm'">Reports</a> </li>
      <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/et/loadAvailablePrePrintedForms.htm?clientPartyId=0&ownerPartyId=${sessionScope.userSession.partyId}'">Preprinted Form</a> </li>
      <li id="autoAllocatedAssetsLink"> <a onclick="window.location.href='<%=request.getContextPath()%>/et/assetAutoAllocation.htm'">Auto Allocated Assets</a> </li>
      <li id="autoAllocatedAssetsLink"> <a onclick="showPasswordDialog();">MF Auto Upload</a> </li>
    </ul>
    <div class="tab-content">
      <div id="" class="tab-pane fade in active clearfix">
       <div class="col-md-2 sidebar-offcanvas" role="navigation" style="margin-top:17px; padding-left:10px;" >
	            	<div class="list-group">
		        		<a class="list-group-item active" href="#">RTA File Uploads</a>
		                <a href="<%=request.getContextPath() %>/et/getTxnSource.htm" id="NewUploadViewLink" class="list-group-item">New Upload  </a>
		                <a href="<%=request.getContextPath() %>/et/showuploadhistory.htm" class="list-group-item" id="UploadHistoryViewLink"><strong>Upload History</strong></a>
		            </div>
	       		</div>
	       		<div class="col-md-10" >
       				<div class="list-group">
        				
						<div class="list-group-item">
    						<div class="space"></div>
       	  					<div class="space"></div>
								<div id="jqGrid_container">
       	  							<table id="grid-table"></table>
									<div id="grid-pager"></div>
								</div>	
						</div>
						</div>
   					</div>
			
      </div>
      <div id="" class="tab-pane fade"> </div>
      <div id="" class="tab-pane fade"> </div>
      <div id="" class="tab-pane fade"> </div>
    </div>
  </div>
    	
                  <!--<div class="page-header clearfix">
                     <h1 class="pull-left">
                     RTA File Uploads
                     </h1>
                     </div>-->
       		<!--<div class="container-body">
	      		<div class="col-md-2 sidebar-offcanvas" role="navigation" style="margin-top:17px; padding-left:10px;" >
	            	<div class="list-group">
		        		<a class="list-group-item active" href="#">RTA File Uploads</a>
		                <a href="<%=request.getContextPath() %>/et/getTxnSource.htm" id="NewUploadViewLink" class="list-group-item">New Upload  </a>
		                <a href="<%=request.getContextPath() %>/et/showuploadhistory.htm" class="list-group-item" id="UploadHistoryViewLink"><strong>Upload History</strong></a>
		            </div>
	       		</div>
	       		<div class="col-md-10" >
       				<div class="list-group">
        				
						<div class="list-group-item">
    						<div class="space"></div>
       	  					<div class="space"></div>
								<div id="jqGrid_container">
       	  							<table id="grid-table"></table>
									<div id="grid-pager"></div>
								</div>	
						</div>
						</div>
   					</div>
				</div>-->
			<!-- modal pop up for action -->
			<div class="modal fade" id="popUpAction" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    				<div class="modal-content">
    					<div class="modal-header">
				        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        	<h4 class="modal-title" id="myModalLabel">Action</h4>
				      	</div>
				      	<div class="modal-body">
				      		<!-- <div class="row" >
    							<div class="list-group" >
    								<div class="row"> -->
	    								<table class="table table-bordered table-striped" width="100%">
								          <tbody>
								            <tr>
								              <th class="thead">Action List</th>
								            </tr>
								            <tr>
								              <td id="ViewErrorCountLink">
								            		<i class="" ></i>
								            		<a href="#" class="" >
								            			<span class="">View Error Count</span>
								            		</a>
								            	</td>
								            </tr>
								             <tr>
								            	<td id="ViewUploadedTransactionsLink"> 
									            	<i class=""> </i>
									            	<a>
									            		<span class="">View Uploaded Transaction</span>
									            	</a>
								            	</td>
								            </tr>
						             
								            <%-- <tr>
								            	<td id="ReprocessLink">
								            		<i class=""></i>
								            		<a href="#" onClick="confirmReprocess(${data.batchId})" class="">
								            			<span class="">Reprocess</span>
								            		</a>
								            	</td>
								            </tr> --%>
								          </tbody>
								        </table>
    								<!-- </div>
    							</div>
    						</div> -->
				      	</div>
    				</div>
    			</div>
    		</div>
		  	<!-- modal pop up for action closed -->
		  	
		  	<!-- modal pop up for action -->
			<div class="modal fade" id="popErrCount" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    				<div class="modal-content">
    					<div class="modal-header">
				        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        	<h4 class="modal-title" id="myModalLabel">Error Count</h4>
				      	</div>
				      	<div class="modal-body" style="position:relative;height:550px;overflow:auto;">
				      		
	 						<table class="table table-bordered table-striped" width="100%" id="errordetailstable">
			        			<tr>
			            			<th>Record No</th>
			                		<th>Failure Type </th>
			                		<th>Error Description </th>
			            		</tr>
			        		</table>
    								
				      	</div>
    				</div>
    			</div>
    		</div>
		  	<!-- modal pop up for action closed -->
    </section>   	
	<jsp:include page="../common/footer.jsp" />

 	<script type="text/javascript">
		var grid_data=${txns};
		index=grid_data;
		jQuery(function($) {
			var grid_selector = "#grid-table";
			var pager_selector = "#grid-pager";
				
			$(window).bind('resize', function() {
			    var width = $('#jqGrid_container').width();
			    $('#grid-table').setGridWidth(width);
			});
				
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
		
				data: index,
				datatype: "local",
				//width:590,
				height: '100%',
				//shrinkToFit: false,
				
				colNames:['batchId','Created Date','Batch Id','File Type','FileName','Status','Error Count','Record Count','Source Type','Action'],
				colModel:[
					
					{name:'batchId',index:'batchId', width:10,hidden:true},
					{name:'createdDate',index:'createdDate', width:150},
					{name:'batchId',index:'batchId', width:80},
					{name:'transactionType',index:'transactionType', width:230},
					{name:'fileName',index:'fileName', width:355},
					{name:'status',index:'status', width:100},
					{name:'errorCount',index:'errorCount', width:100},
					{name:'recordCount',index:'recordCount', width:100},
					{name:'uploadSourceType',index:'uploadSourceType', width:100},
					{name:'action',index:'action',formatter:function(cellvalue, options,rowObject) {
					    return '<a onclick="openActionPopup('+rowObject.batchId+')">Action</a>';
					}},
				], 
				
			
				viewrecords : true,
				rowNum:10,
				rowList:[10,20,50,100,1000],
				pager : pager_selector,
				altRows: true,
				multiselect: false,
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
			
				//editurl: "/dummy.html",//nothing is saved
				/* autowidth:true,
				shrinkToFit:true,
				caption: "Tracking History", */
				
				});
				
				
				
				/* $(grid_selector).jqGrid('setCaption', captionName);
				$(window).triggerHandler('resize.jqGrid'); *///trigger window resize to make the grid get the correct size
				
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
						/* recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						} */
					},
					{
						//new record form
						//width: 700,
						/* closeAfterAdd: true,
						recreateForm: true,
						viewPagerButtons: false,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
							.wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						} */
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
				
				}
				
				//unlike navButtons icons, action icons in rows seem to be hard-coded
				//you can change them like this in here if you want
				function updateActionIcons(table) {
					
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
		function openActionPopup(batchId){
			//alert(batchId);
			
			$('#ViewErrorCountLink a').attr('onClick','getErrorDetails('+batchId+')');
			$('#ViewUploadedTransactionsLink a').attr('href','${pageContext.request.contextPath}/et/getbulkuploadtransactiohistorydetails.htm?queueId='+batchId);
			/* $( ".action_dialog" ).removeClass('hide').dialog({
				resizable: false,
				modal: true,
                width: "auto",
			});  */
			$('#popUpAction').modal('show');
		}
			
			
		</script>
		<%-- <div class="common_dialog hide action_dialog" id="action_dialog_box">
			<table>
        		<tbody>
       				<tr>
            			<th class="">Action List</th>
            		</tr>
		            <tr>
		            	<td id="ViewErrorCountLink">
		            		<i class="" ></i>
		            		<a href="#" class="" >
		            			<span class="">View Error Count</span>
		            		</a>
		            	</td>
		            </tr>
		            <tr>
		            	<td id="ViewUploadedTransactionsLink"> 
			            	<i class=""> </i>
			            	<a>
			            		<span class="">View Uploaded Transaction</span>
			            	</a>
		            	</td>
		            </tr>
             
		            <tr>
		            	<td id="ReprocessLink">
		            		<i class=""></i>
		            		<a href="#" onClick="confirmReprocess(${data.batchId})" class="">
		            			<span class="">Reprocess</span>
		            		</a>
		            	</td>
		            </tr>
        		</tbody>
        	</table>
        </div> --%>
</body>
</html>