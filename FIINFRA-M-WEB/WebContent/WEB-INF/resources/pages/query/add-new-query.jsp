<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="in.fiinfra.common.common.QueryData"%>
<%@page import="java.util.Map"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<% 
	QueryData query=(QueryData) request.getAttribute("query"); 
	Integer[] contactTypes = (Integer[]) request.getAttribute("contactTypes");
 	boolean mySelf = !(query.getContactType()>0);
%>
<style>
#confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
/*#Add_Profile_Info .family_details .li_three {
	width: 20%;
}*/
</style>
<script>
initialData = [];
finalData = [];
function saveQuery(action) {
	
	$(".save_n_new").addClass("inactiveLink");
	$(".save_n_close").addClass("inactiveLink");
	
	var txt = $("#Query_for .ui-slider-handle").html();
	if(txt == 'My Contact') {
		$("#Contct_name").rules("add", {min:0,messages: {min: "This field is required." }});
	}
	else {
		$("#Contct_name").rules("add", {min:-1});
	}
	if($( "#query-form" ).validate().form()){
	var myOrOther = $("#queryType").val();
	if("1"== myOrOther){
		$('#contactId').val(self);
		$("#contactType").val('');
	}
	checkDataFinal();
	if(initialData.toString() == finalData.toString()) {
		alertMessage("You haven't changed any data yet. Please make some changes then save.");
		 $(".save_n_new").removeClass("inactiveLink");
		 $(".save_n_close").removeClass("inactiveLink");
	}
	else {
		 $('#action').val(action);
		 if($("#query-form").validate().form()){
			 $('#query-form').submit();
		 }
		 else
		 {
			 $(".save_n_new").removeClass("inactiveLink");
			 $(".save_n_close").removeClass("inactiveLink");
		 }
	}
	}
	else
	{
		$(".save_n_new").removeClass("inactiveLink");
		$(".save_n_close").removeClass("inactiveLink");
	}
}
/* Contact type selector */
$(document).ready(function () {
	checkDataInitial();
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
		$("#confirmDialog .close").click(function(){
	 	    $(".overlay").fadeOut("slow");
	 	 $("#confirmDialog").fadeOut("slow");
	 	  });
	$(".clearfix").addClass("rel");
	$("li").addClass("rel");
	
	$("#query-form").validate({
		ignore:'', //i.e. do not ignore hidden elements	
		
	});
	$("#queryType").rules("add", {min:1,messages: {min: "This field is required." }});
	$("#queryTo").rules("add", {min:1,messages: {min: "This field is required." }});
	
    $('.wrapper').attr('id', 'add_new_query');
	$('.common_in_content').slimScroll();
	 $("select").selectBoxIt();

	 
	  $("#Query_for").slider({
	        min: 1,
	        max: 2,
	        step: 1,
	        slide: function (event, ui) {
	            queryForSelect(ui.value);
	              if (ui.value == 1) {
	                  $("#Query_for .ui-slider-handle").css("margin-left", "2px");
	                 } else if (ui.value == 2) {
	                  $("#Query_for .ui-slider-handle").css("margin-left", "-74px");
	               }
			 },
			  change: function (event, ui) {
	            queryForSelect(ui.value);
	              
			 }
			});
	    $("#Query_for .ui-slider-handle").css("margin-left", "2px");
	    $("#Query_for .ui-slider-handle").text("Self");

	    $("#contact_type").slider({
	        min: 1,
	        max: 2,
	        step: 1,
	        slide: function (event, ui) {
	            accountTypeSelect(ui.value);
	            if (ui.value == 1) {
	               // $("#contact_type .ui-slider-handle").css("margin-left", "2px");
	                $("#contact_type .ui-slider-handle").css("margin-left", "10px");
					} else if (ui.value == 2) {
	               // $("#contact_type .ui-slider-handle").css("margin-left", "-25px");
						$("#contact_type .ui-slider-handle").css("margin-left", "-50px");
	              } else if (ui.value == 3) {
	               // $("#contact_type .ui-slider-handle").css("margin-left", "-95px");
	            	  $("#contact_type .ui-slider-handle").css("display", "none");
	              }
	        },
			change: function (event, ui) {
	            accountTypeSelect(ui.value);
	              
			 }
   });
	    $("#contact_type .ui-slider-handle").css("margin-left", "2px");
	    $("#contact_type .ui-slider-handle").text("Premium Client");


	    var cType = $('#contactType').val();
	if (cType && cType > 0) {
	        $("#Query_for").slider('value', 2);
			 $("#Query_for .ui-slider-handle").css("margin-left", "-74px");
	 }
	
    $('.required').each(function() {
        	$(this).rules('add', {
        	required:true
     		});
	});
     
});

</script>

<script>
function queryForSelect(val){
	//$("#queryType").val(val);
    $("#Query_for .ui-slider-handle").empty();
    if (val == 1) {
       // $("#Query_for .ui-slider-handle").css("margin-left", "2px");
        $("#Query_for .ui-slider-handle").text("Self");
		 $("#query li.contact_type").fadeOut("slow");
    } else if (val == 2) {
    //    $("#Query_for .ui-slider-handle").css("margin-left", "-74px");

        $("#Query_for .ui-slider-handle").text("My Contact");
	    $("#query li.contact_type").fadeIn("slow");

	    var cType = $('#contactType').val();
	    if(cType >0){
			for(var i=0;i<oppTypes.length;i++){
				if(cType == oppTypes[i]){
					$("#contact_type").slider('value',i+1);
					break;
				}
			}
	    }
	    else{
	    	$("#contact_type").slider('value',1);	
	    }

    }
}

function accountTypeSelect(val){
    $("#contact_type .ui-slider-handle").empty();
    if (val == 1) {        
        $("#contact_type .ui-slider-handle").css("margin-left", "10px");
		$("#contact_type .ui-slider-handle").text("Opportunity");
    } else if (val == 2) {       
         $("#target_type .ui-slider-handle").css("margin-left", "-50px");
       $("#contact_type .ui-slider-handle").text("Client");
    } else if (val == 3) {      
        $("#contact_type .ui-slider-handle").css("display", "none");        
    }
    
    var cType = $('#contactType').val();
    if(cType !=oppTypes[val-1]){
    	
    	$("#contactType").val(oppTypes[val-1]);
        
    	var cId =  oppTypes[val-1];
    	jsonPopulateKeyValue("${pageContext.request.contextPath}/query/getParty?partyId=${partyId}&recordType="+ cId, '', "#Contct_name", "contactId");
    	
    }
}

</script>
<script>
var oppTypes = [];
		<% for (int i=0; i<contactTypes.length; i++) { %>
		oppTypes[<%= i %>] = "<%= contactTypes[i] %>"; 
		<% } %>
            
</script>


<div id="query">
  <!-- Main starts-->
  <section class="main">
  <div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
  <div id="confirmDialog" class="common_custom_modal_aa"> <span class="close">X</span>
  <div class="modal_content">
    <div class="aa_up">
      <spring:message code="dataChanged" />
    </div>
    <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
  </div>
</div>
    <form:form action="${pageContext.request.contextPath}/query/save"
			commandName="query" method="POST" enctype="multipart/form-data"
			id="query-form">
      <input id="action" name="action" type="hidden" value="" />
      <form:input path="queryId" type="hidden" />
      <section class="content">
        <section class="in_content common_in_content clearfix"
					id="add_query_content_in">
          <div class="fl first_col">
            <ul class="reset clearfix first_col_ul">
              <li class="clearfix">
                <label class="form_label">Query
                  Type</label>
                <form:select path="queryType" name="queryType" itemLabel="name" itemValue="id"
									items="${queryTypes}"  class="required"> </form:select>
              </select> </li>
              <li>
                <label class="form_label">Query To</label>
                <form:select path="queryTo" items="${queryTo}" itemLabel="name"
									itemValue="id" class="required"> </form:select>
              </li>
              <li></li>
            </ul>
            <div class="clearfix"></div>
          </div>
          
          <!-- Box Two starts -->
          <input type="hidden" name="contactType" id="contactType" value="<%=query.getContactType() %>"/>
          <input type="hidden" name="queryType" id="queryType" value="<%=mySelf?"1":"2" %>"/>
          <div class="fl second_col">
            <ul class="reset clearfix second_col_ul">
              <li class="clearfix">
                <label class="form_label">Query For</label>
                <div id="Query_for" class="common_sliding_radio"> <span class="lbl_first lbl">Self</span> <span class="lbl_second lbl">My Contact</span> </div>
              </li>
              <li class="clearfix contact_type">
                <label class="form_label">Contact Type</label>
                <div id="contact_type" class="common_sliding_radio" style="width: 150px;">
                <span class="lbl_first lbl" style="margin-left:10px;">Opportunity</span> <span class="lbl_second lbl" style="margin-left:35px;">Client</span>
                 <!--  <span class="lbl_third lbl">Premium Client</span> --> </div>
              </li>
              <li class="contact_type">
                <form:select path="contactId" id="Contct_name"	items="${contacts}" itemLabel="name" itemValue="id" > </form:select>
              </li>
            </ul>
            <div class="clearfix"> </div>
          </div>
          <div class="fl third_col">
            <ul class="reset clearfix second_col_ul">
              <li class="clearfix">
                <label class="form_label">Subject</label>                
                <form:input path="subject" class="common_input required"
									placeholder="Subject" id="second_col_input"  />
              </li>
              <li class="clearfix">
                <label class="form_label">Description</label>
                <form:textarea path="notes" rows="5" class="txt-editor required"
									cols="30" placeholder="Please Enter Comment"  />                
                
              </li>
              <li class="clearfix">
                <div class="below-txt-editor-box">
                  <ul>
                  </ul>
                </div>
              </li>
            </ul>
            <div class="clearfix"></div>
          </div>
          
          <!-- Box Third Ends --> 
          
        </section>
      </section>
      
      <!-- Common footer starts -->
      <div id="Footer_Type">
        <section class="common_footer_actions">
          <div class="clearfix" id="main_actions">
            <ul class="reset clearfix fr btn_grup">
              <% if(query.getQueryId() >0){ %>

              <li class="fl list"><a
								href="${pageContext.request.contextPath}/notes/note?refId=<%=query.getQueryId()%>&refTypeId=${RefTypeId}&partyId=${partyId}&<%=BaseRequest.encode("returnUrl", "/query/view?queryId="+query.getQueryId())%>"
								class="anch add_note"><span class="txt">Notes</span></a></li>

              <li class="fl list"><a
								href="${pageContext.request.contextPath}/document/view?refId=<%=query.getQueryId()%>&refTypeId=${RefTypeId}&partyId=${partyId}&<%=BaseRequest.encode("returnUrl", "/query/view?queryId="+query.getQueryId())%>"
								class="anch add_doc"><span class="txt">Documents</span></a></li>

              <%} %>
              
              <li class="fl list"><a onClick="saveQuery('new')"
								class="anch save_n_new addQuerySaveAndCloseLink" href="#"><span class="txt">Save
                &amp; New</span></a></li>
              <li class="fl list"><a onClick="saveQuery('close')"
								class="anch save_n_close addQuerySaveAndNewLink" href="#"><span class="txt">Save
                &amp; Close</span></a></li>
              <li class="fl list"><a
								href="#" onClick="cancel();"
								class="anch cancel"><span class="txt">Cancel</span></a></li>
            </ul>
          </div>
      </div>
    </form:form>
  </section>
</div>

<script>
function checkDataInitial(){
	initialData = [];
	initialData.push($("#queryType").val());
	initialData.push($("#queryTo").val());
	initialData.push($("#Contct_name").val());
	initialData.push($("#second_col_input").val());
	initialData.push($("#notes").val());
}
function checkDataFinal(){
	finalData = [];
	finalData.push($("#queryType").val());
	finalData.push($("#queryTo").val());
	finalData.push($("#Contct_name").val());
	finalData.push($("#second_col_input").val());
	finalData.push($("#notes").val());
	
}
function alertMessage(msg)
{
	$("#dialog1").html(msg);
	$( "#dialog1").dialog( "open" );
}

function closeDialog(){
	  $(".overlay").fadeOut("slow");
	     $("#confirmDialog").fadeOut("slow");
}	

function cancel(){
	 checkDataFinal();
		if(initialData.toString() == finalData.toString()){ 
			var returnUrl = '${returnUrl}';
			if(returnUrl!= 'empty'){
				javascript:location.href=returnUrl;
			}else {
				javascript:location.href='${pageContext.request.contextPath}/query/list';
			}
		 }else{
			 
			 $(".aa_up").html("<spring:message code='dataChanged' />");
				$(".aa_yes").click(function(){
				cancelPage();
				});	
				$(".overlay").fadeIn();
				$("#confirmDialog").fadeIn();
		} 
	}
	function back(){
		javascript:location.href='${pageContext.request.contextPath}/query/list';
	}

	function cancelPage(url){
		javascript:location.href='${pageContext.request.contextPath}/query/list';
	}	 	
</script>