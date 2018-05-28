<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%> 
<%@taglib uri="http://displaytag.sf.net" prefix="display"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
       
 <!DOCTYPE html>                
<html lang="en"><head>       
<meta http-equiv="content-type" content="text/html; charset=UTF-8">  
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">  
<meta name="description" content="">       
<meta name="author" content="">              
<title>Department List</title>   

<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">

</head>
<body>
<input type="hidden" name="istoClose" id="istoClose">
	<jsp:include page="../common/header.jsp" />
             
	<input id="contextPath" type="hidden" name="contextPath" value="<%=request.getContextPath()%>" />
	<input type="hidden" name="confirmdelete" id="confirmdelete">
	
	<!--css popup window start 1-->
	<!--Add Service Team Member Start-->
	<div style="display: none;" id="blanket"></div>




<div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog">
         <div class="modal-content">
         <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <h3 class="modal-title" id="myModalLabel">Add Department</h3> 
      </div>
      	<div id="success-msg"></div>
         <div class="modal-body">
           <form class="form-horizontal" id="xyzform" method="POST">
            <input type="hidden" name="actionvalue" id="actionvalue" value="">
      
          <!-- hideen field for editor validation -->

					<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="Biz Unit">Biz Unit<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
							  
							  <select name="bizUnitName" id="bizUnitId" onfocus="getClear()" class="input-xxlarge"/></select>
							  
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					<div class="form-group">
					  <input type="hidden" name="sourceId"  id="add_sourceId">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="SourceID">Department Type<span class="red">*</span></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							<select name="departmentType" id="departmentType"  class="input-xxlarge"/></select>
						</div>
						</div>
					</div>
				
					<div class="space-2"></div>	
				
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="Question Text">Department Name<span class="red">*</span></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
						
										 <input type="text" name="departmentName" id="departmentName"class="input-xxlarge"/>
							</div>
						</div>
					</div>
	
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="AnswerText">Display Short Name<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							<input type="text" name="departmentShortName" id="departmentShortName"class="input-xxlarge"/>
							</div>
						</div>
					</div>
					<div class="space-2"></div>
				
					
						<div class="modal-footer">
							<div class="clearfix">
								<button id="#" class="btn btn-sm btn-primary"  onclick="saveDep(0);" ><i class='ace-icon fa fa-plus'></i>Save & New</button>
								<button id="#" class="btn btn-sm btn-primary" onclick="saveDep(1);" ><i class='ace-icon fa fa-plus'></i>Save & Close</button>
								<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger"
      						type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button> 
								
								<!-- 
								 <button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="saveDepartment(1);"> Save & New</button>
						 		<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="saveDepartment(0);"> Save & Close</button>
     					 		<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger"
      						type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button>  -->
							</div>
						</div>
				
			</form>
					<div>
		</div>
		</div>
		</div>
		</div>
		</div>





		<!-- <div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  		<div class="modal-dialog">
 	  	<div class="modal-content">
      	<form class="form-horizontal" id="Adddepartment" method="POST">
      	<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Department</h4>
     	</div>
     	 <div class="modal-body">
     	 <div class="row">
		
		 
		 	<div class="form-group">
						<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Biz Unit<span class="red">*</span></label>
							<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								 <select name="bizUnitName" id="bizUnitId"  class="input-xxlarge"/></select>
							</div>
						</div>
					</div>
		
		 <div class="space-2"></div> 
				
           			<div class="form-group">
						<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Department Type <span class="red">*</span></label>
							<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<select name="departmentType" id="departmentType"  class="input-xxlarge"/></select>
							</div>
						</div>
					</div>
		
		 <div class="space-2"></div>
    							  
			  <div class="form-group">
						<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Department Name <span class="red">*</span></label>
							<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<input type="text" name="departmentName" id="departmentName"class="input-xxlarge"/>
							</div>
						</div>
					</div>
		
		 <div class="space-2"></div>
					
           			<div class="form-group">
						<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Display Short Name<span class="red">*</span></label>
							<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<input type="text" name="departmentShortName" id="departmentShortName"class="input-xxlarge"/>
							</div>
						</div>
					</div>

       <div class="space-2"></div> 
     	 			<div class="modal-footer"> 
     	 			<div class="form-group">
						
						<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="platform"></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								 <button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="saveDepartment(1);"> Save & New</button>
						 		<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="saveDepartment(0);"> Save & Close</button>
     					 		<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger"
      						type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button> 
							</div>
						</div>
					</div>	
				</div> 
					
			
			</div></div>
			</form>
			 </div></div></div>	 -->
    <!-- delete-->
   
    <div class="modal fade" id="deletenote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
     <div class="modal-dialog">
       <div class="modal-content">
        <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel">Message</h4>
        	Do you want to delete this Department Please confirm.
				 <div style="float:right;">
					<form>	
					<input type="hidden" name="confirmdelete" id="confirmdelete" value=""> 	
					  <button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="confirmDelete();"> Yes</button>
					  <button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger"
					   type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> No</button>	
					</form>
						</div>
						    </div>.					
				</div>
 		</div>
 		</div>  
 		
 		   <!-- delete-->
     <!------------------------------ Edit Department ----------------------------------->
     
     <%-- <div class="modal fade" id="editnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog">
         <div class="modal-content">
         <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <h3 class="modal-title" id="myModalLabel">Edit Department</h3> 
      </div>
      	<div id="success-msg"></div>
         <div class="modal-body">
           <form class="form-horizontal" id="updateform" method="POST">
            
            		<input type="hidden" name="departmentIdEdit" id="departmentIdEdit" >
		        <input type="hidden" name="bupartyid" id="bupartyid"  value="${data.buId}">                  
		        <input type="hidden" name="codevalueEdit" id="codevalueEdit">  
		        <input type="hidden" name="codetypeIdEdit" id="codetypeIdEdit"> 
      
          <!-- hideen field for editor validation -->

					<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="Biz Unit">Biz Unit<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
							  
							  <select name="bizunitEdit" id="bizunitEdit"  class="input-xxlarge"/></select>
							  
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					<div class="form-group">
					  <input type="hidden" name="sourceId"  id="add_sourceId">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="SourceID">Department Type<span class="red">*</span></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							<select name="departmentTypeEdit" id="departmentTypeEdit"  class="input-xxlarge"/></select>
						</div>
						</div>
					</div>
				
					<div class="space-2"></div>	
				
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="Question Text">Department Name<span class="red">*</span></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
						
										 <input type="text" name="departmentNameEdit" id="departmentNameEdit"  class="input-xxlarge"/>
							</div>
						</div>
					</div>
	
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="AnswerText">Display Short Name<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							<input type="text" name="departmentShortNameEdit" id="departmentShortNameEdit"  class="input-xxlarge"/>
							</div>
						</div>
					</div>
					<div class="space-2"></div>
				
					
						<div class="modal-footer">
							<div class="clearfix">
								<button id="#" class="btn btn-sm btn-primary"  onclick="saveDep(0);" ><i class='ace-icon fa fa-plus'></i>Save & New</button>
								<button id="#" class="btn btn-sm btn-primary" onclick="saveDep(1);" ><i class='ace-icon fa fa-plus'></i>Save & Close</button>
								<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger"
      						type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button> 
								
								<!-- 
								 <button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="saveDepartment(1);"> Save & New</button>
						 		<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="saveDepartment(0);"> Save & Close</button>
     					 		<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger"
      						type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button>  -->
							</div>
						</div>
				
			</form>
					<div>
		</div>
		</div>
		</div>
		</div>
		</div> --%>
		
		<div class="modal fade" id="editnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog">
         <div class="modal-content">
         <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <h3 class="modal-title" id="myModalLabel">Edit Department</h3> 
      </div>
      	<div id="success-msg"></div>
         <div class="modal-body">
           <form class="form-horizontal" id="updateform" method="POST">
            
            		<input type="hidden" name="departmentIdEdit" id="departmentIdEdit" >
		        <input type="hidden" name="bupartyid" id="bupartyid"  value="${data.buId}">                  
		        <input type="hidden" name="codevalueEdit" id="codevalueEdit">  
		        <input type="hidden" name="codetypeIdEdit" id="codetypeIdEdit"> 
      
          <!-- hideen field for editor validation -->

					<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="Biz Unit">Biz Unit<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
							  
							  <select name="bizunitEdit" id="bizunitEdit"  class="input-xxlarge"/></select>
							  
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					<div class="form-group">
					  <input type="hidden" name="sourceId"  id="add_sourceId">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="SourceID">Department Type<span class="red">*</span></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							<select name="departmentTypeEdit" id="departmentTypeEdit"  class="input-xxlarge"/></select>
						</div>
						</div>
					</div>
				
					<div class="space-2"></div>	
				
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="Question Text">Department Name<span class="red">*</span></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
						
										 <input type="text" name="departmentNameEdit" id="departmentNameEdit"  class="input-xxlarge"/>
							</div>
						</div>
					</div>
	
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="AnswerText">Display Short Name<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							<input type="text" name="departmentShortNameEdit" id="departmentShortNameEdit"  class="input-xxlarge"/>
							</div>
						</div>
					</div>
					<div class="space-2"></div>
				
					
						<div class="modal-footer">
							<div class="clearfix">
								<button id="#" class="btn btn-sm btn-primary"  onclick="updateDep(0);" ><i class='ace-icon fa fa-plus'></i>Save</button>
								
      						<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button> 
								
								<!-- 
								 <button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="saveDepartment(1);"> Save & New</button>
						 		<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="saveDepartment(0);"> Save & Close</button>
     					 		<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger"
      						type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button>  -->
							</div>
						</div>
				
			</form>
					<div>
		</div>
		</div>
		</div>
		</div>
		</div>
     
     

  		<%-- <div class="modal fade" id="editnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 			 <div class="modal-dialog">
    		<div class="modal-content">
    		<div class="modal-header">
      	 	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       	 	<h4 class="modal-title" id="myModalLabel">Edit Role</h4>
      		</div>
      	<div class="modal-body">
      	<div class="row">
		<form class="form-horizontal" id="updateform" method="POST">
			 
				<input type="hidden" name="departmentIdEdit" id="departmentIdEdit" >
		        <input type="hidden" name="bupartyid" id="bupartyid"  value="${data.buId}">                  
		        <input type="hidden" name="codevalueEdit" id="codevalueEdit">  
		        <input type="hidden" name="codetypeIdEdit" id="codetypeIdEdit"> 
				
        	
					
					<div class="form-group">
						<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Biz Unit <span class="red">*</span></label>
						 <div class="col-xs-12 col-sm-9">
							<div class="clearfix"> 
							  <select name="bizunitEdit" id="bizunitEdit"  class="input-xxlarge"/></select>
							</div>
						</div>
					</div>
     	 		
     	 			<div class="space-2"></div> 	
						
        		
                    <div class="form-group">
						<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Department Type <span class="red">*</span></label>
						 <div class="col-xs-12 col-sm-9">
							<div class="clearfix"> 
							<input type="text" name="hdndepartmentTypeEdit" id="hdndepartmentTypeEdit"  class="input-xxlarge"/>
		                    <input type="hidden" name="departmentTypeEdit" class="input-xxlarge"    id="departmentTypeEdit" >
							</div>
						</div>
					</div>
     	 		
     	 			<div class="space-2"></div> 
       
                     <div class="form-group">
						<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Department Name <span class="red">*</span></label>
						 <div class="col-xs-12 col-sm-9">
							<div class="clearfix"> 
							<input type="text" name="departmentNameEdit" id="departmentNameEdit"  class="input-xxlarge"/>
							</div>
						</div>
					</div>
     	 		
     	 			<div class="space-2"></div>
 
     				<div class="form-group">
						<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Display Short Name <span class="red">*</span></label>
						 <div class="col-xs-12 col-sm-9">
							<div class="clearfix"> 
							<input type="text" name="departmentShortNameEdit" id="departmentShortNameEdit"  class="input-xxlarge"/>
							</div>
						</div>
					</div>
     
			<div class="space-2"></div> 
     	 			<div class="modal-footer"> 
     	 			<div class="form-group">
						
						<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="platform"></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
							 <button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="updateDep();"> Save</button>
       					 	 <button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button> 
							
							
							</div>
						</div>
					</div>	
				</div> 
					
			</form>
			</div></div> </div></div></div>	
 --%>
<!--css popup window 2 close-->

    
      <!--Nav Menu Start--> 
 <div class="navbar-inverse">
	<div class="container">
    <div class="navbar-header">
		<button class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse" type="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
    	</button>
    <!--<a class="navbar-brand" href="#"> </a>-->
	</div>
   
    </div>
 </div>  


<div class="page-header">
		<h1 class="pull-left">Department List</h1>
               <form class="form-search pull-right">
               		<%-- <span class="input-icon">
                		<input type="text" placeholder="Search ..." class="nav-search-input" id="search"  autocomplete="off" value="${value}">
                		<i class="ace-icon fa fa-search nav-search-icon"></i>
                	</span> --%>
               </form>
         <div class="clearfix"></div>
	</div>
<section>
			<div class="container-body" style="margin-top: 0px;">
				
				<ul class="pagination pagination-sm"></ul>	
				<div class="pull-right">
				 	<a id="SPAddNewDeptLink" href="#" onClick="addNote();" ><input data-params="{}" type="button" class="btn btn-sm btn-primary" value="  New  Department"  onClick="addBizUnit();addDepartmentType();"    title="New  Department" alt="New  Department"></a>
					<a id="SPDeleteDeptLink" href="#" onClick="" ><input data-params="{}" type="button" class="btn btn-sm btn-danger" value="  Delete"  onClick="deleteDepartment();" title="Delete" alt="Delete"></a>
            	</div>
				<div class="clearfix"></div>
				<div class="table-responsive" id="display_table_lead">
					<div id="toreload">
							<table id="grid-table"></table>
							<div id="grid-pager"></div>
					</div>
				</div>
				<div class="pull-right">
				<div class="hr-12"></div>
					<a id="SPAddNewDeptLink" href="#" onClick="addNote();" ><input data-params="{}" type="button" class="btn btn-sm btn-primary" value="  New  Department"  onClick="addBizUnit();addDepartmentType();"    title="New  Department" alt="New  Department"></a>
					<a id="SPDeleteDeptLink" href="#" onClick="" ><input data-params="{}" type="button" class="btn btn-sm btn-danger" value="  Delete"  onClick="deleteDepartment();" title="Delete" alt="Delete"></a>
				</div>
			</div>
	</section>   	
<!-- Center part End -->          

<footer>  
		<jsp:include page="../common/footer.jsp" />
	<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
	</footer>    
	
	
<script>     

function getClear()
{
	
	$('#success-msg').val('');
	$('#success-msg').empty();
}
function saveDep(isclose){
		$('#istoClose').val(isclose);
	//	$('#hiddeneditor').val($('#quetext').text());
		//alert($('#hiddeneditor').val());
	//	$('#anshiddeneditor').val($('#anstext').text());
		//alert($('#anshiddeneditor').val());
		//alert('HIIEE'+	$('#hiddeneditor').val())
		
		jQuery.validator.addMethod("buparty", function (value, element) {
	    	return response = ( $('#bizUnitId').val() == '0' ) ? false: true ;
 		 }, "Biz Unit is required ");
		jQuery.validator.addMethod("department", function (value, element) {
	    	return response = ( $('#departmentType').val() == '0' ) ? false: true ;
	       }, "Please select depertment type.");
		
		
		
		$.validator.addMethod("alphaNumeric", function (value, element) {
		    return this.optional(element) || /^[ a-zA-Z]+$/.test(value);
		}, " Only letters allowed.");
		
		
	 var validator=$('#xyzform').validate({
		 
			errorElement: 'div',
			errorClass: 'help-block',
			focusInvalid: false,
			ignore: "",
			 icon: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
			},
			rules: {
				
			
				bizUnitName: {
					required: true,
					buparty:true
				},
				departmentType:
				{
					required:true,
					department:true
					//,alphanumeric: true
					
			},
			departmentName:{
				required:true ,
				alphaNumeric: true// */
				
		},
				
			departmentShortName:
			{
				required:true ,
				alphaNumeric: true/* */
				
		}
			},

			messages: {
			
			},


			highlight: function (e) {
				$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
			},

			success: function (e) {
				$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
				$(e).remove();
			},

			errorPlacement: function (error, element) {
				if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
					var controls = element.closest('div[class*="col-"]');
					if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
					else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
				}
				else if(element.is('.select2')) {
					error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
				}
				else if(element.is('.chosen-select')) {
					error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
				}
				else error.insertAfter(element.parent());
			},

			submitHandler: function (form) {
				
				if(validator.form()){ // validation perform
					//alert("doadd");

				 	$.ajax({
						type :'POST',  
						
						data:$('#xyzform').serialize(),  
						url : $('#contextPath').val() +"/departmentlist/addDepartment.htm",
						
								success : function(result) 
								{
									
									 if(result>0){
						              		
						              		
						              	   bootbox.dialog({
												message: "<span class='bigger-110'>Department Type Already Exists.</span>",
												buttons: 			
												{
													"click" :
													{
														"label" : "OK!",
														"className" : "btn-sm btn-primary",
														"callback": function() {
													 		 //$('#common_popup_div,#shadow_div_web_app').remove(); 
											              		resetval(); 
												                addNote();   
												                //popup('popUpAlertaddnote').show();
														}
													}
												}
											});
						              		
						             
						                 
										 }  
									 else
										 {
										 var isclose1=$('#istoClose').val();
											
										   if(isclose1==1){
											   bootbox.dialog({
													message: "<span class='bigger-110'>Department saved successfully.</span>",
													buttons: 			
													{
														"click" :
														{
															"label" : "OK!",
															"className" : "btn-sm btn-primary",
															"callback": function() {
																 location.reload();
																 resetval();
															}
														}
													}
												});
											   
											   
								              }else{
								            	  

								            	  $('#success-msg').empty();	
												  $('#success-msg').append('<div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><p><strong><i class="ace-icon fa fa-check"></i></strong>Department saved successfully.</p></div>');
												  resetval();
								            	  addNote();
									              //popup('popUpAlertaddnote').show();
									             
								              }
										 }
									
									
									 
									
						}
					});
					
				}
			},
			invalidHandler: function (form) {
				
			}
		});
	}

function saveDepartment(isClose)
{
	 alert(isClose);
		
		$.validator.addMethod("alphaNumeric", function (value, element) {
		    return this.optional(element) || /^[ 0-9a-zA-Z]+$/.test(value);
		}, "Special character not allowed.");
		
		
		jQuery.validator.addMethod("buparty", function (value, element) {
			
	    	return response = ( $('#bizUnitId').val() == '0' ) ? false: true ;
		 }, "Biz Unit is required ");
		
		jQuery.validator.addMethod("department", function (value, element) {
			
	    	return response = ( $('#departmentType').val() == '0' ) ? false: true ;
		 }, "Biz Unit is required ");
		
		
		
		
		var validator=$('#Adddepartment').validate({
			errorElement: 'div',
			errorClass: 'help-block',
			focusInvalid: false,
			ignore: "",
			 icon: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
			},
			rules: {
				bizUnitName: {
					required:true,
					buparty:true
					//alphanumeric: true
					
			},
			departmentType: {
				required:true,
				department:true
				//alphanumeric: true
				
		},
			departmentName:
			{
				required:true
				//,alphanumeric: true
				
		},
		departmentShortName:
		{
			required:true,
			alphanumeric: true
			
	}
		
			},

			messages: {
				bizUnitName: {
					required: "Please select biz unit."				
				},
				
				departmentType: {
					required: "Please select department."				
				},
				departmentName: {
					required: "Please enter department."				
				},
					departmentShortName: {
						required: "Please enter department short name."				
					},
				
			},


			highlight: function (e) {
				$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
			},

			success: function (e) {
				$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
				$(e).remove();
			},

			errorPlacement: function (error, element) {
				if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
					var controls = element.closest('div[class*="col-"]');
					if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
					else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
				}
				else if(element.is('.select2')) {
					error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
				}
				else if(element.is('.chosen-select')) {
					error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
				}
				else error.insertAfter(element.parent());
			},

			submitHandler: function (form) {
				
				if(validator.form())
				{
					
				}
			},
			invalidHandler: function (form) {
				
			}
		});
}

   
function addNote(){

$('#addnote').modal('show');	
$("#deletenote, #editnote").hide();	

} 

function deleteNote(){ 

$('#deletenote').modal('show');	
$("#addnote, #editnote").hide();	

} 
function editNote(){  
$('#editnote').modal('show');	
$("#addnote, #deletenote").hide();	  

}
function biz(){
$("#biz").show();	
$("#user, #role, #city").hide();	

}
function user(){
$("#user").show();	
$("#biz, #role, #city").hide();	

}
function role(){
$("#role").show();	
$("#biz, #user, #city").hide();		
}
	
function city(){
$("#city").show();	
$("#biz, #user, #role").hide();		
}

function biz1(){
$("#biz1").show();	
$("#user1, #role1, #city1").hide();	

}
function user1(){
$("#user1").show();	
$("#biz1, #role1, #city1").hide();	

}
function role1(){
$("#role1").show();	
$("#biz1, #user1, #city1").hide();		
}
	
function city1(){
$("#city1").show();	
$("#biz1, #user1, #role1").hide();		 
}  

function resetval()   
	{    
	  
	 	$('#bizUnitId').val(0);   
	  	$('#departmentType').val(0);  
	   	$('#departmentName').val(''); 
	   	$('#departmentShortName').val('');      
	   	
	} 
 
 
  
/* start code to delete added download items  */

 function deleteDepartment()   
       
   { 
 	  var slvals = [];
 	  $('input:checkbox[name=chkToDeletedepartmentId]:checked').each(function() {
 	  slvals.push($(this).val());
 	  })    
 	// alert('Selected Checkbox values are: ' + slvals);
 	
 	 document.getElementById("confirmdelete").value = slvals;  
	  if(slvals<=0)
		  {
		//  alert('Please select at least one Item !');  
		  bootbox.dialog({
				message: "<span class='bigger-110'>Please select at least one Item ! </span>",
				buttons: 			
				{
					"click" :
					{
						"label" : "OK!",
						"className" : "btn-sm btn-primary",
						"callback": function() {
							//Example.show("Primary button");
						}
					}
				}
			});
	     
			return;
		  
		  }
	  else{
		  deleteNote();
	  }
  
   };         
                  
                
	 function confirmDelete()
	{
		  var slvals= document.getElementById("confirmdelete").value;
		  var tempId;
//alert(slvals);
       $.ajax 
		 ({
	              
	      type: "GET",
	      url : $('#contextPath').val()+"/departmentlist/cascadeDeleteList.htm?Lists="+slvals, 
	      dataType: 'json', 
	      async : false, 
	      contentType: 'application/json',  
	       
	         success:function(result) 
	      { 
	        	 //alert("result  is::"+result); 
	        	 tempId = result;  
	        	 //alert(tempId.length);    
     		if(tempId.length>1)    
     		{  
         		alert("Department Already Used !"); 
         		location.reload(); 
         		return true;
         	 
     		}     
     		   
     		else 
     			    
     			{
     			 $.ajax({          
     				type : 'POST',   
     				url : $('#contextPath').val()+"/departmentlist/deleteList.htm?Lists="+slvals, 
     				
     			success : function(result) 
     		  {	     
     			//  alert('Deleted selected='+slvals);  
     			  	 // alert('Successfully Deleted Item !'); 
     			  	  bootbox.dialog({
     						message: "<span class='bigger-110'>Successfully Deleted Item ! </span>",
     						buttons: 			
     						{
     							"click" :
     							{
     								"label" : "OK!",
     								"className" : "btn-sm btn-primary",
     								"callback": function() {
     									//Example.show("Primary button");
     									  location.reload();  
     								}
     							}
     						}
     					});

     				// return;
     			     
     				
     			  		 	 		   
     		  } 
     		          
     		  });      
     			}
    	 } 
	      
	   });
		   
		 	 
	}
		 /* end code to delete added download items  */
		 
		   
function addBizUnit()
{
	
	$.ajax            
	 ({    
             
     type: "POST",
     url: $('#contextPath').val()+'/departmentlist/getBizunitSection.htm',  
     dataType: 'json', 
     contentType: 'application/json',     
        success:function(result)
     { 
       //result = JSON.parse(result);  
       //alert('result='+result);             
        	
     //  $(result).each(function(i, obj) {  
		$('#bizUnitId').empty();         
		$('#bizUnitId').append('<option value="0">--Select--</option>');
		//alert('hi');
       $(result).each(    
   		  
       function(i, obj) {
        var module = obj.lastname;
        var moduleid = obj.buId;      
       
        $('#bizUnitId').append('<option value="'+ moduleid+' ">'+module+'</option>');
      
       });     

    //});  
     }    
  
  }); 
	
}
		  
function addDepartmentType()
{
	
	$.ajax               
	 ({    
             
     type: "POST",
     url: $('#contextPath').val()+'/departmentlist/getDepartmentSection.htm',  
     dataType: 'json', 
     contentType: 'application/json',     
        success:function(result)  
     { 
       //result = JSON.parse(result);
       //alert('result='+result);             
         
     //  $(result).each(function(i, obj) { 
      	$('#departmentType').empty();         
    	$('#departmentType').append('<option value="0">--Select--</option>');
		
       $(result).each(   
   		  
       function(i, obj) {
    	   
    	   var module = obj.codevalue;  
    	   var moduleid = obj.codevalueId;
    	   
        $('#departmentType').append('<option value="'+ moduleid+'">'+ module + '</option>');
      
       });     

    //});  
     }
  
  });   
	
} 	 
 /* 
function doAdd(){  
	 		
	   var myLength = $("#departmentName").val().length;
			
	   var myLength1 = $("#departmentShortName").val().length;
	   
	   if(document.getElementById('bizUnitId').selectedIndex == 0)
		  { 
		  alert("Please Select Biz Unit !");  
		  return false;
		  }
		 else  
		 
			 if(document.getElementById('departmentType').selectedIndex == 0)
			  { 
			  alert("Please Select Department Type !");  
			  return false;
			  }
			 else 
			    
		  if(myLength>100)      
			 {  
			 alert('Department Name max length is 100.You can not enter more Character !');
			 }
		else if(myLength1>10)     
			 {    
			 alert('Department Short Name max length is 10.You can not enter more Character !');
			 }
		else if($('#departmentName').val()==""||$('#departmentName').val().trim()=="")
			{
			alert('Please Enter Department Name !');
			}
		else if($('#departmentShortName').val()==""||$('#departmentShortName').val().trim()=="")
			{
			alert('Please Enter Department Short Name !');    
			}
		else {    
		
		$.ajax({     
			type :'POST', 
			data:$('#Adddepartment').serialize(),  
			 
	url : $('#contextPath').val() +"/departmentlist/addDepartment.htm",
			 success : function(result) 
			 {  
				 if(result>0){
              		alert('Department Type Already Exists !');
              		 $('#common_popup_div,#shadow_div_web_app').remove(); 
              		resetval(); 
	                addNote().show();   
	                popup('popUpAlertaddnote').show();
                 
				 }   
				 else
				 {   
					//  alert('Record Added Successfully  !');  
					  bootbox.dialog({
							message: "<span class='bigger-110'>Record Added Successfully  ! </span>",
							buttons: 			
							{
								"click" :
								{
									"label" : "OK!",
									"className" : "btn-sm btn-primary",
									"callback": function() {
										//Example.show("Primary button");
										  location.reload();
									}
								}
							}
						});
				     
					
						//return;
					  $('#common_popup_div,#shadow_div_web_app').remove(); 
		              resetval(); 
		              addNote().show();   
		              popup('popUpAlertaddnote').show();
				 }
	 	 }
	             
		});   
}
}     
  
  
	function doExit(){      
		 
		var myLength = $("#departmentName").val().length;
			//  alert("lenght="+myLength);
		 var myLength1 = $("#departmentShortName").val().length;   
		 
		 if(document.getElementById('bizUnitId').selectedIndex == 0)
		  { 
		  alert("Please Select Biz Unit !");
		  return false;  
		  }   
		 else          
			    
		if(document.getElementById('departmentType').selectedIndex == 0)
			{ 
			 alert("Please Select Department Type !");
			 return false;
			}  
		else    
			   
		if(myLength>100)     
			 {  
			 alert('Department Name max length is 100.You can not enter more Character !');
			 }
		else if(myLength1>10)
			 {
			 alert('Department Short Name max length is 10.You can not enter more Character !');
			 }
		else if($('#departmentName').val()==""||$('#departmentName').val().trim()=="")
			{
			alert('Please Enter Department Name !');
			}
		else if($('#departmentShortName').val()==""||$('#departmentShortName').val().trim()=="")
			{
			alert('Please Enter Department Short Name !');     
			}
		else {
		
		$.ajax({     
			type :'POST',
			data:$('#Adddepartment').serialize(),  
			 
	url : $('#contextPath').val() +"/departmentlist/addDepartment.htm",
			 success : function(result) 
			 { 
				 if(result > 0){
					 alert('Department Type Already Exists !');   
					 $('#common_popup_div,#shadow_div_web_app').remove(); 
					 resetval();   
				 }
				 else 
					 {  
					// alert('Record Added Successfully  !');
					  bootbox.dialog({
							message: "<span class='bigger-110'>Record Added Successfully  ! </span>",
							buttons: 			
							{
								"click" :
								{
									"label" : "OK!",
									"className" : "btn-sm btn-primary",
									"callback": function() {
										//Example.show("Primary button");
										 location.reload(); 
									}
								}
							}
						});
				     
						//return;
					
					 }
	  }
	             
		});    
} 
}  */
 
	function updateDepartment(id,bizunit,departmentType,departmentName,departmentShortName,department_Type,codevalueid,departmentTypeID,department_SortName)
	  {  	
	         editNote();
		 	$('#departmentIdEdit').val(id);                  
			 
		    $('#departmentNameEdit').val(departmentShortName );                
		    $('#departmentShortNameEdit').val(department_SortName);        
	/* 	    $('#bizunitEdit').empty();                       
			$('#bizunitEdit').append('<option value="'+ bizunit+'">'+ departmentType + '</option>');
	 */		
			$('#bizunitEdit').empty();  
	 		editBizUnit(bizunit);
			
			/* $('#departmentTypeEdit').empty();            
			$('#departmentTypeEdit').append('<option value="'+ departmentTypeID+'">'+ department_Type + '</option>'); */   
			  $('#hdndepartmentTypeEdit').val(department_Type);
			 $('#departmentTypeEdit').val(departmentTypeID); 
			
			          
		      
	 }       
             function updateDep()
             {

         		jQuery.validator.addMethod("buparty", function (value, element) {
         	    	return response = ( $('#bizunitEdit').val() == '0' ) ? false: true ;
          		 }, "Biz Unit is required ");
         		jQuery.validator.addMethod("department", function (value, element) {
         	    	return response = ( $('#departmentTypeEdit').val() == '0' ) ? false: true ;
         	       }, "Please select depertment type.");
         		
         		
         		
         		$.validator.addMethod("alphaNumeric", function (value, element) {
         		    return this.optional(element) || /^[ a-zA-Z]+$/.test(value);
         		}, " Only letters allowed.");
         		
         		
         	 var validator=$('#updateform').validate({
         		 
         			errorElement: 'div',
         			errorClass: 'help-block',
         			focusInvalid: false,
         			ignore: "",
         			 icon: {
         			valid: 'glyphicon glyphicon-ok',
         			invalid: 'glyphicon glyphicon-remove',
         			validating: 'glyphicon glyphicon-refresh'
         			},
         			rules: {
         				
         			
         				bizunitEdit: {
         					required: true,
         					buparty:true
         				},
         				departmentTypeEdit:
         				{
         					required:true,
         					department:true
         					//,alphanumeric: true
         					
         			},
         			departmentNameEdit:{
         				required:true ,
         				alphaNumeric: true// */
         				
         		},
         				
         		departmentShortNameEdit:
         			{
         				required:true ,
         				alphaNumeric: true/* */
         				
         		}
         			},

         			messages: {
         			
         			},


         			highlight: function (e) {
         				$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
         			},

         			success: function (e) {
         				$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
         				$(e).remove();
         			},

         			errorPlacement: function (error, element) {
         				if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
         					var controls = element.closest('div[class*="col-"]');
         					if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
         					else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
         				}
         				else if(element.is('.select2')) {
         					error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
         				}
         				else if(element.is('.chosen-select')) {
         					error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
         				}
         				else error.insertAfter(element.parent());
         			},

         			submitHandler: function (form) {
         				
         				if(validator.form())
         				{
         					$.ajax({   
         				  		type :'POST',  
         				  		data:$('#updateform').serialize(),
         				        url : $('#contextPath').val() +"/departmentlist/departmentUpdate.htm",
         				       
         				  				success : function(result)    
         				  				{ 
         				  				//	alert('Update Successfully!');
         				  					 bootbox.dialog({
         											message: "<span class='bigger-110'>Updated Successfully! </span>",
         											buttons: 			
         											{
         												"click" :
         												{
         													"label" : "OK!",
         													"className" : "btn-sm btn-primary",
         													"callback": function() {
         														//Example.show("Primary button");
         														location.reload();  
         													}
         												}
         											}
         										});
         								     
         									//	return;
         				 					
         				  				}
         				  	           }); 
         					
         				}
         			},
         			invalidHandler: function (form) {
         				
         			}
         		});
            	 
             }
function doUpdate(){    
	     
	
	 var myLength = $("#departmentNameEdit").val().length;
		
	 var myLength1 = $("#departmentShortNameEdit").val().length; 
	 
	 var myDDbizunitEdit = $("#bizunitEdit").val();
	 var myDDdepartmentTypeEdit = $('#departmentTypeEdit').val();  
	
	 
	if(myLength>100)        
		 {     
		 alert('Department Name max length is 100.You can not enter more Character!');
		 }
	else if(myLength1>10)
		 {
		 alert('Department Short Name max length is 10.You can not enter more Character!');  
		 }
	else if($('#departmentNameEdit').val()==""||$('#departmentNameEdit').val().trim()=="")
		{
		alert('Please Enter Department Name !');
		}
	else if($('#departmentShortNameEdit').val()==""||$('#departmentShortNameEdit').val().trim()=="")
		{
		alert('Please Enter Department Short Name !');     
		}      
	else {  
	
		 //alert('in update');            
			$.ajax({   
			  		type :'POST',  
			  		data:$('#updateform').serialize(),
			        url : $('#contextPath').val() +"/departmentlist/departmentUpdate.htm",
			       
			  				success : function(result)    
			  				{ 
			  				//	alert('Update Successfully!');
			  					 bootbox.dialog({
										message: "<span class='bigger-110'>Update Successfully! </span>",
										buttons: 			
										{
											"click" :
											{
												"label" : "OK!",
												"className" : "btn-sm btn-primary",
												"callback": function() {
													//Example.show("Primary button");
													location.reload();  
												}
											}
										}
									});
							     
								//	return;
			 					
			  				}
			  	           });     
}
}  
 
   function editBizUnit(bizunit)          
  {
	 //  alert("bizunit"+bizunitEdit);
	   $('#bizunitEdit').empty();       
	 $.ajax                       
  	 ({    
                   
       type: "POST",
       url: $('#contextPath').val()+'/departmentlist/getBizunitSection.htm',  
       dataType: 'json', 
       contentType: 'application/json',     
          success:function(result)
       { 
                
         $(result).each(   
     		  
         function(i, obj) {
          var module = obj.lastname;  
          var moduleid = obj.buId;     
          
          if(bizunit == moduleid){
               $('#bizunitEdit').append('<option value="'+ moduleid+'" selected="selected">'+module+'</option>');
        
          } 
          else{   
                $('#bizunitEdit').append('<option value="'+ moduleid+'" >'+module+'</option>');
          }
             
         });    
         

      //});   
       }    
    
    }); 
  	
  }  

  		   
 function editDepartmentType()
{
	 
	$.ajax           
	 ({            
               
     type: "POST",
     url: $('#contextPath').val()+'/departmentlist/getDepartmentSection.htm',  
     dataType: 'json', 
     contentType: 'application/json',       
     success:function(result)   
     {            
     // $(result).each(function(i, obj) {
     //$('#departmentTypeEdit').empty();
     //$('#departmentTypeEdit').append('<option value="0">--Select--</option>');
    
     $(result).each(  
       function(i, obj) {
        var module = obj.codevalue;        
        var moduleid = obj.codevalueId;                              
        
        $('#departmentTypeEdit').append('<option value="'+ moduleid+'">'+ module + '</option>');

       });      

    //});    
     }            
      
  });    
}   
     
 
 $('#departmentName').blur(function(){
	    if ($('#departmentName').val().match(/[^a-zA-Z0-9. ]/g)) {
	           this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
	       }
	  });
 
 $('#departmentShortName').blur(function(){
	    if ($('#departmentShortName').val().match(/[^a-zA-Z0-9. ]/g)) {
	           this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
	       }
	  });
     
 $('#departmentName').blur(function(){
	    if ($('#departmentName').val().match(/[^a-zA-Z0-9. ]/g)) {
	           this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
	       }
	  });
 
 $('#departmentShortName').blur(function(){
	    if ($('#departmentShortName').val().match(/[^a-zA-Z0-9. ]/g)) {
	           this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
	       }
	  });
    
 
 $('#departmentNameEdit').blur(function(){
	    if ($('#departmentNameEdit').val().match(/[^a-zA-Z0-9. ]/g)) {
	           this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
	       }
	  });

$('#departmentShortNameEdit').blur(function(){
	    if ($('#departmentShortNameEdit').val().match(/[^a-zA-Z0-9. ]/g)) {
	           this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
	       } 
	  });
  
$('#departmentNameEdit').blur(function(){
	    if ($('#departmentNameEdit').val().match(/[^a-zA-Z0-9. ]/g)) {
	           this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
	       }
	  });

$('#departmentShortNameEdit').blur(function(){
	    if ($('#departmentShortNameEdit').val().match(/[^a-zA-Z0-9. ]/g)) {
	           this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
	       }
	  });
  
</script>

<script type="text/javascript">
			var grid_data='${departmentList}';
			index=JSON.parse(grid_data);
			
					var subgrid_data = 
			[
			 {id:"1", name:"sub grid item 1", qty: 11},
			 {id:"2", name:"sub grid item 2", qty: 3},
			 {id:"3", name:"sub grid item 3", qty: 12},
			 {id:"4", name:"sub grid item 4", qty: 5},
			 {id:"5", name:"sub grid item 5", qty: 2},
			 {id:"6", name:"sub grid item 6", qty: 9},
			 {id:"7", name:"sub grid item 7", qty: 3},
			 {id:"8", name:"sub grid item 8", qty: 8},
			 {id:"9", name:"sub grid item 9", qty: 3},
			 {id:"10", name:"sub grid item 10", qty: 5},
			 {id:"11", name:"sub grid item 11", qty: 9},
			 {id:"12", name:"sub grid item 12", qty: 8}
			];
			
			jQuery(function($) {
				var grid_selector = "#grid-table";
				var pager_selector = "#grid-pager";
				
				//resize to fit page size
				$(window).on('resize.jqGrid', function () {
					$(grid_selector).jqGrid( 'setGridWidth', $(".page-content").width() );
			    })
				//resize on sidebar collapse/expand
				var parent_column = $(grid_selector).closest('[class*="col-"]');
				$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
					if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
						//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
						setTimeout(function() {
							$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
						}, 0);
					}
			    })
			jQuery(grid_selector).jqGrid({
					//direction: "rtl",
			
					//subgrid options
					subGrid : false,
					//subGridModel: [{ name : ['No','Item Name','Qty'], width : [55,200,80] }],
					//datatype: "xml",
					subGridOptions : {
						//plusicon : "ace-icon fa fa-plus center bigger-110 blue",
						minusicon  : "ace-icon fa fa-minus center bigger-110 blue",
						openicon : "ace-icon fa fa-chevron-right center orange"
					},
					//for this example we are using local data
					subGridRowExpanded: function (subgridDivId, rowId) {
						var subgridTableId = subgridDivId + "_t";
						$("#" + subgridDivId).html("<table id='" + subgridTableId + "'></table>");
						$("#" + subgridTableId).jqGrid({
							datatype: 'local',
							data: subgrid_data,
							colNames: ['No','Item Name','Qty'],
							colModel: [
								{ name: 'id', width: 50 },
								{ name: 'name', width: 150 },
								{ name: 'qty', width: 50 }
							]
						});
					},
					
			
			
					data: index,
					datatype: "local",
					height: 400,
					//colNames:[' ', 'ID','Last Sales','Name', 'Stock', 'Ship via','Notes'],
					colNames:[' ',' ','Biz Unit','Department Type','Department Name','Display Short Name','Updated By','Updated On'],
					colModel:[
					{name : 'myac',index :'',width : 50, fixed : true, sortable : false, resize : false,
					              formatter:function(cellvalue, options,rowObject) {
					                  return '<a href="#" onclick="updateDepartment('+rowObject.departmentId+',\''+rowObject.buId+'\',\''+rowObject.bizUnit+'\',\''+rowObject.department_Type+'\',\''+rowObject.department_Name+'\',\''+rowObject.department_Type+'\',\''+rowObject.codevalueId+'\',\''+rowObject.departmentTypeID+'\',\''+rowObject.department_SortName+'\');editDepartmentType();"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';}},
						
					{name:'chkToDeletedepartmentId',width : 50,sortable:false,formatter:function(cellvalue, options,rowObject) {
							
							return '<input role="checkbox" type="checkbox"  class="cbox" id="chkToDeletedepartmentId" value="'+rowObject.departmentId+'" name="chkToDeletedepartmentId">';
					}}, 
				
						{name:'bizUnit',index:'bizUnit'},
						{name:'department_Type',index:'department_Type'}, 
						{name:'department_Name',index:'department_Name'},
						{name:'department_SortName',index:'department_SortName'},
						{name:'updatedBy',index:'updatedBy'},
						{name:'updatedOn',index:'updatedOn'},
						
					], 
			
					viewrecords : true,
					rowNum:10,
					rowList:[10,20,50,100,1000],
					pager : pager_selector,
					altRows: true,
					//toppager: true,
					
					//multiselect: true,
					//multikey: "ctrlKey",
			        //multiboxonly: true,
			
					loadComplete : function() {
						var table = this;
						setTimeout(function(){
							styleCheckbox(table);
							if($('#selectAll').attr('id')==undefined)
							$('#jqgh_grid-table_checkbox').before('<br/>');
							updateActionIcons(table);
							updatePagerIcons(table);
							enableTooltips(table);
							$('#selectAll').click(function(event) {  //on click 
						        if(this.checked) { // check select status
						            $('.cbox').each(function(i,obj) { //loop through each checkbox
						                this.checked = true;  //select all checkboxes with class   "checkbox1"    
									$(obj).attr('checked','checked');
						            });
						        }else{
						            $('.cbox').each(function(i,obj) { //loop through each checkbox
						                this.checked = false; //deselect all checkboxes with class "checkbox1"
						            	$(obj).removeAttr('checked');
						            });         
						        }
						        $('#k').checked = true;
						    });
							
						}, 0);
						
					},
			
			
					editurl: "/dummy.html",//nothing is saved
					//caption: "jqGrid with inline editing"
			
					//autowidth: true,
					  //width:'100%',
			
					/**
					,
					grouping:true, 
					groupingView : { 
						 groupField : ['name'],
						 groupDataSorted : true,
						 plusicon : 'fa fa-chevron-down bigger-110',
						 minusicon : 'fa fa-chevron-up bigger-110'
					},
					caption: "Grouping"
					*/
			
				});
				$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
				
				
			
				//enable search/filter toolbar
				//jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
				//jQuery(grid_selector).filterToolbar({});
			
			
				//switch element when editing inline
				function aceSwitch( cellvalue, options, cell ) {
					setTimeout(function(){
						$(cell) .find('input[type=checkbox]')
							.addClass('ace ace-switch ace-switch-5')
							.after('<span class="lbl"></span>');
					}, 0);
				}
				//enable datepicker
				function pickDate( cellvalue, options, cell ) {
					setTimeout(function(){
						$(cell) .find('input[type=text]')
								.datepicker({format:'yyyy-mm-dd' , autoclose:true}); 
					}, 0);
				}
			
			
				//navButtons
				jQuery(grid_selector).jqGrid('navGrid',pager_selector,
					{ 	//navbar options
						edit: false,
						editicon : 'ace-icon fa fa-pencil blue',
						add: false,
						addicon : 'ace-icon fa fa-plus-circle purple',
						del: false,
						delicon : 'ace-icon fa fa-trash-o red',
						search: true,
						searchicon : 'ace-icon fa fa-search orange',
						refresh: false,
						refreshicon : 'ace-icon fa fa-refresh green',
						view: false,
						viewicon : 'ace-icon fa fa-search-plus grey',
					},
					{
						//edit record form
						//closeAfterEdit: true,
						//width: 700,
						recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
						//new record form
						//width: 700,
						closeAfterAdd: true,
						recreateForm: true,
						viewPagerButtons: false,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
							.wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
						//delete record form
						recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							if(form.data('styled')) return false;
							
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_delete_form(form);
							
							form.data('styled', true);
						},
						onClick : function(e) {
							//alert(1);
						}
					},
					{
						//search form
						recreateForm: true,
						afterShowSearch: function(e){
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
							style_search_form(form);
						},
						afterRedraw: function(){
							style_search_filters($(this));
						}
						,
						multipleSearch: true,
						/**
						multipleGroup:true,
						showQuery: true
						*/
					},
					{
						//view record form
						recreateForm: true,
						beforeShowForm: function(e){
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
						}
					}
				)
			
			
				
				function style_edit_form(form) {
					//enable datepicker on "sdate" field and switches for "stock" field
					form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
					
					form.find('input[name=stock]').addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
							   //don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
							  //.addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');
			
							
					//update buttons classes
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
					buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
					
					buttons = form.next().find('.navButton a');
					buttons.find('.ui-icon').hide();
					buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
					buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');		
				}
			
				function style_delete_form(form) {
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
					buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
				}
				
				function style_search_filters(form) {
					form.find('.delete-rule').val('X');
					form.find('.add-rule').addClass('btn btn-xs btn-primary');
					form.find('.add-group').addClass('btn btn-xs btn-success');
					form.find('.delete-group').addClass('btn btn-xs btn-danger');
				}
				function style_search_form(form) {
					var dialog = form.closest('.ui-jqdialog');
					var buttons = dialog.find('.EditTable')
					buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
					buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
					buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
				}
				
				function beforeDeleteCallback(e) {
					var form = $(e[0]);
					if(form.data('styled')) return false;
					
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_delete_form(form);
					
					form.data('styled', true);
				}
				
				function beforeEditCallback(e) {
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_edit_form(form);
				}
			
			
			
				//it causes some flicker when reloading or navigating grid
				//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
				//or go back to default browser checkbox styles for the grid
				function styleCheckbox(table) {
				/**
					$(table).find('input:checkbox').addClass('ace')
					.wrap('<label />')
					.after('<span class="lbl align-top" />')
			
			
					$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
					.find('input.cbox[type=checkbox]').addClass('ace')
					.wrap('<label />').after('<span class="lbl align-top" />');
				*/
				}
				
			
				//unlike navButtons icons, action icons in rows seem to be hard-coded
				//you can change them like this in here if you want
				function updateActionIcons(table) {
					/**
					var replacement = 
					{
						'ui-ace-icon fa fa-pencil' : 'ace-icon fa fa-pencil blue',
						'ui-ace-icon fa fa-trash-o' : 'ace-icon fa fa-trash-o red',
						'ui-icon-disk' : 'ace-icon fa fa-check green',
						'ui-icon-cancel' : 'ace-icon fa fa-times red'
					};
					$(table).find('.ui-pg-div span.ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
					*/
				}
				
				//replace icons with FontAwesome icons like above
				function updatePagerIcons(table) {
					var replacement = 
					{
						'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
						'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
						'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
						'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
					};
					$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
				}
			
				function enableTooltips(table) {
					$('.navtable .ui-pg-button').tooltip({container:'body'});
					$(table).find('.ui-pg-div').tooltip({container:'body'});
				}
			
				//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');
			
				$(document).one('ajaxloadstart.page', function(e) {
					$(grid_selector).jqGrid('GridUnload');
					$('.ui-jqdialog').remove();
				});
			});
		</script>
</body>
</html>