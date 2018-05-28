<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style type="text/css">
.common_footer_actions #main_actions { margin-left: 174px; }
#confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
/*#Add_Profile_Info .family_details .li_three {
	width: 20%;
}*/
</style>
<!-- Datepicker -->
<script>
$(function() {
	  $( ".datepicker1" ).datepicker({
	  dateFormat: "dd-M-yy",
      showOn: "both",
	  buttonText: '',
	  buttonText: '',
	  changeMonth: true,
      changeYear: true,
	  minDate: 0,	  
	  onSelect: function(dateText,inst ){
		   $("div.rel").find("label.error").remove();
	   }
   });
   
});

$(function() {
	  $( ".datepicker2" ).datepicker({
	  dateFormat: "dd-M-yy",
    showOn: "both",
	  buttonText: '',
	  buttonText: '',
	  changeMonth: true,
    changeYear: true,
	  maxDate: new Date,
	  onSelect: function(dateText,inst ){
		   $("div.rel").find("label.error").remove();
	   }
 });
 
});
  
 
  </script>
<script>
initialData = [];
finalData = [];
$(document).ready(function(){
  
	$( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );
	 
	createSlider('#target_type',15002,15003,1,'#targetTypeId');
	
	$("#target_type .ui-slider-handle").css("margin-left", "2px");
    $("#target_type .ui-slider-handle").text("Opportunity");
	$( "#target_type" ).on("slide", function( event, ui ) {
		
	$("#target_type .ui-slider-handle").empty();
           if (ui.value == 15002) {
              // $("#target_type .ui-slider-handle").css("margin-left", "2px");
              $("#target_type .ui-slider-handle").css("margin-left", "10px");
                $("#target_type .ui-slider-handle").text("Opportunity");
                $("#edit_task_parent .client_name").fadeIn("slow");
                //$("#edit_task_parent .client_name").fadeOut("slow");
                $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').remove();
                $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').add({ value: "", text: " -- Select --"})
  			  $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').add(${targetTypeListForOpportunity});
		   } else if (ui.value == 15003) {
              //$("#target_type .ui-slider-handle").css("margin-left", "-25px");
               $("#target_type .ui-slider-handle").css("margin-left", "-50px");
              $("#target_type .ui-slider-handle").text("Client");
			  $("#edit_task_parent .client_name").fadeIn("slow");
			  //$("#task_category_select").remove();
			  $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').remove();
			  $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').add({ value: "", text: " -- Select --"})
			  $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').add(${targetTypeListForClient});
			  /* $("#task_category_select").selectBoxIt({
			    	populate: {"data": ${targetTypeListForClient}},
			    }); */
           } else if (ui.value == 15004) {
              // $("#target_type .ui-slider-handle").css("margin-left", "-95px");
              // $("#target_type .ui-slider-handle").text("Premium Client");
              $("#target_type .ui-slider-handle").css("display","none");
			  /*$("#edit_task_parent .client_name").fadeIn("slow");
			  $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').remove();
			  $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').add({ value: "", text: " -- Select --"})
			  $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').add(${targetTypeListForPremiumClient}); */
			  //$("#task_category_select").destroy();
			 //data("selectBox-selectBoxIt").remove();
			  //$("#task_category_select").empty();
			   /* $("#task_category_select").selectBoxIt({
			    	populate: {"data": ${targetTypeListForPremiumClient}},
			    }); */ 
           }
           
          
	});
	
	 $("#confirmDialog .close").click(function(){
 	    $(".overlay").fadeOut("slow");
 	 $("#confirmDialog").fadeOut("slow");
 	  });
	$("#task_stat").change(function(ele) {
		if($("#task_stat").val() == 19004) {
			//$("#completion_date").addClass("required");
			$(".clearfix").addClass("rel");
			if($("#completion_date").val() == null || $("#completion_date").val()=="")
				$("#completion_date").val($("#currDate").val());
		}
		else {
			$("#completion_date").removeClass("required");
			$(".clearfix").removeClass("rel");			
			$("#completion_date").val("");
		}
	});
	
	/* // Start This Code is for rolebase security 
    var partnerSetupLinks = "${partnerSetupLinks}";
    var pieces = partnerSetupLinks.split(",");
    for(var i=0;i<pieces.length;i++){
     $("."+pieces[i]).attr("href","#");
     $("."+pieces[i]).addClass("inactiveLink");
    }
   // End This Code is for rolebase security  */ 
	
});


</script>
<!-- Datepicker Ends -->

<!-- Custom Selectbox starts -->
<script>
$(document).ready(function(){
    $('.wrapper').attr('id', 'edit_task_parent'); 
    $("#task_stat").selectBoxIt();
    $("#task_cat").selectBoxIt();
    $("#assigned_to").selectBoxIt();
    
    $.validator.addMethod("checkDropDown", function(value, element) {
		//alert('checked');
		return false;
	});
   
	 // Calls the selectBoxIt method on your HTML select box
	 	var validator = $('#FileUploadFormEdit').validate({ // initialize the plugin
	 		
		ignore:'', //i.e. do not ignore hidden elements	
        onfocusout: function (element) {
        $(element).valid();
		}, 
		rules : {
			statusId : { required : true},
			categoryId : { required : true},
			ownerPartyId : { required : true},
			subject : { required : true},
			description : { required : true}
			//targetPartyId : { required : true}
		},
	});
		 /* $('.required').each(function() {
        $(this).rules('add', {
        required:true,
     });
	 }); */
		
	 
	 
		$("a.save_new").click(function(e) { e.preventDefault();
		$("#FileUploadFormEdit").validate();
		
});
		$("a.save_close").click(function(e) { e.preventDefault();
		$("#FileUploadFormEdit").validate();
		
});
 
});
</script>

<!-- Custom Selectbox Ends -->
<!-- custom scroll to "common_in_content" -->
<script>
$(document).ready(function(){
  
    $('.common_in_content').slimScroll();
	
    $(document).ready(function(){
    	new nicEditor({maxHeight : 100,fullPanel : true,iconsPath : '${pageContext.request.contextPath}/resources/images/nicEditorIcons.gif'}).panelInstance('subject_desc_value');
    	});
    
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

  });

</script>
<!-- custom scroll to "common_in_content" -->
<!-- Attachment starts -->
<script>
$(document).ready(function(){
 jsonPopulateDropdownAddTask("#task_stat", "#task_cat", '${task.statusId}','${task.categoryId}'); 
 jsonPopulateDropdownAssignedTo("#assigned_to",'${task.ownerPartyId}');	
 
 $("#add_task #first_file + .jquery-filestyle").show("blind"); 
 $("#add_task #second_file + .jquery-filestyle").show("blind");
 $("#add_task #third_file + .jquery-filestyle").show("blind");
 
 createSlider("#task_priority", 18001, 18004, 1, "#taskpriorityId");
 $(window).bind("load", function() {
    	$( document ).ajaxComplete(function() {
    		checkDataInitial();
	    	});
    }).trigger('load');
 
 
});

function doTargetType(element)
{
	var selectedText = element.options[element.selectedIndex].text;
	selectedText = selectedText.toUpperCase();
	if(selectedText=='SELF')
	{
		$("#task_category_select").removeClass("required");
		$("#task_category_select").removeClass("error");
	}
	else
	{
		$("#task_category_select").addClass("required");
	}
} 
</script>

<body>
<div id="confirmDialog" class="common_custom_modal_aa"> <span class="close">X</span>
  <div class="modal_content">
    <div class="aa_up">
      <spring:message code="dataChanged" />
    </div>
    <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
  </div>
</div>
<div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
<form:form id="loadtaskList"  name="loadtaskList" modelAttribute="task" action="/partner/editTask"  method="get"> </form:form>
<form:form id="FileUploadFormEdit"  name="FileUploadFormEdit" modelAttribute="task" action="/partner/editTask"  enctype="multipart/form-data" method="post">
  <fmt:formatDate pattern="dd-MMM-yyyy" value="${task.dueDateTime}" var="dueDtTime"/>
  <c:choose>
    <c:when test="${not empty task.completionDateTime}">
      <fmt:formatDate pattern="dd-MMM-yyyy" value="${task.completionDateTime}" var="completionDtTime"/>
    </c:when>
    <c:otherwise>
      <jsp:useBean id="now" class="java.util.Date"/>
      
      <fmt:formatDate pattern="dd-MMM-yyyy" value="${now}" var="completionDtTime"/>
      <input type="hidden" id="currDate" name="currDate" value="${completionDtTime}" />
      <c:set var="completionDtTime" value=""></c:set>
    </c:otherwise>
  </c:choose>
  
  <!-- Wrapper starts-->
  <div > 
    <!-- Main starts-->
    
    <section class="main"> 
      <!-- Header Starts--> 
      <!-- Header Ends--> 
      
      <!-- Common_content Starts-->
      
      <section class="content common_content"> 
        <!-- Common_in_contnet starts-->
       <%--  <jsp:include page="../layout/submenu_small.jsp"></jsp:include> --%>
        <section id="add_task" class="in_content common_in_content clearfix">
  <div class="row">
		<div class="col-md-12">
          <ul class="reset clearfix parameters">
            <li class="col-md-3">
              <label class="common_form_label">Assigned To</label>
              <select id="assigned_to" name="ownerPartyId" value="${task.ownerPartyId}" class="required" onchange="doTargetType(this)">
              </select>
            </li>
            <li class="col-md-3">
              <label class="common_form_label">Task Category</label>
              <select id="task_cat" name="categoryId" value="${task.categoryId}" class="required">
              </select>
            </li>
            <li class="col-md-3">
              <label class="common_form_label">Task Status</label>
              <select id="task_stat" name="statusId"  class="required" value="${task.statusId}">
              </select>
              <input type="hidden" id="taskStatusId"  class="range_counter"  name="taskStatusId" value="${task.statusId}"/>
            </li>
            <li class="col-md-3">
              <label class="common_form_label">Priority</label>
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">Low</span><span class="medium extrem">Normal</span><span class="second_high extrem">High</span><span class="high extrem">Urgent</span></div>
                  <div id="task_priority"></div>
                  <input type="hidden" id="taskpriorityId"  class="range_counter"  name="priorityId" value="${task.priorityId}"/>
                </div>
              </div>
            </li>
          </ul>
          </div>
          </div>
        <div class="row">
		<div class="col-md-12">
          <ul class="second_sec reset clearfix">
            <li class="col-md-3">
              <label class="common_form_label">Target Type</label>
              <div id="target_type" class="common_sliding_radio" style="width: 150px;">
               <span class="lbl_first lbl" style="margin-left:10px;">Opportunity</span> <span class="lbl_second lbl" style="margin-left:35px;">Client</span>
             <!-- <span class="lbl_third lbl">Premium Client</span> --> </div>
              <input type="hidden" id="targetTypeId"  class="range_counter"  name="targetContactTypeId" value="${task.targetContactTypeId}"/>
            </li>
            <li class="client_name1 col-md-3">
              <label class="common_form_label">&nbsp;</label>
              <select id="task_category_select" name="targetPartyId" value="${task.targetPartyId}" class="required">
              </select>
            </li>
            <li class="clearfix col-md-3">
              <div class="completion_date">
                <label class="common_form_label">Due Date </label>
                <input type="text" id="due_date" class="common_input datepicker1" name="dueDateTimeString" value="${dueDtTime}" onClick="checkValue();" readonly>
              </div>
              <div class="due_date">
                <label class="common_form_label">Completion Date</label>
                <input type="text" id="completion_date" class="common_input" name="completionDateTimeString" <%-- value="${completionDtTime}" placeholder="DD-MMM-YYYY" --%> readonly >
              </div>
            </li>
          </ul>
          </div>
          </div>
          <div class="clr"></div>
          <ul class="third_sec reset clearfix">
            <li>
              <label class="common_form_label">Subject</label>
              <input type="text" class="common_input required" id="task_subject" name="subject" value="${task.subject}">
            </li>
            <li>
              <label class="common_form_label">Description</label>
              <div id="subject_desc" class="common_input"> 
                <!-- <textarea  id="subject_desc_value" style="width: 100%; height: 120px;" rows="10" class="common_textarea required" name="description" > -->
                <form:textarea class="txt-editor" style="width:776px;height:127px;" path="" id="subject_desc_value" cols="" rows="" name="description"></form:textarea>
                <!-- </textarea>--> 
              </div>
            </li>
          </ul>
        </section>
        <!-- Common_in_contnet ends--> 
        <!-- Common footer starts -->
        <section class="common_footer_actions">
          <div id="main_actions" class="clearfix">
            <ul class="reset clearfix fr btn_grup2">
              </li>
              <li class="fl list"><a href="${pageContext.request.contextPath}/document/view?refId=${task.id}&refTypeId=111002&partyId=${task.ownerPartyId}&returnUrl=/partner/editTask/${task.id}" 
              class="anch add_doc editTaskDocumentLink"><span class="txt">Documents</span></a></li>
              <li class="fl list" onClick="formSubmitForNewTask();"><a href="#" class="anch save_new editTaskSaveAndNewLink" ><span class="txt">Save &amp; New</span></a></li>
              <li class="fl list" onClick="formSubmitForTaskList();"><a href="#" class="anch save_close editTaskSaveAndCloseLink" ><span class="txt">Save &amp; Close</span></a></li>
              <li class="fl list" onClick="cancel();"><a href="#" class="anch cancel"><span class="txt">Cancel</span></a></li>
            </ul>
          </div>
          <!-- <a href="#" class="back navgation" onclick="back();"><span class="txt">Back</span></a> <a href="#" class="next navgation"><span class="txt">Next</span></a> --> 
        </section>
        
        <!-- Common footer ends -->
        
      </section>
      <!-- Common_content Ends--> 
      
    </section>
    <!-- Main ends-->
    <input type="hidden" id="id" name="id" value="${task.id}"/>
    <div class="overlay"></div>
  </div>
  <!-- Wrapper ends--> 
  <!-- For Common Custom File Input-->  
  
  <script type="text/javascript">

function jsonPopulateDropdownAssignedTo(dropdown,selectedValue){
	$(dropdown).empty();
	$(dropdown).data("selectBox-selectBoxIt").add({ value: "", text: "-- Select --"});
	$(dropdown).data("selectBox-selectBoxIt").add({ value: "${advisorPartyId}", text: "Self"});
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
			var rmName = item.rmDepartmentName + '-' + item.rmName;
			if(pstName.trim() != '-')
				$(dropdown).data("selectBox-selectBoxIt").add({ value: item.pstPartyId, text: pstName });
			
			if(mstName.trim() != '-')
				$(dropdown).data("selectBox-selectBoxIt").add({ value: item.mstPartyId, text: mstName });
			
			if(mst2Name.trim() != '-')
				$(dropdown).data("selectBox-selectBoxIt").add({ value: item.mst2PartyId, text: mst2Name });
			
			if(fpaName.trim() != '-')
				$(dropdown).data("selectBox-selectBoxIt").add({ value: item.fpaPartyId, text: fpaName });
			
			if(rmName.trim() != '-')
				$(dropdown).data("selectBox-selectBoxIt").add({ value: item.rmPartyId, text: rmName });
			
			var selectBox = $(dropdown).selectBoxIt().data('selectBox-selectBoxIt');                     
            selectBox.selectOption(selectedValue);
			
		}
		
	});
	
	return false;
}

function jsonPopulateDropdownAddTask(dropdown1,dropdown2,selectedValue1,selectedValue2) {
	$(dropdown1).empty();
	$(dropdown2).empty();
	
	$(dropdown1).data("selectBox-selectBoxIt").add({ value: "", text: " -- Select --"});
	$(dropdown2).data("selectBox-selectBoxIt").add({ value: "", text: " -- Select --"});
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
						var codeValueId = item.codeValueId; 
						if (codeValueId < 17007)
						{
						 $(dropdown2).data("selectBox-selectBoxIt").add({ value: item.codeValueId, text: item.codeValue });
						}
					}
					//$(dropdown).val(item.codeValueId);
				});

				var selectBox = $(dropdown1).selectBoxIt().data('selectBox-selectBoxIt');			    
			    selectBox.selectOption(selectedValue1);
			    
			    var selectBox = $(dropdown2).selectBoxIt().data('selectBox-selectBoxIt');			    
			    selectBox.selectOption(selectedValue2);
			    
			},
			error : function(msg) {
				$('.result').html(msg.d);
			}
		});
	return false;
}

function alertMessage(msg)
{
	$("#dialog1").html(msg);
	$( "#dialog1").dialog( "open" );
}

var cnt = 1;
function formSubmitForNewTask(){
	
	$(".save_new").addClass("inactiveLink");
	$(".save_close").addClass("inactiveLink");
	
	var content = nicEditors.findEditor('subject_desc_value').getContent();
	$("#subject_desc_value").val(content);
	checkDataFinal();
	if(initialData.toString() == finalData.toString()){ 
		alertMessage("You haven't changed any data yet. Please make some changes then save.");
		$(".save_new").removeClass("inactiveLink");
		$(".save_close").removeClass("inactiveLink");
	}
	else {
		if( $('#FileUploadFormEdit').validate().form()){
			if(cnt==1){
			$('#FileUploadFormEdit').attr('action', '${pageContext.request.contextPath}/partner/editTask?newTask=true');
			$("#FileUploadFormEdit").submit();
			cnt++;
			}
		}
		else
		{
			$(".save_new").removeClass("inactiveLink");
			$(".save_close").removeClass("inactiveLink");
		}
	}
	
}

var cntNew = 1;

function formSubmitForTaskList(){
	
	$(".save_new").addClass("inactiveLink");
	$(".save_close").addClass("inactiveLink");
	
	var content = nicEditors.findEditor('subject_desc_value').getContent();
	$("#subject_desc_value").val(content);
	checkDataFinal();
	if(initialData.toString() == finalData.toString()){ 
		alertMessage("You haven't changed any data yet. Please make some changes then save.");
		$(".save_new").removeClass("inactiveLink");
		$(".save_close").removeClass("inactiveLink");
	}
	else {
		if( $('#FileUploadFormEdit').validate().form()){
			if(cntNew == 1){
			$('#FileUploadFormEdit').attr('action', '${pageContext.request.contextPath}/partner/editTask?newTask=false');
			$("#FileUploadFormEdit").submit();
			cntNew++;
			}
		 }
		else
		{
			$(".save_new").removeClass("inactiveLink");
			$(".save_close").removeClass("inactiveLink");
		}
	}
	
	
}

function closeDialog(){
	  $(".overlay").fadeOut("slow");
	     $("#confirmDialog").fadeOut("slow");
	 }	
	 
function cancel(){
	 checkDataFinal();
		if(initialData.toString() == finalData.toString()){ 
			$('#loadtaskList').attr('action', '${pageContext.request.contextPath}/partner/tasklist');
			$("#loadtaskList").submit();
		 }else{
			 
			 $(".aa_up").html("<spring:message code='dataChanged' />");
				$(".aa_yes").click(function(){
				cancelPage();
				$("#loadtaskList").submit()});	
				$(".overlay").fadeIn();
				$("#confirmDialog").fadeIn();
		} 
	}
	function back(){
		$('#loadtaskList').attr('action', '${pageContext.request.contextPath}/partner/tasklist');
		$("#loadtaskList").submit();
	}

	function cancelPage(url){
		$('#loadtaskList').attr('action', '${pageContext.request.contextPath}/partner/tasklist');
		$("#loadtaskList").submit();
	}
$(document).ready(function(){
$('#task_priority').slider( "option", "value", '${task.priorityId}');
$('#taskpriorityId').val('${task.priorityId}');
$("textarea#subject_desc_value").val('${task.description}');
$('#target_type').slider( "option", "value", '${task.targetContactTypeId}');

if(${task.targetContactTypeId}!=0)
 {
	if (${task.targetContactTypeId} == 15002) {
		 $("#target_type .ui-slider-handle").css("margin-left", "2px");
	     $("#target_type .ui-slider-handle").text("Opportunity");
	     $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').remove();
	     $("#task_category_select").selectBoxIt().data("selectBox-selectBoxIt").add({ value: "", text: " -- Select --"});
		  $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').add(${targetTypeListForOpportunity});
		//checkcomment
		  $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').selectOption('${task.targetPartyId}');
		  //checkcomment
	}else if(${task.targetContactTypeId} == 15003){
		$("#target_type .ui-slider-handle").css("margin-left", "-25px");
	    $("#target_type .ui-slider-handle").text("Client");
	    $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').remove();
	    $("#task_category_select").selectBoxIt().data("selectBox-selectBoxIt").add({ value: "", text: " -- Select --"});
		  $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').add(${targetTypeListForClient});
		  $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').selectOption('${task.targetPartyId}');
	}else{
		 $("#target_type .ui-slider-handle").css("margin-left", "-95px");
	     $("#target_type .ui-slider-handle").text("Premium Client");
		  $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').remove();
		  $("#task_category_select").selectBoxIt().data("selectBox-selectBoxIt").add({ value: "", text: " -- Select --"});
		  $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').add(${targetTypeListForPremiumClient});
		  $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').selectOption('${task.targetPartyId}');
	}
	$('#targetTypeId').val('${task.targetContactTypeId}');
}else{
	$("#target_type .ui-slider-handle").css("margin-left", "2px");
    $("#target_type .ui-slider-handle").text("Opportunity");
    $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').remove();
    $("#task_category_select").selectBoxIt().data("selectBox-selectBoxIt").add({ value: "", text: " -- Select --"});
	$("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').add(${targetTypeListForOpportunity});
	//checkcomment
	  $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').selectOption('${task.targetPartyId}');
	  $('#targetTypeId').val(15002);
}
});

$(document).ready(function(){
				    
	
});
function checkDataInitial(){
	initialData = [];
	initialData.push($("#assigned_to").val());
	initialData.push($("#task_cat").val());
	initialData.push($("#task_stat").val());
	initialData.push($("#taskpriorityId").val());
	initialData.push($("#targetTypeId").val());
	initialData.push($("#task_category_select").val());
	initialData.push($("#due_date").val());
	initialData.push($("#completion_date").val());
	initialData.push($("#task_subject").val());
	initialData.push($("#subject_desc_value").val());
}
function checkDataFinal(){
	finalData=[];
	finalData.push($("#assigned_to").val());
	finalData.push($("#task_cat").val());
	finalData.push($("#task_stat").val());
	finalData.push($("#taskpriorityId").val());
	finalData.push($("#targetTypeId").val());
	finalData.push($("#task_category_select").val());
	finalData.push($("#due_date").val());
	finalData.push($("#completion_date").val());
	finalData.push($("#task_subject").val());
	finalData.push($("#subject_desc_value").val());
}
function initializeDropDown(targetType,selectedValue){
 $.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/partner/getTargetTypeDropdownvalues",
		async : true,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		data : {'targetType' :targetType },
		success : function(data) {
			$("#task_category_select").data("selectBox-selectBoxIt").remove();
			$("#task_category_select").data("selectBox-selectBoxIt").add({ value: "", text: "---select---" });
			var select = $("#task_category_select").data("selectBox-selectBoxIt");
			$.each(data, function(index, item) {	
				
				select.add({ value: item.id, text: item.name });
			});
			
			var selectBox = $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt');			    
		    selectBox.selectOption(selectedValue);
		}
	});
 return false;
 }
 
function deleteFile(fileName){
	//alert(fileName);
}
function checkValue(){
	//alert(this);
}
function createSlider(ctrlName, minVal, maxVal, stepBy, ctrlTextBox){
	
	$(ctrlName).slider({
		min : minVal,
		max : maxVal,
		step : stepBy,
		slide : function(event, ui) {
			$(ctrlTextBox).val(ui.value);
		}
	});
	$(ctrlTextBox).val($(ctrlName).slider("value"));
	
	$(ctrlTextBox).keyup(function() {
		$(ctrlTextBox).val();
		$(ctrlName).slider('value', $(ctrlTextBox).val());
	});
}
</script>  
  <!-- For Common Custom File Input Ends--> 
</form:form>
</body>
