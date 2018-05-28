
<%@page import="java.util.Map"%>
<%@page import="in.fiinfra.common.common.FaqsQuestionsData"%>
<%@page import="java.util.List"%>
<script>
  $(function() {
    $( ".category_accordian" ).accordion({
      heightStyle: "content"
    });
  });
  </script>
<script>
$(document).ready(function () {
    /* Equity*/
    
    $(".question_type").click(function () {
      //  $(".equity_question_bx").FadeIn("slow");
         $(".active").removeClass("active");
         $(this).addClass("active");
        var catId = $(this).prop('id');
        var detailId = catId+'_details';
		 $.when($(".question_bx").not($(detailId)).fadeOut("slow")).done(function() {
          $('#'+detailId).fadeToggle("slow");
		  });
       });
    
    $('.question_bx:not(.first)').fadeOut("slow");
   
});
</script>
<script>
$(function() {
$( "#accordion1" ).accordion({
	collapsible: true ,
	heightStyle: "content",
	animate: 250,
	header: ".accordion-header"
}).sortable({
	axis: "y",
	handle: ".accordion-header",
	stop: function( event, ui ) {
		// IE doesn't register the blur when sorting
		// so trigger focusout handlers to remove .ui-state-focus
		ui.item.children( ".accordion-header" ).triggerHandler( "focusout" );
	}
});
});

</script>

<% Map<String,List<FaqsQuestionsData>> faqs = (Map<String,List<FaqsQuestionsData>>) request.getAttribute("faqs"); %>
  <%-- <div id="header-strip" class="fl">
  <jsp:include page="../menu.jsp"></jsp:include>
    <h3 class="clearfix fl">FAQs</h3> 
    
  </div> --%>
  
  <!-- end of "header-strip" id -->
  <!-- <div id="inner-shadow-strip"></div> -->
  <!-- end of "inner-shadow-strip" id -->
  <!-- <div class="clearfix"></div>
  <div id="contents" class="clearfix">
    <div id="faq" class="in_content clearfix">  -->
       
         <%-- <div class="fl" id="question_category">
         <ul class="reset clearfix cateogery_ul">
         <% 
          boolean firstRecord = true;  
         for(Map.Entry<String,List<FaqsQuestionsData>> entry:faqs.entrySet()){ 
         	FaqsQuestionsData first =  entry.getValue().iterator().next();
         %>
         <li id="<%=first.getFaqModuleID() %>" class="question_type <%=firstRecord?"active":"" %> "><%=first.getFaqQuestionModuleName()%></li>
         <% firstRecord = false; 
         }%>
         </ul>
         
         </div> --%>
         
        <%--  <% boolean firstRow = true;  
         for(Map.Entry<String,List<FaqsQuestionsData>> entry:faqs.entrySet()){ 
         	FaqsQuestionsData first =  entry.getValue().iterator().next();
         	int i = 0;
         %>
         
         <div class="question_bx fr <%=firstRow?" first":"" %>" id="<%=first.getFaqModuleID() %>_details" style="width:67%" >
         <div id="accordion" class="category_accordian">
         
         <% for(FaqsQuestionsData q:entry.getValue()) {%>
         
  		 <h3><span class="question_no">Q<span class="count"><%=++i %></span>.</span><%=q.getFaqQuestion() %></h3>
  <div class="clearfix">
    <div class="fl type">A.</div>
    <div class="fr ans">
    <p class="txt"><%=q.getFaqAnswer() %></p> 
    </div>
  </div>		 
  		 <%} %>
</div>  		        
         </div>  <%
         firstRow = false;
         } %> --%>
 

     
   <!--  </div> -->
    <!-- end of "inner-contents" id --> 
  <!-- </div> -->
  <!-- end of "contents" id -->

<!-- End of "wrapper" id -->

<!-- new code -->
	<div class="col-xs-12">
	<div class="col-sm-4 sidebar-offcanvas">
	<div class="list-group" style="padding-left: 10px;" id="faqsModules">
	<div class="table-header">All FAQs</div>
		<table class="ListTable table table-striped table-bordered table-hover">
			<tbody>
			<% 
          boolean firstRecord = true;  
         for(Map.Entry<String,List<FaqsQuestionsData>> entry:faqs.entrySet()){ 
         	FaqsQuestionsData first =  entry.getValue().iterator().next();
         %>
				<tr>
				<td id="<%=first.getFaqModuleID() %>" class="question_type <%=firstRecord?"active":"" %> "><%=first.getFaqQuestionModuleName()%></td>
				
				</tr>
				 <% firstRecord = false; 
         }%>
			</tbody>
		</table>
	</div>
	</div>
	
	
	
	<div class="col-sm-8">
	<div class="list-group nomargin">
		<div class="table-header">FAQs</div>
		<div class="faq faqs list-group-item"
			style="display: block;">
			<h5 class="strong">General</h5>
	<div id="accordion1"
		class="accordion-style2 ui-accordion ui-widget ui-helper-reset ui-sortable"
		role="tablist">
		
		<% boolean firstRow = true;  
         for(Map.Entry<String,List<FaqsQuestionsData>> entry:faqs.entrySet()){ 
         	FaqsQuestionsData first =  entry.getValue().iterator().next();
         	int i = 0;
         %>
          <div class="question_bx <%=firstRow?" first":"" %>" id="<%=first.getFaqModuleID() %>_details">
          <div class="group" id="<%=first.getFaqModuleID() %>_details">
		<% for(FaqsQuestionsData q:entry.getValue()) {%>
		
			<h3	class="accordion-header ui-accordion-header ui-state-default ui-accordion-icons ui-sortable-handle ui-corner-all"
				role="tab" id="ui-id-23" aria-controls="ui-id-24"
				aria-selected="false" aria-expanded="true" tabindex="0">
				<span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>Q<%=++i %>&nbsp<%=q.getFaqQuestion() %>
				
			</h3>
	
			<div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom"
				id="ui-id-24" aria-labelledby="ui-id-23" role="tabpanel"
				aria-hidden="true" style="display: none;">
				<p><b>Ans.</b>&nbsp<%=q.getFaqAnswer() %></p>
			</div>
		
		<%} %>
		</div>
		</div>
		<%
         firstRow = false;
         } %>
	</div>
	</div>
	</div>
	<!-- #accordion -->
</div>
	</div>
<!-- new code End -->
