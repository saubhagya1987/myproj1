<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="in.fiinfra.common.diy.models.KeyValue"%>
<%@page import="in.fiinfra.common.common.DocumentRequest"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.common.common.DocumentData"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<% response.addHeader("Refresh","60"); %>
   <%
         List<DocumentData> documents = (List<DocumentData>) request.getAttribute("documents");
   	     DocumentRequest q = (DocumentRequest) request.getAttribute("q");
   	    		 
		%>

<%-- <script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.bxslider.js"></script>
 --%>
<!-- custom scroll to "common_in_content" -->
<script>
var refRecordId = <%=q.getRefId()%>;
var previewUrl = "${pageContext.request.contextPath}/document/view.ajax?refId=<%=q.getRefId()==null?0:q.getRefId()%>&refTypeId=<%=q.getRefTypeId()%>&partyId=<%=q.getPartyId()%>&<%=BaseRequest.encode("returnUrl", q.getReturnUrl())%>" ;
$(document).ready(function(){
  
  });

function jsonPopulateDropdown(url, data, dropdown, fieldName, selectedValue) {
	$(dropdown).empty();
	$(dropdown).data("selectBox-selectBoxIt").add({ value: "", text: " -- Select --"});
	
	$.ajax({
			type : "GET",
			url : url,
			data : data,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
				$.each(msg, function(index, item) {					
					if(item.codeValueId==selectedValue){
						$(dropdown).data("selectBox-selectBoxIt").add({ value: item.codeValueId, text: item.codeValue, selected:true });
						displayFlag=0;
					}else{
						$(dropdown).data("selectBox-selectBoxIt").add({ value: item.codeValueId, text: item.codeValue });
					}
										
				});

				var selectBox = $(dropdown).selectBoxIt().data('selectBox-selectBoxIt');			    
			    selectBox.selectOption(selectedValue);
			},
			error : function(msg) {
				$('.result').html(msg.d);
			}
		});	
	return false;
}

</script>
<!-- custom scroll to "common_in_content" -->

<!-- Custom Selectbox starts -->
<script>
var displayFlag="";
$(document).ready(function(){  
    $("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
	 jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=DocumentRefTypeId", '{}', "#section",'','${sectionId}');
	 $("select#section").bind({
			"change": function(){				
				if($("#section").val() != ""){					
					var sectionId = $("#section").val();
					if(displayFlag==1){
						var url = "${pageContext.request.contextPath}/document/view?refId=0<%//q.getRefId()==null?0:q.getRefId()%>&refTypeId=" + sectionId + "&returnUrl=<%=q.getReturnUrl()%>&dropdownFlag=1&currentPartyId=<%=q.getCurrentPartyId()%>&currentRefId=<%=q.getCurrentRefId()%>&currentRefTypeId=<%=q.getCurrentRefTypeId()%>";
						getDocuments(url, '{}');	
					}						
				}
			}
		});	
});
var d1 = '';
function getDocuments(url, data) {
	window.location.href=url;
	return false;
}
</script>
<!-- Custom Selectbox Ends -->

<!-- Type of emergency faced select starts -->
<script>
$(document).ready(function(){
  $(".thumb_select_ul a").click(function(){
 $(".thumb_select_ul a").children(".categoery").removeClass("not_applicable");
    $(this).children(".categoery").addClass("not_applicable");
	
	$("select#section").bind({
		"change": function(){
			if($("#country1").val() != ""){
				jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#country1").val(), '{}', "#state1");	
			}
		}
	});
		
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
<script>
$(document).ready(function(){
  $('.add_docs_bx_slider').bxSlider({infiniteLoop:false});
  $("#documentType").change(	function() {
	  $('#imageSlider').empty();
	  $('#imageSlider').load(previewUrl+'&documentTypeId='+ $(this).val(),
				function(response, status, xhr) {
					if (status == "error") {
						var msg = "Sorry but there was an error: ";
						$("#imageSlider").html(msg + xhr.status + " " + xhr.statusText);
					}
		});
	  
	});
});

function activateFlag(){
	displayFlag=1;
}

</script>

<!--Slider Starts -->
</head>
<body>
<!-- Wrapper starts-->
<div class="wrapper" id="emergency_readiness"> 
  <!-- Main starts-->
		
  <section class="main">       
      <section class="in_content add-document common_in_content clearfix">
      <%if(q.getCurrentRefTypeId() == 111002 || q.getCurrentRefTypeId() == 111006) { %>
			<jsp:include page="../layout/submenu_small.jsp"></jsp:include>
<%}
else {%>
<jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
<%} %>		
        <div class="add_docs_parent">
          <h2 class="heading"><span class="title">Preview Document</span> <a href="${pageContext.request.contextPath}<%=q.getReturnUrl()%>" class="add_docs_btn_back"><span class="add_docs_btn_back_txt">Back</span></a>
          <a href="${pageContext.request.contextPath}/document/add?refId=<%=q.getRefId()%>&refTypeId=<%=q.getRefTypeId()%>&partyId=<%=q.getPartyId()%>&sectionId=<%=q.getSectionId()==null?-1:q.getSectionId()%>&currentPartyId=<%=q.getCurrentPartyId()%>&currentRefId=<%=q.getCurrentRefId()%>&currentRefTypeId=<%=q.getCurrentRefTypeId()%>&<%=BaseRequest.encode("returnUrl", q.getReturnUrl())%>" class="add_docs_btn">
          <span class="add_docs_btn_txt">Add Document</span></a> </h2>
          <div class="add_documents_parent_inside">
            <div class="first_column">
              <ul class="reset clearfix ">
                <div class="bx clearfix">
                  <p>
                  <div class="preview_label">
                    <label class="label">Section</label>
                  </div>
                  <div class="preview_label_cnt">
                  <select id="section" onclick="activateFlag();">                  
                  </select>
                  </div>
                  </p>
                </div>
              </ul>
            </div>
            
            <!-- Second Column Starts-->
            <div class="Second_column"> 
              <!--Custom News Modal-->
               
              <div class="add_document_slider clearfix">
             <p class="hide">No document found</p>
              <jsp:include page="document_ajax.jsp" />
              <!-- <iframe src="#" id="docIframe"></iframe> -->
              </div>
            </div>
                   <div class="clr"></div>
   <!-- Second Column Ends--> 
          </div>
        </div>
      </section>
      <!-- Common footer ends -->
      <div class="overlay"></div>
    </section>
    <!-- Common_content Ends--> 
  </section>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends-->
</body>
</html>