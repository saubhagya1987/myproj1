<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<title>RTA File Uploads</title>
 
	<script type="text/javascript">
	function listFileNames(fileComponentId , fileNameLisitingComponent){
		var fileComp = document.getElementById(fileComponentId);
		var fileNameListing = $("#"+fileNameLisitingComponent);
		
		fileNameListing.empty();
		
		for(var i=0 ; i < fileComp.files.length &&  fileComp.files.length!=1 ; i++){
			var file = fileComp.files[i];
			var liComp = "<li>"+ file.name +"</li>";
			//+ "&nbsp;"+"<b> <span onclick=\"deleteFromFileComponent('"+i+"')\">x </span></b>";
			fileNameListing.append(liComp);
		}
	
	}

	</script>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
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
    			<li  class="active"> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/et/getTxnSource.htm'">RTA File Uploads</a> </li>
			    <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/et/getbulkuploadtransactiohistorydetails.htm?queueId=0'">Transaction History </a> </li>
			    <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/loadreportAdWiseCilentPortfolioSummary.htm'">Reports</a> </li>
			    <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/et/loadAvailablePrePrintedForms.htm?clientPartyId=0&ownerPartyId=${sessionScope.userSession.partyId}'">Preprinted Form</a> </li>
			    <li id="autoAllocatedAssetsLink"> <a onclick="window.location.href='<%=request.getContextPath()%>/et/assetAutoAllocation.htm'">Auto Allocated Assets</a> </li>
				<li id="autoAllocatedAssetsLink"> <a onclick="showPasswordDialog();">MF Auto Upload Configuration</a> </li>
    		</ul>
    		<div class="tab-content">
      			<div id="" class="tab-pane fade in active clearfix">
      				<div class="col-md-3 sidebar-offcanvas" role="navigation" style="padding-left: 10px;">
						<div class="list-group">
							<a class="list-group-item active" href="#">RTA File Uploads</a> <a
								href="<%=request.getContextPath() %>/et/getTxnSource.htm"
								class="list-group-item"><strong>New Upload </strong></a> <a
								class="list-group-item"
								href="<%=request.getContextPath() %>/et/showuploadhistory.htm">Upload
								History</a>
						</div>
					</div>
          
					<div class="col-md-9" style="padding-left: 10px;">
						<div class="list-group">
							<a class="list-group-item active" href="#">New Upload </a>
							<form method="POST" action="" enctype="multipart/form-data">
								<div class="list-group-item">
									<div class="row">
										<div class="row">
											<div class="form-group col-md-6 clearfix">
												<label class="col-sm-3 control-label no-padding-right"  for="Source">Source:</label>
												<div class="col-sm-9">
													<select name="txnSource" id="txnSource" class="input-xxlarge form-control"
												onChange="loadFileTypes(this.value);">
											</select>
												</div>
											</div>
											<div class="form-group col-md-6 clearfix">
												<label class="col-sm-3 control-label no-padding-right"></label>
												<div class="col-sm-9">
												</div>
											</div>
										</div>
	
										<div class="row">
											<div class="form-group col-md-6 clearfix">
												<label class="col-sm-3 control-label no-padding-right"
													for="fileType">File Type:</label>
												<div class="col-sm-9">
													<select name="fileType" id="fileType" class="input-xxlarge form-control"
													onchange="showHelpIcon()">
												</select>
												</div>
											</div>
											<div class="form-group col-md-6 clearfix">
												<label class="col-sm-3 control-label no-padding-right">
												<span class="dropdown"> 
													<img class="dropdown-toggle" data-toggle="dropdown"  src="<%=request.getContextPath()%>/images/Help.png" title="Click here to view file format" id="helpIconForFileType" style="width: 20px; height: 20px; cursor: pointer"
														onclick="showFileList()" />
													<ul class="dropdown-menu dropdown-default"  id="fileListForUpload" style="left:-96px !important;min-width: 200px !important;">
													</ul>
												</span>
												</label>
												<div class="col-sm-9">
													
												</div>
											</div>
										</div>
	
										<div class="row">
											<div class="form-group col-md-6 clearfix">
												<label class="col-sm-3 control-label no-padding-right">Browse</label>
												<div class="col-sm-9">
													<input class="btn dbtn" id="fileuploadcomponent" type="file"
													value="Choose File" name="files" multiple
													onchange="listFileNames('fileuploadcomponent','filenames');">
												</div>
											</div>
											<div class="form-group col-md-6 clearfix">
												<label class="col-sm-3 control-label no-padding-right"></label>
												<div class="col-sm-9">
														<ul id="filenames"
													style="list-style: none; padding-top: 10px"></ul>
												</div>
											</div>
										</div>
	
	
										<div class="row">
											
											<div class="col-md-6 searchpadding padding_top">
												<div class="alert alert-warning" >
	
													-If the file size is above 20MB.Please <a
														href="<%=request.getContextPath()%>/et/getBulkUploadAbove.htm"><ins>
															<strong>Click</strong>
														</ins></a> here <br> -For any further assistance please call
													022-42224333 Deepak/Praful
												</div>
	
											</div>
											<div class="col-md-6"></div>
										
										</div>
	
	
										<!-- 2 eND-->
										<div class="col-md-4 searchpadding padding_top">
											<br />
											<br />
										</div>
										<div class="col-md-8 searchpadding padding_top">
											<button class="btn btn-primary btn-xs dbtn" type="button" onclick="uploadDoc();">
											<i class="ace-icon fa fa-check bigger-110"></i>
											Upload
											</button>
							              	<button class="btn btn-primary btn-xs dbtn" type="reset" onclick="window.history.back();">
												<i class="ace-icon fa fa-times"></i>
												Cancel
											</button>
										</div>
									</div>
								</div>
							</form>
							<div class="alert alert-warning">
								<span style="font-weight: bold;">Note:</span><br> - Only
								.dbf, .xls and .xlsx files are supported.<br> - Only
								standard reports are supported, please don't upload customized
								reports.<br> <br>
							</div>
						</div>
					</div>
      			</div>
      			<div id="" class="tab-pane fade"> </div>
      			<div id="" class="tab-pane fade"> </div>
      			<div id="" class="tab-pane fade"> </div>
    		</div>
  		</div>    
      </section>	
	<!-- Center part End -->          
	<jsp:include page="../common/footer.jsp" />
	
	<script>
	$(document).ready(function(){
	
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=501',//
		success : function(result) {
			
			
			$('#txnSource').empty();
			
			$('#txnSource').append('<option value="0" >---select---</option>');
			$(result).each(function(i,obj) {
				//alert(obj.codeValue);
			var codeTypeId=obj.codeTypeId;
			var codeValue=obj.codeValue;
			var codevalueId=obj.codeValueId;
				$('#txnSource').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				
				
			});
			
			}
		});
	});
	
	function loadFileTypes(value){
	$('#helpIconForFileType').hide();
	parentId=value;
	
	//alert(parentId);
	var cityArrayList=new Array();
	
	$.ajax({
		type : "GET",
		url : $('#contextPath').val()+'/common/getCityList.htm?parentId='+parentId,
		success : function(result) {
			
			$(result).each(function(i,obj) {
				$('#fileType').empty();
				
				$('#fileType').append('<option value="0" >---select---</option>');
				$(result).each(function(i,obj) {
				var codeTypeId=obj.codeTypeId;
				var codeValue=obj.codeValue;
				var codevalueId=obj.codeValueId;
					$('#fileType').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
					
			});		
		});
	}
	});
}
	
	function uploadDoc(){
		var validated=true;
		if($('#txnSource').val()==0 || $('#fileType').val()==0 || $('#fileType').val()==""){
			validated=false;
	}
	
	var isFileAllowed=false;
	var fileNotAllowed=false;
	var txnSourceId=$('#fileType').val();
	var oMyForm = new FormData();
	var files = document.getElementById('files');
	var oMyForm = new FormData();
	var i=0;
	$.map($('#fileuploadcomponent').get(0).files, function(file) {
	 oMyForm.append("files"+i,file);
		  i++;
		 // alert(file.name);
		 //alert( file.name.split('.').pop());
		 var fileExtension=file.name.split('.').pop();
		// alert(fileExtension);
	//	alert($.inArray(fileExtension , allowedFiles));
		 var allowedFiles=new Array("dbf","xls","xlsx");
		 if($.inArray(fileExtension , allowedFiles)>-1){
			// alert('allowed');
			 isFileAllowed=true;
		 }else{
			// alert('not allowed');
			 isFileAllowed=false;
		 }
		 if(!isFileAllowed){
			 fileNotAllowed=true; 
		 }
		});
	
	  if(i==0){
		  validated=false;
	  }
	  if(checkSelectedUserInHierarchy()){
		 // validated = true;
	  } else {
		  //validated = false;
		  return;
	  }
	  if(!validated){
		  showAlertMessage1("Error",
					"All fields are mandatory"+'\n',
						"error", doNothing);  
		  return;
		  
	  }
	  if(fileNotAllowed){
		  showAlertMessage1("Error",
					"Only following files are allowed"+'\n'+'.dbf,.xls,.xlsx',
						"error", doNothing);  
		  return;
	  }
	 $.ajax({
	    url:  $('#contextPath').val()+'/et/bulkUploadTxn.htm?txnSourceId='+txnSourceId,
	    data: oMyForm,
	    dataType: 'text',
	    processData: false,
	    contentType: false,
	    type: 'POST',
	    success: function(result){	
	    	//alert(result);
	    	result=JSON.parse(result);
	    	//alert(result.success);
			if(result.success!=null){
				showAlertMessage1("Success",
						"The selected data files have been uploaded successfully and submitted to the system for processing. Depending on the system load and request queue, this may take few minutes to a few hours to get processed. As soon as your file upload request is completed, you will receive an email notification. On receiving the notification, please visit the <b>Upload History</b> section in the same screen for reviewing the results. In case there are any errors, please contact your mapped support executive for help."+'\n',
						"confirmation", reload);
				
			}else{
				showAlertMessage1("Error",
						result.error+'\n',
						"error", doNothing);
			}
	    		//window.setTimeout(function(){window.location.href=$('#contextPath').val()+'/et/getTxnSource.htm';},2000);
	    }
	  });
	
}
function reload(){
	window.location.href=$('#contextPath').val()+'/et/getTxnSource.htm';
}

function showHelpIcon(){
	var fileType=$('#fileType').val();
	if(fileType!=0){
		$('#helpIconForFileType').show();
	}else{
		$('#helpIconForFileType').hide();
	}
}

function showFileList(){
	$('#fileListForUpload').empty();
	$.ajax({
        type: "GET",
        url : $('#contextPath').val()
		+ '/xml/FileFormat.xml',
        dataType: "xml",
        success: function(xml) {
        	$(xml).find('FileType').each(function(i,obj){
        		if($(obj).attr('id')==$('#fileType').val()){
        			 $(obj).find('File').each(function(i,obj){
        				 var filename=$(obj).attr('name');
        				 var filePath=$(obj).attr('path');
        				 $('#fileListForUpload').append('<li><a onclick="downloadFileFormat(name,title)" name="'+filePath+'" title="'+filename+'"><span class="user">'+filename+'</span></a></li>');
        			 });
        		}
        	});
        }
        });
	
} 
function downloadFileFormat(path,name){
	$('#fileNameToSend').val(name);
	$('#filePathToSend').val(path);
	$('#fileFormatForm').submit();
}

</script>

<form target="_blank" method="post" action="${pageContext.request.contextPath}/common/downloadFileFromConext.htm" id="fileFormatForm">
	<input type="hidden" name="fileName" id="fileNameToSend" />
	<input type="hidden" name="filePath" id="filePathToSend" />
</form>
</body>
</html>