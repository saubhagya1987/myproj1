<!DOCTYPE html>
<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.common.DocumentData"%>

<!-- custom scroll to "common_in_content" -->
<style>
    .bx-prev.disabled, .bx-next.disabled {display: none !important}
</style> 

<script>
$(document).ready(function(){
    $('.add_document_slider').bxSlider({
        infiniteLoop : false,
        hideControlOnEnd: true,
        autoControls : false
    });
});
</script>   

<!-- custom scroll to "common_in_content" -->

<!-- Custom Selectbox starts -->
<script>
$(document).ready(function(){
  
    $("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
 
});
</script>

 <div class="topmenu pull-right"> 
 <a href="${pageContext.request.contextPath}/document/view" class="btn-primary btn-xs btn">Back</a></div>
<!-- Custom Selectbox Ends -->

<!--Slider Starts -->


<!--Slider Starts -->



<!-- Wrapper starts-->

<%-- <div id="header-strip" class="fl">
    <h3 class="clearfix fl">PREVIEW DOCUMENT</h3>
    <a class="add_docs_back_btn" href="${pageContext.request.contextPath}/document/view">Back</a>
    <jsp:include page="../menu.jsp"></jsp:include>
    </div> --%>
    
  <!-- end of "header-strip" id -->
  <!-- <div id="inner-shadow-strip"></div> -->
  <!-- Main starts-->
    <!-- Common_content Starts-->
      <% DocumentData d = (DocumentData) request.getAttribute("document"); 
      	  String fileType = StringUtils.substringAfter(d.getFileName(), ".");
       %>
      <!-- Common_in_contnet starts-->
      <div>
      <br><br><br><br>
      
        <div class="">
          <div class="">
            
            <!-- Second Column Starts-->
            <div class=""> 
              <!--Custom News Modal-->
              <div class="">
                <ul class="">
                  <li>
                    <div class="">
                      <div class=""> <%if("PDF".equalsIgnoreCase(fileType)){ %> 
                      <iframe height="100%" width="100%" src="${pageContext.request.contextPath}/document/files/<%=d.getDocumentId() %>" class="fl" ></iframe>
<%--                       <iframe height="298" width="577"> 
                      	<html>
							<body>
    						<object data="your_url_to_pdf" type="application/pdf">
        					<embed src="${pageContext.request.contextPath}/document/files/<%=d.getDocumentId() %>" 
        					  type="application/pdf" />
    						</object>
						</body>
						</html>
					</iframe>
 --%>					<%} else if(FiinfraUtility.isImageType(fileType)){%>
					<img id="previewPane" height="100%" width="100%" src="${pageContext.request.contextPath}/document/files/<%=d.getDocumentId() %>">
					<%} else{ %>
                      <iframe height="100%" width="100%" src="${pageContext.request.contextPath}/document/files/<%=d.getDocumentId() %>" class="fl" ></iframe>
                    <%}%>  
                    </div>
                      
                    </div>
                    <div class="clr"></div>
                  </li>
                
                   </ul>
              </div>
            </div>
                   <div class="clr"></div>
   <!-- Second Column Ends--> 
          </div>
        </div>
      
      </div>
    <div class="clr"></div>
    <!-- Common_content Ends--> 

  <!-- Main ends--> 
