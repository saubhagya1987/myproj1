<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.partner.models.Theme"%>
<style type="text/css">
.common_footer_actions #main_actions { margin-left: 174px; }
#confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
/*#Add_Profile_Info .family_details .li_three {
	width: 20%;
}*/
</style>
<script>
initialData = [];
finalData = [];
$(function() {
	  $( ".datepicker" ).datepicker({
	  dateFormat: "dd-M-yy",
      showOn: "both",
	  buttonText: '',
	  changeMonth: true,
      changeYear: true,
	   minDate: 0,
	   onSelect: function(dateText,inst ){
		   $("div.rel").find("label.error").remove();
	   }
     });
  });
function closeDialog(){
	  $(".overlay").fadeOut("slow");
	     $("#confirmDialog").fadeOut("slow");
	 }	 
  </script>
<script>
 
$(document).ready(function(){
	$("#confirmDialog .close").click(function(){
 	    $(".overlay").fadeOut("slow");
 	 $("#confirmDialog").fadeOut("slow");
 	  });
	$( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );
 
	createSlider('#target_type',15002,15003,1,'#targetTypeId');
	$("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').add({ value: "", text: " -- Select --"})
	$("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').add(${targetTypeListForOpportunity});
	$("#target_type .ui-slider-handle").css("margin-left", "2px");
    $("#target_type .ui-slider-handle").text("Opportunity");
	$( "#target_type" ).on("slide", function( event, ui ) {
		
	$("#target_type .ui-slider-handle").empty();
           if (ui.value == 15002) {/* <!--opportunity--> */
               //$("#target_type .ui-slider-handle").css("margin-left", "2px");
               $("#target_type .ui-slider-handle").css("margin-left", "10px");
                $("#target_type .ui-slider-handle").text("Opportunity");
				 //$("#edit_task_parent .client_name").fadeOut("slow");
                $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').remove();
                $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').add({ value: "", text: " -- Select --"})
    			  $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').add(${targetTypeListForOpportunity});
           } else if (ui.value == 15003) {/* client */
               //$("#target_type .ui-slider-handle").css("margin-left", "-25px");
        	   $("#target_type .ui-slider-handle").css("margin-left", "-50px");
              $("#target_type .ui-slider-handle").text("Client");
			   $("#edit_task_parent .client_name").fadeIn("slow");
			   $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').remove();
			   $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').add({ value: "", text: " -- Select --"})
				  $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').add(${targetTypeListForClient});
           } else if (ui.value == 15004) { /*premium client */
               //$("#target_type .ui-slider-handle").css("margin-left", "-95px");
               //$("#target_type .ui-slider-handle").text("Premium Client");
               $("#target_type .ui-slider-handle").css("display", "none")
               
			   /* $("#edit_task_parent .client_name").fadeIn("slow");
			   $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').remove();
			   $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').add({ value: "", text: " -- Select --"})
				  $("#task_category_select").selectBoxIt().data('selectBox-selectBoxIt').add(${targetTypeListForPremiumClient}); */
           }
	});
	
	
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
<!-- Datepicker Ends -->

<!-- Custom Selectbox starts -->
<script>
$(document).ready(function(){
    $('.wrapper').attr('id', 'add_task_parent'); 
    $("#task_stat").selectBoxIt();
    $("#task_cat").selectBoxIt();
    $("#assigned_to").selectBoxIt();
    function checkDate(){
    $(this).valid();
    }
	 // Calls the selectBoxIt method on your HTML select box
	 $('#FileUploadForm').validate({ // initialize the plugin
	    ignore:'', //i.e. do not ignore hidden elements	
          onfocusout: function (element) {
        $(element).valid();
		},  
		rules:{
			statusId : { required : true},
			categoryId : { required : true},
			ownerPartyId : { required : true},
			subject : { required : true},
			description : { required : true},
			//targetPartyId : { required : true},
			dueDateTimeString : {required: true},
			completionDateTimeString : {required : true},
			//dueDateTimeString : {required : false}
		}
	});
		/*  $('.required').each(function() {
        $(this).rules('add', {
        required:true,
     });
	 }); */
		$("a.save_new").click(function(e) { e.preventDefault();
		$("#FileUploadForm").validate({
			
		});
		
});
		$("a.save_close").click(function(e) { e.preventDefault();
		$("#FileUploadForm").validate({
		
		});
		
});
 
});
</script>

<!-- Custom Selectbox Ends -->
<!-- custom scroll to "common_in_content" -->
<script>
$(document).ready(function(){
  
    $('.common_in_content').slimScroll();
	
  });
$(document).ready(function(){
	new nicEditor({maxHeight : 100,fullPanel : true,iconsPath : '${pageContext.request.contextPath}/resources/images/nicEditorIcons.gif'}).panelInstance('subject_desc_value');
	});
</script>
<!-- custom scroll to "common_in_content" -->
<!-- Attachment starts -->
<script>
$(document).ready(function(){
 
 jsonPopulateDropdownAddTask("#task_stat", "#task_cat", ''); 
 jsonPopulateDropdownAssignedTo("#assigned_to"); 	
 
 createSlider("#task_priority", 18001, 18004, 1, "#taskpriorityId");
 

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

<!-- Attachment Ends -->

</head><body>
<form:form id="loadtaskList"  name="loadtaskList" modelAttribute="task" action="/partner/editTask"  method="get"> </form:form>
<form:form id="FileUploadForm"  name="FileUploadForm" modelAttribute="task" action="/partner/addTask"  enctype="multipart/form-data" method="post">
<!-- Wrapper starts-->
<div > 
  <!-- Main starts-->
  
  <section class="main"> 
    <!-- Header Starts--> 
    <!-- Header Ends--> 
    <div id="confirmDialog" class="common_custom_modal_aa"> <span class="close">X</span>
  <div class="modal_content">
    <div class="aa_up">
      <spring:message code="dataChanged" />
    </div>
    <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
  </div>
</div>
    
    <!-- Common_content Starts-->
    <section class="content common_content"> 
      <!-- Common_in_contnet starts-->
      <jsp:include page="../layout/submenu_small.jsp"></jsp:include>
      <section id="add_task" class="in_content common_in_content clearfix">
        <ul class="first_sec reset clearfix">
          <li>
            <label class="common_form_label">Assigned To</label>
            <select id="assigned_to" name="ownerPartyId" class="required" onchange="doTargetType(this)">
            </select>
          </li>
          <li>
            <label class="common_form_label" >Task Category</label>
            <select id="task_cat" name="categoryId" class="required">
            </select>
          </li>
          <li>
            <label class="common_form_label" >Task Status</label>
            <select id="task_stat" name="statusId"class="required">
            </select>
          </li>
          <li>
            <label class="common_form_label">Priority</label>
            <div class="range_parent">
              <div class="scale clearfix">
                <div class="scale_range"><span class="low extrem">Low</span><span class="medium extrem">Normal</span><span class="second_high extrem">High</span><span class="high extrem">Urgent</span></div>
                <div id="task_priority"></div>
                <input type="hidden" id="taskpriorityId"  class="range_counter"  name="priorityId"/>
              </div>
            </div>
          </li>
        </ul>
        <ul class="second_sec reset clearfix">
          <li>
            <label class="common_form_label">Target Type</label>
            <div id="target_type" class="common_sliding_radio" style="width: 150px;">
             <span class="lbl_first lbl" style="margin-left:10px;">Opportunity</span> <span class="lbl_second lbl" style="margin-left:35px;">Client</span>
             <!-- <span class="lbl_third lbl">Premium Client</span> --> </div>
            <input type="hidden" id="targetTypeId"   name="targetContactTypeId"/>
          </li>
          <li class="client_names">
            <label class="common_form_label">&nbsp;</label>
            <select id="task_category_select" name="targetPartyId" class="required">
            </select>
          </li>
          <li class="clearfix">
            <div class="due_date rel">
              <label class="common_form_label">Due Date</label>
              <input type="text" id="due_date" class="common_input datepicker required" name="dueDateTimeString" value="${completionDtTime}" readonly placeholder="DD-MMM-YYYY"/>
            </div>
            <div class="completion_date  rel">
              <label class="common_form_label">Completion Date</label>
              <input type="text" id="completion_date" class="common_input" name="completionDateTimeString" disabled="disabled" readonly />
            </div>
          </li>
        </ul>
        <div class="clr"></div>
        <ul class="third_sec reset clearfix">
          <li>
            <label class="common_form_label">Subject</label>
            <input type="text" placeholder="Subject" class="common_input required" id="task_subject" name="subject">
          </li>
          <li>
            <label class="common_form_label">Description</label>
            <div id="subject_desc" class="common_input"> 
              <!-- <textarea  id="subject_desc" style="width: 100%; height: 120px;" class="common_textarea required" placeholder="Description" name="description"></textarea> -->
              <form:textarea class="txt-editor" path="" style="width:776px;height:127px;"
													id="subject_desc_value" cols="" rows="" name="description"></form:textarea>
            </div>
          </li>
          
          <!--  <li>
            <label class="common_form_label">Add Attachments</label>
           
          <ul class="reset clearfix attachment">
          <li>
           <p class="filename" id="first_file_name"><span class="txt"></span><span class="reomve"></span></p>
           <div class="clr"></div>
           <p class="filename" id="second_file_name"><span class="txt"></span><span class="reomve"></span></p>
            <div class="clr"></div>
            <p class="filename" id="third_file_name"><span class="txt"></span><span class="reomve"></span></p>
            <div class="clr"></div>
          
          </li> --> 
          <!-- <li>

 <input name = "file1" type="file" class="jfilestyle" data-icon="false" data-buttonText="Browse"  id="first_file"/>
 <input name = "file2" type="file" class="jfilestyle" data-icon="false" data-buttonText="Browse"  id="second_file"/>
 <input name = "file3"  type="file" class="jfilestyle" data-icon="false" data-buttonText="Browse"  id="third_file"/>
 
           <div class="action">
         <button class="common_btn" id="attach_file" onclick="formSubmit();">Attach</button>
           <button class="common_btn" id="add_new" onclick="addTask();">Add New</button> 
           
           </div></li> --> 
          <!-- </ul>
          </li> -->
          
        </ul>
      </section>
      <!-- Common_in_contnet ends--> 
      <!-- Common footer starts -->
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup2">
            </li>
            <li class="fl list" onClick="formSubmitForNewTask();"><a href="#" class="anch save_new addTaskSaveAndNewLink" ><span class="txt" >Save &amp; New</span></a></li>
            <li class="fl list" onClick="formSubmitForTaskList();"><a href="#" class="anch save_close addTaskSaveAndCloseLink" ><span class="txt">Save &amp; Close</span></a></li>
            <li class="fl list" onClick="cancel();"><a href="#" class="anch cancel"><span class="txt">Cancel</span></a></li>
          </ul>
        </div>
        <!-- <a href="#" class="back navgation" onclick="back();"><span class="txt">Back</span></a> <a href="#" class="next navgation"><span class="txt">Next</span></a> --> 
      </section>
      
      <!-- Common footer ends -->
      <div class="overlay"></div>
    </section>
    
    <!-- Common_content Ends--> 
    
  </section>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends--> 
<!-- For Common Custom File Input--> 
<script type="text/javascript">

function jsonPopulateDropdownAssignedTo(dropdown){
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
		}
	});
	return false;
}

function jsonPopulateDropdownAddTask(dropdown1,dropdown2) {
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

				//var selectBox = $(dropdown).selectBoxIt().data('selectBox-selectBoxIt');			    
			    //selectBox.selectOption(selectedValue);
			    
			},
			error : function(msg) {
				$('.result').html(msg.d);
			}
		});
	return false;
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

var cnt = 1;
function formSubmitForNewTask(){
	$(".save_new").addClass("inactiveLink");
	$(".save_close").addClass("inactiveLink");
	//alert($('#thirdRadio').next("a").text());
	 //$('#targetTypeId').val($('#thirdRadio').next("a").text());
	 //alert($('#targetTypeId').val());
	 var content = nicEditors.findEditor('subject_desc_value').getContent();
    	$("#subject_desc_value").val(content);
	 if( $('#FileUploadForm').validate().form()){
		 if(cnt==1)
		 {
	     $('#FileUploadForm').attr('action', '${pageContext.request.contextPath}/partner/addTask?newTask=true');
 	     $("#FileUploadForm").submit();
 	     cnt++;
		 }
	    }
	 else
	 {
		 $(".save_new").removeClass("inactiveLink");
		 $(".save_close").removeClass("inactiveLink");
	 }
	/* $("#FileUploadForm").ajaxSubmit({
		type : "POST",
		url: "${pageContext.request.contextPath}/partner/uploadFile",
		
		success: function(data){
			alert(data);
		},error : function(response){
			alert(response);
		}
	}); */
	
}

var cntNew = 1;

function formSubmitForTaskList(){
	
		$(".save_new").addClass("inactiveLink");
		$(".save_close").addClass("inactiveLink");	
	//alert($('#thirdRadio').next("a").text());
	 //$('#targetTypeId').val($('#thirdRadio').next("a").text());
	 //alert($('#targetTypeId').val());
	 var content = nicEditors.findEditor('subject_desc_value').getContent();
    	$("#subject_desc_value").val(content);
	 if( $('#FileUploadForm').validate().form()){
		 if(cntNew == 1)
		 {
		 $('#FileUploadForm').attr('action', '${pageContext.request.contextPath}/partner/addTask?newTask=false');
		 $("#FileUploadForm").submit();
		 cntNew++;
		 }
	   }
	   else
		{
		   $(".save_new").removeClass("inactiveLink");
		   $(".save_close").removeClass("inactiveLink");
		}
	 
}
//$("#target_type .lbl_first lbl").click(function(){
	//$(".ui-slider-handle").click(function(){
$(document).ready(function(){		
	//initializeDropDown('Client');	
	/* $( "#target_type" ).on( "slidechange", function( event, ui ) {
			if(ui.value == 1){
				initializeDropDown('Opportunity');
				}else if(ui.value == 2){
			initializeDropDown('Client');
			}else{
				initializeDropDown('Premium Client');
			}
			} );
		 var targetType = $('#thirdRadio').next("a").text(); */
		 //var targetType = "Client";
		 //initializeDropDown(targetType);
		 //initializeDropDown('Opportunity');
		 checkDataInitial();
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
	finalData = [];
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
function initializeDropDown(targetType){
	
	 $.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/partner/getTargetTypeDropdownvalues",
			async : true,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			data : {'targetType' :targetType },
			success : function(data) {
				$("#task_category_select").data("selectBox-selectBoxIt").remove();
				$("#task_category_select").data("selectBox-selectBoxIt").add({ value: "", text: " -- Select --"});
				$.each(data, function(index, item) {	
					
					$("#task_category_select").data("selectBox-selectBoxIt").add({ value: item.id, text: item.name });
				});
			}
		});
	 return false;
	 }
	 
function addTask(){
	//alert('addTask');
}
</script>
</body>
</form:form>
