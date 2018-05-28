
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="in.fiinfra.question.OptionData"%>
<%@page import="in.fiinfra.question.QuestionData"%>
<%@page import="org.aspectj.weaver.patterns.TypePatternQuestions.Question"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>

<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.common.CodeValueData"%>
<%@page import="in.fiinfra.cp.ExpenseData"%>
<%@page import="in.fiinfra.common.diy.models.KeyValue"%>
<%@page import="java.util.List"%>




<div id="header-strip" class="fl"></div>
 
  <div id="inner-shadow-strip"></div>

  <div id="contents">
    <section class="in_content clearfix" id="feedback_main">
      <div class="feeback_bx_in">
      <h4>Thank You For Your feedback</h4>
    <%--  <h2> FeedBack Report</h2></br></br>
    <% List<QuestionData> lstQuestions= (List<QuestionData>)request.getAttribute("lstQuestions"); %>
    <% for(QuestionData lstQ:lstQuestions){ %>
    <h4><%=lstQ.getQuestion() %></h4></br>
    <%for(OptionData option:lstQ.getOptions()){  %>
    	<%if(option.isSelected()==true){ %>
    	<p><%=option.getOptionText()%></p>
    <%}%>
    <%} %>  </br>
    <hr>
    <%} %> --%>
      </div>
      <!-- DC submenu Ends--> 
      
    </section>
    <div class="clr"></div>
    
    <!-- end of "inner-contents" id --> 
  </div>
  <!-- end of "contents" id -->
  
  
<!-- End of "wrapper" id -->

