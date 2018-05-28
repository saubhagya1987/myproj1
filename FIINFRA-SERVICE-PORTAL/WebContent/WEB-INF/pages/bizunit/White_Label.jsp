<%@page import="in.fiinfra.common.service.vo.BizUnit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.*"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@page import="in.fiinfra.common.service.vo.BizUnit"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>View User Profile- White Label</title>


 <%
  	String photoPath = null;
	String logoPath = null;
  	UserSession userSession = (UserSession) request.getSession().getAttribute("userSession"); 
  	if(userSession != null){
  		photoPath = userSession.getPhoto();
  		logoPath = userSession.getLogo();
  	}
  	%>






<script type="text/javascript">


	



	function getColorList() 
	{
//alert("hi");
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()
					+ '/faq/getPicklistValues.htm?codeTypeIds=92',
			dataType : 'json',
			contentType : 'application/json',
			success : function(result) {
				$('#themes').empty();

				$(result).each(
						function(i, obj) {

							var module = obj.codeValue;
							var modulename = obj.codeValueId;
							$('#themes').append(
									'<option value="'+ modulename  +'">'
											+ module + '</option>');
						});

			}

		});
	}

	function reload() {
		location.reload();
	}
	function reemailDetail() {

		document.getElementById("emailid").readOnly = false;
		document.getElementById("emailname").readOnly = false;
		$('#btn_email_s').show();
		$('#btn_email_c').show();
		
		
	}
function validemails()
{
	  if ( $('#emailname').val().trim()=="") 
	  {
			 alert("Please Enter Email Comman Name.");
			 $('#emailname').val('');
			 $('#emailname').focus();
	         return false;
	     } 
	  if ( $('#emailid').val().trim()=="") 
	  {
			 alert("Please Enter Emailid.");
			 $('#emailid').val('');
			 $('#emailid').focus();
	         return false;
	     } 
	  if(editvalidEmail()==false)
		  {

			 alert("Please Enter Valid Emailid.");
			 $('#emailid').val('');
			 $('#emailid').focus();
	         return false;
		  }
	  return true;
	  
	  
}
function editvalidEmail() 
{
//	alert('in');
    
    var filter =/^([a-z0-9_\-\.])+\@([a-z0-9_\-\.])+\.([a-z]{2,4})$/;
    
    if (filter.test($('#emailid').val())) 
    {
    //	alert('yes');
        return true;
    }
    else 
    {
    	//alert('no');
        return false;
    }
}
	
	function addEmail() {
		
	if(validemails()==true)
		{
		$.ajax({
			type : "POST",
			url : $('#contextPath').val() + '/bizunit/addEmail.htm?partyId='
					+ $('#partyId').val() + "&emailName="
					+ $('#emailname').val() + "&email=" + $('#emailid').val(),
			dataType : 'json',
			contentType : 'application/json',
			success : function(result) {
				/* alert('Emailid and Comman Name Added successFully');
				reload();
				
				 */
				bootbox.dialog({
   				  	message: "<span class='bigger-110'>Record updated successfully.</span>",
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
				
			}

		});
			}
	}

	function getFile() {

		document.getElementById("imageid").click();

	}

	function uploadLogo() {
		//alert('bajirao gharage');
		//var a=$('#logochoose').val();
		var a = document.getElementById("logoFile").value;
		
		if($('#smssign').val().trim()=="")
			{
			alert("Please Enter Sms Signature.");
			}
		else
			{
		//alert($('#logochoose').val());
	//	alert(a+"bajirao");
		if(a=='')
			{
		//	alert('in here');
			$.ajax(		
		   			{ 				
		   		  type: "POST",
		   		  url:$('#contextPath').val()+'/bizunit/addDetail.htm?smssign='+$('#smssign').val()+
		          "&themes="+$('#themes').val()+
		          "&partyId="+$('#partyId').val(),	
		   	   		 dataType: 'json',
				  contentType: 'application/json',
					   		  success:function(result)
		   		  { 
					   			//  alert(result);
					   			
					   			
					   			

								bootbox.dialog({
				   				  	message: "<span class='bigger-110'>Sms signature added successsfully..</span>",
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

							
		   		  }
		   	
		   	});
			}
		else
		{
		//alert('ok');
		
		
				bootbox.dialog({
							  	message: "<span class='bigger-110'>Record updated successfully.</span>",
								buttons: 			
								{
									"click" :
									{
										"label" : "OK!",
										"className" : "btn-sm btn-primary",
										"callback": function() {
											$('#Other').submit();
											//window.location.reload();
											//return true;			
										//	location.reload();
										}
									}
								}
							});
		
			
		/* 		{
					success : function(msg) {
						var result = msg[0];
						if (result == 'success' && isLogoSelected == 1) {
							
						//	loacation.reload();
							$('#logoImage').attr('src',$('#contextPath').val() + '/app/images'+ msg[1]);
							showAlertMessage("Success",	"<br/>Logo Upload  Successfully.","confirmation", sucess);
							
							$('#logochoose').hide();
							$('#logoFile').val('');
							$('#logoFileName').html('');
							isLogoSelected = 0;
						} else if (result == 'success') {
							showAlertMessage("Success",
									"<br/>Logo Upload  Successfully.",
									"confirmation", doNothing);
						}
						
						disableProfileDiv1(id)
					},
					error : function(msg) {
					},
					onComplete : function(data) {
					}
				}).submit(); */
		}
			}
	}

	function sucess()
	{
		location.reload();
	}

	function addEmailSign() {
		
		//var emailsign = nicEditors.findEditor('emailsign').getContent();
	//	alert(emailsign+"emailsign");
/* 		if (nicEditors.findEditor("emailsign").getContent() == "") 
		{
			alert('Plaese enter email sign');
		}
		else { */ 
			var value1 = $("#emailsign").html();
		
		
		
		     $('#emailsign10').val(value1);	
		
			$.ajax({
				type : "POST",
				data:$('#emailform').serialize(),
			     url :$('#contextPath').val()
					+ '/bizunit/addEmailSign.htm',
							success : function(result) 
							{
								//alert('Record updated successfully');
					
								bootbox.dialog({
				   				  	message: "<span class='bigger-110'>Record updated successfully.</span>",
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
								
								

				}

			});

		}
	
	
	function addDndTem() {

	/* 		var value1 =  nicEditors.findEditor( "dndtemplate").getContent(); 
		     $('#dndtemplate').val(value1);
	 */
		var value1 =  $("#dndtemplate").html();
	 
		$('#dndtemplate10').val(value1);
	 
	 $.ajax({
				type : "POST",
				data:$('#dndform').serialize(),
			     url :$('#contextPath').val()
					+ '/bizunit/addDndTemplate.htm',
							success : function(result) 
							{
								
								bootbox.dialog({
				   				  	message: "<span class='bigger-110'>Record updated successfully.</span>",
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
					

				}

			});

		//}
	}
	
	function addDisclaimer() {
		//var disclaimer = nicEditors.findEditor('disclaimer').getContent();

			var value1 =  $("#disclaimer").html(); 
		     $('#disclaimer10').val(value1);
		  
		
			
			
			$.ajax({
				type : "POST",
			data:$('#disform').serialize(),
		     url :$('#contextPath').val()
				+ '/bizunit/addDisclaimer.htm',
						success : function(result) 
						{
							
							bootbox.dialog({
			   				  	message: "<span class='bigger-110'>Record updated successfully.</span>",
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
				}
			

			});

		//}
	}
</script>

<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico"
	rel="shortcut icon">

</head>
<body>
	<%
		HttpSession hes = request.getSession();

	%>
	<input type="hidden" name="partyId" id="partyId"
		value="<%=hes.getAttribute("partyId")%>">
	<input type="hidden" name="emailsign1" id='emailsign1'	value='<%=request.getAttribute("emailsign")%>'>
	<input type="hidden" name="dndTemplate1" id="dndTemplate1"	value='<%=request.getAttribute("dndTemplate")%>'>
	<input type="hidden" name='disclaimer1' id='disclaimer1'
		value='<%=request.getAttribute("disclaimer")%>'>
	<input type="hidden" name="commName1" id="commName1"
		value="<%=request.getAttribute("commName11")%>">
	<input type="hidden" name="emailId1" id="emailId1"
		value='<%=request.getAttribute("emailId11")%>'>

	<input type="hidden" name="smsSign1" id="smsSign1"
		value="<%=request.getAttribute("smsSign11")%>">
		
		
	<input type="hidden" name="img1" id="img1"		value="<%=request.getAttribute("path")%>">
		


	<jsp:include page="../common/header.jsp" />
	<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />
		
		<div class="page-header">
		<h1 class="pull-left">Biz Unit Profile for <%=hes.getAttribute("nameBizUnit")%></h1>
         
           <div class="clearfix"></div>
	</div>
		
		<div class="row">

       <div class="col-md-2" >
		<div class="list-group">
				<a class="list-group-item active" href="#">Section</a>
               
              	
              	<a	id="SPBUProfileGeneralLink"	href="loadviewprofile.htm?partyId=<%=hes.getAttribute("partyId")%>"	class="list-group-item">General</a>
						 <a id="SPBUProfileWhiteLabelLink" class="list-group-item "><strong>White Label</strong></a>  	
                <a id="SPBUProfileSettingsLink" class="list-group-item" href="<%=request.getContextPath()%>/setting/loadprofile_setting.htm?partyId=<%=hes.getAttribute("partyId")%>">Settings</a>
                <a id="SPBUProfileAssumptionsLink" href="<%=request.getContextPath()%>/loadAssumptions.htm" class="list-group-item">Assumptions</a>  
  	            <%-- <a id="SPProductRecommendationsLink"  href="<%=request.getContextPath()%>/partner/recommendation/getProductRecommendations.htm?partyId=<%=hes.getAttribute("partyId")%>"  class="list-group-item">Product Recommendation</a> --%>
	   </div>
       </div>
		
		
		
		<div class="col-md-9">
    		     <div class="list-group">
        			<a class="list-group-item active" href="#">White Label</a>
					<div class="list-group-item">
  					<div class="clearfix"></div>
  					<div class="topmenu">
    				</div>
    
    		<div class="clearfix"></div>
 		
				
					
						<div class="row">
							<div class="col-md-12 searchpadding padding_top">
								<input type="hidden" name="partyId" id="partyId" value="<%=request.getAttribute("partIds")%>">
								<table class="table table-striped" cellpadding="5"
									cellspacing="5">
									<tr>
										<td width="25%"><strong>Email Details</strong><a href="#"
											data-toggle="tooltip" data-placement="top"
											title="This name and email account is used by the system to send mails on your behalf to your contacts
"><i
												class="queryicon"></i> </a></td>
										<td width="75%">
										
										<span id="SPBUProfWLEditDetailsLink" style="float: right;"> <a id="e1" href="#"	onClick="enableTf1();reemailDetail()">
											<img src="<%=request.getContextPath()%>/images/editnew.png"></a><br>
										</span></td>
										
									</tr>
									<tr>
										<td colspan="2">
											<div>
												<table id="email_details" class="table	" cellpadding="5"
													cellspacing="5">
													<tr>
														<td>Name</td>
														<td><input name="emailname" type="text"
															id="emailname"
															style="border: none; background: none; box-shadow: none;"
															placeholder="Name" readonly="readonly" /></td>
													</tr>
													<tr>
														<td>Email Id</td>
														<td><input name="emailid" type="text" id="emailid"
															placeholder="xyz@gmail.com"  
															style="border: none; background: none; box-shadow: none; width: 350px;"
															readonly="readonly" /></td>
													</tr>
													<tr>
	<!-- 													<input id="cancel1"	class="btn dbtn none" type="button" value="Save" onclick="addEmail()" name="Save"> 
														<input	id="save1" class="btn dbtn none" type="button"		value="Cancel" name="Cancel" onclick="reload()"></td>
	 -->													
														<td colspan="2" align="right">

    <button id="btn_email_s" class="btn btn-sm btn-primary" onclick="addEmail()"><i class="ace-icon fa fa-plus"></i>Save</button>
    <a href="#" class="pagerLink">
    <button id="btn_email_c" class="btn btn-sm btn-danger" onclick="reload()"><i class="fa fa-times"></i>Cancel</button></a>
</td>
    

														
														
														
														
													</tr>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<td width="25%"><strong>Email Signature</strong></td>
										<td width="75%"><span id="SPBUProfWLEditEmailSigLink" 
											style="float: right;"> <a id="e2" href="#" onClick="enableTf2();reemailsign()"><img
													src="<%=request.getContextPath()%>/images/editnew.png"></a><br>
										</span></td>
									</tr>
									<tr>
										<td colspan="2">

											<table id="email_details1" class="table" cellpadding="5"
												cellspacing="5">
												<form name="emailform" id="emailform">
													<input type="hidden" name="partyId" id="partyIddiss1"	value="<%=hes.getAttribute("partyId")%>">
													<input type="hidden" name="emailsign" id="emailsign10">
												<tr>
													<td>
											 		<div name="emailsign1" class="wysiwyg-editor" id="emailsign">
													
													</div> 
										
													</td>
												<tr>

													
												</form>		
																												<td colspan="2" align="right">

    <button id="btn_emils_s" class="btn btn-sm btn-primary" onclick="addEmailSign()"><i class="ace-icon fa fa-plus"></i>Save</button><a href="#" class="pagerLink">
    <button id="btn_emils_c" class="btn btn-sm btn-danger" onclick="reload()"><i class="fa fa-times"></i>Cancel</button></a>
</td>
														
												</tr>
												
											</table>
										</td>
									</tr>
									<tr>
										<td width="25%"><strong>Disclaimer</strong></td>
										<td width="75%"><span id="SPBUProfWLEditDisclaimerLink"
											style="float: right;"> <a id="e3" href="#" onClick="enableTf3();reDisclaimer()"><img
													src="<%=request.getContextPath()%>/images/editnew.png"></a><br>
										</span></td>
									</tr>
									<tr>
										<td colspan="2">

											<table id="email_details2" class="table" cellpadding="5" 	cellspacing="5">
											<form name="disform" id="disform">
											
											<input type="hidden" name="disclaimer" id="disclaimer10">
											<input type="hidden" name="partyId" id="partyIddis"	value="<%=hes.getAttribute("partyId")%>">
												<tr>
													<td>
													
<!-- 													<textarea style="width: 100% !important;height: 100px" 
															rows="5"  class="editor" name="disclaimer"
															id='disclaimer'>
	
</textarea>
 -->
 	<div name="disclaimer1" class="wysiwyg-editor" id="disclaimer"></div>
</td>
												</tr>
												<tr>
									</form>
																																									<td colspan="2" align="right">
	<td colspan="2" align="right">
    <button id="btn_dis_s" class="btn btn-sm btn-primary" onclick="addDisclaimer()"><i class="ace-icon fa fa-plus"></i>Save</button>    <a href="#" class="pagerLink">
    <button id="btn_dis_c"  class="btn btn-sm btn-danger" onclick="reload()"><i class="fa fa-times"></i>Cancel</button></a>
</td>
														
												</tr>
												
											</table>
										</td>
									</tr>
									<tr>
										<td width="25%"><strong>DND Template</strong></td>
										<td width="75%"><span id="SPBUProfWLEditDNDTemplLink"
											style="float: right;"> <a id="e4" href="#" onClick="enableTf4();reDndtemplate()"><img
													src="<%=request.getContextPath()%>/images/editnew.png"></a><br>
										</span></td>
									</tr>
									<tr>
										<td colspan="2">
											<div>
												<table id="email_details3" class="table" cellpadding="5" 
													cellspacing="5">
													<form name="dndform" id="dndform">
										
													<input type="hidden" name="partyId" id="partyIddiss"	value="<%=hes.getAttribute("partyId")%>">
													<input type="hidden" name="template" id="dndtemplate10"	>
													<tr>
														<td>
														
				<div name="dndtemplate1" class="wysiwyg-editor" id="dndtemplate"></div>
														<!-- <textarea style="width: 100% !important;height: 100px"  
																rows="10" cols="5" class="editor" name="template"
																id="dndtemplate"  >
	
</textarea> -->

</td>
													</tr>
													<tr>
													
															
								</form>							
																																																								<td colspan="2" align="right">
	<td colspan="2" align="right">
    <button  id="btn_dnd_s" class="btn btn-sm btn-primary" onclick="addDndTem()"><i class="ace-icon fa fa-plus"></i>Save</button><a href="#" class="pagerLink">
    <button  id="btn_dnd_c" class="btn btn-sm btn-danger" onclick="reload()"><i class="fa fa-times"></i>Cancel</button></a>
</td>
													</tr>
													
												</table>
										</td>
									</tr>
									<tr>
										<td width="25%"><strong>Others</strong></td>
										<td width="75%"><span id="SPBUProfWLEditOthrDetlsLink"
											style="float: right;"> <a id="ee" href="#"	onClick="enableTf();resmsSign();"><img
													src="<%=request.getContextPath()%>/images/editnew.png"></a><br>
										</span></td>
									</tr>
								</table>
								<table class="table table-striped" cellpadding="5"
									cellspacing="5">
									<form id="Other" method="post"	action="<%=request.getContextPath()%>/bizunit/addOtherDetail.htm"	enctype="multipart/form-data">
										<input type="hidden" name="sectionName"	value="EmailOtherDetails" />
										<input type="hidden" name="partyId"	value="<%=hes.getAttribute("partyId")%>">
										
										<%--                 <input type="hidden" name="partyId" id="partyId" value="<%=request.getAttribute("partyId")%>"> --%>
										<tr>
											<td>SMS Signature</td>
											<td><input name="smsSignature" type="text" id="smssign"  style="width: 400px;" readonly="readonly"
												style="border: none; background: none; box-shadow: none;"
												placeholder="SMSSignature" /></td>
										</tr>
										<tr>
											<td>Themes</td>
									<td>
												<!--                   <select name="colors" class="form-control none" id="colors">   -->
												<!--                             <option>AbC</option> --> <!--                       </select> -->
												<!-- <input name="colortext" type="text" id="colortext" style="border:none;background:none;box-shadow:none;" value="Blue, Red" /></td> -->
												<select name="themes" id="themes"			class="form-control" >
										</tr>

										<tr>
											<td>Logo</td>
											<td>

<img style="width: 25%;height:25%" id="logopath" src="<%=FiinfraUtility.getImagePath(request,(String)request.getAttribute("path") ,"/images/img.png")%>">											

												
												<input class="btn dbtn" type="button" value="Choose File"	name="Choose File" style="display: none" id="logochoose"	onclick="$('#logoFile').click()"><label		id="logoFileName"></label> 
												
												
												
												<br>
											<!-- <input type="file" name="image" id=""			style="display: none"> -->
											
											
											<input type="file" name="image" id="logoFile" style="display: none"> <i class="emailicon"></i>&nbsp;
											
											</td>
										</tr>
										<tr>
											<td colspan="2" align="right">
										
											 <button  id="btn_other_s" class="btn btn-sm btn-primary" onclick="uploadLogo()"><i class="ace-icon fa fa-plus"></i>Save</button><a href="#" class="pagerLink">
    										<button  id="btn_other_c" class="btn btn-sm btn-danger" onclick="reload()"><i class="fa fa-times"></i>Cancel</button></a>
    
											 
											 
											 </td>
										</tr>
									</form>
								</table>
							</div>
						</div>
			
       
     </div>  </div>
     </div>                                    
      </div>
<%-- 
    
 --%>
		
		
		
		
		
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
						onClick="popup('popUpDiv')" id="loginButton" type="button">
				</form>
			</div>

		</div>
	</div>
	<!--css popup window 1 close-->
	<!--css popup window start 2-->
	<div style="display: none;" id="blanket"></div>
	<div
		style="display: none; width: 650px; height: 620px; top: 100px; overflow: auto;"
		id="popUpAlertaddnote" class="alert">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpAlertaddnote')" href="#"><img alt=""
				src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
		</div>
		<!-- Edit-->
		<div id="editnote">
			<div id="popupwrapper_contactform">
				<input type="hidden" name="partyId" id="partyId"
					value="<%=request.getAttribute("partyId")%>">
				<div class="heading_contactform">
					<h3>Edit BU</h3>
				</div>
				<div id="poptable_contactform" style="padding: 10px; height: 450px;">
					<span class="searchpadding padding_top"
						style="float: left; width: 150px;">Biz Unit <span
						class="red">*</span>
					</span> <span class="searchpadding padding_top" style="float: left;">
						<input type="text" class="form-control"
						placeholder="Biz Unit ">
					</span> </span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 150px;">Short Name <span
						class="red">*</span>
					</span> <span class="searchpadding padding_top"
						style="float: left; width: 300px;"> <input type="text"
						class="form-control" placeholder="Short Name"></span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 150px;">Company Name <span
						class="red">*</span>
					</span> <span class="searchpadding padding_top"
						style="float: left; width: 300px;"> <input type="text"
						class="form-control" placeholder="Company Name
"></span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 150px;">Address <span
						class="red">*</span></span> <span class="searchpadding padding_top"
						style="float: left; width: 300px;"> <input type="password"
						class="form-control" placeholder="Address">
					</span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 150px;"> </span> <span
						class="searchpadding padding_top"
						style="float: left; width: 300px;"> <input type="password"
						class="form-control" placeholder=" ">
					</span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 150px;"> </span> <span
						class="searchpadding padding_top"
						style="float: left; width: 300px;"> <input type="password"
						class="form-control" placeholder=" ">
					</span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 150px;">Country <span
						class="red">*</span></span> <span class="searchpadding padding_top"
						style="float: left; width: 300px;"> <select name="Saving"
						class="form-control" style="width: 300px; float: left;">
							<option>India</option>
							<option>India</option>


					</select>
					</span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 150px;">State <span class="red">*</span>
					</span> <span class="searchpadding padding_top" style="float: left;">
						<select name="Saving" class="form-control"
						style="width: 300px; float: left;">
							<option>Maharashtra</option>
							<option>Manipur</option>
							<option>Meghalaya</option>

					</select>
					</span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 150px;">City <span class="red">*</span>
					</span> <span class="searchpadding padding_top"
						style="float: left; width: 300px;"> <select name="Saving"
						class="form-control" style="width: 300px; float: left;">
							<option>Mumbai</option>
							<option>Pune</option>


					</select></span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 150px;"> Zip Code <span
						class="red">*</span>
					</span> <span class="searchpadding padding_top"
						style="float: left; width: 300px;"> <input type="password"
						class="form-control" placeholder=" ">
					</span>
					<div class="clearfix"></div>



				</div>
				<div class="topbuttonholder">
					<input class="dbtn" value="Save" id="Save" type="button"> <input
						class="dbtn" value="Cancel" id="Cancel" type="button">
				</div>
			</div>
		</div>
	</div>
	<!-- popup end-->
<!-- 	<div class="row headerstrip">
		<div class="headstrip"></div>

	</div> -->

	<!--Nav Menu Start-->
<!-- 	<div class="navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle" data-target=".navbar-collapse"
					data-toggle="collapse" type="button">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"> </a>
			</div>

		</div>
	</div> -->
	<!--Nav Menu End-->
	<!--breadcrum Menu Start-->

	<%-- <div class="container">
		<div class="portfoliostrip collapse navbar-collapse">
			<ul class="navbar-sub">
            	<li id="SPBizUnitLink" class="active"><a  href="<%=request.getContextPath()%>/bizunit/loadBizUnitList.htm?buId=${sessionScope.userSession.buId}">Biz Unit</a></li> 
            <li id="SPDepartmentLink"><a href="<%=request.getContextPath()%>/departmentlist/getDepartmentlist.htm?buId=${sessionScope.userSession.buId}">Department</a></li>
            <li id="SPServiceTeamLink"><a href="<%=request.getContextPath()%>/teammember/loadteammember.htm"> Service Team</a></li>

			</ul>
		</div>
	</div> --%>
	<!-- Center part start -->
	<div class="container white">
	<%-- 	<div class="container-head">

			<div class="col-md-12" style="text-align: right;">
				<span style="float: left;">Biz Unit Profile for <%=hes.getAttribute("nameBizUnit")%></span>
			</div>
		</div> --%>

		<div class="container-body " style="padding: 5px;"></div>
		<div class="container-body">

			<!-- center -->

<%-- 			<div class="col-md-3 sidebar-offcanvas" role="navigation"
				style="margin-top: 10px; padding-left: 10px;">
				<div class="list-group">
					<a class="list-group-item active" href="#">Sections</a>
					 <a	id="SPBUProfileGeneralLink"	href="loadviewprofile.htm?partyId=<%=hes.getAttribute("partyId")%>"	class="list-group-item">General</a>
						 <a id="SPBUProfileWhiteLabelLink" class="list-group-item "><strong>White	Label</strong></a>
						  <a id="SPBUProfileSettingsLink" class="list-group-item" href="<%=request.getContextPath()%>/setting/loadprofile_setting.htm?partyId=<%=hes.getAttribute("partyId")%>">Settings</a>
					      <a id="SPBUProfileAssumptionsLink" href="<%=request.getContextPath()%>/loadAssumptions.htm" class="list-group-item">Assumptions</a>
					<a id="SPProductRecommendationsLink"  href="<%=request.getContextPath()%>/partner/recommendation/getProductRecommendations.htm"  class="list-group-item">Product Recommendations</a>
				</div>




			</div> --%>

			<!-- center -->
			<%-- <div class="col-md-9" style="margin-top: 10px; padding-left: 10px;">
				<div class="list-group">
					<a class="list-group-item active" href="#"> White Label </a>

					<div class="list-group-item">
						<div class="row">
							<div class="col-md-12 searchpadding padding_top">
								<input type="hidden" name="partyId" id="partyId" value="<%=request.getAttribute("partIds")%>">
								<table class="table table-striped" cellpadding="5"
									cellspacing="5">
									<tr>
										<td width="25%"><strong>Email Details</strong><a href="#"
											data-toggle="tooltip" data-placement="top"
											title="This name and email account is used by the system to send mails on your behalf to your contacts
"><i
												class="queryicon"></i> </a></td>
										<td width="75%"><span id="SPBUProfWLEditDetailsLink"
											style="float: right;"> <a id="e1" href="#"	onClick="enableTf1();reemailDetail()"><img
													src="<%=request.getContextPath()%>/images/editnew.png"></a><br>
										</span></td>
									</tr>
									<tr>
										<td colspan="2">
											<div>
												<table id="email_details" class="table	" cellpadding="5"
													cellspacing="5">
													<tr>
														<td>Name</td>
														<td><input name="emailname" type="text"
															id="emailname"
															style="border: none; background: none; box-shadow: none;"
															placeholder="Name" readonly="readonly" /></td>
													</tr>
													<tr>
														<td>Email Id</td>
														<td><input name="emailid" type="text" id="emailid"
															placeholder="xyz@gmail.com"  
															style="border: none; background: none; box-shadow: none; width: 350px;"
															readonly="readonly" /></td>
													</tr>
													<tr>
														<td colspan="2" align="right"><input id="cancel1"
															class="btn dbtn none" type="button" value="Save"
															onclick="addEmail()" name="Save"> <input
															id="save1" class="btn dbtn none" type="button"
															value="Cancel" name="Cancel" onclick="reload()"></td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<td width="25%"><strong>Email Signature</strong></td>
										<td width="75%"><span id="SPBUProfWLEditEmailSigLink" 
											style="float: right;"> <a id="e2" href="#" onClick="enableTf2();reemailsign()"><img
													src="<%=request.getContextPath()%>/images/editnew.png"></a><br>
										</span></td>
									</tr>
									<tr>
										<td colspan="2">

											<table id="email_details1" class="table" cellpadding="5"
												cellspacing="5">
												<form name="emailform" id="emailform">
													<input type="hidden" name="partyId" id="partyIddiss1"	value="<%=hes.getAttribute("partyId")%>">
												<tr>
													<td>
													<textarea style="width: 100%;height: 100px" name="emailsign" 				id='emailsign'    rows="5" class="editor" >

														</textarea>
													</td>
												<tr>
													<td align="right"><input id="cancel2"
														class="btn dbtn none" type="button" value="Save"
														onclick="addEmailSign();" name="Save"> <input
														id="save2" class="btn dbtn none" type="button"
														value="Cancel" name="Cancel" onclick="reload()"></td>
												</tr>
												</form>
											</table>
										</td>
									</tr>
									<tr>
										<td width="25%"><strong>Disclaimer</strong></td>
										<td width="75%"><span id="SPBUProfWLEditDisclaimerLink"
											style="float: right;"> <a id="e3" href="#" onClick="enableTf3();reDisclaimer()"><img
													src="<%=request.getContextPath()%>/images/editnew.png"></a><br>
										</span></td>
									</tr>
									<tr>
										<td colspan="2">

											<table id="email_details2" class="table" cellpadding="5" 	cellspacing="5">
											<form name="disform" id="disform">
											<input type="hidden" name="partyId" id="partyIddis"	value="<%=hes.getAttribute("partyId")%>">
												<tr>
													<td><textarea style="width: 100% !important;height: 100px" 
															rows="5"  class="editor" name="disclaimer"
															id='disclaimer'>
	
</textarea></td>
												</tr>
												<tr>
													<td align="right"><input id="cancel3"
														class="btn dbtn none" type="button" value="Save"
														onclick="addDisclaimer()" name="Save"> <input
														id="save3" class="btn dbtn none" type="button"
														value="Cancel" name="Cancel" onclick="reload()"></td>
												</tr>
												</form>
											</table>
										</td>
									</tr>
									<tr>
										<td width="25%"><strong>DND Template</strong></td>
										<td width="75%"><span id="SPBUProfWLEditDNDTemplLink"
											style="float: right;"> <a id="e4" href="#" onClick="enableTf4();reDndtemplate()"><img
													src="<%=request.getContextPath()%>/images/editnew.png"></a><br>
										</span></td>
									</tr>
									<tr>
										<td colspan="2">
											<div>
												<table id="email_details3" class="table" cellpadding="5" 
													cellspacing="5">
													<form name="dndform" id="dndform">
													<input type="hidden" name="partyId" id="partyIddiss"	value="<%=hes.getAttribute("partyId")%>">
													<tr>
														<td><textarea style="width: 100% !important;height: 100px"  
																rows="10" cols="5" class="editor" name="template"
																id="dndtemplate"  >
	
</textarea></td>
													</tr>
													<tr>
														<td align="right"><input id="cancel4"
															class="btn dbtn none" type="button" value="Save"
															onclick="addDndTem()" name="Save"> <input
															id="save4" class="btn dbtn none" type="button"
															value="Cancel" name="Cancel" onclick="reload()"></td>
													</tr>
													</form>
												</table>
										</td>
									</tr>
									<tr>
										<td width="25%"><strong>Others</strong></td>
										<td width="75%"><span id="SPBUProfWLEditOthrDetlsLink"
											style="float: right;"> <a id="ee" href="#"	onClick="enableTf();resmsSign();"><img
													src="<%=request.getContextPath()%>/images/editnew.png"></a><br>
										</span></td>
									</tr>
								</table>
								<table class="table table-striped" cellpadding="5"
									cellspacing="5">
									<form id="Other" method="post"	action="<%=request.getContextPath()%>/bizunit/addOtherDetail.htm"	enctype="multipart/form-data">
										<input type="hidden" name="sectionName"	value="EmailOtherDetails" />
										<input type="hidden" name="partyId"	value="<%=hes.getAttribute("partyId")%>">
										
										                <input type="hidden" name="partyId" id="partyId" value="<%=request.getAttribute("partyId")%>">
										<tr>
											<td>SMS Signature</td>
											<td><input name="smsSignature" type="text" id="smssign"  style="width: 400px;" readonly="readonly"
												style="border: none; background: none; box-shadow: none;"
												placeholder="SMSSignature" /></td>
										</tr>
										<tr>
											<td>Themes</td>
									<td>
												<!--                   <select name="colors" class="form-control none" id="colors">   -->
												<!--                             <option>AbC</option> --> <!--                       </select> -->
												<!-- <input name="colortext" type="text" id="colortext" style="border:none;background:none;box-shadow:none;" value="Blue, Red" /></td> -->
												<select name="themes" id="themes"			class="form-control" >
										</tr>

										<tr>
											<td>Logo</td>
											<td>

<img style="width: 25%;height:25%" id="logopath" src="<%=FiinfraUtility.getImagePath(request,(String)request.getAttribute("path") ,"/images/img.png")%>">											
 <img style="width: 100%;height:100%" id="logopath" src="<%=FiinfraUtility.getImagePath(request,(String)request.getAttribute("path"),"images/img.png")%>">																			
 												 <br/>
  <img scr="<%=request.getContextPath(); %><%=request.getAttribute("img")%>" id="logoImage" style="width: 250px;height: 150px"> 
												
												<!-- <img src="D:\Ffreedom-DI\images\logo-images\31456\{$path}.png"/> -->
												<%=FiinfraUtility.getImagePath(request, logoPath, "images/img.png") %>
												
												<input class="btn dbtn" type="button" value="Choose File"
												name="Choose File" style="display: none" id="logochoose"
												onclick="$('#logoFile').click()"><label
												id="logoFileName"></label> <br>
											<input type="file" name="image" id="logoFile"
												style="display: none"></td>
										</tr>
										<tr>
											<td colspan="2" align="right"><input id="cancel"			class="btn dbtn none" type="button" value="Save"	onclick="uploadLogo();" name="Save"> <input
												id="save" class="btn dbtn none" type="button" value="Cancel" 
												name="Cancel" onclick="reload()"></td>
										</tr>
									</form>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div> --%>
			
		</div>
	</div>
	<!-- Center part End -->

	<footer>
	  <jsp:include page="../common/footer.jsp" />

		
	</footer>
<!-- 	<script type="text/javascript">
		$(function() {
			alert("zb");
	});
		</script> -->
	<script>
	makeEditor('disclaimer,#dndtemplate,#emailsign');
	
	document.getElementById("dndtemplate").contentEditable = false;
	document.getElementById("emailsign").contentEditable = false;
	document.getElementById("disclaimer").contentEditable = false;
	
	
	
	
	$(function() {
		
		
		
		
		
		$('#btn_email_s').hide();
		$('#btn_email_c').hide();
		$('#btn_emils_c').hide();
		$('#btn_emils_s').hide();
		$('#btn_dis_c').hide();
		$('#btn_dis_s').hide();
		$('#btn_dnd_c').hide();
		$('#btn_dnd_s').hide();
		$('#btn_other_s').hide();
		$('#btn_other_c').hide();
		
		
		
	//	alert('hi');
// 		$('#email_details1 .nicEdit-main').attr('contenteditable','false');
// 			$('#email_details2 .nicEdit-main').attr('contenteditable','false');
// 			$('#email_details3 .nicEdit-main').attr('contenteditable','false');
// 			$('body input').attr('disabled','disabled');
			
// 			$('.nicEdit-main').each(function(i,obj) {
// 				alert($(obj).html())
// 			})
// 			$('#emalising').prev().attr('contenteditable','false');
		$('#logoFile')
		.change(
				function() {
					var extensionToCheck = $(
							'#logoFile')
							.val()
							.substring(
									($('#logoFile')
											.val()
											.lastIndexOf(
													'.') + 1));
					if (extensionToCheck == 'jpg'
							|| extensionToCheck == 'jpeg'
							|| extensionToCheck == 'png'
							|| extensionToCheck == 'gif'
							|| extensionToCheck == 'ioc'
							|| extensionToCheck == 'bmp'
							|| extensionToCheck == 'psd'
							|| extensionToCheck == 'tif'
							|| extensionToCheck == 'pspimage'
							|| extensionToCheck == 'thm'
							|| extensionToCheck == 'yuv'
							|| extensionToCheck == 'ai'
							|| extensionToCheck == 'drw'
							|| extensionToCheck == 'eps'
							|| extensionToCheck == 'ps'
							|| extensionToCheck == 'svg') {
						$('#logoFileName')
								.html(
										$(
												'#logoFile')
												.val()
												.substring(
														$(
																'#logoFile')
																.val()
																.lastIndexOf(
																		'\\') + 1));
						isLogoSelected = 1;
					} else {
						alert('Please Select Valid Image');
						$('#logoFile').val('');
						$('#logoFileName').html('');
						isLogoSelected = 0;
					}

					//	 	$('#photoImage').hide();
				})
		getdemo();
		getColorList();
		$('#themes').attr("disabled", true);
		//	alert("In Document")
	//	 document.getElementById('email_details1').removeAttribute('contentEditable');
		///	nicEditors.findEditor("email_details1").disable();
			//nicEditors.findEditor("email_details2").disable();
			//nicEditors.findEditor("email_details3").disable();
		//	nicEditors.findEditor("disclaimer").disable();
		//	nicEditors.findEditor("dndtemplate").disable();
		
			
		
/* 		 */
			
/*  */
/* 	$('#email_details1 .nicEdit-main').attr('contenteditable', 'false');
	$('#email_details2 .nicEdit-main').attr('contenteditable', 'false');
	$('#email_details3 .nicEdit-main').attr('contenteditable', 'false'); */
/* 
		 document.getElementById('emalising').removeAttribute('contentEditable');
		document.getElementById('disclaimer').removeAttribute('contentEditable');
		document.getElementById('dndtemplate').removeAttribute('contentEditable'); */
	
		//alert("done");

	});
	

	function getdemo() {
	//	alert("In demo");
	var emailId1 = document.getElementById("emailId1").value;
 	var img1 = document.getElementById("img1").value;
	
	//$('#logoImage').attr('src',$('#contextPath').val()+'/app/images'+img1); 
//	alert(emailId1);
var a=document.getElementById("img1").value;
		$('#logoImage').attr('src',$('#contextPath').val() + '/app/images'+ a);
	document.getElementById("emailid").value = emailId1;
	var commName1 = document
			.getElementById("commName1").value;
//	alert(commName1);
	document.getElementById("emailname").value = commName1;
	
	var smsSign1 = document
		.getElementById("smsSign1").value;
document.getElementById("smssign").value = smsSign1;
//alert(smsSign1+"smsSign1");
var emailsign1 = document.getElementById('emailsign1').value;

	var dndTemplate1 = document
			.getElementById("dndTemplate1").value;
	var disclaimer1 = document
			.getElementById('disclaimer1').value;
	$('#emailsign').html(emailsign1);
	$('#disclaimer').html(disclaimer1);
	$('#dndtemplate').html(dndTemplate1);
/* 	nicEditors.allTextAreas();
	$('.nicEdit-main').attr('contenteditable','false'); */
/* 	nicEditors.findEditor("emalising").setContent(
			emailsign1);
	nicEditors.findEditor("disclaimer").setContent(
			disclaimer1);
	nicEditors.findEditor("dndtemplate")
			.setContent(dndTemplate1); */


 
}
	
	</script>
	<script>
		function addNote() {

			$("#addnote").show();
			$("#deletenote, #editnote").hide();
			$("#popUpAlertaddnote").css('height', '420px')
			$("#popUpAlertaddnote").css('width', '650px')
		}

		function deleteNote() {

			$("#deletenote").show();
			$("#addnote, #editnote").hide();
			$("#popUpAlertaddnote").css('height', '400px')
			$("#popUpAlertaddnote").css('width', '400px')

		}
		function editNote() {

			$("#editnote").show();
			$("#addnote, #deletenote").hide();
			$("#popUpAlertaddnote").css('height', '420px')
			$("#popUpAlertaddnote").css('width', '650px')

		}

		function enableTf() {
			$('#sms_signature, #password, #answer').css('background-color',
					'rgb(255, 255, 255)');
			$('#sms_signature, #password, #answer').css('border','1px solid rgb(204, 204, 204)');
			$('#sms_signature, #password, #answer').css('box-shadow','0px 1px 1px rgba(0, 0, 0, 0.075) inset');
			$('#sms_signature, #password, #answer').css('font-size', '11px');
			$('#ee').hide();
			$('#smssign').focus();
						$("#save, #cancel").show();
			$("#themes2, #logo2").show();
			$("#themes1, #logo1").hide();
			$('#logochoose').show();

		}
		function enableTf1() {
			$('#ename, #eid').css('background-color', 'rgb(255, 255, 255)');
			$('#ename, #eid').css('border', '1px solid rgb(204, 204, 204)');
			$('#ename, #eid').css('box-shadow','0px 1px 1px rgba(0, 0, 0, 0.075) inset');
			$('#ename, #eid').css('font-size', '11px');
			$('#e1').hide();
			$('#emailname').focus();
			$("#save1, #cancel1").show();
			$("#email_details").show();

		}
		function enableTf2() {
			$('#note1').css('background-color', 'rgb(255, 255, 255)');
			$('#note1').css('border', '1px solid rgb(204, 204, 204)');
			$('#note1').css('box-shadow','0px 1px 1px rgba(0, 0, 0, 0.075) inset');
			$('#note1').css('font-size', '11px');
			$('#e2').hide();
			$("#save2, #cancel2").show();
			$("#email_details").show();

		}
		function enableTf3() {
			$('#disclaimer').css('background-color', 'rgb(255, 255, 255)');
			$('#disclaimer').css('border', '1px solid rgb(204, 204, 204)');
			$('#disclaimer').css('box-shadow','0px 1px 1px rgba(0, 0, 0, 0.075) inset');
			$('#disclaimer').css('font-size', '11px');
			$('#e3').hide();
			$("#save3, #cancel3").show();
			$("#email_details").show(); 

		}
		function enableTf4() {
			$('#dnd').css('background-color', 'rgb(255, 255, 255)');
			$('#dnd').css('border', '1px solid rgb(204, 204, 204)');
			$('#dnd').css('box-shadow','0px 1px 1px rgba(0, 0, 0, 0.075) inset');
			$('#dnd').css('font-size', '11px');
			$('#e4').hide();
			$("#save4, #cancel4").show();
			$("#email_details").show();

		}
		

	


		function reemailsign() {
		//	alert('yes');
			
		
		$('#btn_emils_s').show();
		$('#btn_emils_c').show();
	//	$('#emailsign').attr('contenteditable', 'true');
		
		
		document.getElementById("emailsign").contentEditable = true;
		
		
		}
		function reDisclaimer() {
			document.getElementById("disclaimer").contentEditable = true;
			$('#btn_dis_s').show();
			$('#btn_dis_c').show();
			/* $('#email_details2 .nicEdit-main').attr('contenteditable', 'true'); */
		}
		function reDndtemplate() {
			/* $('#email_details3 .nicEdit-main').attr('contenteditable', 'true'); */
			$('#btn_dnd_s').show();
			$('#btn_dnd_c').show();
			document.getElementById("dndtemplate").contentEditable = true;
			
		}
function resmsSign()
{
	

	$('#btn_other_s').show();
	$('#btn_other_c').show();
	document.getElementById("smssign").readOnly = false;
	//document.getElementById("themes").readOnly = false;
	$('#themes').attr("disabled", false); 
}
		
		
		$('#fbtnid').mouseleave(function() {
			var fv = document.getElementById("imageid").value;
		//	alert(fv + "::::hhhhhhhhhhh");
			document.getElementById("txtiamge").value = fv;
			//alert("fv:"+fv);

		});
	</script>

</body>
</html>