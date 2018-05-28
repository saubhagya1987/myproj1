
<%@page import="in.fiinfra.common.service.vo.Partner"%>
<%@page import="in.fiinfra.pg.SubscriptionData"%>
<%@page import="in.fiinfra.controller.SubscriptionController"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Partner List</title>
</head>

<body>
	<jsp:include page="../common/header.jsp" />
	<input id="contextPath" type="hidden" name="contextPath" value="<%=request.getContextPath()%>" />


<div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="reload();"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Add Partner</h4>
		      </div>
      	<div class="modal-body">
      				
      				<form class="form-horizontal" id="autopingForm" method="POST">
		
					
						<!--      ------------------------------------------------------------------------------------------------------------      -->

						<c:choose>
							<c:when test="${sessionScope.userSession.buId==27827}">
								<div class="form-group">					              
					                <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">BU<span  class="red">*</span></label>
					                <div class="col-xs-12 col-sm-8">
					                  <input type="text" name="BU" id="BU" class="form-control" maxlength="20" value="Shubhchintak" readonly="true">
					                </div>					             
	              			</div>							
							<div class="clearfix"></div>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${sessionScope.userSession.buId==27828}">
							<div class="form-group">					          
					                <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">BU<span  class="red">*</span></label>
					                <div class="col-xs-12 col-sm-8">
					                  <input type="text" name="BU" id="BU" class="form-control" maxlength="20" value="FIINFRA" readonly="true">
					                </div>
	              			</div>
								
								<div class="clearfix"></div>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${sessionScope.userSession.buId==27829}">
								<div class="form-group">
					                <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">BU<span  class="red">*</span></label>
					                <div class="col-xs-12 col-sm-8">
					                  <input type="text" name="BU" id="BU" class="form-control" maxlength="20" value="SPA" readonly="true">
					                </div>
					              
	              				</div>
							
								<div class="clearfix"></div>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when
								test="${sessionScope.userSession.buId==27830 || sessionScope.userSession.buId==109612}">
								<div class="form-group">
					                <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">BU<span  class="red">*</span></label>
					                <div class="col-xs-12 col-sm-8">
					                  <input type="text" name="BU" id="BU" class="form-control" maxlength="20" value="DFDA" readonly="true">
					                </div>
					              
	              				</div>															
								<div class="clearfix"></div>
							</c:when>
						</c:choose>

						<!--      ------------------------------------------------------------------------------------------------------------      -->


				
					<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">First Name<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<input type="text" placeholder="First Name" title="firstName" id="firstName" name="firstName" class="col-xs-12 col-sm-11" />
								
							</div>
						</div>
					</div>
					
				 <div class="space-2"></div>

				
				
				<div class="form-group">
					  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">Last Name<span  class="red">*</span></label>
					  
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<input type="text" placeholder="Last Name" title="lastName" id="lastName" name="lastName" class="col-xs-12 col-sm-11" />
								
							</div>
						</div>
					</div>
					
				 <div class="space-2"></div>
				 
				 
				<div class="form-group">
					  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">Login Name<span  class="red">*</span></label>
					  
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<input type="text" placeholder="Login Name" title="loginName" id="loginName" name="loginName" class="col-xs-12 col-sm-11" />
								
							</div>
						</div>
					</div>
					
				 <div class="space-2"></div>
				
				 <div class="form-group">
					  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">Company Name</label>
					  
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<input type="text" placeholder="company Name" title="companyName" id="companyName" name="companyName" class="col-xs-12 col-sm-11" />
								
							</div>
						</div>
					</div>
					
				 <div class="space-2"></div>
				
						
				
				<div class="clearfix"></div>


						<!--      ------------------------------------------------------------------------------------------------------------      -->

						<c:choose>
							<c:when test="${sessionScope.userSession.buId==27827}">
								
							
							 <div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">Contact Email<span  class="red">*</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<input type="text" placeholder="Communication EmailId" title="communicationEmailId" id="communicationEmailId" name="communicationEmailId" class="col-xs-12 col-sm-6" />@shubhchintak.net
											
										</div>
									</div>
								</div>
								
							 <div class="space-2"></div>
							
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${sessionScope.userSession.buId==27828}">
								
								<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">Contact Email<span  class="red">*</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<input type="text" placeholder="Communication EmailId" title="communicationEmailId" id="communicationEmailId" name="communicationEmailId" class="col-xs-12 col-sm-6" />
											
										</div>
									</div>
								</div>
								
							 <div class="space-2"></div>
								
						
								<div class="clearfix"></div>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${sessionScope.userSession.buId==27829}">
								
									<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">Contact Email<span  class="red">*</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<input type="text" placeholder="Communication EmailId" title="communicationEmailId" id="communicationEmailId" name="communicationEmailId" class="col-xs-12 col-sm-6" /> @spacaptial.in
											
										</div>
									</div>
								</div>
								
							 <div class="space-2"></div>
								
						
							<div class="clearfix"></div>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when
								test="${sessionScope.userSession.buId==27830 || sessionScope.userSession.buId==109612}">
					        
					        	<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">Contact Email<span  class="red">*</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<input type="text" placeholder="Communication EmailId" title="communicationEmailId" id="communicationEmailId" name="communicationEmailId" class="col-xs-12 col-sm-6" />@dfdaonline.com
											
										</div>
									</div>
								</div>
							
								<div class="clearfix"></div>
							</c:when>
						</c:choose>

						<!--      ------------------------------------------------------------------------------------------------------------      -->
						<div class="clearfix"></div>
						
						
						<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">Alternate Email<span  class="red">*</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<input type="text" placeholder="contact Email" title="contactEmail" id="contactEmail" name="contactEmail" class="col-xs-12 col-sm-11" />
											
										</div>
									</div>
								</div>
								
							
							
						<div class="clearfix"></div>
						<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">Contact No.<span  class="red">*</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<input type="text" placeholder="contactMobile" title="contactMobile" id="contactMobile" name="contactMobile"  maxlength="10" class="col-xs-12 col-sm-11" />
											
										</div>
									</div>
								</div>
								
						
							
										
						<div class="clearfix"></div>
							<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">ARN<span  class="red">*</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<input type="text" placeholder="ARN" title="ARN" id="ARN" name="ARN"  maxlength="10" class="col-xs-12 col-sm-11" />
											
										</div>
									</div>
								</div>
					
						

						<div class="clearfix"></div>
						
						
						<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">EUIN</label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<input type="text" placeholder="euin" title="euin" id="euin" name="euin"  maxlength="10" class="col-xs-12 col-sm-11" />
											
										</div>
									</div>
								</div>
						
						
						<div class="clearfix"></div>
						<!-- state -->
						
								<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">State</label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
<!-- 											<input type="text" placeholder="euin" title="euin" id="euin" name="euin"  maxlength="10" class="col-xs-12 col-sm-11" /> -->
											 <select name="state" id="state" class="col-xs-12 col-sm-11" onchange="getCity();"></select>
											
										</div>
									</div>
								</div>
						
						
						<div class="clearfix"></div>
						<!-- state/ -->

						<!-- city/ -->
						
						<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">Location</label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
<!-- 											<input type="text" placeholder="euin" title="euin" id="euin" name="euin"  maxlength="10" class="col-xs-12 col-sm-11" /> -->
											   <select name="location" id="location" class="col-xs-12 col-sm-11"></select>
											
										</div>
									</div>
								</div>
						
						<div class="clearfix"></div>
						<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType"><span id="psttxt">PST</span><span  class="red">*</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
<!-- 											<input type="text" placeholder="PST" title="pstSn" id="pstSn" name="pstSn" class="col-xs-12 col-sm-11" /> -->
											  <select name="pstSn" id="pstSn" class="col-xs-12 col-sm-11"></select>
										</div>
									</div>
								</div>
						
						
						
						<div class="clearfix"></div>
						
						
						<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType"><span id="pkttxt">PkT</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
<!-- 											<input type="text" placeholder="PST" title="pstSn" id="pstSn" name="pstSn" class="col-xs-12 col-sm-11" /> -->
											  <select name="pktSn" id="pktSn" class="col-xs-12 col-sm-11"></select>
										</div>
									</div>
								</div>
						
						<div class="clearfix"></div>
						
						
							<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType"><span id="pottxt">POT</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
<!-- 											<input type="text" placeholder="PST" title="pstSn" id="pstSn" name="pstSn" class="col-xs-12 col-sm-11" /> -->
											<select name="potSn" class="col-xs-12 col-sm-11" id="potSn"></select>
										</div>
									</div>
								</div>
					

						<div class="clearfix"></div>
						
						
						
							<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType"><span id="rmtxt">RM</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
<!-- 											<input type="text" placeholder="PST" title="pstSn" id="pstSn" name="pstSn" class="col-xs-12 col-sm-11" /> -->
											<select name="rmSn" class="col-xs-12 col-sm-11" id="rmSn"></select>
										</div>
									</div>
								</div>
						


						<div class="clearfix"></div>
						<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType"><span id="rmheadtxt">RM Head</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
<!-- 											<input type="text" placeholder="PST" title="pstSn" id="pstSn" name="pstSn" class="col-xs-12 col-sm-11" /> -->
										<select name="rmHeadSn" class="col-xs-12 col-sm-11" id="rmHeadSn"></select>
										</div>
									</div>
								</div>
					
						<div class="clearfix"></div>				
						
	
					<div class="space-2"></div>
			
					<div class="modal-footer">
						<div class="clearfix">
											 <button class="btn btn-sm btn-primary " onClick="savePing(0);"><i class='ace-icon fa fa-plus'></i>Save & New</button>
											  <button class="btn btn-sm btn-primary" onClick="savePing(1);"><i class='ace-icon fa fa-plus'></i>Save & Close</button>
							                 <button class="btn btn-sm btn-danger" onClick="resetval();reload();"><i class='ace-icon fa fa-trash'></i>Cancel</button>
					
								</div>	
					
				</div>
		</form>	
<div class="clearfix"></div>
<!-- </form> --> 
					
			
			</div></div></div></div>


			<!-- delete-->
					
<div class="modal fade" id="deletenote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Delete Partner</h4>
		      </div>
		      Do you want to delete this selected records? Please confirm.
      		<div class="modal-footer">		
				
				<form>
				  <div id="Yes"  class="btn btn-sm btn-primary" onClick="confirmdeletez();"><i class='ace-icon fa fa-plus'></i>Yes</div>				  
                  <div id="No"  class="btn btn-sm btn-danger" "><i class='ace-icon fa fa-trash'></i>No</div>
      
				</form>
			
			</div></div></div></div>

			<!-- delete-->

			<!-- sendMail-->
<div class="modal fade" id="sendMail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Send Welcome Mail</h4>
		      </div>
      				<span id="selectedItemz"></span> Partner Records selected for Send
						Welcome Mail action. Please confirm?.
				
					<div class="modal-footer">
						<form>
							<button class="btn btn-sm btn-primary" onClick="sendWelcomeMail(1);"><i class='ace-icon fa fa-plus'></i>Send Mail</button>
				            <button class="btn btn-sm btn-danger" onClick="refresh();"><i class='ace-icon fa fa-trash'></i>Cancel</button>
						</form>
						
							<div class="clearfix"></div>
					</div>
					
								<div class="clearfix"></div>
				</div>
			</div></div>

			<!-- sendMail-->

			<!-- New Mail Account-->
			
<div class="modal fade" id="newMail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">New Mail Account</h4>
		      </div>
      <div class="modal-body">
<!-- 			<div id="newMail"> -->
<!-- 				<div id="popupwrapper_contactform" -->
<!-- 					style="height: 100px; width: 350px;"> -->

<!-- 					<div class="heading_contactform"> -->
<!-- 						<h3>New Mail Account</h3> -->
<!-- 					</div> -->
<!-- 					<div id="poptable_contactform" -->
<!-- 						style="padding: 10px; height: 100px;"> -->
						23 Partner Records selected for new communication email account
						action. Please confirm. <br /> <br /> <a href="#">Click here
							to download generated file</a>


					</div>
					<div class="topbuttonholder">
						<form>
						<!-- 	<input class="dbtn" value="Generate Download File" id="download" type="button"> 
							<input class="dbtn" value="Cancel" id="Cancel" type="button"> -->
							<button id="download" class="btn btn-sm btn-primary" onClick=""><i class='ace-icon fa fa-plus'></i>Generate Download File</button>
				            <button id="Cancel" class="btn btn-sm btn-danger" onClick=""><i class='ace-icon fa fa-trash'></i>Cancel</button>
						</form>
					</div>
					<div class="clearfix"></div>
				</div>
			</div></div>

			<!-- New Mail Account-->
			<!-- Edit-->
			
<div class="modal fade" id="editnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="reload();"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Edit Partner</h4>
		      </div> 
      <div class="modal-body">
  <form class="form-horizontal" id="FormEdit" method="POST">       
    				   <c:choose>
							<c:when test="${sessionScope.userSession.buId==27827}">								
					              <div class="form-group">
					                <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">BU<span  class="red">*</span></label>
					                <div class="col-xs-12 col-sm-8">
					                  <input type="text" name="BU" id="BU" class="form-control" maxlength="20" value="Shubhchintak" readonly="true">
					                </div>
					              </div>              			
								<div class="clearfix"></div>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${sessionScope.userSession.buId==27828}">					
					              <div class="form-group">
					                <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">BU<span  class="red">*</span></label>
					                <div class="col-xs-12 col-sm-8">
					                  <input type="text" name="BU" id="BU" class="form-control" maxlength="20" value="FIINFRA" readonly="true">
					                </div>					              
	              			</div>								
								<div class="clearfix"></div>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${sessionScope.userSession.buId==27829}">							
					              <div class="form-group col-md-12 clearfix">
					                <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">BU<span  class="red">*</span></label>
					                <div class="col-xs-12 col-sm-8">
					                  <input type="text" name="BU" id="BU" class="form-control" maxlength="20" value="SPA" readonly="true">
					                </div>
					              </div>
	              			
								<div class="clearfix"></div>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${sessionScope.userSession.buId==27830 || sessionScope.userSession.buId==109612}">
								
					              <div class="form-group col-md-12 clearfix">
					                <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">BU<span  class="red">*</span></label>
					                <div class="col-xs-12 col-sm-8">
					                  <input type="text" name="BU" id="BU" class="form-control" maxlength="20" value="DFDA" readonly="true">
					                </div>
					              </div>
								<div class="clearfix"></div>
							</c:when>
						</c:choose>
            	    
      				<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">First Name<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<input type="text" placeholder="First Name" title="firstName" id="efirstName" name="efirstName" class="col-xs-12 col-sm-11" />
								
							</div>
						</div>
					</div>
					
				 <div class="space-2"></div>

				
				
				<div class="form-group">
					  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">Last Name<span  class="red">*</span></label>
					  
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<input type="text" placeholder="Last Name" title="lastName" id="elastName" name="elastName" class="col-xs-12 col-sm-11" />
								
							</div>
						</div>
					</div>
					
				<div class="space-2"></div>
				 
				 
				<div class="form-group">
					  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">Login Name<span  class="red">*</span></label>
					  
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<input type="text" placeholder="Login Name" title="loginName" id="eloginname" name="eloginname" class="col-xs-12 col-sm-11" readonly="true" />
								
							</div>
						</div>
					</div>
					
				 <div class="space-2"></div>
				
				 <div class="form-group">
					  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">Company Name</label>
					  
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<input type="text" placeholder="company Name" title="companyName" id="ecompanyName" name="ecompanyName" class="col-xs-12 col-sm-11" />
								
							</div>
						</div>
					</div>
					
				 <div class="space-2"></div>	
					
				<!--      ------------------------------------------------------------------------------------------------------------      -->

						<c:choose>
							<c:when test="${sessionScope.userSession.buId==27827}">
								
							
							 <div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">Contact Email<span  class="red">*</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<input type="text" placeholder="Communication EmailId" title="communicationEmailId" id="ecommunicationEmailId" name="ecommunicationEmailId" class="col-xs-12 col-sm-6" readonly="true" />
											
										</div>
									</div>
								</div>
								
							 <div class="space-2"></div>
							
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${sessionScope.userSession.buId==27828}">
								
								<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">Contact Email<span  class="red">*</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<input type="text" placeholder="Communication EmailId" title="communicationEmailId" id="ecommunicationEmailId" name="ecommunicationEmailId" class="col-xs-12 col-sm-6" readonly="true" />
											
										</div>
									</div>
								</div>
								
							 <div class="space-2"></div>
								
						
								<div class="clearfix"></div>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${sessionScope.userSession.buId==27829}">
								
									<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">Contact Email<span  class="red">*</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<input type="text" placeholder="Communication EmailId" title="communicationEmailId" id="ecommunicationEmailId" name="ecommunicationEmailId" class="col-xs-12 col-sm-6" readonly="true" />											
										</div>
									</div>
								</div>
								
							 <div class="space-2"></div>
								
						
							<div class="clearfix"></div>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when
								test="${sessionScope.userSession.buId==27830 || sessionScope.userSession.buId==109612}">
					        
					        	<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">Contact Email<span  class="red">*</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<input type="text" placeholder="Communication EmailId" title="communicationEmailId" id="ecommunicationEmailId" name="ecommunicationEmailId" class="col-xs-12 col-sm-6" readonly="true" />
											
										</div>
									</div>
								</div>
							
								<div class="clearfix"></div>
							</c:when>
						</c:choose>

						<!--      ------------------------------------------------------------------------------------------------------------      -->	
					
					
					<div class="clearfix"></div>
						
						
						<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">Alternate Email<span  class="red">*</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<input type="text" placeholder="contact Email" title="contactEmail" id="econtactEmail" name="econtactEmail" class="col-xs-12 col-sm-11" />
											
										</div>
									</div>
								</div>
								
							
							
						<div class="clearfix"></div>
						<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">Contact No.<span  class="red">*</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<input type="text" placeholder="contactMobile" title="contactMobile" id="econtactMobile" name="econtactMobile"  maxlength="10" class="col-xs-12 col-sm-11" />
											
										</div>
									</div>
								</div>										
						<div class="clearfix"></div>

							<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">ARN<span  class="red">*</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<input type="text" placeholder="ARN" title="ARN" id="eARN" name="eARN"  maxlength="10" class="col-xs-12 col-sm-11" />
											
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
						
						
						<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">EUIN</label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
											<input type="text" placeholder="euin" title="euin" id="eeuin" name="eeuin"  maxlength="10" class="col-xs-12 col-sm-11" />
											
										</div>
									</div>
								</div>
						
						
						<div class="clearfix"></div>
						<!-- state -->
						
								<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">State</label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
<!-- 											<input type="text" placeholder="euin" title="euin" id="euin" name="euin"  maxlength="10" class="col-xs-12 col-sm-11" /> -->
											 <select name="state" id="estate" class="col-xs-12 col-sm-11" onchange="editCity(0);"></select>
											
										</div>
									</div>
								</div>				
						<div class="clearfix"></div>
						<!-- state/ -->

						<!-- city/ -->
						
						<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType">Location</label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
<!-- 											<input type="text" placeholder="euin" title="euin" id="euin" name="euin"  maxlength="10" class="col-xs-12 col-sm-11" /> -->
											   <select name="elocation" id="elocation" class="col-xs-12 col-sm-11"></select>
											
										</div>
									</div>
								</div>
						
						<div class="clearfix"></div>
						
						<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType"><span id="psttxt">PST</span><span  class="red">*</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
<!-- 											<input type="text" placeholder="PST" title="pstSn" id="pstSn" name="pstSn" class="col-xs-12 col-sm-11" /> -->
											  <select name="epstSn" id="epstSn" class="col-xs-12 col-sm-11"></select>
										</div>
									</div>
								</div>
						
						
						
						<div class="clearfix"></div>
						
						
						<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType"><span id="pkttxt">PkT</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
<!-- 											<input type="text" placeholder="PST" title="pstSn" id="pstSn" name="pstSn" class="col-xs-12 col-sm-11" /> -->
											  <select name="epktSn" id="epktSn" class="col-xs-12 col-sm-11"></select>
										</div>
									</div>
								</div>
						
						<div class="clearfix"></div>
						
						
							<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType"><span id="pottxt">POT</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
<!-- 											<input type="text" placeholder="PST" title="pstSn" id="pstSn" name="pstSn" class="col-xs-12 col-sm-11" /> -->
											<select name="epotSn" class="col-xs-12 col-sm-11" id="epotSn"></select>
										</div>
									</div>
								</div>
					

						<div class="clearfix"></div>
						
						
						
							<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType"><span id="rmtxt">RM</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
<!-- 											<input type="text" placeholder="PST" title="pstSn" id="pstSn" name="pstSn" class="col-xs-12 col-sm-11" /> -->
											<select name="ermSn" class="col-xs-12 col-sm-11" id="ermSn"></select>
										</div>
									</div>
								</div>
						


						<div class="clearfix"></div>
						<div class="form-group">
								  <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="currentContactType"><span id="rmheadtxt">RM Head</span></label>
								  
									<div class="col-xs-12 col-sm-9">
										<div class="clearfix">
<!-- 											<input type="text" placeholder="PST" title="pstSn" id="pstSn" name="pstSn" class="col-xs-12 col-sm-11" /> -->
										<select name="ermHeadSn" class="col-xs-12 col-sm-11" id="ermHeadSn"></select>
										</div>
									</div>
								</div>
					
						<div class="clearfix"></div>
					
						
						<!-- 	<div class="topbuttonholder" >		
      					<div class="form-group"> -->
				<!-- 		<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="platform"></label> -->
						<div class="modal-footer">
								<button  class="btn btn-sm btn-primary" onClick="savePingforedit();"><i class='ace-icon fa fa-plus'></i>Save</button>
					            <button class="btn btn-sm btn-danger"  onClick="reload();"><i class='ace-icon fa fa-trash'></i>Cancel</button>
							</div>
						<!-- </div></div> -->
								
	
					<div class="space-2"></div>
      </form>

					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
</div>
			<!------------------------------------- Bulk upload Partner------------------------------------->

<div class="modal fade" id="uploadUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="width: 90%;">
    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Bulk Upload Partner</h4>
		      </div>
      <div class="modal-body" >
				<form id="myForm" method="post" action="<%=request.getContextPath()%>/partnersp/insertBulkPartner.htm" enctype="multipart/form-data">
						<div class="clearfix"></div>
			
				<input type="hidden" id="hdnbuId" name="hdnbuId" value="${sessionScope.userSession.buId}" /> 
		<input type="hidden" id="hdnuserId" name="hdnuserId" value="${sessionScope.userSession.userId}" /> 
		<input type="hidden" id="hdnpartyId" name="hdnpartyId" /> 
		<input type="hidden" id="confirmdelete" name="confirmdelete" />
		<!-- <input type="hidden" id="hdnpassword" name="hdnpassword"/> -->
		<input type="hidden" id="partnerspartyid" name="partnerspartyid" />
		<input type="hidden" id="isopen" name="isopen" value="<%=request.getAttribute("isopen")%>" />
		<input type="hidden" id="hdnarn" name="hdnarn" /> 
		<input type="hidden" id="hdncontactemail" name="hdncontactemail" />
		

						<!------------------------------------- Upload File------------------------------------->

						<!--         <span class="searchpadding padding_top" style="float:left; width:150px;">Upload File  </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder="No File chosen
" ></span>
<span style="float:left;margin-top:7px; width:100px;"><input class="dbtn" value="Browse" id="Browse" type="button" ></span> -->


						<span class="searchpadding padding_top" 	style="float: left; width: 150px;">Upload File </span> 
						<span	class="searchpadding padding_top"	style="float: left; width: 300px;"> 
						<input type="file" id="fileid" name="file"	style="height: 0px; width: 0px; overflow: hidden;" /> 
						<input	type="text" id="ftxtid" name="ftxtid" class="form-control"></span> 
						<span	style="float: left; margin-top: 7px; width: 100px;"> 
						<input class="dbtn" value="Browse" id="fbtnid" type="button"	onclick="getFile();"></span>

					<!------------------------------------- Upload File------------------------------------->


						<div class="clearfix"></div>
							<span class="searchpadding padding_top" 	style="float: left; width: 150px;"></span> 
							<span 	class="searchpadding padding_top" 	style="float: left; width: 300px;"> <a href="#" 	onclick="downloadAttachmentDownload();">Click here to
									Download Sample Template File </a></span>
							<div class="clearfix"></div>
					



					<s:if test="%{lstExistingPartner.size() > 0}">
						<div class="container">
							<div class="col-md-12">
								<div id="no_record_hide">
									<input type="hidden" id="statusMessage" value="success">
									<div id="validRecordList">
										<div class="panel panel-default" style="width: 96%">
											<div class="panel-heading">Duplicate Records</div>
											<!-- 		<h2>Successful Records</h2> -->
											<div class="panel-body">

												<div class="table-responsive"
													style="overflow-x: auto; overflow-y: hidden; width: 100%"
													id="success_lead_table">
												
													<div id="toreload">		
														<table id="grid-table1"></table>

        												<div id="grid-pager1"></div>
        											</div>
												
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</s:if>

					<s:if test="%{lstSuccessPartner.size() > 0}">
						<div class="container">
							<div class="col-md-12">
								<div id="no_record_hide">
									<input type="hidden" id="statusMessage" value="success">
									<div id="validRecordList">
										<div class="panel panel-default" style="width: 96%">
											<div class="panel-heading">Successful Records</div>
											<!-- 		<h2>Successful Records</h2> -->
											<div class="panel-body">

												<div class="table-responsive"
													style="overflow-x: auto; overflow-y: hidden; width: 100%"
													id="success_lead_table">
													<div id="toreload">
													<table id="grid-table2"></table>

        												<div id="grid-pager2"></div>
        												</div>
													
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</s:if>

					<s:if test="%{lstFailedPartner.size() > 0}">
						<script></script>
						<div class="container">
							<div class="col-md-12">
								<input type="hidden" id="statusMessage" value="success">
								<div id="lstInvalidLeads">

									<div class="panel panel-default" style="width: 96%">
										<div class="panel-heading">Failed Records</div>

										<div class="panel-body">
											<div class="table-responsive"
												style="overflow-x: auto; overflow-y: hidden; width: 100%"
												id="failed_lead_table">

												<span style="color: grey">One or more mandatory
													details are missing in the Failed Records list given below.
													Please fix and upload again</span> <br />
													<div id="toreload">
													<table id="grid-table3"></table>

        												<div id="grid-pager3"></div>
        												</div>			
												<%--< display:table name="lstFailedPartner" uid="objPortalUser" class="table table-hover table-bordered table-striped"	sort="list" id="data">
													<display:column sortable="true" property="firstName"	title="	First Name	  " />
													<display:column sortable="true" property="lastName" title="	Last Name	  " />
													<display:column sortable="true" property="contactEmail" 	title="	Email	  " />
													<display:column sortable="true" property="contactMobile" title="	Mobile	  " />
												</display:table> --%>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</s:if>
					<s:if test="%{lstMithiFailedContactEmails.size() > 0}">
						<script></script>
						<div class="container">
							<div class="col-md-12">
								<input type="hidden" id="statusMessage" value="success">
								<div id="lstInvalidLeads">
									<div class="panel panel-default" style="width: 96%">
										<div class="panel-body">
											<div class="table-responsive"
												style="overflow-x: auto; overflow-y: hidden; width: 100%"
												id="failed_lead_table">
												<br />
												<div id="toreload">
													<table id="grid-table4"></table>

        												<div id="grid-pager4"></div>
        										</div>		
        												
												<%-- <display:table name="lstMithiFailedContactEmails"
													uid="objPortalUser"
													class="table table-hover table-bordered table-striped"
													sort="list" id="data">
													<display:column sortable="true" property="role"
														title="	Error while creating contact email(s) as well as setting alternate email(s) on mithi" />
												</display:table> --%>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</s:if>


					<div class="topbuttonholder">
						<!-- <input class="dbtn" value="Upload" id="Upload" type="button" onclick="bulkUPLOADFile();" title="Upload Records in Bulk from Selected File"> 
						<input class="dbtn" value="Cancel" id="Cancel" type="button" onclick="refresh();reload()">
						 -->
						<button  id="Upload" class="btn btn-sm btn-primary" onClick="bulkUPLOADFile();"  title="Upload Records in Bulk from Selected File"><i class='ace-icon fa fa-plus'></i>Upload</button>
				         <button class="btn btn-sm btn-danger"  onClick="refresh();reload()"><i class='ace-icon fa fa-trash'></i>Cancel</button>

					</div>
					
			</form>		
					
					<div class="clearfix"></div>
		
				</div>
			</div></div></div>
			<!------------------------------------- Bulk upload Partner------------------------------------->
			<!-- End-->
			<!-- assignEmailAccount-->
			
<div class="modal fade" id="assignEmailAccount" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Communication Email Account for Partner <span id="acaforptxt"></span></h4>
		      </div>
      <div class="modal-body">
<!-- 				<div id="popupwrapper_contactform"> -->

<!-- 					<div class="heading_contactform"> -->
<!-- 						<span -->
<!-- 							style="word-break: break-all; color: white; font-size: 1.15em; margin-top: 1em; margin-left: 0; margin-right: 0; margin-bottom: 1em; font-weight: bold;">Assign -->
<!-- 							Communication Email Account for Partner <span id="acaforptxt"></span> -->
<!-- 						</span> -->
<!-- 					</div> -->
<!-- 					<div id="poptable_contactform" -->
<!-- 						style="padding: 10px; height: 140px;"> -->
						<span class="searchpadding padding_top"
							style="float: left; width: 160px;">Communication Email <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							id="communicationEmail" name="communicationEmail"
							class="form-control" maxlength="50"></span>


						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 160px;">Communication Name </span> <span
							class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							id="communicationName" name="communicationName"
							class="form-control" maxlength="50"></span> <span
							style="float: left; margin-top: 7px; width: 100px;"></span>


						<div class="clearfix"></div>
					</div>
					<div class="topbuttonholder">
						<form>
							<!-- <input class="dbtn" value="Save" id="Save" type="button" onclick="assignCommunicationEmail();"> 
							<input	class="dbtn" value="Cancel" id="Cancel" type="button" onclick="reload()"> -->
							
						 <button  id="save" class="btn btn-sm btn-primary" onClick="assignCommunicationEmail();"  title="Save"><i class='ace-icon fa fa-plus'></i>Save</button>
				         <button class="btn btn-sm btn-danger"  onClick="reload()"><i class='ace-icon fa fa-trash'></i>Cancel</button>
							
						</form>
					</div>
					<div class="clearfix"></div>
				</div>
			</div></div>
			<!-- assignEmailAccount-->
			<!-- Onboarding-->
			
<div class="modal fade" id="Onboarding" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">	Onboarding Checklist for Partner <span id="ChecklistPtxt"></span> </h4>
		      </div>
      <div class="modal-body">
<!-- 			<div id="Onboarding"> -->
<!-- 				<div id="popupwrapper_contactform" style="height: 450px;"> -->

<!-- 					<div id="data" class="heading_contactform"> -->
<!-- 						<h3> -->
<!-- 							Onboarding Checklist for Partner <span id="ChecklistPtxt"></span> -->
<!-- 						</h3> -->
<!-- 					</div> -->
				<!-- 	<div id="poptable_contactform"
						style="padding: 10px; height: 370px;"> -->

						<table class="table table-hover table-bordered table-striped">

							<tr>
								<th class="thead">Stage</th>
								<th class="thead">Completed?</th>
								<th class="thead">Action DateTime</th>
								<!-- <th class="thead">Action By</th> -->
								<!-- <th class="thead">Next Action</th> -->
							</tr>
							<tr>
								<td>Empanelment with Program Sponsor</td>
								<td><input id="check1" type="checkbox"></td>
								<td><input type="text" name="proSponDate" id="proSponDate" class=" "  value=" " style="width: 200px;"  disabled></td>
								<!-- <td><span class="searchpadding padding_top " style="float: left; width: 200px;"> <input type='text' name="ProSponDate" id='ProSponDate' maxlength="20" />
								</td> -->
							<!-- 	<td><span class="searchpadding padding_top" style="float: left; width: 200px;"> <input type="text" 	id="ProSponDate" name="ProSponDate"
										class="form-control" ></span></td> -->
								<!-- <td id="ProSponCreatedBy"></td> -->
							<!-- 	<td><a href="#">Send Mail</a></td> -->

							</tr>
						
							<tr>
								<td>Welcomed & Contacted</td>
								<td><input id="check2" type="checkbox"></td>
								<td><input type="text" name="welnConDate" id="welnConDate" class=" "  value=" " style="width: 200px;"  disabled></td>
								<!-- <td id="welnConCreatedBy"></td> -->
								<!-- <td><a href="#">Update Account</a></td> -->

							</tr>
							
							<tr>
								<td>Agreement signed</td>
								<td><input id="check3" value="check3" type="checkbox"></td>
									<td><input type="text" name="agreeSignDate" id="agreeSignDate" class=" "  value=" " style="width: 200px;"  disabled></td>
							<!-- 	<td id="agreeSignCreatedBy"></td> -->
								<!-- <td><a href="#">Send Mail</a></td> -->

							</tr>
							<tr>
								<td>On boarded</td>
								<td><input id="check4" type="checkbox"></td>
									<td><input type="text" name="onBoaredDate" id="onBoaredDate" class=" "  value=" " style="width: 200px;"  disabled></td>
								<!-- <td id="onBoaredCreatedBy"></td> -->
								<!-- <td><a href="#">Send Mail</a></td> -->

							</tr>
							
							<tr>
								<td>Region</td>
								<td></td>
								<!-- <td><input id="check5" type="checkbox"></td> -->
								<td> <span class="searchpadding padding_top"	style="float: left;"> <select name="regionId" class="form-control" id="regionId"></select></span></td>
							</tr>
							
							<tr>
								<td>Partner Rating/Ranking</td>
								<td></td>
								<!-- <td><input id="check6" type="checkbox"></td> -->
								<td> <span class="searchpadding padding_top" style="float: left;"> <select name="statusRefId" 	class="form-control" id="statusId"   disabled ></select>
							</span></td>
							</tr>
							
						</table>

						<div class="clearfix"></div>
						<div class="clearfix"></div>

						<div class="clearfix"></div>
					</div>


					<!-- <span  class="searchpadding padding_top" style="float:left; font-weight: bold ">Monitor Logging in user </span>
		<span  class="searchpadding padding_top" style="float:left;">
		<select name="statusViewId" class="form-control" id="statusId" onclick = "ViewStatus(0)" > -->

					<div class="topbuttonholder">
						<form>
							<input type="hidden" id="hiddenbuId" name="buId" value="${sessionScope.userSession.buId}"> 
							<input	type="hidden" id="rollId" name="rollId"	value="${sessionScope.userSession.roleId}"> 
							<!-- <span	class="searchpadding padding_top"	style="float: left; width: 150px;">Partner Retting/Ranking </span> 
							<span class="searchpadding padding_top"		style="float: left;"> <select name="statusRefId" 	class="form-control" id="statusId"></select>
							</span> -->

							<div class="clearfix"></div>
							<div class="clearfix"></div>
							
<!-- 
							<input class="dbtn" value="Save" id="Save" type="button" onclick="submitAddChecklist();"> 
							<input class="dbtn" value="Cancel" id="Cancel" type="button" onclick="reload();">
								 -->
						 <button  id="save" class="btn btn-sm btn-primary" onClick="submitAddChecklist();"  title="Save"><i class='ace-icon fa fa-plus'></i>Save</button>
				         <button class="btn btn-sm btn-danger"  onClick="reload()"><i class='ace-icon fa fa-trash'></i>Cancel</button>
						
							<div class="clearfix"></div>
						</form>
					</div>
					<div class="clearfix"></div>
				</div>
			</div></div>
			<!-- Onboarding-->
			<!-- Bulk BulkServiceTeam user-->
<div class="modal fade" id="BulkServiceTeam" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Bulk Service Team Allocation for <span id="selectedItemzz"></span>
							Selected Partners</h4>
		      </div>
      <div class="modal-body">
<!-- 			<div id="BulkServiceTeam" style="padding: 10px; height: 250px;"> -->
<!-- 				<div id="popupwrapper_contactform"> -->

					<!-- <div class="heading_contactform">
						<h3>
							Bulk Service Team Allocation for <span id="selectedItemzz"></span>
							Selected Partners
						</h3>
					</div> -->
<!-- 					<div id="poptable_contactform" -->
<!-- 						style="padding: 10px; height: 250px;"> -->
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"><span id="bstapsttxt">PST</span>
							<span class="red">*</span> </span> <span
							class="searchpadding padding_top"
							style="float: left; width: 300px;"> <!-- <input type="text" class="form-control" placeholder="Harish Barke"> -->
							<select name="bstapstSn" id="bstapstSn" class="form-control"></select>
						</span> <span class="searchpadding padding_top"
							style="float: left; margin-top: 7px;"> <!-- <i class="searchiconblue"></i> --></span>

						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"><span id="bstapottxt">POT</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <!-- <input type="text" class="form-control" placeholder="Praful Panchal"> -->
							<select name="bstapotSn" id="bstapotSn" class="form-control"></select>
						</span> <span class="searchpadding padding_top"
							style="float: left; margin-top: 7px;"> <!-- <i class="searchiconblue"></i> --></span>

						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"><span id="bstapkttxt">PKT</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <!-- <input type="text" class="form-control" placeholder="Chetan Desai"> -->
							<select name="bstapktSn" id="bstapktSn" class="form-control"></select>

						</span> <span class="searchpadding padding_top"
							style="float: left; margin-top: 7px;"> <!-- <i class="searchiconblue"></i> --></span>


						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"><span id="bstarmtxt">RM</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <!-- <input type="text" class="form-control" placeholder="Chetan Desai"> -->
							<select name="bstarmSn" id="bstarmSn" class="form-control"></select>
						</span>



						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"><span
							id="bstarmHeadtxt">RM Head</span> </span> <span
							class="searchpadding padding_top"
							style="float: left; width: 300px;"> <!-- <input type="text" class="form-control" placeholder="Chetan Desai"> -->
							<select name="bstarmHeadSn" id="bstarmHeadSn"
							class="form-control"></select></span> <span
							class="searchpadding padding_top"
							style="float: left; margin-top: 7px;"> <!-- <i class="searchiconblue"></i> --></span>


						<div class="clearfix"></div>

						
					<br/> <br/>
					<span class="topbuttonholder">
					<!-- <input class="dbtn" value="Save" id="Save" type="button" 	onclick="addBulkSTAforPartner(1);"> 
					<input class="dbtn" value="Cancel" id="Cancel" type="button" onclick="window.location.reload(true);"></span>
					 -->
					<button  id="save" class="btn btn-sm btn-primary" onClick="addBulkSTAforPartner(1);"  title="Save"><i class='ace-icon fa fa-plus'></i>Save</button>
				    <button class="btn btn-sm btn-danger"  onClick="reload()"><i class='ace-icon fa fa-trash'></i>Cancel</button>
						</span>
					<div class="clearfix"></div>
				</div></div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div></div>
			<!-- End-->












			<!-- Change BU -->
			
<div class="modal fade" id="movePartnerdiv" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Change BU</h4>
		      </div>
      <div class="modal-body">			
			
<!-- 			<div id="movePartnerdiv"> -->
<!-- 				<div id="popupwrapper_contactform"> -->

					<!-- <div class="heading_contactform">
  			<span style="word-break:break-all;color: white; font-size: 1.15em;
											    margin-top: 1em;
											    margin-bottom: 1em;
											    margin-left: 0;
											    margin-right: 0;
    font-weight: bold;"> Change BU <span id="ptxt"></span>

</span></div> -->
					<input type="hidden" name="switchPartyId" id="switchPartyId" />
<!-- 					<div class="heading_contactform"> -->
<!-- 						<h3>Change BU</h3> -->
<!-- 					</div> -->
<!-- 					<div id="poptable_contactform" -->
<!-- 						style="padding: 10px; height: 254px;"> -->

						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Select BizUnit<span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <select
							id="bizunitname" name="bizunitname" class="form-control"
							onchange="getDepartment(this.value);">

						</select>
						</span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"> <span id="stapsttxt">PST</span>
							<span class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <select
							name="pstForBU" id="pstForBU" class="form-control">
								<option value="0">----Select PST----</option>
						</select>
						</span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"> <span id="stapottxt">POT</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <select
							name="potForBU" id="potForBU" class="form-control">
								<option value="0">----Select POT----</option>
						</select>
						</span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"> <span id="stapkttxt">PKT</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <select
							name="pktForBU" id="pktForBU" class="form-control">
								<option value="0">----Select PKT----</option>
						</select>
						</span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"> <span id="starmtxt">RM</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <select name="RMForBU"
							id="RMForBU" class="form-control">
								<option value="0">----Select RM----</option>
						</select>
						</span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"> <span
							id="starmHeadtxt">RM Head</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <select
							name="RMHeadForBU" id="RMHeadForBU" class="form-control">
								<option value="0">----Select RM Head----</option>
						</select>
						</span>
						<div class="clearfix"></div>
					</div>
					
			
					
					<div class="topbuttonholder" id="addbuttons" style="text-align: right;">
											<!-- <input class="dbtn" value="Change BU" id="move" type="button"	onclick="SwitchToPartner();"> 
											<input class="dbtn"	value="Cancel" id="Cancel" type="button" onclick="reload();">
											 -->
											<button  id="move" class="btn btn-sm btn-primary" onClick="SwitchToPartner();"  title="Change BU"><i class='ace-icon fa fa-plus'></i>Change BU</button>
				    						<button class="btn btn-sm btn-danger"  onClick="reload()"><i class='ace-icon fa fa-trash'></i>Cancel</button>
					
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div></div>
			<!-- End-->
















			<!-- ServiceTeamAllocation -->
			
<div class="modal fade" id="ServiceTeamAllocation" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Service Team Allocation for Partner <span id="ptxt"></span></h4>
		      </div>
      <div class="modal-body">				
<!-- 			<div id="ServiceTeamAllocation"> -->
<!-- 				<div id="popupwrapper_contactform"> -->

<!-- 					<div class="heading_contactform"> -->
<!-- 						<span -->
<!-- 							style="word-break: break-all; color: white; font-size: 1.15em; margin-top: 1em; margin-bottom: 1em; margin-left: 0; margin-right: 0; font-weight: bold;"> -->
<!-- 							Service Team Allocation for Partner <span id="ptxt"></span> -->

<!-- 						</span> -->
<!-- 					</div> -->
					<!-- <div id="poptable_contactform"
						style="padding: 10px; height: 230px;"> -->
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"><span id="stapsttxt">PST</span>
							<span class="red">*</span> </span> <span
							class="searchpadding padding_top"
							style="float: left; width: 300px;"> <!-- <input type="text" class="form-control"> -->
							<select name="stapstSn" id="stapstSn" class="form-control"></select>
						</span> <span class="searchpadding padding_top"
							style="float: left; margin-top: 7px;"> <!-- <i class="searchiconblue" onclick="searchPSTPKTPOTForSTA(42001)"></i> --></span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"><span id="stapottxt">POT</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <!-- <input type="text" class="form-control">-->
							<select name="stapotSn" id="stapotSn" class="form-control"></select>
						</span> <span class="searchpadding padding_top"
							style="float: left; margin-top: 7px;"> <!-- <i class="searchiconblue" onclick="searchPSTPKTPOTForSTA(42003)"></i> --></span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"><span id="stapkttxt">PKT</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <!-- <input type="text" class="form-control"> -->
							<select name="stapktSn" id="stapktSn" class="form-control"></select>
						</span> <span class="searchpadding padding_top"
							style="float: left; margin-top: 7px;"> <!-- <i class="searchiconblue" onclick="searchPSTPKTPOTForSTA(42002)"></i> --></span>

						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"><span id="starmtxt">RM</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <!-- <input type="text" class="form-control"> -->
							<select name="starmSn" id="starmSn" class="form-control"></select>
						</span> <span class="searchpadding padding_top"
							style="float: left; margin-top: 7px;"> <!-- <i class="searchiconblue" onclick="searchPSTPKTPOTForSTA(42004)"></i> --></span>



						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"><span id="starmHeadtxt">RM
								Head</span> </span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <!-- <input type="text" class="form-control"> -->
							<select name="starmHeadSn" id="starmHeadSn" class="form-control"></select>
						</span> <span class="searchpadding padding_top"
							style="float: left; margin-top: 7px;"> <!-- <i class="searchiconblue" onclick="searchPSTPKTPOTForSTA(42007)"></i> --></span>



						<span>&nbsp;<br /></span>
						<div class="clearfix"></div>

					</div>
					<div style="float: right;">
						<span class="topbuttonholder">
						<!-- <input class="dbtn" value="Save" id="Save" type="button" onclick="addSTAforPartner(1);"> 
						<input class="dbtn"	value="Cancel" id="Cancel" type="button" onclick="window.location.reload(true);">
						 -->
						<button  id="move" class="btn btn-sm btn-primary" onClick="addSTAforPartner(1);"  title="Save"><i class='ace-icon fa fa-plus'></i>Save</button>
				        <button class="btn btn-sm btn-danger"  onClick="reload()"><i class='ace-icon fa fa-trash'></i>Cancel</button>
					
						</span>
						</div>
						<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- End-->

		</div>

	
	<!-- delete-->
	<!--css popup window 2 close-->


	<!--Nav Menu Start-->
	<div class="navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle" data-target=".navbar-collapse"
					data-toggle="collapse" type="button">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!--<a class="navbar-brand" href="#"> </a>-->
			</div>

		</div>
	</div>
	<!--Nav Menu End-->
	<!--breadcrum Menu Start-->
	

	<!-- Center part start -->
	
							          
		<div class="page-header">
				<h1 class="pull-left"><B>Partner List</B></h1>
         	    <div class="clearfix"></div>
        </div>
	<section>
			<div class="container-body" style="margin-top: 0px;">
			<ul class="pagination pagination-sm"></ul> 
				<!-- center -->

				<div class="pull-right" id="partnerButtonsone" >

				
		 		 		 <button id="SPAddNewPartnerLink" class="btn btn-sm btn-primary " onClick="addNote();getPSTPKTPOTNames();"><i class='ace-icon fa fa-plus'></i>New Partner</button>
		                 <button class="btn btn-sm btn-danger" onClick="deletePartners();"><i class='ace-icon fa fa-trash'></i>Delete</button> 
		                 <button class="btn btn-sm btn-success" onClick="selectForWelcomeMail();"><i class='ace-icon fa fa-envelope-o'></i>Send Welcome Mail</button>        
		 				 <div class="btn-group">
												<button data-toggle="dropdown" class="btn btn-primary btn-white dropdown-toggle" aria-expanded="false">
													More Action
													<i class="ace-icon fa fa-angle-down icon-on-right"></i>
												</button>

												<ul class="dropdown-menu">
													<li id="SPBulkUploadPartnerLink"><a href="#" onClick="uploadPartner();"><span class="user">Bulk Upload Partner</span></a></li>
													<li id="SPBulkServiceTeamAlloctionLink"><a href="#" onClick="selectForBulkSTA();"><span class="user">Bulk Service Team Allocation </span></a></li>
													<li><a id="SPMassEmailLink" onclick="sendBlukEmail()"><i class="emailicon"></i><span class="user">Mass Email</span></a></li>
						         					<li><a id="SPMassSMSLink" onclick="sendMassSMS()"><i class="callicon"></i><span class="user">Mass SMS</span></a></li>
												</ul>
						</div>			 		 	 
					</div>
						
					
					<div class="clearfix"></div>
				
					<div class="table-responsive" id="display_table_lead" style="border: none;">
					<div id="toreload">
		            <table id="grid-table">   	                 
	                 </table>
	                 <div id="grid-pager"></div>
				
						<!-- Center-->
					</div>
					
				</div>
				
					
						<div class="pull-left">
							 
							 		 <div class="topmenuleft margin_5px" >
							
								<span>Export options:</span>
								<a href="<%=request.getContextPath()%>/partnersp/partnerCSV.htm?buId=${sessionScope.userSession.buId}&userId=${sessionScope.userSession.userId}"
								   title="Export in CSV" alt="Export in CSV"><i class="fa fa-file-pdf-o bigger-140"></i></a>
								<a href="<%=request.getContextPath()%>/partnersp/partnerExcel.htm?buId=${sessionScope.userSession.buId}&userId=${sessionScope.userSession.userId}"
								   title="Export in Excel" alt="Export in Excel"> <i class="fa fa-file-excel-o bigger-140"></i></a>
								<%-- <li> <a href="<%=request.getContextPath()%>/partnersp/partnerXML.htm?buId=${sessionScope.userSession.buId}&userId=${sessionScope.userSession.userId}.01"  title="Export in XML" alt="Export in XML"><i class="xmlcon"></i></a></li> --%>
							
							</div>	
						</div>
				
				<div class="pull-right" id="partnerButtonstwo" >
				<div class="hr-12"></div>
				 <button id="SPAddNewPartnerLink" class="btn btn-sm btn-primary" onClick="addNote();getPSTPKTPOTNames();"><i class='ace-icon fa fa-plus'></i>New Partner</button>
                 <button class="btn btn-sm btn-danger" onClick="deletePartners();"><i class='ace-icon fa fa-trash'></i>Delete</button> 
                 <button class="btn btn-sm btn-success" onClick="selectForWelcomeMail();"><i class='ace-icon fa fa-envelope-o'></i>Send Welcome Mail</button>        
					
					 <div class="btn-group">
												<button data-toggle="dropdown" class="btn btn-primary btn-white dropdown-toggle" aria-expanded="false">
													More Action
													<i class="ace-icon fa fa-angle-down icon-on-right"></i>
												</button>

												<ul class="dropdown-menu">
													<li id="SPBulkUploadPartnerLink"><a href="#" onClick="uploadPartner();"><span class="user">Bulk Upload Partner</span></a></li>
													<li id="SPBulkServiceTeamAlloctionLink"><a href="#" onClick="selectForBulkSTA();"><span class="user">Bulk Service Team Allocation </span></a></li>
													<li><a id="SPMassEmailLink" onclick="sendBlukEmail()"><i class="emailicon"></i><span class="user">Mass Email</span></a></li>
						         					<li><a id="SPMassSMSLink" onclick="sendMassSMS()"><i class="callicon"></i><span class="user">Mass SMS</span></a></li>
												</ul>
						</div>			 		
				</div>
				
			</div>
	</section>
	<!-- Center part End -->

	<footer>
		<jsp:include page="../common/footer.jsp" />
		<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
	</footer>
	<script>
	
	function savePingforedit(){
		//alert('HIIEE');
		var response=true;
		  jQuery.validator.addMethod("pst", function (value, element) {
		    	//alert($('#pstSn').val() );
		    	return response = ( $('#epstSn').val() == '0' ) ? false: true ;
		       }, "PST is required ");
		

		    jQuery.validator.addMethod("myarn", function (value, element) {
						/* if($('#ARN').val()==""){}else{var arn = $('#ARN').val();} */
						if($('#eARN').val()==""){}else{var arn = $('#eARN').val();}
						//alert("aarn"+arn);
							$.ajax({     
						     type: "POST",
						     url : $('#contextPath').val() +"/partnersp/getUniqueArn.htm?arn="+arn,  
						     dataType: 'json', 
						     contentType: 'application/json',     
						        success:function(result) {
						        	
						                 response = ( result != '' ) ? false: true ;
						   
						     }
						
					  });   
			return response;
		    }, "");
		    
		    
		 
		var validator=$('#FormEdit').validate({
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
			
			efirstName: {
				required: true
			},
			elastName: {
				required: true
			},
			ecommunicationEmailId: {// communicationEmailId  contactEmail  contactMobile ARN  pstSn
				required: true,
				email:true
			},
			econtactEmail:{
				required: true,
				email : true
			},
			econtactMobile:{
				required:true,
				number:true,
				minlength:10
			},
			eARN:{
				myarn:true,
				required:true,
				number:true
			},
			epstSn:{
				required: true,
				pst:true
			}
		},

		messages: {
			ecommunicationEmailId: {
				required: "Please provide a valid communication email.",
				email: "Please provide a valid communication email."
			},
			econtactEmail: {
				required: "Please provide a valid contact email.",
				email: "Please provide a valid communication email.",
				minlength: "Please provide a valid contact email."
			},
			econtactMobile:{
				number:"Please provide a valid Contact Mobile no.",
				minlength:"Please provide a valid Contact Mobile required",
			},
			eARN:{
				required:"ARN No. is required",
				number:"Please provide a valid ARN No.",
				myarn:"ARN No. Already Exist."
			},
			efirstName: "First name is required",
			elastName: "Last name is required",
			eloginName: "Login name is required",
			epstSn:"PST name is required"
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
				
				//alert('FORM  Validated');
				editPartner();
			
			}
		},
		invalidHandler: function (form) {
			
		}
	});
	
}
	
	
	
	
	
	
	
	
	
	function reload()
	{
	location.reload();
	}
	
function addNote(){
 
$("#addnote").modal('show');
//addPartnerRequiredValidation();
/* $("#tags").hide();
$("#deletenote, #editnote,#uploadUser,#BulkServiceTeam,#sendMail,#newMail,#ServiceTeamAllocation,#assignEmailAccount,#Onboarding,#movePartnerdiv,#ActionMenu6").model(hide);	

 */
}

function deleteNote(){

$("#deletenote").modal('show');
// $("#tags").hide();
// $(" #editnote,#uploadUser,#BulkServiceTeam,#sendMail,#newMail,#ServiceTeamAllocation,#assignEmailAccount,#Onboarding,#movePartnerdiv,#ActionMenu6").model(hide);	


}
function editNote(){
$("#editnote").modal('show');
// $("#tags").hide();
// $("#addnote, #deletenote,#uploadUser,#BulkServiceTeam,#sendMail,#newMail,#ServiceTeamAllocation,#assignEmailAccount,#Onboarding,#movePartnerdiv,#ActionMenu6").model(hide);	


}
function uploadPartner(){
	$("#uploadUser").modal('show');
// 	$("#tags").hide();
// 	$("#deletenote, #editnote,#addnote,#BulkServiceTeam,#sendMail,#newMail,#ServiceTeamAllocation,#assignEmailAccount,#Onboarding,#movePartnerdiv").model(hide);	

	
	}
function BulkServiceTeam(){
	 $("#BulkServiceTeam").modal('show');	
// 	$("#tags").hide(); 
// 	$("#deletenote, #editnote,#addnote, #uploadUser,#sendMail,#newMail,#ServiceTeamAllocation,#assignEmailAccount,#Onboarding,#movePartnerdiv,#ActionMenu6").model(hide);	

	}
function sendMail(){
	$("#sendMail").modal('show');
// 	$("#tags").hide();
// 	$("#deletenote, #editnote,#addnote, #uploadUser,#BulkServiceTeam,#newMail,#ServiceTeamAllocation,#assignEmailAccount,#Onboarding,#movePartnerdiv,#ActionMenu6").model(hide);	
	
	}
function newMail(){
	$("#newMail").modal('show');	
// 	$("#tags").hide();
// 	$("#deletenote, #editnote,#addnote, #uploadUser,#BulkServiceTeam,#sendMail,#ServiceTeamAllocation,#assignEmailAccount,#Onboarding,#movePartnerdiv,#ActionMenu6").model(hide);	
	
	}
function ServiceTeamAllocation(){
	//alert("H");
	 $("#ServiceTeamAllocation").modal('show');	
// 	$("#tags").hide(); */
// 	$("#deletenote, #editnote,#addnote, #uploadUser,#BulkServiceTeam,#sendMail,#newMail,#assignEmailAccount,#Onboarding,#movePartnerdiv,#ActionMenu6").model(hide);	
	
	}
function assignEmailAccount(){
	$("#assignEmailAccount").modal('show');
// 	$("#deletenote, #editnote,#addnote, #uploadUser,#BulkServiceTeam,#sendMail,#newMail,#ServiceTeamAllocation,#Onboarding,#movePartnerdiv,#ActionMenu6").model(hide);	
	}
function Onboarding(){
	$("#Onboarding").modal('show');
// 	$("#deletenote, #editnote,#addnote, #uploadUser,#BulkServiceTeam,#sendMail,#newMail,#ServiceTeamAllocation,#assignEmailAccount,#movePartnerdiv,#ActionMenu6").model(hide);	
	
	}
function movePartnerPopUp(partyid){
	switchPartner(partyid);
	$("#movePartnerdiv").modal('show');

// 	$("#deletenote, #editnote,#addnote, #uploadUser,#BulkServiceTeam,#ServiceTeamAllocation,#sendMail,#newMail,#assignEmailAccount,#Onboarding,#ActionMenu6").model(hide);	
	
	
	}
	
function reloadTable() {
	//$('#grid-table').jqGrid('GridUnload');  //this does the work of clearing out the table content and loading fresh data
	/* $("#editnote").modal('hide');
	$("#grid-table").trigger("reloadGrid");
	 */
	 $("#grid-table").jqGrid("setGridParam", { datatype: "json" }).trigger("reloadGrid", [{ current: true }]);
	}
</script>

	<script>
$(document).ready(function(){
	
//	openPopupWebApp('centerLoadingImage', 25, 35);
  $("#user").click(function(){
  $("#usermenu").slideToggle();
	});
	
  $("#Action1").click(function(){
  $("#ActionMenu1").slideToggle();
	});
	
	 $("#Action2").click(function(){
  $("#ActionMenu2").slideToggle();
	});
	
	 $("#Action3").click(function(){
  $("#ActionMenu3").slideToggle();
	});
	 $("#Action4").click(function(){
  $("#ActionMenu4").slideToggle();
	});
	
	 $("#Action5").click(function(){
  $("#ActionMenu25").slideToggle();
	});
	
	 $("#Action6").click(function(){
  $("#ActionMenu6").slideToggle();
	});
	
	 $("#Action7").click(function(){
  $("#ActionMenu7").slideToggle();
	});
});




function searchPST()
{
//alert('PST'+deptTypeId)
 $('#pstSn').empty();
	var newdeptTypeId = null;
	newdeptTypeId = 41001;// no use 
	      var hdnbuId = $('#hdnbuId').val();
		  $.ajax({
				 type :'POST',
		         url : $('#contextPath').val() +"/partnersp/searchPSTPKTPOT.htm?buId="+hdnbuId+"&deptTypeId="+newdeptTypeId,
				 success : function(result) 
				 {
					 
				        $('#pstSn').empty();
				        $("#pstSn").append('<option value="0">----Select PST----</option>');
					
				        $('#pktSn').empty();
						$("#pktSn").append('<option value="0">----Select PKT----</option>');
				
						$('#potSn').empty();
						$("#potSn").append('<option value="0">----Select POT----</option>');
				
					 
						$('#rmSn').empty();
						$("#rmSn").append('<option value="0">----Select RM----</option>');
					
					 
					 
					 
						$('#rmHeadSn').empty();
						$("#rmHeadSn").append('<option value="0">----Select RM Head----</option>');
					
					 $(result).each(   
							 
							 function(i, value) {
									//alert("42001 "+value.categoryId);
								switch(value.categoryId)
								{
								
								case 42001 : // alert("42001 "+value.categoryId);
												
								  			 $("#pstSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
						       					break;
								case 42002 :  
												
										    	$("#pktSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
											     	break;
								case 42003: 	
											    $("#potSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
											break;
								case 42004 : 
											
												$("#rmSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
																	break;
								case 42007 : 
													
											   $("#rmHeadSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
												break;
								default: 
										
								}
							 
			       			
									 
							      
								
						
					 });
			}
			});
			
}

function searchPSTForSTA(PSTTeamMemberId,stapstSn,PKTTeamMemberId,stapktSn,POTTeamMemberId,stapotSn,RMTeamMemberId,starmSn,RMHeadTeamMemberId,starmHeadSn)
{
		  var deptTypeId = 42001;
	      var hdnbuId = $('#hdnbuId').val();
	      $('#stapstSn').empty();
	      $("#stapstSn").append('<option value="0">----Select PST-----</option>');
		 
	      $('#stapktSn').empty();
	      $("#stapktSn").append('<option value="0">----Select PKT-----</option>');
	      $('#stapotSn').empty();
	  	  $("#stapotSn").append('<option value="0">----Select POT-----</option>');
		  
	      $('#starmSn').empty();
	      $("#starmSn").append('<option value="0">----Select RM-----</option>');
		  
	      $('#starmHeadSn').empty();
	      $("#starmHeadSn").append('<option value="0">----Select RM Head-----</option>');
		  
	      $.ajax({
				 type :'POST',
		         url : $('#contextPath').val() +"/partnersp/searchPSTPKTPOT.htm?buId="+hdnbuId+"&deptTypeId="+deptTypeId,
				 success : function(result) 
				 {
					/*  if(deptTypeId==42001){
					    $('#stapstSn').empty();
					    $("#stapstSn").append('<option value="0">----Select PST-----</option>');
					 } */
					
							 
					 $(result).each(
			       			 function(i, value) {
			
			       				switch(value.categoryId)
								{
								case 42001 :  
											if(PSTTeamMemberId==value.teamMemberID && stapstSn==value.name){
						       					 $("#stapstSn").append('<option value="'+ value.teamMemberID+'" selected="selected">'+ value.name + '</option>');
						       					}else{
						       					 $("#stapstSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
						       					}
						       					break;
								case 42002 :  
									if(PKTTeamMemberId==value.teamMemberID && stapktSn==value.name){
								        $("#stapktSn").append('<option value="'+ value.teamMemberID+'" selected="selected">'+ value.name + '</option>');
									}else{
										$("#stapktSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
									}
											     	break;
								case 42003: 
									if(POTTeamMemberId==value.teamMemberID && stapotSn==value.name){
								        $("#stapotSn").append('<option value="'+ value.teamMemberID+'" selected="selected">'+ value.name + '</option>');
									}else{
										$("#stapotSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
									}
									break;
									
								case 42004 : 
									if(RMTeamMemberId==value.teamMemberID && starmSn==value.name){
									     $("#starmSn").append('<option value="'+ value.teamMemberID+'" selected="selected">'+ value.name + '</option>');
										}else{
											$("#starmSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
										}
												
												break;
								case 42007 : 
											if(RMHeadTeamMemberId==value.teamMemberID && starmHeadSn==value.name){
										        $("#starmHeadSn").append('<option value="'+ value.teamMemberID+'" selected="selected">'+ value.name + '</option>');
											}else{
												$("#starmHeadSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
											}
												
												break;
								default: 
									
								}
										
						 });
				}
				});
	}


function searchPSTPKTPOTForBulkSTA(deptTypeId)
{
	      var hdnbuId = $('#hdnbuId').val();
		  $.ajax({
				 type :'POST',
		         url : $('#contextPath').val() +"/partnersp/searchPSTPKTPOT.htm?buId="+hdnbuId+"&deptTypeId="+deptTypeId,
				 success : function(result) 
				 {
				
					    $('#bstapstSn').empty();
					    $("#bstapstSn").append('<option value="0">----Select PST-----</option>');
					 	$('#bstapktSn').empty();
						$("#bstapktSn").append('<option value="0">----Select PKT-----</option>');
					
					
						$('#bstapotSn').empty();
						$("#bstapotSn").append('<option value="0">----Select POT-----</option>');
					 
					 
					
						$('#bstarmSn').empty();
						$("#bstarmSn").append('<option value="0">----Select RM-----</option>');
					
					 	$('#bstarmHeadSn').empty();
						$("#bstarmHeadSn").append('<option value="0">----Select RM Head-----</option>');
					 
							 
					 $(result).each(
			       			 function(i, value) {
			       			  	
			       				switch(value.categoryId)
								{
								case 42001 :  
											$("#bstapstSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
											 break;
								
								case 42002 :  
											$("#bstapktSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
									    	 break;
								case 42003: 
												$("#bstapotSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
												break;
													
								case 42004 :  
											$("#bstarmSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
									 		break;
								case 42007 :
											$("#bstarmHeadSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
											break;
								default: 
									
								}
			       				 
			       				
					 });
			}
			});
}

function getPSTPKTPOTNames()
{
	      var hdnbuId = $('#hdnbuId').val();
		  $.ajax({
				 type :'POST',
		         url : $('#contextPath').val() +"/partnersp/getPSTPKTPOTNames.htm?buId="+hdnbuId,
				 success : function(result) 
				 {
					 $(result).each(
			       			 function(i, value) {
			       			  			       				
			       			 //alert("shortName"+ value.shortName);
			                 //alert("departmenttypeid:"+ value.departmenttypeid);
			       			     if(value.departmenttypeid==42001){
			                         $("#psttxt").html(value.shortName);
			                        }
			                        
			                        if(value.departmenttypeid==42002){
			                       	 $("#pkttxt").html(value.shortName);
			                       }
			                        if(value.departmenttypeid==42003){
			                       	 $("#pottxt").html(value.shortName);
			                       }
			                        if(value.departmenttypeid==42004){
				                     $("#rmtxt").html(value.shortName);
				                   }
			                       
			                        if(value.departmenttypeid==42007){
					                  $("#rmHeadtxt").html(value.shortName);
					                }
					 });
			}
			});
			 searchPST();
			 
			 // getLocation();
			  /* generatePassword(); */
}

function sendToSTAedit(partnerspartyid,stapstSn,stapktSn,stapotSn,starmSn,starmHeadSn,fname,lname,PSTTeamMemberId,PKTTeamMemberId,POTTeamMemberId,RMTeamMemberId,RMHeadTeamMemberId){
	    $('#partnerspartyid').val(partnerspartyid);
        $("#ptxt").html(fname+' '+lname);
        
        ServiceTeamAllocation();
		/* searchPSTPKTPOTForSTA(42001,PSTTeamMemberId,stapstSn);
 		searchPSTPKTPOTForSTA(42002,PKTTeamMemberId,stapktSn);
		searchPSTPKTPOTForSTA(42003,POTTeamMemberId,stapotSn);
		searchPSTPKTPOTForSTA(42004,RMTeamMemberId,starmSn);
		searchPSTPKTPOTForSTA(42007,RMHeadTeamMemberId,starmHeadSn); */
		
       /*  searchPSTForSTA(42001,PSTTeamMemberId,stapstSn);
 		searchPKTForSTA(42002,PKTTeamMemberId,stapktSn);
		searchPOTForSTA(42003,POTTeamMemberId,stapotSn);
		searchRMForSTA(42004,RMTeamMemberId,starmSn);
		searchRMHeadForSTA(42007,RMHeadTeamMemberId,starmHeadSn); */
		
		searchPSTForSTA(PSTTeamMemberId,stapstSn,PKTTeamMemberId,stapktSn,POTTeamMemberId,stapotSn,RMTeamMemberId,starmSn,RMHeadTeamMemberId,starmHeadSn);
 }

function sendToAssignCommunicationEmail(partnerspartyid,emailCommunicationName,emailCommunicationID,firstName,lastName){
	 $('#partnerspartyid').val(partnerspartyid);
	 $('#communicationEmail').val(emailCommunicationID);
	 $('#communicationName').val(emailCommunicationName);
     $("#acaforptxt").html(firstName+' '+lastName);
  }

$('#check1').click(function() {
	//alert("hie");
	if(document.getElementById("check1").checked == true ){		$("#proSponDate").prop("disabled", false);		}
	else{		$("#proSponDate").prop("disabled", true);	}
	});

$('#check2').click(function() {
	if(document.getElementById("check2").checked == true ){	$("#welnConDate").prop("disabled", false);		}
	else{			$("#welnConDate").prop("disabled", true);	}
	});
	
$('#check3').click(function() {
	if(document.getElementById("check3").checked == true ){		$("#agreeSignDate").prop("disabled", false);		}
	else{		$("#agreeSignDate").prop("disabled", true);	}
	});
	
$('#check4').click(function() {
	if(document.getElementById("check4").checked == true ){		$("#onBoaredDate").prop("disabled", false);		}
	else{		$("#onBoaredDate").prop("disabled", true);	}
	});
	
function sendToOnboardingCheckList(partnerspartyid,emailCommunicationID,firstName,lastName){
	 $('#communicationEmail').val(emailCommunicationID);
	 $("#ChecklistPtxt").html(firstName+' '+lastName);
	 $('#partnerspartyid').val(partnerspartyid);
	  //alert("baba1");
  $.ajax({
		 type :'POST',
     	 url : $('#contextPath').val() +"/partnersp/loadOnboardChecklist.htm?partnerspartyid="+partnerspartyid,
		
     	 success : function(result) {
     		//alert("Hii in 1.1");
     		 
     	    	 $(result).each(
		       			 function(i, value) {
		       			  	
		       				
		       				 var module = value.onboardListId; 
		       	switch(module){
		       	case '91123' :  
     	    							$('#proSponDate').val(value.onboardListValue);
     	    							if(value.onboardListValue == null || $('#proSponDate').val() =='' || $('#proSponDate').val() ==' '){}else{ document.getElementById("check1").checked = true; $("#proSponDate").prop("disabled", false);} 
     	    							break;
     	    							
     	    							
     	    		case '91124' : 		 
     	    								$('#welnConDate').val(value.onboardListValue);  
     	    							if(value.onboardListValue == null ||$('#welnConDate').val() == '' ||$('#welnConDate').val() == ' '){}else{ document.getElementById("check2").checked = true; $("#welnConDate").prop("disabled", false); } 
     	    							break;		
     	    							
     	    		case '91125' : 		
     	    							$('#agreeSignDate').val(value.onboardListValue);
     	    							if(value.onboardListValue == null || $('#agreeSignDate').val() == '' || $('#agreeSignDate').val() == ' '){}else{ document.getElementById("check3").checked = true; $("#agreeSignDate").prop("disabled", false); }
     	    							break;
     	    							
     	    		case '91126' : 		
     	    							$('#onBoaredDate').val(value.onboardListValue);  
     	    							if(value.onboardListValue == null || $('#onBoaredDate').val() == '' || $('#onBoaredDate').val() == ' '){}else{ document.getElementById("check4").checked = true; $("#onBoaredDate").prop("disabled", false); } 
     	    							break;
     	    		
     	    		case '91127' :    /* $('#regionId').val(); */
			     	    		   	var select = document.getElementById("regionId");
									 for(var i = 0;i < select.options.length;i++){
									     if(select.options[i].value == value.onboardListValue  )
									     {
									         select.options[i].selected = true;
									     }
									 }	
     	    			break;
     	    			
     	    		
     	    		default: //alert("default");
     	    			
     	    	}
		});
     	    	 
     	    	 
     	    	 $.ajax({
     				
     				type : "POST", 
     				url :$('#contextPath').val()+"/dashboard/getCurruntRatingnReason.htm?partnerParty="+partnerspartyid,
     				//dataType: 'json',
     				contentType : 'application/json',
     				success : function(result) {
     					$(result).each(function(i, obj) {
     						
     					  //alert("success");
     						if(obj.ratingId == null){
     						//	alert("If");
     							 return false;
     						}else{
     							//alert("else");
     					  ratingid= obj.ratingId;
     						
     					  //alert("if"+ratingid);
     					    var select = document.getElementById("statusId");
     						 for(var i = 0;i < select.options.length;i++){
     						     if(select.options[i].value == ratingid  )
     						     {
     						         select.options[i].selected = true;
     						     }
     						 }	
     						 
     						
     						}
     						
     					 });
     					  			 
     				}
     		 
     		 });
     	    	 
     	    	 
     	    	 
     	    	 
    }	
	 
	});
}
 
 
function submitAddChecklist(){
				
	
		//alert("save");
	
		 var hdnbuId = $('#hdnbuId').val();
	
		 var hdnpartyId = $('#partnerspartyid').val();
		 var hdnuserId = $('#hdnuserId').val();
		 var PSdate = $('#proSponDate').val();
		 var WCdate = $('#welnConDate').val();
		 var ASdate = $('#agreeSignDate').val();
		 var OBdate = $('#onBoaredDate').val();
		 var region = $('#regionId').val();
		
	
			
		  $.ajax({
				 type :'POST',
		         url : $('#contextPath').val() +"/partnersp/saveChecklist.htm?&hdnpartyId="+hdnpartyId+"&hdnuserId="+hdnuserId+"&PSdate="+PSdate+"&WCdate="+WCdate+"&ASdate="+ASdate+"&OBdate="+OBdate+"&region="+region+"&hdnbuId="+hdnbuId,
				 success : function(result)
				 {
					 alert('Save Checklist Successfully.');
					 window.location.reload(true);
			     }
			});

	
}

/* hdnpartyId+"&hdnuserId="+hdnuserId+"&PSdate="+PSdate+"&WCdate="+WCdate+"&ASdate="+ASdate+"&OBdate="+OBdate+"&region="+region
<root><hdnpartyId>hdnpartyId</hdnpartyId></root> */

function getPSTPKTPOTForSTA()
{
	      var hdnbuId = $('#hdnbuId').val();
	      
		  $.ajax({
				 type :'POST',
		         url : $('#contextPath').val() +"/partnersp/getPSTPKTPOTNames.htm?buId="+hdnbuId,
				 success : function(result) 
				 {
					 $(result).each(
			       			 function(i, value) {
			       			  			       				
			       			 //alert("shortName"+ value.shortName);
			                 //alert("departmenttypeid:"+ value.departmenttypeid);
			       			     if(value.departmenttypeid==42001){
			                         $("#stapsttxt").html(value.shortName);
			                        }
			                        
			                        if(value.departmenttypeid==42002){
			                       	 $("#stapkttxt").html(value.shortName);
			                       }
			                        if(value.departmenttypeid==42003){
			                       	 $("#stapottxt").html(value.shortName);
			                       }
			                        if(value.departmenttypeid==42004){
				                     $("#starmtxt").html(value.shortName);
				                   }
			                        if(value.departmenttypeid==42007){
					                 $("#starmHeadtxt").html(value.shortName);
					               }
			                        
					 });
			}
			});

   }

function getPSTPKTPOTBulkForSTA()
{
	      var hdnbuId = $('#hdnbuId').val();
	      
		  $.ajax({
				 type :'POST',
		         url : $('#contextPath').val() +"/partnersp/getPSTPKTPOTNames.htm?buId="+hdnbuId,
				 success : function(result) 
				 {
					 $(result).each(
			       			 function(i, value) {
			       			  			       				
			       			 //alert("shortName"+ value.shortName);
			                 //alert("departmenttypeid:"+ value.departmenttypeid);
			       			     if(value.departmenttypeid==42001){
			                         $("#bstapsttxt").html(value.shortName);
			                        }
			                        
			                        if(value.departmenttypeid==42002){
			                       	 $("#bstapkttxt").html(value.shortName);
			                       }
			                        if(value.departmenttypeid==42003){
			                       	 $("#bstapottxt").html(value.shortName);
			                       }
			                        if(value.departmenttypeid==42004){
				                     $("#bstarmtxt").html(value.shortName);
				                   }
			                        if(value.departmenttypeid==42007){
					                  $("#bstarmHeadtxt").html(value.shortName);
					               }
					 });
			}
			});

			  
}



function addPartner(savendclose)
{
	 var fname = $('#firstName').val();
	 var lname = $('#lastName').val();
	 var coname = $('#companyName').val();
	 var cmail = $('#contactEmail').val();
	 var cmobile = $('#contactMobile').val();
	 var arn = $('#ARN').val();
	 var euin = $('#euin').val();
	 //alert("euin:::"+euin);
	 var location = $('#location').val();
	 var state = $('#state').val();
    // var location = jQuery("#location option:selected").val();
	 var pst = jQuery("#pstSn option:selected").val();
	 var pkt = jQuery("#pktSn option:selected").val();
	 var pot = jQuery("#potSn option:selected").val(); 
	 var rm = jQuery("#rmSn option:selected").val(); 
	 var rmHead = jQuery("#rmHeadSn option:selected").val(); 
	 var loginname = $('#loginName').val();
	 var communicationEmailId = $('#communicationEmailId').val();
	 
	 var hdnbuId = $('#hdnbuId').val();
	 var hdnuserId = $('#hdnuserId').val();
	 var domain;
		if(hdnbuId=="27827"){
			domain="@shubhchintak.net";
			communicationEmailId = communicationEmailId + domain;
		}
		if(hdnbuId=="27828"){
			domain=cmail.split("@")[1];
		}
		if(hdnbuId=="27829"){
			domain="@spacapital.in";
			communicationEmailId = communicationEmailId + domain;
		}
		if(hdnbuId=="27830" || hdnbuId=="109612"){
			domain="@dfdaonline.com";
			communicationEmailId = communicationEmailId + domain;
		}
		var contactemail=communicationEmailId;
		$('#hdncontactemail').val(contactemail);
	
	 
		  $.ajax({
				 type :'POST',
		         url : $('#contextPath').val() +"/partnersp/addPartner.htm?firstName="+fname+"&lastName="+lname+"&companyName="+coname+"&contactEmail="+cmail+"&contactMobile="+cmobile+"&ARN="+arn+"&pst="+pst+"&pkt="+pkt+"&pot="+pot+"&rm="+rm+"&rmHead="+rmHead+"&hdnbuId="+hdnbuId+"&hdnuserId="+hdnuserId+"&euin="+euin+"&state="+state+"&location="+location+"&loginname="+loginname+"&communicationEmailId="+communicationEmailId,
				 success : function(result)
				 {
					 var zero="0";
					 result=result.split("~");
					 
					 if(result[0]==1){
						 alert('Partner already exist.');
						 bootbox.confirm("Partner already exist.", function(result) { 
			                   if(result) {
			                   // document.getElementById("autopingForm").reset();
			                }
			               });
					 }
					/*  if(result > 1){}else{
						 if(result==1){}else{
						 alert("There is some error while adding partner due to email id creation on "+domain+",\n Please see below error for details.\n Error is : "+result);
						 }
					 } */
					 if(result[0]!=1 && result[0] > 1){
						 if(result[1] != zero){
							/*  alert("Partner added. \n There is some error while email creation on mithi for "+domain+",\n Please see below error.\n Error is : "+result[1]); */
							 //alert("Partner added. \n There is error while email creation on mithi.\n Either it is duplicate or Not Supported by Mithi. For more details Please contact Administrator.");
							 bootbox.confirm("Partner added. \n There is error while email creation on mithi.\n Either it is duplicate or Not Supported by Mithi. For more details Please contact Administrator.", function(result) { 
				                   if(result) {
				                   // document.getElementById("autopingForm").reset();
				                }
				               });
						 }else{
							 //alert('Partner added.');
							 bootbox.confirm("Partner added.", function(result) { 
				                   if(result) {
				                   // document.getElementById("autopingForm").reset();
				                }
				               });
						 }
					 }
					
					 if(savendclose==1){
						 window.location.reload(true);
						 resetval();
					  } 
						  if(savendclose==0){
							  resetval();
							
						  	 searchPST();
						  	
						  
							
					      }
						  
						 // resetval();
			}
			});
		  
		}



function addSTARequiredValidation(){
	if (($('#stapstSn').val()=="0") || ($('#stapstSn').val()==null) || ($("#stapstSn option:selected").text()=="")) {
		 alert("PST is required.");
		 $("#stapstSn").focus();
	    return false;
	}
	return true;
  }
  
function addBulkSTARequiredValidation(){
	if (($('#bstapstSn').val()=="0") || ($('#bstapstSn').val()==null) || ($("#bstapstSn option:selected").text()=="")) {
		 alert("PST is required.");
		 $("#bstapstSn").focus();
	    return false;
	}
	return true;
  }

function addSTAforPartner(savendclose)
{
	 var pst = jQuery("#stapstSn option:selected").val();
	 var pkt = jQuery("#stapktSn option:selected").val();
	 var pot = jQuery("#stapotSn option:selected").val(); 
	 var rm = jQuery("#starmSn option:selected").val();
	 var rmHead = jQuery("#starmHeadSn option:selected").val();
	 var partnerspartyid = $('#partnerspartyid').val();

	 
	 if(addSTARequiredValidation()==true){
		  $.ajax({
				 type :'POST',
		         url : $('#contextPath').val() +"/partnersp/addSTAforPartner.htm?pst="+pst+"&pkt="+pkt+"&pot="+pot+"&rm="+rm+"&rmHead="+rmHead+"&partnerspartyid="+partnerspartyid,
				 success : function(result)
				 {
					 alert('Service Team Member allocated successfully.');
					 $('#stapstSn').empty();
					 $('#stapktSn').empty();
					 $('#stapotSn').empty();
					 $('#starmSn').empty();
					 $('#starmHeadSn').empty();
					 if(savendclose==1){
						 location.reload(1);
					 }
			}
			});
}
}
function selectForBulkSTA(){
	var selectedlvals =  new Array();
	var cntr=0;
	/* $('#grid-table :checked').each(function(i, obj) {
		if($(this).attr('id')!='selectAll' && $(this).attr('id')!='chkdeleteselect' && $(this).attr('id')!='' && $(this).attr('id')!=undefined && $(this).attr('id')!=0){
			selectedlvals[cntr] = $(this).attr('id');
			cntr+=1;
		}
		
	}); */
	 $('input:checkbox[name=chkdeleteselect]:checked').each(function() {
		  selectedlvals.push($(this).val());
	  }); 
	 //alert('Selected Checkbox values are: ' + selectedlvals);
	 $('#selectedItemzz').html(selectedlvals.length);
	 
	if(selectedlvals == ""){
	 alert('Please select at least one Partner to bulk service team allocation!');
	  $('#ActionMenu6').hide();
	 return;
  }else{
	  getPSTPKTPOTBulkForSTA();
	  searchPSTPKTPOTForBulkSTA(42001);
	  searchPSTPKTPOTForBulkSTA(42002);
	  searchPSTPKTPOTForBulkSTA(42003);
	  searchPSTPKTPOTForBulkSTA(42004);
	  searchPSTPKTPOTForBulkSTA(42007);BulkServiceTeam();
  }
}

function selectForWelcomeMail(){
	var selectedlvals = [];
	$('#grid-table :checked').each(function(i, obj) {
		selectedlvals[i] = $(this).attr('id');
	});
	 //alert('Selected Checkbox values are: ' + selectedlvals);
	 $('#selectedItemz').html(selectedlvals.length);
	 
	if(selectedlvals == ""){
		bootbox.dialog({
				message: "<span class='bigger-110'>Please select at least one Partner to send welcome mail!</span>",
				buttons: 			
				{
					"click" :
					{
						"label" : "OK!",
						"className" : "btn-sm btn-primary",
						"callback": function() {
							
						}
					}
				}
			});
	  $('#ActionMenu6').hide();
	 return;
  }else{
	  sendMail();
  }
}

function addBulkSTAforPartner(savendclose)
{
	 var pst = jQuery("#bstapstSn option:selected").val();
	 var pkt = jQuery("#bstapktSn option:selected").val();
	 var pot = jQuery("#bstapotSn option:selected").val();
	 var rm = jQuery("#bstarmSn option:selected").val(); 
	 var rmHead = jQuery("#bstarmHeadSn option:selected").val(); 
	 /* var partnerspartyid = $('#partnerspartyid').val(); */
	 var selectedlvals = [];
	  $('input:checkbox[name=chkdeleteselect]:checked').each(function() {
		  selectedlvals.push($(this).val());
	  });
	 
	 if(addBulkSTARequiredValidation()==true){
		  $.ajax({
				 type :'POST',
		         url : $('#contextPath').val() +"/partnersp/addBulkSTAforPartner.htm?pst="+pst+"&pkt="+pkt+"&pot="+pot+"&rm="+rm+"&rmHead="+rmHead+"&partnerspartyidz="+selectedlvals,
				 success : function(result)
				 {
					 alert('Service Team Member allocated successfully.');
					 $('#bstapstSn').empty();
					 $('#bstapktSn').empty();
					 $('#bstapotSn').empty();
					 $('#bstarmSn').empty();
					 $('#bstarmHeadSn').empty();
					 if(savendclose==1){
						 window.location.reload(true);
					 }
			}
			});
}
}

function sendWelcomeMail(savendclose)
{
	selectedlvals = new Array();
	var cntr=0;
	 
	$('#grid-table :checked').each(function(i, obj) {
		if($(this).attr('id')!='selectAll' && $(this).attr('id')!='chkdeleteselect' && $(this).attr('id')!='' && $(this).attr('id')!=undefined && $(this).attr('id')!=0){
		selectedlvals[cntr] = $(this).attr('id');
		cntr+=1;
	}
		
	});
	 //alert("selectedlvals:"+selectedlvals);
		  $.ajax({
				 type :'POST',
		         url : $('#contextPath').val() +"/partnersp/sendWelcomeMail.htm?partnerspartyidz="+selectedlvals,
				 success : function(result)
				 {
					 alert('Welcome Mail sent successfully.');
					 if(savendclose==1){
						 window.location.reload(true);
					 }
			}
			});
}

function resetval(){
	 $('#firstName').val('');
	 $('#lastName').val('');
	 $('#companyName').val('');
	 $('#contactEmail').val('');
	 $('#contactMobile').val('');
	 $('#ARN').val('');
	 $('#euin').val('');
	 $('#state').empty();
	 $('#location').empty();
	 $('#pstSn').empty();
	 $('#pktSn').empty();
	 $('#potSn').empty();
	 $('#loginName').val('');
	 $('#hdnarn').val('');
	 $('#rmSn').empty();
	 $('#rmHeadSn').empty();
	 $('#communicationEmailId').val('');
	 $('#stapstSn').empty();
	 $('#stapktSn').empty();
	 $('#stapotSn').empty();
	 $('#starmSn').empty();
	 $('#starmHeadSn').empty();
	  state('add',0);
}

function eresetval(){
	 $('#efirstName').val('');
	 $('#elastName').val('');
	 $('#ecompanyName').val('');
	 $('#econtactEmail').val('');
	 $('#econtactMobile').val('');
	 $('#eARN').val('');
	 $('#eeuin').val('');
	 $('#elocation').empty();
	 $('#epstSn').empty();
	 $('#epktSn').empty();
	 $('#epotSn').empty();
	 $('#ermSn').empty();
	 $('#ermHeadSn').empty();
	 //$('#eloginname').attr('readonly', false);
	 $('#eloginname').val('');
	 $('#ecommunicationEmailId').val('');
}
function validEmail() 
{
	var email = $('#contactEmail').val().toLowerCase(); 
    var filter =/^([a-z0-9_\-\.])+\@([a-z0-9_\-\.])+\.([a-z]{2,4})$/;
    
    if (filter.test(email)) 
    {
        return true;
    }
    else 
    {
        return false;
    }
}

function cevalidEmail() 
{
	
	var email = $('#hdncontactemail').val().toLowerCase(); 
	var filter =/^([a-z0-9_\-\.])+\@([a-z0-9_\-\.])+\.([a-z]{2,4})$/;
    
    if (filter.test(email)) 
    {
        return true;
    }
    else 
    {
        return false;
    }
}

function ecevalidEmail() 
{
	var email = $('#ecommunicationEmailId').val().toLowerCase(); 
    var filter =/^([a-z0-9_\-\.])+\@([a-z0-9_\-\.])+\.([a-z]{2,4})$/;
    
    if (filter.test(email)) 
    {
        return true;
    }
    else 
    {
        return false;
    }
}

function evalidEmail() 
{
	var email = $('#econtactEmail').val().toLowerCase(); 
    var filter =/^([a-z0-9_\-\.])+\@([a-z0-9_\-\.])+\.([a-z]{2,4})$/;
    
    if (filter.test(email)) 
    {
        return true;
    }
    else 
    {
        return false;
    }
}

function validAssignCommunicationEmail(email) 
{
	//var email = $('#communicationEmail').val().toLowerCase(); 
    var filter =/^([a-z0-9_\-\.])+\@([a-z0-9_\-\.])+\.([a-z]{2,4})$/;
    
    if (filter.test(email)) 
    {
        return true;
    }
    else 
    {
        return false;
    }
}

function assignCommunicationEmail()
{
	 var communname =  $('#communicationName').val();
	 var cmail = $('#communicationEmail').val();
	 var hdnbuId = $('#hdnbuId').val();
	 var hdnuserId = $('#hdnuserId').val();
	 var hdnpartyId = $('#partnerspartyid').val();
	 var email = $('#communicationEmail').val().toLowerCase(); 
	 if(assignCommunicationEmailValidation(email)==true){
		  $.ajax({
				 type :'POST',
		         url : $('#contextPath').val() +"/partnersp/assignCommunicationEmail.htm?&communname="+communname+"&contactEmail="+cmail+"&hdnbuId="+hdnbuId+"&hdnuserId="+hdnuserId+"&hdnpartyId="+hdnpartyId,
				 success : function(result)
				 {
					 alert('Assigned Communication Email Successfully.');
					 window.location.reload(true);
			     }
			});
	 }
	 else{
			$("#communicationEmail").val('');
				$("#communicationEmail").focus();		 
	 }
}

$('#communicationName').blur(function(){
	   if ($('#communicationName').val().match(/[^a-zA-Z0-9. ]/g)) {
       this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
   }
}); 

function assignCommunicationEmailValidation(email){
	
if(validAssignCommunicationEmail(email)== false)
{ 		
	 	alert('Please enter the valid Email Id');
	
		return false;
}
return true;
}

function addPartnerRequiredValidation(){
	
	
	
	
	/* 
	 if ($('#firstName').val().trim()=="") {
		 alert("First name is required.");
		 $("#firstName").focus();
         return false;
     } 
	 if ($('#lastName').val().trim()=="") {
		 alert("Last name is required.");
		 $("#lastName").focus();
         return false;
     } 
	 
	 if ($('#loginName').val().trim()=="") {
		 alert("Login Name is required.");
		 $("#loginName").focus();
         return false;
     } 
	
	
	 if ($('#communicationEmailId').val().trim()=="") {
		 alert("Contact Email is required.");
		 $("#communicationEmailId").focus();
         return false;
     } 
	 
		if(cevalidEmail()== false)
		{
			 	alert('Please enter the valid Contact Email');
			 	 $("#communicationEmailId").val('');
			 	 $("#communicationEmailId").focus();
				return false;
	    }
	 
	 if ($('#contactEmail').val().trim()=="") {
		 alert("Alternate Email is required.");
		 $("#contactEmail").focus();
         return false;
     }
	 
	 if(validEmail()== false)
		{
			 alert('Please enter the valid Alternate Email');
			 $("#contactEmail").val('');
			 $("#contactEmail").focus();
			 return false;
	    }
	 
	 
	 if ($('#contactMobile').val().trim()=="") {
		 alert("Contact No is required.");
		 $("#contactMobile").focus();
         return false;
     } 
	 if ($('#ARN').val().trim()=="") {
		 alert("ARN is required.");
		 $("#ARN").focus();
         return false;
     } 
	 
	 if ($('#pstSn').val()=="0" || $('#pstSn').val()==null || $("#pstSn option:selected").text()=="") {
		 alert("PST is required.");
		 $("#pstSn").focus();
         return false;
     }
	
	return true; */
}

$('#firstName').blur(function(){
	   if ($('#firstName').val().match(/[^a-zA-Z0-9. ]/g)) {
          this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
      }
 }); 
 
$('#lastName').blur(function(){
	   if ($('#lastName').val().match(/[^a-zA-Z0-9. ]/g)) {
       this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
   }
}); 

$('#loginName').blur(function(){
	 //alert($('#quickSearch').val());
	  var arr = $('#loginName').val();
	if( arr.match(/\s/g))
	{
	  alert("Login Name not allow Space");
	}
	 var str='';
	  str = arr.replace(/\s/g, '');
	  
	  $('#loginName').val(str);
	  });

/* $('#loginName').blur(function(){
	   if ($('#loginName').val().match(/[^a-zA-Z0-9. ]/g)) {
       this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
   }
});  */

$('#companyName').blur(function(){
	   if ($('#companyName').val().match(/[^a-zA-Z0-9. ]/g)) {
       this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
   }
}); 

 $('#communicationEmailId').blur(function(){
	   if ($('#communicationEmailId').val().match(/[^a-zA-Z0-9. ]/g)) {
    this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
}
}); 


$('#contactMobile').blur(function(){
	/* if($('#contactMobile').val().length < 10){
		 alert("Contact No's length should not be less than 10 digit.");
		 $('#contactMobile').val('');
		 //$("#contactMobile").focus();
	} */
	   if ($('#contactMobile').val().match(/[^0-9 ]/g)) {
       this.value = this.value.replace(/[^0-9 ]/g, '');
   }
}); 

$('#ARN').blur(function(){
	if ($('#ARN').val().match(/[^0-9 ]/g)) {
	       this.value = this.value.replace(/[^0-9 ]/g, '');
	   }
}); 

/*  $('#euin').blur(function(){
	if ($('#euin').val().match(/[^a-zA-Z0-9. ]/g)) {
	       this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
	   }
}); */ 

/*  $('#location').blur(function(){
 	if ($('#location').val().match(/[^0-9 ]/g)) {
 	       this.value = this.value.replace(/[^0-9 ]/g, '');
 	   }
 });  */

$('#pstSn').blur(function(){
	   if ($('#pstSn').val().match(/[^a-zA-Z0-9. ]/g)) {
    this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
}
}); 
$('#pktSn').blur(function(){
	   if ($('#pktSn').val().match(/[^a-zA-Z0-9. ]/g)) {
    this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
}
}); 
$('#potSn').blur(function(){
	   if ($('#potSn').val().match(/[^a-zA-Z0-9. ]/g)) {
    this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
}
}); 


function editState(state,city)
{
//$('#estate').empty();
    $("#estate").append('<option value="0">----Select----</option>');
	$.ajax(
	   			{ 				
	   		 type: "POST",
	   		 url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=2',
	   		 dataType: 'json',
			  contentType: 'application/json',
				   		  success:function(result)
	   		  { 
						      $(result).each(function(i, obj) {
						          var module=obj.codeValue;
							        var modulename=obj.codeValueId;
								    if(state == modulename)
								    {
							      		$('#estate').append('<option value="'+ modulename+'" selected="selected">'+ module + '</option>');
							      	} else{
							      		$('#estate').append('<option value="'+ modulename+'">'+ module + '</option>');	
							      	}
								 //  $('#common_popup_div,#shadow_div_web_app').remove();
								   });
				   			 
							//	$('#').empty();
							//	 $('#').empty();						
									
					
						    //getCity();
						    editCity(city);
	
}
	   		   	});

}
	   			
function editCity(city)
{
	$.ajax(
   			{ 				
   		  type: "POST",
   		  url: $('#contextPath').val()+'/bizunit/getValueFromParentId.htm?parentId='+$('#estate').val(),	
   		  dataType: 'json',
		  contentType: 'application/json',
			   		  success:function(result)
   		  { 
							$('#elocation').empty();

							$(result).each(
									function(i, obj) {
										var module = obj.codeValueId;
										//alert("module::"+module);
										var modulename=obj.codeValue;
										//alert("modulename::"+modulename);
										  if(city == module)
										    {
									      		$('#elocation').append('<option value="'+ module+'" selected="selected">'+ modulename + '</option>');
									      	} else{
									      		$('#elocation').append('<option value="'+ module+'">'+ modulename + '</option>');	
									      	}
										
									});			
							 $("#elocation").append('<option value="0">----Select----</option>');

							
   		  }
   	
   	});

}

function sendToEditPartner(partyID,firstName,lastName,city,contactEmail,contactMobile,pstName,pstSn,pktName,pktSn,potName,potSn,rmName,rmSn,rmHeadName,rmHeadSn,opp,client,pclient,isActive,companyName,ARN ,euin,location,stateID,cityID, PSTTeamMemberId, PKTTeamMemberId, POTTeamMemberId, RMTeamMemberId, RMHeadTeamMemberId,emailCommunicationID){
	//alert("hi");	
	editNote();
	$('#efirstName').val(firstName);
    $('#elastName').val(lastName);
	$('#ecompanyName').val(companyName);
	$('#econtactEmail').val(contactEmail);
	$('#econtactMobile').val(contactMobile);
	$('#eARN').val(ARN);
    $('#eeuin').val(euin);
    
    searchPSTwhileEditing(PSTTeamMemberId,pstName,PKTTeamMemberId,pktName,POTTeamMemberId,potName,RMTeamMemberId,rmName,RMHeadTeamMemberId,rmHeadName);
    
   /*   searchPKTwhileEditing(42002);searchPOTwhileEditing(42003);searchRMwhileEditing(42004);searchRMHeadwhileEditing(42007); */
   
    editState(stateID,cityID);
    
     /*$('#estate').val(stateID);
       $('#elocation').val(cityID); */
       
    $('#ecommunicationEmailId').val(emailCommunicationID);
    
    /* if(location!=0 && location!='-'){
 	$('#elocation').append('<option value="'+ location+'">'+ location + '</option>'); 
    }else{
        editState(stateID);
    } */
 	
	$('#hdnpartyId').val(partyID);
	getLoginName(partyID);
	
	 /*  $('#epstSn').append('<option value="'+ PSTTeamMemberId+'">'+ pstName + '</option>');
	  if(pstName=="" || PSTTeamMemberId=="0"){
		  $("#epstSn").append('<option value="0" selected=true>----Select PST-----</option>');
	  }else{
		  $("#epstSn").append('<option value="0">----Select PST-----</option>');
	  } */
	     
	  
	/*   $('#epktSn').append('<option value="'+ PKTTeamMemberId+'">'+ pktName + '</option>');
	  if(pktName=="" || PKTTeamMemberId=="0"){
	  $("#epktSn").append('<option value="0" selected=true>----Select PKT-----</option>');
	  }else{
		  $("#epktSn").append('<option value="0">----Select PKT-----</option>');
	  }
	  
	  $('#epotSn').append('<option value="'+ POTTeamMemberId+'">'+ potName + '</option>');
	  if(potName=="" || POTTeamMemberId=="0"){
	   $("#epotSn").append('<option value="0" selected=true>----Select POT-----</option>');
	  }else{
		  $("#epotSn").append('<option value="0">----Select POT-----</option>');
	  }
	  
	  $('#ermSn').append('<option value="'+ RMTeamMemberId+'">'+ rmName + '</option>');
	  //alert(rmName+":"+RMTeamMemberId);
	  if(rmName=="" || RMTeamMemberId=="0"){
	   $("#ermSn").append('<option value="0" selected=true>----Select RM-----</option>');
	  }else{
		  $("#ermSn").append('<option value="0">----Select RM-----</option>');
	  }
	  
	  $('#ermHeadSn').append('<option value="'+ RMHeadTeamMemberId+'">'+ rmHeadName + '</option>');
	  //alert(rmHeadName+":"+RMHeadTeamMemberId);
	  if(rmHeadName=="" || RMHeadTeamMemberId=="0"){
	   $("#ermHeadSn").append('<option value="0" selected=true>----Select RM Head-----</option>');
	  }else{
		  $("#ermHeadSn").append('<option value="0">----Select RM Head-----</option>');
	  } */
	
}


function editPartnerRequiredValidation(){
	
	 if ($('#efirstName').val().trim()=="") {
		 alert("First name is required.");
		 $("#efirstName").focus();
        return false;
    } 
	 if ($('#elastName').val().trim()=="") {
		 alert("Last name is required.");
		 $("#elastName").focus();
        return false;
    } 
	 
	 if ($('#econtactMobile').val().trim()=="") {
		 alert("Contact No. is required.");
		 $("#econtactMobile").focus();
        return false;
    } 
	/*  if ($('#eARN').val().trim()=="") {
		 alert("ARN is required.");
		 $("#eARN").focus();
        return false;
    }  */
	 if ($('#ecommunicationEmailId').val().trim()=="") {
		 alert("Contact Email is required.");
		 $("#ecommunicationEmailId").focus();
         return false;
     }
	  
	 if ($('#epstSn').val()=="0" || $('#epstSn').val()==null || $("#epstSn option:selected").text()=="") {
		 alert("PST is required.");
		 $("#epstSn").focus();
        return false;
    }
	 
	if(evalidEmail()== false)
	{
		 	alert('Please enter the valid Email Id');
		 	$("#econtactEmail").val('');
			$("#econtactEmail").focus();
			return false;
   }
	if(ecevalidEmail()== false)
	{
		 	alert('Please enter the valid Contact Email');
		 	$("#ecommunicationEmailId").val('');
			$("#ecommunicationEmailId").focus();
			return false;
    }
	return true;
}


$('#efirstName').blur(function(){
	   if ($('#efirstName').val().match(/[^a-zA-Z0-9. ]/g)) {
       this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
   }
}); 

$('#elastName').blur(function(){
	   if ($('#elastName').val().match(/[^a-zA-Z0-9. ]/g)) {
    this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
}
}); 

$('#ecompanyName').blur(function(){
	   if ($('#ecompanyName').val().match(/[^a-zA-Z0-9. ]/g)) {
    this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
}
}); 

$('#econtactMobile').blur(function(){
	if($('#econtactMobile').val().length < 10){
		 alert("Contact No's length should not be less than 10 digit.");
		 $('#econtactMobile').val('');
		 //$("#econtactMobile").focus();
	}
	   if ($('#econtactMobile').val().match(/[^0-9 ]/g)) {
    this.value = this.value.replace(/[^0-9 ]/g, '');
}
}); 

/* $('#eARN').blur(function(){
	if ($('#eARN').val().match(/[^0-9 ]/g)) {
	       this.value = this.value.replace(/[^0-9 ]/g, '');
	   }
});  */

 
/* $('#eeuin').blur(function(){
		if ($('#eeuin').val().match(/[^a-zA-Z0-9. ]/g)) {
		       this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
		   }
	}); */ 

/*  $('#elocation').blur(function(){
 	if ($('#elocation').val().match(/[^0-9 ]/g)) {
 	       this.value = this.value.replace(/[^0-9 ]/g, '');
 	   }
 });  */


$('#epstSn').blur(function(){
	   if ($('#epstSn').val().match(/[^a-zA-Z0-9. ]/g)) {
 this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
}
}); 
$('#epktSn').blur(function(){
	   if ($('#epktSn').val().match(/[^a-zA-Z0-9. ]/g)) {
 this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
}
}); 
$('#epotSn').blur(function(){
	   if ($('#epotSn').val().match(/[^a-zA-Z0-9. ]/g)) {
 this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
}
});

    var newpst="";
	$('#epstSn').change(function(){
		  newpst = $('#epstSn').val();
	});
    var newrm="";
	$('#ermSn').change(function(){
		  newrm = $('#ermSn').val();
	});
	
function editPartner()
{
	 var fname = $('#efirstName').val();
	 var lname = $('#elastName').val();
	 var coname = $('#ecompanyName').val();
	 var cmail = $('#econtactEmail').val();
	 var cmobile = $('#econtactMobile').val();
	 var arn = $('#eARN').val();
	 var euin = $('#eeuin').val();
	 var state = $('#estate').val();
	 var location = $('#elocation').val();

// 	 jQuery("#elocation option:selected").val();
// 	 var pst = jQuery("#epstSn option:selected").val();
	 var pst = $('#epstSn').val();
// 	 var pkt = jQuery("#epktSn option:selected").val();
	 var pkt = $('#epktSn').val();
// 	 var pot = jQuery("#epotSn option:selected").val();
	 var pot = $('#epotSn').val();
// 	 var rm = jQuery("#ermSn option:selected").val();
	 var rm = $('#ermSn').val();
// 	 var rmHead = jQuery("#ermHeadSn option:selected").val();
	 var rmHead = $('#ermHeadSn').val();
	 	 
	 var hdnpartyId = $('#hdnpartyId').val();
	 var communicationEmailId = $('#ecommunicationEmailId').val();
	 
	 var hdnbuId = $('#hdnbuId').val();
	 var hdnuserId = $('#hdnuserId').val();
/* 	 if(editPartnerRequiredValidation()==true){ */
		  $.ajax({
				 type :'POST',
		         url : $('#contextPath').val() +"/partnersp/editPartner.htm?efirstName="+fname+"&elastName="+lname+"&ecompanyName="+coname+"&econtactEmail="+cmail+"&econtactMobile="+cmobile+"&eARN="+arn+"&epst="+pst+"&epkt="+pkt+"&epot="+pot+"&erm="+rm+"&ermHead="+rmHead+"&ehdnbuId="+hdnbuId+"&ehdnuserId="+hdnuserId+"&hdnpartyId="+hdnpartyId+"&eeuin="+euin+"&estate="+state+"&elocation="+location+"&ecommunicationEmailId="+communicationEmailId+"&newpst="+newpst+"&newrm="+newrm,
				 success : function(result)
				 {
					 bootbox.dialog({
	 						message: "<span class='bigger-110'>Partner updated.</span>",
	 						buttons: 			
	 						{
	 							"click" :
	 							{
	 								"label" : "OK!",
	 								"className" : "btn-sm btn-primary",
	 								"callback": function() {
	 									window.location.reload(true);
	 								}
	 							}
	 						}
	 					});
					 //alert('Partner updated.');
					 //window.location.reload(true);
					 //popup('popUpAlertaddnote');
					 //eresetval();
			}
			});
			
	 
}

/*  --------------------------------------------------------------------------------------------------------------------------------------------------------------  */
 
/* function searchPSTPKTPOTwhileEditing(deptTypeId)
{
	      var hdnbuId = $('#hdnbuId').val();
	      //hdnbuId =27827;
		  $.ajax({
				 type :'POST',
		         url : $('#contextPath').val() +"/partnersp/searchPSTPKTPOT.htm?buId="+hdnbuId+"&deptTypeId="+deptTypeId,
				 success : function(result) 
				 {
					 if(deptTypeId==42001){
					   // $('#epstSn').empty();
					    $("#epstSn").append('<option value="0">----Select PST-----</option>');
					 }
					 if(deptTypeId==42002){
					//	$('#epktSn').empty();
						$("#epktSn").append('<option value="0">----Select PKT-----</option>');
					 }
					 if(deptTypeId==42003){
						//$('#epotSn').empty();
						$("#epotSn").append('<option value="0">----Select POT-----</option>');
					 }
					 if(deptTypeId==42004){
						//$('#ermSn').empty();
						$("#ermSn").append('<option value="0">----Select RM-----</option>');
					 }
					 if(deptTypeId==42007){
						//$('#ermHeadSn').empty();
						$("#ermHeadSn").append('<option value="0">----Select RM Head-----</option>');
					}
										 
					 $(result).each(
			       			 function(i, value) {
			       			
			       				if(deptTypeId==42001){
							         $("#epstSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
								}
								if(deptTypeId==42002){
								     $("#epktSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
								}
								if(deptTypeId==42003){
								     $("#epotSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
								}
								if(deptTypeId==42004){
								     $("#ermSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
								}
								if(deptTypeId==42007){
								     $("#ermHeadSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
								}
					 });
			}
			});
} */




function searchPSTwhileEditing(PSTTeamMemberId,pstName,PKTTeamMemberId,pktName,POTTeamMemberId,potName,RMTeamMemberId,rmName,RMHeadTeamMemberId,rmHeadName)
{
		  var deptTypeId = 42001;
	      var hdnbuId = $('#hdnbuId').val();
	      //hdnbuId =27827;
		  $.ajax({
				 type :'POST',
		         url : $('#contextPath').val() +"/partnersp/searchPSTPKTPOT.htm?buId="+hdnbuId+"&deptTypeId="+deptTypeId,
				 success : function(result) 
				 {
					 /* if(deptTypeId==42001){
					   // $('#epstSn').empty();
					    //$("#epstSn").append('<option value="0">----Select PST-----</option>');
					 } */
				        $('#epstSn').empty();
				        $("#epstSn").append('<option value="0">----Select PST----</option>');
				        
				        $('#epktSn').empty();
				        $("#epktSn").append('<option value="0">----Select PKT----</option>');
				        
				        $('#epotSn').empty();
				        $("#epotSn").append('<option value="0">----Select POT----</option>');
				        
					    $('#ermSn').empty();
				        $("#ermSn").append('<option value="0">----Select RM----</option>');
				        
					    $('#ermHeadSn').empty();
				        $("#ermHeadSn").append('<option value="0">----Select RM Head----</option>');
										 
					 $(result).each(
							
			       			 function(i, value) {
			       				// alert("Hiiii"+value.categoryId);
			       			
								switch(value.categoryId)
								{
								case 42001 :  
						       					if(PSTTeamMemberId==value.teamMemberID && pstName==value.name){
						       					 $("#epstSn").append('<option value="'+ value.teamMemberID+'" selected="selected">'+ value.name + '</option>');
						       					}else{
						       					 $("#epstSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
						       					}
						       					break;
								case 42002 :  
												if(PKTTeamMemberId==value.teamMemberID && pktName==value.name){
						       					 $("#epktSn").append('<option value="'+ value.teamMemberID+'" selected="selected">'+ value.name + '</option>');
						       					}else{
						       					 $("#epktSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
						       					}
											     	break;
								case 42003: 
											if(POTTeamMemberId==value.teamMemberID && potName==value.name){
						       					 $("#epotSn").append('<option value="'+ value.teamMemberID+'" selected="selected">'+ value.name + '</option>');
						       					}else{
						       					 $("#epotSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
						       					}
											break;
								case 42004 : 
												if(RMTeamMemberId==value.teamMemberID && rmName==value.name){
							       					 $("#ermSn").append('<option value="'+ value.teamMemberID+'" selected="selected">'+ value.name + '</option>');
							       					}else{
							       					 $("#ermSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
							       					}
									
												break;
								case 42007 : 
												if(RMHeadTeamMemberId==value.teamMemberID && rmHeadName==value.name){
							       					 $("#ermHeadSn").append('<option value="'+ value.teamMemberID+'" selected="selected">'+ value.name + '</option>');
							       					}else{
							       					 $("#ermHeadSn").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
							       					}
												break;
								default: 
									
				       		
							}
									
					 });
					 //searchPKTwhileEditing(PKTTeamMemberId,pktName,POTTeamMemberId,potName,RMTeamMemberId,rmName,RMHeadTeamMemberId,rmHeadName);
			}
			});
}


function getUniqueArn()
{
	if($('#ARN').val()==""){}else{var arn = $('#ARN').val();}
	
	if($('#eARN').val()==""){}else{var arn = $('#eARN').val();}
	
	$.ajax({     
     type: "POST",
     url : $('#contextPath').val() +"/partnersp/getUniqueArn.htm?arn="+arn,  
     dataType: 'json', 
     contentType: 'application/json',     
        success:function(result)  
     { 
      			 $(result).each(
      			 function(i, obj) {
      				 if((obj.arn)==null || (obj.arn)==""){
      					 
      				} else{
      					if($('#ARN').val()==''){
      						alert('ARN should not empty')
      						
      					}
      					else{
      					alert('ARN already exist');
      					$('#ARN').val('');
      					$("#ARN").focus();
      					}
      					/* $('#eARN').val('');
      					$("#eARN").focus(); */
      				}
                  });     
    
     }
  
  });   

} 	

 $('#communicationEmailId').blur(function(){
	getUniqueCommunicationEmail();
}); 
 /* $('#ecommunicationEmailId').blur(function(){
	getUniqueCommunicationEmail();
});  */

function getUniqueCommunicationEmail()
{
	
	
    var hdnbuId = $('#hdnbuId').val();
	if($('#communicationEmailId').val()==""){}else{var communicationEmailId = $('#communicationEmailId').val(); var contactEmail = $('#contactEmail').val(); var isedit='0';
	/* if($('#ecommunicationEmailId').val()==""){}else{var communicationEmailId = $('#ecommunicationEmailId').val(); var contactEmail = $('#econtactEmail').val(); var isedit='1';} */
	
	$.ajax({     
     type: "POST",
     url : $('#contextPath').val() +"/partnersp/getUniqueCommunicationEmail.htm?communicationEmailId="+communicationEmailId+"&hdnbuId="+hdnbuId+"&contactEmail="+contactEmail+"&isedit="+isedit,  
     dataType: 'json', 
     contentType: 'application/json',     
        success:function(result)  
     { 
      			 $(result).each(
      					 
      			 function(i, obj) {
      				 if((obj.emailCommunicationID)==null || (obj.emailCommunicationID)==""){
      				} else{
      					alert('Contact Email already exist');
      					$("#communicationEmailId").val('');
      					//$("#communicationEmailId").focus();
      				}
                  });     
     }
	
  });   
}
} 


function getLoginName(partyId)
{
		  $.ajax({
				 type :'POST',
		         url : $('#contextPath').val() +"/partnersp/getLoginName.htm?partyId="+partyId,
				 success : function(result) 
				 {
					 /*  $.each($.parseJSON(result),function(key,value) {
					     // alert(key+":"+value.loginName);
					     $('#eloginname').val(value.loginName);
							 }); */
							 
					        $(result).each(
			      			 function(i, value) {
			      				 $('#eloginname').val(value.loginName);
			                  }); 
			}
			});
}


function getPSTPKTPOTwhileEditing()
{
	      var hdnbuId = $('#hdnbuId').val();
		  $.ajax({
				 type :'POST',
		         url : $('#contextPath').val() +"/partnersp/getPSTPKTPOTNames.htm?buId="+hdnbuId,
				 success : function(result) 
				 {
					       $(result).each(
				      			 function(i, value) {
				      				
				      				 if(value.departmenttypeid==42001){
				                         $("#epsttxt").html(value.shortName);
				                        }
				                        
				                        if(value.departmenttypeid==42002){
				                       	 $("#epkttxt").html(value.shortName);
				                       }
				                        if(value.departmenttypeid==42003){
				                       	 $("#epottxt").html(value.shortName);
				                       }
				                        if(value.departmenttypeid==42004){
					                     $("#ermtxt").html(value.shortName);
					                   }
				                        if(value.departmenttypeid==42007){
						                  $("#ermHeadtxt").html(value.shortName);
						                }
				                  });
			}
			});
}

var selectedlvals = new Array();
/* start code to delete added Partner items  */

	function deletePartners()
	{ 
	/* 	  var selectedlvals = [];
		  $('input:checkbox[name=chkdeleteselect]:checked').each(function() {
			  selectedlvals.push($(this).val());
		  }); */
		  selectedlvals = new Array();
			var cntr=0;
			 
		$('#grid-table :checked').each(function(i, obj) {
				if($(this).attr('id')!='selectAll' && $(this).attr('id')!='chkdeleteselect' && $(this).attr('id')!='' && $(this).attr('id')!=undefined && $(this).attr('id')!=0){
				selectedlvals[cntr] = $(this).attr('id');
				cntr+=1;
			}
				
 		});
// 			//deleteNote();
		// alert('Selected Checkbox values are: ' + selectedlvals);
		if(selectedlvals.length == 0){
			  bootbox.dialog({
					message: "<span class='bigger-110'>Please select at least one Partner to delete.</span>",
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
			//alert('Please select at least one Partner to delete');
			//$('#ActionMenu6').hide();
		 return;
	  }else deleteNote();
		  //document.getElementById("confirmdelete").value = selectedlvals;
		  //popup('popUpAlertaddnote');
	};


		 function confirmdeletez()
		{
			   //var selectedlvals= document.getElementById("confirmdelete").value;
			 //  alert('selectedlvals::'+selectedlvals);
			   	  $.ajax({
				   type : 'POST',
				   url : $('#contextPath').val()+"/partnersp/deletePartner.htm?selectedlvalz="+selectedlvals,
			
				  success : function(result)
	            {
				  if(result!=null || result!=""){
					  alert("Partner Deleted successfully");
				  }
				 // reloadTable();//reloadTable
				  location.reload(1);
	            }
		      
		   }); 
		 }
		 
		 /* end code to delete added Partner items  */
	function getFile(){
	
        document.getElementById("fileid").click();
	
    }
		 
    $('#fbtnid').mouseleave(function(){
    	var filename = $('#fileid').val().replace(/.*(\/|\\)/, '');
    	var url = document.getElementById("fileid").value;
        var filename = url.replace(/^.*\\/, "");
        document.getElementById("ftxtid").value= filename;
    });
    
/*   $('#ARN').blur(function(){
    	getUniqueArn();
    });
      */
/*     $('#eARN').change(function(){
    	getUniqueArn();
    }); */
    
    
 	function bulkUPLOADFile(){
 		if($('#fileid').val()!=""){
 			$('#myForm').submit();
 		}else{
 			alert("Please, select xls or xlsx file!");
 		}
 		
 		
       }
 	
 	function refresh(){
 		  var hdnbuId = $('#hdnbuId').val();
 		  var hdnuserId = $('#hdnuserId').val();
 		  window.location.href = $('#contextPath').val() + "/partnersp/loadPartner.htm?buId="+hdnbuId+"&userId="+hdnuserId
 	}
 	
 	
 	 $('#elocation').hide();
	 $(document).ready(function(){
		   
		 if($('#isopen').val()=="1"){
			  //To show popup on load while 'bulk upload'
		        uploadPartner();
			    //popup('popUpAlertaddnote');
				
				$("#popUpAlertaddnote").css ('width','1260px');
				$("#popUpAlertaddnote").css ('left','161px');
				$("#popUpAlertaddnote").css ('top','100px');
			  //To show popup on load while 'bulk upload'
		 }
		 
		 
	});
	 
	 function downloadAttachmentDownload() {
			window.location.href= $('#contextPath').val()+'/partnersp/downloadAttachmentDownload.htm';
		}
	 
	 $(document).ready(function() {
		  //  openPopupWebApp('centerLoadingImage', 25, 35);
		    $('#selecctall').click(function(event) {  //on click 
		        if(this.checked) { // check select status
		            $('.checkbox1').each(function() { //loop through each checkbox
		                this.checked = true;  //select all checkboxes with class "checkbox1"               
		            });
		        }else{
		            $('.checkbox1').each(function() { //loop through each checkbox
		                this.checked = false; //deselect all checkboxes with class "checkbox1"                       
		            });         
		        }
		    });
		    
		    state('add',0);
		    
		});
		function checkLogBehalf()
		{
			showAlertMessage("Message", "Login On Behalf is currently disabled for this partner.<br/>Partner should first accept the Terms & Conditions !","confirmation", doNothing);
			$('#ActionMenu6').hide();
		}
			$(document).ajaxStop(function() {
				//closePopupWebApp('');
				$('#elocation').show();
			});
 	
			
	
			function switchPartner(partyid){
				var currentBu=$("#hdnbuId").val();
				var PartyId=partyid;
				$("#switchPartyId").val(partyid);
		 		$.ajax({
			   		  type: "POST",
			   		  url: $('#contextPath').val()+'/faq/getBupartyname.htm',
			   		  dataType: 'json',
					  contentType: 'application/json',
					  success:function(result)
					  {
						  	$('#bizunitname').empty();
						  	$('#bizunitname').append('<option value="0">--Select biz unit--</option>');
							$(result).each(function(i, obj) {
											
							var bupartyid=obj.buId;
							var bupartyname=obj.lastName; 
						
							if(bupartyid != currentBu)
							{
								$('#bizunitname').append('<option value="'+ bupartyid+'">'+ bupartyname + '</option>');
							}
						});
					  }
			 });

		}
			
			function getCity()
			{
				$.ajax(
			   			{ 				
			   		  type: "POST",
			   		  url: $('#contextPath').val()+'/bizunit/getValueFromParentId.htm?parentId='+$('#state').val(),	
			   		 dataType: 'json',
					  contentType: 'application/json',
						   		  success:function(result)
			   		  { 
						   		
										$('#location').empty();
										
										$(result).each(
												function(i, obj) {
													var module = obj.codeValueId;
													var modulename=obj.codeValue;
													$('#location').append('<option value="'+ module+'">'+ modulename + '</option>');
										});		
										$("#location").append('<option value="0">----Select----</option>');
			   		  }
			   	
			   	});
				
			}

			


		    function state(action,ids)
		     {
		  //alert(action);
		  	   	$.ajax(
		  	   			{ 				
		  	   		  type: "POST",
		  	   		url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=2',
		  	   		 dataType: 'json',
		  			  contentType: 'application/json',
		  				   		  success:function(result)
		  	   		  { 
		  				   			 if(action=='edit')
		  				   			 {
		  						        	var id = '#state';
		  						        	$('#state').empty();
		  						        }else{
		  						        	
		  						        	var id = '#state';
		  						        	$('#state').empty();
		  						        }
		  				   		      $("#state").append('<option value="0">----Select----</option>');
		  						      $(result).each(function(i, obj) {
		  						          var module=obj.codeValue;
		  							        var modulename=obj.codeValueId;
		  								    if(ids == modulename)
		  								    {
		  							      		$(id).append('<option value="'+ modulename+'" selected="selected">'+ module + '</option>');
		  							      	} else{
		  							      		$(id).append('<option value="'+ modulename+'">'+ module + '</option>');	
		  							      	}
		  								 //  $('#common_popup_div,#shadow_div_web_app').remove();
		  								   });
		  				   			 
		  							//	$('#').empty();
		  							//	 $('#').empty();						
		  									
		  						$("#location").append('<option value="0">----Select----</option>');
		  						 //   getCity();
		  	   		  }
		  	   	
		  	   	});
		  	  
		  	   
		     }
		      
		    
		    
			
			
		function getDepartment(buid){
			//alert(buid);
			getPSTForSelectedBU(buid);
		}
		
		function getPSTForSelectedBU(buid)
		{
			var newdeptTypeId = 42001;
			var hdnbuId = buid;
			//alert("buid "+buid);
		  		$.ajax({
					type :'POST',
				    url : $('#contextPath').val() +"/partnersp/searchPSTPKTPOT.htm?buId="+hdnbuId+"&deptTypeId="+newdeptTypeId,
					success : function(result) 
					{//alert("42001 "+result);
						$('#pstForBU').empty();
						$("#pstForBU").append('<option value="0">----Select PST----</option>');
						
						
						$('#potForBU').empty();
						$("#potForBU").append('<option value="0">----Select POT----</option>');
						
						
						$('#pktForBU').empty();
						$("#pktForBU").append('<option value="0">----Select PKT----</option>');
						

						$('#RMForBU').empty();
						$("#RMForBU").append('<option value="0">----Select RM----</option>');
								$('#RMHeadForBU').empty();
								$("#RMHeadForBU").append('<option value="0">----Select RMHead----</option>');
							
						$(result).each(  
								
								function(i, value) {
								switch(value.categoryId)
								{
								
								case 42001 :  //alert("42001 "+value.categoryId);
												
									    		$("#pstForBU").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
						       					break;
								case 42002 :  
												
										    	$("#potForBU").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
											     	break;
								case 42003: 	
											    $("#pktForBU").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
											break;
								case 42004 : 
											
												$("#RMForBU").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
																	break;
								case 42007 : 
													
											   $("#RMHeadForBU").append('<option value="'+ value.teamMemberID+'">'+ value.name + '</option>');
												break;
								default: 
										
								}
								
					    	
						});
						//getPOTForSelectedBU(buid);
					}
					});
					
		}
		
		
		function SwitchToPartner(){
			if(checkRequiredVals() == true){
				switchPartnerBU();
			} 
		}
		
		function checkRequiredVals(){
			
			if ($('#bizunitname').val()==0) {
				alert("Please select biz unit.");
				$('#bizunitname').focus();
		        return false;
		    }
			if ($('#pstForBU').val()==0) {
				alert("Please select PST.");
				$('#pstForBU').focus();
		        return false;
		    }
			return true;
		}
		
		function switchPartnerBU(){
			var bupartyid = $('#bizunitname').val();
			var PartyId = $('#switchPartyId').val();
			var pstId = $('#pstForBU').val();
			var potId = $('#potForBU').val();
			var pktId = $('#pktForBU').val();
			var rmId = $('#RMForBU').val();
			var rmHeadId = $('#RMHeadForBU').val();
			//alert("Bu Id: "+bupartyid + "PartyId: "+PartyId+ "PST ID: "+pstId+ "POT ID: "+potId+ "pktId: "+pktId+ "rmId: "+rmId+ "rmHeadId: "+rmHeadId);
			$.ajax({
				type: "POST",
		 		url: $('#contextPath').val()+'/partnersp/switchPartner.htm?bupartyid='+bupartyid+"&PartyId="+PartyId+"&pstId="+pstId+"&potId="+potId+"&pktId="+pktId+"&rmId="+rmId+"&rmHeadId="+rmHeadId,
		 		dataType: 'json',
				contentType: 'application/json',
				success:function(result)
				{
				  alert('Biz unit changed successfully');
				  window.location.reload();
				}
			});
		}
		
		
		
		
		function ViewStatus(ids)
		{
			 //alert(action);
			   	$.ajax(
			   			{ 				
			   		  type: "POST",
			   		url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=5',
			   		 dataType: 'json',
					  contentType: 'application/json',
						   		  success:function(result)
			   		  { 
								        	
								        	var id = '#statusId';
								       	 $('#statusId').empty();
									       	$('#statusId').append('<option value="0"> Not Defined </option>');
								       
						   			 
						   			// alert(id);
						   		//	 alert(ids);
								      $(result).each(function(i, obj) {
								          var module=obj.codeValue;
									        var modulename=obj.codeValueId;
										 if(ids == modulename)
										    {
									      		$(id).append('<option value="'+ modulename+'" selected="selected">'+ module + '</option>');
									      	} else{
									      		$(id).append('<option value="'+ modulename+'">'+ module + '</option>');	
									      	}
									        	
										 //  $('#common_popup_div,#shadow_div_web_app').remove();
										   });
								      
									//	$('#').empty();
									//	 $('#').empty();						
											
							
								
			   		  }
			   	
			   	});
			  
			   
		}
		
		
		function ViewRegion(ids)
		{
			 //alert(action);
			   	$.ajax(
			   			{ 				
			   		  type: "POST",
			   		url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=205',
			   		 dataType: 'json',
					  contentType: 'application/json',
						   		  success:function(result)
			   		  { 
								        	
								        	var id = '#regionId';
								       	 $('#regionId').empty();
									       	$('#regionId').append('<option value="0"> Define Region </option>');
								       
						   			 
						   			// alert(id);
						   		//	 alert(ids);
								      $(result).each(function(i, obj) {
								          var module=obj.codeValue;
									        var modulename=obj.codeValueId;
  	
									        if(ids == modulename)
										    {
									      		$(id).append('<option value="'+ modulename+'" selected="selected">'+ module + '</option>');
									      	} else{
									      		$(id).append('<option value="'+ modulename+'">'+ module + '</option>');	
									      	}
									        	
										 //  $('#common_popup_div,#shadow_div_web_app').remove();
										   });
								      
									//	$('#').empty();
									//	 $('#').empty();						
											
							
								
			   		  }
			   	
			   	});
			  
			   
		}
		
		
		function enableDisableDropDown()
		{
			/* var roll = $('#rollId').val();
			if(roll == 5 || roll == 1 ){
				$("#statusId").prop("disabled", false);
			}
			else{
				$("#statusId").prop("disabled", true);

			} */
			
		}
		
		$(document).ready(function() {
	 	
	    $('#proSponDate').datepicker({
	 		        changeMonth : true,
	 		        changeYear : true,
	 		        minDate : '0',
	 		        yearRange : "1900:2200",
	 		        dateFormat : "dd/mm/yy"
	 		       }); 
	 		
	
		$('#welnConDate').datepicker({
		        changeMonth : true,
		        changeYear : true,
		        minDate : '0',
		        yearRange : "1900:2200",
		        dateFormat : "dd/mm/yy"
		       }); 
		
		$('#onBoaredDate').datepicker({
		        changeMonth : true,
		        changeYear : true,
		        minDate : '0',
		        yearRange : "1900:2200",
		        dateFormat : "dd/mm/yy"
		       }); 
		
		
		$('#agreeSignDate').datepicker({
		        changeMonth : true,
		        changeYear : true,
		        minDate : '0',
		        yearRange : "1900:2200",
		        dateFormat : "dd/mm/yy"
		       }); 
		});
		
		/* function sendBlukEmail(){
		    
			   var cmail = $('#hdncontactmail').val();
			   
			   var slvals = []
			      $('input:checkbox[name=chkdeleteselect]:checked').each(function() {
			      slvals.push($(this).val());
			      })  
			   
			   /* list = new Array(); 
			   $('#data :checked').each(function(i, obj) {
			    list[i] = $(this).attr('id');
			   });   
			   if (slvals.length == 0) {   
			    alert(
			      "<br/>Please select at least one Partner to send mass mail."
			      ); 
			   } else{
				   alert(slvals);
			    $('#partyIdForNotification').val(slvals);   
			    $('#nameForNotification').val(cmail);
			    $('#notifyToForNotification').val('Bulk');
			    $('#notifyType').val('email');
			    $('#sendNotificationForm').attr('action','${pageContext.request.contextPath}/sendnotification.htm');
			    $('#isBulk').val('1');
			    $('#sendNotificationForm').submit();
			   }
			  } */


			
		 function sendBlukEmail(){
			//alert('1..');
			var cmail = $('#hdncontactmail').val();
			
			selectedlvals = new Array();
			var cntr=0;
			 
			$('#grid-table :checked').each(function(i, obj) {
				if($(this).attr('id')!='selectAll' && $(this).attr('id')!='chkdeleteselect' && $(this).attr('id')!='' && $(this).attr('id')!=undefined && $(this).attr('id')!=0){
				selectedlvals[cntr] = $(this).attr('id');
				cntr+=1;
			}
				
			});
			if (selectedlvals.length == 0) {   
				
				bootbox.dialog({
					message: "<span class='bigger-110'>Please select at least one Partner to send mass Email.</span>",
					buttons: 			
					{
						"click" :
						{
							"label" : "OK!",
							"className" : "btn-sm btn-primary",
							"callback": function() {									
							}
						}
					}
			});
			
				//alert("Please select at least one Partner to send mass mail.");
				/* showAlertMessage1("Message",
						"<br/>Please select at least one Partner to send mass mail.",
						"information", doNothing);*/
			} else{
				//alert(cmail);
				$('#partyIdForNotification').val(selectedlvals);   
				$('#nameForNotification').val(cmail);
				$('#notifyToForNotification').val('Bulk');
				$('#notifyType').val('email');
				$('#sendNotificationForm').attr('action','${pageContext.request.contextPath}/sendnotification.htm');
				$('#isBulk').val('1');
				$('#sendNotificationForm').submit();
			}
		} 

		function sendSMS(partyId,name,phone){
			//alert(partyId);
			$('#partyIdForNotification').val(partyId);
			$('#nameForNotification').val(name);
			$('#notifyToForNotification').val(phone);
			$('#notifyType').val('sms');
			$('#sendNotificationForm').attr('action','${pageContext.request.contextPath}/sendnotification.htm');
			
			$('#sendNotificationForm').submit();
		}
		function sendMassSMS(){ 
			//alert('in sms......');
			var cmail = $('#hdncontactmail').val();
			  
			selectedlvals = new Array();
			var cntr=0;
			 
			$('#grid-table :checked').each(function(i, obj) {
				if($(this).attr('id')!='selectAll' && $(this).attr('id')!='chkdeleteselect' && $(this).attr('id')!='' && $(this).attr('id')!=undefined && $(this).attr('id')!=0){
				selectedlvals[cntr] = $(this).attr('id');
				cntr+=1;
			}
				
			});
			if (selectedlvals.length == 0) {
				 bootbox.dialog({
						message: "<span class='bigger-110'>Please select at least one Partner to send mass sms.</span>",
						buttons: 			
						{
							"click" :
							{
								"label" : "OK!",
								"className" : "btn-sm btn-primary",
								"callback": function() {									
								}
							}
						}
				});
				
				/* showAlertMessage1("Message", 
						"<br/>Please select at least one Partner to send mass sms.",    
						"information", doNothing); */
			} else{ 
				//alert(selectedlvals);
				//alert(cmail);
				$('#partyIdForNotification').val(selectedlvals); 
				$('#nameForNotification').val(cmail);   
				$('#notifyToForNotification').val('');
				$('#notifyType').val('sms')
				$('#sendNotificationForm').attr('action','${pageContext.request.contextPath}/sendnotification.htm');
				$('#isBulk').val('1');
				$('#sendNotificationForm').submit(); 
			}
		}
		
</script>

<form id="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocument.htm">
		<input type="hidden" name="docId" id="documentIdToDownload">
</form>
<%-- <jsp:include page="../common/footer.jsp" /> --%>
<form id="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocument.htm">
		<input type="hidden" name="docId" id="documentIdToDownload">
	</form>

<form id="bulkActivateForm"> 
		<input type="hidden" id="partyIds" name="partyIds">
		<input type="hidden" id="roleId" name="roleId" value="15">
</form>
	
<form method="post" id="getApDataForm" name="getApDataForm"> 
		<input type="hidden" id="partyIdToSend" name="partyId">		
</form>	  
<form id="sendNotificationForm" name="sendNotificationForm" method="post">  
		<input type="hidden" id="partyIdForNotification" name="partyId">	
		<input type="hidden" id="nameForNotification" name="name">	    	
		<input type="hidden" id="notifyTargetForNotification" name="notifyTarget" value="Partner">	
		<input type="hidden" id="notifyToForNotification" name="notifyTo">
		<input type="hidden" id="notifyType" name="notifyType">		
		<input type="hidden" id="isBulk" name="isBulk">
			
	</form>  
	 
	 
	 
	 <script type="text/javascript">

			var grid_data =  ${partnerData};
			if(grid_data==null){
				grid_data=' ';
			}
			/* var grid_data1 =  ${lstExistingPartner};
			var grid_data2 =  ${lstSuccessPartner};
			var grid_data3 =  ${lstFailedPartner};
			var grid_data4 =  ${lstMithiFailedContactEmails}; */

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
						plusicon : "ace-icon fa fa-plus center bigger-110 blue",
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
					
			

							
					data: grid_data,
					datatype: "local",
					height: 250,
					//Allocated Service Team  Managed Entities   Subscription Package  Category Action 
					colNames:['','','Partner Name','Location','Email Id', 'Contact No','ARN No','Allocated Service Team','Managed Entities','Action'],
					colModel:[
						{name:'',width:40,formatter:function(cellvalue, options,rowObject) {
							
							return '<a href="#" onclick="sendToEditPartner('+rowObject.partyID+',\''+rowObject.firstName+'\',\''+rowObject.lastName+'\',\''+rowObject.city+'\',\''+rowObject.contactEmail+'\','+rowObject.contactMobile+',\''+rowObject.pstName+'\',\''+rowObject.pstSn+'\',\''+rowObject.pktName+'\',\''+rowObject.pktSn+'\',\''+rowObject.potName+'\',\''+rowObject.potSn+'\',\''+rowObject.rmName+'\',\''+rowObject.rmSn+'\',\''+rowObject.rmHeadName+'\',\''+rowObject.rmHeadSn+'\','+rowObject.opp+','+rowObject.client+','+rowObject.pclient+','+rowObject.isActive+',\''+rowObject.companyName+'\',\''+rowObject.arn+'\',\''+rowObject.euin+'\',\''+rowObject.location+'\','+rowObject.stateID+',\''+rowObject.cityID+'\','+rowObject.pstTeamMemberId+','+rowObject.pktTeamMemberId+','+rowObject.potTeamMemberId+','+rowObject.rmTeamMemberId+','+rowObject.rmHeadTeamMemberId+',\''+rowObject.emailCommunicationID+'\');" id=SPEditPartnerLink><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';
						}},
						{name:'',width:40,sortable:false,formatter:function(cellvalue, options,rowObject) {
						    return '<input role="checkbox" type="checkbox"  class="cbox" id="'+rowObject.partyID+'" name="chkdeleteselect"><input type="hidden" id="hdncontactmail" name="hdncontactmail" value="' + rowObject.contactEmail+'">';
						}},
						
												
						{name:'firstName',formatter:function(cellvalue, options,rowObject) {
							return rowObject.firstName+' '+rowObject.lastName;
						}},
						{name:'location'},
						{name:'contactEmail'},
						{name:'contactMobile'},
						{name:'arn'},
					 	{name:'pstName',formatter:function(cellvalue, options,rowObject) {
						
							var html='';
						    if(rowObject.pstName!=''){
						    	var m = rowObject.pstName;
						    	html+= '<span>'+m+'</span>  <span class="goaltext"> PST</span><br />';
						    	}
						    if(rowObject.potName!=1){
						    	var m = rowObject.potName;
						    	html+= '<span>'+m+'</span><span class="goaltext"> POT</span><br />';}
						    if(rowObject.pktName!=1){
						    	var m = rowObject.pktName;
						    	html+= '<span>'+m+'</span><span class="goaltext"> PKT</span><br />';}
						  if(rowObject.rmName!=1){
						    	var m =rowObject.rmName;
							   	html+= '<span>'+m+'</span><span class="goaltext"> RM</span><br />';}
						    	   if(rowObject.rmHeadName!=1){
								var m = rowObject.rmHeadName;
							   	html+= '<span>'+m+'</span><span class="goaltext"> RM Head</span><br /> ';} 
						    return html;
							
						    
						}}, 
						{name:'opp ',formatter:function(cellvalue, options,rowObject) {
							
							var html='';
						    if(rowObject.pstName!=''){
						    	var m = rowObject.opp;
						    	html+= '<span>#Opp</span><span class="badge badge-important">'+m+'</span><br />';
						    	}
						    if(rowObject.potName!=''){
						    	var m = rowObject.client;
						    	html+= '<span>#Client </span><span class="badge badge-important">'+m+'</span><br />';
						    	}
						    if(rowObject.pktName!=''){
						    	var m = rowObject.pclient;
						      	html+= '<span>#PClient </span><span class="badge badge-important">'+m+'</span><br />'; 
						      	}
						   return html;
							
						    
						}},
						 
					
						
					{name:'action',formatter:function(cellvalue, options,rowObject) {
						
						    return '<a href="#" onclick="openActionPopup('+rowObject.partyID+',\''+rowObject.firstName+'\',\''+rowObject.lastName+'\','+rowObject.recordTypeID+',\''+rowObject.lastLogin+'\','+rowObject.isActive+',\''+rowObject.pstName+'\',\''+rowObject.pktName+'\',\''+rowObject.potName+'\',\''+rowObject.rmName+'\',\''+rowObject.rmHeadName+'\','+rowObject.pstTeamMemberId+','+rowObject.pktTeamMemberId+','+rowObject.potTeamMemberId+','+rowObject.rmTeamMemberId+','+rowObject.rmHeadTeamMemberId+',\''+rowObject.emailCommunicationName+'\',\''+rowObject.emailCommunicationID+'\','+rowObject.userId+',\''+rowObject.userName+'\')">Action</a>';
						}}, 
						
					
						
						
						
					], 
					
			
					
					
					viewrecords : true,
					rowNum:100,
					rowList:[10,20,100,1000],
					pager : pager_selector,
					altRows: true,
					//toppager: true,
					
					multiselect: false,
					//multikey: "ctrlKey",
			        multiboxonly: false,
			
					loadComplete : function() {
						var table = this;
						setTimeout(function(){
							styleCheckbox(table);
							
							updateActionIcons(table);
							updatePagerIcons(table);
							enableTooltips(table);
						}, 0);
					},
			
					editurl: "/dummy.html",//nothing is saved
					//caption: "jqGrid with inline editing",
			
				    autowidth: true,
			
			
				
			
				});
				
		
						

										
				$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
				
				
			
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
						},
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
						resizable: true, 
					     modal: true, 
					                 width: "auto",
					                 position: { my: "center", at: "right", of: window },
					});
				}				
	</script>
	
<script type="text/javascript"> 

/* var grid_data1 =  ${lstExistingPartner};
var grid_data2 =  ${lstSuccessPartner};*/



	var grid_data1 = ${lstExistingPartner};
	
	
	var grid_data2 =  ${lstSuccessPartner};
	var grid_data3 =  ${lstFailedPartner};
	var grid_data4 =  ${lstMithiFailedContactEmails};  
	
	//alert('In-----Data2--'+grid_data2);

	//console.log('grid_data:---'+grid_data);
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
		var grid_selector1 = "#grid-table1";
		var grid_selector2 = "#grid-table2";
		var pager_selector1 = "#grid-pager1";
		var pager_selector2 = "#grid-pager2";
		var grid_selector3 = "#grid-table3";
		var grid_selector4 = "#grid-table4";
		var pager_selector3 = "#grid-pager3";
		var pager_selector4 = "#grid-pager4";
		
		//resize to fit page size
		$(window).on('resize.jqGrid', function () {
		//	$(grid_selector).jqGrid( 'setGridWidth', $(".page-content").width() );
	    })
		//resize on sidebar collapse/expand
		var parent_column = $(grid_selector1).closest('[class*="col-"]');
		$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
			if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
				//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
				setTimeout(function() {
				//	$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
				}, 0);
			}
	    })
		
		//if your grid is inside another element, for example a tab pane, you should use its parent's width:
		/**
		$(window).on('resize.jqGrid', function () {
			var parent_width = $(grid_selector).closest('.tab-pane').width();
			$(grid_selector).jqGrid( 'setGridWidth', parent_width );
		})
		//and also set width when tab pane becomes visible
		$('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		  if($(e.target).attr('href') == '#mygrid') {
			var parent_width = $(grid_selector).closest('.tab-pane').width();
			$(grid_selector).jqGrid( 'setGridWidth', parent_width );
		  }
		})
		*/
		
		
	
	
		jQuery(grid_selector1).jqGrid({
			//direction: "rtl",
// 			url:$('#contextPath').val()+'/opportunity/getOpportunitiesGrid.htm?value=${value}',
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
			
				data : grid_data1,
				datatype: "local",
				height: 250,
				colNames:['Partner Name','User Name','Communication Email Id','ARN No','Contact Email','Contact Mobile'],
				colModel:[
				
											
					{name:'firstName',index:'firstName',formatter:function(cellvalue, options,rowObject) {
						return rowObject.firstName+' '+rowObject.lastName;
					}},
					{name:'loginName',index:'loginName',width:200 },
					{name:'communicationEmailId',index:'communicationEmailId',width:200},
					{name:'arn',index:'arn',width:200},
					{name:'contactEmail',index:'contactEmail',width:200},
					{name:'contactMobile',index:'contactMobile',width:200}
					
		], 
				
				
				
				
				
				
			
	
	
			//data: grid_data,
			
			jsonReader : {
				root : "rows",
				repeatitems : false,
				page : "page",
				total: "total",
				records : "records",
				id : "partyId",
				cell : "cell",
				},

	
			viewrecords : true,
			rowNum:10,
			rowList:[10,20,50,100,1000],
			pager : pager_selector1,
			altRows: true,
			//toppager: true,
			
			//multiselect: true,
			//multikey: "ctrlKey",
	        multiboxonly: true,
	
				
			editurl: "/dummy.html",//nothing is saved
			caption: ""
	
			,autowidth: true,
            shrinkToFit:false,	
	
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
		
		
		var parent_column1 = $(grid_selector2).closest('[class*="col-"]');
		$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
			if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
				//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
				setTimeout(function() {
				//	$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
				}, 0);
			}
	    })
		
		//if your grid is inside another element, for example a tab pane, you should use its parent's width:
		/**
		$(window).on('resize.jqGrid', function () {
			var parent_width = $(grid_selector).closest('.tab-pane').width();
			$(grid_selector).jqGrid( 'setGridWidth', parent_width );
		})
		//and also set width when tab pane becomes visible
		$('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		  if($(e.target).attr('href') == '#mygrid') {
			var parent_width = $(grid_selector).closest('.tab-pane').width();
			$(grid_selector).jqGrid( 'setGridWidth', parent_width );
		  }
		})
		*/
		
		
	
	
		jQuery(grid_selector2).jqGrid({
			//direction: "rtl",
// 			url:$('#contextPath').val()+'/opportunity/getOpportunitiesGrid.htm?value=${value}',
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
			
				data : grid_data2,
				datatype: "local",
				height: 250,
				colNames:['Partner Name','User Name','Communication Email Id','ARN No','Contact Email','Contact Mobile'],
				colModel:[
				
											
					{name:'firstName',index:'firstName',formatter:function(cellvalue, options,rowObject) {
						return rowObject.firstName+' '+rowObject.lastName;
					}},
					{name:'loginName',index:'loginName',width:200 },
					{name:'communicationEmailId',index:'communicationEmailId',width:200},
					{name:'arn',index:'arn',width:200},
					{name:'contactEmail',index:'contactEmail',width:200},
					{name:'contactMobile',index:'contactMobile',width:200},
					

		], 
				
				
				
				
				
				
			
	
	
			//data: grid_data,
			
			jsonReader : {
				root : "rows",
				repeatitems : false,
				page : "page",
				total: "total",
				records : "records",
				id : "partyId",
				cell : "cell",
				},

	
			viewrecords : true,
			rowNum:10,
			rowList:[10,20,50,100,1000],
			pager : pager_selector2,
			altRows: true,
			//toppager: true,
			
			//multiselect: true,
			//multikey: "ctrlKey",
	        multiboxonly: true,
	
				
			editurl: "/dummy.html",//nothing is saved
			caption: ""
	
			,autowidth: true,
            shrinkToFit:false,	
	
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
		/////////3////////////////////////////
		
		
		var parent_column1 = $(grid_selector3).closest('[class*="col-"]');
		$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
			if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
				//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
				setTimeout(function() {
				//	$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
				}, 0);
			}
	    })
		
		//if your grid is inside another element, for example a tab pane, you should use its parent's width:
		/**
		$(window).on('resize.jqGrid', function () {
			var parent_width = $(grid_selector).closest('.tab-pane').width();
			$(grid_selector).jqGrid( 'setGridWidth', parent_width );
		})
		//and also set width when tab pane becomes visible
		$('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		  if($(e.target).attr('href') == '#mygrid') {
			var parent_width = $(grid_selector).closest('.tab-pane').width();
			$(grid_selector).jqGrid( 'setGridWidth', parent_width );
		  }
		})
		*/
		
		
	
	
		jQuery(grid_selector3).jqGrid({
			//direction: "rtl",
// 			url:$('#contextPath').val()+'/opportunity/getOpportunitiesGrid.htm?value=${value}',
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
			
				data : grid_data3,
				datatype: "local",
				height: 250,
				colNames:['Partner Name','Contact Email','Contact Mobile'],
				colModel:[
				
											
					{width:400,formatter:function(cellvalue, options,rowObject) {
						return rowObject.firstName+' '+rowObject.lastName;
					}},
					
					{name:'contactEmail',index:'contactEmail',width:400},
					{name:'contactMobile',index:'contactMobile',width:300},
					

		], 
				
				
				
				
				
				
			
	
	
			//data: grid_data,
			
			jsonReader : {
				root : "rows",
				repeatitems : false,
				page : "page",
				total: "total",
				records : "records",
				id : "partyId",
				cell : "cell",
				},

	
			viewrecords : true,
			rowNum:10,
			rowList:[10,20,50,100,1000],
			pager : pager_selector3,
			altRows: true,
			//toppager: true,
			
			//multiselect: true,
			//multikey: "ctrlKey",
	        multiboxonly: true,
	
				
			editurl: "/dummy.html",//nothing is saved
			caption: ""
	
			,autowidth: true,
            shrinkToFit:false,	
	
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
		
		//////4/////////////////////////////
		
		var parent_column1 = $(grid_selector4).closest('[class*="col-"]');
		$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
			if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
				//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
				setTimeout(function() {
				//	$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
				}, 0);
			}
	    })
		
		//if your grid is inside another element, for example a tab pane, you should use its parent's width:
		/**
		$(window).on('resize.jqGrid', function () {
			var parent_width = $(grid_selector).closest('.tab-pane').width();
			$(grid_selector).jqGrid( 'setGridWidth', parent_width );
		})
		//and also set width when tab pane becomes visible
		$('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		  if($(e.target).attr('href') == '#mygrid') {
			var parent_width = $(grid_selector).closest('.tab-pane').width();
			$(grid_selector).jqGrid( 'setGridWidth', parent_width );
		  }
		})
		*/
		
		
	
	
		jQuery(grid_selector4).jqGrid({
			//direction: "rtl",
// 			url:$('#contextPath').val()+'/opportunity/getOpportunitiesGrid.htm?value=${value}',
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
			
				data : grid_data4,
				datatype: "local",
				height: 250,
				colNames:['Error while creating contact email(s) as well as setting alternate email(s) on mithi'],
				colModel:[
				
					
					{name:'role',index:'role' ,width:1000}
					

		], 
				
				
				
				
				
				
			
	
	
			//data: grid_data,
			
			jsonReader : {
				root : "rows",
				repeatitems : false,
				page : "page",
				total: "total",
				records : "records",
				id : "partyId",
				cell : "cell",
				},

	
			viewrecords : true,
			rowNum:10,
			rowList:[10,20,50,100,1000],
			pager : pager_selector4,
			altRows: true,
			//toppager: true,
			
			//multiselect: true,
			//multikey: "ctrlKey",
	        multiboxonly: true,
	
				
			editurl: "/dummy.html",//nothing is saved
			caption: ""
	
			,autowidth: true,
            shrinkToFit:false,	
	
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
		
		
//			jQuery(grid_selector).jqGrid('filterToolbar', { stringResult: true, searchOnEnter: true});
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
		jQuery(grid_selector1).jqGrid('navGrid',pager_selector1,
			{ 	//navbar options
				edit: false,
				editicon : 'ace-icon fa fa-pencil blue',
				add: false,
				addicon : 'ace-icon fa fa-plus-circle purple',
				del: false,
				delicon : 'ace-icon fa fa-trash-o red',
				search: false,
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
	
	
		
		jQuery(grid_selector2).jqGrid('navGrid',pager_selector2,
			{ 	//navbar options
				edit: false,
				editicon : 'ace-icon fa fa-pencil blue',
				add: false,
				addicon : 'ace-icon fa fa-plus-circle purple',
				del: false,
				delicon : 'ace-icon fa fa-trash-o red',
				search: false,
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
		
		///////////3/////////////////////
		jQuery(grid_selector3).jqGrid('navGrid',pager_selector3,
			{ 	//navbar options
				edit: false,
				editicon : 'ace-icon fa fa-pencil blue',
				add: false,
				addicon : 'ace-icon fa fa-plus-circle purple',
				del: false,
				delicon : 'ace-icon fa fa-trash-o red',
				search: false,
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
		
		//////////////4/////////////
		jQuery(grid_selector4).jqGrid('navGrid',pager_selector4,
			{ 	//navbar options
				edit: false,
				editicon : 'ace-icon fa fa-pencil blue',
				add: false,
				addicon : 'ace-icon fa fa-plus-circle purple',
				del: false,
				delicon : 'ace-icon fa fa-trash-o red',
				search: false,
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
			/*//enable datepicker on "sdate" field and switches for "stock" field
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
			buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');	*/	
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


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<script>
	 function partnerDashboard(firstName,lastName,partyID,recordTypeID,lastLogin,isActive){
		   var res = firstName +" "+ lastName;

		     
		 window.location.href= $('#contextPath').val()+'/dashboard/getPartnerdashboard.htm?partnername='+res+'&partyID='+partyID+'&recordTypeID='+recordTypeID+'&lastLogin='+lastLogin+'&active='+isActive;
	 }
	 function viewLoginDetails(userId){
		 
		 window.location.href= $('#contextPath').val()+'/partnersp/loadLoginHist.htm?userId='+userId;
	 }
	 
	 function opportunityList(partyID){
		
		 window.location.href= $('#contextPath').val()+'/partnersp/getOpportunitiesList.htm?partyId='+partyID;
	 }
	 
	 function loginOnBehalf(userName,allCount){
		
		 if(allCount>=1){
		 window.location.href= $('#contextPath').val()+'/loginonbehalf/getPartnerInfo.htm?userName='+userName+'&GOTO='+index;
		 }else{
			 checkLogBehalf();
		 }
	}
	 
	 function clientList(partyID){
		 window.location.href= $('#contextPath').val()+'/partnersp/getClientList.htm?partyId='+partyID;
	 }
	 function query(partyID){
		 window.location.href= $('#contextPath').val()+'/partnersp/getQueryList.htm?partyId='+partyID;
	 }
	 function subx(partyID){
		 window.location.href= $('#contextPath').val()+'/subx/list?partyId='+partyID;
	 }
	 ////subx/list?partyId=${data.partyID}
		function openActionPopup(partyID,firstName,lastName,recordTypeID,lastLogin,isActive,pstName,pktName,potName,rmName,rmHeadName,pstTeamMemberId,pktTeamMemberId,potTeamMemberId,rmTeamMemberId,rmHeadTeamMemberId,emailCommunicationName,emailCommunicationID,userId,userName,allCount){
			//alert(partyID);
			$('#SPPartnerDashboardLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();partnerDashboard(\''+firstName+'\',\''+lastName+'\',' +partyID+',' +recordTypeID+',\''+lastLogin+'\','+isActive+')');
			$('#SPOpportunityListLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();opportunityList('+partyID+')');
			$('#SPClientListLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();clientList('+partyID+')');
			//SPServiceTeamAllocationLink
			$('#SPServiceTeamAllocationLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();sendToSTAedit('+partyID+',\''+pstName+'\',\'' +pktName+'\',\'' +potName+'\',\''+rmName+'\',\''+rmHeadName+'\',\''+firstName+'\',\''+lastName+'\','+pstTeamMemberId+',' +pktTeamMemberId+',' +potTeamMemberId+',' +rmTeamMemberId+',' +rmHeadTeamMemberId+');'+getPSTPKTPOTForSTA());
			$('#SPAssignEmailAccountLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();assignEmailAccount();sendToAssignCommunicationEmail('+partyID+',\''+emailCommunicationName+'\',\''+emailCommunicationID+'\',\''+firstName+'\',\''+lastName+'\')');
			$('#SPOnboardingChecklistLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();Onboarding();ViewRegion(0);ViewStatus(0);enableDisableDropDown();sendToOnboardingCheckList('+partyID+',\''+emailCommunicationID+'\',\'' +firstName+'\',\''+lastName+'\')');
			//SPOnboardingChecklistLink
			$('#SPViewLoginDetailsLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();viewLoginDetails('+userId+')');
			$('#SPLoginOnBehalfLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();loginOnBehalf(\''+userName+'\''+allCount+')');
			$('#SPQueryLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();query('+partyID+')');
			$('#SPTaskLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();');
			$('#SPChatLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();');
			$('#SPSubxLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();subx('+partyID+')');
			$('#SPMovePartnerLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();movePartnerPopUp('+partyID+')');
			
			
			
			
			if('${sessionScope.userSession.buId}'!='27827'){
				$('#SPPartnerDashboardLink a').removeClass('hide');
				$('#SPOpportunityListLink a').removeClass('hide');
				$('#SPClientListLink a').removeClass('hide');
				$('#SPServiceTeamAllocationLink a').removeClass('hide');
				$('#SPAssignEmailAccountLink a').removeClass('hide');
				$('#SPOnboardingChecklistLink a').removeClass('hide');
				$('#SPViewLoginDetailsLink a').removeClass('hide');
				$('#SPLoginOnBehalfLink a').removeClass('hide');
				$('#SPQueryLink a').removeClass('hide');
				$('#SPTaskLink a').removeClass('hide');
				$('#SPChatLink a').removeClass('hide');
				//$('#SPSubxLink a').removeClass('hide');
				$('#SPMovePartnerLink a').removeClass('hide');
				
		
				
			/* 	$('#PartnerActionPlanLink1 #PartnerActionPlanLink').attr('class','hide');
				$('#ClientActionPlanLink1 #ClientActionPlanLink').attr('class','hide');
 */		
				
			}else{
				$('#SPPartnerDashboardLink a').removeClass('hide');
				$('#SPOpportunityListLink a').removeClass('hide');
				$('#SPClientListLink a').removeClass('hide');
				$('#SPServiceTeamAllocationLink a').removeClass('hide');
				$('#SPAssignEmailAccountLink a').removeClass('hide');
				$('#SPOnboardingChecklistLink a').removeClass('hide');
				$('#SPViewLoginDetailsLink a').removeClass('hide');
				$('#SPLoginOnBehalfLink a').removeClass('hide');
				$('#SPQueryLink a').removeClass('hide');
				$('#SPTaskLink a').removeClass('hide');
				$('#SPChatLink a').removeClass('hide');
				//$('#SPSubxLink a').removeClass('hide');
				$('#SPMovePartnerLink a').removeClass('hide');
				
			
			$( ".action_dialog" ).removeClass('hide').dialog({
				resizable: false,
				modal: true,
                width: "auto",
			});
		}
		}
    jQuery(function($) {
        	$("#search").keyup(function(event) {
				if (event.keyCode == 13) {
					oppsearch();
				}
			}); 
        $( ".action" ).on('click', function(e) {
					e.preventDefault();
				
					$( ".action_dialog" ).removeClass('hide').dialog({
						resizable: false,
						modal: true,
                        width: "auto",
					});
				});
				
		$( ".progress").on('click', function(e) {
			e.preventDefault();
		
			$( ".progress_dialog" ).removeClass('hide').dialog({
				resizable: false,
				modal: true,
				width: "auto",
                      
			});
		});
     });	
    
    
    function savePing(d){
		//alert('HIIEE')
		  var response=true;
// 		$.mask.definitions['~']='[+-]';
//     $('#contactMobile').mask('(999) 999-9999');
   
    jQuery.validator.addMethod("phone", function (value, element) {
     return this.optional(element) || /^\(\d{3}\) \d{3}\-\d{4}( x\d{1,6})?$/.test(value);
    }, "Enter a valid Mobile number.");
    
    jQuery.validator.addMethod("pst", function (value, element) {
    	//alert($('#pstSn').val() );
    	return response = ( $('#pstSn').val() == '0' ) ? false: true ;
       }, "PST is required ");
       
    jQuery.validator.addMethod("laxEmail", function(value, element) {
    	  // allow any non-whitespace characters as the host part
    	  return this.optional( element ) || /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]@(?:\S{1,63})$/.test( value );
    	}, 'Please enter a valid email address.');
   
  
    jQuery.validator.addMethod("myarn", function (value, element) {
				if($('#ARN').val()==""){}else{var arn = $('#ARN').val();}
				if($('#eARN').val()==""){}else{var arn = $('#eARN').val();}
				
					$.ajax({     
				     type: "POST",
				     url : $('#contextPath').val() +"/partnersp/getUniqueArn.htm?arn="+arn,  
				     dataType: 'json', 
				     contentType: 'application/json',     
				        success:function(result) {
				                 response = ( result != '' ) ? false: true ;
				   
				     }
				
			  });   
	return response;
    }, "");
    
    
    
    
    
		var validator=$('#autopingForm').validate({
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
			
			firstName: {
				required: true
			},
			lastName: {
				required: true
			},
			loginName:{
				required: true
			},
			communicationEmailId: {// communicationEmailId  contactEmail  contactMobile ARN  pstSn
				required: true
				
			},
			contactEmail:{
				required: true,
				email : true
			},
			contactMobile:{
				required:true,
				number:true,
				minlength:10
			},
			ARN:{
				required: true,
				myarn:true
			},
			pstSn:{
				required: true,
				pst:true
			}
		},

		messages: {
			communicationEmailId: {
				required: "Please provide a communication email."
					//laxEmail: "Please provide a valid communication email."
			},
			contactEmail: {
				required: "Please provide a valid contact email.",
				email: "Please provide a valid communication email.",
				minlength: "Please provide a valid contact email."
			},
			contactMobile: {
				required:"Contact Mobile is required",
				number:"Please provide a valid contact Moblie no.",
				minlength: "Please provide a valid contact no."
				
			},
			ARN:{
				required:"ARN No. is required",
				myarn:"ARN already exist."
				},
			firstName: "First name is required",
			lastName: "Last name is required",
			loginName: "Login name is required",
			pstSn:"PST name is required"
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
				
				//alert('FORM  Validated');
			if(d==0){
				addPartner(0);
			}else
				addPartner(1);
			}
		},
		invalidHandler: function (form) {
			
		}
	});
}

</script>


<div class="common_dialog hide action_dialog">
  <table id="" class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0">
    <tbody>
      <tr id="">
        <th class="thead">Action List</th>
       
      </tr>
      <tr id="SPPartnerDashboardLink">
        <td id="SPPartnerDashboardLink"><i class="fa fa-windows"></i> <a onclick=""><span style="cursor:pointer">Partner Dashboard</span></a></td>
        
      </tr>
      <tr id="SPOpportunityListLink">
        <td id="SPOpportunityListLink"><i class="fa fa-bell-o"></i> <a onclick=""> <span style="cursor:pointer">Opportunity List</span></a></td>
      </tr>
      <tr id="SPClientListLink">
        <td id="SPClientListLink"><i class="fa fa-slideshare"></i> <a onclick=""><span style="cursor:pointer">Client List</span></a></td>
      </tr>
      <tr id="SPServiceTeamAllocationLink">
        <td id="SPServiceTeamAllocationLink"><i class="fa fa-question-circle"></i> <a onclick=""><span style="cursor:pointer">Service Team Allocation</span></a></td>
      </tr>
      <tr id="SPAssignEmailAccountLink">
        <td id="SPAssignEmailAccountLink"><i class="fa fa-tags"></i> <a onclick=""><span style="cursor:pointer">Assign Email Account</span></a></td>
      </tr>
      <tr id="SPOnboardingChecklistLink">
        <td id="SPOnboardingChecklistLink"><i class="fa fa-square-o"></i> <a onclick=""><span style="cursor:pointer">OnboardingChecklist</span></a></td>
      </tr>
      <tr id="SPViewLoginDetailsLink">
        <td id="SPViewLoginDetailsLink"><i class="fa fa-line-chart"></i> <a onclick=""><span style="cursor:pointer">View Login Details</span></a></td>
      </tr>
      
      <tr id="SPQueryLink">
        <td id="SPQueryLink"><i class="fa fa-exchange"></i> <a onclick=""><span style="cursor:pointer">Query </span></a></td>
       
      </tr>
      <tr id="SPTaskLink">
        <td id="SPTaskLink"><i class="fa fa-envelope"></i> <a onclick=""><span style="cursor:pointer">Task</span></a></td>
     
      </tr>
      <tr id="SPChatLink">
        <td id="SPChatLink"><i class="fa fa-wechat"></i> <a onclick=""><span style="cursor:pointer">Chat</span></a></td>
      </tr>

      <tr id="SPMovePartnerLink">
       	<td id="SPMovePartnerLink"><i class="fa fa-database"></i> <a ><span style="cursor:pointer">Change BU</span></a></td>
    </tr>
    </tbody>
  </table>
</div>
</body>
<!-- </form> -->
</html>
