<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Bulk Upload Opportunity</title>


</head>

<body>

	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/common_popup.jsp" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.caret.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>

				<form id="bulkUploadForm" method="post"
					action="<%=request.getContextPath()%>/opportunity/importBulkOpportunities.htm"
					enctype="multipart/form-data" name="bulk_upload_form">

					<div class="row">
						<div class="form-group col-md-11">


                  				<div class="col-lg-6 well well-sm clearfix">
                                <div class="col-md-4">
                                <label class="control-label strong"
										for="BrowseFile">Browse file From here :</label>
                             </div> 
                             <div class="col-md-6">          
								<input type="file" name="leadUpload" id="leadUploadFileName_browse"   readonly="readonly" class=""></div>
             <div class="col-md-2">                             
		<div class="btn-primary btn-xs btn" id="leadUploadFileName_browse" name=leadUpload  onclick="validateData();">Upload</div>
        </div>
        </div>
<div class="col-lg-1"></div>
							<div class="col-lg-5 well well-sm clearfix">
                            <label class="col-md-4 control-label strong"
										for="BrowseFile">Download file -</label>
                                        
							<div class="col-md-8">	
								<a onclick="downloadAttachmentDownload()" title="Download Sample Template to upload Opportunities in Bulk">OpportunityBulkUploadTemplate.xls</a>
							</div>
                            </div>

					</div>
					</div>
				</form>


					<div class="">
						<div class="col-md-12">
							<div id="no_record_hide">
								<input type="hidden" id="statusMessage" value="success">
								<div id="validRecordList">
									<div class="panel panel-default">
										<div class="panel-heading">Successful Records</div>
										<div class="panel-body">
											<div class="table-responsive"												
												id="success_lead_table">
												<table id="grid-table1">
                								</table>																
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="">
						<div class="col-md-12">
							<input type="hidden" id="statusMessage" value="success">
							<div id="lstInvalidLeads">
								<div class="panel panel-default">
									<div class="panel-heading">Failed Records</div>
									<div class="panel-body">
										<span style="color: grey">One or more mandatory
												details are missing in the Failed Records list given below.
												Please fix and upload again</span><br />
										<div class="table-responsive"											
											id="failed_lead_table">
											
												
												<table id="grid-table2">
                								</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

		<jsp:include page="../common/footer.jsp" />
		<form id="downloadAttachmentForm" method="post"
			action="<%=request.getContextPath()%>/common/downloadDocument.htm">
			<input type="hidden" name="docId" id="documentIdToDownload">
		</form> 
</body>


<script type="text/javascript">

		    function validateData(){
		 			if($('#leadUploadFileName_browse').val()=='')
		 			 {
		 			        showAlertMessage("Message","<br/>"+"Please Select File", "information",
		 					doNothing);
		 			         $("#statusMessage").empty();
		 		     }
		 			else
		 			{
							var uploadFile=$('#leadUploadFileName_browse').val();
		 					var sFileExtension = uploadFile.split('.')[uploadFile.split('.').length - 1].toLowerCase();
		 					
		 					if (!(sFileExtension === "xls" || sFileExtension === "xlsx")) { 				            				          
		 				          showAlertMessage("Message", "Please make sure your file is in xls or xlsx format.", "error",
		 									doNothing);
		 					}else{
		 								 					    
		 					    $('#success_lead_table').empty();
		 						$('#bulkUploadForm').ajaxForm({
		 					         success: function(result) {
		 		
		 					        	loadGrid(result[0],'success_lead_table','grid-table1','grid-selector1');
		 					        	loadGrid(result[2],'failed_lead_table','grid-table2','grid-selector2');

		 					         },
		 					         error: function(msg) {
		 					         }, onComplete: function (data) {
		 					         }
		 					     }).submit();
		 					} 			
		 			}
		}
	
function downloadAttachmentDownload() {
	window.location.href= $('#contextPath').val()+'/common/downloadAttachmentDownload.htm';
}	

</script>

<script type="text/javascript"> 
function loadGrid(grid_data,divId,tableId,selectorid){
	$('#'+divId).empty();
	$('#'+divId).append('<table id="'+tableId+'"></table><div id="'+selectorid+'"></div>');
		
	console.log('grid_data:---'+grid_data);
	
	
	var index=new Array();
	$(grid_data).each(function(i,obj) { //loop through each checkbox
        console.log('name:---'+obj.firstName);
        console.log('lastName:---'+obj.lastName);
        console.log('contactMobile:---'+obj.contactMobile);
        console.log('contactEmail:---'+obj.contactEmail);
        var object = {};
		object.firstName = obj.firstName;
		object.lastName=obj.lastName;
		object.contactMobile=obj.contactMobile;
		object.contactEmail=obj.contactEmail;
		index.push(object);
        
        });
	
	
// 	var grid_data1 = '${lstSuccessOpportunity}';
// 	alert('Success---'+grid_data1);
// 	index=JSON.parse(grid_data1);
// // 	alert('In-----ewqewqrwerwe11111--'+grid_data1);
	
// 	var grid_data2 = '${lstFailedOpportunity}';
// 	alert('fail---'+grid_data2);
// 	index=JSON.parse(grid_data2);
// // 	alert('In-----weqweqweqwe2222222222222--'+grid_data2);

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
	
		var grid_selector = "#"+tableId;
// 		var grid_selector2 = "#grid-table2";
		var pager_selector = "#"+selectorid;
		
		//resize to fit page size
		$(window).on('resize.jqGrid', function () {
		//	$(grid_selector).jqGrid( 'setGridWidth', $(".page-content").width() );
	    });
		//resize on sidebar collapse/expand
		var parent_column = $(grid_selector).closest('[class*="col-"]');
		$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
			if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
				//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
				setTimeout(function() {
				//	$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
				}, 0);
			}
	    });
		
// 		var parent_column2 = $(grid_selector2).closest('[class*="col-"]');
// 		$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
// 			if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
// 				//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
// 				setTimeout(function() {
// 				//	$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
// 				}, 0);
// 			}
// 	    });



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
// 			url:$('#contextPath').val()+'/opportunity/getOpportunitiesGrid.htm?value=${value}',
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
				colNames:['First Name','Last Name','Contact Number','Contact Email'],
				colModel:[
					/*{name:'myac',index:'', width:40, fixed:true, sortable:false, resize:false,
						formatter:'actions', 
						formatoptions:{ 
							keys:true,
							delbutton: false,//disable delete button
							
							delOptions:{recreateForm: true, beforeShowForm:beforeDeleteCallback},
							//editformbutton:true, editOptions:{recreateForm: true, beforeShowForm:beforeEditCallback}
						}
					},*/
					
					{name:'firstName', index:'firstName', width:200,},
					{name:'lastName',index:'lastName', width:200,},
					{name:'contactMobile',index:'contactMobile',width:200,},
					{name:'contactEmail',index:'contactEmail',width:300},
				], 			
		
						
				viewrecords : true,
				rowNum:10,
				rowList:[10,20,50,100,1000],
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
						        cheackBoxCount()
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
			/* function aceSwitch( cellvalue, options, cell ) {
				setTimeout(function(){
					$(cell) .find('input[type=checkbox]')
						.addClass('ace ace-switch ace-switch-5')
						.after('<span class="lbl"></span>');
				}, 0);
			} */
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
					search: false,
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
				form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:false})
				
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
	}



</script> 
</html>