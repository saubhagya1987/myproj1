<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="in.fiinfra.common.note.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<style>
#confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
/*#Add_Profile_Info .family_details .li_three {
	width: 20%;
}*/
</style>
<script>
	function saveNote() {		
		$('#note-form').submit();	
	}
	function confirmDeleteNode(redirect) {		
		$(".aa_yes").click(function(){
			javascript:location.href=redirect;
		});	
		$(".overlay").fadeIn();
		$("#confirmDialog").fadeIn();
	}	
	function editNote(redirect) {		
		javascript:location.href=redirect;
	}
</script>
<script>
function closeDialog(){
	  $(".overlay").fadeOut("slow");
	     $("#confirmDialog").fadeOut("slow");
}
$(document).ready(function(){
  
    $('.add_notes_parent_inside').slimScroll();
    $("#note-form").validate({
		  ignore:'', //i.e. do not ignore hidden elements 
		 });
    $("#confirmDialog .close").click(function(){
 	    $(".overlay").fadeOut("slow");
 	 $("#confirmDialog").fadeOut("slow");
 	  });
  });

</script>
    <% 
      Note note = (Note) request.getAttribute("note");
     List<Note> noteHistory = (List<Note>) request.getAttribute("noteHistory");
     int size = noteHistory.size();
      
     if(note.getRefTypeId() == 111002 || note.getRefTypeId() == 111006) { %>
		<jsp:include page="../layout/submenu_small.jsp"></jsp:include>
<%}
else {%>
<jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
<%} %> 
	<div id="confirmDialog" class="common_custom_modal_aa"> <span class="close" onclick="closeDialog();">X</span>
  <div class="modal_content">
    <div class="aa_up"> Do you really want to delete this note?</div>
    <div class="aa_down" id="yes"> <a style="cursor:pointer;"  class="aa_yes">Yes </a> <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
  </div>
</div>
      <form:form action="${pageContext.request.contextPath}/notes/save"
			commandName="note" method="POST" id="note-form">
    
    <form:input path ="refId" type ="hidden"/>
    <form:input path ="refTypeId" type ="hidden"/>
    <form:input path ="noteId" type ="hidden"/>
    <form:input path ="partyId" type ="hidden"/>
    <input name="returnUrl" type="hidden" value="${returnUrl}" /> 
    <input name="delLink" type="hidden" value="" /> 
 
      <!-- Common_in_contnet starts-->
      <section class="in_content add_notes_page common_in_content clearfix" id="succession-readiness-analysis">
        <div class="add_notes_parent">
          <div class="first_column">
            <h2 class="heading">Add Notes${hdname}</h2>
            
            <% if(size>0) { %>
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
                      <div class="clr"></div>
                      <a href="javascript:void(0)" onclick="javascript:confirmDeleteNode('/FIINFRA-M-WEB/notes/deleteNote?noteIds=<%=n.getNoteId() %>&returnUrl=${returnUrl}')"><div class="delete fr"></div></a>
                      <a href=javascript:void(0)" onclick="javascript:editNote('/FIINFRA-M-WEB/notes/editNote?noteId=<%=n.getNoteId()%>&returnUrl=${returnUrl}&refTypeId=<%=n.getRefTypeId()%>&title=<%=n.getTitle()%>&description=<%=n.getDescription() %>&refId=<%=n.getRefId()%>')"><div class="edit fr"></div></a>
                      </p>
                      <div class="comment"><strong><%=n.getLastModifiedByName() %></strong>  <%=n.getLastModifiedDate()%> </div>
                    </li>
                    <% } %>
                  </ul>
                  
                </div>
                
              </div>
              
              </div>
              
              </div>
              <%} %>
              <div class="add_notes_description_down">
                <div class="add_notes_col">
                  <ul class="reset clearfix second_col_ul">
                    <li class="clearfix rel">
                      <p>
                        <label class="label">Title</label>
                      <!--   <input id="second_col_input" class="add_notes_common_textarea" placeholder="Title" type="text" name="input"> -->
                        <form:input path="title" class="add_notes_common_textarea required" 
									placeholder="Title"  maxlength="20" id="title" value="${note.title}"/>
                      <div class="clr"></div>
                      </p>
                    </li>
                    <li class="clearfix rel">
                      <label class="label">Description</label>
                      <form:textarea path="description"  class="add_notes_content_in required"  placeholder="Description" maxlength="4000"  id="desc" value="${note.description}"/>
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
    </form:form>
