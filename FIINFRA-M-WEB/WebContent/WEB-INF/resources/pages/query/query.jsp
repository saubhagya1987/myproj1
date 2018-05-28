<%@page import="in.fiinfra.common.common.QueryRequest"%>
<%@page import="in.fiinfra.query.model.CommonUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.common.QueryData"%>
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="java.util.List"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%-- <script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.form.js"></script>
 <script src="${pageContext.request.contextPath}/resources/js/common_modal.js"></script><head>
  --%>
 <script>
$(document).ready(function(){
    $("select").selectBoxIt();
});
</script>
<!-- Custom Selectbox Ends --> 
<!-- Filter section toggle starts --> 
<script>
$(document).ready(function(){
  $("#query #query_page .div_dragger").click(function(){
    $("#query_filter").slideToggle("slow");
	 $(":selectBox-selectBoxIt").each(function(){
    $(this).data('selectBox-selectBoxIt').refresh();
     });
	$(".div_dragger span").animate("slow").toggleClass("div_dragger_up","slow");
  });
  
});
</script>

<!-- Filter section toggle ends --> 
<!-- custom scroll to "common_in_content" --> 
<script>
/* $(document).ready(function(){
  
    $('.common_in_content').slimScroll();
	  $('.records').slimScroll();
  }); */

</script>

<!-- custom scroll to "common_in_content" --> 
<!-- Filter section toggle ends --> 
<!-- Alrternate row color --> 
<script>
$(document).ready(function(){
  
 $(".records_ul:even").addClass("even_row");
 $(".records_ul:odd").addClass("odd_row");
  });

</script>
<script>
$(document).ready(function(){
 
	  <c:if test="${not empty success}">
		  /* $("#successDialog").html("<spring:message code="${success}" />");
		  $( "#successDialog").dialog( "open" ); */
		  $(".modal-body").html("<spring:message code="${success}" />");
		  $(".btn-success1").html("OK");
		  $(".btn-success1").on('click',function(){
		  	closeDialog();
		  });		
		  $(".btn-danger1").hide();
		  $('#confirmDialog').modal('show');
	  </c:if>

	  <c:if test="${not empty error}">
	  	/* $("#successDialog").html("<spring:message code="${error}" />");
	  	$( "#successDialog").dialog( "open" ); */
	  	 $(".modal-body").html("<spring:message code="${error}" />");
	    $(".btn-success1").html("OK");
	    $(".btn-success1").on('click',function(){
	    	closeDialog();
	    });		
	    $(".btn-danger1").hide();
	    $('#confirmDialog').modal('show');
	  </c:if>		
			
			
			
	});	

</script>

 <!-- Alrternate row color --> 
<!--Common Custom checkbox -->
<script>
//$(document).ready(function(){
  $("body").on("click","span.common_custom_checkbox",function(){
    $(this).toggleClass("common_custom_checkbox_checked");
	
	 if ($(this).next( ".default_checkbox" ).is(":checked")) {
		
       $(this).next( ".default_checkbox" ).prop("checked", false);
    } else {
       $(this).next( ".default_checkbox" ).prop("checked", true);
	
    }
	
  });
//});

var checkValues='';
function ConfirmDeletion(){
	  checkValues = $('input[name=querySelector]:checked').map(function() {
		 return $(this).val();
	 }).get();
	 if(checkValues.length >0 ){
			// displayMsg("Do you really want to delete this Query?");
			$(".modal-body").html("Do you really want to delete this Query?");
			 $(".btn-danger1").show();
			$(".btn-success1").html("Yes");
			$(".btn-success1").on('click',function(){onDelete();});			
			$('#confirmDialog').modal('show');			
	}//END IF
	else {
		displayMsg("Please select Query to delete");
		//alertMessage("Please select Query to delete.");
		return false;
		}
	
}

 function onDelete(){
	 var checkValues = $('input[name=querySelector]:checked').map(function() {
			 return $(this).val();
		 }).get();

	  $.post("${pageContext.request.contextPath}/query/delete",
			 {queryIds:checkValues.join(',')},function(result){
				 displayMsg('Record deleted Sucessfully');
		    window.location.reload(true);
	  });
	  $("#confirmDialog").modal("hide");
		//$(".overlay").fadeOut("slow");
 }

 function closeDialog(){
	 	for(var i=0;i<checkValues.length;i++)
		{
			 $("#querySelector").attr("checked", false);
		}
		$(".default_checkbox").attr("checked", false);
		$("#querySelector").attr("checked", false);
	 	checkValues = '';
		$(".common_custom_checkbox").removeClass("common_custom_checkbox_checked");
	    $(".overlay").fadeOut("slow");
		$("#confirmDialog").fadeOut("slow");
	 
 }
 function resetSearch(){  
	 $("select").selectBoxIt('selectOption', 0);
	 $("#searchSubject").val('');
	 search();
 }
 
 function search(){
	 $(".records_ul:even").addClass("even_row");
	 $(".records_ul:odd").addClass("odd_row");
	 
	  var data = $("#query-search").serialize();
	  $("body").addClass("loading");
		$.ajax({
			type : "POST",
			data :data,
			url : "${pageContext.request.contextPath}/query/search",
			success : function(data) {
				$("body").removeClass("loading");
				$("#query_records").html(data);
				$(".records_ul:even").addClass("even_row");
				 $(".records_ul:odd").addClass("odd_row");
				
			},
			error : function(msg) {
				$("body").removeClass("loading");
				$("#query_records").html("Sorry but there was an error: ");
			}
		});	 
	 
 }
/*  
 function alertMessage(message)
 {
 	$("#dialog1").html(message);
 	$( "#dialog1").dialog( "open" );
  } */

 function addQuery(){
	 var nodeID = '${nodeId}';
		if(nodeID>0)
		{
			alertMessage("Please select partner first from Hierarchy to create Query");
		}
		else{
		window.location.replace("${pageContext.request.contextPath}/query/add");
		};
	 }
 
 
 function displayMsg(msg){
		    $(".modal-body").html(msg);
			$(".btn-success1").html("Ok");
			$(".btn-success1").on('click',function(){closeDialog();});
			$(".btn-danger1").hide();
			$('#confirmDialog').modal('show');
	}

	function closeDialog(){
		$("#confirmDialog").modal('hide');
	}
 </script>
 
 <div id="dialog1" class="common_dialog" style="text-align: center;"> </div> 
<div id="query"> 
  <!-- Main starts-->  
  <section class="main">  

    <!-- Common_content Starts-->
    <section class="in_content common_in_content"> 
      <!-- Common_in_contnet starts-->
      <section id="query_page" class="in_content common_in_content clearfix">
     
          <form:form action="${pageContext.request.contextPath}/query/list" id="query-search"
		commandName="q" method="GET">
		 <div id="query_filter">
      
      <ul class="reset clearfix parameters">
      
      <li><form:input id="searchSubject" type="text" class="common_input" placeholder="Subject" path="subject"/></li>
     
      <li><form:select id="searchQueryType" path="queryType" itemLabel="name" itemValue="id" items="${queryTypes}">	</form:select></li> 
      <li><form:select id="searchQueryFrom" path="queryFrom" itemLabel="name" itemValue="id" items="${queryTo}"></form:select></li>  
      <li><form:select id="searchQueryFor"  path="queryFor"  itemLabel="name" itemValue="id" items="${contacts}"></form:select></li> 
      </ul> 
      <ul class="reset clearfix action">
      <li><input type="button"  value="Reset" onClick="resetSearch();" class="common_btn"/></li>
      <li><input type="button" value="Search" onClick="search();"  class="common_btn queryListsearchQueryLink"/></li>
      
      </ul>
      <div class="clr"></div>
     </form:form>
      </div>
            
      <% 
      QueryRequest q = (QueryRequest) request.getAttribute("q");
      List<QueryData> data=(List<QueryData>) request.getAttribute("data"); 
      String queryPanel = q.getQueryPanel();          
      %>
      
      <div class="div_dragger queryListsearchQueryLink"><span></span></div> 
        <div class="contact_par">          
	        <section id="query_records">              
			 <jsp:include page="query_record.jsp" />
	        </section>  
        </div>       
      </section>      
      </section>
      
     
      <!-- Common footer starts -->
      <section class="common_footer_actions"> 
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup2">
            </li>
            <li class="fl list"><a href="#" onclick="addQuery();" class="anch new_query queryListNewQueryLink"><span class="txtFooter">New Query</span></a></li>
            <li class="fl list"><a onClick="ConfirmDeletion()" href="#" class="anch delete_query queryListDeleteQueryLink"><span class="txtFooter">Delete Query/s</span></a></li>
          </ul>
        </div>
        <a href="${pageContext.request.contextPath}/partner/dashboard" class="back navgation">
        <span class="txtFooter">Back</span></a> <a href="${pageContext.request.contextPath}/partner/dashboard" class="next navgation"><span class="txtFooter">Next</span></a>        
        </section>        
    </section>
    
  <!-- Main ends--> 
</div>

<!-- <div id="confirmDialog" class="common_custom_modal_aa">
  <span class="close" onclick="closeDialog();">X</span>
  <div class="modal_content"> 
    <div class="aa_up">
        Do you really want to delete this Query?</div>

         <div class="aa_down" id="yes"> <a style="cursor:pointer;" onclick="onDelete();" class="aa_yes">Yes </a> 
         <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
  </div>
</div>  -->

<div class="modal fade" id="confirmDialog" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    		<div class="modal-dialog">
       		<div class="modal-content">
            <div class="modal-body">
                
             </div>
            <div class="modal-footer">
             <button  class="btn btn-sm btn-success1 btn-primary"><i class="ace-icon fa fa-check bigger-110"></i>Yes</button>
  		       <button onclick="closeDialog();" class="btn btn-sm btn-danger1 btn-primary"><i class="ace-icon fa fa-close bigger-110 btn-primary"></i>No</button>
		             </div>
    </div>

  </div>
</div>

<div class="modal"><!-- Place at bottom of page --></div>
