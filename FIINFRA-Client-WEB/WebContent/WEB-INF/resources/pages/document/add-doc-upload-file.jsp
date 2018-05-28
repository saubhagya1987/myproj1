<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="in.fiinfra.common.common.DocumentData"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<% 
   DocumentData doc = (DocumentData) request.getAttribute("document");
%>

<script>
	var hasFile =
<%=StringUtils.isEmpty(doc.getFileStoragePathURI())
					? "false"
					: "true"%>
	;
</script>
 <script>
$(document).ready(function(){

	$('#document-form').validate({
		errorClass:"errors", 
	    rules: {
	    	refTypeId : { required: true  },
	    	documentType: {  required: true },
	    	documentName: {  required: true },
	    	
	    	files: {  required: true }
	    },

	    messages: {
	    	refTypeId : "Please select a section.",
	    	documentType: "Please select a document Type.",
	    	
	    	documentName: "Please write a  document name.",
	    	files: "Please Select File."
		        }
  
	});	
	 // Calls the selectBoxIt method on your HTML select box
});
</script>
<script>

function saveDocument() {
		
		
        if($('#document-form').valid())
        	{
        
        	var formData = new FormData($('#document-form')[0])
        	$.ajax({
    		    type:'GET',
    		    data:formData,
    		    async: false,
    		    cache: false,
    		    contentType: false,
    		    processData: false,
    		    url:$('#document-form').attr('action'),
    		    success:function(data) {
    		    //  location.reload();
    		    
    		      
    		    }
    		  });
		$('#document-form').submit();
        	}
        
	}		
</script>

<!-- Custom Selectbox Ends -->

<!-- Type of emergency faced select starts -->
<script>
var desiredWidth;
	$(document).ready(
			function() {
	
	$("#takePicture").on("change",gotPic);
	$("#selectFile").on("change",gotPic);
	//$("#previewPane").load(getSwatches);
	desiredWidth = window.innerWidth;
	
	if(!("url" in window) && ("webkitURL" in window)) {
        window.URL = window.webkitURL;   
    }
	
				$(".thumb_select_ul a").click(
						function() {
							$(".thumb_select_ul a").children(".categoery")
									.removeClass("not_applicable");
							$(this).children(".categoery").addClass(
									"not_applicable");
	
});
  
  $("#photo_upload").click(function(event){
	  event.preventDefault();
      $(this).next().trigger('click');
  });

 	$('#takePicture').css("visibility", "hidden");
  //$('#selectFile').css("visibility", "hidden");
  
});

function gotPic(event) {
		if (event.target.files.length == 1
				&& event.target.files[0].type.indexOf("image/") == 0) {
			$("#previewPane").attr("src",
					URL.createObjectURL(event.target.files[0]));
		} else {
    	$("#previewPane").attr("src",'');
    }
}

function takePicture(){
	$('#selectFile').val('');
	$('#selectFile').css("visibility", 'hidden');
	$('#takePicture').css("visibility", 'visible');
	$('#takePicture').click();
}
function selectFile(){
	$('#takePicture').val('');
	$('#takePicture').css("visibility", 'hidden');
	$('#selectFile').css("visibility", 'visible');
	$('#selectFile').click();
}

       
</script>
<script>
$(document).ready(function(){
	var type=$("#DocumentType").val();
$("#DocumentType").change(function(){
	docType=$(this).val();
	/* getDocDetails(docType); */
});
});
/* function (type){
	if(type==510){
		$("#files").attr("accept","image/*");
	}else if(type==511){
		$("#files").attr("accept",".doc,.docx,.ppt");
	}else if(type==512){
		$("#files").attr("accept",".pdf");
		}
} */
</script>

<div align="left">
	<div class="col-sm-6 ">
      		<form:form action="${pageContext.request.contextPath}/document/save"
			commandName="document" method="POST" enctype="multipart/form-data"
			id="document-form">
			<form:errors path="*" cssclass="error" class="error"></form:errors> 
			<form:input path="refId" type="hidden"  /> 
			<form:input path="sectionId" type="hidden"  />
			<form:input path="partyId" type="hidden"  />
			<form:input path="fileStoragePathURI" type="hidden"  />
			<form:input path="documentStorageLocation" type="hidden"  />
			<form:input path="documentId" type="hidden"  />
			<input type="hidden" name="returnUrl" value = "${returnUrl}">
			<fieldset>
				<!-- <legend> Add Document</legend> -->
  
				<div class="col-sm-12 ">
					<div class="form-group">
						<label for="textArea" class="col-lg-4 control-label">Section:</label>
						<div class="col-lg-8">
             <form:select path="refTypeId" id="refTypeId"
            
									items="${sections}" itemLabel="name" itemValue="id" class="required form-control">
								</form:select>
						</div>
					</div><br/><br/>
				</div>
            
				<div class="col-sm-12 ">
					<div class="form-group">
						<label for="textArea" class="col-lg-4 control-label">Document
							Type:</label>
						<div class="col-lg-8">
             <form:select path="documentType" id="documentType"
									items="${documentTypes}" itemLabel="name" itemValue="id" class="required form-control">
								</form:select>
						</div>
					</div><br/><br/>
				</div>
                   
                    
				<div class="col-sm-12 ">
					<div class="form-group">
						<label for="textArea" class="col-lg-4 control-label">Document
							Name: <span class="required">*</span></label>
						<div class="col-lg-8">
							<form:input path="documentName" id="documentName" class="input form-control" placeholder="Document Name" type="text" />
                    
                  </div>
					</div><br/><br/>
                  </div>
			
			

				<div class="col-sm-12 ">
					<div class="form-group">
						<label for="textArea" class="col-lg-4 control-label">Description:</label>
						<div class="col-lg-8">
							 <form:textarea path="description" class="comment form-control" name="" cols="" rows="" placeholder="Description"/>
                  </div>
                  </div>
			</div><br/><br/>
			&nbsp;&nbsp;


				<div class="col-sm-12">	
				 <%-- <%  if (doc.getId() != null ){ %> --%>
				<div class="form-group">
						<label for="textArea" class="col-lg-4 control-label">Upload File:</label>
						<div class="col-lg-8"> 
	      
                   
					<div class="col-xs-12" id="document">
				<div class="form-group">
					
					<div class="col-lg-12">
						<label class="ace-file-input ace-file-multiple">
						 <form:input type="file"  id="files1" path="files" /> 
						 <a class="remove" href="#"><i
								class=" ace-icon fa fa-times"></i></a>
						</label>
					</div>
            </div>
		
        </div>
        
          
					</div>
					</div>
					
				</div>
          
				<!-- <div class="col-sm-12">
					<div class="form-group" align="center">
						<a onClick="saveDocument();return false;" class="btn btn-success btn btn-info btn-sm">
							<div class="thumb add_docs_save"></div> <label>Save</label>
						</a>
        </div>
				</div> -->
					</fieldset>
		</form:form>

<div class="col-xs-12">
		<!-- <div class="form-group"> -->
		<div class="col-lg-4"></div>
		<div class="col-lg-8">
		<div class="fr">
		<input type="submit" value="Save"
			class="btn-primary btn-xs btn"
			onClick="saveDocument();" />
			
			
			 <a
			href="${pageContext.request.contextPath}/document/view?<%=BaseRequest.encode("returnUrl","/document/view")%>" class="btn-primary btn-xs btn">Back</a>
		</div>	
		</div>		
		<!-- </div> -->	
        </div>


            </div>
		
		
		
         
        
	

<div class="space col-xs-12 col-sm-12"></div>
<div class="space col-xs-12 col-sm-12"></div>
<div class="space col-xs-12 col-sm-12"></div>
<div class="space col-xs-12 col-sm-12"></div>
<div class="space col-xs-12 col-sm-12"></div>
 
</div>

<script>
$(function(){
	
	$('#id-disable-check').on('click', function() {
		var inp = $('#form-input-readonly').get(0);
		if(inp.hasAttribute('disabled')) {
			inp.setAttribute('readonly' , 'true');
			inp.removeAttribute('disabled');
			inp.value="This text field is readonly!";
		}
		else {
			inp.setAttribute('disabled' , 'disabled');
			inp.removeAttribute('readonly');
			inp.value="This text field is disabled!";
		}
	});


	
	$(window)
	.off('resize.chosen')
	.on('resize.chosen', function() {
		$('.chosen-select').each(function() {
			 var $this = $(this);
			 $this.next().css({'width': $this.parent().width()});
		})
	}).trigger('resize.chosen');


	$('#chosen-multiple-style').on('click', function(e){
		var target = $(e.target).find('input[type=radio]');
		var which = parseInt(target.val());
		if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
		 else $('#form-field-select-4').removeClass('tag-input-style');
	});

	
	$('#files1').ace_file_input({
		style:'well',
		btn_choose:'Drop files here or click to choose',
		btn_change:null,
		no_icon:'ace-icon fa fa-cloud-upload',
		droppable:true,
		thumbnail:'small'
		,
		preview_error : function(filename, error_code) {
			
		}

	}).on('change', function(){
	
	});
	

	//dynamically change allowed formats by changing allowExt && allowMime function
	$('#id-file-format').removeAttr('checked').on('change', function() {
		var whitelist_ext, whitelist_mime;
		var btn_choose
		var no_icon
		if(this.checked) {
			btn_choose = "Drop images here or click to choose";
			no_icon = "ace-icon fa fa-picture-o";

			whitelist_ext = ["jpeg", "jpg", "png", "gif" , "bmp"];
			whitelist_mime = ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"];
		}
		else {
			btn_choose = "Drop files here or click to choose";
			no_icon = "ace-icon fa fa-cloud-upload";
			
			whitelist_ext = null;//all extensions are acceptable
			whitelist_mime = null;//all mimes are acceptable
		}
		var file_input = $('#files');
		file_input
		.ace_file_input('update_settings',
		{
			'btn_choose': btn_choose,
			'no_icon': no_icon,
			'allowExt': whitelist_ext,
			'allowMime': whitelist_mime
		})
		file_input.ace_file_input('reset_input');
		
		file_input
		.off('file.error.ace')
		.on('file.error.ace', function(e, info) {
			
		});
	
	});
});

</script>