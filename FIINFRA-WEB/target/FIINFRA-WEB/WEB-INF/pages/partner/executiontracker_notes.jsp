<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>Execution Tracker : Notes</title>
	<style>
	.ui-jqgrid .ui-jqgrid-bdiv {
  position: relative; 
  margin: 0em; 
  padding:0; 
  /*overflow: auto;*/ 
  overflow-x:visible; 
  overflow-y:auto; 
  text-align:left;
}
	</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	
<div class="modal fade" id="popUpConvertClient" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
     <form id="saveForm">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body">
  		    <div id="notediv">
     		<textarea style="height: 100px;" class="form-control"  id="noteText" validate="1" placeholder="Enter your note" emsg="enter Note" name="noteText"></textarea>
     	     <div id="note_error"></div>
     	     </div>
  	  </div>
  	  <div class="modal-footer">
		<div id="Save" class="btn btn-info" ><i class="ace-icon fa fa-check bigger-110"></i>Save</div>
	</div>
	 </form>
   </div>
   </div>
  </div>
	
	
	
	<div style="display: none;" id="blanket"></div>
	<div
		style="display: none; width: 500px; height: 400px; top: 100px !important; left: 535px !important;"
		id="popUpAlertaddnote" class="alert">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpAlertaddnote')" href="#"><img alt=""
				src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
		</div>
		
	</div>
	<!-- Center part start -->
<section>
	    <div class="">
	    	<div class="main-content">
              <div class="main-contnet-inner">
                <div class="page-content">
                  <div class="page-header clearfix">
                     <h1 class="pull-left">
                     Execution Tracker for <c:choose>
							<c:when test="${sessionScope.clientType==14006}">
								<i title="Client" class="clienticon"> </i>
							</c:when>
							<c:when test="${sessionScope.clientType==14007}">
								<i title="PClient" class="pclienticon"> </i>
							</c:when>
							<c:when test="${sessionScope.clientType==14005}">
								<i class="opportunityicon"></i>
							</c:when>
						</c:choose>${sessionScope.contactName}
                     </h1>
                    </div>
    	
			<div class="container-body">
				<jsp:include page="executiontracker_actions.jsp"></jsp:include>
        		<div class="col-md-9"  style="margin-top:0px; padding-left:10px;" >
					<div class="list-group">
  						<a class="list-group-item active" href="#">Notes </a>
  						<div class="list-group-item">
      	 					<div class="topmenu">
								<div class="pull-right">
								<button class="dbtn importNewBtn btn btn-primary btn-xs" title="Add Notes"
									onclick="addNote(0,'');">
									<i class="fa fa-plus"></i> Add Note</button>
								
								<button class="dbtn importNewBtn btn btn-danger btn-xs" title="Delete Notes"
									onclick="deleteNotes();">
									<i class="fa fa-trash"></i> Delete Note</button>
								</div>
							</div> 
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
		</div>
	</div>
</div>
</div>
</section>	
	<jsp:include page="../common/footer.jsp" />
		<input type="hidden" id="fpActionPlanId"
			value="${param.fpActionPlanId}" /> 
			<input type="hidden" id="noteId" value="0" />
		
<script>
var list = new Array();
	function enableTf2(){
		$("#stageType, #save1, #cancel1").show();
		$('#manufacturer').prop("enable", true);
	}

function addNote(id,notes){
	
	if(id == 0){
		$("#noteText").val('');
		document.getElementById("myModalLabel").innerHTML="Add Note";
		$('#Save').attr('onclick','saveNote(\'saveForm\')');
	} else{
		$("#noteId").val(id);
		document.getElementById("myModalLabel").innerHTML="Edit Note";
		$("#noteText").val(notes);
		$('#Save').attr('onclick','saveNote(\'editForm\')');
	}
	
	//$("#deletenote, #editnote").hide();
	
	$('#popUpConvertClient').modal('show') ;
}
function deleteNotes(){
	list = new Array();
	var cntr=0;
	$('#grid-table :checked').each(function(i, obj) {
		if($(this).attr('id')!='selectAll' && $(this).attr('id')!='chkdeleteselect' && $(this).attr('id')!='' && $(this).attr('id')!=undefined && $(this).attr('id')!=0){
			list[cntr] = $(this).attr('id');
			cntr+=1;
		}
		
	});
	
	if (list.length == 0) {
		bootbox.dialog({
			message: "<span class='bigger-110'>Please select at least one Note to delete.</span>",
			buttons: 			
			{
				"click" :
				{
					"label" : "OK!",
					"className" : "btn-xs btn-primary"
					
				}
			}
		});
		
	} else{
		var message = "";
		if (list.length == 1) {
			message = "Do you want to delete this Note?";
		} else {
			message = "Do you want to delete these Note?";
		}
		
		bootbox.dialog({
			message: "<span class='bigger-110'>"+message+"</span>",
			buttons: 			
			{
				
			
				"click" :
				{
					"label" : "YES!",
					"className" : "btn-xs btn-primary",
					"callback": function() {
						deleteSelectedNote()
						//Example.show("Primary button");
					}
				},
				"danger" :
				{
					"label" : "NO!",
					"className" : "btn-xs btn-danger"
					
				}
			}
		});

	}
}

function editNote(obj){
	popup('popUpAlertaddnote');
	$('#noteTextEdit').val($(obj).attr('class'));
	$('#noteId').val($(obj).attr('id'));
	$("#editnote").show();	
	$("#addnote, #deletenote").hide();	
}

function saveNote(formName){

	if(formName=='saveForm'){
		if($("#noteText").val().trim()==''){
			//alert('Please enter note text.');
			$('#notediv').css('border','1px solid red');
			$('#notediv').attr('title','Please enter Body');
			//$("#note_error").append('Please enter note text.');
			$("#noteText").focus();
			return false;
		}
	}
	
	var noteId=$('#noteId').val();
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/et/saveEtNote.htm?noteId='+noteId+'&fpActionPlanId='+$('#fpActionPlanId').val()+'&noteText='+$('#noteText').val(),
		//data:$('#saveForm').serialize(),
		success : function(result) {
			if(result.success!=null){
				$('#popUpConvertClient').modal('hide') ;
					bootbox.dialog({
						message: "<span class='bigger-110'>You have saved note successfully</span>",
						buttons: 			
						{
							"click" :
							{
								"label" : "OK!",
								"className" : "btn-xs btn-primary",
								"callback": function() {
									//Example.show("Primary button");
									location.reload();
								}
							}
						}
					});
				
				
			
			}else{
				bootbox.dialog({
        			message: "<span class='bigger-110'>"+result.error+"</span>",
        			buttons: {
        				  confirm: {
        					 label: "OK",
        					 className: "btn-primary btn-xs",
        				  }
        				  
        			}
        			
        		});
				
			}
					//popup('popUpAlertaddnote');
		}
	});
}
	
function deleteSelectedNote(){
	
	var message = "";
	if (list.length == 1) {
		message = "Note successfully deleted.";
	} else {
		message = "Note successfully deleted.";
	}
	setTimeout(function() {
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/et/deleteEtNotes.htm?noteIds=" + list,
			success : function(result) {
				if(result.success!=null){
					localStorage.setItem('actionName',
							$('#contextPath').val()+"/et/etNotes.htm?fpActionPlanId="+$('#fpActionPlanId').val());
					
					bootbox.dialog({
						message: "<span class='bigger-110'>"+message+"</span>",
						buttons: 			
						{
							"click" :
							{
								"label" : "OK!",
								"className" : "btn-xs btn-primary",
								"callback": function() {
									location.reload();
									//Example.show("Primary button");
								}
							}
						}
					});
					
					
				}else{
					bootbox.dialog({
						message: "<span class='bigger-110'>The connection to the server has been lost. Please try again later.</span>",
						buttons: 			
						{
							"click" :
							{
								"label" : "OK!",
								"className" : "btn-xs btn-primary",
								"callback": function() {
									location.reload();
									//Example.show("Primary button");
								}
							}
						}
					});
					
				}
				
			}
		});
	}, 500);
	
}
function checkAll(obj){

	if($(obj).is(':checked')){
		$('.checkBox').prop('checked','checked');
	}
	else{
		$('.checkBox').prop('checked',false);
	}
}
$().ready(function(){
	$('#notes').css('font-weight','bold');
});
</script>

<script type="text/javascript">
		var grid_data=${notes};
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
				
				colNames:[' ',' ','Notes','Recorded By','Last Updated On'],
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
							{name:'checkbox', index:'checkbox',width:30,sortable:false,formatter:function(cellvalue, options,rowObject) {
							    return '<input role="checkbox" type="checkbox"  class="cbox" id="'+rowObject.notesId+'" name="opportunityCb">';
							}},
							//{name:'notesId', index:'notesId', width:15,formatter:imageFormat,formatoptions:{baseLinkUrl:'${pageContext.request.contextPath}/addOpportunity.htm?partyId='}},
							{name:'notesId', width:30,index:'notesId',formatter:function(cellvalue, options,rowObject) {
						    	return '<a href="#" onclick="addNote('+rowObject.notesId+',\''+rowObject.notesText+'\');" id="${rowObject.notesId}"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';
							}},
							{name:'notesText',index:'notesText',  width:550, sortable:true,editable: true,edittype:"textarea", editoptions:{rows:"2",cols:"10"}},
							{name:'recordedBy',index:'recordedBy',width:200, editable:false, sorttype:"date",unformat: pickDate},
							{name:'updatedOn',index:'updatedOn', width:250, sortable:false,editable: false} 
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
				alert(batchId);
				
				$('#ViewErrorCountLink a').attr('onClick','getErrorDetails('+batchId+')');
				$('#ViewUploadedTransactionsLink a').attr('href','${pageContext.request.contextPath}/et/getbulkuploadtransactiohistorydetails.htm?queueId='+batchId);
				/* $('#exedtls a').attr('href','${pageContext.request.contextPath}/et/executionDetails.htm?fpActionPlanId='+fpApId);
				$('#preprintform a').attr('href','${pageContext.request.contextPath}/et/openEtForm.htm?fpActionPlanId='+fpApId);
				$('#trackHist a').attr('href','${pageContext.request.contextPath}/et/etTrackingHistory.htm?fpActionPlanId='+fpApId);
				$('#documents a').attr('href','${pageContext.request.contextPath}/et/etDocs.htm?fpActionPlanId='+fpApId);
				$('#etNotes a').attr('href','${pageContext.request.contextPath}/et/etNotes.htm?fpActionPlanId='+fpApId);
				*/
				$( ".action_dialog" ).removeClass('hide').dialog({
					resizable: false,
					modal: true,
                    width: "auto",
				}); 
			}
		</script>
</body>
</html>