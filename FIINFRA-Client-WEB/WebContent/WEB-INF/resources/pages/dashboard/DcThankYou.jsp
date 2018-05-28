
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


<div id="header-strip" class="fl">
<jsp:include page="../menu.jsp"></jsp:include>
<h3>FEEDBACk</h3>
</div>
 
  <div id="inner-shadow-strip"></div>

  <div id="contents">
  <section class="in_content clearfix" id="x_ray_main">
      <div class="fin_x_ray">
        <!--div class="label">What's your monthly household expenditure?</div-->
        <div class="calcy_li_bx">
          <div class="calcy_li_bx_in">
            <div class="">
              <ul class="add_docs_bx_slider clearfix">
              
                
                
                <li>
                  <div class="congo">
                     <div class="smiley clearfix fl"><img src="${pageContext.request.contextPath}/resources/images/thank_u_smiley.png"></div>
                     
                     <div class="acknowledge clearfix fl">Thank you for submiting financial Report. We will get in touch with you soon.</div> 
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <!-- DC submenu Ends--> 
      
    </section>
    
    <div class="clr"></div>
    
    <!-- end of "inner-contents" id --> 
  </div>
  <!-- end of "contents" id -->
  
  
