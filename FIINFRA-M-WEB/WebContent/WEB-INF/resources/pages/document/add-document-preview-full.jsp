<%@page import="in.fiinfra.common.common.DocumentRequest"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="in.fiinfra.common.common.DocumentData"%>

<%-- <script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.bxslider.js"></script> --%>

<!-- custom scroll to "common_in_content" -->
<script>
$(document).ready(function(){
  });

</script>
<!-- custom scroll to "common_in_content" -->

<!-- Custom Selectbox starts -->
<script>
$(document).ready(function(){
  
    $("select").selectBoxIt();
 
});
</script>
<!-- Custom Selectbox Ends -->

<!--Slider Starts -->
<script>
$(document).ready(function(){
  $('.add_docs_bx_slider').bxSlider();
  
});
</script>

<!--Slider Starts -->
    <!-- Common_content Starts-->
    <section class="content common_content">
      <% DocumentData d = (DocumentData) request.getAttribute("document"); 
      	DocumentRequest q = (DocumentRequest) request.getAttribute("q");
      %>
      <!-- Common_in_contnet starts-->
      <section class="in_content add-document common_in_content clearfix">
        <div class="add_docs_parent">
          <div class="add_documents_parent_inside">
            
            <!-- Second Column Starts-->
            <div class="Third_column"> 
              <!--Custom News Modal-->
              <div class="add_document_slider clearfix">
                <ul class="add_docs_bx_slider clearfix">
                  <li>
                    <div class="list_bx">
                      <div class="img"> <iframe src="${pageContext.request.contextPath}/document/files/<%=d.getDocumentId() %>" class="fl" height="398" width="577"></iframe></div>
                    </div>
                    <div class="clr"></div>
                  </li>
                  
                </ul>
                    <a class="add_docs_back_btn" href="${pageContext.request.contextPath}/document/view?refId=<%=q.getRefId()==null?0:q.getRefId()%>&refTypeId=<%=q.getRefTypeId()%>&partyId=<%=q.getPartyId()%>&sectionId=<%=q.getSectionId()==null?-1:q.getSectionId()%>&<%=BaseRequest.encode("returnUrl", q.getReturnUrl())%>">Back</a>
              </div>
            </div>
                   <div class="clr"></div>
   <!-- Second Column Ends--> 
          </div>
        </div>
      </section>
      
      <!-- Common_in_contnet ends -->      
      <div class="overlay"></div>
    </section>
