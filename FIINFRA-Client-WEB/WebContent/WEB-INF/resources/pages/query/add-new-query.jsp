<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="in.fiinfra.common.common.QueryData"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Custom Selectbox starts -->
<% QueryData querydata = (QueryData)request.getAttribute("query");  %>
<!-- <style type="text/css">  
 .errors {color:#900};  
</style> -->
<script>
	function saveQuery(action) {
		
		$('#action').val(action);
	 	if($('#query-form').valid()){
	 		$('#query-form').submit();	
	 	}
	}
</script>
<script>
$(document).ready(function(){
    
    $('#query-form').validate({
    	errorElement:'div',
    	errorClass:"errors", 
    	
        rules: {
        	subject: "required",
        	notes: "required"
        },
        messages: {
        	subject: "Enter Subject",
        	notes: "Enter Description"
        }
    });
	 // Calls the selectBoxIt method on your HTML select box
    });
</script>
<!-- Custom Selectbox Ends -->
 
  <form:form action="${pageContext.request.contextPath}/query/save" commandName="query" method="POST" id="query-form">
  <div class="clearfix"></div>
  <div id="contents" class="clearfix">
    <div id="add_new_query" class="in_content clearfix"> 
       	<input type="hidden" value="${returnUrl}" name="returnUrl">
       	<form:input type="hidden" path="queryId"></form:input>
         <%--  <ul class="reset clearfix">
            <li class="clearfix container_li">
              <label class="form_label">Query Type</label>
             <form:select path="queryType" name="queryType" itemLabel="name" itemValue="id"
									items="${queryTypes}"  class="required"> </form:select>
            </li>
            <li class="clearfix container_li">
              <label class="form_label">Subject</label>
              <form:input id="second_col_input" class="common_input" path="subject" type="text" name="input" placeholder="Subject" />
            </li>
            <li class="clearfix container_li">
              <label class="form_label">Description</label>
                    <form:textarea class="txt-editor common_textarea" path="notes" name="" cols="" rows="" placeholder="Description" ></form:textarea>
            </li>
          </ul> --%>
			<fieldset>
				<div class="col-xs-12 ">
					<div class="form-group">
						<label for="textArea" class="col-lg-1 control-label">Query
							Type</label>
						<div class="col-lg-4">
							<!-- <input id="second_col_input" name="url" placeholder="Heading"
								class="form-control" type="text" value=""> -->
							<form:select path="queryType" name="queryType" itemLabel="name"
								itemValue="id" items="${queryTypes}"
								class="form-control">
							</form:select>
						</div>
					</div>
					<br> <br>
				</div>
				<div class="col-xs-12 ">
					<div class="form-group">
						<label for="textArea" class="col-lg-1 control-label">Subject <span class="required">*</span></label>
						<div class="col-lg-4">
							<!-- <input id="second_col_input" name="url" placeholder="Subject" class="form-control" type="text" value=""> -->
							<form:input id="second_col_input" class="form-control"
								path="subject" type="text" name="input" placeholder="Subject" />
						</div>
					</div>
					<br> <br>
				</div>
				<div class="col-xs-12 ">
					<div class="form-group">
						<label for="textArea" class="col-lg-1 control-label">Description<span class="required">*</span></label>
						<div class="col-lg-4">
							<!-- <textarea name="text" placeholder="Description"
								class="form-control" type="text" value=""></textarea> -->
							<form:textarea class="form-control" path="notes" name="" cols=""
								rows="" placeholder="Description"></form:textarea>
						</div>
					</div>
					<br> <br>
				</div>
			</fieldset>
			<br><br>
			</div>
    <!-- end of "inner-contents" id --> 
  </div>
  <!-- end of "contents" id -->
         
            <div class="col-xs-12" align="center">
                        <!--a class="anch save_n_close" href="#"><span class="txt">Save &amp; Close</span></a-->
                            <input type="button" value="Save &amp; Close" class="btn-primary btn-xs btn" onClick="saveQuery('new')">            
                            <a class="btn-primary btn-xs btn" href="${pageContext.request.contextPath}${returnUrl}" >Cancel</a>
          </div>    
  </form:form>

