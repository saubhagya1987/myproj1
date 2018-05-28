<!DOCTYPE html>
<%@page import="org.apache.xmlbeans.impl.xb.xsdschema.IncludeDocument.Include"%>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Add New Query</title>
<style type="text/css">
a { cursor: pointer; }
</style>
</head>
<body>
<jsp:include page="header.jsp" />
        
        <!-- Center part start -->
        <section>
          <form id="addQueryForm"  name="FileUploadForm" class="form-horizontal"
			action="<%=request.getContextPath()%>/query/saveQuery.htm"  enctype="multipart/form-data" 
			method="post">
				<input type="hidden" id="notes" name="notes"/>
            <div class="">
              <div class="page-header">
                <h1>Add New Query</h1>
              </div>
              <div class="container-body"> 
                <!--Personal Details Start -->
                
                <div class="widget-box" style="margin-top:10px;">
                  <div class="widget-header">
                    <h5 class="widget-title">Details</h5>
                  </div>
                  <div class="widget-body">
                    <div class="widget-main clearfix"> 
                      <!-- row 1 start-->
                      <div class="row">
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="queryType">Query Type <span class="red">*</span></label>
                          <div class="col-sm-9">
                            <select name="queryType" id="queryType" class="input-xxlarge">
                            </select>
                          </div>
                        </div>
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="queryFor">Query For <span class="red">*</span></label>
                          <div class="col-sm-9">
                            <div class="radio ">
                              <label>
                                <input name="queryFor" type="radio" class="ace" value="Self" checked>
                                <span class="lbl">Self</span> </label>
                              <label>
                                <input name="queryFor" type="radio" class="ace" value="My Contact">
                                <span class="lbl">My Contact</span> </label>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- row 1 end--> 
                      <!-- row 2 start-->
                      <div class="row">
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="queryTo">Query To <span class="red">*</span></label>
                          <div class="col-sm-9">
                            <select name="queryTo" id="queryTo" class="input-xxlarge">
                              <option value="1">Self</option>
                              <option value="2">Harish Barke [PST]</option>
                              <option value="3">Chetan Desai [PKT]</option>
                              <option value="4">Kiran Nanda [POT]</option>
                            </select>
                          </div>
                        </div>
                        <div class="form-group col-md-6 clearfix"> <span id="contactlist" class="hide">
                          <div class="col-md-6 searchpadding">
                            <select name="contactType" id="contactType" onchange="getContactList()"
										class="input-xxlarge">
                            </select>
                          </div>
                          <div class="col-md-6 searchpadding">
                            <input type="text" name="contactId" id="contactId" class="input-xxlarge contactList"/>
                            <div id="contactId_error" class="help-block hide">Please add valid contact.</div>
                          </div>
                          </span> </div>
                      </div>
                      <!-- row 2 End--> 
                      <!-- row3 start-->
                      <div class="row">
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="subject">Subject <span class="red">*</span></label>
                          <div class="col-sm-9">
                            <input type="text" id="subject" name="subject" validate="1" emsg="Subject"
									class="input-xxlarge" placeholder="Subject">
                            <div id="subject_error1" class="help-block hide">Please provide query subject.</div>
                          </div>
                        </div>
                      </div>
                      <!-- row 2 End--> 
                    </div>
                  </div>
                </div>
                <!--Personal Details End --> 
                
                <!--Notes Start -->
                <div class="widget-header northspace2">
                  <h5 class="widget-title">Notes</h5>
                </div>
                <div class="widget-box northspace0">
                  <div class="widget-body">
                    <div class="widget-main clearfix"> 
                      <!-- row 1 start-->
                      <div class="row">
                        <div class="form-group col-md-12 clearfix">
                          <div class="col-md-12 ">
                            <div name="description" id="description"
 									style="height: 120px;" class="wysiwyg-editor fullwid"> </div>
 								
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--Notes End --> 
                <!--Attachments Start -->
                <div class="widget-box" style="margin-top:10px;">
                  <div class="widget-header">
                    <h5 class="widget-title">Attachments</h5>
                  </div>
                  <div class="panel-body">
                    <div class="row">
                      <div class="form-group col-md-6 clearfix">
                        <label class="col-sm-3 control-label no-padding-right"
								for="attachmentDivToClone">Add Attachments</label>
                        <div class="col-sm-7" id="attachmentDivToClone">
                          <input type="file" name="queryAttachment" id="queryAttachment1"
									style="display: none;">
                          <input type="file"
									name="queryAttachment" id="queryAttachment2"
									style="display: none;">
                          <input type="file"
									name="queryAttachment" id="queryAttachment3"
									style="display: none;">
                        </div>
                      </div>
                      <div class="form-group col-md-6 clearfix">
                        <label class="col-sm-3 control-label no-padding-right"></label>
                        <div class="col-sm-9"> </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="space-8"></div>
              <div class="topmenu pull-right" style="margin-right: 20px;">
                <input class="btn-primary btn btn-xs" type="button" value="Save & New"
						 onclick="saveQuery(0)">
                <input  class="btn-primary btn btn-xs" type="button"
						value="Save & Close" name="Save & Close" onclick="saveQuery(1)"/>
                <a href="<%=request.getContextPath()%>/query/getQueryList.htm">
                <input class="btn-primary btn btn-xs"
						type="button" value="Cancel" name="Cancel">
                </a> </div>
            </div>
          </form>
          <!--Attachments End --> 
          
          <!-- center end --> 
          
        </section>
        <!-- Center part End -->
        
        <jsp:include page="../common/footer.jsp" />
<script>
makeEditor('description');
var userLabelValueList = new Array();
var contactId=0;
$("#contactId").keydown(function() {
	contactId=0;
	});

$(function() {
	showSelectedTab('queryLink');
	
	if($('#queryMessage').val()=='success'){
		showAlertMessage1("Message",
				"<br/>Query saved successfully.",
				"information", redirectFurther);
	}else if($('#queryMessage').val()=='fail'){
		showAlertMessage1("Error",
				"The connection to the server has been lost. Please try again later.",
				"error", doNothing);
	}else if($('#queryMessage').val()!=''){
		showAlertMessage1("Error",
				$('#queryMessage').val(),
				"error", doNothing);
	}
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=20,15',
			success : function(result) {
				$('#queryType').empty();
				$(result).each(function(i,obj) {
					var codeTypeId=obj.codeTypeId;
					var codeValue=obj.codeValue;
					var codevalueId=obj.codeValueId;
					if(codeTypeId==20){
					$('#queryType').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
					}else if(codeTypeId==15){
						$('#contactType').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
					}
					
				});
				$('#queryTo').empty();
				$('#queryTo').append('<option value="'+$('#partyIdHidden').val()+'">Self</option>');
				/* $.ajax({
					type : "POST",
					url : $('#contextPath').val()+'/common/getAllocatedTeamMembers.htm',
					success : function(result) {
						$(result).each(function(i,obj) {
							var pstName=obj.pstName;
							var mstName=obj.mstName;
							var fpaName=obj.fpaName;
							var mst2Name=obj.mst2Name;
							
							var pstDepartmentName=obj.pstDepartmentName;
							var mstDepartmentName=obj.mstDepartmentName;
							var fpaDepartmentName=obj.fpaDepartmentName;
							var mst2DepartmentName=obj.mst2DepartmentName;
							
							var pstPartyId=obj.pstPartyId;
							var mstPartyId=obj.mstPartyId;
							var fpaPartyId=obj.fpaPartyId;
							var mst2PartyId=obj.mst2PartyId;
							
							$('#queryTo').empty();
							
							$('#queryTo').append('<option value="'+$('#partyIdHidden').val()+'">Self</option>');
							if(pstPartyId!=0){
								$('#queryTo').append('<option value="'+pstPartyId+'">'+pstName+' ['+pstDepartmentName+']</option>');
							}
							if(mstPartyId!=0){
								$('#queryTo').append('<option value="'+mstPartyId+'">'+mstName+' ['+mstDepartmentName+']</option>');
							}
							if(fpaPartyId!=0){
								$('#queryTo').append('<option value="'+fpaPartyId+'">'+fpaName+' ['+fpaDepartmentName+']</option>');
							}
							if(mst2PartyId!=0){
								$('#queryTo').append('<option value="'+mst2PartyId+'">'+mst2Name+' ['+mst2DepartmentName+']</option>');
							}
						});
						
					}
				}); */
			}
		});
		
		
		$('#queryMessage').val('');
	
});
$('input[name="queryFor"]').change(function (event) {
	removeCssStyles('contactId');
	if($(this).val()=='Self'){
	$('#contactlist').addClass('hide');
	 $("#show").show();
	}else{
		$('#contactlist').removeClass('hide');
		$('#contactType').val(15002);
		getContactList();
		 $("#show").hide();
	}
});
$('#queryAttachment1').change(function() {
	$('#queryAttachment1dailog').hide();
	$('#queryAttachment1name').html($('#queryAttachment1').val().substring($('#queryAttachment1').val().lastIndexOf('\\')+1)+' <a onclick="removeattachment(\'queryAttachment1\')">Remove</a>');
	$('#queryAttachment1name').show();
});
$('#queryAttachment2').change(function() {
	$('#queryAttachment2dailog').hide();
	$('#queryAttachment2name').html($('#queryAttachment2').val().substring($('#queryAttachment2').val().lastIndexOf('\\')+1)+' <a onclick="removeattachment(\'queryAttachment2\')">Remove</a>');
	$('#queryAttachment2name').show();
});
$('#queryAttachment3').change(function() {
	$('#queryAttachment3dailog').hide();
	$('#queryAttachment3name').html($('#queryAttachment3').val().substring($('#queryAttachment3').val().lastIndexOf('\\')+1)+' <a onclick="removeattachment(\'queryAttachment3\')">Remove</a>');
	$('#queryAttachment3name').show();
});
function openFileDailog(id){
	$('#'+id).click();
}
function removeattachment(id){
	$('#'+id+'dailog').show();
	$('#'+id+'name').html('');
	$('#'+id+'name').hide();
	$('#'+id).val('');
}

function saveQuery(isToClose){	
	localStorage.setItem('isToClose',isToClose);
	var isValidated=true;
	isValidated=validateInputForm('addQueryForm');

	 if ($.trim($('#subject').val()) == '') 
	{	
		$('#subject').css('border-color','#d16e6c');
		$('#subject_error1').removeClass('hide');
		$('#subject_error1').css('color','#d16e6c');
		isValidated = false;
		
	}
	else{				
		$('#subject_error1').addClass('hide');				
		$('#subject').css('border-color','#d5d5d5');
	} 
	
	if($('input[name="queryFor"]:checked').val()=='Self'){
		$('#contactType').val(0);
		$('#contactId').val('${sessionScope.userSession.partyId}');
		contactId='${sessionScope.userSession.partyId}';
	}else if($('input[name="queryFor"]:checked').val()=='My Contact'){
		if($.trim($('#contactId').val())=='' || contactId==0){
			$('#contactId').css('border-color','#d16e6c');
			$('#contactId_error').removeClass('hide');
			$('#contactId_error').css('color','#d16e6c');
			if(isValidated==true){
				showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
			}
			isValidated=false;
		}else{
			$('#contactId_error').addClass('hide');				
			$('#contactId').css('border-color','#d5d5d5');			
		}
	}else{
		isValidated=false;
	}
	
var res=checkSelectedUserInHierarchy();
if(res==true)
{		
	if(isValidated==true){
		var data = $('#addQueryForm').find('.wysiwyg-editor').text();
	
		  $('#notes').val(data);
		  $('#contactId').val(contactId);
		  if($('input[name="queryFor"]:checked').val()=='Self'){
			  $('#contactType').append('<option value="0">Self</option>');
			  $('#contactType').val(0);
		  }
			$('#addQueryForm').submit();
	}
	}
}
function split( val ) {
    return val.split( /;\s*/ );
  }
  function extractLast( term ) {
    return split( term ).pop();
  }
//function to fetch list of users for chat
function getContactList() {
	userLabelValueList = new Array();
	removeCssStyles('contactId');
	recordType=$('#contactType').val();
	loggedInUserPartyId=$('#partyIdHidden').val();
	$('#contactId').val('');
	contactId=0;
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()
				+ '/common/getUserList.htm?loggedInUserPartyId='
				+ loggedInUserPartyId + '&recordType=' + recordType,
		success : function(result) {
			result = JSON.parse(result);
			$(result).each(
					function(i, obj) {
					var object = {};
					object.value = obj.partyId;
					object.label = obj.name;
					userLabelValueList.push(object);
					});
				
				$(".contactList")
			    // don't navigate away from the field on tab when selecting an item
			    .bind( "keydown", function( event ) {
			      if ( event.keyCode === $.ui.keyCode.TAB &&
			          $( this ).data( "ui-autocomplete" ).menu.active ) {
			        event.preventDefault();
			      }
			    })
			    .autocomplete({
			      minLength: 0,
			      source: function( request, response ) {
			        // delegate back to autocomplete, but extract the last term
			    	  response( $.ui.autocomplete.filter(userLabelValueList, request.term) );
			      },
			      focus: function() {
			        // prevent value inserted on focus
			        return false;
			      },
			      select: function( event, ui ) {
			    	  var terms = split( this.value );
				        terms.pop();
				        terms.push(ui.item.label);
				        contactId=ui.item.value;
				        terms.push( "" );
				        this.value = terms.join( "" );
				        var labelArr = $(this).data('label') || new Array();
				        labelArr.push(ui.item);
				        $(this).data('label',labelArr);
				        console.log($(this).data());
				        
				        return false;
			      }
			    });
		}
	});
}

function redirectFurther(){
	var isToClose=localStorage.getItem('isToClose');
	localStorage.setItem('isToClose','0');
	if(isToClose=='1'){
		window.location.href=$('#contextPath').val()+'/query/getQueryList.htm';
	}else{
		window.location.reload();
	}
}

</script>
<% 
String queryResult=""; 
queryResult=session.getAttribute("QueryResult")==null?"":session.getAttribute("QueryResult").toString();
if(queryResult.equals("success")){
	session.setAttribute("QueryResult","");
	%>
<input type="hidden" id="queryMessage" value="success"/>
<%
}else{
	session.setAttribute("QueryResult","");
	%>
<input type="hidden" id="queryMessage" value="<%=queryResult%>"/>
<%
}
%>
</body>
</html>