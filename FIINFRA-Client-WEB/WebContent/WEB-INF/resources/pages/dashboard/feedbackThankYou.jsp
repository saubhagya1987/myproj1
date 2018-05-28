
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


<%-- <div id="header-strip" class="fl">
<jsp:include page="../menu.jsp"></jsp:include>
<h3>FEEDBACk</h3>
</div> --%>
 
 <% Integer answered = (Integer)request.getAttribute("view"); %>
  <!-- <div id="inner-shadow-strip"></div> -->

  <div id="contents">
  <section class="in_content" id="x_ray_main">
        <!--div class="label">What's your monthly household expenditure?</div-->
        <div class="widget-box">
         <%if(answered >0){ %>
         <%--  <div class="calcy_li_bx_in">
            <div class="">
              <ul class="add_docs_bx_slider clearfix">
              
                
                
                <li>
                  <div class="congo">
                     <div class="smiley clearfix fl"><img src="${pageContext.request.contextPath}/resources/images/thank_u_smiley.png"></div>
                     
                     <div class="acknowledge clearfix fl">Thank you for your feedback. Your feedback is valuable for us.</div> 
                  </div>
                </li>
              </ul>
            </div>
          </div> --%>
          <div class="space"></div>
              <div class="center">
              	<div>
              		<img src="${pageContext.request.contextPath}/resources/images/thank_u_smiley.png" height="200" width="250">
              	</div>
              </div>
              <div class="center">
              	<h2>Thank you for your feedback. Your feedback is valuable for us.</h2>
              </div>
          
          
          <%}else{ %>
          <%-- <div class="calcy_li_bx_in">
            <div class="add_document_slider">
              <ul class="add_docs_bx_slider clearfix">
                <li>
                  <div class="congo_feedback">
                     <div class="congrates">OOPS !</div>
                     <div class="acknowledge">You have not answered any of the questions. <br />
<a href="${pageContext.request.contextPath}/question/feedback">Click here</a> to start again </div> 
                  </div>
                </li>
              </ul>
            </div>
          </div> --%>
          
          <div class="center">
              	<div>
              		<i class="fa fa-frown-o fa-5x"></i>
              	</div>
              </div>
            <div class="center">
              	<h3>OOPS !</h3>
              </div>
            <div class="center">
              	<h2>You have not answered any of the questions. <br/><a href="${pageContext.request.contextPath}/question/feedback">Click here</a> to start again </h2>
              </div>
          
          <%} %>
        </div>
     
      <!-- DC submenu Ends--> 
      
    </section>
    
   
    
    <!-- end of "inner-contents" id --> 
  </div>
  <!-- end of "contents" id -->
  
  

<!-- End of "wrapper" id -->
