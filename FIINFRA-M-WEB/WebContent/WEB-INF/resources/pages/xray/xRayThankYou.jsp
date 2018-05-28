
<%-- <%@page import="java.util.Map"%> --%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="in.fiinfra.question.OptionData"%>
<%@page import="in.fiinfra.question.QuestionData"%>
<%@page import="org.aspectj.weaver.patterns.TypePatternQuestions.Question"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>

<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.common.CodeValueData"%>
<%@page import="in.fiinfra.cp.ExpenseData"%>
<%@page import="in.fiinfra.common.diy.models.KeyValue"%>

<%-- <%@page import="java.util.List"%> --%>
<script>
/* $(document).ready(function(){
  $('.add_docs_bx_slider').bxSlider();
  $(".bx-prev").hide();
  $(".bx-next").hide();
}); */
</script>
<script>
$(document).ready(function(){
  $("body").on("click",".common_custom_checkbox",function(){
    $(this).toggleClass("white_checkbox_checked");
	
	 if ($(this).next( ".default_checkbox" ).is(":checked")) {
		
       $(this).next( ".default_checkbox" ).prop("checked", false);
    } else {
       $(this).next( ".default_checkbox" ).prop("checked", true);
	
    }
	
  });
});
</script>
<div id="wrapper" class="clearfix">

<%-- <div id="header-strip" class="fl">
<jsp:include page="../menu.jsp"></jsp:include>
<h3>FINANCIAL X-Ray</h3>
</div> --%>
 <section class="content common_content"> 
    <jsp:include page="../layout/submenu_small.jsp"></jsp:include>
  <div id="inner-shadow-strip"></div>
	<% Integer answered = (Integer)request.getAttribute("view");
		if(answered==null)
			answered=1;
	
	%>

  <div id="contents">
  <section class="in_content clearfix" id="x_ray_main">
      <div class="fin_x_ray">
        <!--div class="label">What's your monthly household expenditure?</div-->
        <div class="calcy_li_bx">
          <div class="calcy_li_bx_in">
           <% if(answered>0){ %>
            <div class="add_document_slider">
              <ul class="clearfix">
                 <!-- <li> -->
                  <div class="congo" style="width: 865px;">
                     <div class="smiley clearfix fl"><img src="${pageContext.request.contextPath}/resources/images/thank_u_smiley.png"></div>
                     <div class="congrates clearfix fl">Congratulations !</div>
                     <div class="acknowledge clearfix fl">Thank you for your valuable time. We will shortly send you a detail financial report on your e-mail ID.</div> 
                 
                 <div class="clearfix"></div>
                  </div>
                <!-- </li> -->
              </ul>
            </div>
            <%}else{ %>
            <div >
              <ul class="clearfix">
                
                
                <!-- <li> -->
                <div class="congo_feedback">
                     <div class="congrates">OOPS !</div>
                     <div class="acknowledge">You have not answered any of the questions. <br />
<a href="${pageContext.request.contextPath}/xray/showQuestions?partyID=${partyId}&name=${headerName}">Click here</a> to start again </div> 
                  </div>
                  
                  <!--<div class="congo" style="margin-left:100px ">
                     <div class="smiley clearfix fl"></div>
                     <div class="congrates clearfix fl">OOPS !</div>
                     <div class="acknowledge clearfix fl">You have not answered any of the question.&nbsp;<a style="text-decoration: underline; color:#fff" href="${pageContext.request.contextPath}/question/xray">Click here</a> to start again </div> 
                  </div>-->
              <!--   </li> -->
              </ul>
            </div>
            <%} %>
            
          </div>
        </div>
      </div>
      <!-- DC submenu Ends--> 
      
    </section>
    
    <div class="clr"></div>
    
    <!-- end of "inner-contents" id --> 
  </div>
  <!-- end of "contents" id -->
  
  </section>
</div>
<!-- End of "wrapper" id -->
