<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>JUpload - File Upload Applet (basic mode demo)</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet" />



<style>
.modal {
	display: block;
}
</style>
</head>
<body>
	<div id="my-modal" class="modal fade in">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" onclick="history.go(-1);" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">RTA File Uploads</h4>
				</div>
				<div class="modal-body">
					<div class="form-horizontal">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">Source:</label>
							<div class="col-sm-6">
								<input id="contextPath" type="hidden" name="contextPath"
									value="<%=request.getContextPath()%>" /> <select
									name="txnSource" id="txnSource" class="form-control"
									onchange="loadFileTypes(this.value);">
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">File
								Type:</label>
							<div class="col-sm-6">
								<select name="fileType" id="fileType" class="form-control"
									onchange="loadFTPPath(this.value);">
								</select> <input type="hidden" id="basepath" val="" />
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal-backdrop fade in"></div>


</body>
<script>
$(document).ready(function(){
	sourceList();
});

function sourceList(){
	//alert($('#contextPath').val());
	$.ajax({

		type : "POST",
		url : $('#contextPath').val()+'/upload/getSourceList.htm?codeTypeIds=501',
		//dataType: 'json',
		contentType : 'application/json',
		success : function(result) {
			
			$('#txnSource').empty();
			
			$('#txnSource').append('<option value="0" >---select---</option>');
			$(result).each(function(i,obj) {
		
			var codeValue=obj.codeValue;
			var codeValueId=obj.codeValueId;

			
				$('#txnSource').append('<option value="'+codeValueId+'">'+codeValue+'</option>');
				
				
		});
			
		}
	});
} 

function loadFTPPath(value){
	parentId=value;
	
		//var cityArrayList=new Array();
		
		$.ajax({
			type : "GET",
			url : $('#contextPath').val()+'/upload/getFTPBasePath.htm?txnSourceID='+parentId+'&protocol=FTP',
			success : function(result) {
				
				$(result).each(function(i,obj) {
					$('#basePath').empty();
					
					$(result).each(function(i,obj) {
					var basepath=obj.basepath;
				     $("#basepath").val(basepath);
					
						
				});		
			});
				myFunction();
		}
		});
	}
function loadFileTypes(value){
	parentId=value;
		
	
		var cityArrayList=new Array();
		
		$.ajax({
			type : "GET",
			url : $('#contextPath').val()+'/upload/getCityList.htm?parentId='+parentId,
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
function myFunction() {
	var contextPath=$("#contextPath").val();
    var x = document.getElementById("basepath").value;
    var z =  $('#fileType option:selected').text();
    
    appletWidth = "700";
    appletHeight = "300";

    postURL = x;
    urlToSendErrorTo = ""; //Careful: log info will be truncated, if sent to a mailto: link.
    uploadPolicy = "";

    afterUploadTarget = "";
    afterUploadURL = "";
    allowHttpPersistent = "";
    allowedFileExtensions = "";
    browsingDirectory = "";
   // debugLevel = "";
    fileChooserIconFromFileContent = "";
    fileChooserIconSize = "";
    fileChooserImagePreview = "";
    fileFilterName = "";
    filenameEncoding = "";
    formdata = "";
    highQualityPreview = "";
    httpUploadParameterName = "";
    httpUploadParameterType = "";
    keepOriginalFileExtensionForConvertedImages = "";
    lang = "";
    lookAndFeel = "";
    maxChunkSize = "500000";
    maxFileSize = "";
    maxPicHeight = "";
    maxPicWidth = "";
    nbFilesPerRequest = "";
    pictureTransmitMetadata = "";
    readCookieFromNavigator = "";
    realMaxPicHeight = "";
    realMaxPicWidth = "";
    retryMaxNumberOf = "";
    retryNbSecondsBetween = "";
    sendMD5Sum = "";
    serverProtocol = "HTTP/1.1";
    showLogWindow = "";
    showStatusBar = "";
    specificHeaders = "";
    sslVerifyCert = "";
    stringUploadError = "";
    stringUploadSuccess = "";
    targetPictureFormat = "";

    //Some parameters can only be choosen from an existing list:
    uploadPolicyList = ["", "DefaultUploadPolicy", "FileByFileUploadPolicy", "CoppermineUploadPolicy", "FilesTogetherUploadPolicy", "PictureUploadPolicy", "SuperSimpleUploadPolicy"];

    httpUploadParameterTypeList = ["", "iteration", "array"];
    //eo: esperanto
    //hr: croatian
    //il: hebrew
    langList = ["", "ar", "bg", "cs", "da", "de", "en", "eo", "es", "fi", "fr", "hr", "hu", "il", "it", "ja", "nl", "no"
    			, "pl", "pt", "pt_BR", "ro", "ru", "sk", "sl", "sv", "tr", "zh"];
    serverProtocolList = ["", "HTTP/0.9", "HTTP/1.0", "HTTP/1.1", "FTP"];
    showLogWindowList = ["true", "false", "onError"]; 

    function writeInputText (name, value, comment) {
    	document.write('	<tr><td align="center">');
    	document.write('<B>' + name + '</B>');
    	if (comment != "") {
    		document.write(" (" + comment + ")");	
    	}
    	document.write('</td><td><INPUT TYPE="HIDDEN" NAME="');
    	document.write(name);
    	document.write('"');
    	if (value != "") {
    		document.write(' VALUE="');
    		document.write(value);
    		document.write('" ');
    	}
    	document.writeln(	'></td></tr>');
    }//writeInputText



    function writeParam (param, value) {
    	if (value != undefined && value != "") {
    		document.write('   <param name="');
    		document.write(param);
    		document.write('" VALUE="');
    		document.write(value);
    		document.writeln('" >');
    	}
    }//writeParam


    //First: get possible URL parameters.
    reQuery = new RegExp ("[\?](.*)&?");
    reQuery.exec(location.href);
    query = RegExp.$1;

    //Then, get each parameter
    reParam = /([^&]*)=([^&]*)&?/g;
    array = reParam.exec(query);
    while (array != null) {
    	val = unescape(array[2]);
    	//unescape won't manage +
    	val = String(val).replace(/\+/g, " ");
    	
    	//array[1] contains the parameter name.
    	//val contains its value, to be set.
    	eval(array[1] + ' = val');

    	array = reParam.exec(query);
    }//while

    if (appletWidth=="") {
    	appletWidth = "640";
    }
    if (appletHeight=="") {
    	appletHeight = "300";
    }
	//$("#app").append('hi');
    //Let's write one APPLET tag for the selected language
    document.writeln('<html><head><link href="../css/bootstrap.css" rel="stylesheet" /><style>.modal {display: block}</style></head><body>');
    document.writeln('<div class="modal-dialog"><div class="modal-content bs-example-modal-lg">');
    document.writeln('<div class="modal-header"> <button type="button" onclick="history.go(0);" class="close" data-dismiss="modal" aria-hidden="true">&times;</button><h4 class="modal-title">RTA File Uploads</h4></div><div class="modal-body">');
    		
			
				
			
		
		
    
  	
    document.writeln("You are trying to upload: "+z +" file(s)");
    document.writeln('<APPLET ');
    document.writeln('	CODE    = "wjhk.jupload2.JUploadApplet" ');
    document.writeln('	ARCHIVE = "'+contextPath+'/lib/wjhk.jupload.jar","'+contextPath+'/lib/jakarta-commons-oro.jar","'+contextPath+'/lib/jakarta-commons-net.jar"');
    document.writeln('	WIDTH   = "' + appletWidth + '" ');
    document.writeln('	HEIGHT  = "' + appletHeight + '"');
    document.writeln('	NAME = "jupload" ');
    document.writeln('	MAYSCRIPT >');
    writeParam("postURL", postURL);
    writeParam("uploadPolicy", uploadPolicy);

   writeParam("afterUploadTarget", afterUploadTarget);
    writeParam("afterUploadURL", afterUploadURL);
    writeParam("allowHttpPersistent", allowHttpPersistent);
    writeParam("allowedFileExtensions", allowedFileExtensions);
    writeParam("browsingDirectory", browsingDirectory);	
   // writeParam("debugLevel", debugLevel);
    writeParam("fileChooserIconFromFileContent", fileChooserIconFromFileContent);
    writeParam("fileChooserIconSize", fileChooserIconSize);
    writeParam("fileChooserImagePreview", fileChooserImagePreview);
    writeParam("fileFilterName", fileFilterName);
    writeParam("filenameEncoding", filenameEncoding);
    writeParam("formdata", formdata);
    writeParam("httpUploadParameterName", httpUploadParameterName);
    writeParam("httpUploadParameterType", httpUploadParameterType);
    writeParam("keepOriginalFileExtensionForConvertedImages", keepOriginalFileExtensionForConvertedImages);
    writeParam("lang", lang);
    writeParam("lookAndFeel", lookAndFeel);
    writeParam("nbFilesPerRequest", nbFilesPerRequest);
    writeParam("maxChunkSize", maxChunkSize);
    writeParam("maxFileSize", maxFileSize);
    writeParam("maxPicHeight", maxPicHeight);
    writeParam("pictureTransmitMetadata", pictureTransmitMetadata);
    writeParam("readCookieFromNavigator", readCookieFromNavigator);	
    writeParam("realMaxPicHeight", realMaxPicHeight);
    writeParam("realMaxPicWidth", realMaxPicWidth);
    writeParam("retryMaxNumberOf", retryMaxNumberOf);
    writeParam("retryNbSecondsBetween", retryNbSecondsBetween);
    writeParam("sendMD5Sum", sendMD5Sum);
    writeParam("showLogWindow", showLogWindow);
    writeParam("showStatusBar", showStatusBar);
    writeParam("specificHeaders", specificHeaders);
    writeParam("sslVerifyCert", sslVerifyCert);
    writeParam("stringUploadError", stringUploadError);
    writeParam("stringUploadSuccess", stringUploadSuccess);
    writeParam("targetPictureFormat", targetPictureFormat);
    writeParam("urlToSendErrorTo", urlToSendErrorTo);
    document.writeln('Java 1.5 or higher plugin required.');
    document.writeln('</APPLET>'); 

    document.writeln('</div></div></div>');
    document.writeln(' <div class="modal-backdrop fade in"></div>');
    	    
   
    document.writeln('</body></html>');
    // A sample doUpload javascript, to show how javascript can be used to control the upload.
    function doUpload() {
    	document.jupload.startUpload();	
    }


    //First the form, with default values given by the query parameters.
    document.writeln('<FORM NAME="main-form">');

    //First the form, with default values given by the query parameters.
    /*
    document.writeln('<INPUT TYPE="checkbox" NAME="cb"/> a test check box (to test the form-data parameter)<BR>');
    document.writeln('A test radio button (to test the form-data parameter)<BR>');
    document.writeln('<INPUT TYPE="radio" NAME="r" VALUE="1"/>1<BR>');
    document.writeln('<INPUT TYPE="radio" NAME="r" VALUE="2"/>2<BR>');
    document.writeln('<INPUT TYPE="radio" NAME="r" VALUE="3"/>3<BR>');
    */

    //Main parameters	
    
    document.writeln('<TABLE BORDER=0 CELLSPACING=0 CELLPADING=0><TR><TD><TABLE BORDER=0>');
   // writeInputText("postURL", postURL);
    document.writeln('</TABLE></TD><TD><TABLE BORDER=0>');
 
    document.writeln('</TABLE></TD></TR></TABLE>');

    document.writeln('</FORM>');
}
</script>
</html>
