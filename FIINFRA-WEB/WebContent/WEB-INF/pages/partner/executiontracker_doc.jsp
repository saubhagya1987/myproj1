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
	<title>Execution Tracker : Document</title>
</head>
<body>
	
<div class="modal fade" id="popUpConvertClient" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display:none;">
  <div class="modal-dialog">
  	<form name="uploadDocument" id="uploadDocument"  modelAttribute="doc" action="<%=request.getContextPath() %>/et/uploadDoc.htm" enctype="multipart/form-data">
     
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Document</h4>
      </div>
      <div class="modal-body">
  <div class="row" >
    <div class="list-group" id="changePasswordDetailsDiv" >
            
              <div class="row">
              <div class="form-group col-md-12 clearfix">
                <!-- <label class="col-sm-3 control-label no-padding-right" for="convertNote">Convert Note<span class="red">*</span></label> -->
                <div class="col-sm-9">
                  <input class="btn dbtn" type="file" name="files" id="files"  multiple value="Choose File" name="Choose File" >
                  <div id="files_error" class="help-block hide">Please select atleast one file to upload</div> 
                </div>
              </div>
              </div>
              <div class="row">
              <div class="form-group col-md-12 clearfix">
                <label class="col-sm-3 control-label no-padding-right" for="buttons"></label>
                <div class="col-sm-9">
                 
                </div>
              </div>
              </div>
        
      
    </div>
  </div>
  
  </div>
    <div class="modal-footer">
		 <div id="Save" class="btn btn-primary btn-xs  createNewBtn pull-right"  onclick="uploadDoc();">
									<i class="ace-icon fa fa-check bigger-110"></i>
									Save
								</div>
	</div>
  
  </div>
  </form>
  </div></div>
	
	
	<div style="display: none;" id="blanket"></div>
	<div style="display: none; width:500px; height:400px; top:100px;top:0px !important;left:500px !important;" id="popUpAlertaddnote" class="alert">
		<div class="close" style="margin-right:10px;">
			<a onClick="popup('popUpAlertaddnote')" href="#">
				<img alt="" src="<%=request.getContextPath() %>/images/btn_close.gif" />
			</a>
		</div>
		<form name="uploadDocument" id="uploadDocument"  modelAttribute="doc" action="<%=request.getContextPath() %>/et/uploadDoc.htm" enctype="multipart/form-data">
			<div id="addnote">
	    		<div id="popupwrapper_contactform">
	   				<div class="heading_contactform"><h3> Add Document</h3></div>
	        		<div id="poptable_contactform" style="padding:10px;">
	        			<div class="col-md-2 searchpadding padding_top">Browse </div>
	            		<div class="col-md-8 searchpadding ">
	              			<input class="btn dbtn" type="file" name="files" id="files" multiple value="Choose File" name="Choose File" > No file chosen <br>
	              			   <div id="files_error" class="help-block hide">Please select atleast one file to upload</div>
	            		</div>
	 				</div>
					<div class="topbuttonholder pull-right">
	        			<input class="btn btn-primary btn-xs  createNewBtn" value="Save" id="Save" type="button" onClick="uploadDoc();">	
	            		<input class="btn btn-primary btn-xs  createNewBtn" value="Cancel" id="Cancel" type="button" onclick="popup('popUpAlertaddnote')">	
					</div>
	        	</div>
			</div>
		</form>    
    	<!-- delete-->
    	<div id="deletenote">
    		<div id="popupwrapper_contactform">
		  		<div class="heading_contactform"><h3> Message</h3></div>
		        <div id="poptable_contactform" style="padding:10px;">
        			Do you want to delete selected Documents?
 				</div>
  				<div class="topbuttonholder">
        			<form>
        				<input class="dbtn" value="Yes" id="Yes" type="button" onClick="deleteDoc();">	
            			<input class="dbtn" value="No" id="No" type="button" onClick="popup('popUpAlertaddnote');">
           			</form>	
        		</div>
        	</div>
		</div>
		
		<!-- delete-->
		<div id="editnote">
    		<div id="popupwrapper_contactform">
				<div class="heading_contactform"><h3> Edit Note</h3></div>
        		<div id="poptable_contactform" style="padding:10px;">
        			<textarea class="form-control" rows="5">Evaluate every active client and opportunity against all available and active Tags that match this client and build up the matching tag list for each such record.</textarea>
 				</div>
				<div class="topbuttonholder">
        			<form>
        				<input class="dbtn" value="Save" id="Save" type="button">	
            			<input class="dbtn" value="Cancel" id="Cancel" type="button" onclick="popup('popUpAlertaddnote')">
           			</form>	
        		</div>
        	</div>
		</div>
	</div>
 	<jsp:include page="../common/header.jsp"></jsp:include> 	
 	<jsp:include page="../common/common_popup.jsp" />
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
  						<a class="list-group-item active" href="#">Document </a>
  						<div class="list-group-item">
      	 					<div class="topmenu">
								<div class="pull-right">
								<button class="dbtn importNewBtn btn btn-primary btn-xs" title="Add Document"
									onclick="addNote();">
									<i class="fa fa-plus"></i> Add </button>
								
								<button class="dbtn importNewBtn btn btn-danger btn-xs" title="Delete Document"
									onclick="deleteDoc();">
									<i class="fa fa-trash"></i> Delete </button>
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
	<input type="hidden" id="fpActionPlanId" value="${param.fpActionPlanId}"/>
	<form id="downloadAttachmentForm" name="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocument.htm">
		<input type="hidden" name="docId" id="documentIdToDownload">
	</form>

<script>
	function enableTf2(){
		
		$("#stageType, #save1, #cancel1").show();
		$('#manufacturer').prop("enable", true);
	}
</script>

<script>
var list = new Array();
function addNote(){
	$('#popUpConvertClient').modal('show') ;
}

function deleteNote(){
	
	$("#deletenote").show();	
	$("#addnote, #editnote,#mail").hide();	
	
}

function editNote(){
	
	$("#editnote").show();	
	$("#addnote, #deletenote,#mail").hide();	
	
}
function sendMailPopUpModal(){
	$('#actionList').modal('hide');
	$('#mail').modal('show');
 }

 function sendMailPopUp(documentName,partnerEmailId,contactEmailId){ 
	$('#docName').html(documentName);
	$('#contactEmailId').html(contactEmailId);
	$('#partnerEmailId').html(partnerEmailId); 
	
	$("#deletenote, #editnote,#addnote").hide();	
}

var docId=null;
var partyid=null;
function emailDoc(documentId,partyIdz){
	docId=documentId;
	partyid=partyIdz;
}
function validation(){
	if(!validateEmail($('#emailIds').val())) { 
	alert('Please enter valid email ID');
	return false;
	}
	if($('#emailIds').val() =='') { 
		alert('Please enter email ID');
		return false;
	}
	return true;
}
function validateEmail($email) {
	  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
	  if( !emailReg.test( $email ) ) {
	    return false;
	  } else {
	    return true;
	  }
	}
	
function sendEmail(){
	var mailTo=$('input[name="mailTo"]:radio:checked').val()
	if (mailTo==undefined || mailTo=='undefined'){
		alert('Select atleast one option');
		return;
	}
	
	if(mailTo=="Self"){
		mailTo=$('#contactEmailId').html();
		$('#mail').modal('hide');
	}else if (mailTo=="Contact"){
		mailTo=$('#partnerEmailId').html();
		$('#mail').modal('hide');
	}else if (mailTo=="Custom"){
		if(validation() == true){
			mailTo=$('#').val();
			$('#mail').modal('hide');
			
		}
	}
	
	//showAlertMessage1("Success", "sending mailto :"+mailTo+"confirmation", doNothing);
	
	if(docId!=0 && partyid!=0){
		$.ajax({
			type : "GET",
			url : $('#contextPath').val()+'/et/sendEmail.htm?docId='+docId+'&partyId='+partyid,
			dataType : "json",
			success : function(data){
				if(data=='success'){
					showAlertMessage1("Success", "Email has been sent successfully"+'\n',"confirmation", doNothing);
					
					 
				}else{
					showAlertMessage1("Error",data.error+'\n',"confirmation", doNothing);
				}
				document.getElementById("sendemail").reset();
			} 
		});
	}

}

function uploadDoc(){
	var oMyForm = new FormData();
	var files = document.getElementById('files');
	var oMyForm = new FormData();
	var i=0;
	$.map($('#files').get(0).files, function(file) {
		oMyForm.append("files"+i,file);
		i++;
	});
	var file=$('#files').val();
  if(i==0){
	  if(file==''){
			addCssStyles('files','Please choose file');
			$('#files').css('border','1px solid red');
			$('#files').attr('title','Please enter choose file');
			isValidated=false;
			$('#files_error').removeClass('hide');;
			$('#files_error').parent().parent().parent().addClass('has-error');
		}else{
			removeCssStyles('files');
			$('#files_error').addClass('hide');
			$('#files_error').parent().parent().parent().removeClass('has-error');
		}
	  popup('popUpAlertaddnote');
		  showAlertMessage1("Success",
					'Please select atleast one file to upload\n',
					"confirmation", doNothing);
		 // popup('popUpAlertaddnote');
		  return;
	  }
	// alert($('#fpActionPlanId').val());
	 $.ajax({
	    url:  $('#contextPath').val()+'/et/uploadDoc.htm?fpActionPlanId='+$('#fpActionPlanId').val(),
	    data: oMyForm,
	    dataType: 'text',
	    processData: false,
	    contentType: false,
	    type: 'POST',
	    success: function(data){
	    	$('#popUpConvertClient').modal('hide') ;
	    	var obj = $.parseJSON(data);
	    	if(obj.success!=null){
				
					showAlertMessage("Success",
						"<br/>Document uploaded successfully.",
						"information",reloadPage);
			}else{
				showAlertMessage1("Error",
						data.error+'\n',
						"error", doNothing);
			}
	    	//window.location.href=$('#contextPath').val()+"/et/etDocs.htm?fpActionPlanId="+$('#fpActionPlanId').val();
	    }
	  });
	
}

function deleteDoc(){
	list = new Array();
	var cntr=0;
	$('#grid-table :checked').each(function(i, obj) {
		if($(this).attr('id')!='selectAll' && $(this).attr('id')!='chkdeleteselect' && $(this).attr('id')!='' && $(this).attr('id')!=undefined && $(this).attr('id')!=0){
			list[cntr] = $(this).attr('id');
			cntr+=1;
		}
		
	});
	
	if (list.length == 0) {
		showAlertMessage1("Message",
				"Please select at least one document to delete.",
				"information", doNothing);
	} else{
		var message = "";
		if (list.length == 1) {
			message = "Do you want to delete this document?";
		} else {
			message = "Do you want to delete these document?";
		}
		showAlertMessage1("Message", "<br/>" + message, "question",
				doNothing1);
		$('.ZebraDialog_Button1').attr('href','javascript:deleteSelectedDocs()');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
	}
}





function deleteSelectedDocs(){
	var message = "";
	if (list.length == 1) {
		message = "Document successfully deleted.";
	} else {
		message = "Document successfully deleted.";
	}
	setTimeout(function() {
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/et/deleteEtDocs.htm?docIds=" + list,
			success : function(result) {
			if(result.success!=null){
					localStorage.setItem('actionName',
							$('#contextPath').val()+"/et/etDocs.htm?fpActionPlanId="+$('#fpActionPlanId').val());
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

function viewDoc(docId){
	$('#documentIdToDownload').val(docId);
	document.downloadAttachmentForm.submit();
}

</script>
 
 	<script type="text/javascript">
		var grid_data=${docs};
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
				
				colNames:[' ','documentId','partyId','File Name','Document','Uploaded By','Uploaded On','Action'],
				colModel:[
					{name:'checkbox', index:'checkbox',width:25,sortable:false,formatter:function(cellvalue, options,rowObject) {
					    return '<input role="checkbox" type="checkbox"  class="cbox" id="'+rowObject.documentId+'" name="opportunityCb">';
					}},
					{name:'documentId',index:'documentId', width:5,hidden:true},
					{name:'partyId',index:'partyId', width:5,hidden:true},
					{name:'fileName',index:'fileName', width:380},
					{name:'documentName',index:'documentName', width:470},
					{name:'uploadedBy',index:'uploadedBy', width:100},
					{name:'uploadedOn',index:'uploadedOn', width:140},
					{name:'action',index:'action',width:60,formatter:function(cellvalue, options,rowObject) {
					 
						return '<a onclick="openActionPopup('+rowObject.documentId+','+rowObject.partyId+',\''+rowObject.documentName+'\',\''+rowObject.partnerEmailId+'\',\''+rowObject.contactEmailId+'\')">Action</a>';
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
			function openActionPopup(docId,partyId,documentName,partnerEmailId,contactEmailId){
				$('#downloadDocId a').attr('onClick','viewDoc('+docId+')');
				$('#emailDocId a').attr('onClick','sendMailPopUp(\''+documentName+'\',\''+partnerEmailId+'\',\''+contactEmailId+'\');sendMailPopUpModal();emailDoc('+docId+','+partyId+')');
				$('#actionList').modal('show');
				
			}
			
			$().ready(function(){
				$('#documents').css('font-weight','bold');
			}); 
		</script>

	<div class="modal fade" id="actionList" tabindex="-1"
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

					<table class="table table-bordered table-striped" width="100%"
						cellpadding="0" cellspacing="0">
						<tr>
							<td id="downloadDocId"><i class="download_icon"></i><a
								href="#" onClick="viewDoc(${doc.documentId});"
								style="color: #333;"><span class="user">Download</span></a></td>
						</tr>
						<tr>
							<%-- <td id="emailDocId"><i class="emailicon"></i><a href="#"
								title="${doc.documentName}"
								partnerEmailId="${doc.partnerEmailId}"
								contactEmailId="${doc.partnerEmailId}"
								onClick="emailDoc(${doc.documentId},${doc.partyId});"
								style="color: #333;"><span class="user">Email</span></a></td>
	 --%>					</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	
 <div class="modal fade" id="mail" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<div class="modal-title" id="myModalLabel"><h3>Email Document:</h3><span id="docName"></span></div>
					</div>
					<div class="modal-body">

						<div id="popupwrapper_contactform">
							<h6 style="padding-top: 35px;">Email this document to</h6>
							<div id="poptable_contactform">
								<div>
									<input type="radio" value="Self" name="mailTo">Self</input>[<span
										id="partnerEmailId"></span>]</br> </br> <input type="radio"
										value="Contact" name="mailTo">Contact</input>[<span
										id="contactEmailId"></span>]</br> </br> <input type="radio"
										value="Custom" name="mailTo">Enter EmailId </input> <input
										style="width: 200px;" type="text" id="emailIds" /> </br> </br> </br>
								</div>
							</div>
							
						</div>

					</div>
					<div class="modal-footer">
							<form id="sendemail">
									<input class="btn btn-xs btn-primary" value="Send" id="Send" type="button"
										onClick="sendEmail();">
										<input class="btn btn-xs btn-danger" value="No"
										id="No" type="button" onClick="$('#mail').modal('hide');">
								</form>
						    
					</div>
				</div>
			</div>
		</div> 


</body>
</html>