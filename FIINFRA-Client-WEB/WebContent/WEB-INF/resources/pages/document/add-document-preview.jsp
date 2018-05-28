<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="in.fiinfra.common.diy.models.KeyValue"%>
<%@page import="in.fiinfra.common.common.DocumentRequest"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.common.common.DocumentData"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
  <%
         List<DocumentData> documents = (List<DocumentData>) request.getAttribute("documents");
   	     DocumentRequest q = (DocumentRequest) request.getAttribute("q");
   	    		 
	%>

<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.bxslider.js"></script>

<!-- custom scroll to "common_in_content" -->
<script> 
var previewUrl = "${pageContext.request.contextPath}/document/view.ajax?partyId=<%=q.getPartyId()%>" ;
$(document).ready(function(){
  
 // $('.add_docs_parent_inside').slimScroll();
  });

</script>
<!-- custom scroll to "common_in_content" -->

<!-- Custom Selectbox starts -->
<!-- Custom Selectbox Ends -->

<!-- Type of emergency faced select starts -->
<script>
$(document).ready(function(){
  $(".thumb_select_ul a").click(function(){
 $(".thumb_select_ul a").children(".categoery").removeClass("not_applicable");
    $(this).children(".categoery").addClass("not_applicable");
	
});

$("#borrow_sell").on('toggle', function (e, active) {
    if (active) {
   

	  $(".divshow ").fadeIn("slow");
	
	   
    } else {
    
	  
	   $(".divshow ").fadeOut("slow");
    }
	
});

});
</script>
<!-- Type of emergency faced select ends -->

<!--Slider Starts -->

<script >
function ConfirmDeletion(docId){
	
	showConfirm("Delete Current Document ?", function() {
		
		if(docId && docId >0){
			
			 $.ajax(
					    {
					        url : "${pageContext.request.contextPath}/document/delete",
					        type: "POST",
					        dataType: 'json',
					        data : {documentId:docId},
					        success:function(data, textStatus, jqXHR)
					        {	
					        	showMessage('Document Deleted',false);	
					        	loadDocument(previewUrl+'&documentTypeId='+ $('#documentType').val()+'&refTypeId='+$('#section').val());
					        },
					        error: function(jqXHR, textStatus, errorThrown)
					        {
					        	console.log(errorThrown);
					        	showMessage('Error While Delete.'+errorThrown,true);
					        }
					    });
			
		}
	});
}

</script>



<script>

function loadDocument(url){
	console.log(url);
	 $.ajax(
			    {
			        url : url,
			        type: "GET",
			        success:function(data, textStatus, jqXHR)
			        {	
			        	
			        	console.log(data);
			        	$('#my-doc-main').empty();
			        	$('#my-doc-main').html(data);
			        	
			        },
			        error: function(jqXHR, textStatus, errorThrown)
			        {
			        	console.log(errorThrown);
			        	showMessage('Error While Getting Document.',true);
			        }
			    });
}


$(document).ready(function(){
  $('.add_docs_bx_slider').bxSlider();
  $("#documentType").change(	function() {
	  loadDocument(previewUrl+'&documentTypeId='+ $(this).val()+'&refTypeId='+$('#section').val());
  });
  $("#section").change(	function() {
	  loadDocument(previewUrl+'&documentTypeId='+ $("#documentType").val()+'&refTypeId='+$(this).val());
  });

});




</script>

<!--Slider Starts -->
  <!-- Main starts-->
		
  <section class="main"> 
      
  <!--   ?refId=279&refTypeId=111006&partyId=6362&sectionId=-1&returnUrl=%2Fquery%2Fview%3FqueryId%3D279 -->
    
     <section class="in_content add-document common_in_content clearfix">
        <div class="add_docs_parent"><br/><br/>
          <%-- <li><a href="${pageContext.request.contextPath}/document/preview?refId=<%=q.getPartyId()%>&refTypeId=1&<%=BaseRequest.encode("returnUrl", "/document/add")%>" class="add_doc"> </a></li> --%>  
          
          <div class="add_documents_parent_inside">
            <%-- <div class="first_column">
              <ul class="reset clearfix ">
                <div class="bx clearfix">
                  <p>
                  <div class="preview_label">
                    <label class="label">Section</label>
                  </div>
                  <div class="preview_label_cnt">
                                    <select id="section">
                  <% List<KeyValue> sections =(List<KeyValue>) request.getAttribute("sections");
                  	//sections.add(0,new KeyValue(-1, "--Select--"));
                  for (KeyValue idv:sections){
                  %>
                  <option value='<%=idv.getId()%>'><%=idv.getName()%></option>
                  <%}%> 
                  </select>
                  </div>
                  </p>
                </div>
                <div class="bx clearfix">
                  <p>
                <div class="preview_label">
                    <label class="label">Document Type</label>
                  </div>
                  <div class="preview_label_cnt">
                  <select id="documentType">
               <% List<KeyValue> docTypes =(List<KeyValue>) request.getAttribute("documentTypes");
               	docTypes.add(0,new KeyValue(-1, "--Select--"));
                  for (KeyValue idv:docTypes){
                  %>
                  <option value='<%=idv.getId()%>'><%=idv.getName()%></option>
                  <%}%>
                  </select>
                  </div>
                  </p>
                </div>
              </ul>
            </div> --%>
            
            
<fieldset>
        <div class="topmenu pull-right">
         <span class="title"></span><a href="${pageContext.request.contextPath}/document/add?<%=BaseRequest.encode("returnUrl", "/document/view")%>" class="btn-primary btn-xs btn" >Add New Document</span></a></div>
         <br/><br/>
         <div class="row">
          <div class="col-xs-6 ">
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">Section</label>
					<div class="col-lg-4">
						<select id="section">
                  <% List<KeyValue> sections =(List<KeyValue>) request.getAttribute("sections");
                  	//sections.add(0,new KeyValue(-1, "--Select--"));
                  for (KeyValue idv:sections){
                  %>
                  <option value='<%=idv.getId()%>'><%=idv.getName()%></option>
                 <%}%> E	`
                  </select>
					</div>
				</div>
				<br>
				<br>
            </div>
				<div class="col-xs-6 ">
					<div class="form-group">
						<label for="textArea" class="col-lg-4 control-label">Document Type</label>
						<div class="col-lg-4">
							 <select id="documentType">
               <% List<KeyValue> docTypes =(List<KeyValue>) request.getAttribute("documentTypes");
               	docTypes.add(0,new KeyValue(-1, "--Select--"));
                  for (KeyValue idv:docTypes){
                  %>
                  <option value='<%=idv.getId()%>'><%=idv.getName()%></option>
                  <%}%>
                  </select>
						</div>
					</div>
					<br> <br>
				</div>
				</div>
			</fieldset>
            
            
            
            <!-- Second Column Starts-->
          <!--   <div class="Second_column">  -->
              <!--Custom News Modal-->
             <!--  <div class="add_document_slider clearfix"> -->
                <div id="contents">
  				<div id="my-doc-main">
                
                <jsp:include page="document_ajax.jsp" />
                </div>
                </div>
                <!--  </div> -->
            <!--   </div> -->
            </div>
                  
   <!-- Second Column Ends--> 
          </div>
    </section>
     <div class="clr"></div>
    <!-- Common_content Ends--> 
  </section>
  <!-- Main ends--> 
