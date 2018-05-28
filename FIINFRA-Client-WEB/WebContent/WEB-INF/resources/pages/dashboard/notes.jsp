<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="in.fiinfra.common.note.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<!-- custom scroll to "common_in_content" -->
<script>
	function saveNote() {		
		$('#note-form').submit();	
	}
</script>
<script>
$(document).ready(function(){
  
    $('.add_notes_parent_inside').slimScroll();
  });

</script>
<!-- custom scroll to "common_in_content" -->
</head>
<body>
<!-- Wrapper starts-->
<div class="wrapper" id="emergency_readiness"> 
  <!-- Main starts-->
  <section class="main"> 
    <% 
      Note note = (Note) request.getAttribute("note");
     List<Note> noteHistory = (List<Note>) request.getAttribute("noteHistory");
      
      %> 
      <form:form action="${pageContext.request.contextPath}/notes/save"
			commandName="note" method="POST" id="note-form">
    <section class="content common_content">
    <form:input path ="refId" type ="hidden"/>
    <form:input path ="refTypeId" type ="hidden"/>
    <form:input path ="noteId" type ="hidden"/>
    <input name="returnUrl" type="hidden" value="${returnUrl}" /> 
      <!-- Common_in_contnet starts-->
      <section class="in_content add_notes_page common_in_content clearfix" id="succession-readiness-analysis">
        <div class="add_notes_parent">
          <div class="first_column">
            <h2 class="heading">Add Notes</h2>
            
             <div style="overflow:scroll; overflow-x:hidden; height:80px;">
             
            <div class="add_notes_parent_inside">
              <div class="add_notes_description_up">
                <div class="add_notes_col">
                  <ul class="reset clearfix second_col_ul">
                   <% for(Note n:noteHistory){ %>
                    <li class="clearfix">
                      <p>
                        <label class="label"><%=n.getTitle() %></label>
                      <div class="cnt"> <%=n.getDescription() %> </div>
                      <div class="comment"><strong><%=n.getLastModifiedByName() %></strong>  <%=n.getLastModifiedDate()%> </div>
                      <div class="clr"></div>
                      </p>
                    </li>
                    <% } %>
                  </ul>
                  
                </div>
                
              </div>
              
              </div>
              
              </div>
              <div class="add_notes_description_down">
                <div class="add_notes_col">
                  <ul class="reset clearfix second_col_ul">
                    <li class="clearfix">
                      <p>
                        <label class="label">Title</label>
                      <!--   <input id="second_col_input" class="add_notes_common_textarea" placeholder="Title" type="text" name="input"> -->
                        <form:input path="title" class="add_notes_common_textarea" 
									placeholder="Title" id="second_col_input" />
                      <div class="clr"></div>
                      </p>
                    </li>
                    <li class="clearfix">
                      <label class="label">Description</label>
                     <!--  <textarea class="add_notes_content_in" name="" cols="" rows="" placeholder="Contact Type"></textarea> -->
                      <form:textarea path="description"  class="add_notes_content_in"  placeholder="Description" id="second_col_input" />
                    </li>
                    <li class="clearfix">
                      <input type="button" onClick="location.href='${pageContext.request.contextPath}${returnUrl}'" class="cancel_btn" value="Cancel">
                      <input type="submit" class="submit_btn"  onClick="saveNote()" value="Save">
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
       </section>
          <div class="clr"></div>
          
        
    
      <!-- Common_in_contnet ends --> 
      <!-- Common footer starts --> 
           <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup3">
            <li class="fl list"><a href="#" class="anch save"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="#" class="anch cancel"><span class="txt">Cancel</span></a></li>
            <li class="fl list"><a href="#" class="anch skip"><span class="txt">Skip</span></a></li>
          </ul>
          <ul class="reset clearfix fr btn_grup2">
            <li class="fl list"><a href="#" class="anch add_note"><span class="txt">Add Notes</span></a></li>
            <li class="fl list"><a href="#" class="anch add_doc"><span class="txt">Add Doc</span></a></li>
          </ul>
          <ul class="reset clearfix fl btn_grup1">
            <li class="fl list"><a href="#" class="anch analysis"><span class="txt">Analysis</span></a></li>
            <li class="fl list"><a href="#" class="anch suggeset"><span class="txt">Suggestion</span></a></li>
            <li class="fl list"><a href="#" class="anch action_plan"><span class="txt">Action Plan</span></a></li>
          </ul>
        </div>
        <a href="#" class="back navgation"><span class="txt">Back</span></a> <a href="#" class="next navgation"><span class="txt">Next</span></a></section>   
      
      <!-- Common footer ends -->
      <div class="overlay"></div>
    </section>
    </form:form>
    <!-- Common_content Ends--> 
  </section>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends-->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Add Notes</title>
<link rel="shortcut icon" href="../images/favicon.ico" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main-style.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/selectboxit.css" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery_ui_range_slider.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/selectboxit.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>

<!-- Custom Selectbox starts -->
<script>
$(document).ready(function(){
	
  
    $("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
    });
</script>
<!-- Custom Selectbox Ends -->



</head>
<body>
<div id="wrapper" class="clearfix">
  <div id="header"> <a class="logo" href="index.html"> <span id="logo"> <img src="../images/temp_logo.png" /></span><!-- end of "logo" id --> 
    </a> 
    <!-- <div id="advt1"> <img src="images/add1.png" /> </div>--> 
    <!-- end of "advt1" id -->
    
    <div id="advt2"> <img src="../images/add2.png" /> </div>
    <!-- end of "advt1" id -->
    
    <div id="ifa-image" class="clearfix fl"> <img src="../images/photo.jpg"  class="clearfix fl"/> <span class="ifa-name clearfix">Mr. A. B. Joshi</span> <span class="ifa-advisor clearfix">(Your Advisor)</span> </div>
    <!-- end of "ifa-image" id -->
    
    <div id="log-out"> <img class="logout" src="../images/transparent.png"/>
      <p>Logout</p>
    </div>
    <!-- end of "log-out" id --> 
  </div>
  <!-- end of "header" id -->
  
     <ul id="inner-nav-menu" class="clearfix ">
        	<li class="my-goals"><a href="my-goals.html"><img class="my-goals-ico" src="../images/transparent.png"/>
      <p>My Goals <span class="grad-border"><img src="../images/transparent.png"/></span></p>
      </a></li>
            <li class="my-plans"><a href="my-plan.html"><img class="my-plans-ico" src="../images/transparent.png"/>
      <p>My Plans<span class="grad-border"><img src="../images/transparent.png"/></span></p>
      </a></li>
            <li class="my-portf"><a href="my-portfolio.html"><img class="my-portf-ico" src="../images/transparent.png"/>
      <p>My Portfolio<span class="grad-border"><img src="../images/transparent.png"/></span></p>
      </a></li>
            <!--li class="my-inc"><a href="#"><img class="my-inc-ico" src="images/transparent.png"/><p>My Income<span class="grad-border"><img src="images/transparent.png"/></span></p></a></li-->
            <li class="my-cashflow"><a href="my-income.html"><img class="my-cashflow-ico" src="../images/transparent.png"/>
      <p>My Cashflow<span class="grad-border"><img src="../images/transparent.png"/></span></p>
      </a></li>
            <li class="my-fin"><a href="#"><img class="my-fin-ico" src="../images/transparent.png"/><p>My Financials<span class="grad-border"><img src="../images/transparent.png"/></span></p></a></li>    <li class="my-rep"><a href="my-reports.html"><img class="my-rep-ico" src="../images/transparent.png"/>
      <p>My Reports<span class="grad-border"><img src="../images/transparent.png"/></span></p>
      </a></li>
<li class="my-acc"><a href="#"><img class="my-acc-ico" src="../images/transparent.png"/><p>My Account<span class="grad-border"><img src="../images/transparent.png"/></span></p></a></li>           
     </ul><!-- end of "nav-menu" id -->  
  
  <div id="trapezoid" class="clearfix fr">
    <p>Welcome&nbsp;<span> Mr. Parag Takalkar</span></p>
  </div>
  <div id="header-strip" class="fl">
  
    <h3 class="clearfix fl">ADD NOTES</h3>
    <img class="short-menu clearfix fr"  src="../images/transparent.png" />  
    
  </div>
  
  <!-- end of "header-strip" id -->
  <div id="inner-shadow-strip"></div>
  <!-- end of "inner-shadow-strip" id -->
  <div class="clearfix"></div>
  <div id="contents" class="clearfix">
    <div id="add_notes" class="in_content clearfix"> 
       
         <div class="default_note">
         <h4 class="heading">Add Notes</h4>
                <div class="description clearfix"><div class="fl topic"><p class="topic_name">Lorem Ipsum</p></div>
                <div class="fr topic_content"><p class="topic_txt">Though we can't control it, we can respond better with some planning. If not prepared, an emergency might leave you poorer, debt ridden or helpless. You may fall down, but will you be able to get back on your feet again?</p></div><div class="clr"></div><div class="fr details">
                <span class="name">Karan Dutta</span><span class="date">28-Sep-2014</span>,<span class="time">11:23</span>
                </div></div>
                </div>
             <ul class="reset clearfix action">
            <li class="clearfix container_li">
              <label class="form_label">Title</label>
              <input id="second_col_input" class="common_input" type="text" name="input">
            </li>
            
            
            <li class="clearfix container_li">
              <label class="form_label">Description</label>
                    <textarea class="txt-editor common_textarea" name="" cols="" rows="" ></textarea>
            </li>
            
          </ul>
             
          
         
      
            <div class="footer_buttons"><ul class="reset clearfix btn_grup">
            
            
            <li class="fl list"><a class="anch save_n_close" href="#"><span class="txt">Save &amp; Close</span></a></li>
            <li class="fl list"><a href="#" class="anch cancel"><span class="txt">Cancel</span></a></li>
          </ul></div>       
        
                
       
        
         
     
    </div>
    <!-- end of "inner-contents" id --> 
  </div>
  <!-- end of "contents" id -->
  <footer id="footer"> <img src="../images/finfra-logo.png" /> <span class="copyright">Copyright © 2014 </span> <span class="privacy">Privacy Policy </span> </footer>
</div>
<!-- End of "wrapper" id -->
</body>
</html>