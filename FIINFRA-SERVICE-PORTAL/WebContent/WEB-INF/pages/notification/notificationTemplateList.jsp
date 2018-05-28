<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html> 
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">  
<meta name="description" content="">
<meta name="author" content="">  
<title>Notification Template List</title> 

 <%-- <script type="text/javascript"    src="<%=request.getContextPath()%>/js/nicEdit.js"></script>   --%>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>

<link href="<%=request.getContextPath()%>/css/style_serviceportal.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />


<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">

</head>    
<body>    

<jsp:include page="../common/header.jsp" /> 

<input id="contextPath" type="hidden" name="contextPath" 
		value="<%=request.getContextPath()%>" />      
		<%-- <input id="status" type="hidden" name="status"	value="<%=hes.getAttribute("status")%>" /> --%>
	<!--css popup window start 1-->  
	<div style="display: none;" id="blanket"></div>
	<div style="display: none; width: 450px; height: 380px; top: 100px"
		id="popUpDiv">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpDiv')" href="#"><img alt=""
				src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
		</div> 

		<div id="popupwrapper_contactform">  
 
			<div class="heading_contactform">  
				<h3>Log Trouble Ticket</h3>
			</div>
			<div id="poptable_contactform">

				<div class="full">
					<input type="text" class="form-control" placeholder="Subject">
				</div>
				<div class="full">
					<textarea class="form-control" rows="3" placeholder="Your Question"
						style="height: 100px;"></textarea>
				</div>
				<div class="full">
					<input type="text" class="form-control" placeholder="Attach File">

				</div> 
			</div>
			<div class="topbuttonholder">
				<form>
					<input class="dbtn" value="Send Email" id="loginButton"
						type="button"> <input class="dbtn" value="Cancel"
						onClick="resetval();location.reload();" id="loginButton" type="button">
				</form>
			</div> 

		</div>
	</div>
	<!--css popup window 1 close-->
	<!--css popup window start 2-->
	<!--ADD popup Starts   --> 
	
	<div style="display: none;" id="blanket"></div> 
		  
		
		  
	
	<div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog">   
    <div class="modal-content"> 
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="location.reload();"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add New Notify Template</h4> 
      </div> 
      <div id="success-msg"></div> 
      <div class="modal-body">  
      <form id="addForm" method="post" 
		action="<%=request.getContextPath()%>/notifytemplate/addNotifyTemplate.htm"
		enctype="multipart/form-data">  
        <input type="hidden" id="hdnAddBodytext" name="hdnAddBodytext" /> 
		<!-- <div id="popupwrapper_contactform">  --> 
  		<input type="hidden" name="confirmdelete" id="confirmdelete" > 
  		<input type="hidden" id="hiddenPartyId" name="hiddenPartyIdName"
			value="" /> <input type="hidden" id="hdnDownloadSectionId"
			name="hdnDownloadSectionName" value="" />
			 <input type="hidden"
			id="hiddenIsToClose" name="hiddenIsToClose"
			value="<%=request.getParameter("isToClose")%>" />
			 <input
			type="hidden" id="hdnTo" name="hdnTo" /> 
			<input type="hidden"
			id="hdnCC" name="hdnCC" /> <input type="hidden" id="hdnBCC"
			name="hdnBCC" /> <input type="hidden" id="hdnFrom" name="hdnFrom" />
			
		<!-- 	<input type="hidden" id="Bodytexthidden" name="Bodytext">
			<input type="hidden" id="editBodytexthidden" > -->
		
	
  		        <div class="row">   
				              <div class="form-group col-md-12 clearfix">
				                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Biz Unit :<span class="red">*</span></label>
				                <div class="col-sm-9">
				                 	<select name="bizUnit" class="form-control" id="bizUnit"
									style="float: left; width: 300px;" onload="addBizUnit()">
									</select>
				                 </div> 
				              </div>   
		           	</div>
           			    
           			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">System :<span class="red">*</span></label>
		                <div class="col-sm-9">
		                 	 <select name="system"
							class="form-control" id="system"
							style="float: left; width: 300px;" onload="addSystem()">


						</select>
		                 </div> 
		              </div>   
           			</div>
           			
           			   
           			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Recipient :<span class="red">*</span>  </label>
		                <div class="col-sm-9">
		                 	 <select
							name="recepient" class="form-control" id="recepient"
							style="float: left; width: 300px;" onload="addRecepient()">


						</select> 
		                 </div> 
		              </div>  
           			</div>   
           			 
           				<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Channel :<span class="red">*</span>  </label>
		                <div class="col-sm-9">
		                 	<select name="channel"
							class="form-control" id="channel"
							style="float: left; width: 300px;" onload="addChannel()"
							onchange="makeEnableDisable();addToPhone();">
 							</select></div> 
		              </div>   
           			</div>  
           			
           			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Event :<span class="red">*</span>  </label>
		                <div class="clearfix">
		                <div class="col-sm-9">
		                
		                 	 <select name="event"
							class="form-control" id="event"
							style="float: left; width: 300px;" onload="addEvent()"></select>
							</div>
		                 </div> 
		              </div>  
           			</div> 
           			
           			
           			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Template Name : <span class="red">*</span> </label>
		                <div class="col-sm-9">
		                 	 <input type="text"
							class="form-control" name="templatename" id="templatename">
		                 </div> 
		              </div>  
           			</div> 
           			
           				<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Template Description  </label>
		                <div class="col-sm-9">
		                 	<textarea 
								class="form-control" rows="5" name="desc" id="desc"></textarea>
		                 </div> 
		              </div>  
           			</div> 
           			
           			<!--Email -->
					<div id="Email1">
						
					<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">From Email Name:<span class="red">*</span> </label>
		                <div class="col-sm-9">
		                 	<input type="text"
								id="addquickSearchName" name="searchStringEmailName"
								onKeyUp="addquickSearchEmailName(this);"
								placeholder="Quick Search" style="width: 300px;"
								onchange="autovalid(1)">
								<input type="hidden"
								id="addquickSearchHiddenName" name="codeValueID"
								placeholder="Quick Search" style="width: 300px;">
		                 </div> 
		              </div>  
           			</div>
					
					<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">From Email :<span class="red">*</span>  </label>
		                <div class="col-sm-9">
		                 	<input type="text"
								id="addquickSearch" name="searchString"
								onKeyUp="addquickSearchPartner(this);"
								placeholder="Quick Search" style="width: 300px;"
								onchange="autovalid(2)">
								<input type="hidden"
								id="addquickSearchHidden" name="codeValueID"
								placeholder="Quick Search" style="width: 300px;">
		                 </div> 
		              </div>  
           			</div>
           			
           			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Reply To :<span class="red">*</span>  </label>
		                <div class="col-sm-9">
		                 	<input type="text"
								id="addquickSearch1" name="searchString1"
								onKeyUp="addquickSearchPartner1(this);"
								placeholder="Quick Search" style="width: 300px;"
								onchange="autovalid(3)"> <input type="hidden"
								id="addquickSearchHidden1" name="codeValueID" 
								placeholder="Quick Search" style="width: 300px;">
		                 </div>  
		              </div>   
           			</div>	
           			</div>
						<!--EMAIL 1 END --> 
						
					<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">To : <span class="red">*</span>  </label>
		                <div class="col-sm-9">
		                 	<input type="text"
							id="addquickSearchTo" name="searchStringTo"
							onKeyUp="addquickSearchToPhone(this);" placeholder="Quick Search"
							style="width: 300px;" onchange="autovalid(4)"> <input
							type="hidden" id="addquickSearchHiddenTo" name="codeValueID"
							placeholder="Quick Search" style="width: 300px;">
		                 </div>  
		              </div>   
           			</div>	   
						
				<!--EMAIL 2 Start   --> 
				<div id="Email2">
						  
					<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">CC  : </label>
		                <div class="col-sm-9">
		                 	<input type="text"
								id="addquickSearch2" name="searchString2"
								onKeyUp="addquickSearchPartner2(this);"
								placeholder="Quick Search" style="width: 300px;"
								onchange="autovalid(5)"> <input type="hidden"
								id="addquickSearchHidden2" name="codeValueID"
								placeholder="Quick Search" style="width: 300px;">
		                 </div>  
		              </div>   
           			</div>	
           			   
           			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">BCC :  </label>
		                <div class="col-sm-9">
		                 	<input type="text"
								id="addquickSearch3" name="searchString3"
								onKeyUp="addquickSearchPartner3(this);"
								placeholder="Quick Search" style="width: 300px;"
								onchange="autovalid(6)"><input type="hidden"
								id="addquickSearchHidden3" name="codeValueID"
								placeholder="Quick Search" style="width: 300px;">
		                 </div>  
		              </div>      
           			</div>  
           			
           			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Subject :  </label>
		                <div class="col-sm-9">
		                 <input type="text"
								name="subject" class="form-control" id="subject">
		                 </div>  
		              </div>      
           			</div>  
				</div>	
				
				<div id="txtBodyDiv">
				<div class="row">
					<div class="form-group col-md-12 clearfix">
						<label class="col-sm-3 control-label no-padding-right" for="bodytxt">Body :<span class="red">*</span></label>

						<div class=" col-sm-9">
							<!-- <div class="clearfix"> -->
							<div class="wysiwyg-editor" id="bodytxt"></div>
						<!--  <input type="hidden" id="bodyhiddeneditor" name="bodyhiddeneditor">	  -->
							
							<!-- </div> -->
						</div>
					</div>
					</div>
			     </div>
				
				 
			<!-- 	<div id="txtBodyDiv">
				<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Body <span class="red">*</span> </label>
		                <div class="col-sm-9">
		                 <span class="searchpadding padding_top "
								style="float: left; width: 400px;" id="btext"> <textarea
									name="bodytxt" id="bodytxt"
									style="width: 400px; height: 1200px" rows="6" class="editor">        
							</textarea>
						</span> <div class="wysiwyg-editor" id="bodytxt" ></div>
		                 </div>   
		              </div>        
           			</div> 
           			
           			
           			<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="Question Text">Question Text<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix"></div>
							<div class="wysiwyg-editor" id="editque" ></div>
						</div>
					</div>
           			
           			
				</div> -->
					<div class="clearfix"></div>
					<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Signature :<span
							class="red">*</span> </label>
		                <div class="col-sm-9">
		                 <select
							name="signature" class="form-control" id="signature"
							style="float: left; width: 300px;" onload="addSignature()">

						</select>
		                 </div>  
		              </div>      
           			</div> 
  					<div id="IncludeText">
  					<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Include Text : <span
							class="red">*</span> </label>
		                <div class="col-sm-9">
		                 	<input type="checkbox" id="chkDisc" name="chkDisc"
								onclick="setDisc()">&nbsp;Add Disclaimer <!-- <input id="chkDnd" name="chkDnd" value="1"  type="checkbox"> -->
								<input type="checkbox" id="chkDnd" name="chkDnd"
								onclick="setDnd()">&nbsp;Add DND
		                 </div>  
		              </div>      
           			</div> 
						
					<!-- --------------upload file1--------------------- -->
					
					<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Attachment(s) </label>
		                <div class="col-sm-9">
		                 	<span
								class="searchpadding padding_top"
								style="float: left; width: 300px;"> <input type="file"
								id="fileid" name="file"
								style="height: 0px; width: 0px; overflow: hidden;" /> <input
								type="text" id="ftxtid" name="ftxtid" class="form-control"
								readonly="readonly"> <span class="user" id="ftype"></span></span>
							<span style="float: left; margin-top: 7px; width: 100px;">
								<input class="dbtn" value="Browse" id="fbtnid" type="button"
								onclick="getFile();">
							</span>
		                 </div>  
		              </div>      
           			</div> 
  
							<!-- ---------------upload file------------------- -->
							
							<!-- --------------upload file1--------------------- -->
						<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Attachment(s) </label>
		                <div class="col-sm-9">
		                 	<span
								class="searchpadding padding_top"
								style="float: left; width: 300px;"> <input type="file"
								id="fileid1" name="file1"
								style="height: 0px; width: 0px; overflow: hidden;" /> <input
								type="text" id="ftxtid1" name="ftxtid1" class="form-control"
								readonly="readonly"> <span class="user" id="ftype1"></span></span>
							<span style="float: left; margin-top: 7px; width: 100px;">
								<input class="dbtn" value="Browse" id="fbtnid1" type="button"
								onclick="getFile1();">
							</span>
		                 </div>   
		              </div>      
           			</div> 
							
							<!-- ---------------upload file------------------- -->
							
							<!-- --------------upload file2--------------------- -->
						<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Attachment(s) </label>
		                <div class="col-sm-9">
		                 	<span
								class="searchpadding padding_top"
								style="float: left; width: 300px;"> <input type="file"
								id="fileid2" name="file2"
								style="height: 0px; width: 0px; overflow: hidden;" /> <input
								type="text" id="ftxtid2" name="ftxtid2" class="form-control"
								readonly="readonly"> <span class="user" id="ftype2"></span></span>
							<span style="float: left; margin-top: 7px; width: 100px;">
								<input class="dbtn" value="Browse" id="fbtnid2" type="button"
								onclick="getFile2();">
							</span>
							</span>
		                 </div>   
		              </div>      
           			</div> 
           			
           			 
					</div> 		 
							<!-- ---------------upload file------------------- -->
							
							<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId"> </label>
		                <div class="col-sm-9">
		                <input type="checkbox" id="chkTemp" name="chkTemp"
							onclick="setActive()">&nbsp;Active Template<span
							class="red">*</span>
		                 </div>  
		              </div>      
           			</div>   
							
							</form> 
						</div>

						  
        <!--  </div>    -->
  
       
   <!--  </div>   --> 
	</div>     
	  
	
	<div class="modal-footer">  
	<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Save" onclick="submitAdd(0);">	Save &amp; New</button>
	<button data-bb-handler="close" type="button" class="btn btn-primary btn-sm" id="Save" onclick="submitAdd(1);"  >Save &amp; Close</button>
	<button  class="btn btn-sm btn-danger" onClick="location.reload();"><i class='ace-icon fa fa-trash'></i>Cancel</button>
	</div>  
	      
     </div> 
       
     </div> 
	
	
	 
	<!--ADD popup Ends   -->
	<!-- delete-->
	<div class="modal fade" id="deletenote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog">
    <div class="modal-content"> 
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" ><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Message</h4> 
      </div> 
      <div class="modal-body">  
          
         	Do you want to delete this selected records? Please confirm. 
        	<form>     
            <button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="confirmDelete();">	Yes</button>
			<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> No</button>
	 		     
           	</form>	     
 	</div>      
         
     </div></div> </div>
 
	<!-- delete-->
	<!-- Editt-->
	
	<div class="modal fade" id="editnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog">
    <div class="modal-content">  
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="location.reload();"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Edit Notification Template</h4> 
      </div>   
      <div class="modal-body">       
		  
		<form id="myFormEdit" method="post"
		action="<%=request.getContextPath()%>/notifytemplate/editNotifyTemplate.htm"
		enctype="multipart/form-data">
		
		<input type="hidden" id="hdnBodytext" name="hdnBodytext">     
		<!-- <input type="hidden" id="hdneditBodytext" name="hdnBodytext" />  -->
		
		<input type="hidden" name="eventIdEdit" id="eventIdEdit"> 
		<input type="hidden" id="hdndocumentId" name="hdndocumentIdNm"> 
		<input type="hidden" id="hdnsizekbId" name="hdnsizekbNm"> 
		<input type="hidden" id="hiddenEditIsToClose" name="hiddenEditIsToClose" value="<%=request.getAttribute("hiddenEditIsToClosee")%>" /> 
		<input type="hidden" id="hdneditTo" name="hdneditTo"> 
		<input type="hidden" id="hdneditCc" name="hdneditCc"> 
		<input type="hidden" id="hdneditBcc" name="hdneditBcc"> 
		<input type="hidden" id="hdneditFrmEmail" name="hdneditFrmEmail"> 
		
		  			
		  			<div class="row">   
				              <div class="form-group col-md-12 clearfix">
				                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Biz Unit :<span class="red">*</span></label>
				                <div class="col-sm-9">
				                 	<select name="editBizUnit" class="form-control" id="editBizUnit"
										style="float: left; width: 300px;">
									</select>
				                 </div> 
				              </div>   
		           	</div>
			
					<div class="row">   
				              <div class="form-group col-md-12 clearfix">
				                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">System :<span class="red">*</span></label>
				                <div class="col-sm-9">
				                 	<select name="editSystem" class="form-control" id="editSystem"
										style="float: left; width: 300px;">
									</select>
				                 </div> 
				              </div>    
		           	</div>
				
					<div class="row">   
				              <div class="form-group col-md-12 clearfix">
				                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Recipient :<span class="red">*</span></label>
				                <div class="col-sm-9">
				                  <select name="editRecepient" class="form-control" id="editRecepient"
										style="float: left; width: 300px;">
									</select>
				                 </div> 
				              </div>    
		           	</div>
					
					<div class="row">   
				              <div class="form-group col-md-12 clearfix">
				                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Channel :<span class="red">*</span></label>
				                <div class="col-sm-9">
				                  <select
						name="editChannel" class="form-control" id="editChannel"
						style="float: left; width: 300px; pointer-events: none; cursor: default;">
									</select> 
				                 </div> 
				              </div>   
		           	</div>
					
					<div class="row">   
				              <div class="form-group col-md-12 clearfix">
				                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Event : <span class="red">*</span></label>
				                <div class="col-sm-9">
				                <div class="clearfix">
				                  <select
						name="editEvent" class="form-control" id="editEvent"
						style="float: left; width: 300px;">
									</select> 
									</div>
				                 </div> 
				              </div>   
		           	</div>
					
					<div class="row">   
				              <div class="form-group col-md-12 clearfix">
				                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Template Name : <span class="red">*</span></label>
				                <div class="col-sm-9">
				                  <input type="text"
						class="form-control" name="editName" id="editName">
								
				                 </div> 
				              </div>   
		           	</div>
					
					<div class="row">   
				              <div class="form-group col-md-12 clearfix">
				                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Template Description</label>
				                <div class="col-sm-9">
				                  <input type="text"
						class="form-control" name="editName" id="editName"><textarea
							class="form-control" rows="5" name="editDesc" id="editDesc"></textarea>
								
				                 </div>  
				              </div>   
		           	</div>
					
					

					<div id="editEmail1"><!-- edit email div starts -->
					
					
						<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">From Email Name :<span class="red">*</span> </label>
		                <div class="col-sm-9">
		                 	 <input type="text"
							id="addquickSearcheditFrmEmailName" name="editFrmEmailNm"
							onKeyUp="addquickSearcheditFrmEmailNm(this);"
							style="width: 300px;" onchange="autovalid(1)"> <input
							type="hidden" id="addquickSearchHiddeneditFrmEmailName"
							name="codeValueID" style="width: 300px;">
		                 </div> 
		              </div>  
           			</div>
					
					
						<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">From Email :<span class="red">*</span>  </label>
		                <div class="col-sm-9">
		                 	 <input type="text"
							id="addquickSearcheditFromEmail" name="editFrmEmail"
							onKeyUp="addquickSearcheditFrmEmail(this);" style="width: 300px;"
							onchange="autovalid(2)"> <input type="hidden"
							id="addquickSearchHiddeneditFromEmail" name="codeValueID"
							style="width: 300px;">
		                 </div> 
		              </div>  
           			</div>

						<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Reply To :<span class="red">*</span>  </label>
		                <div class="col-sm-9">
		                 	<input type="text"
							id="addquickSearcheditRplTo" name="editReplyTo"
							onKeyUp="addquickSearcheditReplyTo(this);" style="width: 300px;"
							onchange="autovalid(3)"> <input type="hidden"
							id="addquickSearchHiddeneditRplTo" name="codeValueID"
							style="width: 300px;">
		                 </div>  
		              </div>   
           			</div>	
           			
           			
						
					</div> <!-- edit email div ends -->
					
					<!--EMAIL 1 END -->
					<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">To : <span class="red">*</span>  </label>
		                <div class="col-sm-9">
		                 <input type="text"
						id="addquickSearcheditTo" name="editTo"
						onKeyUp="addquickSearcheditTo1(this);" style="width: 300px;"
						onchange="autovalid(4)"> <input type="hidden"
						id="addquickSearchHiddeneditTo" name="codeValueID"
						style="width: 300px;">
		                 </div>  
		              </div>   
           			</div>	   
					  
					
					<!--EMAIL 2 Start -->
					<div id="editEmail2">   <!-- edit email div starts -->
						
						<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">CC :  </label>
		                <div class="col-sm-9">
		                 	<input type="text"
							id="addquickSearcheditCc" name="editCc"
							onKeyUp="addquickSearcheditCc1(this);" style="width: 300px;"
							onchange="autovalid(5)"> <input type="hidden"
							id="addquickSearchHiddeneditCc" name="codeValueID"
							style="width: 300px;">
		                 </div>  
		              </div>   
           			</div>	
						
						<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">BCC :  </label>
		                <div class="col-sm-9">
		                 	<input type="text"
							id="addquickSearcheditBcc" name="editBcc" 
							onKeyUp="addquickSearcheditBcc1(this);" style="width: 300px;"
							onchange="autovalid(6)"> <input type="hidden"
							id="addquickSearchHiddeneditBcc" name="codeValueID"
							style="width: 300px;">
		                 </div>  
		              </div>      
           			</div>  
						
					<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Subject :  </label>
		                <div class="col-sm-9">
		               <input type="text"
							class="form-control" name="editSubject" id="editSubject">
		                 </div>  
		              </div>      
           			</div>  
						
					
			</div> <!-- edit email div ends -->
					
					  
					<!-- Email2 end--> 
					<div class="clearfix"></div>
					<div id="txtBodyDiv">
					<div class="row">
					
						<div class="form-group col-md-12 clearfix">
						<label class="col-sm-3 control-label no-padding-right" for="editBodytext">Body :<span class="red">*</span></label>

						<div class="col-sm-9">
							
							<div class="wysiwyg-editor" id="editBodytext" name='Bodytext'></div>
							<!-- <input type="hidden" id="ebodyhiddeneditor" name="ebodyhiddeneditor">	 -->
							
						</div>
					</div>
					</div>
					</div>
					
				<!-- 	<div class="row">  
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Body :<span class="red">*</span> </label>
		                <div class="col-sm-9">
		                 <span class="searchpadding padding_top "
						style="float: left; width: 400px;" id="editBtext"> <textarea
							name="editBodytxt" id="editBodytxt"
							style="width: 400px; height: 1200px" rows="6" class="editor">   
				</textarea></span>
		                 </div>  
		              </div>      
           			</div>  -->
				
					
					
					<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Signature :<span
							class="red">*</span> </label>
		                <div class="col-sm-9">
		                <select
						name="editSignature" class="form-control" id="editSignature"
						style="float: left; width: 300px;">
							
						</select>
		                 </div>  
		              </div>  
		              </div>     
					
					
					<div id="EditIncludeText"><!--edit include text div starts  -->
					
					<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Include Text :<span
							class="red">*</span> </label>
		                <div class="col-sm-9">
		                 	<input type="checkbox"
							id="editchkDisc" name="editchkDisc">&nbsp;Add
							Disclaimer <input type="checkbox" id="editchkDnd"
							name="editchkDnd">&nbsp;Add DND
		                 </div>  
		              </div>      
           			</div> 
					
						


					</div><!--edit include text div ends  -->
					</form>   
				</div>
						
					
				
			  
			</div> 
	  
		   
	  
	 
			<div class="modal-footer">  
			 <button data-bb-handler="close" type="button" class="btn btn-primary btn-sm" id="Save" onclick="submitEditDownload(1);"  >Save</button>
			 <button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close" ><i class="ace-icon fa fa-close"></i> Cancel</button>
			</div>  
	      
     </div>  </div>              
       
    <!--  </div>  -->
	  
	
	
	 
	
	<!-- Center part start -->
	<section> 
 
 
		<!-- <div class="container white"> -->
			<!-- <div class="container-head">
				<div class="col-md-12" style="text-align: right;">
					accordion start

					<div class="accordion pull-left col-md-12" id="accordFundSel">
						<div class="accordion-group">
							<form>
								<div class="col-md-11" style="width: 96%;">
									<span style="float: left;">Notification Template List</span> <span
										class="col-md-10" style="float: right; margin-top: -3px;">
										<input name="searchtext" type="text" id="tags"
										placeholder="Quick Search">
									</span>
								</div>
							</form>

							accordion-body END
						</div>
						accordion-group END
					</div>
					accordion  END  


					accordion End
				</div> 
			</div> -->
			<div class="page-header clearfix">
            <h1 class="pull-left">Notification Template List</h1>
            <div class="nav-search pull-right" id="">
              <form class="form-search">  
                <%-- <span class="input-icon">
                <input type="text" placeholder="Search ..." class="nav-search-input" id="search"  autocomplete="off" value="${value}">
                <i class="ace-icon fa fa-search nav-search-icon"></i></span> --%>
              </form>
          </div>  

     
    
           	    <!-- accordion-group END -->
              </div>
			
			
			<div class="container-body" style="margin-top: 0px;">
				<!-- center -->

				 <!-- <div 
					style="display: inline-block; padding-left: 0; margin: 0px 0 10px 0;">
					<span class="searchpadding padding_top"
						style="float: left; width: 100px;">Biz Unit <span
						class="red">*</span>
					</span> <span class="searchpadding padding_top"
						style="float: left; width: 150px;"> <select
						name="bizUnitForList" class="form-control" id="bizUnitForList"
						style="float: left; width: 300px;"
						onchange="bizUnitForListBU(this.value);">
					</select>
					</span>
					<div class="clearfix"></div>
				</div>    -->
				
				<%-- <div class = "row">
						 <form name="abc" id="abc" method="Post"  action="<%=request.getContextPath()%>/notifytemplate/getTemplateList.htm">
							<input id="viewStatus" type="hidden" name="viewStatus"	/>
							<div class="searchboxreport"> 
							<span class="searchpadding padding_top"
							style="float: left; width: 100px;">Biz Unity <span
							class="red">*</span>
							</span> 
							<span class="searchpadding padding_top"
								style="float: left; width: 150px;"> <select
								name="bizUnitForList" class="form-control" id="bizUnitForList"
								style="float: left; width: 300px;"
								onchange="bizUnitForListBU(this.value);viewStatusUrl();">
							</select>
							</span> 
								           
							</div>	
							</form>	
			</div> --%>

				<ul class="pagination pagination-sm">
					<!--   <li  class="disabled"><a href="#">&laquo;</a></li>
  <li><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li> 
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#">&raquo;</a></li> -->
				</ul>
				<div class="topmenu">

					<a id="SPNotificationTemplAddNewLink" href="#" onClick="addNote();"><input
						data-params="{}" type="button"
						class="btn btn-sm btn-primary" 
						value="  New Notification Template  "
						title="New Notification Template" alt="New Notification Template"></a>
					<a id="SPNotificationTemplDeleteLink" href="#"
						><input data-params="{}" type="button"
						class="btn btn-sm btn-danger" value="  Delete"
						onClick="deleteTemplate();"   
						title="Delete" alt="Delete"></a>
						
						
				</div>

				<div class="table-responsive" id="display_table_lead"
					style="border: none;">
					<div id="toreload"> 

						<table id="grid-table"></table>
						<div id="grid-pager"></div>
 						<!-- Center-->     
					</div>
				</div>

				<%-- <div class="col-sm-7"> 

					<ul class="pagination pagination-sm"
						style="float: left; margin-right: 20px;">
						<!--       <li  class="disabled"><a href="#">&laquo;</a></li>
      <li><a href="#">1</a></li>
      <li><a href="#">2</a></li>
      <li><a href="#">3</a></li>
      <li><a href="#">4</a></li>
      <li><a href="#">5</a></li> 
      <li><a href="#">&raquo;</a></li> --> 
					</ul>



					<div class="topmenuleft">
						<div  class="customDropdown">
       <span >Page Size:</span>&nbsp;
      <select  type="button" name="pageSize" id="page" onchange="pagesizeurl();">
         
           <option value="10" <c:if test="${size==10}"> selected="selected" </c:if>>10</option>
           <option value="20" <c:if test="${size==20}"> selected="selected" </c:if>>20</option>
               <option value="50" <c:if test="${size==50}"> selected="selected" </c:if>>50</option>
               <option value="500" <c:if test="${size==500}"> selected="selected" </c:if>>500</option>
                 <option value="1000" <c:if test="${size==1000}"> selected="selected" </c:if>>Show All&nbsp;</option>
               
   </select> 
     </div>	
					</div> --%>
				<div class="topmenuleft">

					<ul>
						<li>Export options:</li>
						<li><a id="csvExp"
							href="<%=request.getContextPath()%>/notifytemplate/notifytemplateCSV.htm?searchTextVal=${searchTextVal}"
							title="Export in CSV" alt="Export in CSV"> <i
								class="fa fa-file-pdf-o bigger-140"></i></a></li>
						<li><a id="excelExp"
							href="<%=request.getContextPath()%>/notifytemplate/notifytemplateExecl.htm?searchTextVal=${searchTextVal}"
							title="Export in Excel" alt="Export in Excel"> <i
								class="fa fa-file-excel-o bigger-140"></i></a></li>

						<%-- 	<li> <a
						href="<%=request.getContextPath()%>/notifytemplate/importTemplate.htm"
						class="list-group-item" id="SPUploadViewLink"
						class="list-group-item">Import Template </a> </li> --%>
				</div>

			</div>
			<div class="topmenu">
				<a id="SPNotificationTemplAddNewLink" href="#" onClick="addNote();"><input
						data-params="{}" type="button"
						class="btn btn-sm btn-primary" 
						value="  New Notification Template  "
						title="New Notification Template" alt="New Notification Template"></a>
					<a id="SPNotificationTemplDeleteLink" href="#"
						><input data-params="{}" type="button"
						class="btn btn-sm btn-danger" value="  Delete"
						onClick="deleteTemplate();"
						title="Delete" alt="Delete"></a>
			</div>
		<!-- </div> -->
  
		   


	</section> 
	<!-- Center part End --> 

	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
	<script>
	
	
	
	
		function addNote() {
			 $('#deletenote').modal('hide');  
			/*  $("#addnote").modal('show');    */
			 
			 $("#addnote").modal({
			     backdrop: 'static',
			     keyboard: false
			 });
			 
			 
			 
		} 
  
		function deleteNote() {  
			$('#deletenote').modal('show');    
   			}  
		/* function editNote() {
         $('#editnote').modal('show');     
		}        */
  
		function editNote() {
			$("#deletenote,#addnote").hide();	
			/* $('#editnote').modal('show');  */
			 $("#editnote").modal({
			     backdrop: 'static',
			     keyboard: false
			 });

	
		}
		/* start code to delete Notify Template  */
		function deleteTemplate()
  
		{      
			var slvals = [];   
					  $('input:checkbox[id=chkToDeletetemplateId]:checked').each(function() {
					  slvals.push($(this).val());  
					  }) ;     
			//alert('Selected Checkbox values are: ' + slvals);

			
			if (slvals <= 0) {
				/* alert('Please select at least one Item !');
				popup('popUpAlertaddnote');  */
				  
				bootbox.dialog({
					message: "<span class='bigger-110'>Please select at least one item to delete</span>",
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
			else
				{ 
					deleteNote();
				}
			
			document.getElementById("confirmdelete").value = slvals;
			  
		}; 
 
		function confirmDelete() { 

			var slvals = document.getElementById("confirmdelete").value; 
			//alert('Selected Item is in confirm delete '+slvals);  
			//alert('hi');
			$.ajax({
				type : 'POST',
				url : $('#contextPath').val()
						+ "/notifytemplate/deleteTemplateList.htm?Lists="+ slvals,

				success : function(result) {
					//alert('Deleted selected='+slvals);     
					/* alert('Successfully Deleted Item !');
					location.reload(); */
					
					$("#deletenote").hide();
	 				  bootbox.dialog({
	 						message: "<span class='bigger-110'>Record deleted successfully !</span>",
	 						buttons: 			
	 						{  
	 							"click" :
	 							{
	 								"label" : "OK!",
	 								"className" : "btn-sm btn-primary",
	 								"callback": function() {
	 									location.reload();
	 								}
	 							}
	 						}
	 					}); 
				      // Do something after 5 seconds
				  

				}

			});
		}

		function xmlDisplay() {
			/// var slvals= document.getElementById("Edit").value;  
			var slvals = $('#eventIdEdit').val();
			//alert('Selected Item is  '+slvals);  

			$
					.ajax({
						type : 'GET',
						url : $('#contextPath').val()
								+ "/notifytemplate/getXmlValues.htm?Lists="
								+ slvals,

						success : function(result) {
							$(result)
									.each(
											function(key, value) {

												$(
														'#addquickSearcheditFrmEmailName')
														.val(value.fromm);
												$(
														'#addquickSearcheditFromEmail')
														.val(value.fromid);
												$('#addquickSearcheditRplTo')
														.val(value.replyto);
												$('#addquickSearcheditCc').val(
														value.cc);
												$('#addquickSearcheditBcc')
														.val(value.bcc);
												$('#addquickSearcheditTo').val(
														value.too);

												$('#editSubject').val(
														value.subjectt);
												
											//ss	var data = $('#editBodytext').html();
												$('#editBodytext').html(value.body);

												/* var str = value.body;  */
												//alert(str);        
												//var arr = str.replace("\\\"","\"");   
												/* var arr = data.replace(/\\"/g,
														'"');
												 */
												//alert(arr);      

												/*  nicEditors.findEditor(
														"editBodytxt") 
														.setContent(arr);  */

												document
														.getElementById("hdneditFrmEmail").value = value.fromid;
												document
														.getElementById("hdneditTo").value = value.too;
												document
														.getElementById("hdneditCc").value = value.cc;
												document
														.getElementById("hdneditBcc").value = value.bcc;

											});

						}

					});
		}

		/* function getbodytext() {
		 	var value1 = nicEditors.findEditor("editBodytxt").getContent();
			$('#hdnBodytext').val(value1);  
			
			
			 document.getElementById("hdnBodytext").value = $('#editBtext').html();
		
		} */

		/*	function getAddbodytext() {
		 var value1 = nicEditors.findEditor("bodytxt").getContent(); 
			$('#hdnAddBodytext').val(value1); 
			 document.getElementById("hdnAddBodytext").value = $('#bodytext').html();
			
		} */

		function addBizUnit() {

			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/notifytemplate/getBizUnitSection.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					$('#bizUnit').empty();
					$('#bizUnit').append(
							'<option value="0">--Select--</option>');

					$(result).each(

							function(i, obj) {

								var module = obj.lastname;
								var moduleid = obj.buid;

								$('#bizUnit').append(
										'<option value="'+moduleid+'">'
												+ module + '</option>');

							});

				}

			});

		}

		/* function bizUnitForListBU(id) {
			//alert(id);
			var searchtext = $('#searchtext').val();
			//alert(searchtext);  
 
			$("#toreload")
					.load(
							/*' ${pageContext.request.contextPath}/notifytemplate/getTemplateList.htm #toreload', 
							$('#contextPath').val()
							+ '/notifytemplate/getTemplateList.htm #toreload',
							{
								object : '${object}',
								pageSize : $('#page').val(),
								searchtext : searchtext,
								bizUnitForList : id,

							},
							function(response, status, xhr) {
								try { 
									$("#csvExp")
											.attr(
													"href",
													"${pageContext.request.contextPath}/notifytemplate/notifytemplateCSV.htm?searchTextVal="
															+ searchtext
															+ "&listBIzUnit="
															+ id);
									$("#excelExp")
											.attr(
													"href",
													"${pageContext.request.contextPath}/notifytemplate/notifytemplateExecl.htm?searchTextVal="
															+ searchtext
															+ "&listBIzUnit="
															+ id);

								} catch (e) {

								}
							});
		} */

		function bizUnitForList() {

			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/notifytemplate/getBizUnitSection.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					$('#bizUnitForList').empty();
					$('#bizUnitForList').append(
							'<option value="">--Select--</option>');

					$(result).each(

							function(i, obj) {

								var module = obj.lastname;
								var moduleid = obj.buid;

								$('#bizUnitForList').append(
										'<option value="'+moduleid+'">'
												+ module + '</option>');

							});

				}

			});

		}

		$(document).ready(function() {

			addBizUnit();
			bizUnitForList();

		});

		function addSystem() {
			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/notifytemplate/getSystemSection.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					$('#system').empty();
					$('#system')
							.append('<option value="0">--Select--</option>');

					$(result).each(

							function(i, obj) {

								var module = obj.codeValue;
								var moduleid = obj.codeValueID;

								$('#system').append(
										'<option value="'+moduleid+'">'
												+ module + '</option>');

							});
				}

			});

		}

		$(document).ready(function() {
			addSystem();
		});

		function addRecepient() {
 
			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/notifytemplate/getRecepientSection.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					$('#recepient').empty();
					$('#recepient').append(
							'<option value="0">--Select--</option>');

					$(result).each(

							function(i, obj) {

								var module = obj.codeValue;
								var moduleid = obj.codeValueID;

								$('#recepient').append(
										'<option value="'+moduleid+'">'
												+ module + '</option>');

							});

				}

			});

		}

		$(document).ready(function() {
			addRecepient();
		});

		function addChannel() {

			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/notifytemplate/getChannelSection.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					$('#channel').empty();
					$('#channel').append(
							'<option value="0">--Select--</option>');

					$(result).each(

							function(i, obj) {

								var module = obj.codeValue;
								var moduleid = obj.codeValueID;

								$('#channel').append(
										'<option value="'+moduleid+'">'
												+ module + '</option>');

							});

				}

			});

		}

		$(document).ready(function() {
			addChannel();
		});

		function addEvent(){
			  
			   $
			     .ajax({

			      type : "POST",
			      url : $('#contextPath').val()
			        + '/notifytemplate/getEventSection.htm',
			      dataType : 'json',
			      contentType : 'application/json',
			      success : function(result) {
			                            
			       $('#event').empty();  
			       $('#event').append(
			         '<option class="maxwidth" value="0">--Select--</option>');

			       $(result)
			         .each(

			           function(i, obj) {

			            var module = obj.eventname;
			            
			            var moduleid = obj.eventid;

			            $('#event').append(
			              '<option  value="'+moduleid+'">'
			                + module.substr(0,36)      
			                + '</option>');

			           });

			      }  

			     });

			  }
		$(document).ready(function() {
			addEvent();
		});

		function addName() {

			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/notifytemplate/getNameSection.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					$('#fromname').empty();
					$('#fromname').append(
							'<option value="0">--Select--</option>');

					$(result).each(

							function(i, obj) {

								var module = obj.codeValue;
								var moduleid = obj.codeValueID;

								$('#fromname').append(
										'<option value="'+module+'">' + module
												+ '</option>');

							});

				}
			});

		}

		$(document).ready(function() {
			addName();

		});

		function addToPhone() {
			var codeValues = '';
			var codeValuesForTo = [];

			//alert('hi phoneemail'); 
			var x = document.getElementById("channel");
			var strUser = x.options[x.selectedIndex].value;
			//alert(strUser);
			var slvals;
			if (strUser == 32002) {

				slvals = "Phone";
				//alert(slvals);
			} else {

				slvals = "Email";
				//alert(slvals);
			}

			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ "/notifytemplate/getEmailPhoneSection.htm?channel="
						+ slvals,
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					$('#to').empty();
					$('#to').append('<option value="0">--Select--</option>');

					$(result).each(

							function(i, obj) {   

								var module = obj.codeValue;
								var moduleid = obj.codeValueID;

								$('#to').append(
										'<option value="'+module+'">' + module
												+ '</option>');
								var codeValuesForTo = {
									values : $.parseJSON(result.d)
								};
								//alert(codeValuesForTo);       

							});

				}
			});

		}

		function showSelectTo() {
			var selO = document.getElementsByName('to')[0];
			var selValuesTo = [];
			for (i = 0; i < selO.length; i++) {
				if (selO.options[i].selected) {
					selValuesTo.push(selO.options[i].value);
				}
			}
			//alert(selValuesTo);
			$('#hdnTo').val(selValuesTo);  
		}

		function showSelectCC() {
			var selO = document.getElementsByName('cc')[0];
			var selValuesCC = [];
			for (i = 0; i < selO.length; i++) {
				if (selO.options[i].selected) {
					selValuesCC.push(selO.options[i].value);
				}
			}
			//alert(selValuesCC);       
			$('#hdnCC').val(selValuesCC);

		}

		function showSelectBCC() {
			var selO = document.getElementsByName('bcc')[0];
			var selValuesBCC = [];
			for (i = 0; i < selO.length; i++) {
				if (selO.options[i].selected) {
					selValuesBCC.push(selO.options[i].value);
				}
			}
			//alert(selValuesBCC);       
			$('#hdnBCC').val(selValuesBCC);

		} //from

		function showSelectFrom() {
			var selO = document.getElementsByName('from')[0];
			var selValuesFrom = [];
			for (i = 0; i < selO.length; i++) {
				if (selO.options[i].selected) {
					selValuesFrom.push(selO.options[i].value);
				}
			}
			//alert(selValuesFrom);         
			$('#hdnFrom').val(selValuesFrom);

		}
		function autovalid(n) {
			if (n == 0) {
				$("#addquickSearchName").val('');
				$('#addquickSearchHiddenName').val('');
			} else {
				$("#addquickSearcheditFrmEmailName").val('');
				$('#addquickSearchHiddeneditFrmEmailName').val('');

			}
		}
		function autovalid(n) {
			if (n == 0) {
				$("#addquickSearch").val('');
				$('#addquickSearchHidden').val('');
			} else {
				$("#addquickSearcheditFromEmail").val('');
				$('#addquickSearchHiddeneditFromEmail').val('');

			} 
		}
		function autovalid(n) {
			if (n == 0) {
				$("#addquickSearch1").val('');
				$('#addquickSearchHidden1').val('');
			} else {
				$("#addquickSearcheditRplTo").val('');
				$('#addquickSearchHiddeneditRplTo').val('');

			}
		}
		function autovalid(n) {
			if (n == 0) {
				$("#addquickSearchTo").val('');
				$('#addquickSearchHiddenTo').val('');
			} else {
				$("#addquickSearcheditTo").val('');
				$('#addquickSearchHiddeneditTo').val('');

			}
		}
		function autovalid(n) {
			if (n == 0) {
				$("#addquickSearch2").val('');
				$('#addquickSearchHidden2').val('');
			} else {
				$("#addquickSearcheditCc").val('');
				$('#addquickSearchHiddeneditCc').val('');

			}
		}
		function autovalid(n) {
			if (n == 0) {
				$("#addquickSearch3").val('');
				$('#addquickSearchHidden3').val('');
			} else {
				$("#addquickSearcheditBcc").val('');
				$('#addquickSearchHiddeneditBcc').val('');

			}

		}

		function addquickSearchToPhone(e) {

			var event = window.event ? window.event : e;
			//alert(event.keyCode);      

			if (event.keyCode == 37 || event.keyCode == 38
					|| event.keyCode == 39 || event.keyCode == 40)
				return;
			if (event.keyCode == 13) {
				search();
				return;
			}
			$('#common_popup_div,#shadow_div_web_app').remove();
			$('.ui-autocomplete').css('z-index', '9999999999999999');
			//alert("searchString="+$('#addquickSearch').val());
			var str = $('#addquickSearchTo').val();
			var arr = extractLast(str);
			//alert(arr);

			var codeValues = '';
			var codeValuesForTo = [];

			//alert('hi phoneemail'); 
			var x = document.getElementById("channel");
			var strUser = x.options[x.selectedIndex].value;
			//alert(strUser);
			var slvals;
			if (strUser == 32002) {

				slvals = "Phone";
				//alert(slvals);
			} else {

				slvals = "Email";
				//alert(slvals);
			}

			$
					.ajax({
						method : "post",
						//url: $('#contextPath').val()+"/notifytemplate/getNameSection.htm?searchString="+arr,     
						url : $('#contextPath').val()
								+ "/notifytemplate/getEmailPhoneSection.htm?channel="
								+ slvals + "&searchString=" + arr,
						success : function(result) {

							//alert(result);
							var userLabelValueList = new Array();
							$(result).each(function(i, obj) {
								var object = {};
								object.value = obj.codeValueID;

								object.label = obj.codeValue;
								userLabelValueList.push(object);
								/* 	alert("Hello:::::"+ obj.partyID);
									alert("Hi:::::::::"+obj.partnerName); */

							});
							//				 alert("object.label:::"+  object.label);
							$("#addquickSearchTo")
									// don't navigate away from the field on tab when selecting an item
									.bind(
											"keydown",
											function(event) {
												if (event.keyCode === $.ui.keyCode.TAB
														&& $(this)
																.data(
																		"ui-autocomplete").menu.active) {
													event.preventDefault();
												}
											})

									.autocomplete(
											{
												minLength : 0,
												source : function(request,
														response) {
													last = extractLast(request.term);
													if (last == null
															|| last == ''
															|| last == ' ') {
														return false;
													}

													response($.ui.autocomplete
															.filter(
																	userLabelValueList,
																	extractLast(request.term)));
												},
												focus : function() {
													// prevent value inserted on focus
													return false;
												},

												select : function(event, ui) {
													var terms = split(this.value);

													//console.log('terms='+terms);

													// remove the current input
													terms.pop();
													// add the selected item 
													terms.push(ui.item.label);
													//					        	partyId=ui.item.value; 
													$('#addquickSearchHiddenTo')
															.val(ui.item.value)
													//alert( $('#addquickSearchHiddenTo').val())
													terms.push("");

													/*  var labelArr = $(this).data('label') || new Array();
													    labelArr.push(ui.item);
													    $(this).data('label',labelArr);
													    console.log($(this).data());
													 */
													this.value = terms
															.join("; ");

													return false;
												}

											});

						}
					});

		}

		function addquickSearchEmailName(e) {

			var event = window.event ? window.event : e;
			//alert(event.keyCode); 

			if (event.keyCode == 37 || event.keyCode == 38
					|| event.keyCode == 39 || event.keyCode == 40)
				return;
			if (event.keyCode == 13) {
				search();
				return;
			}
			$('#common_popup_div,#shadow_div_web_app').remove();
			$('.ui-autocomplete').css('z-index', '9999999999999999');
			//alert("searchString="+$('#addquickSearch').val());
			var str = $('#addquickSearchName').val();
			var arr = extractLast(str);
			//alert(arr);
			$
					.ajax({
						method : "post",
						url : $('#contextPath').val()
								+ "/notifytemplate/getNameSection.htm?searchString="
								+ arr,

						success : function(result) {

							//alert(result);
							var userLabelValueList = new Array();
							$(result).each(function(i, obj) {
								var object = {};
								object.value = obj.codeValueID;

								object.label = obj.codeValue;
								userLabelValueList.push(object);
								/* 	alert("Hello:::::"+ obj.partyID);
									alert("Hi:::::::::"+obj.partnerName); */

							});
							//			 alert("object.label:::"+  object.label);
							$("#addquickSearchName")
									// don't navigate away from the field on tab when selecting an item
									.bind(
											"keydown",
											function(event) {
												if (event.keyCode === $.ui.keyCode.TAB
														&& $(this)
																.data(
																		"ui-autocomplete").menu.active) {
													event.preventDefault();
												}
											})

									.autocomplete(
											{
												minLength : 0,
												source : function(request,
														response) {
													last = extractLast(request.term);
													if (last == null
															|| last == ''
															|| last == ' ') {
														return false;
													}

													response($.ui.autocomplete
															.filter(
																	userLabelValueList,
																	extractLast(request.term)));
												},
												focus : function() {
													// prevent value inserted on focus
													return false;
												},

												select : function(event, ui) {
													var terms = split(this.value);

													//console.log('terms='+terms);

													// remove the current input
													terms.pop();
													// add the selected item 
													terms.push(ui.item.label);
													//				        	partyId=ui.item.value; 
													$(
															'#addquickSearchHiddenName')
															.val(ui.item.value)
													//alert( 'in alert ...'+$('#addquickSearchHiddenName').val())
													terms.push("");

													/*  var labelArr = $(this).data('label') || new Array();
													    labelArr.push(ui.item);
													    $(this).data('label',labelArr);
													    console.log($(this).data());
													 */
													this.value = terms
															.join("; ");

													return false;
												}

											});

						}
					});

		}

		function addquickSearchPartner(e) {

			var event = window.event ? window.event : e;
			//alert(event.keyCode);

			if (event.keyCode == 37 || event.keyCode == 38
					|| event.keyCode == 39 || event.keyCode == 40)
				return;
			if (event.keyCode == 13) {
				search();
				return;
			}
			$('#common_popup_div,#shadow_div_web_app').remove();
			$('.ui-autocomplete').css('z-index', '9999999999999999');
			//alert("searchString="+$('#addquickSearch').val());
			var str = $('#addquickSearch').val();
			var arr = extractLast(str);
			//alert(arr);
			$
					.ajax({
						method : "post",
						url : $('#contextPath').val()
								+ "/notifytemplate/getEmailSection.htm?searchString="
								+ arr,

						success : function(result) {

							//alert(result);
							var userLabelValueList = new Array();
							$(result).each(function(i, obj) {
								var object = {};
								object.value = obj.codeValueID;

								object.label = obj.codeValue;
								userLabelValueList.push(object);
								/* 	alert("Hello:::::"+ obj.partyID);
									alert("Hi:::::::::"+obj.partnerName); */

							});
							//				 alert("object.label:::"+  object.label);
							$("#addquickSearch")
									// don't navigate away from the field on tab when selecting an item
									.bind(
											"keydown",
											function(event) {
												if (event.keyCode === $.ui.keyCode.TAB
														&& $(this)
																.data(
																		"ui-autocomplete").menu.active) {
													event.preventDefault();
												}
											})

									.autocomplete(
											{
												minLength : 0,
												source : function(request,
														response) {
													last = extractLast(request.term);
													if (last == null
															|| last == ''
															|| last == ' ') {
														return false;
													}

													response($.ui.autocomplete
															.filter(
																	userLabelValueList,
																	extractLast(request.term)));
												},
												focus : function() {
													// prevent value inserted on focus
													return false;
												},

												select : function(event, ui) {
													var terms = split(this.value);

													//console.log('terms='+terms);

													// remove the current input
													terms.pop();
													// add the selected item 
													terms.push(ui.item.label);
													//					        	partyId=ui.item.value;
													$('#addquickSearchHidden')
															.val(ui.item.value)
													//alert( $('#addquickSearchHidden').val())
													terms.push("");

													/*  var labelArr = $(this).data('label') || new Array();
													    labelArr.push(ui.item);
													    $(this).data('label',labelArr);
													    console.log($(this).data());
													 */
													this.value = terms
															.join("; ");

													return false;
												}

											});

						}
					});

		}

		function addquickSearchPartner1(e) {

			var event = window.event ? window.event : e;
			//alert(event.keyCode);

			if (event.keyCode == 37 || event.keyCode == 38
					|| event.keyCode == 39 || event.keyCode == 40)
				return;
			if (event.keyCode == 13) {
				search();
				return;
			}
			$('#common_popup_div,#shadow_div_web_app').remove();
			$('.ui-autocomplete').css('z-index', '9999999999999999');
			//alert("searchString="+$('#addquickSearch').val());
			var str = $('#addquickSearch1').val();
			var arr = extractLast(str);
			//alert(arr);
			$
					.ajax({
						method : "post",
						url : $('#contextPath').val()
								+ "/notifytemplate/getEmailSection.htm?searchString="
								+ arr,

						success : function(result) {

							//alert(result);
							var userLabelValueList = new Array();
							$(result).each(function(i, obj) {
								var object = {};
								object.value = obj.codeValueID;

								object.label = obj.codeValue;
								userLabelValueList.push(object);
								/* 	alert("Hello:::::"+ obj.partyID);
									alert("Hi:::::::::"+obj.partnerName); */

							});
							//				 alert("object.label:::"+  object.label);
							$("#addquickSearch1")
									// don't navigate away from the field on tab when selecting an item
									.bind(
											"keydown",
											function(event) {
												if (event.keyCode === $.ui.keyCode.TAB
														&& $(this)
																.data(
																		"ui-autocomplete").menu.active) {
													event.preventDefault();
												}
											})

									.autocomplete(
											{
												minLength : 0,
												source : function(request,
														response) {
													last = extractLast(request.term);
													if (last == null
															|| last == ''
															|| last == ' ') {
														return false;
													}

													response($.ui.autocomplete
															.filter(
																	userLabelValueList,
																	extractLast(request.term)));
												},
												focus : function() {
													// prevent value inserted on focus
													return false;
												},

												select : function(event, ui) {
													var terms = split(this.value);

													//console.log('terms='+terms);

													// remove the current input
													terms.pop();
													// add the selected item 
													terms.push(ui.item.label);
													//					        	partyId=ui.item.value;
													$('#addquickSearchHidden1')
															.val(ui.item.value)
													//alert( $('#addquickSearchHidden1').val())
													terms.push("");

													/*  var labelArr = $(this).data('label') || new Array();
													    labelArr.push(ui.item);
													    $(this).data('label',labelArr);
													    console.log($(this).data());
													 */
													this.value = terms
															.join("; ");

													return false;
												}

											});

						}
					});

		}

		function addquickSearchPartner2(e) {

			var event = window.event ? window.event : e;
			//alert(event.keyCode);

			if (event.keyCode == 37 || event.keyCode == 38
					|| event.keyCode == 39 || event.keyCode == 40)
				return;
			if (event.keyCode == 13) {
				search();
				return;
			}
			$('#common_popup_div,#shadow_div_web_app').remove();
			$('.ui-autocomplete').css('z-index', '9999999999999999');
			//alert("searchString="+$('#addquickSearch').val());
			var str = $('#addquickSearch2').val();
			var arr = extractLast(str);
			//alert(arr);
			$
					.ajax({
						method : "post",
						url : $('#contextPath').val()
								+ "/notifytemplate/getEmailSection.htm?searchString="
								+ arr,

						success : function(result) {

							//alert(result);
							var userLabelValueList = new Array();
							$(result).each(function(i, obj) {
								var object = {};
								object.value = obj.codeValueID;

								object.label = obj.codeValue;
								userLabelValueList.push(object);
								/* 	alert("Hello:::::"+ obj.partyID);
									alert("Hi:::::::::"+obj.partnerName); */

							});
							//				 alert("object.label:::"+  object.label);
							$("#addquickSearch2")
									// don't navigate away from the field on tab when selecting an item
									.bind(
											"keydown",
											function(event) {
												if (event.keyCode === $.ui.keyCode.TAB
														&& $(this)
																.data(
																		"ui-autocomplete").menu.active) {
													event.preventDefault();
												}
											})

									.autocomplete(
											{
												minLength : 0,
												source : function(request,
														response) {
													last = extractLast(request.term);
													if (last == null
															|| last == ''
															|| last == ' ') {
														return false;
													}

													response($.ui.autocomplete
															.filter(
																	userLabelValueList,
																	extractLast(request.term)));
												},
												focus : function() {
													// prevent value inserted on focus
													return false;
												},

												select : function(event, ui) {
													var terms = split(this.value);

													//console.log('terms='+terms);

													// remove the current input
													terms.pop();
													// add the selected item 
													terms.push(ui.item.label);
													//					        	partyId=ui.item.value;
													$('#addquickSearchHidden2')
															.val(ui.item.value)
													//alert( $('#addquickSearchHidden2').val())
													terms.push("");

													/*  var labelArr = $(this).data('label') || new Array();
													    labelArr.push(ui.item);
													    $(this).data('label',labelArr);
													    console.log($(this).data());
													 */
													this.value = terms
															.join("; ");

													return false;
												}

											});

						}
					});

		}

		function addquickSearchPartner3(e) {

			var event = window.event ? window.event : e;
			//alert(event.keyCode);

			if (event.keyCode == 37 || event.keyCode == 38
					|| event.keyCode == 39 || event.keyCode == 40)
				return;
			if (event.keyCode == 13) {
				search();
				return;
			}
			$('#common_popup_div,#shadow_div_web_app').remove();
			$('.ui-autocomplete').css('z-index', '9999999999999999');
			//alert("searchString="+$('#addquickSearch').val());
			var str = $('#addquickSearch3').val();
			var arr = extractLast(str);
			//alert(arr);
			$
					.ajax({
						method : "post",
						url : $('#contextPath').val()
								+ "/notifytemplate/getEmailSection.htm?searchString="
								+ arr,

						success : function(result) {

							//alert(result);
							var userLabelValueList = new Array();
							$(result).each(function(i, obj) {
								var object = {};
								object.value = obj.codeValueID;

								object.label = obj.codeValue;
								userLabelValueList.push(object);
								/* 	alert("Hello:::::"+ obj.partyID);
									alert("Hi:::::::::"+obj.partnerName); */

							});
							//				 alert("object.label:::"+  object.label);
							$("#addquickSearch3")
									// don't navigate away from the field on tab when selecting an item
									.bind(
											"keydown",
											function(event) {
												if (event.keyCode === $.ui.keyCode.TAB
														&& $(this)
																.data(
																		"ui-autocomplete").menu.active) {
													event.preventDefault();
												}
											})

									.autocomplete(
											{
												minLength : 0,
												source : function(request,
														response) {
													last = extractLast(request.term);
													if (last == null
															|| last == ''
															|| last == ' ') {
														return false;
													}

													response($.ui.autocomplete
															.filter(
																	userLabelValueList,
																	extractLast(request.term)));
												},
												focus : function() {
													// prevent value inserted on focus
													return false;
												},

												select : function(event, ui) {
													var terms = split(this.value);

													//console.log('terms='+terms);

													// remove the current input
													terms.pop();
													// add the selected item 
													terms.push(ui.item.label);
													//					        	partyId=ui.item.value;
													$('#addquickSearchHidden3')
															.val(ui.item.value)
													//alert( $('#addquickSearchHidden3').val())
													terms.push("");

													/*  var labelArr = $(this).data('label') || new Array();
													    labelArr.push(ui.item);
													    $(this).data('label',labelArr);
													    console.log($(this).data());
													 */
													this.value = terms
															.join("; ");

													return false;
												}

											});

						}
					});

		}

		function split(val) {
			return val.split(/;\s*/);
		}
		function extractLast(term) {
			var n = split(term).pop();
			//alert(n);
			return n;
		}

		function addReplyTo() {

			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/notifytemplate/getEmailSection.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					$('#replyto').empty();
					$('#replyto').append(
							'<option value="0">--Select--</option>');

					$(result).each(

							function(i, obj) {

								var module = obj.codeValue;
								var moduleid = obj.codeValueID;

								$('#replyto').append(
										'<option value="'+module+'">' + module
												+ '</option>');

							});

				}

			});

		}

		$(document).ready(function() {
			addReplyTo();
		});

		function addFrom() {

			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/notifytemplate/getEmailSection.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					$('#from').empty();
					$('#from').append('<option value="0">--Select--</option>');

					$(result).each(

							function(i, obj) {

								var module = obj.codeValue;
								var moduleid = obj.codeValueID;

								$('#from').append(
										'<option value="'+module+'">' + module
												+ '</option>');

							});

				}

			});

		}

		$(document).ready(function() {
			addFrom();
		});

		function addCc() {

			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/notifytemplate/getEmailSection.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					$('#cc').empty();
					$('#cc').append('<option value="0">--Select--</option>');

					$(result).each(

							function(i, obj) {

								var module = obj.codeValue;
								var moduleid = obj.codeValueID;

								$('#cc').append(
										'<option value="'+module+'">' + module
												+ '</option>');

							});

				}

			});

		}

		$(document).ready(function() {
			addCc();
		});

		function addBcc() {

			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/notifytemplate/getEmailSection.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					$('#bcc').empty();
					$('#bcc').append('<option value="0">--Select--</option>');

					$(result).each(

							function(i, obj) {

								var module = obj.codeValue;
								var moduleid = obj.codeValueID;

								$('#bcc').append(
										'<option value="'+module+'">' + module
												+ '</option>');

							});

				}

			});

		}

		$(document).ready(function() {
			addBcc();
		});

		function addSignature() {

			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/notifytemplate/getSignSection.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					$('#signature').empty();
					$('#signature').append(
							'<option value="0">--Select--</option>');

					$(result).each(

							function(i, obj) {

								var module = obj.codeValue;
								var moduleid = obj.codeValueID;

								$('#signature').append(
										'<option value="'+moduleid+'">'
												+ module + '</option>');

							});

				}

			});

		}

		$(document).ready(function() {
			addSignature();
		});

		function setActive() {
			var x;
			if (document.getElementById('chkTemp').checked) {
				x = $("#chkTemp").val(true);
				//alert(x);
			} else {
				x = $("#chkTemp").val(false);
				//alert(x);
			}

		}

		function setDiscEdit() {
			var x;

			if (document.getElementById('editchkDisc').checked) {
				x = $("#editchkDisc").val(true);
				//alert(x);
			} else {
				x = $("#editchkDisc").val(false);
				//alert(x);
			}
		}

		function setDndEdit() {
			var x;
			if (document.getElementById('editchkDnd').checked) {
				x = $("#editchkDnd").val(true);
				//alert(x);
			} else {
				x = $("#editchkDnd").val(false);
				//alert(x);
			}
		}

		function setDisc() {
			var x;

			if (document.getElementById('chkDisc').checked) {
				x = $("#chkDisc").val(true);
				//alert(x);
			} else { 
				x = $("#chkDisc").val(false);
				//alert(x);
			}
		}

		function setDnd() {
			var x;
			if (document.getElementById('chkDnd').checked) {
				x = $("#chkDnd").val(true);
				//alert(x);
			} else {
				x = $("#chkDnd").val(false);
				//alert(x); 
			}
		}

		function pagesizeurl() {
			var pageSize = $('#page').val();
			window.location.href = $('#contextPath').val()
					+ '/notifytemplate/getTemplateList.htm?pageSize='
					+ pageSize;
		}
	</script>
	<script>
		$(document).ready(function() {
			$("#user").click(function() {
				$("#usermenu").slideToggle();
			});

		});

		/* For file Type & size */
		function getFile() {
			document.getElementById("fileid").click();
		}

		function getFile1() {
			document.getElementById("fileid1").click();
		}

		function getFile2() {
			document.getElementById("fileid2").click();
		}

		function getEditFile() {

			document.getElementById("editfileid").click();

		}

		function getEditFile1() {

			document.getElementById("editfileid1").click();

		}

		function getEditFile2() {

			document.getElementById("editfileid2").click();

		}

		/* For file Type & size */

		var fSize;
		function displayfile1() {
			var filename = $('#fileid').val().replace(/.*(\/|\\)/, '');
			var fType = filename.split(".");
			//alert("fType:"+fType[1]);
			fSize = document.getElementById('fileid').files[0].size / 1024; //size in kb
			document.getElementById("ftype").innerHTML = "Type: " + fType[1]
					+ ", " + "Size: " + Math.floor(fSize) + "kb";
			var fv = document.getElementById("fileid").value;
			document.getElementById("ftxtid").value = fv;
			//alert("fv:"+fv); 
		}

		function displayfile2() {
			var filename = $('#fileid1').val().replace(/.*(\/|\\)/, '');
			var fType = filename.split(".");
			//alert("fType:"+fType[1]);
			fSize = document.getElementById('fileid1').files[0].size / 1024; //size in kb
			document.getElementById("ftype1").innerHTML = "Type: " + fType[1]
					+ ", " + "Size: " + Math.floor(fSize) + "kb";

			var fv = document.getElementById("fileid1").value;
			document.getElementById("ftxtid1").value = fv;
			//alert("fv:"+fv); 
		}

		function displayfile3() {
			var filename = $('#fileid2').val().replace(/.*(\/|\\)/, '');
			var fType = filename.split(".");
			//alert("fType:"+fType[1]); 
			fSize = document.getElementById('fileid2').files[0].size / 1024; //size in kb
			document.getElementById("ftype2").innerHTML = "Type: " + fType[1]
					+ ", " + "Size: " + Math.floor(fSize) + "kb";

			var fv = document.getElementById("fileid2").value;
			document.getElementById("ftxtid2").value = fv;
			//alert("fv:"+fv);
		}

		var editfSize;

		function displayeditfile() {
			var filename = $('#editfileid').val().replace(/.*(\/|\\)/, '');
			var fType = filename.split(".");
			//alert("fType:"+fType[1]);
			editfSize = document.getElementById('editfileid').files[0].size / 1024; //size in kb
			document.getElementById("editftype").innerHTML = "Type: "
					+ fType[1] + ", " + "Size: " + Math.floor(editfSize) + "kb";

			var v = document.getElementById("editfileid").value;
			document.getElementById("editftxtid").value = v;
			//alert(v); 
		}

		function displayeditfile1() {
			var filename = $('#editfileid1').val().replace(/.*(\/|\\)/, '');
			var fType = filename.split(".");
			//alert("fType:"+fType[1]);
			editfSize = document.getElementById('editfileid1').files[0].size / 1024; //size in kb
			document.getElementById("editftype1").innerHTML = "Type: "
					+ fType[1] + ", " + "Size: " + Math.floor(editfSize) + "kb";

			var v = document.getElementById("editfileid1").value;
			document.getElementById("editftxtid1").value = v;
			//alert(v); 
		}

		function displayeditfile2() {
			var filename = $('#editfileid2').val().replace(/.*(\/|\\)/, '');
			var fType = filename.split(".");
			//alert("fType:"+fType[1]);
			editfSize = document.getElementById('editfileid2').files[0].size / 1024; //size in kb
			document.getElementById("editftype2").innerHTML = "Type: "
					+ fType[1] + ", " + "Size: " + Math.floor(editfSize) + "kb";

			var v = document.getElementById("editfileid2").value;
			document.getElementById("editftxtid2").value = v;
			//alert(v); 
		}

		/* For file Type & size */
		var fSize;
		$(document)
				.ready(
						function() {
							$('#fbtnid')
									.mouseleave(
											function() {
												var filename = $('#fileid')
														.val()
														.replace(/.*(\/|\\)/,
																'');
												var fType = filename.split(".");
												//alert("fType:"+fType[1]);
												fSize = document
														.getElementById('fileid').files[0].size / 1024; //size in kb
												document
														.getElementById("ftype").innerHTML = "Type: "
														+ fType[1]
														+ ", "
														+ "Size: "
														+ Math.floor(fSize)
														+ "kb";

												//var fv = document.getElementById("fileid").value;
												//document.getElementById("ftxtid").value= fv;
												var url = document
														.getElementById("fileid").value;
												var filename = url.replace(
														/^.*\\/, "");
												document
														.getElementById("ftxtid").value = filename;
											});
						});

		var fSize;
		$(document)
				.ready(
						function() {
							$('#fbtnid1')
									.mouseleave(
											function() {
												var filename = $('#fileid1')
														.val()
														.replace(/.*(\/|\\)/,
																'');
												var fType = filename.split(".");
												//alert("fType:"+fType[1]);
												fSize = document
														.getElementById('fileid1').files[0].size / 1024; //size in kb
												document
														.getElementById("ftype1").innerHTML = "Type: "
														+ fType[1]
														+ ", "
														+ "Size: "
														+ Math.floor(fSize)
														+ "kb";

												//var fv = document.getElementById("fileid1").value;
												//document.getElementById("ftxtid1").value= fv;   
												var url = document
														.getElementById("fileid1").value;
												var filename = url.replace(
														/^.*\\/, "");
												document
														.getElementById("ftxtid1").value = filename;
											});
						});

		var fSize;
		$(document)
				.ready(
						function() {
							$('#fbtnid2')
									.mouseleave(
											function() {
												var filename = $('#fileid2')
														.val()
														.replace(/.*(\/|\\)/,
																'');
												var fType = filename.split(".");
												//alert("fType:"+fType[1]);
												fSize = document
														.getElementById('fileid2').files[0].size / 1024; //size in kb
												document
														.getElementById("ftype2").innerHTML = "Type: "
														+ fType[1]
														+ ", "
														+ "Size: "
														+ Math.floor(fSize)
														+ "kb";

												//var fv = document.getElementById("fileid2").value;
												//document.getElementById("ftxtid2").value= fv;       
												var url = document
														.getElementById("fileid2").value;
												var filename = url.replace(
														/^.*\\/, "");
												document
														.getElementById("ftxtid2").value = filename;
											});
						});

		function resetval() {
			$('#bizUnit').val(0);
			$('#system').val(0);
			$('#recepient').val(0);
			$('#channel').val(0);
			$('#event').val(0);
			$('#fromname').val(0);
			$('#from').val(0);
			$('#replyto').val(0);
			$('#to').val(0);
			$('#cc').val(0);
			$('#bcc').val(0);
			$('#signature').val(0);

			$('#templatename').val('');
			$('#desc').val('');
			$('#subject').val('');
			$('#bodytxt').val('');
			$('#bodytxt').html('');
			
		/* 	$('#namebodytxt').empty();
			$('#namebodytxt')
					.append(
							'<textarea name="bodytxt" style="width:405px;height: 100px;" id="bodytxt" rows="10" class="editor"></textarea>');

			toggleArea1();
			 */
			
			/* $('#editBtext').val('');
			 */

			/* var nicE = new nicEditors.findEditor('bodytxt');
			nicE.setContent(''); */

			document.getElementById('chkDnd').checked = false;
			document.getElementById('chkDisc').checked = false;
			document.getElementById('chkTemp').checked = false;

			document.getElementById("ftype").innerHTML = '';
			$('#fileid').val('');
			$('#ftxtid').val('');
			document.getElementById("ftype1").innerHTML = '';
			$('#fileid1').val('');
			$('#ftxtid1').val('');
			document.getElementById("ftype2").innerHTML = '';
			$('#fileid2').val('');
			$('#ftxtid2').val('');

		}

		function addTemplateRequiredValidation() {

			if (document.getElementById('bizUnit').selectedIndex == 0) {
				alert("Please Select Biz Unit !");
				$("#bizUnit").focus();
				return false;
			}
			if (document.getElementById('system').selectedIndex == 0) {
				alert("Please Select System !");
				$("#system").focus();
				return false;
			}

			if (document.getElementById('recepient').selectedIndex == 0) {
				alert("Please Select Recepient !");
				$("#recepient").focus();
				return false;
			}
			if (document.getElementById('channel').selectedIndex == 0) {
				alert("Please Select Channel !");
				$("#channel").focus();
				return false;
			}
			if (document.getElementById('event').selectedIndex == 0) {
				alert("Please Select Event !");
				$("#event").focus();
				return false;
			}

			var myLength = $("#templatename").val().length;
			var myLength1 = $("#desc").val().length;

		/* 	var data = $('#btext').find('.wysiwyg-editor').text();
			$('#bodytxt').val(data);

			var myLength2 = $("#bodytxt").val().length;  */

			if (myLength > 255) {
				alert('Name max length is 255.You can not enter more Character !');
				$("#templatename").focus();
			}

			if (myLength1 > 255) {
				alert('Description max length is 255.You can not enter more Character !');
				$("#desc").focus();
			}

			if ($('#templatename').val().trim() == "") {
				alert("Please Enter Name !");
				$("#templatename").focus();
				return false;
			}

			var x = document.getElementById("channel");
			var strUser = x.options[x.selectedIndex].value;
			//alert(strUser);

			if (strUser == 32002) {

				if ($('#addquickSearchHiddenTo').val() == '') {
					alert("Please Select To !");
					$("#addquickSearchHiddenTo").focus();
					return false;
				}
				 
				 if ($('#bodytxt').html() == ""
						|| $('#bodytxt').html().trim() == "") {
					alert('please fill Body !');
					return false;
				} 
			} else {
				if ($('#addquickSearchHiddenName').val() == '') {
					alert("Please Select From Email Name !");
					$("#addquickSearchHiddenName").focus();
					return false;
				}
				if ($('#addquickSearchHidden').val() == '') {
					alert("Please Select From Email !");
					$("#addquickSearchHidden").focus();
					return false;
				}
				if ($('#addquickSearchHidden1').val() == '') {
					alert("Please Select Reply To !");
					$("#addquickSearchHidden1").focus();
					return false;
				}

				if ($('#addquickSearchHiddenTo').val() == '') {
					alert("Please Select To !");
					$("#addquickSearchHiddenTo").focus();
					return false;
				}

				if ($('#subject').val().trim() == "") {
					alert("Please Enter Subject !");
					$("#subject").focus();
					return false;

				}

				/* if ($('#bodytxt').val() == ""
						|| $('#bodytxt').val().trim() == "") {
					alert('please fill Body !');
					return false;
				} */

				if ($('#subject').val().trim() == "") {
					alert("Please Enter Subject !");
					$("#subject").focus();
					return false;
				}

			}

			if (document.getElementById('signature').selectedIndex == 0) {
				alert("Please Select Signature !");
				$("#signature").focus();
				return false;
			}

			if (document.getElementById('chkTemp').checked == false) {
				alert("Please Check Active Template !");
				$("#chkTemp").focus();
				return false;
			}

			if ($("#fileid").val() == '' || $("#fileid").val() == null) {
				$("#fileid").val(null);
			}

			if ($("#fileid1").val() == '' || $("#fileid1").val() == null) {
				$("#fileid1").val(null);
			}
			if ($("#fileid2").val() == '' || $("#fileid2").val() == null) {
				$("#fileid2").val(null);
			}

			return true;
		}

		function editTemplateRequiredValidation() {

			if ($('editBizUnit').val() == "") {
				alert("Please Select Biz Unit !");
				$("#editBizUnit").focus();
				return false;
			}
			if ($('editSystem').val() == "") {
				alert("Please Select System !");
				$("#editSystem").focus();
				return false;
			}

			if ($('editRecepient').val() == "") {
				alert("Please Select Recepient !");
				$("#editRecepient").focus();
				return false;
			}
			if ($('editChannel').val() == "") {
				alert("Please Select Channel !");
				$("#editChannel").focus();
				return false;
			}
			if ($('editEvent').val() == "") {
				alert("Please Select Event !");
				$("#editEvent").focus();
				return false;
			}

			
			var myLength = $("#editName").val().length;
			var myLength1 = $("#editDesc").val().length;

			if (myLength > 255) {
				alert('Name max length is 255.You can not enter more Character !');
				$("#editName").focus();
			}

			if (myLength1 > 255) {
				alert('Description max length is 255.You can not enter more Character !');
				$("#editDesc").focus();
			}

			if ($('#editName').val().trim() == "") {
				alert("Please Enter Name !");
				$("#editName").focus();
				return false;
			}

			var x = document.getElementById("editChannel");
			var strUser = x.options[x.selectedIndex].value;

			if (strUser == 32002) {

				if ($('#addquickSearcheditTo').val() == '') {
					alert("Please Select To !");
					$("#addquickSearcheditTo").focus();
					return false;
				}
				 
			} else {
				if ($('#addquickSearcheditTo').val() == "") {
					alert("Please Select To !");
					$("#addquickSearcheditTo").focus();
					return false;
				}

				if ($('#addquickSearcheditFrmEmailName').val() == "") {
					alert("Please Select From Email Name !");
					$("#addquickSearcheditFrmEmailName").focus();
					return false;
				}
				if ($('#addquickSearcheditFromEmail').val() == "") {
					alert("Please Select From Email !");
					$("#addquickSearcheditFromEmail").focus();
					return false;
				}
				if ($('#addquickSearcheditRplTo').val() == "") {
					alert("Please Select Reply To !");
					$("#addquickSearcheditRplTo").focus();
					return false;
				}
				if ($('#editSubject').val().trim() == "") {
					alert("Please Enter Subject !");
					$("#editSubject").focus();
					return false;
				}
			}

			if ($('editSignature').val() == "") {
				alert("Please Select Signature !");
				$("#editSignature").focus();
				return false;
			}

			return true;
		}

		function submitAdd(isToClose) {
			
			$('#hiddenIsToClose').val(isToClose);
			checkPopup = isToClose;
		
			
			
		/* 	$('#hiddenIsToClose').val(isToClose); */
		
		var data = $('#bodytxt').html();
				$('#hdnAddBodytext').val(data); 
			 $('#editBodytext').html(data.replace(/&lt;/g, "<").replace(/&gt;/g, ">")); 
				
			

			if (addTemplateRequiredValidation() == true) {
				var form = document.getElementById('addForm');
				form.submit(1);
				/* alert("Record Added Successfully !"); */
				 
				
				if(checkPopup == 0){    
					 bootbox.dialog({
							message: "<span class='bigger-110'>Record saved successfully !</span>",
							buttons: 			
							{
								"click" :
								{
									"label" : "OK!",
									"className" : "btn-sm btn-primary",
									"callback": function() {
									//	 location.reload();
									//	 document.getElementById("addForm").reset();	
									}
								}
							}
						});  
					 
					 document.getElementById("addForm").reset();	   
				} 
				if(checkPopup == 1){
					$("#addnote").hide();
					 bootbox.dialog({
							message: "<span class='bigger-110'>Record saved successfully !</span>",
							buttons: 			
							{
								"click" :
								{
									"label" : "OK!",
									"className" : "btn-sm btn-primary",
									"callback": function() {
										 location.reload(); 
										 document.getElementById("addForm").reset();	
									}
								} 
							}
						});

				}
				
				
			}

		}

		$(document).ready(function() {
			if ($('#hiddenIsToClose').val() == "0") {
				addNote();
				popup('popUpAlertaddnote');

			}

		});

		
 
		

		function submitEditDownload123(isToClose) {

			var documentIdd = $('#hdndocumentId').val();
			//alert('hi'+documentIdd); 
			var fileName = $('#editftxtid').val();
			$.ajax({
				type : "GET",
				url : $('#contextPath').val()
						+ "/download/getFileName.htm?hdndocumentIdd="
						+ documentIdd + "&editftxtid=" + fileName,
				dataType : 'json',
				async : false,
				contentType : 'application/json',
				success : function(result) {

					if (result == 1) {

						alert("Role Name Already Exist");
						$('#hdndocumentId').val('');
						return true;

					}
				}

			});

			$('#hiddenEditIsToClose').val(isToClose);
			var formEdit = document.getElementById('myFormEdit');
			formEdit.submit();

		}

		function submitEditDownload(isToClose) {
		
			  
			  var data = $('#editBodytext').html();
				$('#hdnBodytext').val(data); 
			 
			
			 
			if (document.getElementById('editchkDnd').checked) {
				x = $("#editchkDnd").val(true);
			} else {
				x = $("#editchkDnd").val(false);
			}

			if (document.getElementById('editchkDisc').checked) {
				x = $("#editchkDisc").val(true);
			} else {
				x = $("#editchkDisc").val(false);

			}

			/* $('#hiddenEditIsToClose').val(isToClose); */
			if (editTemplateRequiredValidation() == true) {
				
				/* alert('Update Successfully!'); */
				 var formEdit = document.getElementById('myFormEdit');
					formEdit.submit(1);
				/* $("#editnote").hide();    */
		    	 bootbox.dialog({
						message: "<span class='bigger-110'>Record updated successfully !</span>",
						buttons:  			
						{
							"click" :
							{
								"label" : "OK!",
								"className" : "btn-sm btn-primary",
								"callback": function() {
								 location.reload();
									/* document.getElementById("myFormEdit").reset();	 */
								}
							}
						}
				});
		    	
			}

		}

		function sendToEdit(notifyTemplateID, eventid,bizunit, buid, system, recepient,
				channel, event, partyID, name, description, sourceSystemID,
				notifyTargetID, deliveryChannelID, useSignatureID, codeValue,
				useSignature, isAddDisc, isAddDND, notifyTypeID, notifyEventID,
				fromm) {  
			  
			/* var Bodytext=$('#textarea'+notifyTemplateID).html();
			console.log('description:-----'+Bodytext); 
			
			$('#editBodytext').html(description.replace(/&lt;/g, "<").replace(/&gt;/g, ">")); */
			
			//alert(eventid+'<<<notifyEventID')  ;   
			
			var data = $('#editBodytext').html();
			$('#hdnBodytext').val(data);
			
			$('#editBizUnit').empty(); 
			editBizUnit1(buid);
  
			$('#editSystem').empty();
			editSystem1(notifyTypeID);

			$('#editRecepient').empty();
			editRecepient1(notifyTargetID);

			$('#editChannel').empty();
			$('#editChannel').append(
					'<option value="'+deliveryChannelID+'">' + channel
							+ '</option>');
			
			$('#editEvent').empty();
			$('#editEvent').append(
					'<option value="'+eventid+'">' + event + '</option>'); 

			$('#editSignature').empty();
			editSignature1(useSignatureID);
			
			
			$('#editName').val(name);
			$('#editDesc').val(description);

			$('#eventIdEdit').val(notifyTemplateID);
			
			
			/* var value1 = nicEditors.findEditor("bodytxt").getContent(); 
			$('#editBtext').val(value1); */
			
			/* var data = $('#btext').find('.nicEdit-main').text();
			$('#editBtext').val(data); */

			/* var myLength2 = $("#bodytxt").val().length; */
			
			
			 
			if (isAddDisc != 'false') {
				document.getElementById("editchkDisc").checked = true;
			} else {
				document.getElementById("editchkDisc").checked = false;
			}

			if (isAddDND != 'false') {
				document.getElementById("editchkDnd").checked = true;
			} else {
				document.getElementById("editchkDnd").checked = false;
			}  

			/* $('#editnote').modal('show');   */
			
			/*  $("#editnote").modal({
			     backdrop: 'static',
			     keyboard: false
			 }); */

		}  

		function editBizUnit1(buid) {

			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/notifytemplate/getBizUnitSection.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					$(result).each(

							function(i, obj) {

								var module = obj.lastname;
								var moduleid = obj.buid;

								if (buid == moduleid) {
									$('#editBizUnit').append(
											'<option value="'+moduleid+'" selected = "selected">'
													+ module + '</option>');
								} else {
									$('#editBizUnit').append(
											'<option value="'+moduleid+'">'
													+ module + '</option>');
								}

							});

				}

			});

		}

		function editSystem1(notifyTypeID) {

			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/notifytemplate/getSystemSection.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					$(result).each(

							function(i, obj) {

								var module = obj.codeValue;
								var moduleid = obj.codeValueID;
								if (notifyTypeID == moduleid) {
									$('#editSystem').append(
											'<option value="'+moduleid+'" selected="selected">'
													+ module + '</option>');
								} else {
									$('#editSystem').append(
											'<option value="'+moduleid+'">'
													+ module + '</option>');
								}

							});

				}

			});

		}

		function editRecepient1(notifyTargetID) {

			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/notifytemplate/getRecepientSection.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					$(result).each(

							function(i, obj) {

								var module = obj.codeValue;
								var moduleid = obj.codeValueID;
								if (notifyTargetID == moduleid) {
									$('#editRecepient').append(
											'<option value="'+moduleid+'" selected="selected">'
													+ module + '</option>');
								} else {
									$('#editRecepient').append(
											'<option value="'+moduleid+'">'
													+ module + '</option>');
								}

							});

				}

			});

		}  

		function editChannel1() {
			//$('#editChannel').empty();
			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/notifytemplate/getChannelSection.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					$(result).each(

							function(i, obj) {

								var module = obj.codeValue;
								var moduleid = obj.codeValueID;

								$('#editChannel').append(
										'<option value="'+moduleid+'">'
												+ module + '</option>');

							});

				}

			});

		}

		function editEvent1() {
					    
			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/notifytemplate/getEventSection.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					$(result).each( 

							function(i, obj) {

								var module = obj.eventname;
								var moduleid = obj.eventid;
								
								  $('#editEvent').append(
							              '<option  value="'+moduleid+'">'
							                + module.substr(0,36)      
							                + '</option>');

							           });

								/* $('#editEvent').append(
										'<option value="'+moduleid+'">'
												+ module + '</option>');

							});
                             */
				}

			});

		}

		function editSignature1(useSignatureID) {

			$('#editSignature').empty();

			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/notifytemplate/getSignSection.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					$(result).each(

							function(i, obj) {

								var module = obj.codeValue;
								var moduleid = obj.codeValueID;

								if (useSignatureID == moduleid) {
									$('#editSignature').append(
											'<option value="'+moduleid+'" selected="selected">'
													+ module + '</option>');
								} else {
									$('#editSignature').append(
											'<option value="'+moduleid+'">'
													+ module + '</option>');
								}

							});

				}

			});
 
		}    
 
		function addquickSearcheditFrmEmailNm(e) {

			var event = window.event ? window.event : e;
			//alert(event.keyCode);           

			if (event.keyCode == 37 || event.keyCode == 38
					|| event.keyCode == 39 || event.keyCode == 40)
				return;
			if (event.keyCode == 13) {
				search();
				return;
			} 
			$('#common_popup_div,#shadow_div_web_app').remove();
			$('.ui-autocomplete').css('z-index', '9999999999999999');
			//alert("searchString="+$('#addquickSearch').val());
			var str = $('#addquickSearcheditFrmEmailName').val();
			var arr = extractLast(str);
			//alert(arr);
			$ 
					.ajax({
						method : "post",
						url : $('#contextPath').val()
								+ "/notifytemplate/getNameSection.htm?searchString="
								+ arr,

						success : function(result) {

							//alert(result);
							var userLabelValueList = new Array();
							$(result).each(function(i, obj) {
								var object = {};
								object.value = obj.codeValueID;

								object.label = obj.codeValue;
								userLabelValueList.push(object);
								/* 	alert("Hello:::::"+ obj.partyID);
									alert("Hi:::::::::"+obj.partnerName); */

							});
							//			 alert("object.label:::"+  object.label);
							$("#addquickSearcheditFrmEmailName")
									// don't navigate away from the field on tab when selecting an item
									.bind(
											"keydown",
											function(event) {
												if (event.keyCode === $.ui.keyCode.TAB
														&& $(this)
																.data(
																		"ui-autocomplete").menu.active) {
													event.preventDefault();
												}
											})

									.autocomplete(
											{
												minLength : 0,
												source : function(request,
														response) {
													last = extractLast(request.term);
													if (last == null
															|| last == ''
															|| last == ' ') {
														return false;
													}

													response($.ui.autocomplete
															.filter(
																	userLabelValueList,
																	extractLast(request.term)));
												},
												focus : function() {
													// prevent value inserted on focus
													return false;
												},

												select : function(event, ui) {
													var terms = split(this.value);

													//console.log('terms='+terms);

													// remove the current input
													terms.pop();
													// add the selected item  
													terms.push(ui.item.label);
													//partyId=ui.item.value; 
													$(
															'#addquickSearchHiddeneditFrmEmailName')
															.val(ui.item.value)
													//alert( $('#addquickSearchHiddeneditFrmEmailName').val())
													terms.push("");

													/*  var labelArr = $(this).data('label') || new Array();
													    labelArr.push(ui.item);
													    $(this).data('label',labelArr);
													    console.log($(this).data());
													 */
													this.value = terms
															.join("; ");

													return false;
												}

											});

						}
					});

		}

		function editFromEmail() {

			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/notifytemplate/getEmailSection.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					//$('#editFrmEmail').empty();          
					//$('#editFrmEmail').append('<option value="0">--Select--</option>'); 

					$(result).each(

							function(i, obj) {

								var module = obj.codeValue;
								var moduleid = obj.codeValueID;

								$('#editFrmEmail').append(
										'<option value="'+module+'">' + module
												+ '</option>');

							});

				}

			});

		}

		function addquickSearcheditFrmEmail(e) {

			var event = window.event ? window.event : e;
			//alert(event.keyCode);      

			if (event.keyCode == 37 || event.keyCode == 38
					|| event.keyCode == 39 || event.keyCode == 40)
				return;
			if (event.keyCode == 13) {
				search();
				return;
			}
			$('#common_popup_div,#shadow_div_web_app').remove();
			$('.ui-autocomplete').css('z-index', '9999999999999999');
			//alert("searchString="+$('#addquickSearch').val());
			var str = $('#addquickSearcheditFromEmail').val();
			var arr = extractLast(str);
			//alert(arr);
			$
					.ajax({
						method : "post",
						url : $('#contextPath').val()
								+ "/notifytemplate/getEmailSection.htm?searchString="
								+ arr,

						success : function(result) {

							//alert(result);
							var userLabelValueList = new Array();
							$(result).each(function(i, obj) {
								var object = {};
								object.value = obj.codeValueID;

								object.label = obj.codeValue;
								userLabelValueList.push(object);
								/* 	alert("Hello:::::"+ obj.partyID);
									alert("Hi:::::::::"+obj.partnerName); */

							});
							//			 alert("object.label:::"+  object.label);
							$("#addquickSearcheditFromEmail")
									// don't navigate away from the field on tab when selecting an item
									.bind(
											"keydown",
											function(event) {
												if (event.keyCode === $.ui.keyCode.TAB
														&& $(this)
																.data(
																		"ui-autocomplete").menu.active) {
													event.preventDefault();
												}
											})

									.autocomplete(
											{
												minLength : 0,
												source : function(request,
														response) {
													last = extractLast(request.term);
													if (last == null
															|| last == ''
															|| last == ' ') {
														return false;
													}

													response($.ui.autocomplete
															.filter(
																	userLabelValueList,
																	extractLast(request.term)));
												},
												focus : function() {
													// prevent value inserted on focus
													return false;
												},

												select : function(event, ui) {
													var terms = split(this.value);

													//console.log('terms='+terms);

													// remove the current input
													terms.pop();
													// add the selected item 
													terms.push(ui.item.label);
													//				        	partyId=ui.item.value;
													$(
															'#addquickSearchHiddeneditFromEmail')
															.val(ui.item.value)
													//alert( $('#addquickSearchHiddeneditFromEmail').val())
													terms.push("");

													/*  var labelArr = $(this).data('label') || new Array();
													    labelArr.push(ui.item);
													    $(this).data('label',labelArr);
													    console.log($(this).data());
													 */
													this.value = terms
															.join("; ");

													return false;
												}

											});

						}
					});

		}

		function editReplyTo1() {

			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/notifytemplate/getEmailSection.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					$(result).each(

							function(i, obj) {

								var module = obj.codeValue;
								var moduleid = obj.codeValueID;

								$('#editReplyTo').append(
										'<option value="'+module+'">' + module
												+ '</option>');

							})

				}

			});

		}

		function addquickSearcheditReplyTo(e) {

			var event = window.event ? window.event : e;
			//alert(event.keyCode);      

			if (event.keyCode == 37 || event.keyCode == 38
					|| event.keyCode == 39 || event.keyCode == 40)
				return;
			if (event.keyCode == 13) {
				search();
				return;
			}
			$('#common_popup_div,#shadow_div_web_app').remove();
			$('.ui-autocomplete').css('z-index', '9999999999999999');
			//alert("searchString="+$('#addquickSearch').val());
			var str = $('#addquickSearcheditRplTo').val();
			var arr = extractLast(str);
			//alert(arr);
			$
					.ajax({
						method : "post",
						url : $('#contextPath').val()
								+ "/notifytemplate/getEmailSection.htm?searchString="
								+ arr,

						success : function(result) {

							//alert(result);
							var userLabelValueList = new Array();
							$(result).each(function(i, obj) {
								var object = {};
								object.value = obj.codeValueID;

								object.label = obj.codeValue;
								userLabelValueList.push(object);
								/* 	alert("Hello:::::"+ obj.partyID);
									alert("Hi:::::::::"+obj.partnerName); */

							});
							//			 alert("object.label:::"+  object.label);
							$("#addquickSearcheditRplTo")
									// don't navigate away from the field on tab when selecting an item
									.bind(
											"keydown",
											function(event) {
												if (event.keyCode === $.ui.keyCode.TAB
														&& $(this)
																.data(
																		"ui-autocomplete").menu.active) {
													event.preventDefault();
												}
											}) 

									.autocomplete(
											{
												minLength : 0,
												source : function(request,
														response) {
													last = extractLast(request.term);
													if (last == null
															|| last == ''
															|| last == ' ') {
														return false;
													} 

													response($.ui.autocomplete
															.filter(
																	userLabelValueList,
																	extractLast(request.term)));
												},
												focus : function() {
													// prevent value inserted on focus
													return false;
												},

												select : function(event, ui) {
													var terms = split(this.value);

													//console.log('terms='+terms);

													// remove the current input
													terms.pop();
													// add the selected item 
													terms.push(ui.item.label);
													//				        	partyId=ui.item.value;
													$(
															'#addquickSearchHiddeneditRplTo')
															.val(ui.item.value)
													//alert( $('#addquickSearchHiddeneditRplTo').val())
													terms.push("");

													/*  var labelArr = $(this).data('label') || new Array();
													    labelArr.push(ui.item);
													    $(this).data('label',labelArr);
													    console.log($(this).data());
													 */
													this.value = terms
															.join("; ");

													return false;
												}

											});

						}
					});

		}

		function editTo1() {

			var codeValues = '';
			var codeValuesForTo = [];

			//alert('hi phoneemail'); 
			var x = document.getElementById("editChannel");
			var strUser = x.options[x.selectedIndex].value;
			//alert(strUser); 
			var slvals;
			if (strUser == 32002) {

				slvals = "Phone";
				//alert(slvals);  
			} else {

				slvals = "Email";
				//alert(slvals);
			}

			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ "/notifytemplate/getEmailPhoneSection.htm?channel="
						+ slvals,
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					/* $('#editTo').empty();  */
					//$('#editTo').append('<option value="0">--Select--</option>');
					$(result).each(
 
							function(i, obj) {

								var module = obj.codeValue;
								var moduleid = obj.codeValueID;

								$('#editTo').append(  
										'<option value="'+module+'">' + module
												+ '</option>');
								/* var codeValuesForTo = { 
									values : $.parseJSON(result.d)
								}; commented by suvarna  */
								//alert(codeValuesForTo);         

							});

				}
			});

		}

		function addquickSearcheditTo1(e) {

			var event = window.event ? window.event : e;
			//alert(event.keyCode);      

			if (event.keyCode == 37 || event.keyCode == 38
					|| event.keyCode == 39 || event.keyCode == 40)
				return;
			if (event.keyCode == 13) {
				search();
				return;
			}
			$('#common_popup_div,#shadow_div_web_app').remove();
			$('.ui-autocomplete').css('z-index', '9999999999999999');
			//alert("searchString="+$('#addquickSearch').val());
			var str = $('#addquickSearcheditTo').val();
			var arr = extractLast(str);
			//alert(arr);

			var codeValues = '';
			var codeValuesForTo = [];

			//alert('hi phoneemail'); 
			var x = document.getElementById("editChannel");
			var strUser = x.options[x.selectedIndex].value;
			//alert(strUser);
			var slvals;
			if (strUser == 32002) {

				slvals = "Phone";
				//alert(slvals);
			} else {

				slvals = "Email";
				//alert(slvals);
			}

			$
					.ajax({
						method : "post",
						//url: $('#contextPath').val()+"/notifytemplate/getNameSection.htm?searchString="+arr,     
						url : $('#contextPath').val()
								+ "/notifytemplate/getEmailPhoneSection.htm?channel="
								+ slvals + "&searchString=" + arr,
						success : function(result) {

							//alert(result);
							var userLabelValueList = new Array();
							$(result).each(function(i, obj) {
								var object = {};
								object.value = obj.codeValueID;

								object.label = obj.codeValue;
								userLabelValueList.push(object);
								/* 	alert("Hello:::::"+ obj.partyID);
									alert("Hi:::::::::"+obj.partnerName); */

							});
							//			 alert("object.label:::"+  object.label);
							$("#addquickSearcheditTo")
									// don't navigate away from the field on tab when selecting an item
									.bind(
											"keydown",
											function(event) {
												if (event.keyCode === $.ui.keyCode.TAB
														&& $(this)
																.data(
																		"ui-autocomplete").menu.active) {
													event.preventDefault();
												}
											})

									.autocomplete(
											{
												minLength : 0,
												source : function(request,
														response) {
													last = extractLast(request.term);
													if (last == null
															|| last == ''
															|| last == ' ') {
														return false;
													}

													response($.ui.autocomplete
															.filter(
																	userLabelValueList,
																	extractLast(request.term)));
												},
												focus : function() {
													// prevent value inserted on focus
													return false;
												},

												select : function(event, ui) {
													var terms = split(this.value);

													//console.log('terms='+terms);

													// remove the current input
													terms.pop();
													// add the selected item 
													terms.push(ui.item.label);
													//				        	partyId=ui.item.value; 
													$(
															'#addquickSearchHiddeneditTo')
															.val(ui.item.value)
													//alert( $('#addquickSearchHiddeneditTo').val())
													terms.push("");

													/*  var labelArr = $(this).data('label') || new Array();
													    labelArr.push(ui.item);
													    $(this).data('label',labelArr);
													    console.log($(this).data());
													 */
													this.value = terms
															.join("; ");

													return false;
												}

											});

						}
					});

		}

		function editCc1() {

			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/notifytemplate/getEmailSection.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					$(result).each(

							function(i, obj) {

								var module = obj.codeValue;
								var moduleid = obj.codeValueID;

								$('#editCc').append(
										'<option value="'+module+'">' + module
												+ '</option>');

							});

				}

			});

		}

		function addquickSearcheditCc1(e) {

			var event = window.event ? window.event : e;
			//alert(event.keyCode);      

			if (event.keyCode == 37 || event.keyCode == 38
					|| event.keyCode == 39 || event.keyCode == 40)
				return;
			if (event.keyCode == 13) {
				search();
				return;
			}
			$('#common_popup_div,#shadow_div_web_app').remove();
			$('.ui-autocomplete').css('z-index', '9999999999999999');
			//alert("searchString="+$('#addquickSearch').val());
			var str = $('#addquickSearcheditCc').val();
			var arr = extractLast(str);
			//alert(arr);
			$
					.ajax({
						method : "post",
						url : $('#contextPath').val()
								+ "/notifytemplate/getEmailSection.htm?searchString="
								+ arr,

						success : function(result) {

							//alert(result);
							var userLabelValueList = new Array();
							$(result).each(function(i, obj) {
								var object = {};
								object.value = obj.codeValueID;

								object.label = obj.codeValue;
								userLabelValueList.push(object);
								/* 	alert("Hello:::::"+ obj.partyID);
									alert("Hi:::::::::"+obj.partnerName); */

							});
							//			 alert("object.label:::"+  object.label);
							$("#addquickSearcheditCc")
									// don't navigate away from the field on tab when selecting an item
									.bind(
											"keydown",
											function(event) {
												if (event.keyCode === $.ui.keyCode.TAB
														&& $(this)
																.data(
																		"ui-autocomplete").menu.active) {
													event.preventDefault();
												}
											})

									.autocomplete(
											{
												minLength : 0,
												source : function(request,
														response) {
													last = extractLast(request.term);
													if (last == null
															|| last == ''
															|| last == ' ') {
														return false;
													}

													response($.ui.autocomplete
															.filter(
																	userLabelValueList,
																	extractLast(request.term)));
												},
												focus : function() {
													// prevent value inserted on focus
													return false;
												},

												select : function(event, ui) {
													var terms = split(this.value);

													//console.log('terms='+terms);

													// remove the current input
													terms.pop();
													// add the selected item 
													terms.push(ui.item.label);
													//				        	partyId=ui.item.value;
													$(
															'#addquickSearchHiddeneditCc')
															.val(ui.item.value)
													//alert( $('#addquickSearchHiddeneditCc').val())
													terms.push("");

													/*  var labelArr = $(this).data('label') || new Array();
													    labelArr.push(ui.item);
													    $(this).data('label',labelArr);
													    console.log($(this).data());
													 */
													this.value = terms
															.join("; ");

													return false;
												}

											});

						}
					});

		}

		function editBcc1() {

			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/notifytemplate/getEmailSection.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					$(result).each(

							function(i, obj) {

								var module = obj.codeValue;
								var moduleid = obj.codeValueID;

								$('#editBcc').append(
										'<option value="'+module+'">' + module
												+ '</option>');

							});

				}

			});

		}

		function addquickSearcheditBcc1(e) {

			var event = window.event ? window.event : e;
			//alert(event.keyCode);      

			if (event.keyCode == 37 || event.keyCode == 38
					|| event.keyCode == 39 || event.keyCode == 40)
				return;
			if (event.keyCode == 13) {
				search();
				return;
			}
			$('#common_popup_div,#shadow_div_web_app').remove();
			$('.ui-autocomplete').css('z-index', '9999999999999999');
			//alert("searchString="+$('#addquickSearch').val());
			var str = $('#addquickSearcheditBcc').val();
			var arr = extractLast(str);
			//alert(arr);
			$
					.ajax({
						method : "post",
						url : $('#contextPath').val()
								+ "/notifytemplate/getEmailSection.htm?searchString="
								+ arr,

						success : function(result) {

							//alert(result);
							var userLabelValueList = new Array();
							$(result).each(function(i, obj) {
								var object = {};
								object.value = obj.codeValueID;

								object.label = obj.codeValue;
								userLabelValueList.push(object);
								/* 	alert("Hello:::::"+ obj.partyID);
									alert("Hi:::::::::"+obj.partnerName); */

							});
							//			 alert("object.label:::"+  object.label);
							$("#addquickSearcheditBcc")
									// don't navigate away from the field on tab when selecting an item
									.bind(
											"keydown",
											function(event) {
												if (event.keyCode === $.ui.keyCode.TAB
														&& $(this)
																.data(
																		"ui-autocomplete").menu.active) {
													event.preventDefault();
												}
											})

									.autocomplete(
											{
												minLength : 0,
												source : function(request,
														response) {
													last = extractLast(request.term);
													if (last == null
															|| last == ''
															|| last == ' ') {
														return false;
													}

													response($.ui.autocomplete
															.filter(
																	userLabelValueList,
																	extractLast(request.term)));
												},
												focus : function() {
													// prevent value inserted on focus
													return false;
												},

												select : function(event, ui) {
													var terms = split(this.value);

													//console.log('terms='+terms);

													// remove the current input
													terms.pop();
													// add the selected item 
													terms.push(ui.item.label);
													//				        	partyId=ui.item.value;
													$(
															'#addquickSearchHiddeneditBcc')
															.val(ui.item.value)
													//alert( $('#addquickSearchHiddeneditBcc').val())
													terms.push("");

													/*  var labelArr = $(this).data('label') || new Array();
													    labelArr.push(ui.item);
													    $(this).data('label',labelArr);
													    console.log($(this).data());
													 */
													this.value = terms
															.join("; ");

													return false;
												}

											});

						}
					});

		}

		function showSelecteditTo() {
			var selO = document.getElementsByName('editTo')[0];
			var selValueseditTo = [];
			for (i = 0; i < selO.length; i++) {
				if (selO.options[i].selected) {
					selValueseditTo.push(selO.options[i].value);
				}
			}

			$('#hdneditTo').val(selValueseditTo);
		}

		function showSelecteditCc() {
			var selO = document.getElementsByName('editCc')[0];
			var selValueseditCc = [];
			for (i = 0; i < selO.length; i++) {
				if (selO.options[i].selected) {
					selValueseditCc.push(selO.options[i].value);
				}
			}

			$('#hdneditCc').val(selValueseditCc);

		}

		function showSelecteditBcc() {
			var selO = document.getElementsByName('editBcc')[0];
			var selValueseditBcc = [];
			for (i = 0; i < selO.length; i++) {
				if (selO.options[i].selected) {
					selValueseditBcc.push(selO.options[i].value);
				}
			}

			$('#hdneditBcc').val(selValueseditBcc);

		}

		function showSelecteditFrmEmail() {

			var selO = document.getElementsByName('editFrmEmail')[0];
			var selValueseditFrmEmail = [];
			for (i = 0; i < selO.length; i++) {
				if (selO.options[i].selected) {
					selValueseditFrmEmail.push(selO.options[i].value);
				}
			}

			$('#hdneditFrmEmail').val(selValueseditFrmEmail);

		}

		function makeEnableDisable() {
			//alert('hi'); 
			var x = document.getElementById("channel");
			var strUser = x.options[x.selectedIndex].value;
			//alert(strUser);

			if (strUser == 32002) {
				document.getElementById("Email1").style.display = 'none';
				document.getElementById("Email2").style.display = 'none';
				document.getElementById("IncludeText").style.display = 'none';
				document.getElementById("txtBodyDiv").style.display = "";

			} else {
				document.getElementById("Email1").style.display = 'block';
				document.getElementById("Email2").style.display = 'block';
				document.getElementById("IncludeText").style.display = 'block';
				document.getElementById("txtBodyDiv").style.display = "";
			}

		}

		function makeEnableDisable1() {
			//alert('hi IN EDIT'); 
			var x = document.getElementById("editChannel");
			var strUser = x.options[x.selectedIndex].value;
			//alert(strUser);

			if (strUser == 32002) {
				document.getElementById("editEmail1").style.display = 'none';
				document.getElementById("editEmail2").style.display = 'none';
				document.getElementById("EditIncludeText").style.display = 'none';
			} else {
				document.getElementById("editEmail1").style.display = 'block';
				document.getElementById("editEmail2").style.display = 'block';
				document.getElementById("EditIncludeText").style.display = 'block';
			}

		}

		$('#addquickSearchName').blur(function() {
			if ($('#addquickSearchName').val().match(/[^a-zA-Z{!}; ]/g)) {
				this.value = this.value.replace(/[^a-zA-Z{!}; ]/g, '');
			}
		});
	</script>


<script type="text/javascript">
     
  var grid_data=${templateList};  
 
  index=grid_data; 
   
/*   index=JSON.parse(grid_data);  */
  

var subgrid_data =    
[
 {id:"1", name:"sub grid item 1", qty: 11},
 {id:"2", name:"sub grid item 2", qty: 3},
 {id:"3", name:"sub grid item 3", qty: 12},
 {id:"4", name:"sub grid item 4", qty: 5},
 {id:"5", name:"sub grid item 5", qty: 2},
 {id:"6", name:"sub grid item 6", qty: 9},  
 {id:"7", name:"sub grid item 7", qty: 3},
 {id:"8", name:"sub grid item 8", qty: 8} 
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
		height: 300,
		ignoreCase: true,
		
		colNames:[' ',' ','Biz Unit','System','Recipient','Channel','Event','Is Active?'],
		colModel:[    
 
					
			{name:'notifyTemplateID',index:'notifyTemplateID',width:50,formatter:function(cellvalue, options,rowObject) { 
			return '<textarea id="textarea'+rowObject.id+'" class="hide">'+rowObject.Bodytext+'</textarea><a href="#" onclick="sendToEdit('+rowObject.notifyTemplateID+',\''+rowObject.eventid+'\',\''+rowObject.bizunit+'\',\''+rowObject.buid+'\',\''+rowObject.system+'\',\''+rowObject.recepient+'\',\''+rowObject.channel+'\',\''+rowObject.event+'\',\''+rowObject.partyID+'\',\''+rowObject.name+'\',\''+rowObject.description+'\',\''+rowObject.sourceSystemID+'\',\''+rowObject.notifyTargetID+'\',\''+rowObject.deliveryChannelID+'\',\''+rowObject.useSignatureID+'\',\''+rowObject.isAddDiscl+'\',\''+rowObject.isAddDND+'\',\''+rowObject.notifyTypeID+'\',\''+rowObject.fromm+'\');editNote();editEvent1();editTo1();makeEnableDisable1();xmlDisplay();" id="'+rowObject.notifyTemplateID+'"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';
			}},       
		          
			{name:'checkbox',width:50, sortable:false,formatter:function(cellvalue, options,rowObject) {
			    return '<input role="checkbox" type="checkbox"  class="cbox" value="'+rowObject.notifyTemplateID+'" id="chkToDeletetemplateId" name="chkToDeletetemplateId">';
			}},                   
			    
   
			{name:'bizunit',index:'bizunit'},     
			{name:'system',index:'system',width:200},  
			{name:'recepient',index:'recepient',width:200},
			{name:'channel',index:'channel',width:150},
			{name:'event',index:'event',width:250}, 
			{name:'isActive', index:'isActive',width:100,formatter:function(cellvalue, options,rowObject) {
		         	  	    
			    if(rowObject.isActive==true)         
			    	return '<span  class="label label-success";>'+"Active"+'</span>';
			    else
			    	return '<span class="label label-danger";>'+"InActive"+'</span>'; 
			      
			}},
			     
			  
		],         
 
		viewrecords : true,
		rowNum:10, 
		rowList:[10,20,50],
		pager : pager_selector,
		altRows: true,
		//toppager: true,
		
		//multiselect: true,
		//multikey: "ctrlKey",
        multiboxonly: true,

		loadComplete : function() {
			var table = this;
			setTimeout(function(){
				styleCheckbox(table);
				if($('#selectAll').attr('id')==undefined)
				$('#jqgh_grid-table_checkbox').before('<br/><input  type="checkbox" id="selectAll">');
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
			        $('#selectAll').checked = true;
			    });
				
			}, 0); 
			
		}, 

		editurl: "/dummy.html",//nothing is saved
		//caption: "jqGrid with inline editing"

		autowidth: true,
        //shrinkToFit:false,	


		 

	});
	$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
	
	

	

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

$(document).ready(function(){
//	makeEditor('hBodytext,#bodytxt');
	makeEditor('bodytxt,#editBodytext');
//	makeEditor('hAddBodytext,#editBtext');
}); 
 

function openActionPopup(notifyTemplateID,pingOwner,active,name,favouriteTemplate){
	//alert(notifyTemplateID);
	$('#notifyTemplateIdHidden').val(notifyTemplateID);
	$('#notifyTemplateNameHidden').val(name);
	if(pingOwner=='Partner'){
		if(active=='true'){
			$('#suspendrow').removeClass('hide');
			$('#reactivaterow').attr('class','hide');
		}else{
			$('#reactivaterow').removeClass('hide');
			$('#suspendrow').attr('class','hide');
		}  
	} 
	$('#ScheduleRow').removeClass('hide');
	$('#DeliveryHistoryRow').removeClass('hide');
	$('#CloneRow').removeClass('hide');
	$('#ScheduleLink a').attr('href','${pageContext.request.contextPath}/addNewSchedulePing.htm?notifyTemplateID_P='+notifyTemplateID);
	$('#DeliveryHistoryLink a').attr('href','${pageContext.request.contextPath}/ping/getDelivaryHistory.htm?notifyTemplateId='+notifyTemplateID);
	if(favouriteTemplate!=1){
		$('#MarkasFavouriteRow').removeClass('hide');  
		$('#UnMarkasFavouriteRow').attr('class','hide');
	}else{
		$('#UnMarkasFavouriteRow').removeClass('hide');
		$('#MarkasFavouriteRow').attr('class','hide');
	} 
	$( ".action_dialog" ).removeClass('hide').dialog({ 
		resizable: false,
		modal: true,
        width: "auto",
	});
	
}
	
	/* var area1 = $('#bodytxt').val('');
	function toggleArea1() {
		try {
			area1.removeInstance('bodytxt');
		} catch (e) {

		}
		area1 = null;
	
       } */

 
/* function viewStatusUrl(){
	alert('in view url');
	 var viewstatus=$('#bizUnitForList').val(); 
	 document.getElementById("viewStatus").value =viewstatus;
	 document.getElementById("abc").submit();
}; */
	
 
 

 
 
 
 
</script>


</body>
</html>