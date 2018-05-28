<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="in.fiinfra.common.common.DocumentData"%>
<%@page import="in.fiinfra.common.common.DocumentRequest"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
$(document).ready(function(){  
    $("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
 
});
</script>
<!-- Custom Selectbox Ends -->

<!-- Type of emergency faced select starts -->
<script>
var desiredWidth;
$(document).ready(function(){	
	$("#takePicture").on("change",gotPic);
	$("#selectFile").on("change",gotPic);
	//$("#previewPane").load(getSwatches);
	desiredWidth = window.innerWidth;
	
	if(!("url" in window) && ("webkitURL" in window)) {
        window.URL = window.webkitURL;   
    }
	
  $(".thumb_select_ul a").click(function(){
 $(".thumb_select_ul a").children(".categoery").removeClass("not_applicable");
    $(this).children(".categoery").addClass("not_applicable");	
	
});
  
  $("#photo_upload").click(function(event){
	  event.preventDefault();
      $(this).next().trigger('click');
  });

 	$('#takePicture').css("visibility", "hidden");

});


function gotPic(event) {
    if(event.target.files.length == 1 && 
       event.target.files[0].type.indexOf("image/") == 0) {
        $("#previewPane").attr("src",URL.createObjectURL(event.target.files[0]));
    }
}

function takePicture(){
	$('#selectFile').val('');
	$('#selectFile').css("visibility", 'hidden');
	$('#takePicture').css("margin", '-22px auto 0');
	$('#takePicture').css("visibility", 'visible');
	$('#takePicture').click();
}
function selectFile(){
	$('#takePicture').val('');
	$('#takePicture').css("visibility", 'hidden');
	$('#takePicture').css("margin", '10px auto 0');
	$('#selectFile').css("visibility", 'visible');
	$('#selectFile').click();
}

function saveDocument(){
	var filename = $('#selectFile').val();
	var takephoto = $('#takePicture').val();
	var ext = '';
	 if(filename != null && filename != '')
		 ext = filename.substring(filename.indexOf('.')+1, filename.length).toLowerCase();
	 else if(takephoto != null && takephoto != '') 
		 ext = takephoto.substring(takephoto.indexOf('.')+1, takephoto.length).toLowerCase();
	if(filename == '' && takephoto == '') {
		$("#successDialog").html("Please select a file");
		$( "#successDialog").dialog( "open" );
	} 
	else if($('#documentName').val().trim() == '') {
		$("#successDialog").html("Please enter document name");
		$( "#successDialog").dialog( "open" );
	}
	else if($('#documentType').val() == 10001 && (ext == 'png' || ext == 'jpg' ||ext == 'bmp' ||ext == 'jpeg' ||ext == 'mp3' ||ext == 'avg' ||ext == 'exe')){
		$("#successDialog").html("Please enter valid document");
		$( "#successDialog").dialog( "open" );
	}
	else if($('#documentType').val() != 10001 && !(ext == 'png' || ext == 'jpg' ||ext == 'bmp' ||ext == 'jpeg')){
		$("#successDialog").html("Please enter valid image file");
		$( "#successDialog").dialog( "open" );
	}
	else {
		$('#document-form').submit();
	}
}
</script>
<% 
   DocumentData doc = (DocumentData) request.getAttribute("document");
	DocumentRequest docReq =(DocumentRequest) request.getAttribute("docReq");
%>
<!-- Common_in_contnet starts-->

<section class="in_content add-document common_in_content clearfix">
<%if(docReq.getCurrentRefTypeId() == 111002 || doc.getRefTypeId() == 111006) { %>
<jsp:include page="../layout/submenu_small.jsp"></jsp:include>
<%}
else {%>
<jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
<%} %>
  <form:form action="${pageContext.request.contextPath}/document/save"
			commandName="document" method="POST" enctype="multipart/form-data"
			id="document-form">
    <form:input path="refId" type="hidden"  />
    <form:input path="refTypeId" type="hidden"  />
    <form:input path="sectionId" type="hidden"  />
    <form:input path="partyId" type="hidden"  />
    <input type="hidden" name="returnUrl" value = "${returnUrl}">
    <div class="add_docs_parent">
      <h2 class="heading"><span class="title">Add Document</span><a href="${pageContext.request.contextPath}/document/view?refId=<%=doc.getRefId()%>&refTypeId=<%=doc.getRefTypeId()%>&partyId=<%=doc.getPartyId()%>&sectionId=<%=doc.getSectionId()%>&currentPartyId=<%=docReq.getCurrentPartyId()%>&currentRefId=<%=docReq.getCurrentRefId()%>&currentRefTypeId=<%=docReq.getCurrentRefTypeId()%>&<%=BaseRequest.encode("returnUrl",(String) request.getAttribute("returnUrl"))%>" class="add_docs_btn_back"><span class="add_docs_btn_back_txt">Back</span></a> 
      <a href="${pageContext.request.contextPath}/document/view?refId=<%=doc.getRefId()%>&refTypeId=<%=doc.getRefTypeId()%>&partyId=<%=doc.getPartyId()%>&sectionId=<%=doc.getSectionId()%>&currentPartyId=<%=docReq.getCurrentPartyId()%>&currentRefId=<%=docReq.getCurrentRefId()%>&currentRefTypeId=<%=docReq.getCurrentRefTypeId()%>&<%=BaseRequest.encode("returnUrl",(String) request.getAttribute("returnUrl"))%>" class="add_docs_btn view_doc_btn">
          <span class="add_docs_btn_txt">View Document</span></a></h2>
      <div class="add_docs_parent_inside">
        <div class="first_column">
          <ul class="reset clearfix second_col_ul">
            <li class="clearfix">
              <div class="preview_label">
                <label class="label">Section</label>
              </div>
              <div class="preview_label_cnt">
                <form:select path="sectionId" id="sectionId"
									items="${sections}" itemLabel="name" itemValue="id" class="required"> </form:select>
              </div>
              </p>
            </li>
            <li class="clearfix">
              <p>
              <div class="preview_label">
                <label class="label">Document Type</label>
              </div>
              <div class="preview_label_cnt">
                <form:select path="documentType" id="documentType"
									items="${documentTypes}" itemLabel="name" itemValue="id" class="required"> </form:select>
              </div>
              </p>
            </li>
            <li class="clearfix">
              <p>
              <div class="preview_label">
                <label class="label">Document Name</label>
              </div>
              <div class="preview_label_cnt">
                <form:input path="documentName" class="input" placeholder="Document Name" type="text" />
              </div>
              </p>
            </li>
            <li class="clearfix">
              <p>
              <div class="preview_label">
                <label class="label">Description</label>
              </div>
              <div class="preview_label_cnt">
                <form:textarea path="description" class="comment" name="" cols="" rows="" placeholder="Document Description"/>
              </div>
              </p>
            </li>
            <li class="clearfix">
              <ul class="reset clearfix thumb_select_ul emergency_categoery_ul">                
                <li class="fl"><a onClick="takePicture();return false;">
                  <div class="categoery">
                    <div class="thumb add_docs_take_photo"></div>
                  </div>
                  <label class="label">Take Photo</label>
                  </a></li>
                <li class="fl"><a onClick="selectFile();return false;">
                  <div class="categoery not_applicable">
                    <div class="thumb add_docs_upload_file"></div>
                  </div>
                  <label class="label">Select File</label>
                  </a></li>
                <li class="fl"><a onClick="saveDocument();return false;">
                  <div class="categoery">
                    <div class="thumb add_docs_save"></div>
                  </div>
                  <label class="label">Save</label>
                  </a></li>
              </ul>
            </li>
          </ul>
        </div>
        <div id="swatches">
          <div id="swatch0" class="swatch"></div>
        </div>
        <div class="sec_column"> <img id="previewPane">
          <form:input path="files" type="file" id="selectFile" class="common_btn"  placeholder="File Name" />
          <form:input path="files" capture="camera" accept="image/*" class="common_btn" type="file" id="takePicture"  placeholder="File Name" />
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </form:form>
</section>
