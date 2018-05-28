
<!-- Custom Selectbox starts -->
 <%@page import="in.fiinfra.cp.CommonUtils"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="in.fiinfra.common.note.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
 <% 
      Note note = (Note) request.getAttribute("note");
     List<Note> noteHistory = (List<Note>) request.getAttribute("noteHistory");
      
      %> 
     
<script>
	function saveNote(action) {
		$('#action').val(action);
	 	if($('#note-form').valid()){
	 		$('#note-form').submit();	
	 	}
	}
</script>
<script>
$(document).ready(function(){
	
  $('#note-form').validate({
	 	errorElement:'div',
    	errorClass:'errors',
    	 highlight: function(element,errorClass) {
    		 $(element).parents("div.form-group").addClass(errorClass);
    	    },
    	    unhighlight: function(element,errorClass) {
    	    	$(element).parents(".error").removeClass(errorClass);
    	    },
        rules: {
        	title: {
        		required : true
        		},
        	description: "required"
        	
        },
        messages: {
        	title:{required:"Enter Subject"
        	},
        	description: "Enter description"
        }
       
       
    });
	 // Calls the selectBoxIt method on your HTML select box
    });
    
</script>
<!-- Custom Selectbox Ends -->
                 
<div class="widget-box  ui-sortable-handle"
	style="opacity: 1; z-index: 0;">
	<div class="widget-header">
		<h6 class="widget-title">List Of Notes</h6>
	</div>

	<div class="widget-body">
		<!-- #section:custom/scrollbar -->
		<% for(Note n:noteHistory){ %> 
		<div class="widget-main padding-4 scrollable ace-scroll"
			data-size="125" style="position: relative;">
			<div class="scroll-track scroll-active"
				style="display: block; height: 125px;">
				<div class="scroll-bar" style="height:auto; top: 112px;"></div>
			</div>	
			<div class="scroll-content" style="height: 125px !important;">
				<div class="content">
					<div class="col-xs-12"><div class="alert alert-info"><div class="col-md-2"><%=n.getTitle() %></div><div class="col-md-10"> <%=n.getDescription() %></div> 
							<span class="name fr"><%=n.getCreatedByName() %></span><span class="date fr"><%=CommonUtils.emptyIfNull(n.getLastModifiedDate()) %> </span>,<span class="time"><%=" " %></span>
				</div></div>
				</div>
			</div>
		</div>
		 <%} %> 
		<!-- /section:custom/scrollbar -->
	</div>
</div>
<br><br>
               <!-- End Display Note -->
               <form:form action="${pageContext.request.contextPath}/notes/save"
			commandName="note" method="POST" id="note-form">
 <div class="clearfix"></div>
 
     <div>
          <!-- New Code -->
          <fieldset>
          <form:input path="refId" type = "hidden"/>
          <form:input path="refTypeId" type = "hidden"/>
          <input  name="returnUrl" type = "hidden" value ="${returnUrl}" />
          	<div class="col-xs-12 ">
				<div class="form-group">
					<label class="col-lg-2 control-label">Title<span class="required">*</span></label>
					
					<div class="col-lg-4">
						<form:input id="second_col_input" class="form-control" path="title" maxlength="20" type="text" name="input" placeholder="Subject" />
					</div>
				</div>
				<br> <br>
			</div>
			<div class="col-xs-12 ">
				<div class="form-group">
					<label class="col-lg-2 control-label">Description<span class="required">*</span></label>
					
					<div class="col-lg-4">
						
						<form:textarea class="form-control" path="description"  placeholder="Description" ></form:textarea>
					</div>
				</div>
				<br> <br>
			</div>
		</fieldset>
		<br><br>
         <div class="col-xs-12" align="center">
						<input type="button" value="Save &amp; Close" class="btn-primary btn-xs btn"" onClick="saveNote('new')">  
          
						<a href="${pageContext.request.contextPath}${returnUrl}" ><input type="button" value="Cancel" class="btn-primary btn-xs btn""></a>
				</div>
  </div>
    
    
    <!-- end of "inner-contents" id --> 
  
  <!-- end of "contents" id -->

</form:form>
