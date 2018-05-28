<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">  
    <meta name="author" content="">
<title>RTA File Uploads</title> 
 <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->   
 <!-- Bootstrap core JavaScript  
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
<!--    <script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
     <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
      <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
       <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>
-->
     
  
<!-- -responsive css-->
<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">-->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
<!-- -responsive css-->
<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
	<!--<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>

<script src="<%=request.getContextPath()%>/js/jquery.ui.autocomplete.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script> -->

<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">

   

<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->
<script type="text/javascript">
var hidePopupTimeoutId;
$(".choose1").live("mouseover", function () {
    clearTimeout( hidePopupTimeoutId );
    $(".popupnewping1").show();
});


$(".choose1").live("mouseout", function () {
    hidePopupTimeoutId = setTimeout( function() {
        $(".popupnewping1").hide();
    },500);
});

$(".popupnewping1").live("mouseenter", function() {
    clearTimeout( hidePopupTimeoutId );
});


$(".popupnewping1").live("mouseleave", function() {
    $(".popupnewping1").hide();
});



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





function quickSearchPartner(e){
	//alert('in search');  
	var event = window.event ? window.event : e;
	//alert(event.keyCode);
	
	if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
		return;
	if(event.keyCode==13){
		search();
		return;  
	}
	$('#common_popup_div,#shadow_div_web_app').remove();
	//alert($('#quickSearch').val()); 
	//alert('hi'+ $('#quickSearchpart').val()); 
	var searchString = $('#quickSearchpart').val(); 
$.ajax({
	  url: $('#contextPath').val()+"/birtreport/getPartnerList.htm?searchString="+searchString,
	  method:"post", 
	  success:function(result){

		  
		  var userLabelValueList = new Array();
			 $(result).each(function(i,obj){
					var object = {};
					object.value = obj.partyID;

					object.label = obj.partnerName;
					userLabelValueList.push(object);
				 	//alert("Hello:::::"+ obj.partyID);
					//alert("Hi:::::::::"+obj.partnerName); 
					  
			 });  
//				 alert("object.label:::"+  object.label);
			 $("#quickSearchpart")
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
			       last=extractLast(request.term);
			       if(last==null || last=='' || last==' ')
					{
						return false;
					}
			       response( $.ui.autocomplete.filter(userLabelValueList, request.term) );
			      },
			      focus: function() {
			        // prevent value inserted on focus
			        return false;
			      },
			     
			      select: function( event, ui ) {
			    	  var terms = split( this.value );
				        
				        console.log('terms='+terms); 
				        
				        // remove the current input
				        terms.pop();
				        // add the selected item 
				        terms.push(ui.item.label);
//					        	partyId=ui.item.value;
				        	$('#quickSearchHiddenpart').val(ui.item.value)
					
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
  

function split( val ) {
    return val.split( /;\s*/ );
} 
function extractLast( term ) {
    return split( term ).pop();
} 
  

 
</script>
</head>
<body> 
<!--css popup window start 1--> 
<jsp:include page="../common/header.jsp"/>

 	
 <!-- Center part start -->
 <section>
 

 
     
    <div class="container white">
    	<div class="container-head">
        
          <div class="col-md-12" style="text-align: right;"><span style="float:left;">RTA File Uploads</span>
           </div >
          </div > 
       
        <div class="container-body " style="padding:5px;">
        
        </div>
	  	<div class="container-body">
        </br>
        <!-- center -->  
          
      <div class="col-md-3 sidebar-offcanvas" role="navigation" style=" padding-left:10px;" >
            <div class="list-group">
        		<a class="list-group-item active" href="#">RTA File Uploads</a>
                 <a href="<%=request.getContextPath() %>/seret/getNewFilesUpload.htm" class="list-group-item"><strong>New Upload  </strong></a> 
                <a href="<%=request.getContextPath() %>/seret/getUploadHistory.htm" class="list-group-item" >Upload History</a></div>
            
        </div>   
        <div class="col-md-9"  style=" padding-left:10px;"  >
			 
 <!-- center -->  
        
         <div class="list-group">
        		<a class="list-group-item active" href="#">New Upload  </a>
                 
                 
  <!--  <form method="POST" action="" enctype="multipart/form-data">   -->  
  <form id="addForm" method="post" action="<%=request.getContextPath()%>/seret/bulkUploadTxn.htm" enctype="multipart/form-data">  
  	<input type="hidden" id="hiddenIsToClose" name="hiddenIsToClose" value="<%=request.getParameter("isToClose")%>" />    
  	<input type="hidden" id="hdnbasepath" name="hdnbasepath">       
  	            
   <div class="list-group-item">       
    <div class="row">     
    	
  	<!-- Autocomplete PartnerList START-->
  	<div class="col-md-4 searchpadding padding_top">Partner </div>
        <div class="col-md-8 searchpadding padding_top">
	       <input type="text" id="quickSearchpart" name="searchString" onKeyUp="quickSearchPartner(this);"   placeholder="Quick Search" style="width: 300px;">
			<input  type="text" id="quickSearchHiddenpart" name="searchString1"  placeholder="Quick Search" style="width: 300px;">    
			 
        </div>          
  	 
    <!-- Autocomplete PartnerList END-->
    <!-- 1 START--> 
    <div class="col-md-4 searchpadding padding_top">Source </div>
        <div class="col-md-8 searchpadding padding_top">
	         <select name="txnSource" id="txnSource"  class="form-control" onChange="loadFileTypes(this.value);" >	                            	                                              
	          </select>
        </div>    
             <!-- 1 END-->   
                  
              <!-- 2 START-->
     <div class="row">
    <div class="col-md-4 searchpadding padding_top">File Type </div>
            <div class="col-md-8 searchpadding padding_top">
             <select name="fileType" id="fileType" class="form-control"  onChange="getUniqueBasePath();">                                                              
                                                  
              </select>   
            </div>    
      </div> 
       
				
				<div class="col-md-4 searchpadding padding_top">Attachment(s) </div>
				
				<span class="searchpadding padding_top" style="float: left; width: 300px;">
				 	<input type="file" id="fileid" name="file" style="height: 0px; width: 0px; overflow: hidden;" /> 
				 	<input type="text" id="ftxtid" name="ftxtid" class="form-control"> <span class="user" id="ftype"></span>
				 </span>
				 <span style="float: left; margin-top: 7px; width: 100px;">
					<input class="dbtn" value="Browse" id="fbtnid" type="button" onclick="getFile();"> 
				</span>   
				<!-- ---------------upload file1------------------- --> 
              
             
             <div class="col-md-4 searchpadding padding_top"  ><br/><br/>	 </div>
             <!--<div class="topbuttonholder">-->
            <div class="col-md-8 searchpadding padding_top">     
       <input class="btn dbtn" type="button" value="Upload" name="Upload" data-toggle="tooltip" onclick="submitAdd(0);" data-placement="left"> 
 	 	
     	<input class="btn dbtn" type="button" value="Cancel" name="Cancel" onClick="window.history.back();"> </div>
   </div>
</div>   
</form>
  
<!-- <div style="background-color: yellow;padding-left: 10px;">
  <span style="font-weight:bold;">Note:</span><br>
- Only .dbf files are supported.<br>
- Please upload files upto 20MB at a time.<br>
- Only standard reports are supported, please don't upload customized reports.
</div> -->

</div></div>      	
       	</div>
</div>
      
<!-- Center part End -->          

<jsp:include page="../common/footer.jsp" />
<script>

$(document).ready(function(){
	//alert('asdsa');
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/seret/getbulkuploadSourceType.htm?codeTypeIds=501',//
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
parentId=value;
	
	//alert(parentId);
	
	 
	var cityArrayList=new Array();
	
	$.ajax({ 
		type : "GET", 
		url : $('#contextPath').val()+'/seret/getbulkuploadFileType.htm?parentId='+parentId,
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
   

function getUniqueBasePath()
{   
	var fileType = $('#fileType').val();
	//alert('to get basepath'+$('#fileType').val());
	  
	$.ajax({     
     type: "POST",
     url : $('#contextPath').val() +"/seret/getUniqueBasePath.htm?txnSourceID="+fileType,  
     dataType: 'json', 
     contentType: 'application/json',     
        success:function(result)   
     {  
      			 $(result).each(  
      			 function(i, obj) {   
      				  
      					//alert('Basepath is'+obj.basepath);
      					$('#hdnbasepath').val(obj.basepath);   
      					//$("#ARN").focus();
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
	window.location.href=$('#contextPath').val()+'/seret/getTxnSource.htm';
}

function getFile(){
	document.getElementById("fileid").click();
	
	}
	

/* For file Type & size */
var fSize;
$(document).ready(function(){
    $('#fbtnid').mouseleave(function(){
    	var filename = $('#fileid').val().replace(/.*(\/|\\)/, '');
    	var fType= filename.split(".");
    	//alert("fType:"+fType[1]);
    	fSize = document.getElementById('fileid').files[0].size/1024; //size in kb
    	document.getElementById("ftype").innerHTML = "Type: "+fType[1]+", "+"Size: "+Math.floor(fSize)+"kb";
    	
    	var url = document.getElementById("fileid").value;
         var filename = url.replace(/^.*\\/, "");
         document.getElementById("ftxtid").value= filename;
         if(fSize>9765){
        	 showAlertMessage("Message", "<br/>file size should not be greater than 9765 kb", "information");
        	 $('#fileid').val('');
        	 $('#ftxtid').val('');
         } 
    	/* var fv = document.getElementById("fileid").value;
    	document.getElementById("ftxtid").value= fv; */
    	//alert("fv:"+fv);
    });
});

/* For file Type & size */
	 
function uploadFileRequiredValidation(){
	
	if ($('#txnSource').val()=="0" || $('#txnSource').val()==null || $('#txnSource').val().trim()=="") {
		 alert("Please Select Source!");
         return false;
	     } 
	 
	 if ($('#fileType').val()=="0" || $('#fileType').val()==null || $('#fileType').val().trim()=="") {
		 alert("Please Select FileType!");
         return false; 
	     } 
		     
	if ($('#fileid').val().trim()=="") {
		 alert("Please Select File!");
         return false;
     } 
	 
	return true;     
}

function submitAdd(isToClose){
	 
	//$('#hiddenIsToClose').val(isToClose);

	if(uploadFileRequiredValidation() == true){
		var form = document.getElementById('addForm');   
		form.submit(1);  
		alert("Record Added Successfully !"); 
	}  
  
	}    
	 
var fl = document.getElementById('fileid');

fl.onchange = function(e){ 
    var ext = this.value.match(/\.(.+)$/)[1];
    switch(ext)
    {
        case 'dbf':  
        case 'xls':
        case 'xlsx':
        case 'ods':
            //alert('allowed');
            break;
        default:  
            alert('File type not not allowed !');
            this.value=''; 
    } 
};

</script>
</body>
</html>