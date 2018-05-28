<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%> 
<style>
#page_loader { background: #fff url(${pageContext.request.contextPath}/resources/images/loader.gif) no-repeat center center; }
.page-content{width:100%}
.chosen-container { width:100% !important }
</style>
<head>
<%-- <% 
UserSession user = (UserSession) request.getSession().getAttribute("userSession");
   String theme = PartnerProfileController.getThemePath(user);
%>
<%if(theme != null){ %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
<%} %> --%>

</head>

<!-- Custom Selectbox starts --> 
 <script>
$(document).ready(function(){
  $('.wrapper').attr('id', 'task_list'); 
  $(".wrapper").addClass("new_contacts_wrapper");
  //  $("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
    $('#subject').placeholder();
  	$(".selectboxit-container").click(function(){
		$(".selectboxit-option-first").remove();
	});	
	 $("#task_list #task_list_page .div_dragger").click(function(){
    	$("#task_filter").slideToggle("slow");
		 $(":selectBox-selectBoxIt").each(function(){
       $(this).data('selectBox-selectBoxIt').refresh();
     });
		$(".div_dragger span").animate("slow").toggleClass("div_dragger_up","slow");
  	});
  
   // $('.common_in_content').slimScroll();
	//$('.data_ul_parent').slimScroll();
    var buttons = $( "#dialog1" ).dialog( "option", "buttons" );
	// setter
	$("#dialog1").dialog("option", "buttons", [{
	   text: "Ok",
	   click: function () {
		   $(this).dialog('close');
	   }
	}]);
	$(document).on("dialogopen", "#dialog1", function(event, ui) {
		setTimeout("$('#dialog1').dialog('close')",3000);
	});
	
	$("#back").addClass("inactiveLink");
	
	if(${totalTasks} <= 0)
	{
		$("#resetDropDowns").addClass("inactiveLink");
		$("#searchBtn").addClass("inactiveLink");
		
	}	
	
	/* // Start This Code is for rolebase security 
    var partnerSetupLinks = "${partnerSetupLinks}";
    var pieces = partnerSetupLinks.split(",");
    for(var i=0;i<pieces.length;i++){
     $("."+pieces[i]).attr("href","#");
     $("."+pieces[i]).addClass("inactiveLink");
    }
   // End This Code is for rolebase security   */

  });

</script>
<!-- custom scroll to "common_in_content" --> 
<!-- Filter section toggle ends --> 
<!-- Alrternate row color --> 
<script>
$(document).ready(function(){
  
 $(".records_ul:even").addClass("even_row");
 $(".records_ul:odd").addClass("odd_row");
 
 jsonPopulateDropdownForTasks("#Status", "#subject_category", '#priority');
 jsonPopulateDropdownAssignedTo("#assgined_to");
 
  });

</script>
<!-- Alrternate row color --> 
<!--Common Custom checkbox -->
<script>
/* $(document).ready(function(){
  $(".common_custom_checkbox").click(function(){
    $(this).toggleClass("common_custom_checkbox_checked");
	
	 if ($(this).next( ".default_checkbox" ).is(":checked")) {
		
       $(this).next( ".default_checkbox" ).prop("checked", false);
    } else {
       $(this).next( ".default_checkbox" ).prop("checked", true);
	
    }
	
  });
}); */
</script>
<div id="dialog1" class="common_dialog" style="text-align: center;"> </div> 
<body>
<!-- Wrapper starts-->
<div  id="task_list"> 
  <!-- Main starts-->
  
  <section class="main"> 
    <!-- Common_content Starts-->
    <section class="content common_content"> 
    <%-- <jsp:include page="../layout/submenu_small.jsp"></jsp:include> --%>
      <!-- Common_in_contnet starts-->
      <section id="task_list_page" class="in_content common_in_content clearfix">
      <div class="row">
	<div class="col-md-12">
 		
      <div id="task_filter">
      <ul class="reset clearfix parameters">
      <li class="col-md-3"><input type="text" class="common_input" placeholder="Subject" id="subject"/></li>
      <li class="col-md-3"><select  id="Status">
      <option>Status</option>
      <option>1</option>
      <option>2</option>
      </select></li>
      <li class="col-md-3"><select  id="subject_category">
      <option>Subject Category</option>
      <option>1</option>
      <option>2</option>
      </select></li>
      <li class="col-md-3"><select  id="assgined_to">
      <option>Assigned to</option>
      <option>1</option>
      <option>2</option>
      </select></li>
      <li class="col-md-3"><select  id="priority">
      <option>Priority</option>
      <option>1</option>
      <option>2</option>
      </select></li>
      </ul> 
   <!--    <ul class="reset clearfix action">
      <li><input type="button" value="Reset"class="common_btn" id="resetDropDowns"/></li>
      <li><input type="button" value="Search"  class="common_btn taskListSearchLink" id="searchBtn" onClick="search();"/></li>
      
      </ul> -->
      <div class="space"></div>
      <ul class="col-lg-3 col-lg-offset-9">
             <li class="btn-group">
				<input type="button" value="Search" class="btn btn-pink" id="searchBtn" onClick="search();"/>
              </li>
                <li class="btn-group"> 
              <input type="button" value="Reset" class="btn btn-pink" id="resetDropDowns"> 
                  </li>                     
      </ul>
      <div class="clr"></div>
     
      </div>
      <div class="div_dragger taskListSearchLink"><span></span></div>   
        <section id="task_records">
     <div class="actions clearfix">
        <div class="message"><span class="count" id="totalTaskFound"></span> <span id="toFrom">
        <c:choose>
    <c:when test="${totalTasks <= 0}">
       No Record found.
       <script>
       $(document).ready(function(){
       $("#next").addClass("inactiveLink");
	   
       });
       </script>
    </c:when>
    <c:when test="${totalTasks<10}">
    	<c:out value="${totalTasks}"></c:out>
        items found, displaying 1 to ${totalTasks} items.
    </c:when>
    <c:otherwise>
    	<c:out value="${totalTasks}"></c:out>
       items found, displaying 1 to 10 items.
    </c:otherwise>
    </c:choose>
         
        </span></div>
        <c:choose>
		<c:when test="${totalTasks gt 0}">
        	<div class="export clearfix"><ul class="reset clearfix fr"><li><a href="${pageContext.request.contextPath}/partner/task/csv" class="cvs taskListReportsLink"></a></li><li><a href="${pageContext.request.contextPath}/partner/task/xls" class="xls taskListReportsLink"></a></li></ul>
        	<div class="txt fl">Export to:</div></div>
        	</div>
        </c:when>
        <c:otherwise>
        	<div class="export clearfix"><ul class="reset clearfix fr"><li><a href="${pageContext.request.contextPath}/partner/task/csv" class="cvs inactiveLink taskListReportsLink"></a></li><li><a href="${pageContext.request.contextPath}/partner/task/xls" class="xls inactiveLink taskListReportsLink"></a></li></ul>
        	<div class="txt fl">Export to:</div></div>
        	</div>
        </c:otherwise>
        </c:choose>
        <div class="clearfix"></div>
        <div class="contact_par">
        <div class="query_data">
        
        <ul class="heading_ul clearfix reset tabular">
        <li class="first">action</li>
        <li class="second">task owner</li>
        <li class="third">subject category</li>
        <li class="fourth">task for</li>
        <li class="fifth">subject</li>
        <li class="sixth">date</li>
        <li class="seventh">priority</li>
        <li class="eight">status</li>
        </ul>
        <form class="form-horizontal" id="frmTaskListsSearch" name="frmTaskListsSearch" action="<c:url value="/tasklist/nextPage" />" method="POST">
        </form>
        <form class="form-horizontal" id="frmTaskLists" name="frmTaskLists" action="<c:url value="/tasklist/nextPage" />" method="POST">
       
       <section id="tasks">
        <div class=""> 
        <c:forEach items="${taskList}" var="task" varStatus="loopCounter" >
        <ul class="records_ul clearfix reset tabular" id="dataUl">
        <li class="first"><span class="common_custom_checkbox"></span><input type="checkbox" value="" id="${task.id}" class="default_checkbox"/><a href="${pageContext.request.contextPath}/partner/editTask/${task.id}" class="pencil_edit editTaskLink"></a></li>
        <li class="second">${task.ownerPartyName}</li>
        <li class="third">${task.categoryName}</li>
         <c:choose>
			<c:when test="${task.targetContactType=='Premium Client'}"><!--Premium client -->
			 <li class="fourth clearfix"><span class="task_thumb pclient"></span>${task.targetContactType}</li>
			</c:when>
			 <c:otherwise><li class="fourth clearfix"><span class="task_thumb ${fn:toLowerCase(task.targetContactType)} "></span>${task.targetContactType}</li></c:otherwise>
		</c:choose>
        
        <li class="fifth">${task.subject}</li>
        <li class="sixth">${task.dueDateTimeString}</li>
        <li class="seventh">${task.priorityName}</li>
        <c:choose>
        <c:when test="${task.statusName eq 'Scheduled'}"><li class="eight"><span class="new status">${task.statusName}</span></li></c:when>
        <c:when test="${task.statusName eq 'On Hold'}"><li class="eight"><span class="responded  status">${task.statusName}</span></li></c:when>
        <c:when test="${task.statusName eq 'In Progress'}"><li class="eight"><span class="progress status">${task.statusName}</span></li></c:when>
        <c:when test="${task.statusName eq 'Completed'}"><li class="eight"><span class="completed status">${task.statusName}</span></li></c:when>
        <c:when test="${task.statusName eq 'Cancelled'}"><li class="eight"><span class="cancel status">${task.statusName}</span></li></c:when>
        <c:otherwise><li class="eight"><span class="progress status">${task.statusName}</span></li></c:otherwise>
        </c:choose>
        </ul>
        </c:forEach>
</div>       </section>
       
        <input name="advisorPartyId" type="hidden" value="${advisorPartyId}"/>
        <input name="buId" type="hidden" value="${buId}"/>
        <input name="begin" id="begin" type="hidden" value="${begin}"/>
        <input name="end" id="end" type="hidden" value="${end}"/>
        <input name="showNextRows" id="showNextRows" type="hidden" value="1"/>
        <input name="dataSize" id="dataSize" type="hidden" value="${totalTasks}"/>
        </form>
        
        </div>
       </div>
        </section>
        
      </section>
      <!-- Common_in_contnet ends--> 
      <!-- Common footer starts -->
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
         <!-- <ul class="reset clearfix fr btn_grup3">
            </li>
            <li class="fl list"><a href="#" class="anch save"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="#" class="anch cancel"><span class="txt">Cancel</span></a></li>
            <li class="fl list"><a href="#" class="anch skip"><span class="txt">Skip</span></a></li>
          </ul>-->
         <!-- <ul class="reset clearfix fr btn_grup2">
            </li>
            <li class="fl list"><a href="#" class="anch add_note"><span class="txt">Add Notes</span></a></li>
            <li class="fl list"><a href="#" class="anch add_doc"><span class="txt">Add Doc</span></a></li>
          </ul>-->
          <ul class="reset clearfix fr btn_grup2">
            </li>
            <li class="fl list"><a href="#" class="anch new_query" onclick="addTask();"><span class="txtFooterl">Add Task</span></a></li>
            <li class="fl list"><a href="#" class="anch delete_query taskListDeleteLink" onClick="ConfirmDeletion();"><span class="txtFooterr">Delete Task/s</span></a></li>
          </ul>
         <!-- <ul class="reset clearfix fl btn_grup1">
            </li>
            <li class="fl list"><a href="#" class="anch analysis"><span class="txt">Analysis</span></a></li>
            <li class="fl list"><a href="#" class="anch suggeset"><span class="txt">Suggestion</span></a></li>
            <li class="fl list"><a href="#" class="anch action_plan"><span class="txt">Action Plan</span></a></li>
          </ul>-->
        </div>
        <a href="#" class="back navgation" id="back" onClick="showPrevRows();">
     <span class="txtFooter">Back</span></a> 
        <a href="#" class="next navgation" id="next" onClick="showNextRows();">
        <span class="txtFooter">Next</span></a>         </section>
      <!-- Common footer ends --> 
    
    </section>
    <!-- Common_content Ends-->
     
  </section>
  <!-- Main ends--> 
</div>
<div class="overlay"></div>
<!-- Wrapper ends--> 
<div id="confirmDialog" class="common_custom_modal_aa">
  <span class="close" onClick="closeDialog();">X</span>
  <div class="modal_content"> 
    <div class="aa_up">
        Do you really want to delete this task?</div>

         <div class="aa_down" id="yes"> <a style="cursor:pointer;" onClick="deleteTask();" class="aa_yes">Yes </a> 
         <a style="cursor:pointer;" onClick="closeDialog();" class="aa_no">No</a> </div>
  </div>
</div>

<script type="text/javascript">
function createRow(){
	
	var newLi = '<li class="first"><span class="common_custom_checkbox"></span><input type="checkbox" class="default_checkbox"/><a href="${pageContext.request.contextPath}/partner/editTask/${task.id}"'+ 
	'class="pencil_edit"></a></li><li class="second">Kunal G</li>'+
	'<li class="third">Email</li>'+
	'<li class="fourth clearfix"><span class="task_thumb client"></span>Client</li>'+
	'<li class="fifth">Why do you need a plan?</li>'+
	'<li class="sixth">01/01/2014</li>'+
	'<li class="seventh">New</li>'+
	'<li class="eight"><span class="completed status">scheduled</span></li>';
	$('#tasks').html($(newLi));
	//$('#dataUl li:last').after(newLi);
}

function alertMessage(message)
{
	$("#dialog1").html(message);
	$( "#dialog1").dialog( "open" );
	$("#goalName").focus();	
}
	  
$( "body" ).on( "click", "span.common_custom_checkbox", function() {
	 $(this).toggleClass("common_custom_checkbox_checked");
		
	 if ($(this).next( ".default_checkbox" ).is(":checked")) {
		
       $(this).next( ".default_checkbox" ).prop("checked", false);
    } else {
       $(this).next( ".default_checkbox" ).prop("checked", true);
	
    }
});

$( "body" ).on( "click", "#resetDropDowns",function(){
	$("#next").removeClass("inactiveLink");
	 $('#subject').val("");
	 $('#subject').placeholder();
	$("#Status").selectBoxIt('selectOption', 0);
	$("#subject_category").selectBoxIt('selectOption', 0);
	$("#assgined_to").selectBoxIt('selectOption', 0);
	$("#priority").selectBoxIt('selectOption', 0);
	search();
});

function showNextRows(){
	$("#back").removeClass("inactiveLink");
	var url = "${pageContext.request.contextPath}/partner/tasklist/nextPage";
	var action = "next";
	 if($("#showNextRows").val() == 0){
		 return false;
	 }
	return fetchNextOrPrevRows(url,action);
}

function showPrevRows(){
	 $("#next").removeClass("inactiveLink");
	var url = "${pageContext.request.contextPath}/partner/tasklist/previousPage";
	var action = "previous";
	var begin = "${begin}";
	if($("#begin").val() == 0){
		 return false;
	 }
	return fetchNextOrPrevRows(url,action);
}

function fetchNextOrPrevRows(url,action){
 $("#frmTaskLists").ajaxSubmit({
	url: url,
	type : "GET",
	data : {'advisorPartyId' : "${advisorPartyId}", 'buId' : "${buId}"},
	 success: function(data){
		 if(""!=data){
		 var begin = data.startIndex;
		 var end = data.endIndex;
		 var totalTaskList = $("#dataSize").val(); 
		 $("#totalTaskFound").html($("#dataSize").val());		 
		 if(end==totalTaskList)
		 {
			 $("#next").addClass("inactiveLink");
		 }
		 
		 if(parseInt(begin) <= 0)
		 {
			 $("#back").addClass("inactiveLink");
			 begin = 1;
		 }
		 //var endDisplay = end -1;
		 var taskList = data.taskList;
		 if(taskList != null){
			 $("input[id=begin]").val(1);
		 $('#tasks').html("");
		 $('#toFrom').html("items found, displaying "+begin+" to "+ end +" items");
		 $(taskList).each(function(index,element){
			 var jsDate = new Date(element.dueDateTime*1000);
			 var recordType="";	
			 if(element.targetContactType != null){
				 recordType = element.targetContactType.toLowerCase();
				 if(recordType.indexOf('premium client') > -1)
				 {
					 recordType = 'pclient';
				 }
			 }
			 var newLi = '<ul class="records_ul clearfix reset tabular"><li class="first"><span class="common_custom_checkbox"></span><input type="checkbox" id="'+element.id + '"class="default_checkbox"/><a href="${pageContext.request.contextPath}/partner/editTask/'+element.id+'"'+ 
				'class="pencil_edit"></a></li><li class="second">'+ element.ownerPartyName +'</li>'+
				'<li class="third">'+ element.categoryName+'</li>'+
				'<li class="fourth clearfix"><span class="task_thumb '+recordType+'"></span>'+ element.targetContactType +'</li>'+
				'<li class="fifth">'+ element.subject+'</li>'+
				'<li class="sixth">'+ convertToDate(element.dueDateTime)  +'</li>'+
				'<li class="seventh">'+ element.priorityName+'</li>';
				if(element.statusName == "Scheduled"){
					newLi = newLi + '<li class="eight"><span class="new status">'+ element.statusName+'</span></li></ul>';
				}else if(element.statusName == "On Hold"){
					newLi = newLi + '<li class="eight"><span class="responded status">'+ element.statusName+'</span></li></ul>';
				}else if(element.statusName == "In Progress"){
					newLi = newLi + '<li class="eight"><span class="progress status">'+ element.statusName+'</span></li></ul>';
				}else if(element.statusName == "Completed"){
					newLi = newLi + '<li class="eight"><span class="completed status">'+ element.statusName+'</span></li></ul>';
				}else{
					newLi = newLi + '<li class="eight"><span class="cancel status">'+ element.statusName+'</span></li></ul>';
				}
				//$('#dataUl li:last').after(newLi);
				$('#tasks').append(newLi);
			 //createRow();
		 });
		 }else{
			 if(action == "next"){
				 $("input[id=showNextRows]").val(0);
			 }else{
				 $("input[id=begin]").val(0);
				 $("input[id=showNextRows]").val(1);
				// $('#back').attr('onclick','').unbind('click');
			 }
		 }
		 }else{
			 if(action == "next"){
				 $("input[id=showNextRows]").val(0);
			 }else{
				 $("input[id=begin]").val(0);
				 $("input[id=showNextRows]").val(1);
				// $('#back').attr('onclick','').unbind('click');
			 }
		 }
	 }
	        
}); 
}

function search(){
	
	 $("#next").removeClass("inactiveLink");
	 
	var subject = $("#subject").val();
	var status = $("#Status").val();
	var subjectCategory = $("#subject_category").val();
	var assignedTo = $("assgined_to").val();
	var priority = $("#priority").val();
	$("#frmTaskListsSearch").ajaxSubmit({
		url: "${pageContext.request.contextPath}/partner/searchTaskList",
		type : "GET",
		dataType : "json",
		data : {'advisorPartyId' : "${advisorPartyId}", 'buId' : "${buId}", 'subject' : $("#subject").val(), 'status' : $("#Status").val(),
			'subjectCategory' : $("#subject_category").val(), 'assignedTo': $("#assgined_to").val(), 'priority': $("#priority").val()},
		 success: function(data){
			 if(""!=data){
				 
				 var begin = data.startIndex;
				 var end = data.endIndex;
				 
				 if((parseInt(end) - parseInt(begin)) < 10)
				 {
					 $("#next").addClass("inactiveLink");
				 }
				 
				 if(parseInt(begin) <= 0)
				 {
					 $("#back").addClass("inactiveLink");
					 begin = 1;
				 }
				 
				 //var endDisplay = end-1;
				 var taskList = data.taskList;
				 $("#dataSize").val(taskList.length);
				 $('#tasks').html("");
				 if(taskList.length == 0){
					 $('#totalTaskFound').html("");
					 $('#toFrom').html("No record found.");
					 $('.xls').addClass("inactiveLink");
					 $('.cvs').addClass("inactiveLink");
					 
					 $("#successDialog").html("No record found.");
				     $( "#successDialog").dialog( "open" );
					 
					// $('#totalTaskFound').html("0 ");
				 }
				 else {
					 $('#totalTaskFound').html(data.totalRecords);
					 $('#toFrom').html("items found, displaying "+begin+" to "+ end +" items");
				 	$('#tasks').html("");
				 	 $('.xls').removeClass("inactiveLink");
					 $('.cvs').removeClass("inactiveLink");
				 }
				 $(taskList).each(function(index,element){
					 var recordType="";	
					 if(element.targetContactType != null){
						 recordType = element.targetContactType.toLowerCase();
						 if(recordType.indexOf('premium client') > -1)
						 {
							 recordType = 'pclient';
						 }
					 }
				 var newLi = '<ul class="records_ul clearfix reset tabular"><li class="first"><span class="common_custom_checkbox"></span><input type="checkbox" value="" id="'+element.id + '" class="default_checkbox"/><a href="${pageContext.request.contextPath}/partner/editTask/'+element.id+'"'+ 
					 'class="pencil_edit"></a></li><li class="second">'+ element.ownerPartyName +'</li>'+
						'<li class="third">'+ element.categoryName+'</li>'+
						'<li class="fourth clearfix"><span class="task_thumb '+recordType+'"></span>'+ element.targetContactType +'</li>'+
						'<li class="fifth">'+ element.subject+'</li>'+
						'<li class="sixth">'+ convertToDate(element.dueDateTime)+'</li>'+
						'<li class="seventh">'+ element.priorityName+'</li>';
						
				 if(element.statusName == "Scheduled"){
						newLi = newLi + '<li class="eight"><span class="new status">'+ element.statusName+'</span></li></ul>';
					}else if(element.statusName == "On Hold"){
						newLi = newLi + '<li class="eight"><span class="responded status">'+ element.statusName+'</span></li></ul>';
					}else if(element.statusName == "In Progress"){
						newLi = newLi + '<li class="eight"><span class="progress status">'+ element.statusName+'</span></li></ul>';
					}else if(element.statusName == "Completed"){
						newLi = newLi + '<li class="eight"><span class="completed status">'+ element.statusName+'</span></li></ul>';
					}else{
						newLi = newLi + '<li class="eight"><span class="cancel status">'+ element.statusName+'</span></li></ul>';
					}
						//$('#dataUl li:last').after(newLi);
					$('#tasks').append(newLi);
					 //createRow();
					
				 }); 
			 }else{
				 $('#totalTaskFound').html("");
				 $('#toFrom').html("No record found.");
				 
				 $("#successDialog").html("No record found.");
			     $( "#successDialog").dialog( "open" );
			 }
		 }
		 });
}



function jsonPopulateDropdownForTasks(dropdown1, dropdown2, dropdown3) {
	$(dropdown1).empty();
	$(dropdown2).empty();
	
	$(dropdown1).data("selectBox-selectBoxIt").add({ value: "-1", text: " Status "});
	$(dropdown2).data("selectBox-selectBoxIt").add({ value: "-1", text: " Subject Category"});
	if(dropdown3 != ""){
		$(dropdown3).empty();
		$(dropdown3).data("selectBox-selectBoxIt").add({ value: "-1", text: " Priority "});
	}
	$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/partner/codevalues",
			async : true,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
				$.each(msg, function(index, item) {					
					//$(dropdown).get(0).options[$(dropdown).get(0).options.length] = new Option(item.codeValue, item.codeValueId);
					if(item.codeTypeId == 19){
						$(dropdown1).data("selectBox-selectBoxIt").add({ value: item.codeValueId, text: item.codeValue });
					}else if(item.codeTypeId == 17){
						$(dropdown2).data("selectBox-selectBoxIt").add({ value: item.codeValueId, text: item.codeValue });
					}else{
						$(dropdown3).data("selectBox-selectBoxIt").add({ value: item.codeValueId, text: item.codeValue });
					}
					//$(dropdown).val(item.codeValueId);
				});

				//var selectBox = $(dropdown).selectBoxIt().data('selectBox-selectBoxIt');			    
			    //selectBox.selectOption(selectedValue);
			    
			},
			error : function(msg) {
				$('.result').html(msg.d);
			}
		});
	return false;
}



function jsonPopulateDropdownAssignedTo(dropdown){
	$(dropdown).empty();
	$(dropdown).data("selectBox-selectBoxIt").add({ value: "-1", text: " Assigned To"});
	$.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/partner/getAssignedDropdownvalues",
		async : true,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(item) {
				var pstName = item.pstDepartmentName+'-'+item.pstName;
				var mstName = item.mstDepartmentName + '-' +item.mstName;
				var mst2Name = item.mst2DepartmentName + '-' + item.mst2Name;
				var fpaName = item.fpaDepartmentName + '-' + item.fpaName;
				$(dropdown).data("selectBox-selectBoxIt").add({ value: item.pstPartyId, text: pstName });
				$(dropdown).data("selectBox-selectBoxIt").add({ value: item.mstPartyId, text: mstName });
				$(dropdown).data("selectBox-selectBoxIt").add({ value: item.mst2PartyId, text: mst2Name });
				$(dropdown).data("selectBox-selectBoxIt").add({ value: item.fpaPartyId, text: fpaName });
		}
	});
	return false;
}

var checkedIds = '0,';
function ConfirmDeletion(){
	 checkedIds = '0,';
	checkedIds =checkedIds+  $(":checkbox:checked").map(function() {
	       return this.id;
	    }).get();
    if(checkedIds !=null && checkedIds!= "0," )
	{
    	  $(".overlay").fadeIn("slow");
	    	$("#confirmDialog").fadeIn("slow");			
	}//END IF
	else {
		alertMessage("Please select task to delete.");
		return false;
		}
	
}

function deleteTask(){
	window.location.replace('${pageContext.request.contextPath}/partner/task/delete?taskIds='+checkedIds);
	 checkedIds = '0,';
	$("#confirmDialog").fadeOut("slow");
	$(".overlay").fadeOut("slow");
}

function convertToDate(timestamp){
	var date = new Date(timestamp);
	var hour = date.getHours();
	var minutes = date.getMinutes();
	var seconds = date.getSeconds();
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	var day = date.getDay();
	var dateFormat = day+"-"+month+"-"+year;//date+ " " +hour+":"+minutes+":"+seconds;
	return $.datepicker.formatDate('dd-M-yy', date);
}
function closeDialog(){
	var ids = checkedIds.split(",");
	for(var i=1;i<ids.length;i++)
	{
		 $("#"+ids[i]).attr("checked", false);
	}
 	checkedIds = '0,';
	checkedIds = null;
	$(".common_custom_checkbox").removeClass("common_custom_checkbox_checked");
	$(".overlay").fadeOut("slow");
	$("#confirmDialog").fadeOut("slow");
}

function addTask(){
	var nodeID = '${nodeId}';
	if(nodeID>0)
	{
		alertMessage("Please select partner first from Hierarchy to add Task");
	}
	else{
	window.location.replace("${pageContext.request.contextPath}/partner/addTask");
	};
}

</script>

</body>
